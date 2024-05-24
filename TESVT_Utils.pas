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
unit TESVT_Utils;

interface

uses forms, classes, Graphics, SysUtils, shellApi, Windows;

type
  sArray = array of string;

  tmcStringList = class(tStringList)
  private
    FObjSorted: Boolean;
    FCachedIndex: integer;
    procedure SetObjSorted(Value: Boolean);
    function IndexOfName_Cache(const Name: string; bInitCache: Boolean): integer;
  public
    function valueStr(s: string; default: string = ''): string;
    function valueTrim(s: string; default: string = ''): string;
    function valueInt(s: string; default: integer = 0): integer;
    function valueBoolean(s: string; default: Boolean = false): Boolean;
    procedure valueIntAdd(s: string; add: integer = 0);
    procedure ObjSort;
    property ObjSorted: Boolean read FObjSorted write SetObjSorted;
    function ObjFind(const Value: integer; var Index: integer): Boolean;
    function GetValue_Cache(const Name: string; bInitCache: Boolean): string;
  end;

  CardinalPairResult = array of cardinal;

  rCardinalPair = record
    a, b: cardinal;
  end;

  pCardinalPair = ^rCardinalPair;

  tmcCardinalPairList = class(Tlist)
  private
    fPairSorted: Boolean;
    procedure SetPairSorted(Value: Boolean);
    function addPointer(p: pointer; var Index: integer): Boolean;
    function FastSearch(Compare: TListSortCompare; p: pointer; var newindex: integer; b: Boolean): Boolean;
  public
    function AddPair(x, y: cardinal): integer;
    procedure sortPair;
    function findPairArray(Value: cardinal): CardinalPairResult;
    function findPair(Value: cardinal; var ValueOut: cardinal): Boolean;

    procedure Clear; override;
    destructor Destroy; override;
    property PairSorted: Boolean read fPairSorted write SetPairSorted;
  end;

  rCardinalPointer = record
    a: cardinal;
    p: pointer;
  end;

  pCardinalPointer = ^rCardinalPointer;

  tmcCardinalPointerList = class(Tlist)
  private
    fPairSorted: Boolean;
    procedure SetPairSorted(Value: Boolean);
    function addPointer(p: pointer; var Index: integer): Boolean;
    function FastSearch(Compare: TListSortCompare; p: pointer; var newindex: integer): Boolean;
  public
    function AddPair(x: cardinal; y: pointer): integer;
    procedure sortPair;
    function findPair(Value: cardinal): pointer;
    procedure Clear; override;
    destructor Destroy; override;
    property PairSorted: Boolean read fPairSorted write SetPairSorted;
  end;

  rCardinalString = record
    a: cardinal;
    s: string;
  end;

  pCardinalString = ^rCardinalString;

  tmcCardinalStringList = class(Tlist)
  private
    fPairSorted: Boolean;
    procedure SetPairSorted(Value: Boolean);
    function addPointer(p: pointer; var Index: integer): Boolean;
    function FastSearch(Compare: TListSortCompare; p: pointer; var newindex: integer): Boolean;
  public
    function AddPair(x: cardinal; s: string): integer;
    procedure sortPair;
    function findPair(Value: cardinal): string;
    procedure Clear; override;
    destructor Destroy; override;
    property PairSorted: Boolean read fPairSorted write SetPairSorted;
  end;

function SwapEndian32asm(Value: integer): integer;
function SwapEndian32uasm(Value: cardinal): cardinal;
function SwapEndian16uasm(Value: word): word;
function SwapEndian32(i, Value: integer): integer;
function SwapEndian32u(i, Value: cardinal): cardinal;
function SwapEndian32f(i, Value: single): single;
function SwapEndian16u(i, Value: word): word;
function Explode(const s: string; out a: sArray; separator: char): integer;
function GetBit(const aValue: cardinal; const Bit: Byte): Boolean;
Function RunExecutable(const FileName: String; const Params: array of String; const WorkingDirectory: String; WaitForIt: Boolean; var process: cardinal): Boolean;
procedure decPositive(var i: integer);
function DelFileOperation(const Source, dest: string; op, flags: integer): Boolean;
function getbyteCount(encoding: word; s: string): integer;
function getEncodingString(encoding: word; s: tbytes): string;
function getEncodingTBytes(encoding: word; s: string): tbytes;
procedure RandomizeListOrder(var List: tStringList);
function MidStrReplace(sInput, sReplace: string; iOffset, iLength: integer): string;
procedure WrapStringList(Strings: tStringList; MaxWidth: integer);

