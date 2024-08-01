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
}
unit TESVT_TranslateFunc;

interface

uses Windows, SysUtils, Classes, forms, math, TESVT_Threads, TESVT_Const, TESVT_Typedef, TESVT_espDefinition, TESVT_HeuristicSearch,
  TESVT_Ressources, TESVT_FastSearch, Generics.Collections, TESVT_fstreamSave, TESVT_Undo, VirtualTrees, SyncObjs, regularexpressions, TESVT_RegexUtils,
  TESVT_Utils, System.Character, ArabicShaper;

Type
  rCharMapTCSC = record
    sc: char;
    tc: char;
  end;

  pCharMapTCSC = ^rCharMapTCSC;

function compareCharCodeTC(p1, p2: pointer): integer;
function compareCharCodeSC(p1, p2: pointer): integer;
procedure clearTCSCList(l: tlist);
function buildTCSCList(l: tlist; scstr, tcstr: string): boolean;
procedure doConvertTCSC(listArray: talist; mode: boolean; l: tlist);

function findStrMatchEx(vlist, dlist: tlist; fProc: tCompareProc; validatedTrans: sStrParams; bResetTrans, forceAutoTranslate, bskipSametest, bSkipTranslated, bVmad: boolean): integer;
function findEdidMatchEx(edidList, dlist: tlist; fProc: tCompareProc; proc: TListSortCompare; resetState: boolean; appliedTrans: sStrParams; validatedTrans: sStrParams;
  bApplytag, bTagOnly, bVmad, bApplyStringID: boolean): integer;
procedure generateHeuristicList;
Procedure ClearHeuristicList;
procedure doFindHeuristicFocus(LDTree: TVirtualStringTree; bUseRef: boolean);
function getWordsMatchHash(sk1, sk2: tSkyStr; var ldOut: single; var bBreak: boolean): boolean;
procedure generateDerivedStringData(bforceDerived: boolean = false);
procedure generateOneWordList;

function addRTLTag(const RTLString: string): string;
function ReverseRTLString(const Str: string; index, linesize: integer; bResize, bRemovetag: boolean): string;
function ReverseRTLStringEx(const Str: string; var bIsArabic: boolean; index: integer): string;

var
  HeuristicList: tlist;
  derivedParseList: tstringList;

implementation

function addRTLTag(const RTLString: string): string;
begin
  Result := WideChar(UCODE_START_RTL) + RTLString;
end;

function ConvertRTLToLTR(const s: string): string;
begin
  Result := UCODE_RLE + s + UCODE_PDF;
end;

