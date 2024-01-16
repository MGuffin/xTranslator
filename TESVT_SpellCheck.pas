{
  Fallout4translator - TESVTranslator - sseTranslator  by McGuffin  mguffin[arobase]gmail.com
  main distribution here:  http://www.nexusmods.com/skyrimspecialedition/mods/134?

  The contents of this file are subject to the Mozilla Public License
  Version 1.1 (the "License"); you may not use this file except in
  compliance with the License. You may obtain a copy of the License at
  http://www.mozilla.org/MPL/

  Software distributed under the License is distributed on an "AS IS"
  basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See the
  License for the specific language governing rights and limitations
  under the License.


  Note on extra Components used by this Tool:
  -SynEdit: https://github.com/SynEdit/SynEdit
  -VirtualStringTree: written by Mike Lischke (www.soft-gems.net).
  -Diff: Search Heuristic compare is using the Diff Unit http://www.angusj.com/delphi/textdiff.html credit to Angus Johnson
  -HtmlViewer: https://github.com/BerndGabriel/HtmlViewer
  -ZLibex: 1.2.3 http://www.dellapasqua.com and xEdit https://github.com/TES5Edit
  -LZ4 https://github.com/atelierw/LZ4Delphi and xEdit https://github.com/TES5Edit
  -Part of the code for Bsa/ba2/Stream loading from xEdit  https://github.com/TES5Edit
  -OmniXML: https://github.com/mremec/omnixml
  -PCRE Regex library: http://www.regular-expressions.info/delphi.html (unicode version)
  -Hunspell Module is distributed under the Mozilla Public License Version 1.1 https://github.com/hunspell/hunspell/releases
  -xmw to wav converter: xWMAEncode.exe from directX SDK/microsoft

  ==============================================================

  SpellCheck use:
  MSWORD api (oleAutomation)  if installed on the system
  or
  Hunspell library: https://github.com/hunspell/hunspell/releases with OpenOffice/Mozilla dictionaries

}
unit TESVT_SpellCheck;

interface

uses Windows, Messages, SysUtils, Classes, Controls, Forms, Graphics, math, Dialogs, Menus, ComCtrls, ComObj, TESVT_Const, Generics.Collections, LibHunspell;

type

  spParseOpt = (spParseIgnoreFirstUpper, spParseIgnoreMultiUpper, spParseIgnoreAlias);
  spParseOpts = set of spParseOpt;

  TscWord = class
  private
    fWord: string;
    procedure setsWord(s: string);
  public
    hash: Cardinal;
    startPos, endPos: integer;
    sSize: tSize;
    deleteMe, isFault, sSizeSet: boolean;
    opentag: integer;
    property sWord: string read fWord write setsWord;
    constructor initdata(s: string; sp, tag: integer; sl, b: boolean; spOpts: spParseOpts);
  end;

  TSpellCheck = class(TObject)
  private
    MsWordApp, MsSuggestions: OleVariant;
    Hunspell: THunspellChecker;
    fActive: boolean;
    spCache: tlist<Cardinal>;
    spCacheFault: tlist<Cardinal>;
    spDictList: tstringlist;
    spIgnoreList: tstringlist;
    function CreateHunspell(dic: string = ''): boolean;
    function CreateMSWord: boolean;
    procedure saveIgnoreList;
    procedure LoadIgnoreList;
    procedure AddIgnoreListToCacheList;
    procedure AddWordToCacheList(word: string);
  public
    spWords: tlist;
    spellCheckType: integer; // 0: MSWord, 1:Hunspell
    spSuggestionList: tstringlist;
    parseOptions: spParseOpts;
    bFaultRatioLock: boolean;
    constructor Create(SPType: integer; b: boolean; iPOpt: byte; dic: string = '');
    destructor Destroy; override;
    property Active: boolean read fActive;
    function CheckSpellingSimple(StrWord: string): boolean;
    function CheckSpelling(StrWord: string; Suggestions: TStrings): boolean;
    function CheckSpellingMSWord(StrWord: string; Suggestions: TStrings): boolean;
    function CheckSpellingSimpleMSWord(StrWord: string): boolean;
    function GetDict(Path: String; FDictList: TStrings): boolean;
    procedure clearWordsList;
    procedure SplitTextIntoWords(const s: string);
    function isWordInCache(word: string): boolean;
    procedure update(SPType: integer; b: boolean; dic: string = '');
    procedure AddWordToIgnoreList(word: string);
    function analyzeText(text: string; doIdle: boolean = true): boolean;
    function getWordFromCharIndex(charIndex: integer): TscWord;
    procedure reset;
  end;

