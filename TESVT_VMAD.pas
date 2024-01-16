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
unit TESVT_VMAD;

interface

uses Classes, sysUtils, Dialogs, math, TESVT_Const, TESVT_Streams, TESVT_fstreamSave;

type

  tVMADDecoder = class
  private
    startpos: cardinal;
    bSize: cardinal;
    procedure skipArray(itemSize: cardinal);
    function skipLenString: word;
    procedure getLenString;
    procedure getStringArray;
    procedure GetStruct;
    procedure GetArrayStruct;
    procedure readFragment_TES5;
    procedure readFragment_FO4;
    procedure readFragmentQuest_FO4;
    procedure ReadScript(bReadName: Boolean = true);
    procedure ReadProperties;
    function getDataString(l: tstringList; var index: integer): word;
  public
    buffer: tbytes;
    version: SmallInt;
    propList: tstringList;
    scriptList: tstringList;
    currentPropIndex: integer;
    currentScriptIndex: integer;
    bBreak: Boolean;
    bHasStrings: Boolean;
    sList: tlist;
    rec, field: pointer;
    FragmentID: integer;
    constructor create(b: tbytes; r, f: pointer; fId: integer);
    destructor Destroy; override;
    procedure readVMAD;
    Procedure exportData;
  end;

  tVMADString = class
    buffer: tbytes;
    VMAD: tVMADDecoder;
    startpos: integer;
    PropIndex: integer;
    ScriptIndex: integer;
    sk: pointer; // pointer on tSkyStr
    constructor create(v: tVMADDecoder; sPos, l, pId, sID: integer);
    destructor Destroy; override;
  end;

implementation

uses TESVT_TypeDef, TESVT_EspDefinition;

constructor tVMADString.create(v: tVMADDecoder; sPos, l, pId, sID: integer);
begin
  startpos := sPos;
  PropIndex := pId;
  ScriptIndex := sID;
  SetLength(buffer, l);
  VMAD := v;
end;

destructor tVMADString.Destroy;
begin
  SetLength(buffer, 0);
  inherited;
end;

constructor tVMADDecoder.create(b: tbytes; r, f: pointer; fId: integer);
begin
  rec := r;
  field := f;
  bBreak := false;
  bHasStrings := false;
  propList := tstringList.create;
  scriptList := tstringList.create;
  startpos := 0;
  currentPropIndex := -1;
  currentScriptIndex := -1;
  FragmentID := fId;
  bSize := length(b);
  sList := tlist.create;
  SetLength(buffer, bSize);
  move(b[0], buffer[0], bSize);
  readVMAD;
end;

destructor tVMADDecoder.Destroy;
var
  i: integer;
begin
  for i := 0 to pred(sList.count) do
    tVMADString(sList[i]).free;
  sList.free;
  propList.free;
  scriptList.free;
  SetLength(buffer, 0);
  inherited;
end;

function tVMADDecoder.skipLenString: word;
begin
  getBufferData(buffer, @result, startpos, sizeOf(result), bSize);
  startpos := startpos + result;
end;

procedure tVMADDecoder.getLenString;
var
  sSize: word;
  pS: tVMADString;
begin
  getBufferData(buffer, @sSize, startpos, sizeOf(sSize), bSize);
  pS := tVMADString.create(self, startpos - sizeOf(sSize), sSize, currentPropIndex, currentScriptIndex);
  try
    try
      getBufferData(buffer, @pS.buffer[0], startpos, sSize, bSize);
    except
      pS.free;
    end;
  finally
    bHasStrings := true;
    sList.add(pS);
  end;
end;

function tVMADDecoder.getDataString(l: tstringList; var index: integer): word;
var
  strTmp: string;
begin
  getBufferData(buffer, @result, startpos, sizeOf(result), bSize);

  if result > 0 then
  begin
    SetString(strTmp, PAnsiChar(@buffer[startpos]), result);
    l.add(strTmp);
    index := l.count - 1;
  end;
  startpos := startpos + result;
end;

procedure tVMADDecoder.readVMAD;
var
  i, count: word;
begin
  startpos := 0;
  try
    // VMAD Header
    getBufferData(buffer, @version, startpos, sizeOf(version), bSize);
    // ObjType
    inc(startpos, 2);
    // ScriptCount
    getBufferData(buffer, @count, startpos, sizeOf(count), bSize);
    for i := 1 to count do
    begin
      ReadScript;
      if bBreak then
        exit;
    end;
    //Fragments
    if FragmentID >= 0 then
      case version of
        1 .. 5: readFragment_TES5; // skyrim
        6: readFragment_FO4; // fo4, version = 6
      end;
  except
    bBreak := true;
  end;
end;

procedure tVMADDecoder.ReadScript(bReadName: Boolean = true);
var
  i, pCount: word;
begin
  // ScriptName - skip
  if bReadName then
    getDataString(scriptList, currentScriptIndex); // skipLenString;

  // Status - Skip
  inc(startpos, 1);
  // Prop Count
  getBufferData(buffer, @pCount, startpos, sizeOf(pCount), bSize);
  for i := 1 to pCount do
  begin
    ReadProperties;
    if bBreak then
      exit;
  end;
end;

procedure tVMADDecoder.skipArray(itemSize: cardinal);
var
  aCount: cardinal;
