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

unit TESVT_scriptPex;

interface

uses Classes, sysUtils, Dialogs, VirtualTrees, comCtrls, math, TESVT_fstreamsave, TESVT_Const, TESVT_Ressources, Generics.Collections,
  TESVT_Utils;

type
  rPexheader = packed record
    v1, v2: byte;
    v3: word;
    timeData: uInt64;
  end;

  rPex = record
    s: string;
    auth, seen, warn: boolean;
  end;

  pPex = ^rPex;

  // pexClasses

  TpexVarData = class
    ident: byte;
    value: variant;
    constructor init;
    function getStrValue(addEqual: boolean = false): string;
  end;

  TpexStruct = class
    name: string;
    vList: tlist;
    constructor init(n: string);
    destructor Destroy; Override;
  end;

  TpexVar = class
    name, vType, sDoc: string;
    flag: cardinal;
    data: TpexVarData;
    constructor init(n, v, d: string; f: cardinal);
    destructor Destroy; Override;
  end;

  TpexVarType = class
    name, vType: string;
    constructor init(n, v: string);
  end;

  TpexOp = class
    opCode: byte;
    args: tlist; // list of TpexVarData
    constructor init(op: byte);
    destructor Destroy; Override;
  end;

  TpexFunc = class
  private
    rtype: string;
  public
    name, docString: string;
    uflags: cardinal;
    flags: byte;
    params: tlist;
    locals: tlist;
    instructions: tlist;
    open: boolean;
    constructor init;
    destructor Destroy; Override;
    function getReturnType: string;
    property returnType: string read getReturnType write rtype;
  end;

  TpexProp = class
  public
    name, pType, docString: string;
    AutoVarName: string;
    uflags: cardinal;
    flags: byte;
    readHandler: TpexFunc;
    writeHandler: TpexFunc;
    // function getautoVarName:string;
    constructor init(n, p, d: string; uf: cardinal; f: byte);
    destructor Destroy; Override;
    // property autoVarName: string read getautoVarName write fautoVarName;
  end;

  TPexState = class
    name: string;
    func: tlist;
    open: boolean;
    constructor init(n: string);
    destructor Destroy; Override;
  end;

  TPexGuard = class
    name: string;
    open: boolean;
    constructor init(n: string);
  end;

  TpexObject = class
    name: string;
    parentClassName: string; // extend
    docString: string;
    userFlags: cardinal;
    autoStateName: string;
    struct: tlist;
    variables: tlist;
    properties: tlist;
    states: tlist;
    guard: tlist;
    constructor init(n: string);
    destructor Destroy; Override;
  end;

  tpexObjLine = class
    datatype: byte; // type of data
    pdata: pointer;
    sFeedback: string;
    constructor init(data: byte; p: pointer; s: string);
  end;

  tpexFeedbackData = class
    header: tstringlist;
    LineList: tlist;
    varOpen, propOpen, structOpen, guardOpen: boolean;
    constructor init;
    destructor Destroy; Override;
    procedure reset;
    procedure clearLineList;
  end;

  tPexDecompiler = class
  private
    forcedLoadCp: word;
    headerPexBuffer, dataPexBuffer: tbytes;
    pexObjList: tlist;
    internalIdentList: tstringlist;
    globalIdentList: tstringlist;
    pexGlobalVarsList: tlist<word>;
    pexGlobalStrList: tlist<word>;
    iPexByteOrder: integer;
    iPexVersion: word;
    fbDiscardNoAuth: boolean;
    i64DataStart: int64;
    pexname: string;
    procedure stringAuthProc(fstream: tstream);
    procedure checkdebug(fstream: tstream);
    procedure checkUserFlags(fstream: tstream);
    procedure checkObjects(fstream: tstream);
    procedure checkObjectData(fstream: tstream; size: integer; pObj: TpexObject);
    procedure drawFunction(pfunc: TpexFunc; tabStr: string);
    procedure drawInstruction(tabStr: string; locals: tlist; pOp: TpexOp);
    function idIsValid(id: word): boolean;
    procedure setNoTrans(id: word; fstream: tstream);
    function checkProcNoTrans(t: tstringlist): boolean;
    procedure globalNoTransCheckList;
    function checkVariableData(fstream: tstream; refID: integer; getIdentId, warnCompare: boolean; var procId: integer; pVarData: TpexVarData): integer;
    procedure checkVariables(fstream: tstream; i: integer; strlabel: string; varlist: tlist; useDocString: boolean = false);
    procedure checkStruct(fstream: tstream; i: integer; strlabel: string; pObj: TpexObject);
    procedure checkVariabletype(fstream: tstream; l: tlist);
    procedure checkInstructions(fstream: tstream; l: tlist; id: integer);
    procedure checkFunction(fstream: tstream; getFirst: boolean; id: integer; pfunc: TpexFunc);
    function getDocString(s: string): string;
    procedure pexLogAddLine(d: byte; p: pointer; s: string);
    function getVarType(vName: string; locals: tlist): string;
    function getArg(pOp: TpexOp; id: integer): string;
    function setMethodResult(s: string): string;
    function includeNewArray(s, l: string): string;
    function getMethodArgs(pOp: TpexOp; startId: integer): string;
    function readValue_Word(fstream: tstream): word;
    function readValue_Int(fstream: tstream): integer;
    function readValue_float(fstream: tstream): single;
    function ReadValue_String(fstream: tstream): string;
    procedure pexLogClear;
    procedure dumpdata(fstream: tstream);
    function cleanVarStr(s: string): string;
  public
    pFbData: tpexFeedbackData;
    pexStringList: tlist;
    fExportStream: tmemoryStream;
    function hasAuthString: boolean;
    constructor create(filename: string);
    destructor Destroy; Override;
    procedure clearList;
    procedure decompilationFeedback;
    function readPex(fstream: tstream; bDiscardNoAuth: boolean): boolean;
    function dosavePex(t: tstringlist; filename: string): boolean;
  end;

procedure SavePexFiletoTmp(fstream: tmemoryStream; bAuth: boolean; filename: string);

const
  // info on http://www.uesp.net/wiki/Tes5Mod:Compiled_Script_File_Format
  tagLineOpen: array [0 .. 1] of string = ('[+]', '[-]');
  // headerPex: cardinal = $DEC057FA;

  headerPex1: cardinal = $FA57C0DE;
  headerPex2: cardinal = $DEC057FA;

  extendedproc = [$17, $18, $19, $30, $31, $32];
  getIdProc = [$0D, $17, $18, $19, $24, $2F, $30, $31, $32];
  compareProc = [$0F .. $13];
  instructionData: array [0 .. $32] of integer = (0, 3, 3, 3, 3, 3, 3, 3, 3, 3, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 1, 2, 2, 4, 3, 4, 1, 3, 3, 3, 2, 2, 3, 3, 4, 4, 3, 1, 3, 3, 5, 5, 3,
    3, 1, 3, 1, 6, 1, 1, 2);
  // fallout4 new OP

implementation