function IsUnicodeControleChar(ch: char): boolean;
begin
  Result := ((ch >= #$0000) and (ch <= #$001F)) or //
    ((ch >= #$007F) and (ch <= #$009F)) or //
    ((ch >= #$202A) and (ch <= #$202E)) or //
    ((ch >= #$2060) and (ch <= #$206F)) or //
    (ch = #$200E) or (ch = #$200F);
end;

function RemoveUnicodeControlChars(const s: string): string;
var
  i: integer;
  output: string;
begin
  output := '';
  for i := 1 to Length(s) do
  begin
    if not IsUnicodeControleChar(s[i]) then
      output := output + s[i];
  end;
  Result := output;
end;

function IsArabicLetter(ch: char): boolean;
begin
  Result := ((ch >= #$0600) and (ch <= #$06FF)) or //
    ((ch >= #$0750) and (ch <= #$077F)) or //
    ((ch >= #$FB50) and (ch <= #$FDFF)) or //
    ((ch >= #$FE70) and (ch <= #$FEFF));
end;

function MirrorSymbol(ch: char): char;
begin
  case ch of
    '(': Result := ')';
    ')': Result := '(';
    '{': Result := '}';
    '}': Result := '{';
    '[': Result := ']';
    ']': Result := '[';
    // '<': Result := '>';  //exclude Alias/tag for bethesda games
    // '>': Result := '<';
    '«': Result := '»';
    '»': Result := '«';
  else
    Result := ch;
  end;
end;

procedure MirrorSymbols(var text: string);
var
  i: integer;
begin
  for i := 1 to Length(text) do
    text[i] := MirrorSymbol(text[i]);
end;

function ReverseRTLString(const Str: string; index, linesize: integer; bResize, bRemovetag: boolean): string;
var
  lString, lReverted, lOut: tstringList;
  i, j: integer;
  bIsArabic: boolean;
begin
  lString := tstringList.Create;
  lReverted := tstringList.Create;
  lOut := tstringList.Create;
  lString.text := Str;

  bIsArabic := false;
  for j := 0 to lString.count - 1 do
  begin
    if bRemovetag then
      lReverted.text := ReverseRTLStringEx(RemoveUnicodeControlChars(lString[j]), bIsArabic, index)
    else
      lReverted.text := ReverseRTLStringEx(lString[j], bIsArabic, index);
    if bResize then
      WrapStringList(lReverted, linesize);
    for i := 0 to lReverted.count - 1 do
      lOut.add(lReverted[i]);
  end;

  if bIsArabic then
  begin
    Result := lOut.text;
    Result := Result.TrimRight([#10, #13]);
  end
  else
    Result := Str;

  lString.Free;
  lReverted.Free;
  lOut.Free;
end;

procedure splitBlock(const Str: string; l: tstringList);
var
  block: string;
  i: integer;
  iType, iTypePred: integer; // 0 notdefined, 1: white, 2 arabic, 3 not arabic

  function getIType(ch: char): integer;
  begin
    if getcharinArray(ch, aWhiteChar) then
      Result := 1
    else if getcharinArray(ch, aSymbols) then
      Result := 2
    else if IsArabicLetter(ch) then
      Result := 3
    else
      Result := 4;
  end;

begin
  if Str = '' then
    exit;
  iType := getIType(Str[1]);
  iTypePred := iType;
  block := Str[1];
  for i := 2 to Length(Str) do
  begin
    iType := getIType(Str[i]);
    // confirm whitechar
    if iType = 1 then
    begin
      if not(IsArabicLetter(Str[i - 1]) or ((i + 1 <= Length(Str)) and IsArabicLetter(Str[i + 1]))) then
        iType := 4;
    end;

    if iTypePred <> iType then
    begin
      l.add(block);
      block := '';
    end;
    iTypePred := iType;
    block := block + Str[i];
  end;
  l.add(block);
end;

function ReverseRTLStringEx(const Str: string; var bIsArabic: boolean; index: integer): string;
var
  i, j: integer;
  CurrentSegment, tmpstr: string;
  Segments: tstringList;
const
  maxSegment = 5;
begin
  Result := '';
  if Str = '' then
    exit;

  Segments := tstringList.Create;

  try
    if index = 1 then
      tmpstr := Shape(Str)
    else if index = 2 then
      tmpstr := deshape(Str)
    else
      tmpstr := Str;

    splitBlock(tmpstr, Segments);

    for i := Segments.count - 1 downto 0 do
    begin
      CurrentSegment := Segments[i];
      if IsArabicLetter(CurrentSegment[1]) then
      begin
        bIsArabic := true;
        for j := Length(CurrentSegment) downto 1 do
          Result := Result + CurrentSegment[j];
      end
      else
      begin
        MirrorSymbols(CurrentSegment);
        Result := Result + CurrentSegment;
      end;
    end;

  finally
    Segments.Free;
  end;
end;

// -TC->SC

function compareCharCodeSC(p1, p2: pointer): integer;
begin
  Result := Ord(pCharMapTCSC(p1).sc) - Ord(pCharMapTCSC(p2).sc);
end;

function compareCharCodeTC(p1, p2: pointer): integer;
begin
  Result := Ord(pCharMapTCSC(p1).tc) - Ord(pCharMapTCSC(p2).tc);
end;

// build list
function buildTCSCList(l: tlist; scstr, tcstr: string): boolean;
var
  i: integer;
  p: pCharMapTCSC;
begin
  if Length(scstr) <> Length(tcstr) then
    exit(false);
  for i := 0 to Length(scstr) do
  begin
    new(p);
    p.sc := scstr[i];
    p.tc := tcstr[i];
    l.add(p);
  end;
  Result := true;
  // l.Sort(compareCharCodeSC);
end;

procedure clearTCSCList(l: tlist);
var
  i: integer;
begin
  for i := l.count - 1 downto 0 do
    dispose(pCharMapTCSC(l[i]));
end;

procedure doConvertTCSC(listArray: talist; mode: boolean; l: tlist);
var
  newindex: integer;
  i, j, k: integer;
  tmpstr1: string;
  p: pCharMapTCSC;
begin
  // true= TC->SC
  pbar := 0;
  new(p);
  try
    if mode = true then
    begin
      l.Sort(compareCharCodeTC);
      for k := 0 to 2 do
        for i := 0 to listArray[k].count - 1 do
        begin
          if tSkyStr(listArray[k][i]).lockedStatus then
            continue;
          tmpstr1 := tSkyStr(listArray[k][i]).sTrans;
          if Length(tmpstr1) > 0 then
            for j := 0 to Length(tmpstr1) do
            begin
              p.tc := tmpstr1[j];
              if FastListSearch(l, compareCharCodeTC, p, newindex, false) then
                tmpstr1[j] := pCharMapTCSC(l[newindex]).sc;
            end;
          UpdatePBar(1000);
          tSkyStr(listArray[k][i]).sTrans := tmpstr1;
        end;
    end
    else
    begin
      l.Sort(compareCharCodeSC);
      for k := 0 to 2 do
        for i := 0 to listArray[k].count - 1 do
        begin
          if tSkyStr(listArray[k][i]).lockedStatus then
            continue;
          tmpstr1 := tSkyStr(listArray[k][i]).sTrans;
          if Length(tmpstr1) > 0 then
            for j := 0 to Length(tmpstr1) do
            begin
              p.sc := tmpstr1[j];
              if FastListSearch(l, compareCharCodeSC, p, newindex, false) then
                tmpstr1[j] := pCharMapTCSC(l[newindex]).tc;
            end;
          UpdatePBar(1000);
          tSkyStr(listArray[k][i]).sTrans := tmpstr1;
        end;
    end;
  finally
    dispose(p);
  end;
end;

// --------------------

function WordsDistance(l1, l2: tlist<cardinal>): integer;
var
  d: array of array of integer;
  len1, len2, i, j, cost: integer;
begin
  len1 := l1.count;
  len2 := l2.count;
  SetLength(d, len1 + 1, len2 + 1);
  for i := 0 to len1 do
    d[i, 0] := i;
  for j := 0 to len2 do
    d[0, j] := j;

  for i := 1 to len1 do
    for j := 1 to len2 do
    begin
      if l1[i - 1] = l2[j - 1] then
        cost := 0
      else
        cost := 1;
      d[i, j] := min(min(d[i - 1, j] + 1, d[i, j - 1] + 1), d[i - 1, j - 1] + cost);
    end;
  Result := d[len1, len2];
end;

function DerivedMatch(RegEx: TRegEx; const s, pattern: string; sOut: tstringList; var bBreak: boolean): boolean;
var
  i: integer;
  m: tmatch;
begin
  sOut.clear;
  Result := false;
  if Length(s) = 0 then
    exit;
  try
    m := RegEx.Match(s);
    if m.success then
    begin
      for i := 1 to m.Groups.count - 1 do
        sOut.add(m.Groups[i].value);
      Result := true;
    end;
  except
    doFeedBack(formatRes('ErrorRegex%s', [pattern]));
    bBreak := true;
  end;
end;

procedure generateDerivedLine(pattern: string; tmpList: tlist; matchList1, matchList2: tstringList);
var
  RegEx: TRegEx;
  i, k: integer;
  sk: tSkyStr;
  s1, s2: string;
  bBreak: boolean;
begin
  bBreak := false;
  try
    RegEx := TRegEx.Create(pattern, [roIgnoreCase]);
  except
    doFeedBack(formatRes('ErrorRegex%s', [pattern]));
    exit;
  end;

  for i := 0 to pred(vocabBaseList.count) do
  begin
    UpdatePBar(1000);
    if CancelStuff then
      break;
    sk := vocabBaseList[i];
    if sk.sInternalparams * [derivedComputed] = [] then
    begin
      // Basic Selection
      if not inrange(Length(sk.s), 2, StrictStringDataLimit) then
        continue;
      if not inrange(Length(sk.sTrans), 2, StrictStringDataLimit) then
        continue;
      if DerivedMatch(RegEx, sk.s, pattern, matchList1, bBreak) and DerivedMatch(RegEx, sk.sTrans, pattern, matchList2, bBreak) and (matchList1.count = matchList2.count) then
      begin
        for k := 0 to pred(matchList1.count) do
        begin
          s1 := TrimExtended(matchList1[k], sBlank);
          s2 := TrimExtended(matchList2[k], sBlank);
          if bDerivedverbose then
            doFeedBack(format('[%s][%s] --> [%s][%s]', [sk.s, sk.sTrans, s1, s2]));
          if (s1 <> '') and (s2 <> '') then
            tmpList.add(tSkyStr.init(0, 0, s1, s2, sk.listIndex, 0, [], [isCache, derivedComputed], nil, false));
        end;
      end;
    end;
    if bBreak then
      exit;
  end;
end;

procedure generateDerivedStringData(bforceDerived: boolean = false);
var
  i, j, index, c, count: integer;
  sk: tSkyStr;
  tmpList: tlist;
  matchList1, matchList2: tstringList;
begin
  if (not bEnableDerived) and (not bforceDerived) then
    exit;
  tmpList := tlist.Create;
  CancelStuff := false;
  // count nb valid derivedParseList line
  c := 0;
  for j := 0 to pred(derivedParseList.count) do
  begin
    if is_comment(derivedParseList[j]) then
      continue;
    inc(c);
  end;

  ProgressBar.Max := vocabBaseList.count * c;
  pbar := 0;
  UpdateStatus(getres('DerivedStringsGen'));
  matchList1 := tstringList.Create;
  matchList2 := tstringList.Create;

  // RegEx.Options := RegEx.Options + [preCaseLess];
  try
    for j := 0 to pred(derivedParseList.count) do
    begin
      if is_comment(derivedParseList[j]) then
        continue;
      generateDerivedLine(derivedParseList[j], tmpList, matchList1, matchList2);
    end;
  finally
    matchList1.Free;
    matchList2.Free;
  end;
  // dispatch on regular string
  count := 0;
  doFeedBack(formatRes('DerivedStrings%d', [tmpList.count]));
  for i := pred(tmpList.count) downto 0 do
  begin
    UpdatePBar(100);
    sk := tmpList[i];
    if not addPointertoSortedList(vocabBaseList, compareallHashesAndSources, sk, index) then
      sk.Free
    else
      inc(count);
  end;
  ProgressBar.position := ProgressBar.Max;
  doFeedBack(formatRes('DerivedStringsKept%d', [count]));
  UpdateStatus('');
  tmpList.Free;
end;

procedure generateOneWordList;
var
  i: integer;
begin
  onewordList.clear;
  for i := 0 to vocabBaseList.count - 1 do
    if isOneWord in tSkyStr(vocabBaseList[i]).sInternalparams then
      forcedPointertoSortedList(onewordList, compareHashTrans, vocabBaseList[i]);
  doFeedBack('OneWords: ' + IntToStr(onewordList.count));
end;

procedure generateHeuristicList;
var
  i: integer;
begin
  canCloseProg := false;
  // need loop because the string are initialized in a Thread
  while not bHeuristicListValidated do
  begin
    Lock.Acquire;
    UpdateStatus(getres('Cache_Heuristic'));
    HeuristicList.clear;
    ProgressBar.Max := vocabBaseList.count;
    pbar := 0;
    for i := 0 to pred(vocabBaseList.count) do
    begin
      tSkyStr(vocabBaseList[i]).initStrings(false);
      if tSkyStr(vocabBaseList[i]).awords.count > 0 then
        HeuristicList.add(vocabBaseList[i]);
      UpdatePBar(1000);
    end;
    idleVocabCounter := vocabBaseList.count;
    HeuristicList.Sort(compareWordCount);
    bHeuristicListValidated := true;
    UpdateStatus(sOldStatus);
    Lock.release;
    application.processmessages;
  end;
  canCloseProg := true;
end;

Procedure ClearHeuristicList;
begin
  bHeuristicListValidated := false;
  HeuristicList.clear;
end;

function getSubTringThresholdInc(l: integer): integer;
begin
  case l of
    0 .. 3: Result := 0;
    4 .. 5: Result := 1;
    6 .. 8: Result := 2;
    9 .. 12: Result := 3;
  else Result := 4;
  end;
end;

function getSubTringThresholdDec(l: integer): integer;
begin
  case l of
    0 .. 4: Result := 0;
    5 .. 6: Result := 1;
    7 .. 8: Result := 2;
  else Result := 3;
  end;
end;

function getSubStringMatch(sk1, sk2: tSkyStr; var ldOut: single): boolean;
var
  sSize, lSize: integer;
begin
  Result := false;
  if Length(sk1.s) < 8 then
    lSize := getLongestCommonStrInt_Header(ansilowercase(sk1.s), ansilowercase(sk2.s))
  else
    lSize := getLongestCommonStrInt(ansilowercase(sk1.s), ansilowercase(sk2.s));
  if ((Length(sk1.s) - lSize) <= getSubTringThresholdDec(Length(sk1.s))) and (abs((Length(sk2.s) - Length(sk1.s))) <= getSubTringThresholdInc(Length(sk1.s))) then
  begin
    Result := true;
    sSize := Max(Length(sk1.s), Length(sk2.s)) - lSize;
    ldOut := sSize * 0.1 + ifThen(sSize = 0, 0.1, 0.55) + GetStringProxy(sk1.s, sk2.sTrans) * proxybaseRatio;
  end;
end;

function getWordFromIndex(a: tlist<cardinal>; startIndex, margingIndex: integer; c: cardinal): boolean;
var
  i: integer;
begin
  Result := false;
  for i := Max(startIndex - margingIndex, 0) to min(startIndex + margingIndex, a.count - 1) do
    if a[i] = c then
      exit(true)
end;

function getWordsMatchHash(sk1, sk2: tSkyStr; var ldOut: single; var bBreak: boolean): boolean;
var
  i, resultThreshold, cMatches: integer;
begin
  Result := false;
  bBreak := false;
  ldOut := 99.9;
  if bSkipLDpreWordMatch then
    exit;
  // skip matchs
  if sk2.hash = sk1.hash then
  begin
    ldOut := 0.01 + sk2.proxy * 0.05;
    exit(true);
  end;

  // Uppercase check
  if (Length(sk1.s) = Length(sk2.s)) then
  begin
    if ansilowercase(sk1.s) = ansilowercase(sk2.s) then
    begin
      ldOut := 0.3 + GetStringProxy(sk1.s, sk2.sTrans) * proxybaseRatio;
      exit(true);
    end;
  end;

  if (sk1.awords.count = 1) and (sk2.awords.count = 1) then
    exit(getSubStringMatch(sk1, sk2, ldOut));

  // Threshold first pass nb absolute words
  resultThreshold := defineHeuristicThreshold(sk1.awords.count);
  if sk2.awords.count - sk1.awords.count > resultThreshold then
  begin
    bBreak := true;
    exit;
  end;

  cMatches := 0;
  for i := 0 to sk1.awords.count - 1 do
  begin
    if not getWordFromIndex(sk2.awords, i, resultThreshold + 1, (sk1.awords[i])) then
      inc(cMatches);
    if cMatches >= resultThreshold then
      exit;
  end;

  if (cMatches < min(iLDWordSearchThresholdMax, resultThreshold + 1)) then
    ldOut := WordsDistance(sk1.awords, sk2.awords);

  if ldOut > resultThreshold then
    exit;
  ldOut := adjustHeuristicResult(sk1.awords.count, ldOut);

  if ldOut = 0 then
    ldOut := 0.5;

  if ldOut < resultThreshold + 1 then
    ldOut := ldOut + GetStringProxy(sk1.s, sk2.sTrans) * proxybaseRatio;

  Result := ldOut <= resultThreshold;
end;

procedure doFindHeuristicFocus(LDTree: TVirtualStringTree; bUseRef: boolean);
var
  i, j: integer;
  sk1, sk2: tSkyStr;
  limitLD: single;
  bBreak: boolean;
  node: pVirtualNode;
begin
  generateHeuristicList;
  sk1 := focusedNode.LDfstring;
  sk1.initStrings(false);
  // pexnotrans support
  if pexNoTrans in sk1.sInternalparams then
    exit;
  // 0 words:
  if sk1.awords.count = 0 then
    exit;
  ProgressBar.Max := HeuristicList.count;
  pbar := 0;

  bBreak := false;
  FastListSearch(HeuristicList, compareLowerWordCount, sk1, i, true);
  for j := i to pred(HeuristicList.count) do
  begin
    UpdatePBar(5000);
    sk2 := HeuristicList.items[j];
    if not sk2.isRefRec(sk1.esp.rName, sk1.esp.fName, bUseRef) then
      continue;

    if getWordsMatchHash(sk1, sk2, limitLD, bBreak) then
    begin
      sk2.LDResult := limitLD;
      node := LDTree.AddChild(nil, TNodeData.Create(sk2));
      LDTree.NodeHeight[node] := getHeightforCell(sk2.s, -1, GlobalFontHeight);
    end;
    if bBreak then
      break;
  end;
  ProgressBar.position := ProgressBar.Max;
end;

function getStrEx(l: tlist; index: integer; var skOut: tSkyStr; var bnTrans: boolean): boolean;
var
  i, count: integer;
  h1: cardinal;
  sk: tSkyStr;
begin
  bnTrans := false;
  skOut := nil;
  count := 0;
  h1 := tSkyStr(l[index]).hash;
  for i := index to l.count - 1 do
  // index = current sk
  begin
    sk := l[i];
    if (sk.hash <> h1) then
      break;
    if (count > 0) then
    begin
      bnTrans := true;
      break;
    end;
    skOut := sk;
    inc(count);
  end;
  Result := assigned(skOut);
end;

function getStrWithRefRecEx(l: tlist; index: integer; r, f: sHeaderSig; var skOut: tSkyStr; var bnTrans: boolean): boolean;
var
  i, count: integer;
  h1: cardinal;
  sk: tSkyStr;
begin
  bnTrans := false;
  skOut := nil;
  count := 0;
  h1 := tSkyStr(l[index]).hash;
  for i := index to l.count - 1 do
  // index = current sk
  begin
    sk := l[i];
    if (sk.hash <> h1) then
      break;
    if sk.isRefRec(r, f, true) then
    begin
      if (count > 0) then
      begin
        bnTrans := true;
        break;
      end;
      skOut := sk;
      inc(count);
    end;
  end;
  Result := assigned(skOut);
end;

function getStrWithRefRec(l: tlist; index: integer; r, f: sHeaderSig; var skOut: tSkyStr; var bnTrans: boolean): boolean;
begin
  Result := getStrEx(l, index, skOut, bnTrans);
  if Result and bnTrans then
    Result := getStrWithRefRecEx(l, index, r, f, skOut, bnTrans);
  if not Result then
    Result := getStrEx(l, index, skOut, bnTrans);
end;

function findStrMatchEx(vlist, dlist: tlist; fProc: tCompareProc; validatedTrans: sStrParams; bResetTrans, forceAutoTranslate, bskipSametest, bSkipTranslated, bVmad: boolean): integer;
var
  i, j: integer;
  sk1, sk2: tSkyStr;
  bsame: boolean;
  Autotrans: boolean;
  bCheckDiff, bnTrans: boolean;
begin
  Result := 0;
  Autotrans := (bAuthAutoTranslate or forceAutoTranslate) and not TESVTSameLanguage;
  if bskipSametest then
    bsame := false
  else
    bsame := TESVTSameLanguage;
  // --------------------------
  for i := 0 to dlist.count - 1 do
  begin
    UpdatePBar(pBarFrequencies);
    sk1 := dlist.items[i];

    if not fProc(sk1) then
      continue;
    // pexnotrans support
    if pexNoTrans in sk1.sInternalparams then
      continue;
    // if we have the same lang/ source/dest
    if bsame or sk1.isEmpty then
    begin
      sk1.assignSame;
      continue;
    end;

    // skip alreadyTranslated
    if bSkipTranslated and (sk1.sparams * [translated, validated] <> []) then
      continue;
    // reset nTrans
    if bResetTrans or (nTrans in (sk1.sInternalparams)) then
      sk1.resetTrans(bVmad);

    if Autotrans and FastListSearch(vlist, compareHashAndSource, sk1, j, true) and getStrWithRefRec(vlist, j, sk1.esp.rName, sk1.esp.fName, sk2, bnTrans) then
    begin
      // sk2 := vlist[j];
      include(sk2.sInternalparams, SSTApplied);
      if pending in sk2.sparams then
        sk1.resetTrans(bVmad)
      else
      begin
        sk1.sTrans := sk2.sTrans;
        // if nTrans in sk2.sInternalparams then
        if bnTrans then
        begin
          sk1.resetStatus([incompleteTrans], (bVmad));
          include(sk1.sInternalparams, nTrans);
        end
        else
        begin
          bCheckDiff := sk1.hashTrans <> sk2.hashTrans;
          if incompleteTrans in sk2.sparams then
            sk1.resetStatus([incompleteTrans], (bVmad))
          else if lockedTrans in sk2.sparams then
            sk1.resetStatus([lockedTrans], (bVmad))
          else
          begin
            if bCheckDiff then
              sk1.resetStatus([validated], (bVmad))
            else
              sk1.resetStatus(validatedTrans, bVmad);
          end;
        end;
        // if the vocab source  is from olddata or is a derived string then put a warning.
        if (derivedComputed in sk2.sInternalparams) or (unUsedInSST in sk2.sInternalparams) then
        begin
          sk1.resetStatus([incompleteTrans]);
          include(sk1.sInternalparams, lowWarning);
        end;
      end;
    end
    else
    begin
      if not TESVTSameLanguage then
      begin
        sk1.resetTrans(bVmad);
        inc(Result);
      end;
    end;
  end;
end;

function findEdidMatchEx(edidList, dlist: tlist; fProc: tCompareProc; proc: TListSortCompare; resetState: boolean; appliedTrans: sStrParams; validatedTrans: sStrParams;
  bApplytag, bTagOnly, bVmad, bApplyStringID: boolean): integer;
var
  i: integer;
  sk1, sk2: tSkyStr;
  searchP, foundP: tEspStrRef;
  newindex: integer;
  OnlyEdid: boolean;
  bCheckDiff: boolean;
begin

  // Quick Fix. need a cleaner way --->
  OnlyEdid := (@proc = @compareEspStr_Edid) or (@proc = @compareEspStr_V4Edid);
  // <-----
  Result := 0;
  searchP := tEspStrRef.init(nil);

  // --------------------------
  for i := 0 to dlist.count - 1 do
  begin
    UpdatePBar(pBarFrequencies);
    sk1 := dlist.items[i];

    if pexNoTrans in sk1.sInternalparams then
      continue;
    if not fProc(sk1) then
      continue;
    if resetState or (nTrans in (sk1.sInternalparams)) then
      sk1.resetTrans(bVmad);
    // ------------------
    CopyMemory(@searchP.data, @sk1.esp, SizeOf(rEspPointerLite));
    searchP.sk := sk1;

    if FastListSearch(edidList, proc, searchP, newindex, true) then
    begin
      foundP := edidList[newindex];
      sk2 := foundP.sk;
      foundP.used := true;
      include(sk2.sInternalparams, SSTApplied);
      if bApplyStringID then
      begin
        sk1.esp.strId := foundP.data.strId;
        include(sk1.sInternalparams, StringIdChanged);
      end;

      if bApplytag then
        sk1.colabId := foundP.colabId;
      if not bTagOnly then
      begin
        sk1.sInternalparams := sk1.sInternalparams - [lowWarning, warning, bigwarning, nTrans];
        if pending in foundP.sparams then
          sk1.resetTrans(bVmad)
        else
        begin
          bCheckDiff := sk1.hashTrans <> sk2.hashTrans;
          sk1.sTrans := sk2.sTrans;
          if incompleteTrans in foundP.sparams then
            sk1.resetStatus([incompleteTrans], bVmad)
          else if lockedTrans in foundP.sparams then
            sk1.resetStatus([lockedTrans], bVmad)
          else
          begin
            if bCheckDiff then
              sk1.resetStatus(appliedTrans, bVmad)
            else
            begin
              if TESVTSameLanguage and (sk1.hash <> sk1.hashTrans) then
                sk1.resetStatus(appliedTrans, bVmad)
              else
                sk1.resetStatus(validatedTrans, bVmad);
            end;
          end;

          if OnlyEdid and TESVTmodEspLoaded then
          begin
            if (searchP.data.IndexMax > 0) or (foundP.data.IndexMax > 0) then
            begin
              sk1.resetStatus([incompleteTrans]);
              if (searchP.data.IndexMax <> foundP.data.IndexMax) then
                include(sk1.sInternalparams, bigwarning)
              else
                include(sk1.sInternalparams, warning);
            end;
          end;
        end;
      end;
    end
    else if sk1.isEmpty then
      sk1.assignSame
    else if not TESVTSameLanguage then
    begin
      inc(Result);
    end;
  end;
  searchP.Free;
end;

end.
