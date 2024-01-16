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


  LibHunspell use: libHunspell.dll library: https://github.com/hunspell/hunspell/releases
  with OpenOffice/Mzilla dictionaries.
  This LibSpellUnit explicit unicode declaration is rewritten, based on both
  -delphi default unit of the original Hunspell (now deprecated)
  -the non-Unicode implicit unit found at  http://www.visualsubsync.org/development
  Hunspell Library is distributed under the Mozilla Public License Version 1.1
}
unit LibHunspell;

interface

uses Windows, SysUtils, SyncObjs, Classes, Types, Messages;

// -----------------------------------------------------------------------------

const
  HUNSPELLDLL = 'libhunspell.dll';


type
  THunspell = THandle;
  pInteger = ^integer;

var
  Hunspell_create: function(const affpath, dpath: PAnsiChar): THunspell; cdecl;
  Hunspell_destroy: procedure(pHunspell: THunspell); cdecl;
  Hunspell_spell: function(pHunspell: THunspell; word: PAnsiChar; var pInt: pInteger; Var Root: PAnsiChar): integer; cdecl;
  Hunspell_get_dic_encoding: function(pHunspell: THunspell): PAnsiChar; cdecl;
  Hunspell_suggest: function(pHunspell: THunspell; var slst: PPAnsiChar; const word: PAnsiChar): integer; cdecl;
  Hunspell_free_list: function(pHunspell: THunspell; var slst: PPAnsiChar; const n: integer): integer; cdecl;


  // -----------------------------------------------------------------------------

type
  THunspellChecker = class
  private
    DLLHandle: THandle;
    DLLLoaded: boolean;
    FHunspell: THunspell;
    FDictionaryCodePage: Cardinal;
    FInitCC: TCriticalSection;
    function LoadLibHunspell(libraryName: String = ''): boolean;
    procedure UnLoadLibHunspell;
    procedure Cleanup;
  public
    constructor Create(libraryName: String = '');
    destructor Destroy; override;
    function Initialize(DictAff, DictDic: string): boolean;
    function IsInitialized: boolean;
    function Spell(word: string): boolean;
    function Suggest(word: string; Suggestions: TStrings): integer;
  end;

function FindDictEx(Path: String; FDictList: tstringlist): integer;

implementation

type
  TEncodingItem = record
    Name: ansistring;
    Code: Cardinal;
  end;

const
  CodepageTable: array [1 .. 17] of TEncodingItem = ((Name: 'ISO8859-1'; Code: 28591), (Name: 'ISO8859-2'; Code: 28592), (Name: 'ISO8859-3';
    Code: 28593), (Name: 'ISO8859-4'; Code: 28594), (Name: 'ISO8859-5'; Code: 28595), (Name: 'ISO8859-6'; Code: 28596), (Name: 'ISO8859-7';
    Code: 28597), (Name: 'ISO8859-8'; Code: 28598), (Name: 'ISO8859-9'; Code: 28599), (Name: 'ISO8859-10'; Code: 28600),
    (Name: 'ISO8859-13'; Code: 28603), (Name: 'ISO8859-14'; Code: 28604), (Name: 'ISO8859-15'; Code: 28605), (Name: 'KOI8-R'; Code: 20866),
    (Name: 'KOI8-U'; Code: 21866), (Name: 'microsoft-cp1251'; Code: 1251), (Name: 'ISCII-DEVANAGARI'; Code: 57002));

function GetCodePage(EncodingName: ansistring): integer;
var
  i: integer;
  EncodingItem: TEncodingItem;
begin
  for i:= Low(CodepageTable) to High(CodepageTable) do
  begin
    EncodingItem:= CodepageTable[i];
    if (EncodingItem.Name = EncodingName) then
      exit(EncodingItem.Code);
  end;
  Result:= CP_UTF8; // fallback UTF-8
end;

function ConvertOut(Text: string; CodePage: Cardinal): ansistring;
var
  Len: integer;
begin
  Len:= WideCharToMultiByte(CodePage, 0, PWideChar(Text), Length(Text), nil, 0, nil, nil);
  SetLength(Result, Len);
  WideCharToMultiByte(CodePage, 0, PWideChar(Text), Length(Text), @Result[1], Len, nil, nil);
end;

function ConvertIn(Text: ansistring; CodePage: Cardinal): string;
var
  Len: integer;
begin
  Len:= MultiByteToWideChar(CodePage, 0, PAnsiChar(Text), Length(Text), nil, 0);
  SetLength(Result, Len);
  MultiByteToWideChar(CodePage, 0, PAnsiChar(Text), Length(Text), @Result[1], Len);
end;

function FindDictEx(Path: String; FDictList: tstringlist): integer;
var
  searchResult: TSearchRec;
  affFilename: String;