function getCodepagepexOnload: word;
var
  forceCp: string;
begin
  result:= 65001;
  if bAllowPexCodepage then
  begin
    forceCp:= bforceCpOnLoad;
    if forceCp = 'utf8' then
      result:= 65001
    else
      result:= strtointdef(forceCp, 65001);
  end;
end;

function getCodepagepexOnSave: word;
var
  forceCp: string;
begin
  result:= 65001;
  if bAllowPexCodepage then
  begin
    forceCp:= bforceCpOnSave;
    if forceCp = 'utf8' then
      result:= 65001
    else
      result:= strtointdef(forceCp, 65001);
  end;
end;

// -pex Classe
constructor TpexObject.init(n: string);
begin
  name:= n;
  variables:= tlist.create;
  properties:= tlist.create;
  states:= tlist.create;
  guard:= tlist.create;
  struct:= tlist.create;
end;

destructor TpexObject.Destroy;
var
  i: integer;
begin
  for i:= 0 to variables.Count - 1 do
    TpexVar(variables[i]).Free;
  for i:= 0 to properties.Count - 1 do
    TpexVar(properties[i]).Free;
  for i:= 0 to states.Count - 1 do
    TpexVar(states[i]).Free;
  for i:= 0 to struct.Count - 1 do
    TpexStruct(struct[i]).Free;
  for i:= 0 to guard.Count - 1 do
    TPexGuard(guard[i]).Free;

  variables.Free;
  properties.Free;
  states.Free;
  struct.Free;
  guard.Free;
  inherited;
end;

// tpexstruct
constructor TpexStruct.init(n: string);
begin
  name:= n;
  vList:= tlist.create;
end;

destructor TpexStruct.Destroy;
var
  i: integer;
begin
  for i:= 0 to vList.Count - 1 do
    TpexVar(vList[i]).Free;
  vList.Free;
  inherited;
end;

// -----
constructor tpexFeedbackData.init;
begin
  header:= tstringlist.create;
  LineList:= tlist.create;
  varOpen:= true;
  structOpen:= true;
  propOpen:= true;
  guardOpen:= true;
end;

destructor tpexFeedbackData.Destroy;
begin
  clearLineList;
  header.Free;
  LineList.Free
end;

procedure tpexFeedbackData.reset;
begin
  header.clear;
  clearLineList;
  varOpen:= true;
  propOpen:= true;
end;

procedure tpexFeedbackData.clearLineList;
var
  i: integer;
begin
  for i:= 0 to LineList.Count - 1 do
    tpexObjLine(LineList[i]).Free;
  LineList.clear;
end;

constructor tpexObjLine.init(data: byte; p: pointer; s: string);
begin
  datatype:= data; // type of data
  pdata:= p;
  sFeedback:= s;
end;

constructor TpexVarData.init;
begin
  ident:= 0;
  value:= 0;
end;

function TpexVarData.getStrValue(addEqual: boolean = false): string;
var
  tag: string;
begin
  if addEqual then
    tag:= '= '
  else
    tag:= '';
  case ident of
    0:
      if not addEqual then
        result:= 'none'
      else
        result:= '';
    1: result:= format('%s%s', [tag, string(value)]);
    2: result:= format('%s"%s"', [tag, string(value)]);
    3: result:= format('%s%d', [tag, integer(value)]);
    4: result:= format('%s%.4f', [tag, single(value)]);
    5: result:= format('%s%s', [tag, booltostr(boolean(value), true)]);
  end;
end;

// ---------
constructor TpexVarType.init(n, v: string);
begin
  name:= n;
  vType:= v;
end;

// -----------
constructor TpexVar.init(n, v, d: string; f: cardinal);
begin
  name:= n;
  vType:= v;
  sDoc:= d;
  flag:= f;
  data:= TpexVarData.init;
end;

destructor TpexVar.Destroy;
begin
  data.Free;
end;

// -----------
constructor TpexOp.init(op: byte);
begin
  opCode:= op;
  args:= tlist.create;
end;

destructor TpexOp.Destroy;
var
  i: integer;
begin
  for i:= 0 to args.Count - 1 do
    TpexVarData(args[i]).Free;
  args.Free;
end;

constructor TpexFunc.init;
begin
  name:= '';
  returnType:= '';
  docString:= '';
  uflags:= 0;
  flags:= 0;
  open:= true;
  params:= tlist.create;
  locals:= tlist.create;
  instructions:= tlist.create;
end;

function TpexFunc.getReturnType: string;
begin
  if rtype = 'None' then
    result:= ''
  else
    result:= rtype + ' ';
end;

destructor TpexFunc.Destroy;
var
  i: integer;
begin
  for i:= 0 to params.Count - 1 do
    TpexVarData(params[i]).Free;
  for i:= 0 to locals.Count - 1 do
    TpexVarData(locals[i]).Free;
  for i:= 0 to instructions.Count - 1 do
    TpexOp(instructions[i]).Free;

  params.Free;
  locals.Free;
  instructions.Free;
end;

constructor TpexProp.init(n, p, d: string; uf: cardinal; f: byte);
begin
  name:= n;
  pType:= p;
  docString:= d;
  uflags:= uf;
  flags:= f;
  AutoVarName:= '';
  readHandler:= nil;
  writeHandler:= nil;
end;

destructor TpexProp.Destroy;
begin
  readHandler.Free;
  writeHandler.Free;
end;

constructor TPexGuard.init(n: string);
begin
  name:= n;
  open:= true;
end;

constructor TPexState.init(n: string);
begin
  name:= n;
  open:= true;
  func:= tlist.create;
end;

destructor TPexState.Destroy;
var
  i: integer;
begin
  for i:= 0 to func.Count - 1 do
    TpexFunc(func[i]).Free;
  func.Free;
end;

// ----------------------------------
Constructor tPexDecompiler.create(filename: string);
begin
  iPexByteOrder:= 1;
  forcedLoadCp:= getCodepagepexOnload;
  pexStringList:= tlist.create;
  internalIdentList:= tstringlist.create;
  globalIdentList:= tstringlist.create;
  pexGlobalVarsList:= tlist<word>.create;
  pexGlobalStrList:= tlist<word>.create;
  globalIdentList.Sorted:= true;
  globalIdentList.Duplicates:= dupIgnore;
  pexObjList:= tlist.create;
  fExportStream:= tmemorystream.Create;
  pFbData:= tpexFeedbackData.init;
  pexname:= filename;
end;

function tPexDecompiler.hasAuthString: boolean;
var
  i: integer;
begin
  result:= false;
  for i:= 0 to pexStringList.Count - 1 do
    if pPex(pexStringList[i]).auth then
      exit(true);
end;

procedure tPexDecompiler.clearList;
var
  i: integer;