var
  spCheck: TSpellCheck;

implementation

function TSpellCheck.GetDict(Path: String; FDictList: TStrings): boolean;
var
  i: integer;
begin
  for i:= 0 to pred(spDictList.count) do
    FDictList.add(extractFileName(spDictList[i]));
  result:= FDictList.count > 0;
end;

constructor TscWord.initdata(s: string; sp, tag: integer; sl, b: boolean; spOpts: spParseOpts);
var
  i, newStartPos, newEndPos: integer;
begin
  startPos:= sp - 1;
  opentag:= tag;
  isFault:= b;
  sSizeSet:= false;

  // clean Word:
  newStartPos:= 1;
  newEndPos:= length(s);
  // cleanup Cut hyphen at start or end of a word
  for i:= 1 to length(s) do
    if isChar_WordDelimitersSPAcceptedInside(s[i]) then
      inc(newStartPos)
    else
      break;
  for i:= length(s) downTo 1 do
    if isChar_WordDelimitersSPAcceptedInside(s[i]) then
      dec(newEndPos)
    else
      break;
  // cleanup apostrophe when charPos = 2 only
  if (length(s) > (newStartPos + 1)) and isChar_WordDelimitersSPAcceptedInside(s[newStartPos + 1]) then
    inc(newStartPos, 2);
  // word cleaned
  sWord:= copy(s, newStartPos, newEndPos - (newStartPos - 1));
  // prepare deletion for special case
  deleteMe:= (length(sWord) < 2);
  // checkUppercase en debut de ligne (ignore)
  deleteMe:= deleteMe or ((spParseIgnoreFirstUpper in spOpts) and (not sl) and (length(sWord) > 1) and (sWord[1] = ansiupperCase(sWord[1])));
  // check for more uppercase
  for i:= 2 to length(sWord) do
  begin
    if deleteMe then
      break;
    deleteMe:= deleteMe or ((spParseIgnoreMultiUpper in spOpts) and (not isChar_WordDelimitersSPAcceptedInside(sWord[i]) and (sWord[i] = ansiupperCase(sWord[i]))));
  end;
  // checkfor Number
  for i:= 1 to length(sWord) do
  begin
    if deleteMe then
      break;
    deleteMe:= deleteMe or charInSet(sWord[i], ['0' .. '9']);
  end;
  // define new pos in string
  startPos:= startPos + (newStartPos - 1);
  endPos:= startPos + length(sWord);
end;

procedure TscWord.setsWord(s: string);
begin
  fWord:= s;
  hash:= stringHash(s);
end;

constructor TSpellCheck.Create(SPType: integer; b: boolean; iPOpt: byte; dic: string = '');
begin
  parseOptions:= spParseOpts(iPOpt);
  spDictList:= tstringlist.Create;
  spIgnoreList:= tstringlist.Create;
  spWords:= tlist.Create;
  spCache:= tlist<Cardinal>.Create;
  spCacheFault:= tlist<Cardinal>.Create;
  spSuggestionList:= tstringlist.Create;
  LoadIgnoreList;
  FindDictEx(mainpath + SPELL_CHECK_DICPATH, spDictList);
  update(SPType, b, dic);
end;

destructor TSpellCheck.Destroy;
begin
  clearWordsList;
  spDictList.free;
  saveIgnoreList;
  spIgnoreList.free;
  spCache.free;
  spCacheFault.free;
  spWords.free;
  spSuggestionList.free;
  reset;
  inherited Destroy;
end;

procedure TSpellCheck.LoadIgnoreList;
begin
  if not FileExists(mainpath + SPELL_CHECK_PATH + SPELL_CHECK_IGNORELIST) then
    exit;
  try
    spIgnoreList.LoadFromFile(mainpath + SPELL_CHECK_PATH + SPELL_CHECK_IGNORELIST, TEncoding.UTF8);
  except
    on E: Exception do
    begin
      spIgnoreList.clear;
      doFeedback(E.Message, false);
    end;
  end;