begin
  getBufferData(buffer, @aCount, startpos, sizeOf(aCount), bSize);
  startpos := startpos + itemSize * aCount;
end;

procedure tVMADDecoder.GetStruct;
var
  aCount: cardinal;
  i: integer;
begin
  getBufferData(buffer, @aCount, startpos, sizeOf(aCount), bSize);
  for i := 1 to aCount do
    ReadProperties;
end;

procedure tVMADDecoder.GetArrayStruct;
var
  aCount: cardinal;
  i: integer;
begin
  getBufferData(buffer, @aCount, startpos, sizeOf(aCount), bSize);
  for i := 1 to aCount do
    GetStruct;
end;

procedure tVMADDecoder.getStringArray;
var
  aCount: cardinal;
  i: integer;
begin
  getBufferData(buffer, @aCount, startpos, sizeOf(aCount), bSize);
  for i := 1 to aCount do
    getLenString
end;

procedure tVMADDecoder.ReadProperties;
var
  pType: byte;
begin
  // PropName
  getDataString(propList, currentPropIndex); // skipLenString;

  // Prop type
  getBufferData(buffer, @pType, startpos, sizeOf(pType), bSize);
  // status -Skip
  inc(startpos, 1);
  case pType of
    0: ;
    1: startpos := startpos + 8;
    2: getLenString; // PropString
    3: startpos := startpos + 4; // int - skip
    4: startpos := startpos + 4; // float - skip
    5: startpos := startpos + 1; // bool - skip
    // 6: GetStruct; // FO4; Unknown behavior, skip it
    7: GetStruct; // FO4;
    11: skipArray(8);
    12: getStringArray; // PropString
    13: skipArray(4);
    14: skipArray(4);
    15: skipArray(1);
    17: GetArrayStruct; // FO4
  else bBreak := true;
  end;
end;

// ========================
procedure tVMADDecoder.readFragment_TES5;
var
  fCount, aCount, asCount: word;
  i, j: integer;
begin
  if (startpos >= bSize) or (FragmentID <> 4) then
    exit;
  inc(startpos, 1); // skip
  getBufferData(buffer, @fCount, startpos, sizeOf(fCount), bSize);
  skipLenString;
  // fragments
  for i := 1 to fCount do
  begin
    inc(startpos, 9);
    skipLenString;
    skipLenString;
  end;
  // Alias
  getBufferData(buffer, @aCount, startpos, sizeOf(aCount), bSize);
  for i := 1 to aCount do
  begin
    inc(startpos, 12);
    getBufferData(buffer, @asCount, startpos, sizeOf(asCount), bSize);
    for j := 1 to asCount do
      ReadScript;
  end;
end;

procedure tVMADDecoder.readFragment_FO4;
begin
  if startpos >= bSize then
    exit;
  case FragmentID of
    0: begin // PERK
        inc(startpos, 1);
        ReadScript;
      end;
    1 .. 3: begin // PACK - SCEN  - INFO
        inc(startpos, 2);
        ReadScript;
      end;
    4: readFragmentQuest_FO4;
  end;
end;

procedure tVMADDecoder.readFragmentQuest_FO4;
var
  fCount, aCount, asCount: word;
  sSize: word;
  i, j: integer;
begin
  inc(startpos, 1); // skip
  getBufferData(buffer, @fCount, startpos, sizeOf(fCount), bSize);
  sSize := getDataString(scriptList, currentScriptIndex);
  if sSize > 0 then
    ReadScript(false);
  // fragments
  for i := 1 to fCount do
  begin
    inc(startpos, 9);
    skipLenString;
    skipLenString;
  end;
  // Alias
  getBufferData(buffer, @aCount, startpos, sizeOf(aCount), bSize);
  for i := 1 to aCount do
  begin
    inc(startpos, 12);
    getBufferData(buffer, @asCount, startpos, sizeOf(asCount), bSize);
    for j := 1 to asCount do
      ReadScript;
  end;
end;

// ------------Exporter--------------------
Procedure tVMADDecoder.exportData;
var
  j: integer;
  sVMAD: tVMADString;
  sk: tSkyStr;
  startPos_Out, lastPos_In: integer;
begin
  startPos_Out := 0;
  lastPos_In := 0;
  for j := 0 to pred(sList.count) do
  begin
    sVMAD := sList[j];
    sk := sVMAD.sk;
    if not sk.lockedStatus then
    begin
      SetLength(tfield(field).buffer, startPos_Out + (sVMAD.startpos - lastPos_In));
      move(buffer[lastPos_In], tfield(field).buffer[startPos_Out], ((sVMAD.startpos) - lastPos_In));
      startPos_Out := length(tfield(field).buffer);
      WriteBufferVMADutf8(sk.strans, tfield(field).buffer, startPos_Out);
      lastPos_In := sVMAD.startpos + (length(sVMAD.buffer) + 2);
      startPos_Out := length(tfield(field).buffer);
    end;
  end;
  // copy last part after if the field has been rebuilt
  if startPos_Out > 0 then
  begin
    SetLength(tfield(field).buffer, startPos_Out + (length(buffer) - lastPos_In));
    move(buffer[lastPos_In], tfield(field).buffer[startPos_Out], length(buffer) - lastPos_In);
    // update Field Header
    tfield(field).Header.dsize := length(tfield(field).buffer);
  end;
end;

end.