begin
  for i:= 0 to pexStringList.Count - 1 do
    dispose(pPex(pexStringList[i]));
  pexStringList.clear;
  for i:= 0 to pexObjList.Count - 1 do
    TpexObject(pexObjList[i]).Free;
  pexObjList.clear;
  SetLength(headerPexBuffer, 0);
  SetLength(dataPexBuffer, 0);
  pexLogClear;
  pexGlobalVarsList.clear;
  pexGlobalStrList.clear;
  globalIdentList.clear;
  pFbData.reset;
end;

Destructor tPexDecompiler.Destroy;
begin
  clearList;
  pexStringList.Free;
  internalIdentList.Free;
  pexGlobalVarsList.Free;
  pexGlobalStrList.Free;
  globalIdentList.Free;
  pexObjList.Free;
  pFbData.Free;
  fExportStream.Free;
end;

// --------------

function tPexDecompiler.readValue_Word(fstream: tstream): word;
begin
  fstream.read(result, 2);
  result:= SwapEndian16u(iPexByteOrder, result);
end;

function tPexDecompiler.readValue_Int(fstream: tstream): integer;
begin
  fstream.read(result, 4);
  result:= SwapEndian32(iPexByteOrder, result);
end;

function tPexDecompiler.readValue_float(fstream: tstream): single;
var
  tmp: single;
begin
  fstream.read(tmp, 4);
  result:= SwapEndian32f(iPexByteOrder, tmp);
end;

{ function tPexDecompiler.ReadValue_String(fstream: tstream): string;
  var
  len: word;
  s: rawbyteString;
  begin
  SetLength(s, 0);
  len:= readValue_Word(fstream);
  SetLength(s, len);
  fstream.ReadBuffer(s[1], len);
  result:= UTF8toString(s);
  end;
}

procedure tPexDecompiler.dumpdata(fstream: tstream);
var
  i: integer;
  b: byte;
  dump: string;