begin
  FDictList.Clear;
  Path:= IncludeTrailingPathDelimiter(Path);
  try
    if (FindFirst(Path + '*.dic', faAnyFile, searchResult) = 0) then
      repeat
        affFilename:= Path + ChangeFileExt(searchResult.Name, '.aff');
        if FileExists(affFilename) then
          FDictList.Add(searchResult.Name);
      until FindNext(searchResult) <> 0;
  finally
    Result:= FDictList.Count;
    FindClose(searchResult);
  end;
end;

// -----------------------------------------------------------------------------
function THunspellChecker.LoadLibHunspell(libraryName: String = ''): boolean;
begin
  if libraryName = '' then
    libraryName:= HUNSPELLDLL;
  DLLHandle:= LoadLibrary(PChar(libraryName));
  if DLLHandle <> 0 then
  begin
    Result:= True;
    @Hunspell_create:= GetProcAddress(DLLHandle, 'Hunspell_create');
    if not Assigned(@Hunspell_create) then
      Result:= False;
    @Hunspell_destroy:= GetProcAddress(DLLHandle, 'Hunspell_destroy');
    if not Assigned(@Hunspell_destroy) then
      Result:= False;
    @Hunspell_spell:= GetProcAddress(DLLHandle, 'Hunspell_spell');
    if not Assigned(@Hunspell_spell) then
      Result:= False;
    @Hunspell_get_dic_encoding:= GetProcAddress(DLLHandle, 'Hunspell_get_dic_encoding');
    if not Assigned(@Hunspell_get_dic_encoding) then
      Result:= False;
    @Hunspell_suggest:= GetProcAddress(DLLHandle, 'Hunspell_suggest');
    if not Assigned(@Hunspell_suggest) then
      Result:= False;
    @Hunspell_free_list:= GetProcAddress(DLLHandle, 'Hunspell_free_list');
    if not Assigned(@Hunspell_free_list) then
      Result:= False;
  end
  else
    Result:= False;
end;

procedure THunspellChecker.UnLoadLibHunspell;
begin
  if DLLHandle <> 0 then
    FreeLibrary(DLLHandle); //
  DLLHandle:= 0;
end;

constructor THunspellChecker.Create(libraryName: String = '');
begin
  FInitCC:= TCriticalSection.Create;
  FHunspell:= 0;
  DLLHandle:= 0;
  DLLLoaded:= LoadLibHunspell(libraryName);
end;

function THunspellChecker.Initialize(DictAff, DictDic: string): boolean;
begin
  Cleanup;
  if not DLLLoaded then
    exit(False);

  FInitCC.Acquire;
  try
    FHunspell:= Hunspell_create(PAnsiChar(ansistring(DictAff)), PAnsiChar(ansistring(DictDic)));
    if (FHunspell <> 0) then
      FDictionaryCodePage:= GetCodePage(Hunspell_get_dic_encoding(FHunspell));
    Result:= (FHunspell <> 0);
  finally
    FInitCC.Release;
  end;
end;

function THunspellChecker.IsInitialized: boolean;
begin
  FInitCC.Acquire;
  try
    Result:= (FHunspell <> 0);
  finally
    FInitCC.Release;
  end;
end;

procedure THunspellChecker.Cleanup;
begin
  FInitCC.Acquire;
  try
    if (FHunspell <> 0) then
    begin
      Hunspell_destroy(FHunspell);
      FHunspell:= 0;
    end;
  finally
    FInitCC.Release;
  end;
end;

destructor THunspellChecker.Destroy;
begin
  Cleanup;
  UnLoadLibHunspell;
  FreeAndNil(FInitCC);
end;

// -----------------------------------------------------------------------------

function THunspellChecker.Spell(word: string): boolean;
var
  WordEncoded: ansistring;
  pInt: pInteger;
  pRoot: PAnsiChar;
begin
  WordEncoded:= ConvertOut(word, FDictionaryCodePage);
  Result:= Hunspell_spell(FHunspell, PAnsiChar(WordEncoded), pInt, pRoot) <> 0;
end;

function THunspellChecker.Suggest(word: string; Suggestions: TStrings): integer;
var
  slst, slstCursor: PPAnsiChar;
  i: integer;
  WordEncoded: ansistring;
begin

  WordEncoded:= ConvertOut(word, FDictionaryCodePage);
  Result:= Hunspell_suggest(FHunspell, slst, PAnsiChar(WordEncoded));
  if (Result > 0) then
  begin
    slstCursor:= slst;
    for i:= 1 to Result do
    begin
      Suggestions.Add(ConvertIn(slstCursor^, FDictionaryCodePage));
{$IFDEF WIN64}
      Inc(int64(slstCursor), sizeOf(Pointer));
{$ELSE}
      Inc(integer(slstCursor), sizeOf(Pointer));
{$ENDIF}
    end;
    Hunspell_free_list(FHunspell, slst, Result);
  end;
end;

end.