implementation

function MidStrReplace(sInput, sReplace: string; iOffset, iLength: integer): string;
begin
  result := copy(sInput, 1, iOffset - 1) + sReplace + copy(sInput, iOffset + iLength, length(sInput));
end;

function getEncodingTBytes(encoding: word; s: string): tbytes;
var
  e: tEncoding;
begin
  e := tEncoding.GetEncoding(encoding);
  try
    result := e.GetBytes(s);
  finally
    e.free;
  end;
end;

function getEncodingString(encoding: word; s: tbytes): string;
var
  e: tEncoding;
begin
  e := tEncoding.GetEncoding(encoding);
  try
    result := e.GetString(s);
  finally
    e.free;
  end;
end;

function getbyteCount(encoding: word; s: string): integer;
var
  e: tEncoding;
begin
  e := tEncoding.GetEncoding(encoding);
  try
    result := e.getbyteCount(s);
  finally
    e.free;
  end;
end;


// Usage  NewColor:= Blend(Color1, Color2, blending level 0 to 100);

procedure decPositive(var i: integer);
begin
  dec(i);
  if i < 0 then
    i := 0;
end;

function GetBit(const aValue: cardinal; const Bit: Byte): Boolean;
begin
  result := (aValue and (1 shl Bit)) <> 0;
end;

function Explode(const s: string; out a: sArray; separator: char): integer;
var
  iStr: integer;
  iLen: integer;
  iBegin: integer;
begin
  if length(s) = 0 then
  begin
    SetLength(a, 1);
    result := 0;
    a[result] := '';
    exit;
  end;

  iLen := 0;
  for iStr := 1 to length(s) do
    if s[iStr] = separator then
      Inc(iLen);
  if s[length(s)] <> separator then
    Inc(iLen);

  SetLength(a, iLen);
  iBegin := 1;
  iLen := 0;
  result := 0;

  for iStr := 1 to length(s) do
  begin
    if s[iStr] = separator then
    begin
      a[result] := copy(s, iBegin, iLen);
      Inc(result);
      iBegin := iStr + 1;
      iLen := 0;
    end
    else
      Inc(iLen);
  end;

  if result < length(a) then
    a[result] := copy(s, iBegin, MaxInt);
end;

function AddQuotesIfNeeded(const s: String): String;
begin
  if (s = '') or (Pos(' ', s) <> 0) or (Pos('"', s) <> 0) then
    result := AnsiQuotedStr(s, '"')
  else
    result := s;
end;

Function RunExecutable(const FileName: String; const Params: array of String; const WorkingDirectory: String; WaitForIt: Boolean; var process: cardinal): Boolean;
Var
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
  sCommand: String;
  i: integer;
begin
  sCommand := AddQuotesIfNeeded(FileName);
  for i := Low(Params) to High(Params) do
    sCommand := sCommand + ' ' + AddQuotesIfNeeded(Params[i]);
  UniqueString(sCommand);

  ZeroMemory(@StartupInfo, SizeOf(StartupInfo));
  StartupInfo.cb := SizeOf(StartupInfo);

  StartupInfo.wShowWindow := SW_HIDE;
  StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
  ZeroMemory(@ProcessInfo, SizeOf(TProcessInformation));
  If CreateProcess(nil, PChar(sCommand), nil, nil, IsConsole, NORMAL_PRIORITY_CLASS, nil, PChar(WorkingDirectory), StartupInfo, ProcessInfo) Then
  Begin
    result := true;
    CloseHandle(ProcessInfo.hThread);
    If (not WaitForIt) or (WaitForSingleObject(ProcessInfo.hProcess, INFINITE) = WAIT_OBJECT_0) Then
      GetExitCodeProcess(ProcessInfo.hProcess, process);
    CloseHandle(ProcessInfo.hProcess);
  end
  else
    result := false;