end;

procedure TSpellCheck.saveIgnoreList;
begin
  if spIgnoreList.count = 0 then
    exit;
  try
    ForceDirectories(mainpath + SPELL_CHECK_PATH);
    spIgnoreList.SaveToFile(mainpath + SPELL_CHECK_PATH + SPELL_CHECK_IGNORELIST, TEncoding.UTF8);
  except
    on E: Exception do
      doFeedback(E.Message, false);
  end;
end;

procedure TSpellCheck.AddIgnoreListToCacheList;
var
  i: integer;
begin
  for i:= 0 to pred(spIgnoreList.count) do
    AddWordToCacheList(spIgnoreList[i]);
end;

procedure TSpellCheck.AddWordToCacheList(word: string);
var
  hash: Cardinal;
  index: integer;
begin
  hash:= stringHash(word);
  if not spCache.BinarySearch(hash, index) then
    spCache.insert(index, hash);
end;

procedure TSpellCheck.AddWordToIgnoreList(word: string);
begin
  spIgnoreList.add(word);
  AddWordToCacheList(word);
end;

procedure TSpellCheck.reset;
begin
  if spellCheckType = 1 then
    freeandNil(Hunspell)
  else
  begin
    if fActive then
      MsWordApp.Quit;
    MsWordApp:= VarNull;
  end;
  fActive:= false;
end;

procedure TSpellCheck.update(SPType: integer; b: boolean; dic: string = '');
begin
  spellCheckType:= SPType;
  spCache.clear;
  spCacheFault.clear;
  if b then
    if spellCheckType = 1 then
      fActive:= CreateHunspell(dic)
    else
      fActive:= CreateMSWord;
  if fActive then
    AddIgnoreListToCacheList;
end;

function TSpellCheck.CreateHunspell(dic: string = ''): boolean;
begin
  result:= false;
  if spDictList.count = 0 then
    exit;
  try
    Hunspell:= THunspellChecker.Create(HUNSPELLDLL);
    if dic = '' then
      dic:= extractFileName(spDictList[0]);
    result:= Hunspell.Initialize(mainpath + SPELL_CHECK_DICPATH + ChangeFileExt(dic, '.aff'), mainpath + SPELL_CHECK_DICPATH + dic);
    sUseSpellCheckDic:= dic;
  except
    on E: Exception do
      doFeedback('Cannot Connect to Hunspell', false);
  end;
end;

function TSpellCheck.CreateMSWord: boolean;
begin
  result:= false;
  try
    MsWordApp:= CreateOleObject('Word.Application');
    MsWordApp.Documents.add;
    result:= true;
  except
    on E: Exception do
    begin
      doFeedback('Cannot Connect to MSWord', false);
    end;
  end;
end;

procedure TSpellCheck.clearWordsList;
var
  i: integer;
begin
  for i:= 0 to spWords.count - 1 do
    TscWord(spWords[i]).free;
  spWords.clear;
end;

function TSpellCheck.CheckSpelling(StrWord: string; Suggestions: TStrings): boolean;
begin
  Suggestions.clear;
  if fActive then
  begin
    if spellCheckType = 1 then
      result:= Hunspell.Suggest(StrWord, Suggestions) = 0
    else
      result:= CheckSpellingMSWord(StrWord, Suggestions);
  end
  else
    result:= true;
end;

function TSpellCheck.CheckSpellingMSWord(StrWord: string; Suggestions: TStrings): boolean;
var
  i: integer;
begin
  Suggestions.clear;
  if fActive then
  begin
    MsSuggestions:= MsWordApp.GetSpellingSuggestions(StrWord);
    for i:= 1 to MsSuggestions.count do
      Suggestions.add(MsSuggestions.Item(i));
    MsSuggestions:= VarNull;
  end;
  result:= Suggestions.count = 0;
end;

function TSpellCheck.CheckSpellingSimple(StrWord: string): boolean;
begin
  if fActive then
  begin
    if length(StrWord) = 1 then
      exit(true); // skip string of 1 char
    if spellCheckType = 1 then
      result:= Hunspell.Spell(StrWord)
    else
      result:= CheckSpellingSimpleMSWord(StrWord);
  end
  else
    result:= true;
end;