begin
  dofeedback(format('fStream.pos=%d', [fstream.position]));
  fstream.position:= fstream.position - 10;
  for i:= 1 to 100 do
  begin
    if fstream.position < fstream.size then
    begin
      fstream.read(b, 1);
      dump:= dump + inttohex(b, 2) + ' ';
      if (i mod 10 = 0) then
        dump:= dump + #13;
    end;
  end;
  dofeedback('dump:' + #13 + dump, false);
end;

function tPexDecompiler.ReadValue_String(fstream: tstream): string;
var
  len: word;
  s: tbytes;
begin
  SetLength(s, 0);
  len:= readValue_Word(fstream);
  SetLength(s, len);
  fstream.ReadBuffer(s[0], len);
  try
    result:= getEncodingString(forcedLoadCp,s) ;
  except
    result:= '<<Codepage Error>>';
  end;
end;

function tPexDecompiler.readPex(fstream: tstream; bDiscardNoAuth: boolean): boolean;
var
  endPos: int64;
  h: cardinal;
  dataLen: int64;
  tmpStr: string;
  tableCount: word;
  r: rPexheader;
  p: pPex;
begin
  fbDiscardNoAuth:= bDiscardNoAuth;
  result:= false;
  endPos:= fstream.size;
  fstream.position:= 0;
  ProgressBar.Max:= Int64Rec(endPos).lo;
  try
    // header
    fstream.read(h, 4);
    if (h = headerPex1) or (h = headerPex2) then
    begin
      fstream.read(r, sizeOf(r));
      pFbData.header.add(format('PapyrusVersion: %d.%d - %.4x - (TimeData: %.16x)', [r.v1, r.v2, r.v3, r.timeData]));

      iPexVersion:= r.v3;
      if iPexVersion = $0100 then
        iPexByteOrder:= 1
      else
        iPexByteOrder:= 2;

      // psc/user/machine
      tmpStr:= ReadValue_String(fstream);
      pFbData.header.add(format('Script: %s', [tmpStr]));
      tmpStr:= ReadValue_String(fstream);
      // pFbData.header.add(format('User: %s', [tmpStr]));
      tmpStr:= ReadValue_String(fstream);
      // pFbData.header.add(format('Computer: %s', [tmpStr]));
      // -tablecount
      tableCount:= readValue_Word(fstream);
      pFbData.header.add(format('StringTableCount: %d', [tableCount]));
      // storing Header;
      SetLength(headerPexBuffer, fstream.position);
      fstream.position:= 0;
      fstream.ReadBuffer(headerPexBuffer[0], length(headerPexBuffer));
      // stringtable
      while (fstream.position < endPos) and (tableCount > 0) do
      begin
        new(p);
        p.s:= ReadValue_String(fstream);
        p.auth:= true;
        p.warn:= false;
        p.seen:= false;
        pexStringList.add(p);
        dec(tableCount);
      end;
      // storing Data
      i64DataStart:= fstream.position;
      dataLen:= endPos - i64DataStart;
      SetLength(dataPexBuffer, dataLen);
      fstream.ReadBuffer(dataPexBuffer[0], dataLen);
      // -----------
      fstream.position:= i64DataStart;
      stringAuthProc(fstream);

      if fbDiscardNoAuth and not hasAuthString then
        exit(false);
      // ---
      decompilationFeedback;
      // ----------
      result:= true;
    end;
  except
    On E: Exception do
      dofeedback(E.Message, true);
  end;
end;

// strAuth
function tPexDecompiler.idIsValid(id: word): boolean;
begin
  result:= id < pexStringList.Count;
  if result then
    pPex(pexStringList[id]).seen:= true;
end;

procedure tPexDecompiler.setNoTrans(id: word; fstream: tstream);
begin
  if idIsValid(id) then
    pPex(pexStringList[id]).auth:= false
  else
  begin
    dofeedback(pexname, false);
    dumpdata(fstream);
    Raise Exception.create(formatres('fbk_pexError', [getres('fbk_pexErrorDetail2')]));
  end;
end;

function tPexDecompiler.checkProcNoTrans(t: tstringlist): boolean;
var
  i, index: integer;
begin
  for i:= 0 to t.Count - 1 do
    if pexNoTransProcList.Find(t[i], index) then
      exit(true);
  result:= false;
end;

procedure tPexDecompiler.globalNoTransCheckList;
var
  i, index: integer;
begin
  for i:= 0 to pexGlobalVarsList.Count - 1 do
  begin
    if not pPex(pexStringList[pexGlobalStrList[i]]).seen then
    begin
      pPex(pexStringList[pexGlobalStrList[i]]).auth:= bPexUnLockGlobalVar; //
      pPex(pexStringList[pexGlobalStrList[i]]).warn:= bPexUnLockGlobalVar;
    end;
    if not pPex(pexStringList[pexGlobalStrList[i]]).auth then
      continue;
    if globalIdentList.Find(pPex(pexStringList[pexGlobalVarsList[i]]).s, index) then
    begin
      pPex(pexStringList[pexGlobalStrList[i]]).auth:= bPexUnLockGlobalVar;
      pPex(pexStringList[pexGlobalStrList[i]]).warn:= bPexUnLockGlobalVar;
    end;
  end;
end;

procedure tPexDecompiler.stringAuthProc(fstream: tstream);
var
  tmpByte: byte;
begin
  try
    // debug
    fstream.read(tmpByte, 1);
    if tmpByte = 1 then
      checkdebug(fstream);
    checkUserFlags(fstream);
    checkObjects(fstream);
    // -----locked global/assigned var
    globalNoTransCheckList;

  except
    On E: Exception do
      dofeedback(E.Message, true);
  end;
end;

procedure tPexDecompiler.checkdebug(fstream: tstream);
var
  tmpByte: byte;
  tmp64: int64;
  tmp32: cardinal;
  tableCount, tmp, tmpCount: word;
  i: integer;
begin
  pFbData.header.add(strSeparator);
  fstream.read(tmp64, 8);
  // func
  tableCount:= readValue_Word(fstream);
  pFbData.header.add(format('debugFuncCount: %d', [tableCount]));
  for i:= 1 to tableCount do
  begin
    tmp:= readValue_Word(fstream);
    setNoTrans(tmp, fstream);
    if pexDrawDebug then
      pFbData.header.add(format('%.2x' + #9 + 'Object: %s', [i, pPex(pexStringList[tmp]).s]));
    tmp:= readValue_Word(fstream);
    setNoTrans(tmp, fstream);
    if pexDrawDebug then
      pFbData.header.add(format(#9 + 'State: "%s"', [pPex(pexStringList[tmp]).s]));
    tmp:= readValue_Word(fstream);
    setNoTrans(tmp, fstream);
    if pexDrawDebug then
      pFbData.header.add(format(#9 + 'Function: %s', [pPex(pexStringList[tmp]).s]));
    fstream.read(tmpByte, 1);
    tmpCount:= readValue_Word(fstream);
    if pexDrawDebug then
      pFbData.header.add(format(#9 + 'FunctionType: %d - DataCount: %d', [tmpByte, tmpCount]));
    fstream.Seek(tmpCount * 2, soCurrent);
  end;

  if iPexByteOrder = 2 then
  begin
    // group
    tableCount:= readValue_Word(fstream);
    pFbData.header.add(format('debugpropGroupCount: %d', [tableCount]));
    for i:= 1 to tableCount do
    begin
      tmp:= readValue_Word(fstream);
      setNoTrans(tmp, fstream);
      if pexDrawDebug then
        pFbData.header.add(format('%.2x' + #9 + 'Object: %s', [i, pPex(pexStringList[tmp]).s]));
      tmp:= readValue_Word(fstream);
      setNoTrans(tmp, fstream);
      if pexDrawDebug then
        pFbData.header.add(format(#9 + 'State: "%s"', [pPex(pexStringList[tmp]).s]));
      tmp:= readValue_Word(fstream);
      setNoTrans(tmp, fstream);
      if pexDrawDebug then
        pFbData.header.add(format(#9 + 'Function: %s', [pPex(pexStringList[tmp]).s]));
      fstream.read(tmp32, 4);
      tmpCount:= readValue_Word(fstream);
      if pexDrawDebug then
        pFbData.header.add(format(#9 + 'Type: %d - propCount: %d', [tmp32, tmpCount]));
      fstream.Seek(tmpCount * 2, soCurrent);
    end;
    // structorder
    tableCount:= readValue_Word(fstream);
    pFbData.header.add(format('debugStructCount: %d', [tableCount]));
    for i:= 1 to tableCount do
    begin
      tmp:= readValue_Word(fstream);
      setNoTrans(tmp, fstream);
      if pexDrawDebug then
        pFbData.header.add(format('%.2x' + #9 + 'Object: %s', [i, pPex(pexStringList[tmp]).s]));
      tmp:= readValue_Word(fstream);
      setNoTrans(tmp, fstream);
      if pexDrawDebug then
        pFbData.header.add(format(#9 + 'State: "%s"', [pPex(pexStringList[tmp]).s]));
      tmpCount:= readValue_Word(fstream);
      if pexDrawDebug then
        pFbData.header.add(format(#9 + 'structCount: %d', [tmpCount]));
      fstream.Seek(tmpCount * 2, soCurrent);
    end;
  end;
end;

procedure tPexDecompiler.checkUserFlags(fstream: tstream);
var
  tmpByte: byte;
  tableCount, tmp: word;
  i: integer;
begin
  pFbData.header.add(strSeparator);
  tableCount:= readValue_Word(fstream);
  pFbData.header.add(format('userFlagsCount: %d', [tableCount]));
  for i:= 1 to tableCount do
  begin
    tmp:= readValue_Word(fstream);
    setNoTrans(tmp, fstream);
    fstream.read(tmpByte, 1);
    pFbData.header.add(format(#9 + '%s %d', [pPex(pexStringList[tmp]).s, tmpByte]));
  end;
end;

procedure tPexDecompiler.checkObjects(fstream: tstream);
var
  tmpSize: integer;
  tableCount, tmp: word;
  i: integer;
  pObj: TpexObject;
begin
  tableCount:= readValue_Word(fstream);
  for i:= 1 to tableCount do
  begin
    tmp:= readValue_Word(fstream);
    setNoTrans(tmp, fstream);
    tmpSize:= readValue_Int(fstream) - 4;
    pObj:= TpexObject.init(pPex(pexStringList[tmp]).s);
    pexObjList.add(pObj);
    checkObjectData(fstream, tmpSize, pObj);
  end;
end;

function tPexDecompiler.checkVariableData(fstream: tstream; refID: integer; getIdentId, warnCompare: boolean; var procId: integer; pVarData: TpexVarData): integer;
var
  vflag, tmpByte: byte;
  tmp: word;
  tmpFloat: single;
begin
  result:= 0;
  // typeflag
  fstream.read(vflag, 1);
  pVarData.ident:= vflag;
  case vflag of
    1:
      begin
        tmp:= readValue_Word(fstream); // identifier
        setNoTrans(tmp, fstream);
        pVarData.value:= pPex(pexStringList[tmp]).s;
        if getIdentId then
        begin
          internalIdentList.add(ansilowercase(pPex(pexStringList[tmp]).s));
          procId:= tmp;
        end;
      end;
    2:
      begin
        tmp:= readValue_Word(fstream);
        if idIsValid(tmp) then
        begin
          pVarData.value:= pPex(pexStringList[tmp]).s;
          if refID >= 0 then
          begin
            pexGlobalVarsList.add(refID);
            pexGlobalStrList.add(tmp)
          end
          else if getIdentId then
            pPex(pexStringList[tmp]).auth:= false;

          if warnCompare then
            pPex(pexStringList[tmp]).warn:= true;
        end
        else
        begin
          dumpdata(fstream);
          Raise Exception.create(formatres('fbk_pexError', [getres('fbk_pexErrorDetail2')]));
        end;
      end;
    3:
      begin
        result:= readValue_Int(fstream); // int
        pVarData.value:= result;
      end;
    4:
      begin
        tmpFloat:= readValue_float(fstream);
        pVarData.value:= tmpFloat;
      end;
    5:
      begin
        fstream.read(tmpByte, 1); // byte
        pVarData.value:= boolean(tmpByte);
      end;
  end;
end;

procedure tPexDecompiler.checkVariables(fstream: tstream; i: integer; strlabel: string; varlist: tlist; useDocString: boolean = false);
var
  procId: integer;
  tmpInt: cardinal;
  tmp1, tmp2, tmp3: word;
  pVar: TpexVar;
  tmpByte: byte;
begin
  // name
  tmp1:= readValue_Word(fstream);
  setNoTrans(tmp1, fstream);
  // typename
  tmp2:= readValue_Word(fstream);
  setNoTrans(tmp2, fstream);
  // uFlags
  fstream.read(tmpInt, 4);
  // val
  pVar:= TpexVar.init(pPex(pexStringList[tmp1]).s, pPex(pexStringList[tmp2]).s, '', tmpInt);
  varlist.add(pVar);
  checkVariableData(fstream, tmp1, false, false, procId, pVar.data);

  if iPexByteOrder = 2 then
  begin
    // group
    fstream.read(tmpByte, 1);
    if useDocString then // used for struct
    begin
      // typename
      tmp3:= readValue_Word(fstream);
      setNoTrans(tmp3, fstream);
      pVar.sDoc:= pPex(pexStringList[tmp3]).s
    end;
  end;
end;

procedure tPexDecompiler.checkStruct(fstream: tstream; i: integer; strlabel: string; pObj: TpexObject);
var
  tmp1, varCount: word;
  pStruct: TpexStruct;
begin
  // name
  tmp1:= readValue_Word(fstream);
  setNoTrans(tmp1, fstream);
  pStruct:= TpexStruct.init(pPex(pexStringList[tmp1]).s);
  pObj.struct.add(pStruct);

  // variable
  varCount:= readValue_Word(fstream);
  for i:= 1 to varCount do
    checkVariables(fstream, i, '', pStruct.vList, true);
end;

procedure tPexDecompiler.checkVariabletype(fstream: tstream; l: tlist);
var
  tmp1, tmp2: word;
begin
  // name
  tmp1:= readValue_Word(fstream);
  setNoTrans(tmp1, fstream);
  // type
  tmp2:= readValue_Word(fstream);
  setNoTrans(tmp2, fstream);
  l.add(TpexVarType.init(pPex(pexStringList[tmp1]).s, pPex(pexStringList[tmp2]).s));
end;

procedure tPexDecompiler.checkInstructions(fstream: tstream; l: tlist; id: integer);
var
  vflag: byte;
  nbArgs, i, extraArg, procId, getAssignVar: integer;
  getIdentId: boolean;
  pOp: TpexOp;
  pVarData: TpexVarData;
begin
  extraArg:= 0;
  internalIdentList.clear;
  // flag------------------------
  fstream.read(vflag, 1);
  if vflag > high(instructionData) then
    Raise Exception.create(formatres('fbk_pexError', [getres('fbk_pexErrorDetail1')]));
  // -----------------------------
  pOp:= TpexOp.init(vflag);
  l.add(pOp);
  nbArgs:= instructionData[vflag];

  getAssignVar:= -1;
  getIdentId:= (vflag in getIdProc);
  // ----parse var data
  for i:= 1 to nbArgs do
  begin
    pVarData:= TpexVarData.init;
    pOp.args.add(pVarData);
    procId:= -1;
    extraArg:= checkVariableData(fstream, getAssignVar, getIdentId, vflag in compareProc, procId, pVarData);
    // proc_assign
    // if (vflag in [$0D, $30, $31, $32]) and (procId >= 0) then
    if (vflag in [$0D]) and (procId >= 0) then
      getAssignVar:= procId;
  end;
  // callmethod
  if (vflag in extendedproc) then
  begin
    getIdentId:= checkProcNoTrans(internalIdentList);
    for i:= 1 to extraArg do
    begin
      pVarData:= TpexVarData.init;
      pOp.args.add(pVarData);
      procId:= -1;
      checkVariableData(fstream, -1, getIdentId, false, procId, pVarData);
      if (procId >= 0) then
        globalIdentList.add(pPex(pexStringList[procId]).s);
    end;
  end;
  internalIdentList.clear;
  ProgressBar.position:= Int64Rec(fstream.position).lo;
end;

procedure tPexDecompiler.checkFunction(fstream: tstream; getFirst: boolean; id: integer; pfunc: TpexFunc);
var
  tmpByte: byte;
  tmpInt: cardinal;
  tmp1, tmp2, tmp3: word;
  i: integer;
begin
  if getFirst then // only in state
  begin
    tmp1:= readValue_Word(fstream);
    setNoTrans(tmp1, fstream);
    pfunc.name:= pPex(pexStringList[tmp1]).s
  end;
  // return type
  tmp2:= readValue_Word(fstream);
  setNoTrans(tmp2, fstream);
  pfunc.returnType:= pPex(pexStringList[tmp2]).s;
  // doc string
  tmp3:= readValue_Word(fstream);
  setNoTrans(tmp3, fstream);
  pfunc.docString:= pPex(pexStringList[tmp3]).s;
  // uFlags
  fstream.read(tmpInt, 4);
  pfunc.uflags:= tmpInt;
  // Flags
  fstream.read(tmpByte, 1);
  pfunc.flags:= tmpByte;
  // param1 funcparams
  tmp1:= readValue_Word(fstream);
  for i:= 1 to tmp1 do
    checkVariabletype(fstream, pfunc.params);
  // param2  local
  tmp1:= readValue_Word(fstream);
  for i:= 1 to tmp1 do
    checkVariabletype(fstream, pfunc.locals);
  // instructions
  tmp1:= readValue_Word(fstream);
  for i:= 1 to tmp1 do
    checkInstructions(fstream, pfunc.instructions, i);
end;

procedure tPexDecompiler.checkObjectData(fstream: tstream; size: integer; pObj: TpexObject);
var
  vflag: byte;
  tmpInt: cardinal;
  tmpByte: byte;
  tmp1, tmp2, tmp3, varCount, structCount: word;
  i, j: integer;
  pProp: TpexProp;
  pState: TPexState;
  pfunc: TpexFunc;
  pguard: TPexGuard;
begin
  // extend
  tmp1:= readValue_Word(fstream);
  setNoTrans(tmp1, fstream);
  pObj.parentClassName:= pPex(pexStringList[tmp1]).s;
  // docstring
  tmp1:= readValue_Word(fstream);
  setNoTrans(tmp1, fstream);
  pObj.docString:= pPex(pexStringList[tmp1]).s;
  if iPexByteOrder = 2 then
    fstream.read(tmpByte, 1); // uConst -- fallout
  // uFlags
  fstream.read(tmpInt, 4);
  pObj.userFlags:= tmpInt;
  // autoStateName
  tmp1:= readValue_Word(fstream);
  setNoTrans(tmp1, fstream);
  pObj.autoStateName:= pPex(pexStringList[tmp1]).s;

  if iPexByteOrder = 2 then
  begin
    // struct
    structCount:= readValue_Word(fstream);
    for i:= 1 to structCount do
      checkStruct(fstream, i, '', pObj);
  end;

  // variable
  varCount:= readValue_Word(fstream);
  for i:= 1 to varCount do
    checkVariables(fstream, i, '', pObj.variables);

  ProgressBar.position:= Int64Rec(fstream.position).lo;

  if iPexVersion = 4 then
  begin
    varCount:= readValue_Word(fstream); // guard section
    for i:= 1 to varCount do
    begin
      tmp1:= readValue_Word(fstream);
      setNoTrans(tmp1, fstream);
      pguard:= TPexGuard.init(pPex(pexStringList[tmp1]).s);
      pObj.guard.add(pguard);
    end;
  end;

  // properties
  varCount:= readValue_Word(fstream);
  for i:= 1 to varCount do
  begin
    // name
    tmp1:= readValue_Word(fstream);
    setNoTrans(tmp1, fstream);
    // typename
    tmp2:= readValue_Word(fstream);
    setNoTrans(tmp2, fstream);
    // doc
    tmp3:= readValue_Word(fstream);
    setNoTrans(tmp3, fstream);
    // uFlags
    fstream.read(tmpInt, 4);
    // flag
    fstream.read(vflag, 1);
    pProp:= TpexProp.init(pPex(pexStringList[tmp1]).s, pPex(pexStringList[tmp2]).s, pPex(pexStringList[tmp3]).s, tmpInt, vflag);
    pObj.properties.add(pProp);

    // auto var
    if vflag and 4 <> 0 then
    begin
      tmp1:= readValue_Word(fstream);
      setNoTrans(tmp1, fstream);
      pProp.AutoVarName:= pPex(pexStringList[tmp1]).s;
    end;
    // read
    if vflag and 5 = 1 then
    begin
      pProp.readHandler:= TpexFunc.init;
      checkFunction(fstream, false, 1, pProp.readHandler);
    end;
    // write
    if vflag and 6 = 2 then
    begin
      pProp.writeHandler:= TpexFunc.init;
      checkFunction(fstream, false, 1, pProp.writeHandler);
    end;
    ProgressBar.position:= Int64Rec(fstream.position).lo;
  end;

  // states
  varCount:= readValue_Word(fstream);
  for i:= 1 to varCount do
  begin
    // statesname
    tmp1:= readValue_Word(fstream);
    setNoTrans(tmp1, fstream);
    pState:= TPexState.init(pPex(pexStringList[tmp1]).s);
    pObj.states.add(pState);
    // function
    tmp1:= readValue_Word(fstream);
    for j:= 1 to tmp1 do
    begin
      pfunc:= TpexFunc.init;
      pState.func.add(pfunc);
      checkFunction(fstream, true, j, pfunc);
    end;
    ProgressBar.position:= Int64Rec(fstream.position).lo;
  end;
end;

function tPexDecompiler.getDocString(s: string): string;
begin
  if s = '' then
    result:= s
  else
    result:= format('{%s}', [s]);
end;

// ------------Decompilation feedback
procedure tPexDecompiler.pexLogClear;
begin
  pFbData.clearLineList;
end;

procedure tPexDecompiler.pexLogAddLine(d: byte; p: pointer; s: string);
begin
  pFbData.LineList.add(tpexObjLine.init(d, p, s));
end;

function tPexDecompiler.cleanVarStr(s: string): string;
begin
  // var: ::name_var
  result:= copy(s, 3, length(s) - 6);
end;

Procedure tPexDecompiler.decompilationFeedback;
var
  i, iVar, iVar2, iFunc: integer;
  pObj: TpexObject;
  pVar: TpexVar;
  pStruct: TpexStruct;
  pProp: TpexProp;
  pState: TPexState;
  pguard: TPexGuard;
  tabStr: string;
begin
  pexLogClear;
  // header
  for i:= 0 to pFbData.header.Count - 1 do
    pexLogAddLine(0, nil, pFbData.header[i]);
  // objects
  pexLogAddLine(0, nil, strSeparator);
  for i:= 0 to pexObjList.Count - 1 do
  begin
    pObj:= pexObjList[i];
    pexLogAddLine(0, nil, format('objectName %s extends %s', [pObj.name, pObj.parentClassName]));
    pexLogAddLine(0, nil, format('autoStateName: "%s"', [pObj.autoStateName]));
    pexLogAddLine(0, nil, format('flags: 0x%.8x', [pObj.userFlags]));
    if pObj.docString <> '' then
      pexLogAddLine(0, nil, format('{%s}', [pObj.docString]));
    // --------
    tabStr:= #9;
    if iPexByteOrder = 2 then
    begin
      // struct
      pexLogAddLine(0, nil, strSeparator);
      pexLogAddLine(22, nil, format('%sStruct [count: %d]', [tagLineOpen[ord(pFbData.structOpen)], pObj.struct.Count]));
      if pFbData.structOpen then
      begin
        for iVar:= 0 to pObj.struct.Count - 1 do
        begin
          tabStr:= #9;
          pStruct:= pObj.struct[iVar];
          pexLogAddLine(5, pStruct, format('%s%.2x %s', [tabStr, iVar, pStruct.name]));
          tabStr:= #9#9;
          for iVar2:= 0 to pStruct.vList.Count - 1 do
          begin
            pVar:= pStruct.vList[iVar2];
            pexLogAddLine(1, pVar, format('%s%.2x %s %s %s', [tabStr, iVar2, pVar.vType, pVar.name, pVar.data.getStrValue(true)]));
          end;
        end;
      end;
      tabStr:= #9;
    end;
    if iPexVersion = 4 then
    begin
      // guard
      pexLogAddLine(0, nil, strSeparator);
      pexLogAddLine(23, nil, format('%sGuard [count: %d]', [tagLineOpen[ord(pFbData.guardOpen)], pObj.guard.Count]));
      if pFbData.guardOpen then
      begin
        for iVar:= 0 to pObj.guard.Count - 1 do
        begin
          tabStr:= #9;
          pguard:= pObj.guard[iVar];
          pexLogAddLine(6, pguard, format('%s%.2x %s', [tabStr, iVar, pguard.name]));
        end;
      end;
      tabStr:= #9;
    end;

    // variables
    pexLogAddLine(0, nil, strSeparator);
    pexLogAddLine(20, nil, format('%svars [count: %d]', [tagLineOpen[ord(pFbData.varOpen)], pObj.variables.Count]));
    if pFbData.varOpen then
    begin
      for iVar:= 0 to pObj.variables.Count - 1 do
      begin
        pVar:= pObj.variables[iVar];
        pexLogAddLine(1, pVar, format('%s%.2x %s %s %s', [tabStr, iVar, pVar.vType, cleanVarStr(pVar.name), pVar.data.getStrValue(true)]));
      end;
    end;
    // properties
    pexLogAddLine(0, nil, strSeparator);
    pexLogAddLine(21, nil, format('%sproperties [count: %d]', [tagLineOpen[ord(pFbData.propOpen)], pObj.properties.Count]));
    if pFbData.propOpen then
    begin
      for iVar:= 0 to pObj.properties.Count - 1 do
      begin
        pProp:= pObj.properties[iVar];

        // simplifiy property
        if (pProp.name = cleanVarStr(pProp.AutoVarName)) then
          pexLogAddLine(2, pProp, format('%s%.2x %s %s  auto const %s', [tabStr, iVar, pProp.pType, pProp.name, getDocString(pProp.docString)]))
        else if pProp.AutoVarName <> '' then
          pexLogAddLine(2, pProp, format('%s%.2x %s %s auto %s %s', [tabStr, iVar, pProp.pType, pProp.name, cleanVarStr(pProp.AutoVarName), getDocString(pProp.docString)]))
        else
          pexLogAddLine(2, pProp, format('%s%.2x %s %s %s', [tabStr, iVar, pProp.pType, pProp.name, getDocString(pProp.docString)]));
        // if getDocString(pProp.docString) <> '' then
        // pexLogAddLine(2, pProp, format('%s %s', [tabStr, getDocString(pProp.docString)]));
        drawFunction(pProp.readHandler, #9#9);
        drawFunction(pProp.writeHandler, #9#9);
      end;
    end;
    // State
    pexLogAddLine(0, nil, strSeparator);
    for iVar:= 0 to pObj.states.Count - 1 do
    begin
      pState:= pObj.states[iVar];
      pexLogAddLine(3, pState, format('%sstate: "%s"', [tagLineOpen[ord(pState.open)], pState.name]));
      if pState.open then
      begin
        if pState.func.Count > 0 then
          for iFunc:= 0 to pState.func.Count - 1 do
            drawFunction(TpexFunc(pState.func[iFunc]), #9);
        pexLogAddLine(0, nil, '   endState');
      end;
    end;
  end;
end;

procedure tPexDecompiler.drawFunction(pfunc: TpexFunc; tabStr: string);
var
  i: integer;
  strParam: string;
begin
  if not assigned(pfunc) then
    exit;
  strParam:= '';
  for i:= 0 to pfunc.params.Count - 1 do
  begin
    strParam:= strParam + format('%s %s', [TpexVarType(pfunc.params[i]).vType, TpexVarType(pfunc.params[i]).name]);
    if i < pfunc.params.Count - 1 then
      strParam:= strParam + ', ';
  end;
  pexLogAddLine(4, pfunc, format('%s%s function %s%s(%s)  %s', [tagLineOpen[ord(pfunc.open)], tabStr, pfunc.returnType, pfunc.name, strParam, getDocString(pfunc.docString)]));

  if pfunc.open then
  begin
    for i:= 0 to pfunc.locals.Count - 1 do
      pexLogAddLine(5, pfunc.locals[i], format('%slocal.%s %s', [tabStr + #9, TpexVarType(pfunc.locals[i]).vType, TpexVarType(pfunc.locals[i]).name]));

    for i:= 0 to pfunc.instructions.Count - 1 do
      drawInstruction(tabStr + #9, pfunc.locals, pfunc.instructions[i]);
    pexLogAddLine(0, nil, tabStr + ' endFunction');
  end;
  pexLogAddLine(0, nil, '');
end;

function tPexDecompiler.getVarType(vName: string; locals: tlist): string;
var
  i: integer;
begin
  for i:= 0 to locals.Count - 1 do
    if TpexVarType(locals[i]).name = vName then
      exit(TpexVarType(locals[i]).vType);
  result:= '';
end;

function tPexDecompiler.getArg(pOp: TpexOp; id: integer): string;
begin
  if id < pOp.args.Count then
    result:= TpexVarData(pOp.args[id]).getStrValue
  else
    result:= '';
end;

function tPexDecompiler.setMethodResult(s: string): string;
begin
  if s = '::NoneVar' then
    result:= ''
  else
    result:= s + ' = '
end;

function tPexDecompiler.includeNewArray(s, l: string): string;
var
  i: integer;
begin
  result:= s;
  i:= pos(']', s);
  if i > 0 then
    insert(l, result, i)
  else
    result:= s;
end;

function tPexDecompiler.getMethodArgs(pOp: TpexOp; startId: integer): string;
var
  i: integer;
begin
  result:= '';
  for i:= startId to pOp.args.Count - 1 do
  begin
    result:= result + TpexVarData(pOp.args[i]).getStrValue;
    if i < pOp.args.Count - 1 then
      result:= result + ', ';
  end;
end;

procedure tPexDecompiler.drawInstruction(tabStr: string; locals: tlist; pOp: TpexOp);
var
  strtmp: string;
begin

  case pOp.opCode of
    0: strtmp:= 'none';
    1, 2: strtmp:= format('%s = %s + %s', [getArg(pOp, 0), getArg(pOp, 1), getArg(pOp, 2)]);
    3, 4: strtmp:= format('%s = %s - %s', [getArg(pOp, 0), getArg(pOp, 1), getArg(pOp, 2)]);
    5, 6: strtmp:= format('%s = %s * %s', [getArg(pOp, 0), getArg(pOp, 1), getArg(pOp, 2)]);
    7, 8: strtmp:= format('%s = %s / %s', [getArg(pOp, 0), getArg(pOp, 1), getArg(pOp, 2)]);
    9: strtmp:= format('%s = %s mod %s', [getArg(pOp, 0), getArg(pOp, 1), getArg(pOp, 2)]);
    $0A: strtmp:= format('%s = not %s', [getArg(pOp, 0), getArg(pOp, 1)]);
    $0B, $0C: strtmp:= format('%s = -%s', [getArg(pOp, 0), getArg(pOp, 1)]);
    $0D: strtmp:= format('%s = %s', [getArg(pOp, 0), getArg(pOp, 1)]);
    $0E: strtmp:= format('%s = %s as %s', [getArg(pOp, 0), getArg(pOp, 1), getVarType(getArg(pOp, 0), locals)]);
    $0F: strtmp:= format('%s = %s == %s', [getArg(pOp, 0), getArg(pOp, 1), getArg(pOp, 2)]);
    $10: strtmp:= format('%s = %s < %s', [getArg(pOp, 0), getArg(pOp, 1), getArg(pOp, 2)]);
    $11: strtmp:= format('%s = %s <= %s', [getArg(pOp, 0), getArg(pOp, 1), getArg(pOp, 2)]);
    $12: strtmp:= format('%s = %s > %s', [getArg(pOp, 0), getArg(pOp, 1), getArg(pOp, 2)]);
    $13: strtmp:= format('%s = %s >= %s', [getArg(pOp, 0), getArg(pOp, 1), getArg(pOp, 2)]);
    $14: strtmp:= format('jump %s', [getArg(pOp, 0)]);
    $15: strtmp:= format('if %s then jump %s', [getArg(pOp, 0), getArg(pOp, 1)]);
    $16: strtmp:= format('if not %s then jump %s', [getArg(pOp, 0), getArg(pOp, 1)]);
    $17: strtmp:= format('%s%s.%s(%s)', [setMethodResult(getArg(pOp, 2)), getArg(pOp, 1), getArg(pOp, 0), getMethodArgs(pOp, 4)]);
    $18: strtmp:= format('%sparent.%s(%s)', [setMethodResult(getArg(pOp, 1)), getArg(pOp, 0), getMethodArgs(pOp, 3)]);
    $19: strtmp:= format('%s%s.%s(%s)', [setMethodResult(getArg(pOp, 2)), getArg(pOp, 0), getArg(pOp, 1), getMethodArgs(pOp, 4)]);
    $1A: strtmp:= format('return %s', [getArg(pOp, 0)]);
    $1B: strtmp:= format('%s = %s + %s', [getArg(pOp, 0), getArg(pOp, 1), getArg(pOp, 2)]);
    $1C: strtmp:= format('%s = %s.%s', [getArg(pOp, 2), getArg(pOp, 1), getArg(pOp, 0)]);
    $1D: strtmp:= format('%s.%s = %s', [getArg(pOp, 1), getArg(pOp, 0), getArg(pOp, 2)]);
    $1E: strtmp:= format('%s = new %s', [getArg(pOp, 0), includeNewArray(getVarType(getArg(pOp, 0), locals), getArg(pOp, 1))]);
    $1F: strtmp:= format('%s = %s.length', [getArg(pOp, 0), getArg(pOp, 1)]);
    $20: strtmp:= format('%s = %s[%s] ', [getArg(pOp, 0), getArg(pOp, 1), getArg(pOp, 2)]);
    $21: strtmp:= format('%s[%s] = %s', [getArg(pOp, 0), getArg(pOp, 1), getArg(pOp, 2)]);
    $22: strtmp:= format('%s = %s.find(%s, %s)', [getArg(pOp, 1), getArg(pOp, 0), getArg(pOp, 2), getArg(pOp, 3)]);
    $23: strtmp:= format('%s = %s.rfind(%s, %s)', [getArg(pOp, 1), getArg(pOp, 0), getArg(pOp, 2), getArg(pOp, 3)]);
    // fallout 4 new OpCode. Thx to Alexander Blade for their definitions
    $24: strtmp:= format('%s = %s is %s', [getArg(pOp, 0), getArg(pOp, 1), getArg(pOp, 2)]);
    $25: strtmp:= format('new %s', [getArg(pOp, 0)]);
    $26: strtmp:= format('%s = %s.%s', [getArg(pOp, 0), getArg(pOp, 1), getArg(pOp, 2)]); // Struct GET
    $27: strtmp:= format('%s.%s = %s', [getArg(pOp, 0), getArg(pOp, 1), getArg(pOp, 2)]); // Struct SET
    $28: strtmp:= format('%s = %s.findstruct(%s, %s , %s)', [getArg(pOp, 1), getArg(pOp, 0), getArg(pOp, 2), getArg(pOp, 3), getArg(pOp, 4)]);
    $29: strtmp:= format('%s = %s.rfindstruct(%s , %s, %s) ', [getArg(pOp, 1), getArg(pOp, 0), getArg(pOp, 2), getArg(pOp, 3), getArg(pOp, 4)]);
    $2A: strtmp:= format('%s.Add(%s , %s)', [getArg(pOp, 0), getArg(pOp, 1), getArg(pOp, 2)]); // WIP  needs verification
    $2B: strtmp:= format('%s.Insert(%s , %s)', [getArg(pOp, 0), getArg(pOp, 1), getArg(pOp, 2)]); // WIP  needs verification
    $2C: strtmp:= format('%s.RemoveLast', [getArg(pOp, 0)]);
    $2D: strtmp:= format('%s.Remove(%s , %s)', [getArg(pOp, 0), getArg(pOp, 1), getArg(pOp, 2)]);
    $2E: strtmp:= format('%s.Clear', [getArg(pOp, 0)]);
    // Starfield
    $2F: strtmp:= format('%s.GetAllMatchingStruct(%s , %s , %s , %s)', [getArg(pOp, 0), getArg(pOp, 2), getArg(pOp, 3), getArg(pOp, 4), getArg(pOp, 5)]);
    $30: strtmp:= format('GuardLock(%s)', [getArg(pOp, 1)]);
    $31: strtmp:= format('GuardUnlock(%s)', [getArg(pOp, 1)]);
    $32: strtmp:= format('%s = GuardTryLock(%s)', [getArg(pOp, 0), getArg(pOp, 2)]);

  else strtmp:= format('unknown OpCode: %.2x)', [pOp.opCode]);
  end;
  pexLogAddLine(10, pOp, tabStr + strtmp);
end;

// ----------------------------------
{
  procedure WriteValue_utf8Old(Version: integer; s: string; fstream: tmemoryStream);
  var
  tmpRaw: rawbyteString;
  sizeRaw, sizeRawEndian: word;
  begin
  s:= limitStringSize(s, 65001, MAXSIZESTRING_GLOBALCAP_LOW);
  tmpRaw:= utf8encode(s);
  sizeRaw:= min(MAXSIZESTRING_GLOBALCAP_LOW, length(tmpRaw));
  sizeRawEndian:= SwapEndian16u(Version, sizeRaw);
  fstream.Write(sizeRawEndian, 2);
  fstream.Write(tmpRaw[1], sizeRaw);
  end;
}

procedure WriteValue_utf8(Version: integer; s: string; fstream: tmemoryStream; forcedCP: word);
var
  tmpRaw: tbytes;
  sizeRaw, sizeRawEndian: word;
begin
  s:= limitStringSize(s, forcedCP, MAXSIZESTRING_GLOBALCAP_LOW);
  tmpRaw:= getEncodingTBytes(forcedCP,s);
  sizeRaw:= min(MAXSIZESTRING_GLOBALCAP_LOW, length(tmpRaw));
  sizeRawEndian:= SwapEndian16u(Version, sizeRaw);
  fstream.Write(sizeRawEndian, 2);
  fstream.Write(tmpRaw[0], sizeRaw);
end;

function tPexDecompiler.dosavePex(t: tstringlist; filename: string): boolean;
var
  i: integer;
  forcedCP: word;
begin
  fExportstream.clear;
  forcedCP:= getCodepagepexOnSave;
  result:= false;
  try
    fExportstream.writebuffer(headerPexBuffer[0], length(headerPexBuffer));
    for i:= 0 to t.Count - 1 do
      WriteValue_utf8(iPexByteOrder, t[i], fExportstream, forcedCP);
    fExportstream.writebuffer(dataPexBuffer[0], length(dataPexBuffer));
    result:= true;
  except
  end;
end;

procedure SavePexFiletoTmp(fstream: tmemoryStream; bAuth: boolean; filename: string);
begin
  if bAuth then
  begin
    fstream.position:= 0;
    fstream.SaveToFile(tmpFuzPath + filename);
  end;
end;

end.