End;

// delete file
function DelFileOperation(const Source, dest: string; op, flags: integer): Boolean;
var
  shf: TSHFileOpStruct;
  s1, s2: string;
begin
  { Send a file to the trashcan
    FileOperation (filename, '', FO_DELETE, FOF_ALLOWUNDO + FOF_NOCONFIRMATION);
  }
  fillchar(shf, SizeOf(shf), #0);
  s1 := Source + #0#0;
  s2 := dest + #0#0;
  shf.Wnd := 0;
  shf.wFunc := op;
  shf.pFrom := PChar(s1);
  shf.pTo := PChar(s2);
  shf.fFlags := flags;
  result := SHFileOperation(shf) = 0;
end;

// fallout4 use regular byte order

function SwapEndian32(i, Value: integer): integer;
begin
  if i = 2 then
    result := Value
  else
    result := SwapEndian32asm(Value);
end;

function SwapEndian32uasm(Value: cardinal): cardinal;
type
  Bytes = packed array [0 .. 3] of Byte;
begin
  Bytes(result)[0] := Bytes(Value)[3];
  Bytes(result)[1] := Bytes(Value)[2];
  Bytes(result)[2] := Bytes(Value)[1];
  Bytes(result)[3] := Bytes(Value)[0];
end;

function SwapEndian32u(i, Value: cardinal): cardinal;
begin
  if i = 2 then
    result := Value
  else
    result := SwapEndian32uasm(Value);
end;

function SwapEndian32f(i, Value: single): single;
type
  Bytes = packed array [0 .. 3] of Byte;
begin
  if i = 2 then
    result := Value
  else
  begin
    Bytes(result)[0] := Bytes(Value)[3];
    Bytes(result)[1] := Bytes(Value)[2];
    Bytes(result)[2] := Bytes(Value)[1];
    Bytes(result)[3] := Bytes(Value)[0];
  end;
end;

function SwapEndian16u(i, Value: word): word;
begin
  if i = 2 then
    result := Value
  else
    result := SwapEndian16uasm(Value);
end;

function SwapEndian32asm(Value: integer): integer;
type
  Bytes = packed array [0 .. 3] of Byte;
begin
  Bytes(result)[0] := Bytes(Value)[3];
  Bytes(result)[1] := Bytes(Value)[2];
  Bytes(result)[2] := Bytes(Value)[1];
  Bytes(result)[3] := Bytes(Value)[0];
end;

function SwapEndian16uasm(Value: word): word;
type
  Bytes = packed array [0 .. 1] of Byte;
begin
  Bytes(result)[0] := Bytes(Value)[1];
  Bytes(result)[1] := Bytes(Value)[0];
end;

procedure RandomizeListOrder(var List: tStringList);
var
  Index, Item: integer;
begin
  Randomize;
  for Index := List.Count - 1 downto 1 do
  begin
    Item := Random(Index + 1);
    List.Exchange(Index, Item);
  end;
end;


// --------------

function compareCardinal(a, b: cardinal): integer;
begin
  if a < b then
    exit(-1)
  else if a > b then
    exit(1);
  result := 0;
end;

function CardinalPairListCompareX(p1, p2: pointer): integer;
begin
  result := compareCardinal(pCardinalPair(p1).a, pCardinalPair(p2).a);
end;

function CardinalPairListCompare(p1, p2: pointer): integer;
begin
  result := CardinalPairListCompareX(p1, p2);
  if result = 0 then
    result := compareCardinal(pCardinalPair(p1).b, pCardinalPair(p2).b);
end;

function tmcCardinalPairList.AddPair(x, y: cardinal): integer;
var
  pC: pCardinalPair;
  Index: integer;
begin
  result := -1;
  new(pC);
  pC^.a := x;
  pC^.b := y;
  if fPairSorted then
  begin
    if addPointer(pC, index) then
      result := index
    else
      dispose(pC);
  end
  else
  begin
    add(pC);
    result := Count - 1;
  end;
end;

procedure tmcCardinalPairList.sortPair;
begin
  sort(CardinalPairListCompare);
end;

function tmcCardinalPairList.findPairArray(Value: cardinal): CardinalPairResult;
var
  Index, i: integer;
  dummy, pC: pCardinalPair;
begin
  SetLength(result, 0);
  new(dummy);
  dummy.a := Value;
  if FastSearch(CardinalPairListCompareX, dummy, index, true) then
  begin
    for i := index to pred(Count) do
    begin
      pC := List[i];
      if pC^.a <> Value then
        break;
      SetLength(result, length(result) + 1);
      result[length(result) - 1] := pC^.b;
    end;
  end;
  dispose(dummy);
end;

function tmcCardinalPairList.findPair(Value: cardinal; var ValueOut: cardinal): Boolean;
var
  Index: integer;
  dummy: pCardinalPair;
begin
  result := false;
  new(dummy);
  dummy.a := Value;
  if FastSearch(CardinalPairListCompareX, dummy, index, true) then
  begin
    ValueOut := pCardinalPair(List[index])^.b;
    result := true;
  end;
  dispose(dummy);
end;

procedure tmcCardinalPairList.Clear;
var
  i: integer;
begin
  for i := 0 to pred(Count) do
    dispose(pCardinalPair(List[i]));

  SetCount(0);
  SetCapacity(0);
end;

function tmcCardinalPairList.addPointer(p: pointer; var Index: integer): Boolean;
begin
  result := false;
  if not FastSearch(CardinalPairListCompare, p, index, false) then
  begin
    Insert(index, p);
    result := true
  end;
end;

function tmcCardinalPairList.FastSearch(Compare: TListSortCompare; p: pointer; var newindex: integer; b: Boolean): Boolean;
var
  i, L, H: integer;
  c: integer;
  function getlowest(p: pointer; startID: integer): integer;
  begin
    result := startID;
    dec(startID);
    while (startID >= 0) do
    begin
      if (Compare(List[startID], p) = 0) then
        result := startID
      else
        exit;
      dec(startID);
    end;
  end;

begin
  result := false;
  L := 0;
  H := Count - 1;
  while (L <= H) do
  begin
    i := (L + H) shr 1;
    c := Compare(List[i], p);
    if c < 0 then
      L := i + 1
    else
    begin
      H := i - 1;
      if c = 0 then
      begin
        L := i;
        if b then
          L := getlowest(p, L);
        result := true;
        break;
      end;
    end;
  end;
  newindex := L;
end;

procedure tmcCardinalPairList.SetPairSorted(Value: Boolean);
begin
  if fPairSorted <> Value then
  begin
    if Value then
      sortPair;
    fPairSorted := Value;
  end;
end;

destructor tmcCardinalPairList.Destroy;
begin
  Clear;
end;

// =====================================

function tmcStringList.valueInt(s: string; default: integer = 0): integer;
begin
  result := strtoIntdef(trim(values[s]), default);
end;

procedure tmcStringList.valueIntAdd(s: string; add: integer = 0);
begin
  values[s] := inttostr(valueInt(s) + add);
end;

function tmcStringList.valueBoolean(s: string; default: Boolean = false): Boolean;
begin
  result := strtoBooldef(trim(values[s]), default);
end;

function tmcStringList.valueStr(s: string; default: string = ''): string;
begin
  result := values[s];
  if result = '' then
    result := default;
end;

function tmcStringList.valueTrim(s: string; default: string = ''): string;
begin
  result := trim(values[s]);
  if result = '' then
    result := default;
end;

procedure tmcStringList.SetObjSorted(Value: Boolean);
begin
  if FObjSorted <> Value then
  begin
    if Value then
      ObjSort;
    FObjSorted := Value;
  end;
end;

function tmcStringList.ObjFind(const Value: integer; var Index: integer): Boolean;
var
  L, H, i, c: integer;
begin
  result := false;
  L := 0;
  H := Count - 1;
  while L <= H do
  begin
    i := (L + H) shr 1;
    c := integer(Objects[i]) - Value;
    if c < 0 then
      L := i + 1
    else
    begin
      H := i - 1;
      if c = 0 then
      begin
        result := true;
        if Duplicates <> dupAccept then
          L := i;
      end;
    end;
  end;
  Index := L;
end;

function StringListCompareObjAsInt(List: tStringList; Index1, Index2: integer): integer;
begin
  result := integer(List.Objects[Index1]) - integer(List.Objects[Index2])
end;

procedure tmcStringList.ObjSort;
begin
  CustomSort(StringListCompareObjAsInt);
end;

function tmcStringList.IndexOfName_Cache(const Name: string; bInitCache: Boolean): integer;
var
  p: integer;
  s: string;
begin
  if bInitCache then
    FCachedIndex := 0;

  for result := FCachedIndex to GetCount - 1 do
  begin
    s := Get(result);
    p := AnsiPos(NameValueSeparator, s);
    if (p <> 0) and (CompareStrings(copy(s, 1, p - 1), Name) = 0) then
    begin
      FCachedIndex := result;
      exit;
    end;
  end;
  result := -1;
end;

function tmcStringList.GetValue_Cache(const Name: string; bInitCache: Boolean): string;
var
  i: integer;
begin
  i := IndexOfName_Cache(Name, bInitCache);
  if i >= 0 then
    result := copy(Get(i), length(Name) + 2, MaxInt)
  else
    result := '';
end;

// =================

function CardinalPointerListCompare(p1, p2: pointer): integer;
begin
  result := compareCardinal(pCardinalPointer(p1).a, pCardinalPointer(p2).a);
end;

function tmcCardinalPointerList.AddPair(x: cardinal; y: pointer): integer;
var
  pC: pCardinalPointer;
  Index: integer;
begin
  result := -1;
  new(pC);
  pC^.a := x;
  pC^.p := y;
  if fPairSorted then
  begin
    if addPointer(pC, index) then
      result := index
    else
      dispose(pC);
  end
  else
  begin
    add(pC);
    result := Count - 1;
  end;
end;

procedure tmcCardinalPointerList.sortPair;
begin
  sort(CardinalPointerListCompare);
end;

function tmcCardinalPointerList.findPair(Value: cardinal): pointer;
var
  Index: integer;
  dummy: pCardinalPointer;
begin
  result := nil;
  new(dummy);
  dummy.a := Value;
  if FastSearch(CardinalPointerListCompare, dummy, index) then
    result := pCardinalPointer(List[index])^.p;
  dispose(dummy);
end;

procedure tmcCardinalPointerList.Clear;
var
  i: integer;
begin
  for i := 0 to pred(Count) do
    dispose(pCardinalPointer(List[i]));

  SetCount(0);
  SetCapacity(0);
end;

function tmcCardinalPointerList.addPointer(p: pointer; var Index: integer): Boolean;
begin
  result := false;
  if not FastSearch(CardinalPointerListCompare, p, index) then
  begin
    Insert(index, p);
    result := true
  end;
end;

function tmcCardinalPointerList.FastSearch(Compare: TListSortCompare; p: pointer; var newindex: integer): Boolean;
var
  i, L, H: integer;
  c: integer;
begin
  result := false;
  L := 0;
  H := Count - 1;
  while (L <= H) do
  begin
    i := (L + H) shr 1;
    c := Compare(List[i], p);
    if c < 0 then
      L := i + 1
    else
    begin
      H := i - 1;
      if c = 0 then
      begin
        L := i;
        result := true;
        break;
      end;
    end;
  end;
  newindex := L;
end;

procedure tmcCardinalPointerList.SetPairSorted(Value: Boolean);
begin
  if fPairSorted <> Value then
  begin
    if Value then
      sortPair;
    fPairSorted := Value;
  end;
end;

destructor tmcCardinalPointerList.Destroy;
begin
  Clear;
end;

// =====================================

function CardinalStringListCompare(p1, p2: pointer): integer;
begin
  result := compareCardinal(pCardinalString(p1).a, pCardinalString(p2).a);
end;

function tmcCardinalStringList.AddPair(x: cardinal; s: string): integer;
var
  pC: pCardinalString;
  Index: integer;
begin
  result := -1;
  new(pC);
  pC^.a := x;
  pC^.s := s;
  if fPairSorted then
  begin
    if addPointer(pC, index) then
      result := index
    else
      dispose(pC);
  end
  else
  begin
    add(pC);
    result := Count - 1;
  end;
end;

procedure tmcCardinalStringList.sortPair;
begin
  sort(CardinalStringListCompare);
end;

function tmcCardinalStringList.findPair(Value: cardinal): string;
var
  Index: integer;
  dummy: pCardinalString;
begin
  result := '';
  new(dummy);
  dummy.a := Value;
  if FastSearch(CardinalStringListCompare, dummy, index) then
    result := pCardinalString(List[index])^.s;
  dispose(dummy);
end;

procedure tmcCardinalStringList.Clear;
var
  i: integer;
begin
  for i := 0 to pred(Count) do
    dispose(pCardinalString(List[i]));

  SetCount(0);
  SetCapacity(0);
end;

function tmcCardinalStringList.addPointer(p: pointer; var Index: integer): Boolean;
begin
  result := false;
  if not FastSearch(CardinalStringListCompare, p, index) then
  begin
    Insert(index, p);
    result := true
  end;
end;

function tmcCardinalStringList.FastSearch(Compare: TListSortCompare; p: pointer; var newindex: integer): Boolean;
var
  i, L, H: integer;
  c: integer;
begin
  result := false;
  L := 0;
  H := Count - 1;
  while (L <= H) do
  begin
    i := (L + H) shr 1;
    c := Compare(List[i], p);
    if c < 0 then
      L := i + 1
    else
    begin
      H := i - 1;
      if c = 0 then
      begin
        L := i;
        result := true;
        break;
      end;
    end;
  end;
  newindex := L;
end;

procedure tmcCardinalStringList.SetPairSorted(Value: Boolean);
begin
  if fPairSorted <> Value then
  begin
    if Value then
      sortPair;
    fPairSorted := Value;
  end;
end;

destructor tmcCardinalStringList.Destroy;
begin
  Clear;
end;

// --------

function WordWrap(const AText: string; MaxWidth: integer): tStringList;
var
  List: tStringList;
  Line, word: string;
  Pos: integer;
begin
  List := tStringList.Create;
  try
    Line := '';
    Pos := 1;
    while Pos <= length(AText) do
    begin
      word := '';
      while (Pos <= length(AText)) and (AText[Pos] = ' ') do
        Inc(Pos);
      while (Pos <= length(AText)) and (AText[Pos] <> ' ') do
      begin
        word := word + AText[Pos];
        Inc(Pos);
      end;
      if length(Line) + length(word) + 1 > MaxWidth then
      begin
        List.add(Line);
        Line := word;
      end
      else
      begin
        if Line <> '' then
          Line := Line + ' ';
        Line := Line + word;
      end;
    end;
    if Line <> '' then
      List.add(Line);
  except
    List.free;
    raise;
  end;
  result := List;
end;

procedure WrapStringList(Strings: tStringList; MaxWidth: integer);
var
  TempList, WrappedList: tStringList;
  i: integer;
begin
  TempList := tStringList.Create;
  try
    for i := 0 to Strings.Count - 1 do
    begin
      WrappedList := WordWrap(Strings[i], MaxWidth);
      try
        TempList.AddStrings(WrappedList);
      finally
        WrappedList.free;
      end;
    end;
    Strings.Assign(TempList);
  finally
    TempList.free;
  end;
end;

end.