function TSpellCheck.CheckSpellingSimpleMSWord(StrWord: string): boolean;
var
  Retvar: boolean;
begin
  Retvar:= false;
  if fActive then
  begin
    if MsWordApp.CheckSpelling(StrWord) then
      Retvar:= true
  end;
  result:= Retvar;
end;

procedure TSpellCheck.SplitTextIntoWords(const s: string);
var
  startPos, endPos, opentag, i: integer;
  bOpenTag, bStartLine: boolean;
begin
  clearWordsList;
  startPos:= 1;
  opentag:= 0;
  bOpenTag:= false;
  bStartLine:= true;
  while startPos <= length(s) do
  begin
    while (startPos <= length(s)) and isChar_WordDelimiter(s[startPos]) do // charInSet(S[startpos], cWordDelimiters+ cWordDelimitersSP) do
    begin
      // --skip all stuff between <  >
      if (s[startPos] = '<') and not bOpenTag then
      begin
        inc(opentag);
        bOpenTag:= true;
      end;
      if (s[startPos] = '>') and bOpenTag then
        bOpenTag:= false;
      if isChar_WordDelimitersEndLine(s[startPos]) then
        bStartLine:= true;
      inc(startPos);
    end;

    if startPos <= length(s) then
    begin
      endPos:= startPos + 1;
      while (endPos <= length(s)) and (not isChar_WordDelimiter(s[endPos])) do
        inc(endPos);
      spWords.add(TscWord.initdata(copy(s, startPos, endPos - startPos), startPos, ifthen(bOpenTag, opentag, 0), bStartLine, false, parseOptions));
      bStartLine:= false;
      startPos:= endPos; // + 1;
    end;
  end;

  // cleanUp: if bOpenTag then last tag is only opened

  if spParseIgnoreAlias in parseOptions then
  begin
    if bOpenTag then
      dec(opentag);
  end
  else
    opentag:= 0;

  // cleanup list for word in opentag (or empty)
  for i:= pred(spWords.count) downto 0 do
    if (TscWord(spWords[i]).deleteMe) or // delete word with uppercase in middle of a sentence
      ((TscWord(spWords[i]).opentag > 0) and (TscWord(spWords[i]).opentag <= opentag)) // delete word inside <>
    then
    begin
      TscWord(spWords[i]).free;
      spWords.delete(i);
    end;
end;

function TSpellCheck.isWordInCache(word: string): boolean;
var
  index: integer;
begin
  result:= spCache.BinarySearch(stringHash(word), index);
end;

function TSpellCheck.analyzeText(text: string; doIdle: boolean = true): boolean;
var
  i, index, indexFault: integer;
  scw: TscWord;
  cleanWord: boolean;
  iFaultRatioBase, iFaultRatio: integer;
begin
  // cache correct words in spCache, and faulty words in spCache Fault to avoid redundant spellcheck call
  result:= false;
  SplitTextIntoWords(text);
  iFaultRatioBase:= spWords.count;
  for i:= spWords.count - 1 downto 0 do
  begin
    scw:= spWords[i];
    cleanWord:= spCache.BinarySearch(scw.hash, index);
    if not cleanWord then
    begin
      if spCacheFault.BinarySearch(scw.hash, indexFault) then
        scw.isFault:= true
      else if not CheckSpellingSimple(scw.sWord) then
      begin
        scw.isFault:= true;
        spCacheFault.insert(indexFault, scw.hash);
      end;
      if scw.isFault then
        result:= true
      else
      begin
        spCache.insert(index, scw.hash);
        cleanWord:= true;
      end
    end;

    if cleanWord then
    begin
      scw.free;
      spWords.delete(i);
    end;
    if doIdle and (i mod 50 = 0) then
      application.processmessages;
  end;

  iFaultRatio:= spWords.count;
  bFaultRatioLock:= (iFaultRatio > maxSpCheckUnderline) and ((divide(iFaultRatio, iFaultRatioBase) * 100) > maxSpCheckUnderlineRatio);
end;

function TSpellCheck.getWordFromCharIndex(charIndex: integer): TscWord;
var
  i: integer;
begin
  result:= nil;
  for i:= 0 to pred(spWords.count) do
    if inrange(charIndex, TscWord(spWords[i]).startPos, TscWord(spWords[i]).endPos) then
      exit(spWords[i]);
end;

end.
