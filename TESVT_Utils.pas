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

uses forms, classes, Graphics, SysUtils, shellApi, Windows, tesvt_Const;

type
  sArray = array of string;

function SwapEndian32asm(Value: integer): integer;
function SwapEndian32uasm(Value: cardinal): cardinal;
function SwapEndian16uasm(Value: word): word;
function SwapEndian32(i, Value: integer): integer;
function SwapEndian32u(i, Value: cardinal): cardinal;
function SwapEndian32f(i, Value: single): single;
function SwapEndian16u(i, Value: word): word;
function Explode(const S: string; out a: sArray; separator: char): integer;
function GetBit(const aValue: cardinal; const Bit: Byte): Boolean;
Function RunExecutable(const FileName: String; const Params: array of String; const WorkingDirectory: String; WaitForIt: Boolean;
  var process: cardinal): Boolean;
procedure decPositive(var i: integer);
function GetStringProxy(gs, gTrans: string): integer;
procedure ClearTmpFiles;
function DelFileOperation(const Source, dest: string; op, flags: integer): Boolean;
function getbyteCount(encoding: word; S: string): integer;
function getEncodingString(encoding: word; S: tbytes): string;
function getEncodingTBytes(encoding: word; S: string): tbytes;
procedure RandomizeListOrder(var List: TstringList);

implementation

function getEncodingTBytes(encoding: word; S: string): tbytes;
var
  e: tEncoding;
begin
  e := tEncoding.GetEncoding(encoding);
  try
    result := e.GetBytes(S);
  finally
    e.free;
  end;
end;

function getEncodingString(encoding: word; S: tbytes): string;
var
  e: tEncoding;
begin
  e := tEncoding.GetEncoding(encoding);
  try
    result := e.GetString(S);
  finally
    e.free;
  end;
end;

function getbyteCount(encoding: word; S: string): integer;
var
  e: tEncoding;
begin
  e := tEncoding.GetEncoding(encoding);
  try
    result := e.getbyteCount(S);
  finally
    e.free;
  end;
end;

function GetStringProxy(gs, gTrans: string): integer;
var
  num1, num2, punc1, punc2: Boolean;
  i: integer;
begin
  // if length(gs) > iLengthCaseCompareThreshold then
  // exit(0);
  result := 3;
  // check Uppercase
  if (ansiUpperCase(gTrans) = gTrans) = (ansiUpperCase(gs) = gs) then
    dec(result);
  // hasNumber
  num1 := false;
  num2 := false;
  punc1 := false;
  punc2 := false;

  for i := 1 to length(gs) do
  begin
    if charinset(gs[i], ['0' .. '9']) then
      num1 := true;
    if charinset(gs[i], sPunctuation) then
      punc1 := true;
    if num1 and punc1 then
      break;
  end;
  for i := 1 to length(gTrans) do
  begin
    if charinset(gTrans[i], ['0' .. '9']) then
      num2 := true;
    if charinset(gTrans[i], sPunctuation) then
      punc2 := true;
    if num2 and punc2 then
      break;
  end;
  if num1 = num2 then
    dec(result);
  if punc1 = punc2 then
    dec(result);
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

function Explode(const S: string; out a: sArray; separator: char): integer;
var
  iStr: integer;
  iLen: integer;
  iBegin: integer;
begin
  if length(S) = 0 then
  begin
    SetLength(a, 1);
    result := 0;
    a[result] := '';
    exit;
  end;

  iLen := 0;
  for iStr := 1 to length(S) do
    if S[iStr] = separator then
      Inc(iLen);
  if S[length(S)] <> separator then
    Inc(iLen);

  SetLength(a, iLen);
  iBegin := 1;
  iLen := 0;
  result := 0;

  for iStr := 1 to length(S) do
  begin
    if S[iStr] = separator then
    begin
      a[result] := Copy(S, iBegin, iLen);
      Inc(result);
      iBegin := iStr + 1;
      iLen := 0;
    end
    else
      Inc(iLen);
  end;

  if result < length(a) then
    a[result] := Copy(S, iBegin, MaxInt);
end;

function AddQuotesIfNeeded(const S: String): String;
begin
  if (S = '') or (Pos(' ', S) <> 0) or (Pos('"', S) <> 0) then
    result := AnsiQuotedStr(S, '"')
  else
    result := S;
end;

Function RunExecutable(const FileName: String; const Params: array of String; const WorkingDirectory: String; WaitForIt: Boolean;
  var process: cardinal): Boolean;
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

procedure ClearTmpFiles;
var
  ShOp: TSHFileOpStruct;
begin
  ShOp.Wnd := application.Handle;
  ShOp.wFunc := FO_DELETE;
  ShOp.pFrom := PChar(tmpFuzPath + #0);
  ShOp.pTo := nil;
  ShOp.fFlags := FOF_NO_UI;
  // ShOp.fFlags := FOF_NOCONFIRMATION; //progressbar
  // ShOp.fFlags := FOF_ALLOWUNDO;  //trashCan
  SHFileOperation(ShOp);
end;

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



procedure RandomizeListOrder(var List: TstringList);
var
  Index, Item: Integer;
begin
  Randomize;
  for Index := List.Count - 1 downto 1 do
  begin
    Item := Random(Index + 1);
    List.Exchange(Index, Item);
  end;
end;


end.
