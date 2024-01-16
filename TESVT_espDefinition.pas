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
unit TESVT_espDefinition;

interface

{$I _config.inc}

uses Classes, sysUtils, Dialogs, VirtualTrees, comCtrls, math, zlibEx, TESVT_fstreamsave, TESVT_Const, TESVT_Ressources,
  Generics.Collections, TESVT_Streams, TESVT_VMAD, TESVT_CustomList;

type
  sRecordType = (sRecord, sGrup, sMaster);
  sRecParam = (compressed, rawRec, hasString, usedForAnalysis, hasExtraLGDIKwd, isDialUsed);
  sRecParams = set of sRecParam;

  sHeaderString = string[4];

  tvtIteration = class
    procedure getgrupSize(Sender: TBaseVirtualTree; Node: PVirtualNode; Data: Pointer; var Abort: boolean);
    procedure getGrupString(Sender: TBaseVirtualTree; Node: PVirtualNode; Data: Pointer; var Abort: boolean);
  end;

  rCtdaData = record
    runOn: cardinal;
    boolOr: boolean;
    opType: byte;
    value: single;
    func: word;
    param1, param2: cardinal;
    reference: cardinal;
  end;

  rGenericHeader = record
    name: sHeaderSig;
    dsize: cardinal;
  end;

  rFieldIndex = packed record
    index, indexMax: word;
  end;

  rGenericHeaderData = packed record
    flags: cardinal;
    formID: cardinal;
    Version: cardinal;
{$IFDEF TES4FORMAT}
    fVersion: word; // specific TES5 - remove for Oblivion
    vInfo: word; // specific TES5  - remove for Oblivion
{$ENDIF TES4FORMAT}
  end;

  rGrupheader = packed record
    sIdent: sHeaderSig;
    sType: cardinal;
    sTStamp: word;
    param1: word;
{$IFDEF TES4FORMAT}
    param2: word; // specific TES5   - remove for Oblivion
    param3: word; // specific TES5  - remove for Oblivion
{$ENDIF TES4FORMAT}
  end;

  tGenericRecord = class
    sType: sRecordType;
    header: rGenericHeader;
    constructor create(gh: rGenericHeader; s: sRecordType);
    destructor Destroy; override;
    function getname: string;
  end;

  tMaster = class(tGenericRecord)
    EspName: string;
    IDMaster: byte;
    EspLoader: Pointer;
    constructor create(s: sRecordType; sEsp: String; p: Pointer);
  end;

  tGrup = class(tGenericRecord)
    headerData: rGrupheader;
    endPos: int64;
    grupString: boolean;
    constructor create(gh: rGenericHeader; s: sRecordType);
    function getname: string;
    function getsize: cardinal;
    function GetGrupSubName: string;
    procedure setData(h: rGrupheader; eP: int64);
  end;

  hField = record
    name: sHeaderSig;
    dsize: word;
  end;

  sfieldParam = (notNull, compared, isString, isEdid, noZero, isVMAD, isAnalysis, isSizeXXXX);
  sfieldParams = set of sfieldParam;

  tField = class
    header: hField;
    params: sfieldParams;
    maxStrSize: integer;
    sk: Pointer; // point to the tskystr
    listIndex: byte;
    hasCR: boolean;
    rIndex: rFieldIndex; // index of lstring enumeration.
    buffer: tbytes;
    constructor create;
    constructor createXXXX(dataSize: cardinal);
    function getsize: cardinal;
    destructor Destroy; override;
    procedure updateBuffer(s, strans: String; codePageProc: tWriteBufferCodepage; iMaxSize: integer);
    procedure updateBufferLocalized(id: cardinal);
  end;

  trecord = class(tGenericRecord)
  private
    nameField: tField;
    edidNameString: string;
    zcomp: TZCompressionLevel;
    buffer: tbytes;
    params: sRecParams;
    procedure getFieldfromBuffer(b: tbytes; currentEspLoader: Pointer; bREFR, bVMAD, forceTES4: boolean);
    procedure getrawdata(b: tbytes; currentEspLoader: Pointer; bREFR, bVMAD: boolean);
    procedure assignData(fStream: tstream; currentEspLoader: Pointer; bREFR, bVMAD, forceTES4: boolean);
    procedure getedidNameString;
    procedure setRawRec(b: boolean);
    function getrawRec: boolean;
    procedure setDialUsed(b: boolean);
    function getDialUsed: boolean;
    function getFragmentID: integer;
  public
    fList: tlist;
    headerData: rGenericHeaderData;
    espRec: PVirtualNode;
    edidNameHash: cardinal;
    ownerLoader: Pointer;
    constructor create(gh: rGenericHeader; s: sRecordType);
    destructor Destroy; override;
    function getname: string;
    function getsize: cardinal;
    function getStringNamelite: string;
    function getStringName: string;
    procedure clearFields;
    procedure rebuildData;
    function EdidName(formatted: boolean = true; bsanitized: boolean = false): string;
    function EdidNameEx: string;
    function hasValidEdid: boolean;
    function handleStrings: boolean;
    function hasComponent: boolean;
    function getFieldfromDataRef(dataRef: sHeaderSig): tField;
    function getCardinalfromDataRef(dataRef: sHeaderSig; offset: integer = 0): cardinal;
    function getFloatfromDataRef(dataRef: sHeaderSig; offset: integer = 0): single;
    function getCardinalfromDataRef_FromEnd(dataRef, blockOn: sHeaderSig): cardinal;
    function getSkfromDataRef(dataRef: sHeaderSig): Pointer;
    property rawrecord: boolean read getrawRec write setRawRec;
    property bDialUsed: boolean read getDialUsed write setDialUsed;
    function CTDADecoderEx(f: tField): rCtdaData;
    function getFirstUnconditionalLVLItem(var doLoop: integer): cardinal;
    function getKeywords(index: integer = 0): aCardinal;
    function getKeywordsExtra(hExtra1, hExtra2: sHeaderSig; getCobjRef: cardinal = 0; index: integer = 0): aCardinal;
    function getKeywordsGear(fgear: tField): aCardinal;
    function getKeywordsGbfm: aCardinal;
    function isFieldExists(dataRef: sHeaderSig): boolean;
    function GetMiscComponentAdv: aaCardinal;
    function GetMiscComponent(h: sHeaderSig): aCardinal;
    function GetfirstMiscComponent: cardinal;
    function GetAliasName(id: cardinal): string;
    function GetStageNote(id: cardinal): string;
  end;

  TespData = class
  public
    p: tGenericRecord;
    constructor create(Data: tGenericRecord);
  end;

  respData = record
    BasicND: TespData;
  end;

  pespdata = ^respData;

  tfieldCheckXtraProc = function(r: trecord; f: tField): boolean;

  rRecordDef = record
    fieldName: sHeaderSig;
    recordName: sHeaderSig;
    list: integer;
    notNull, noZero, ignored: boolean;
    proc: tfieldCheckXtraProc;
  end;

  pRecordRef = ^rRecordDef;

  rRecordSkip = record
    recordName: sHeaderSig;
  end;

  pRecordSkip = ^rRecordSkip;

  rRecordWarn = record
    recordName: sHeaderSig;
    fieldName: sHeaderSig;
  end;

  pRecordWarn = ^rRecordWarn;

  tespCompareCodepage = class
    codepage: rcodepage;
    procedure assignCodepage(c: rcodepage);
  end;

  tEspLoader = class
  private
    fTES4Record: trecord;
    topDialSet, topScenSet: boolean;
    fTopDialGrup, fTopScenGrup: PVirtualNode;
    rDummy: trecord;
    bFastRecSorted: boolean;
    bFastrefrSorted: boolean;
    bReferenceBuilt: boolean;
    aRefList: array [0 .. 3] of tmcCardinalPairList;
    // 0:  refrList
    // 1:   lBookToOMOD
    // 2:  lMiscModToOMOD
    // 3:   cobjComponent requirement

    procedure buildReferenceData;
    function getLVLItem(r: trecord): trecord;
    function getLGDIFallback(r: trecord): trecord;
    function getCobjOutput(id, idBook: cardinal): cardinal;
    function getNewCurrentNode(var Node: PVirtualNode; const pos: int64): int64;
    function getEndPos(Node: PVirtualNode): int64;
    function readEspData(fStream: tstream; bLoadAll, bgGetVmad: boolean): boolean;
    function readCompareData(fStream: tstream; loadAll: boolean): boolean;
    procedure RebuildGrupsSize;
    function buildInheritedDataEx(masterId: integer): tEspLoader;
    procedure clearVT;
    function getValidEsp(fStream: tstream; saveHeader: boolean): integer;
    function espKeepValidRecordVT(r: trecord): boolean;
    procedure espCompareKeepValidRecord(r: trecord; recList: tlist);
    procedure Compute_FieldIndex(r: trecord);
    procedure addToFastRecList(r: trecord);
    procedure rebuildAllRecords;
    function CreateDummyRecord: trecord;
    function getTopDialGrup: PVirtualNode;
    function getTopScenGrup: PVirtualNode;
    function getOMODFallBackEx(r: trecord; ListID: integer): trecord;
    function getFLORFallback(r: trecord; bExtendComponent: boolean): trecord;
    function getCmpoFallBack(r: trecord): trecord;
    function getMISCFallBack(r: trecord): trecord;
  public
    VT: tvirtualStringTree;
    recordCompareList: tlist;
    VMADList: tlist;
    espCompareCodepage: tespCompareCodepage;
    vtIteration: tvtIteration;
    masterNode: PVirtualNode;
    nbEspString: integer;
    BrokenVMAD: integer;
    mastersData: tstringlist;
    fEspMasterVersion: word;
    FastRecList: tlist;
    SceneList: tlist;
    bWrongWorkSpace: boolean;
    aInheritedMaster: array of byte;
    aInheritedCompareMaster: array of byte;
    aInheritedEsp: tlist;
    function getKwd(r: trecord; f: tField = nil): aCardinal;
    function getINNRKwd(r: trecord; f: tField = nil): aCardinal;
    procedure getOMODKeywords(r: trecord; var loop: integer; var a: aCardinal; start: boolean = false);
    procedure getOMODKeywordsSF(r: trecord; var loop: integer; var a: aCardinal; start: boolean = false);
    function getOMODFallBack(r: trecord): trecord;
    function getCOBJFallBack(r: trecord): trecord;
    function getGBFMFallBack(r: trecord): trecord;
    function getOMODFallBackKwd(r: trecord): aCardinal;
    function getOMODFallBackKwdEx(r: trecord): aCardinal;
    function SizeOfrefrList: cardinal;
    function setFormIdMapping(formID: cardinal): cardinal; overload;
    function setFormIdMapping(r: trecord; formID: cardinal): cardinal; overload;
    function setCompareFormIdMapping(formID: cardinal): cardinal;
    procedure buildInheritedData(bDoProcessorData: boolean = true);
    function getFastRecord(formID: cardinal): trecord; overload;
    function getFastRecord(formID: cardinal; h: sHeaderSig): trecord; overload;
    function getFastRecord(formID: cardinal; h: sHeaderSig; var NeedMaster: boolean): trecord; overload;
    function getFastRecordSelf(formID: cardinal; h: sHeaderSig): trecord;
    function getFastRefr(formID: cardinal): cardinal; overload;
    function getFastRefr(ListID: integer; formID: cardinal): cardinal; overload;
    function findKeyWord(formID: cardinal; rCaller: trecord; emptynotfound: boolean = false): string;
    function findRecEdid(formID: cardinal; h: sHeaderSig): string; overload;
    function findRecEdid(formID: cardinal): string; overload;
    procedure clearrecordList;
    function getFirstNode: PVirtualNode;
    function validNode(Node: PVirtualNode): boolean;
    property topDialGrup: PVirtualNode read getTopDialGrup;
    property topScenGrup: PVirtualNode read getTopScenGrup;
    property TES4Record: trecord read fTES4Record;
    function openesp(filetoload, filename: String; validate: integer; bLoadAll, bgGetVmad: boolean; loadForCompare: boolean): boolean;
    function saveEsp(filename: String): boolean;
    function getSubRec(id: cardinal; hSig: sHeaderSig): PVirtualNode;
    function getValidDial(r: trecord): boolean;
    function getDialSubGrup(dialNode: PVirtualNode; id: cardinal): PVirtualNode;
    function getQustGrup: PVirtualNode; overload;
    function getGenericGrup(startNode: PVirtualNode; sHeader: sHeaderSig): PVirtualNode;
    function getDialIDFromInfo(r: trecord): cardinal;
    Function getQustFromInfo(rInfo: trecord): trecord;
    procedure ValidGrupString(hideGrup: boolean);
    procedure clearEspMemoryData;
    procedure GetMastersData(addon_name: string);
    procedure GetCompareMastersData(r: trecord);
    function validateTES4_SNAM: tField;
    function saveArrayRefr(filename: string): boolean;
    function loadArrayRefr(filename: string): boolean;
    constructor create(VT: tvirtualStringTree);
    destructor Destroy; override;
  end;

var
  recDefList: tlist;
  warnRecList: tlist;
  fieldStrName: tstringlist;
  fieldStrSize: tlist<integer>;
  fieldStrCR: tlist<boolean>;
  lFastrec: tlist<cardinal>;
  lCtdaFunc: tstringlist;

Const
  headerTES4: sHeaderSig = 'TES4';
  headerGRUP: sHeaderSig = 'GRUP';
  headerFULL: sHeaderSig = 'FULL';
  headerEDID: sHeaderSig = 'EDID';
  headerXXXX: sHeaderSig = 'XXXX';
  headerDIAL: sHeaderSig = 'DIAL';
  headerQUST: sHeaderSig = 'QUST';
  headerINFO: sHeaderSig = 'INFO';
  headerNAM1: sHeaderSig = 'NAM1';
  headerRNAM: sHeaderSig = 'RNAM';
  headerDNAM: sHeaderSig = 'DNAM';
  headerNAM2: sHeaderSig = 'NAM2';
  headerTRDT: sHeaderSig = 'TRDT';
  headerTRDA: sHeaderSig = 'TRDA';
  headerMAST: sHeaderSig = 'MAST';
  headerKYWD: sHeaderSig = 'KYWD';
  headerNPC_: sHeaderSig = 'NPC_';
  headerACBS: sHeaderSig = 'ACBS';
  headerQNAM: sHeaderSig = 'QNAM';
  headerVMAD: sHeaderSig = 'VMAD';
  headerKNAM: sHeaderSig = 'KNAM';
  headerSNAM: sHeaderSig = 'SNAM';
  headerSCEN: sHeaderSig = 'SCEN';
  headerQSTI: sHeaderSig = 'QSTI';
  headerANAM: sHeaderSig = 'ANAM';
  headerTROT: sHeaderSig = 'TROT';
  headerALID: sHeaderSig = 'ALID';
  headerALST: sHeaderSig = 'ALST';
  headerALED: sHeaderSig = 'ALED';
  headerACHR: sHeaderSig = 'ACHR';
  headerREFR: sHeaderSig = 'REFR';
  headerFACT: sHeaderSig = 'FACT';
  headerIDAT: sHeaderSig = 'IDAT';
  headerNAME: sHeaderSig = 'NAME';
  headerFLST: sHeaderSig = 'FLST';
  headerLNAM: sHeaderSig = 'LNAM';
  headerSTAT: sHeaderSig = 'STAT';
  headerKWDA: sHeaderSig = 'KWDA';
  headerWNAM: sHeaderSig = 'WNAM';
  headerINAM: sHeaderSig = 'INAM';
  headerINNR: sHeaderSig = 'INNR';
  headerKSIZ: sHeaderSig = 'KSIZ';
  headerBOOK: sHeaderSig = 'BOOK';
  headerMISC: sHeaderSig = 'MISC';
  headerCVPA: sHeaderSig = 'CVPA';
  headerCMPO: sHeaderSig = 'CMPO';
  headerCOBJ: sHeaderSig = 'COBJ';
  headerOMOD: sHeaderSig = 'OMOD';
  headerFLOR: sHeaderSig = 'FLOR';
  headerPFIG: sHeaderSig = 'PFIG';
  headerLVLI: sHeaderSig = 'LVLI';
  headerLGDI: sHeaderSig = 'LGDI';
  headerPERK: sHeaderSig = 'PERK';
  headerMGEF: sHeaderSig = 'MGEF';
  headerALCH: sHeaderSig = 'ALCH';
  headerENCH: sHeaderSig = 'ENCH';
  headerEFID: sHeaderSig = 'EFID';
  headerMNAM: sHeaderSig = 'MNAM';
  headerVNAM: sHeaderSig = 'VNAM';
  headerWEAP: sHeaderSig = 'WEAP';
  headerARMO: sHeaderSig = 'ARMO';
  headerGNAM: sHeaderSig = 'GNAM';
  headerFVPA: sHeaderSig = 'FVPA';
  headerBFCB: sHeaderSig = 'BFCB';
  headerBFCE: sHeaderSig = 'BFCE';
  headerOBTS: sHeaderSig = 'OBTS';
  headerIOVR: sHeaderSig = 'IOVR';
  headerDOOR: sHeaderSig = 'DOOR';
  headerGBFM: sHeaderSig = 'GBFM';
  headerPRPS: sHeaderSig = 'PRPS';
  sheaderDATA: sHeaderSig = 'DATA'; // name sHeader to avoid collision with "trecord.headerdata" (silly me)
  headerEPFT: sHeaderSig = 'EPFT'; // for Proc2, PERK extra Procedure = $07
  ALL_REC: sHeaderSig = '****';
  header0000: sHeaderSig = '0000';

  aIGNOREDREC: array [0 .. 3] of sHeaderSig = ('NAVM', 'NAVI', 'NOCM', 'RFGP');

  // Important: all aUSEDREC_* ref must be stored in aFASTREC
  aFASTREC: array [0 .. 48] of sHeaderSig = ('DMGT', 'RSPJ', 'CNDF', 'WTHR', 'KEYM', 'SHOU', 'WRLD', 'SPEL', 'GMST', 'PACK', 'FURN', 'CONT', 'CELL', 'RACE', 'LCTN', 'AVIF', 'DMGT', 'GBFM', 'DIAL', 'INFO', 'QUST', 'KYWD',
    'BOOK', 'SCEN', 'PERK', 'DOOR', 'VTYP', 'NPC_', 'STAT', 'ACTI', 'LVLI', 'FLST', 'FACT', 'FLOR', 'TACT', 'CMPO', 'IRES', 'MISC', 'COBJ', 'GLOB', 'OMOD', 'ALCH', 'MGEF', 'ENCH', 'WEAP', 'LGDI',
    'ARMO', 'INNR', 'TES4');
  aFASTREFR: array [0 .. 1] of sHeaderSig = ('ACHR', 'REFR');

  aUSEDREC_ACHR: array [0 .. 0] of sHeaderSig = ('NAME');
  aUSEDREC_MISC: array [0 .. 2] of sHeaderSig = ('CVPA', 'MCQP', 'DATA');
  aUSEDREC_NPC_: array [0 .. 0] of sHeaderSig = ('ACBS');
  aUSEDREC_FLST: array [0 .. 0] of sHeaderSig = ('LNAM');
  aUSEDREC_GBFM: array [0 .. 1] of sHeaderSig = ('PRPS', 'FLFM');
  aUSEDREC_DOOR: array [0 .. 1] of sHeaderSig = ('BFCB', 'BFCE');
  aUSEDREC_ALCH: array [0 .. 2] of sHeaderSig = ('EFID', 'CVPA', 'MNAM');
  aUSEDREC_FLOR: array [0 .. 0] of sHeaderSig = ('PFIG');
  aUSEDREC_COBJ: array [0 .. 2] of sHeaderSig = ('CNAM', 'GNAM', 'FVPA');
  aUSEDREC_OMOD: array [0 .. 1] of sHeaderSig = ('LNAM', 'DATA');
  aUSEDREC_LVLI: array [0 .. 2] of sHeaderSig = ('CTDA', 'LLCT', 'LVLO');
  aUSEDREC_LGDI: array [0 .. 0] of sHeaderSig = ('ANAM');
  aUSEDREC_PERK: array [0 .. 0] of sHeaderSig = ('EPFT');
  aUSEDREC_BOOK: array [0 .. 2] of sHeaderSig = ('INAM', 'GNAM', 'DATA');
  aUSEDREC_INNR: array [0 .. 0] of sHeaderSig = ('VNAM');
  aUSEDREC_WEAP: array [0 .. 1] of sHeaderSig = ('OBTE', 'OBTS');
  aUSEDREC_ARMO: array [0 .. 1] of sHeaderSig = ('OBTE', 'OBTS');
  aUSEDREC_INFO: array [0 .. 9] of sHeaderSig = ('TRDT', 'TRDA', 'DNAM', 'NAM2', 'ANAM', 'GNAM', 'CTDA', 'SNAM', 'TROT', 'IOVR');
  aUSEDREC_DIAL: array [0 .. 2] of sHeaderSig = ('QNAM', 'QSTI', 'SNAM');
  aUSEDREC_SCEN: array [0 .. 14] of sHeaderSig = ('DATA', 'ANAM', 'ALID', 'PNAM', 'PTOP', 'NTOP', 'NETO', 'QTOP', 'NPOT', 'NNGT', 'NNUT', 'NQUT', 'ESCE', 'ESCS', 'LCEP');
  aUSEDREC_QUST: array [0 .. 12] of sHeaderSig = ('ALST', 'ALFR', 'ALUA', 'VTCK', 'ALFV', 'ALEQ', 'ALEA', 'ALCO', 'ALID', 'CTDA', 'ALED', 'INDX', 'NAM2');
  // -----------
  aAuthRecType: array [0 .. 5] of sHeaderSig = ('KYWD', 'ENCH', 'MGEF', 'AVIF', 'DMGT', 'PERK');
  // typ of record authorised to do a fallback in OMOD HeaderProcessor

procedure initlFastRec;
procedure initrecDefList(ts: tstrings);
procedure clearDefRecList;
function tfieldCheckXtraProcGMST(r: trecord; f: tField): boolean;
function tfieldCheckXtraProcPERK(r: trecord; f: tField): boolean;
function tfieldCheckXtraProcPERK2(r: trecord; f: tField): boolean;
function tfieldCheckXtraProcNOTE(r: trecord; f: tField): boolean;
function tfieldCheckXtraProcALL(r: trecord; f: tField): boolean;
procedure initFieldSizeList(t: tstringlist);
procedure freeFieldSizeList;
procedure getMaxStringSize(r: trecord; f: tField);
procedure initFieldSizeRec(n: string; b: boolean; value: integer);

function getCompressedFlag(f: cardinal): boolean;
function getLocalizedFlag(f: cardinal): boolean;
procedure ValidateEsp(filename: String; var iLocalized: integer; var iVersion: integer);
procedure doValidateEsp(fStream: tstream; var iLocalized: integer; var iVersion: integer);
function sanitizeFormID(const formID: cardinal; bS: byte = $01; bNoSanitize: boolean = false): cardinal;

Implementation

uses TESVT_FastSearch;

procedure initlFastRec;
var
  i, index: integer;
begin
  lFastrec := tlist<cardinal>.create;
  for i := low(aFASTREC) to high(aFASTREC) do
  begin
    if not lFastrec.BinarySearch(cardinal(aFASTREC[i]), index) then
      lFastrec.Insert(index, cardinal(aFASTREC[i]));
  end;
end;

function findInFastRec(h: sHeaderSig): boolean;
var
  index: integer;
begin
  if bKeepAllRecordHeaders then
    result := true
  else
    result := lFastrec.BinarySearch(cardinal(h), index);
end;

function sanitizeFormID(const formID: cardinal; bS: byte = $01; bNoSanitize: boolean = false): cardinal;
begin
  if bNoSanitize then
    exit(formID);

  if byte(formID shr 24) = 0 then
    result := formID
  else
    result := (formID and $00FFFFFF) or (cardinal(bS) shl 24);
end;

function validateSigForAnalysis(s: sHeaderSig; aUSEDREC: array of sHeaderSig): boolean;
var
  i: integer;
begin
  for i := 0 to high(aUSEDREC) do
    if cardinal(s) = cardinal(aUSEDREC[i]) then
      exit(true);
  result := false;
end;

function validateRecForAnalysis(r, f: sHeaderSig): boolean;
begin
  if cardinal(r) = cardinal(headerINFO) then
    exit(validateSigForAnalysis(f, aUSEDREC_INFO))
  else if cardinal(r) = cardinal(headerFLST) then
    exit(validateSigForAnalysis(f, aUSEDREC_FLST))
  else if cardinal(r) = cardinal(headerLVLI) then
    exit(validateSigForAnalysis(f, aUSEDREC_LVLI))
  else if cardinal(r) = cardinal(headerOMOD) then
    exit(validateSigForAnalysis(f, aUSEDREC_OMOD))
  else if cardinal(r) = cardinal(headerBOOK) then
    exit(validateSigForAnalysis(f, aUSEDREC_BOOK))
  else if cardinal(r) = cardinal(headerMISC) then
    exit(validateSigForAnalysis(f, aUSEDREC_MISC))
  else if cardinal(r) = cardinal(headerDIAL) then
    exit(validateSigForAnalysis(f, aUSEDREC_DIAL))
  else if cardinal(r) = cardinal(headerNPC_) then
    exit(validateSigForAnalysis(f, aUSEDREC_NPC_))
  else if cardinal(r) = cardinal(headerCOBJ) then
    exit(validateSigForAnalysis(f, aUSEDREC_COBJ))
  else if cardinal(r) = cardinal(headerWEAP) then
    exit(validateSigForAnalysis(f, aUSEDREC_WEAP))
  else if cardinal(r) = cardinal(headerSCEN) then
    exit(validateSigForAnalysis(f, aUSEDREC_SCEN))
  else if cardinal(r) = cardinal(headerINNR) then
    exit(validateSigForAnalysis(f, aUSEDREC_INNR))
  else if cardinal(r) = cardinal(headerQUST) then
    exit(validateSigForAnalysis(f, aUSEDREC_QUST))
  else if cardinal(r) = cardinal(headerFLOR) then
    exit(validateSigForAnalysis(f, aUSEDREC_FLOR))
  else if cardinal(r) = cardinal(headerALCH) then
    exit(validateSigForAnalysis(f, aUSEDREC_ALCH))
  else if cardinal(r) = cardinal(headerACHR) then
    exit(validateSigForAnalysis(f, aUSEDREC_ACHR))
  else if cardinal(r) = cardinal(headerLGDI) then
    exit(validateSigForAnalysis(f, aUSEDREC_LGDI))
  else if cardinal(r) = cardinal(headerPERK) then
    exit(validateSigForAnalysis(f, aUSEDREC_PERK))
  else if cardinal(r) = cardinal(headerGBFM) then
    exit(validateSigForAnalysis(f, aUSEDREC_GBFM))
  else if cardinal(r) = cardinal(headerARMO) then
    exit(validateSigForAnalysis(f, aUSEDREC_ARMO))
  else if cardinal(r) = cardinal(headerDOOR) then
    exit(validateSigForAnalysis(f, aUSEDREC_DOOR));

  result := false;
end;

// ---------------------------------

constructor tMaster.create(s: sRecordType; sEsp: string; p: Pointer);
begin
  self.sType := sMaster;
  self.header.name := ALL_REC;
  self.header.dsize := 0;
  self.IDMaster := 0;
  self.EspName := sEsp;
  self.EspLoader := p;
end;

// handle fast sizeCheck
procedure initFieldSizeList(t: tstringlist);
var
  i: integer;
begin
  fieldStrName := tstringlist.create;
  fieldStrName.duplicates := dupIgnore;
  fieldStrSize := tlist<integer>.create;
  fieldStrCR := tlist<boolean>.create;
  for i := 0 to t.count - 1 do
  begin
    initFieldSizeRec(copy(t[i], 1, 9), strtobooldef(copy(t[i], 11, 1), false), strtointdef(copy(t[i], 13, maxint), 0));
  end;
end;

procedure initFieldSizeRec(n: string; b: boolean; value: integer);
var
  index: integer;
begin
  if not fieldStrName.find(n, index) then
  begin
    fieldStrName.Insert(index, n);
    fieldStrCR.Insert(index, b);
    fieldStrSize.Insert(index, value);
  end;
end;

procedure freeFieldSizeList;
begin
  fieldStrName.free;
  fieldStrSize.free;
  fieldStrCR.free;
end;

procedure getMaxStringSize(r: trecord; f: tField);
var
  index: integer;
begin
  if fieldStrName.find(format('%.4s:%.4s', [r.header.name, f.header.name]), index) then
  begin
    f.maxStrSize := fieldStrSize[index];
    f.hasCR := fieldStrCR[index];
  end
  else
  begin
    f.hasCR := false;
    f.maxStrSize := 0
  end;
end;

procedure tespCompareCodepage.assignCodepage(c: rcodepage);
begin
  codepage.f := c.f;
  codepage.fb := c.fb;
  codepage.c := c.c;
  codepage.s := c.s;
  codepage.sFallback := c.sFallback;
  codepage.cFallback := c.cFallback;
  codepage.isUtf8 := c.isUtf8;
end;

// ----------------
function tfieldCheckXtraProcALL(r: trecord; f: tField): boolean;
begin
  result := true; // placeholder to avoid extra test.
end;

function tfieldCheckXtraProcNOTE(r: trecord; f: tField): boolean; // falloutNV
var
  z: integer;
begin
  for z := 0 to r.fList.count - 1 do
    if (tField(r.fList[z]).header.name = sheaderDATA) and (length(tField(r.fList[z]).buffer) = 1) and (tField(r.fList[z]).buffer[0] <> 3) then
      exit(true); // check if DATA = 3
  result := false;
end;

function tfieldCheckXtraProcGMST(r: trecord; f: tField): boolean;
var
  z: integer;
begin
  for z := 0 to r.fList.count - 1 do
    if (tField(r.fList[z]).header.name = headerEDID) and (length(tField(r.fList[z]).buffer) > 0) then
      exit(tField(r.fList[z]).buffer[0] = 115); // check if firstchar = 's' 115
  result := false;
end;

function tfieldIgnoreDOORCNAM(r: trecord; f: tField): boolean; // doorcnam
var
  z, j: integer;
begin
  result := true;
  for z := 0 to r.fList.count - 1 do
    if r.fList[z] = f then
      for j := z downto max(0, z - 3) do
      begin
        if (tField(r.fList[j]).header.name = headerBFCB) then
          exit(false); // of component data then false
        if (tField(r.fList[j]).header.name = headerBFCE) then
          break; // if finding close component tag  without finding the opener, then exit true
      end
end;

function tfieldCheckXtraProcPERK(r: trecord; f: tField): boolean; // epfd
var
  z, j: integer;
begin
  // check if we have epft = 7  , then check if our EPFD if right after (max 4 fields after)
  result := false;
  for z := 0 to r.fList.count - 1 do
    if (tField(r.fList[z]).header.name = headerEPFT) and (length(tField(r.fList[z]).buffer) = 1) and (tField(r.fList[z]).buffer[0] = 7) then
      for j := z + 1 to min(r.fList.count - 1, z + 3) do
        if r.fList[j] = f then
          exit(true);
end;

function tfieldCheckXtraProcPERK2(r: trecord; f: tField): boolean; // epf2
var
  z, j: integer;
begin
  // check if we have epft = 4  , then check if our EPF2 if right after (max 3 fields after)
  result := false;
  for z := 0 to r.fList.count - 1 do
    if (tField(r.fList[z]).header.name = headerEPFT) and (length(tField(r.fList[z]).buffer) = 1) and (tField(r.fList[z]).buffer[0] = 4) then
      for j := z + 1 to min(r.fList.count - 1, z + 2) do
        if r.fList[j] = f then
          exit(true);
end;
// ----------------

procedure clearDefRecList;
var
  i: integer;
begin
  for i := 0 to recDefList.count - 1 do
    dispose(pRecordRef(recDefList[i]));
  for i := 0 to warnRecList.count - 1 do
    dispose(pRecordWarn(warnRecList[i]));
  recDefList.free;
  warnRecList.free;
end;

procedure getDefRec(s: rawbytestring);
var
  p: pRecordRef;
begin
  new(p);
  move(s[6], p.fieldName[0], 4);
  move(s[11], p.recordName[0], 4);
  p.list := strtointdef(string(s[16]), 0);
  p.notNull := pos('*', string(s)) = 17;
  p.noZero := pos('!', string(s)) = 17;
  p.ignored := pos('?', string(s)) = 17;
  // note: extraProc can only crawl backward in the r.flist.
  if pos('proc1', string(s)) = 18 then
    p.proc := tfieldCheckXtraProcGMST
  else if pos('proc2', string(s)) = 18 then
    p.proc := tfieldCheckXtraProcPERK
  else if pos('proc4', string(s)) = 18 then
    p.proc := tfieldCheckXtraProcPERK2
  else if pos('proc3', string(s)) = 18 then
    p.proc := tfieldCheckXtraProcNOTE
  else if pos('proc5', string(s)) = 18 then
    p.proc := tfieldIgnoreDOORCNAM
  else
    p.proc := tfieldCheckXtraProcALL;
  recDefList.Add(p);
end;

procedure getWarnRec(s: rawbytestring);
var
  p: pRecordWarn;
begin
  new(p);
  move(s[6], p.fieldName[0], 4);
  move(s[11], p.recordName[0], 4);
  warnRecList.Add(p);
end;

procedure initrecDefList(ts: tstrings);
var
  i: integer;
  tmp: string;
begin
  recDefList := tlist.create;
  warnRecList := tlist.create;
  for i := 0 to ts.count - 1 do
    if not is_comment(ts[i]) then
    begin
      tmp := trim(ts[i]);
      if (length(tmp) >= 16) and (copy(tmp, 1, 5) = 'Def_:') then
        getDefRec(rawbytestring(tmp));
      if (length(tmp) = 14) and (copy(tmp, 1, 5) = 'Warn:') then
        getWarnRec(rawbytestring(tmp));
    end;
end;

// ---
function isInRecArray(recArray: array of sHeaderSig; s: sHeaderSig): boolean;
var
  i: integer;
begin
  for i := low(recArray) to high(recArray) do
    if cardinal(s) = cardinal(recArray[i]) then
      exit(true);
  result := false;
end;

function islstringRecord(const r: trecord; const f: tField; forceTES4: boolean): integer;
var
  p: pRecordRef;
  k: integer;
begin
  for k := 0 to recDefList.count - 1 do
  begin
    p := recDefList[k];

    if forceTES4 and (r.header.name = headerTES4) then
    begin
      if (f.header.name = 'CNAM') or (f.header.name = 'SNAM') then
        exit(0);
    end;

    if cardinal(f.header.name) = cardinal(p.fieldName) then
    begin
      if (cardinal(p.recordName) = cardinal(ALL_REC)) or ((cardinal(r.header.name) = cardinal(p.recordName)) and p.proc(r, f)) then
      begin
        if p.ignored then
          exit(-1);
        if p.notNull then
          include(f.params, notNull);
        if p.noZero then
          include(f.params, noZero);
        exit(p.list);
      end;
    end;
  end;
  result := -1;
end;

procedure tvtIteration.getgrupSize(Sender: TBaseVirtualTree; Node: PVirtualNode; Data: Pointer; var Abort: boolean);
var
  tmpdata: pespdata;
begin
  tmpdata := Sender.getnodedata(Node);
  case tmpdata.BasicND.p.sType of
    sGrup: cardinal(Data^) := cardinal(Data^) + sizeOf(rGenericHeader) + sizeOf(rGrupheader);
    sRecord: cardinal(Data^) := cardinal(Data^) + sizeOf(rGenericHeader) + sizeOf(rGenericHeaderData) + ((trecord(tmpdata.BasicND.p).header.dsize));
  end;
end;

procedure tvtIteration.getGrupString(Sender: TBaseVirtualTree; Node: PVirtualNode; Data: Pointer; var Abort: boolean);
var
  tmpdata: pespdata;
begin
  tmpdata := Sender.getnodedata(Node);
  if (tmpdata.BasicND.p.sType = sRecord) and (not trecord(tmpdata.BasicND.p).rawrecord) then
    boolean(Data^) := true;
end;

// ----------------------------

constructor TespData.create(Data: tGenericRecord);
begin
  p := Data;
end;

// field

constructor tField.create;
begin
  setlength(buffer, 0);
  params := [];
  maxStrSize := 0;
  rIndex.index := 0;
  rIndex.indexMax := 0;
end;

constructor tField.createXXXX(dataSize: cardinal);
begin
  setlength(buffer, 4);
  move(dataSize, buffer[0], sizeOf(cardinal));
  header.name := headerXXXX;
  header.dsize := 4;

  params := [];
  maxStrSize := 0;
  rIndex.index := 0;
  rIndex.indexMax := 0;
end;

destructor tField.Destroy;
begin
  setlength(buffer, 0);
  inherited;
end;

function tField.getsize: cardinal;
begin
  result := retCardinal(instanceSize + length(buffer));
end;

procedure tField.updateBuffer(s, strans: String; codePageProc: tWriteBufferCodepage; iMaxSize: integer);
var
  b: boolean;
  realdSize: cardinal;
begin
  // don't update empty string
  if bSKIP_NULLSTRING and (length(s) = 0) and (length(strans) = 0) then
    exit;
  // secure NullStrings (if source has content):  (can fix broken mods)
  if bForceAddSpaceNotNull then
    if (notNull in params) and (strans = '') then
      strans := ' ';
  if checkForNullTrans(s, strans) then
    strans := ' ';
  // fallback
  b := (noZero in params) and (buffer[length(buffer) - 1] <> 0);
  realdSize := codePageProc(strans, buffer, iMaxSize, not b);
  if realdSize <= $FFFF then
  begin
    header.dsize := word(realdSize);
    exclude(params, isSizeXXXX);
  end
  else
  begin
    include(params, isSizeXXXX);
    header.dsize := 0;
  end;
end;

procedure tField.updateBufferLocalized(id: cardinal);
begin
  setlength(buffer, sizeOf(id));
  move(id, buffer[0], sizeOf(id));
  header.dsize := word(sizeOf(id));
end;

// ------------------------

constructor tGenericRecord.create(gh: rGenericHeader; s: sRecordType);
begin
  header := gh;
  sType := s;
end;

destructor tGenericRecord.Destroy;
begin
  inherited;
end;

// ------------------------
function tGenericRecord.getname: string;
begin
  result := string(sHeaderString(header.name));
end;

// ----------------

constructor tGrup.create(gh: rGenericHeader; s: sRecordType);
begin
  grupString := false;
  inherited;
end;

procedure tGrup.setData(h: rGrupheader; eP: int64);
begin
  headerData := h;
  endPos := eP;
end;

function tGrup.getname: string;
begin
  result := format('%s - %s', [sHeaderString(header.name), GetGrupSubName]);
end;

function tGrup.getsize: cardinal;
begin
  result := sizeOf(sType) + sizeOf(header) + sizeOf(rGenericHeaderData) + 9 + 4;
end;

function tGrup.GetGrupSubName: string;
begin
  case headerData.sType of
    1 .. 10: result := format('[%.8x]', [cardinal(headerData.sIdent)]);
  else result := string(sHeaderString(headerData.sIdent))
  end;
end;
// quests

function trecord.GetAliasName(id: cardinal): string;
var
  f: tField;
  i: integer;
  bOpen: boolean;
  tmpAlias: integer;
begin
  result := '';
  bOpen := false;
  for i := 0 to pred(fList.count) do
  begin
    f := fList[i];
    if (f.header.name = 'ALST') then
    begin
      if bOpen then
        exit;
      move(f.buffer[0], tmpAlias, sizeOf(tmpAlias));
      if tmpAlias = integer(id) then
        bOpen := true;
    end
    else if (f.header.name = 'ALID') and bOpen then
    begin
      SetString(result, PAnsiChar(@f.buffer[0]), length(f.buffer) - 1);
      exit;
    end
    else if (f.header.name = headerALED) then
      bOpen := false;
  end;
end;

function trecord.GetStageNote(id: cardinal): string;
var
  f: tField;
  i: integer;
  bOpen: boolean;
  tmpStage: word;
begin
  result := '';
  bOpen := false;
  for i := 0 to pred(fList.count) do
  begin
    f := fList[i];
    if (f.header.name = 'INDX') then
    begin
      if bOpen then
        exit;
      move(f.buffer[0], tmpStage, sizeOf(tmpStage));
      if tmpStage = integer(id) then
        bOpen := true;
    end
    else if (f.header.name = 'NAM2') and bOpen then
    begin
      SetString(result, PAnsiChar(@f.buffer[0]), length(f.buffer) - 1);
      exit;
    end
  end;
end;

// ----------------
constructor trecord.create(gh: rGenericHeader; s: sRecordType);
begin
  inherited;
  fList := tlist.create;
  params := [];
  edidNameString := '';
  nameField := nil;
  setlength(buffer, 0);
  edidNameHash := 0;
  rawrecord := false;
end;

function trecord.GetfirstMiscComponent: cardinal;
var
  acomp: aCardinal;
begin
  acomp := GetMiscComponent(gamesParams.sMISCCMPOREF);
  if length(acomp) > 0 then
    result := acomp[0]
  else
    result := 0;
end;

function trecord.GetMiscComponent(h: sHeaderSig): aCardinal;
var
  i, j: integer;
  f: tField;
  rSize: integer;
begin
  rSize := 0;
  setlength(result, rSize);
  for i := 0 to pred(fList.count) do
  begin
    f := fList[i];
    if f.header.name = h then
    begin
      rSize := length(f.buffer) div gamesParams.iCompoDataSize;
      setlength(result, rSize);
      for j := 1 to rSize do
        move(f.buffer[(j - 1) * gamesParams.iCompoDataSize], result[j - 1], sizeOf(cardinal));
      exit;
    end;
  end;
end;

function trecord.GetMiscComponentAdv: aaCardinal;
var
  i, j: integer;
  f: tField;
  rSize: integer;
begin
  rSize := 0;
  setlength(result[0], rSize);
  setlength(result[1], rSize);
  for i := 0 to pred(fList.count) do
  begin
    f := fList[i];
    if f.header.name = gamesParams.sMISCCMPOREF then
    begin
      rSize := length(f.buffer) div gamesParams.iCompoDataSize;
      setlength(result[0], rSize);
      setlength(result[1], rSize);
      for j := 1 to rSize do
      begin
        move(f.buffer[(j - 1) * gamesParams.iCompoDataSize], result[0][j - 1], sizeOf(cardinal));
        move(f.buffer[(j - 1) * gamesParams.iCompoDataSize + 4], result[1][j - 1], sizeOf(cardinal));
      end;
      exit;
    end;
  end;
end;

procedure trecord.setDialUsed(b: boolean);
begin
  if b then
    include(params, isDialUsed)
  else
    exclude(params, isDialUsed)
end;

function trecord.getDialUsed: boolean;
begin
  result := isDialUsed in params;
end;

procedure trecord.setRawRec(b: boolean);
begin
  if b then
    include(params, rawRec)
  else
    exclude(params, rawRec)
end;

function trecord.getrawRec: boolean;
begin
  result := rawRec in params;
end;

function trecord.isFieldExists(dataRef: sHeaderSig): boolean;
begin
  result := assigned(getFieldfromDataRef(dataRef));
end;

function trecord.getCardinalfromDataRef(dataRef: sHeaderSig; offset: integer = 0): cardinal;
var
  f: tField;
begin
  f := getFieldfromDataRef(dataRef);
  if assigned(f) and (length(f.buffer) > offset) then
  begin
    move(f.buffer[offset], result, sizeOf(cardinal));
    exit;
  end;
  result := 0;
end;

function trecord.getFloatfromDataRef(dataRef: sHeaderSig; offset: integer = 0): single;
var
  f: tField;
begin
  f := getFieldfromDataRef(dataRef);
  if assigned(f) and (length(f.buffer) > offset) then
  begin
    move(f.buffer[offset], result, sizeOf(single));
    exit;
  end;
  result := 0;
end;

function trecord.getCardinalfromDataRef_FromEnd(dataRef, blockOn: sHeaderSig): cardinal;
var
  i: integer;
  f: tField;
begin
  result := 0;
  for i := pred(fList.count) downto 0 do
  begin
    f := fList[i];
    if cardinal(f.header.name) = cardinal(dataRef) then
    begin
      move(f.buffer[0], result, sizeOf(cardinal));
      exit;
    end
    else if cardinal(f.header.name) = cardinal(blockOn) then
      exit;
  end
end;

function trecord.getFieldfromDataRef(dataRef: sHeaderSig): tField;
var
  i: integer;
  f: tField;
begin
  result := nil;
  for i := 0 to pred(fList.count) do
  begin
    f := fList[i];
    if cardinal(f.header.name) = cardinal(dataRef) then
      exit(f);
  end;
end;

function trecord.getSkfromDataRef(dataRef: sHeaderSig): Pointer;
var
  f: tField;
begin
  f := getFieldfromDataRef(dataRef);
  if assigned(f) then
    exit(f.sk);
  result := nil;
end;

procedure trecord.getedidNameString;
begin
  if assigned(nameField) then
    SetString(edidNameString, PAnsiChar(@nameField.buffer[0]), length(nameField.buffer) - 1)
end;

function trecord.hasValidEdid: boolean;
begin
  result := assigned(nameField) or (edidNameString <> '');
end;

function trecord.handleStrings: boolean;
begin
  result := hasString in params;
end;

function trecord.EdidNameEx: string;
begin
  if assigned(nameField) then
    SetString(result, PAnsiChar(@nameField.buffer[0]), length(nameField.buffer) - 1)
  else
    result := edidNameString;
end;

function trecord.EdidName(formatted: boolean = true; bsanitized: boolean = false): string;
begin
  result := EdidNameEx;
  if result = '' then
  begin
    if formatted then
    begin
      if bsanitized then
        result := format('[%.8x]', [sanitizeFormID(self.headerData.formID)])
      else
        result := format('[%.8x]', [self.headerData.formID])
    end
    else
      result := format('%.8x', [self.headerData.formID]);
  end;
end;

function trecord.hasComponent: boolean;
var
  f: tField;
begin
  f := getFieldfromDataRef(sHeaderSig(gamesParams.sMISCCMPOREF));
  result := assigned(f) and (length(f.buffer) > 2);
end;

function trecord.getKeywords(index: integer = 0): aCardinal;
var
  i, j: integer;
  f: tField;
  rSize: integer;
begin
  rSize := 0;
  setlength(result, rSize);
  if index < 0 then
    exit;
  for i := index to pred(fList.count) do
  begin
    f := fList[i];
    // -----------
    if f.header.name = headerKSIZ then
      move(f.buffer[0], rSize, sizeOf(cardinal))
    else if f.header.name = headerKWDA then
    begin
      if (rSize > 0) and (length(f.buffer) >= (rSize * sizeOf(cardinal))) then
      begin
        setlength(result, rSize);
        for j := 1 to rSize do
          move(f.buffer[(j - 1) * 4], result[j - 1], sizeOf(cardinal));
        exit;
      end;
    end;
  end;
end;

function trecord.getKeywordsGear(fgear: tField): aCardinal;
var
  i, index, j: integer;
  k: byte;
  f: tField;
  includeCount: integer;
  offset, obteCount: integer;
begin
  result := getKeywords;
  index := fList.indexof(fgear);
  obteCount := 0;
  if index < 0 then
    exit;
  for i := index to pred(fList.count) do
  begin
    f := fList[i];
    if f.header.name = 'OBTE' then
      move(f.buffer[0], obteCount, sizeOf(obteCount))
    else if f.header.name = headerOBTS then
    begin
      move(f.buffer[0], includeCount, sizeOf(includeCount));
      move(f.buffer[15], k, sizeOf(k));
      for j := 1 to k do
      begin
        setlength(result, length(result) + sizeOf(cardinal));
        move(f.buffer[16 + ((j - 1) * 4)], result[length(result) - 1], sizeOf(cardinal));
      end;
      offset := 16 + 4 * k + 2;
      // omodIncludes
      for j := 1 to includeCount do
      begin
        setlength(result, length(result) + sizeOf(cardinal));
        move(f.buffer[offset + ((j - 1) * 7)], result[length(result) - 1], sizeOf(cardinal));
      end;
      break;
    end;
  end;
end;

function trecord.getKeywordsGbfm: aCardinal;
var
  i, j: integer;
  k: byte;
  f: tField;
begin
  result := getKeywords;
  for i := 0 to pred(fList.count) do
  begin
    f := fList[i];

    if f.header.name = headerPRPS then
    begin
      k := length(f.buffer) div 12;
      for j := 1 to k do
      begin
        setlength(result, length(result) + sizeOf(cardinal));
        move(f.buffer[((j - 1) * 12)], result[length(result) - 1], sizeOf(cardinal));
      end;
      break;
    end;

  end;
end;

function trecord.getKeywordsExtra(hExtra1, hExtra2: sHeaderSig; getCobjRef: cardinal = 0; index: integer = 0): aCardinal;
var
  i, j: integer;
  f: tField;
  rSize: integer;
  tmpValue: integer;
begin
  rSize := 0;
  setlength(result, rSize);
  if index < 0 then
    exit;
  for i := index to pred(fList.count) do
  begin
    f := fList[i];
    // -----------
    if f.header.name = headerKSIZ then
      move(f.buffer[0], rSize, sizeOf(cardinal))
    else if f.header.name = headerKWDA then
    begin
      if (rSize > 0) and (length(f.buffer) >= (rSize * sizeOf(cardinal))) then
      begin
        setlength(result, length(result) + rSize);
        for j := 1 to rSize do
          move(f.buffer[(j - 1) * 4], result[j - 1], sizeOf(cardinal));
      end;
    end
    else if (f.header.name = hExtra1) or (f.header.name = hExtra2) then
    begin
      // getvalue/price (book/misc)
      if f.header.name = sheaderDATA then
      begin
        move(f.buffer[0], tmpValue, sizeOf(tmpValue));
        if tmpValue > 500 then
        begin
          setlength(result, length(result) + 1);
          rSize := length(result) - 1;
          if tmpValue > 4000 then
            result[rSize] := fVirtualKwdDataValue[3]
          else if tmpValue > 2000 then
            result[rSize] := fVirtualKwdDataValue[2]
          else if tmpValue > 1000 then
            result[rSize] := fVirtualKwdDataValue[1]
          else if tmpValue > 500 then
            result[rSize] := fVirtualKwdDataValue[0];
        end;
      end
      else
      // regular FormID (book/misc)
      begin
        setlength(result, length(result) + 1);
        rSize := length(result) - 1;
        move(f.buffer[0], result[rSize], sizeOf(cardinal));
      end;
    end
  end;
  // getcObjref starfield
  if getCobjRef > 0 then
  begin
    setlength(result, length(result) + 1);
    rSize := length(result) - 1;
    move(getCobjRef, result[rSize], sizeOf(cardinal));
  end;
end;

function trecord.CTDADecoderEx(f: tField): rCtdaData;
var
  tmpByte: byte;
begin
  move(f.buffer[0], tmpByte, sizeOf(tmpByte));
  if tmpByte and 1 > 0 then
    result.boolOr := true
  else
    result.boolOr := false;
  result.opType := tmpByte shr 5;
  move(f.buffer[4], result.value, sizeOf(result.value));
  move(f.buffer[8], result.func, sizeOf(result.func));
  move(f.buffer[12], result.param1, sizeOf(result.param1));
  move(f.buffer[16], result.param2, sizeOf(result.param2));
  move(f.buffer[20], result.runOn, sizeOf(result.runOn));
  move(f.buffer[24], result.reference, sizeOf(result.reference));
end;

function trecord.getFirstUnconditionalLVLItem(var doLoop: integer): cardinal;
var
  // count: cardinal;
  i: integer;
  f: tField;
begin
  result := 0;
  // count:= 0;
  inc(doLoop);
  for i := 0 to pred(fList.count) do
  begin
    f := fList[i];
    // -----------
    // if f.header.name = 'LLCT' then
    // move(f.buffer[0], count, sizeOf(cardinal))

    if f.header.name = 'LVLO' then
    begin
      if result > 0 then
        exit;
      if length(f.buffer) = sizeOf(cardinal) then
        move(f.buffer[0], result, sizeOf(cardinal))
      else if length(f.buffer) >= sizeOf(cardinal) * 2 then
        move(f.buffer[4], result, sizeOf(cardinal))
    end
    else if f.header.name = 'CTDA' then
      result := 0;
  end;
end;

procedure trecord.clearFields;
var
  i: integer;
begin
  nameField := nil;
  for i := 0 to fList.count - 1 do
    tField(fList[i]).free;
  fList.clear;
end;

destructor trecord.Destroy;
begin
  clearFields;
  fList.free;
  setlength(buffer, 0);
  inherited;
end;

function trecord.getsize: cardinal;
var
  i: integer;
begin
  result := instanceSize + fList.instanceSize;
  result := result + retCardinal(length(edidNameString)) * 2;
  if rawRec in params then
    result := result + retCardinal(length(buffer))
  else
  begin
    for i := 0 to pred(fList.count) do
      result := result + tField(fList[i]).getsize + 4; // +4 = pointer in list
  end;
end;

function trecord.getname: string;
begin
  result := format('%s [%.8x] [%d|%d|%d]', [sHeaderString(header.name), headerData.formID, fList.count, ord(compressed), ord(rawrecord)]);
end;

function trecord.getStringNamelite: string;
begin
  result := format('[%.8x] %s', [headerData.formID, sHeaderString(header.name)]);
end;

function trecord.getStringName: string;
begin
  result := format('%s %s[%.8x] [%d|%d|%d]', [sHeaderString(header.name), EdidNameEx, headerData.formID, fList.count, ord(compressed), ord(rawrecord)]);
end;



// ---------------

procedure trecord.assignData(fStream: tstream; currentEspLoader: Pointer; bREFR, bVMAD, forceTES4: boolean);
var
  endPos: int64;
  s: string;
begin
  endPos := fStream.Position + header.dsize;
  if endPos > fStream.size then
    Raise Exception.create(READDATAERROR);

  // let get all record data  in one call
  setlength(buffer, header.dsize);
  fReadBuffer(fStream, Pointer(buffer), length(buffer), endPos);

  if isInRecArray(aIGNOREDREC, header.name) then
    rawrecord := true
    // else if isInRecArray(aFASTREC, self.header.name) then
  else if findInFastRec(self.header.name) then
    include(params, usedForAnalysis);

  ownerLoader := currentEspLoader;
  if not rawrecord then
  begin
    if getCompressedFlag(headerData.flags) then
      getrawdata(buffer, currentEspLoader, bREFR, bVMAD)
    else
      getFieldfromBuffer(buffer, currentEspLoader, bREFR, bVMAD, forceTES4);
  end;

  // handle the fallback
  if rawrecord then
  begin
    getedidNameString;
    clearFields;
  end
  else
    setlength(buffer, 0); // (if not raw record,   lets free up the buffer

  // set edidHash
  edidNameHash := stringHash(self.EdidName(true, true));
  // dev export KeyWord
  if bWriteEmoteKeyWord and (header.name = headerKYWD) then
  begin
    s := EdidNameEx;
    if pos(EMOTESUBSTR, s) = 1 then
      EmoteDefinitionList.Add(format('%.8x=%s', [self.headerData.formID, s]));
  end;
end;

function trecord.getFragmentID: integer;
begin
  if header.name = 'PERK' then
    result := 0
  else if header.name = 'PACK' then
    result := 1
  else if header.name = 'SCEN' then
    result := 2
  else if header.name = 'INFO' then
    result := 3
  else if header.name = 'QUST' then
    result := 4
  else
    result := -1;
end;

procedure trecord.getFieldfromBuffer(b: tbytes; currentEspLoader: Pointer; bREFR, bVMAD, forceTES4: boolean);
var
  newField: tField;
  pos: cardinal;
  endPos: int64;
  nextFieldSize, bBaseForm: cardinal;
  tmpIndex: integer;
  pVMAD: tVMADDecoder;
  tmpid: cardinal;
begin
  // devtest

  rawrecord := not bForceKeepAllRecAndField;

  // ---------
  tmpid := 0;
  endPos := length(b);
  pos := 0;
  nextFieldSize := 0;
  while (pos < endPos) do
  begin
    newField := tField.create;
    self.fList.Add(newField);
    newField.sk := nil;
    getBufferData(b, @newField.header, pos, sizeOf(hField), endPos);
    // XXXX -> next field will have the size of data XXXX
    if nextFieldSize = 0 then
      nextFieldSize := newField.header.dsize;
    setlength(newField.buffer, nextFieldSize);
    getBufferData(b, newField.buffer, pos, nextFieldSize, endPos);
    nextFieldSize := 0;

    // XXXX new field = size
    if (newField.header.name = headerXXXX) then
      move(newField.buffer[0], nextFieldSize, 4)
      // EdidRef
    else if (newField.header.name = headerEDID) and (length(newField.buffer) > 0) then
    begin
      nameField := newField;
      include(newField.params, isEdid);
    end
    // ----Store VMAD
    else if bVMAD and (newField.header.name = headerVMAD) and (length(newField.buffer) > 0) then
    begin
      pVMAD := tVMADDecoder.create(newField.buffer, self, newField, getFragmentID);
      if pVMAD.bBreak then
        inc(tEspLoader(currentEspLoader).BrokenVMAD);
      if pVMAD.bHasStrings and not pVMAD.bBreak then
      begin
        tEspLoader(currentEspLoader).VMADList.Add(pVMAD);
        include(newField.params, isVMAD);
        rawrecord := false;
      end
      else
        pVMAD.free;
    end
    else if bREFR and (cardinal(newField.header.name) = cardinal(headerNAME)) and validateSigForAnalysis(header.name, aFASTREFR) then
    begin
      move(newField.buffer[0], bBaseForm, 4);
      tEspLoader(currentEspLoader).aRefList[0].AddPair(headerData.formID, bBaseForm);
    end;

    // fallback in rawrecord if the record doesnt not contains strings to handle
    // crawl for string : tmpIndex :=0 to generate Orphan
    if bForceEsmDeloc then
      tmpIndex := -1
    else
      tmpIndex := islstringRecord(self, newField, forceTES4);

    // ----------
    if (tmpIndex >= 0) then
    begin
      rawrecord := false;
      include(params, hasString);
      include(newField.params, isString);
      newField.listIndex := byte(tmpIndex);
    end
    // test new String - write FORMID in const.pas
    else
    begin
      if bAnalyzeOrphanString then
      begin
        // crawl for string
        if length(newField.buffer) = 4 then
        begin
          move(newField.buffer[0], tmpid, sizeOf(cardinal));
          if (tmpid = cOrphanID1) or (tmpid = cOrphanID2) or (tmpid = cOrphanID3) or (tmpid = cOrphanID4) then
            dofeedback(inttohex(tmpid, 6) + '  ' + string(getname) + ' - ' + string(newField.header.name));
        end;
      end;
    end;
    // Analysis
    if (usedForAnalysis in params) then
    begin
      rawrecord := false;
      if validateRecForAnalysis(header.name, newField.header.name) then
        include(newField.params, isAnalysis);
    end;
    // keywords for all
    if (newField.header.name = headerKSIZ) or (newField.header.name = headerKWDA) then
      include(newField.params, isAnalysis);
  end;

end;

procedure trecord.getrawdata(b: tbytes; currentEspLoader: Pointer; bREFR, bVMAD: boolean);
var
  destBuffer: tbytes;
  decompressedSize: cardinal;
  compressionlvl: word;
  startpos: cardinal;
begin
  include(params, compressed);
  startpos := 0;

  getBufferData(b, @decompressedSize, startpos, sizeOf(cardinal), length(b));
  if (decompressedSize = 0) or (length(b) < 4) then
  begin
    rawrecord := true;
    exit;
  end;

  if bCountCompressedData then
  begin
    inc(iCompressedRecords);
    iCompressedGain := iCompressedGain + (decompressedSize - length(b));
  end;

  setlength(destBuffer, decompressedSize);

  // from zlibEx - tes5edit
  try
    DecompressToUserBuf(@b[4], header.dsize - sizeOf(cardinal), @destBuffer[0], decompressedSize);
  except
    On E: Exception do
    begin
      dofeedback(formatRes('ErrorRawData%s', [getname]), true, [askPanel]);
      rawrecord := true;
      exit;
    end;
  end;

  // --------------------
  getFieldfromBuffer(destBuffer, currentEspLoader, bREFR, bVMAD, false);
  // get compression lvl
  move(b[4], compressionlvl, 2);
  case compressionlvl of
    $0178: zcomp := zcFastest;
    $DA78: zcomp := zcMax;
  else zcomp := zcDefault;
  end;
end;

procedure trecord.rebuildData;
var
  i, startpos: integer;
  fd, prevFD: tField;
  tmpBuffer: tbytes;
  zlibBuffer: Pointer;
  sSize: cardinal;
  csize: integer;
  ignoreNextFdSize: boolean;
  bDeleteNextXXXX: boolean;
  dataSize: cardinal;
begin
  if rawrecord then
    exit;
  bDeleteNextXXXX := false;
  header.dsize := 0;
  ignoreNextFdSize := false;

  // firstpass: XXXX fields
  for i := pred(fList.count) downto 0 do
  begin
    fd := fList[i];
    if bDeleteNextXXXX then
    begin
      if (fd.header.name = headerXXXX) then
      begin
        fList.delete(i);
        bDeleteNextXXXX := false;
        continue;
      end;
      bDeleteNextXXXX := false;
    end;
    if (i > 0) and (isString in fd.params) then
    begin
      if (isSizeXXXX in fd.params) then
      begin
        prevFD := fList[i - 1];
        dataSize := length(fd.buffer);
        if prevFD.header.name = headerXXXX then
          move(dataSize, prevFD.buffer[0], sizeOf(cardinal))
        else
          fList.Insert(i, tField.createXXXX(dataSize));
        bDeleteNextXXXX := false;
      end
      else
        bDeleteNextXXXX := true;
    end;
  end;
  // ------------
  for i := 0 to fList.count - 1 do
  begin
    fd := fList[i];
    if not ignoreNextFdSize then
      fd.header.dsize := length(fd.buffer);
    header.dsize := header.dsize + sizeOf(fd.header) + cardinal(length(fd.buffer));
    ignoreNextFdSize := fd.header.name = headerXXXX;
  end;

  if compressed in params then // we build the compressed record now
  begin
    setlength(tmpBuffer, header.dsize);
    startpos := 0;
    for i := 0 to fList.count - 1 do
    begin
      fd := fList[i];
      move(fd.header, tmpBuffer[startpos], sizeOf(fd.header));
      if length(fd.buffer) > 0 then
        move(fd.buffer[0], tmpBuffer[startpos + sizeOf(fd.header)], length(fd.buffer));
      startpos := startpos + sizeOf(fd.header) + length(fd.buffer);
    end;
    sSize := length(tmpBuffer);
    ZCompress(Pointer(tmpBuffer), sSize, Pointer(zlibBuffer), csize, zcomp);
    setlength(buffer, csize + sizeOf(cardinal));
    move(sSize, buffer[0], sizeOf(cardinal));
    if length(tbytes(zlibBuffer)) > 0 then
      move(tbytes(zlibBuffer)[0], buffer[sizeOf(cardinal)], csize);
    header.dsize := length(buffer);
    freemem(zlibBuffer);
  end;
end;

// ------------UTILS-----------------
function getLocalizedFlag(f: cardinal): boolean;
begin
  // devtest
  if bForceEsmDeloc then
    result := false
  else
    result := f and $00000080 <> 0;
end;

function getCompressedFlag(f: cardinal): boolean;
begin
  result := f and $00040000 <> 0;
end;

procedure ValidateEsp(filename: String; var iLocalized: integer; var iVersion: integer);
var
  fStream: tfilestream;
begin
  iLocalized := -1;
  iVersion := -1;
  fStream := nil;
  try
    try
      fStream := tfilestream.create(filename, fmOpenRead or fmShareDenyWrite);
      doValidateEsp(fStream, iLocalized, iVersion);
    except
      On E: Exception do
        dofeedback(E.Message, true);
    end;
  finally
    fStream.free;
  end;
end;

procedure doValidateEsp(fStream: tstream; var iLocalized: integer; var iVersion: integer);
var
  gh: rGenericHeader;
  ghd: rGenericHeaderData;
  endPos: int64;
begin
  endPos := fStream.size;
  if endPos = 0 then
    exit;
  try
    fRead(fStream, @gh, sizeOf(gh), endPos);
    if gh.name = headerTES4 then
    begin
      fRead(fStream, @ghd, sizeOf(ghd), endPos);
      iLocalized := ord(getLocalizedFlag(ghd.flags));
{$IFDEF TES4FORMAT}
      iVersion := ghd.fVersion;
{$ELSE TES4FORMAT}
      iVersion := 0;
{$ENDIF TES4FORMAT}
    end;
  except
    iLocalized := -1;
    iVersion := -1;
  end;
end;

// ------------------EspLoaders-------------------------------
constructor tEspLoader.create(VT: tvirtualStringTree);
var
  i: integer;
begin
  fTES4Record := nil;
  masterNode := nil;
  bWrongWorkSpace := false;
  setlength(aInheritedMaster, 0);
  setlength(aInheritedCompareMaster, 0);
  aInheritedEsp := tlist.create;
  self.VT := VT;
  recordCompareList := tlist.create;
  espCompareCodepage := tespCompareCodepage.create;
  vtIteration := tvtIteration.create;
  nbEspString := 0;
  BrokenVMAD := 0;
  fEspMasterVersion := 0;
  VMADList := tlist.create;
  mastersData := tstringlist.create;
  FastRecList := tlist.create;
  SceneList := tlist.create;
  rDummy := CreateDummyRecord;
  bFastRecSorted := false;
  bFastrefrSorted := false;
  bReferenceBuilt := false;
  topScenSet := false;
  topDialSet := false;
  for i := 0 to high(aRefList) do
  begin
    aRefList[i] := tmcCardinalPairList.create;
    aRefList[i].PairSorted := i <> 0;
  end;
end;

destructor tEspLoader.Destroy;
var
  i: integer;
begin
  for i := 0 to pred(VMADList.count) do
    tVMADDecoder(VMADList[i]).free;
  VMADList.free;
  clearEspMemoryData;
  recordCompareList.free;
  espCompareCodepage.free;
  vtIteration.free;
  mastersData.free;
  FastRecList.free;
  SceneList.free;
  aInheritedEsp.free;
  fTES4Record := nil;
  rDummy.free;
  for i := 0 to high(aRefList) do
    aRefList[i].free;
  inherited;
end;

procedure tEspLoader.clearVT;
begin
  if assigned(masterNode) then
  begin
    VT.DeleteChildren(masterNode);
    VT.DeleteNode(masterNode);
  end;
  masterNode := nil;
end;

procedure tEspLoader.clearEspMemoryData;
begin
  clearVT;
  clearrecordList;
end;

function tEspLoader.CreateDummyRecord: trecord;
var
  gh: rGenericHeader;
begin
  gh.name := ALL_REC;
  gh.dsize := 0;
  result := trecord.create(gh, sRecord);
end;

// -------------master Framework------------------->
// Always call  tEspLoader.buildInheritedData before any getFastRecord call session
// then use getFastRecord to get any record from self or master.

function tEspLoader.SizeOfrefrList: cardinal;
begin
  result := self.aRefList[0].count * 12;
end;

function tEspLoader.setFormIdMapping(r: trecord; formID: cardinal): cardinal;
begin
  if assigned(r.ownerLoader) then
    result := tEspLoader(r.ownerLoader).setFormIdMapping(formID)
  else
    result := formID;
end;

function tEspLoader.setFormIdMapping(formID: cardinal): cardinal;
var
  mId: byte;
  i: byte;
begin
  result := formID;
  mId := getMasterIndex(formID);
  for i := 0 to high(aInheritedMaster) do
  begin
    if (aInheritedMaster[i] > 0) and (aInheritedMaster[i] - 1 = mId) then
      exit(sanitizeFormID(formID, i));
  end;
end;

function tEspLoader.buildInheritedDataEx(masterId: integer): tEspLoader;
var
  Node: PVirtualNode;
  DataEsp: pespdata;
begin
  result := nil;
  Node := VT.Getfirst;
  while assigned(Node) do
  begin
    DataEsp := VT.getnodedata(Node);
    if (DataEsp.BasicND.p.sType = sMaster) then
    begin
      if ansilowercase(tMaster(DataEsp.BasicND.p).EspName) = ansilowercase(mastersData[masterId]) then
        exit(tMaster(DataEsp.BasicND.p).EspLoader);
    end;
    Node := VT.GetNextSibling(Node);
  end;
end;

procedure tEspLoader.buildInheritedData(bDoProcessorData: boolean = true);
var
  i, j, k: integer;
  loader: tEspLoader;
begin

  updateStatus(getres('ComputingMasterData'));

  aInheritedEsp.clear;

  // get all espLoader in list
  for j := 0 to pred(mastersData.count) - 1 do
    aInheritedEsp.Add(buildInheritedDataEx(j));
  aInheritedEsp.Add(self); // latest is self (to avoid issue with esm with the same name)

  for i := 0 to pred(aInheritedEsp.count) do
  begin
    loader := aInheritedEsp[i];
    if assigned(loader) then
    begin
      if not loader.bFastRecSorted then
      begin
        loader.FastRecList.Sort(comparePureFormIDAndRec);
        loader.bFastRecSorted := true;
      end;
      if not loader.bFastrefrSorted then
      begin
        loader.aRefList[0].sortpair;
        loader.bFastrefrSorted := true;
      end;

      // init
      setlength(loader.aInheritedMaster, aInheritedEsp.count);
      for j := low(loader.aInheritedMaster) to high(loader.aInheritedMaster) do
        loader.aInheritedMaster[j] := 0;
      // get all inherited reference for each loaded master. Last = self
      for j := 0 to pred(mastersData.count) do
        for k := 0 to pred(loader.mastersData.count) do
        begin
          if ansilowercase(mastersData[j]) = ansilowercase(loader.mastersData[k]) then
            loader.aInheritedMaster[j] := k + 1; // add +1 because it's stored as Byte, and 0 = NULL
        end;
    end;
  end;

  // buildExtra Internal refs
  if bDoProcessorData then
  begin
    for i := 0 to pred(aInheritedEsp.count) do
    begin
      loader := aInheritedEsp[i];
      if assigned(loader) then
      begin
        if not loader.bReferenceBuilt then
        begin
          loader.buildReferenceData;
          loader.bReferenceBuilt := true;
        end;
      end;
    end;
  end;

  ProgressBar.Position := ProgressBar.max;
  updateStatus('');
end;

function tEspLoader.getFastRecord(formID: cardinal; h: sHeaderSig): trecord;
var
  NeedMaster: boolean;
begin
  result := getFastRecord(formID, h, NeedMaster);
end;

function tEspLoader.getFastRecord(formID: cardinal; h: sHeaderSig; var NeedMaster: boolean): trecord;
var
  i, index: integer;
  mId: byte;
  loader: tEspLoader;
begin
  rDummy.header.name := h;
  mId := getMasterIndex(formID);
  if inrange(mId, 0, pred(aInheritedEsp.count)) then
  // false should not happen. Security if an esp is badly shaped
  begin
    for i := pred(aInheritedEsp.count) downto 0 do
    begin
      if mId > i then
        break;
      loader := aInheritedEsp[i];
      if assigned(loader) and (loader.aInheritedMaster[mId] > 0) then
      begin
        rDummy.headerData.formID := sanitizeFormID(formID, loader.aInheritedMaster[mId] - 1);
        if FastListSearch(loader.FastRecList, comparePureFormIDAndRec, rDummy, index, false) then
          exit(loader.FastRecList[index]);
      end;
    end;
    if mId < pred(aInheritedEsp.count) then
      NeedMaster := true;
  end;
  result := nil;
end;

function tEspLoader.getFastRecord(formID: cardinal): trecord;
var
  i, index: integer;
  mId: byte;
  loader: tEspLoader;
begin
  mId := getMasterIndex(formID);
  if inrange(mId, 0, pred(aInheritedEsp.count)) then // false should not happen. Security if an esp is badly shaped
  begin
    for i := pred(aInheritedEsp.count) downto 0 do
    begin
      if mId > i then
        break;
      loader := aInheritedEsp[i];
      if assigned(loader) and (loader.aInheritedMaster[mId] > 0) then
      begin
        rDummy.headerData.formID := sanitizeFormID(formID, loader.aInheritedMaster[mId] - 1);
        if FastListSearch(loader.FastRecList, comparePureFormID, rDummy, index, false) then
          exit(loader.FastRecList[index]);
      end;
    end;
  end;
  result := nil;
end;

function tEspLoader.getFastRefr(formID: cardinal): cardinal;
begin
  result := getFastRefr(0, formID);
end;

function tEspLoader.getFastRefr(ListID: integer; formID: cardinal): cardinal;
var
  i: integer;
  valueOut: cardinal;
  mId: byte;
  loader: tEspLoader;
begin
  mId := getMasterIndex(formID);
  if inrange(mId, 0, pred(aInheritedEsp.count)) then // false should not happen. Security if an esp is badly shaped
  begin
    for i := pred(aInheritedEsp.count) downto 0 do
    begin
      if mId > i then
        break;
      loader := aInheritedEsp[i];
      if assigned(loader) and (loader.aInheritedMaster[mId] > 0) then
      begin
        if loader.aRefList[ListID].findPair(sanitizeFormID(formID, loader.aInheritedMaster[mId] - 1), valueOut) then
          exit(loader.setFormIdMapping(valueOut));
      end;
    end;
  end;
  result := 0;
end;

function tEspLoader.getFastRecordSelf(formID: cardinal; h: sHeaderSig): trecord;
var
  index: integer;
begin
  rDummy.header.name := h;
  rDummy.headerData.formID := formID;
  if FastListSearch(FastRecList, comparePureFormIDAndRec, rDummy, index, false) then
    exit(FastRecList[index]);
  result := nil;
end;

function tEspLoader.findKeyWord(formID: cardinal; rCaller: trecord; emptynotfound: boolean = false): string;
var
  r: trecord;
  tmpRef: integer;
begin
  // Virtual Keywords
  if formID = fVirtualKwdLGDIKwdId then
    exit(fVirtualKwdLGDIKwdName)
  else if inrange(formID, fVirtualKwdINNRKwdId[low(fVirtualKwdINNRKwdId)], fVirtualKwdINNRKwdId[high(fVirtualKwdINNRKwdId)]) then
  begin
    tmpRef := formID - fVirtualKwdINNRKwdId[0];
    exit(fVirtualKwdINNRKwdName[tmpRef]);
  end
  else if inrange(formID, fVirtualKwdDataValue[low(fVirtualKwdDataValue)], fVirtualKwdDataValue[high(fVirtualKwdDataValue)]) then
  begin
    tmpRef := formID - fVirtualKwdDataValue[0];
    exit(fVirtualKwdDataValueName[tmpRef]);
  end;
  // regularKeywords
  r := getFastRecord(formID);
  if assigned(r) then
  begin
    result := r.EdidNameEx;
    if (r.header.name <> headerKYWD) then
      result := '@@' + r.header.name + ':' + result
  end
  else
  begin
    if emptynotfound then
      result := ''
    else
      result := format(':%.8x', [formID]);
  end;
end;

function tEspLoader.findRecEdid(formID: cardinal; h: sHeaderSig): string;
var
  r: trecord;
begin
  r := getFastRecord(formID, h);
  if assigned(r) then
    result := r.EdidNameEx
  else
    result := format(':%.8x', [formID]);
end;

function tEspLoader.findRecEdid(formID: cardinal): string;
var
  r: trecord;
begin
  r := getFastRecord(formID);
  if assigned(r) then
    result := r.EdidNameEx
  else
    result := format(':%.8x', [formID]);
end;

// <---------------------------------------------------

function tEspLoader.setCompareFormIdMapping(formID: cardinal): cardinal;
var
  mId: byte;
begin
  mId := getMasterIndex(formID);
  if mId > high(aInheritedCompareMaster) then
    mId := high(aInheritedCompareMaster); // support for starfield esl (formiID = FE000xxx

  if inrange(mId, 0, high(aInheritedCompareMaster)) and (aInheritedCompareMaster[mId] > 0) then
    result := (sanitizeFormID(formID, aInheritedCompareMaster[mId] - 1))
  else
    result := 0
end;

procedure tEspLoader.GetCompareMastersData(r: trecord);
var
  f: tField;
  i, k: integer;
  tmpstr: string;
  l: tstringlist;
begin
  l := tstringlist.create;
  for i := 0 to r.fList.count - 1 do
  begin
    f := r.fList[i];
    if f.header.name = headerMAST then
    begin
      SetString(tmpstr, PAnsiChar(@f.buffer[0]), length(f.buffer));
      l.Add(ansilowercase(trim(tmpstr)));
    end;
  end;

  setlength(aInheritedCompareMaster, l.count + 1); // +1 for current comparedaddon, esp can me renamed differently
  for i := low(aInheritedCompareMaster) to high(aInheritedCompareMaster) do
    aInheritedCompareMaster[i] := 0;

  for i := 0 to pred(mastersData.count) do
    for k := 0 to pred(l.count) do
    begin
      if ansilowercase(mastersData[i]) = ansilowercase(l[k]) then
        aInheritedCompareMaster[k] := i + 1; // add +1 because it's stored as Byte, and 0 = NULL
    end;
  aInheritedCompareMaster[l.count] := byte(mastersData.count); // = last MasterData ID +1
  l.free;
end;

procedure tEspLoader.GetMastersData(addon_name: string);
var
  Data: pespdata;
  f: tField;
  i: integer;
  tmpstr: string;
begin
  for i := 0 to fTES4Record.fList.count - 1 do
  begin
    f := fTES4Record.fList[i];
    if f.header.name = headerMAST then
    begin
      SetString(tmpstr, PAnsiChar(@f.buffer[0]), length(f.buffer));
      mastersData.Add(ansilowercase(trim(tmpstr)));
    end;
  end;
  mastersData.Add(ansilowercase(trim(addon_name)));

  Data := VT.getnodedata(masterNode);
  tMaster(Data.BasicND.p).IDMaster := pred(mastersData.count);
end;

function tEspLoader.validateTES4_SNAM: tField;
var
  i: integer;
  iCNAM: integer;
  f: tField;
begin
  result := nil;
  iCNAM := -1;
  for i := 0 to fTES4Record.fList.count - 1 do
  begin
    f := fTES4Record.fList[i];
    if f.header.name = 'CNAM' then
      iCNAM := i
    else if f.header.name = 'SNAM' then
      exit(f);
  end;

  if (iCNAM > -1) then
  begin
    result := tField.create;
    result.header.name := 'SNAM';
    result.header.dsize := 1;
    setlength(result.buffer, 1);
    result.buffer[0] := 0;
    fTES4Record.fList.Insert(iCNAM + 1, result);
  end;
end;

// ===============================================

procedure tEspLoader.buildReferenceData;
var
  Node: PVirtualNode;
  DataEsp: pespdata;
  r: trecord;
  i: integer;
  id1, id2: cardinal;
  acomp: aCardinal;
begin
  if bGameIsFallout then // fallout4&76
  begin
    // BOOK
    aRefList[1].clear;
    Node := getGenericGrup(getFirstNode, headerCOBJ);
    Node := VT.GetNext(Node);
    while validNode(Node) do
    begin
      DataEsp := VT.getnodedata(Node);
      if (DataEsp.BasicND.p.sType = sRecord) then
      begin
        r := trecord(DataEsp.BasicND.p);
        id1 := r.getCardinalfromDataRef('GNAM');
        id2 := getCobjOutput(r.getCardinalfromDataRef('CNAM'), id1);
        // if no cnam return cObj
        if id2 = 0 then
          id2 := r.headerData.formID;
        if (id1 <> 0) and (id2 <> 0) then
          aRefList[1].AddPair(id1, id2);
      end
      else
        break;
      Node := VT.GetNextSibling(Node);
    end;
  end;
  // OMOD
  aRefList[2].clear;
  Node := getGenericGrup(getFirstNode, headerOMOD);
  Node := VT.GetNext(Node);
  while validNode(Node) do
  begin
    DataEsp := VT.getnodedata(Node);
    if (DataEsp.BasicND.p.sType = sRecord) then
    begin
      r := trecord(DataEsp.BasicND.p);
      id1 := r.getCardinalfromDataRef('LNAM');
      id2 := r.headerData.formID;
      if (id1 <> 0) and (id2 <> 0) then
        aRefList[2].AddPair(id1, id2);
    end
    else
      break;
    Node := VT.GetNextSibling(Node);
  end;

  // COBJ Compo
  aRefList[3].clear;
  Node := getGenericGrup(getFirstNode, headerCOBJ);
  Node := VT.GetNext(Node);
  while validNode(Node) do
  begin
    DataEsp := VT.getnodedata(Node);
    if (DataEsp.BasicND.p.sType = sRecord) then
    begin
      r := trecord(DataEsp.BasicND.p);
      acomp := r.GetMiscComponent(headerFVPA);
      for i := 1 to length(acomp) do
        aRefList[3].AddPair(acomp[i - 1], r.headerData.formID);
    end
    else
      break;
    Node := VT.GetNextSibling(Node);
  end;
end;

function tEspLoader.getCobjOutput(id, idBook: cardinal): cardinal;
var
  r, rBook: trecord;
begin
  if id = 0 then
    exit(0);
  r := getFastRecord(id);
  if assigned(r) then
  begin
    if r.header.name = headerLGDI then
    begin
      r := getLGDIFallback(r);
      rBook := getFastRecord(idBook);
      if assigned(rBook) then
        include(rBook.params, hasExtraLGDIKwd);
    end
    else
      r := getLVLItem(r);
  end;
  if assigned(r) then
    result := r.headerData.formID
  else
    result := 0;
end;

function tEspLoader.getGBFMFallBack(r: trecord): trecord;
var
  i: integer;
  f: tField;
  cWeap: cardinal;
  rWeap: trecord;
begin
  result := nil;
  for i := 0 to pred(r.fList.count) do
  begin
    f := r.fList[i];
    if f.header.name = 'FLFM' then
    begin
      move(f.buffer[0], cWeap, sizeOf(cardinal));
      rWeap := getFastRecord(cWeap, headerWEAP);
      if assigned(rWeap) then
        exit(rWeap);
    end;
  end;
end;

function tEspLoader.getCOBJFallBack(r: trecord): trecord;
var
  rCobj: trecord;
begin
  result := nil;
  if assigned(r) then
  begin
    rCobj := getFastRecord(r.getCardinalfromDataRef('CNAM'));
    if assigned(rCobj) then
    begin
      if rCobj.header.name = headerLGDI then
        result := getLGDIFallback(rCobj)
      else
        result := getLVLItem(rCobj);
    end;
  end;
end;

function tEspLoader.getKwd(r: trecord; f: tField = nil): aCardinal;
var
  cObj: cardinal;
begin
  setlength(result, 0);
  if assigned(r) then
  begin
    if r.header.name = headerALCH then
    begin
      // check if related to cobj
      cObj := getFastRefr(3, r.headerData.formID);
      result := r.getKeywordsExtra(headerEFID, headerMNAM, cObj);
    end
    else if r.header.name = headerBOOK then
      result := r.getKeywordsExtra(headerGNAM, sheaderDATA)
    else if r.header.name = headerMISC then
      result := r.getKeywordsExtra(sheaderDATA, ALL_REC)
    else if (r.header.name = headerWEAP) or (r.header.name = headerARMO) then
      result := r.getKeywordsGear(f)
    else if (r.header.name = headerGBFM) then
      result := r.getKeywordsGbfm
    else if r.header.name = headerINNR then
      result := getINNRKwd(r, f)
    else if r.header.name = headerOMOD then
      result := getOMODFallBackKwdEx(r)
    else
      result := r.getKeywords;
    // 76 extra LGDI
    if (hasExtraLGDIKwd in r.params) then
    begin
      setlength(result, length(result) + 1);
      result[length(result) - 1] := fVirtualKwdLGDIKwdId;
    end;
  end;
end;

function tEspLoader.getINNRKwd(r: trecord; f: tField = nil): aCardinal;
var
  index, i: integer;
  vnam: integer;
  // vnam: word;
  fTmp: tField;
begin
  setlength(result, 0);
  if assigned(f) then
  begin
    index := -1;
    vnam := -1;
    for i := 0 to pred(r.fList.count) do
    begin
      fTmp := r.fList[i];
      if fTmp.header.name = headerVNAM then
        inc(vnam);
      if fTmp = f then
      begin
        index := i;
        break;
      end;
    end;

    if index < 0 then
      exit;
    inc(index);

    if not inrange(vnam, 0, 9) then
      vnam := 0;

    result := r.getKeywords(index);
    // INNR GroupKeyword
    setlength(result, length(result) + 1);
    result[length(result) - 1] := fVirtualKwdINNRKwdId[vnam];
  end;

end;

function tEspLoader.getOMODFallBackEx(r: trecord; ListID: integer): trecord;
var
  omodID: cardinal;
begin
  omodID := getFastRefr(ListID, r.headerData.formID);
  result := getFastRecord(omodID);
end;

function tEspLoader.getCmpoFallBack(r: trecord): trecord;
begin
  result := getFastRecord(r.GetfirstMiscComponent, gamesParams.sHEADERCMPOREF);
end;

function tEspLoader.getLVLItem(r: trecord): trecord;
var
  doLoop: integer;
begin
  result := r;
  doLoop := 0;
  while (doLoop < 5) and assigned(result) and (result.header.name = headerLVLI) do
    result := getFastRecord(result.getFirstUnconditionalLVLItem(doLoop));
end;

function tEspLoader.getFLORFallback(r: trecord; bExtendComponent: boolean): trecord; // get component= extend to IRES/COMPO for starfield
begin
  result := getLVLItem(getFastRecord(r.getCardinalfromDataRef(headerPFIG)));
  if bExtendComponent and assigned(result) and (result.header.name = headerMISC) then
    result := getMISCFallBack(result);
end;

function tEspLoader.getMISCFallBack(r: trecord): trecord;
begin
  // look  omod, if not get compoKW  (starfield)
  result := getOMODFallBackEx(r, 2);
  if not assigned(result) then
    result := getCmpoFallBack(r);
end;

function tEspLoader.getLGDIFallback(r: trecord): trecord;
begin
  result := getLVLItem(getFastRecord(r.getCardinalfromDataRef(headerANAM)));
end;

function tEspLoader.getOMODFallBack(r: trecord): trecord;
begin
  result := r;
  if r.header.name = headerFLOR then
    result := getFLORFallback(r, CURRENT_GAME_ID = 5)
  else if r.header.name = headerBOOK then
    result := getOMODFallBackEx(r, 1)
  else if r.header.name = headerGBFM then
    result := getGBFMFallBack(r)
  else if r.header.name = headerCOBJ then
    result := getCOBJFallBack(r)
  else if r.header.name = headerMISC then
    result := getMISCFallBack(r)
  else if r.header.name = headerLGDI then
    result := getLVLItem(getFastRecord(r.getCardinalfromDataRef(headerANAM)))
  else if r.header.name = headerLVLI then
    result := getLVLItem(r);
end;

function tEspLoader.getOMODFallBackKwd(r: trecord): aCardinal;
begin
  result := getKwd(getOMODFallBack(r));
end;

function tEspLoader.getOMODFallBackKwdEx(r: trecord): aCardinal;
var
  loop: integer;
begin
  loop := 0;
  getOMODKeywords(r, loop, result, true);
end;

procedure tEspLoader.getOMODKeywords(r: trecord; var loop: integer; var a: aCardinal; start: boolean = false);
var
  i, j: integer;
  f: tField;
  offset, tmpCount: cardinal;
  iCount, pCount, FormIDOut: cardinal;
  func, union: byte;
  modTmp: cardinal;

  function authNewEntry(id: cardinal): boolean;
  var
    k: integer;
  begin
    for k := 0 to length(a) - 1 do
      if a[k] = id then
        exit(false);
    result := true;
  end;

begin
  if CURRENT_GAME_ID = 5 then // starfied
  begin
    getOMODKeywordsSF(r, loop, a, start);
    exit;
  end;

  if start then
    setlength(a, 0);

  if not assigned(r) then
    exit;

  for i := 0 to pred(r.fList.count) do
  begin
    f := r.fList[i];
    if f.header.name = 'DATA' then
    begin
      move(f.buffer[0], iCount, sizeOf(cardinal));
      move(f.buffer[4], pCount, sizeOf(cardinal));

      offset := 20;
      // attach slots
      move(f.buffer[offset], tmpCount, sizeOf(cardinal));
      offset := offset + 4 + tmpCount * 4;
      // items
      move(f.buffer[offset], tmpCount, sizeOf(cardinal));
      offset := offset + 4 + tmpCount * 8;

      // includes
      for j := 1 to iCount do
      begin
        move(f.buffer[offset], modTmp, sizeOf(cardinal));
        if loop < 20 then
        begin
          inc(loop); // call stack security
          getOMODKeywords(getFastRecord(modTmp, headerOMOD), loop, a);
        end;
        offset := offset + 7;
      end;

      // properties
      for j := 1 to pCount do
      begin
        func := f.buffer[offset];
        offset := offset + 4;
        union := f.buffer[offset];
        offset := offset + 8;
        if (func = 4) and (union = 2) then
        begin
          move(f.buffer[offset], FormIDOut, sizeOf(cardinal));
          if assigned(getFastRecord(FormIDOut, headerKYWD)) and authNewEntry(FormIDOut) then
          begin
            setlength(a, length(a) + 1);
            a[length(a) - 1] := FormIDOut;
          end;
        end;
        offset := offset + 12;
      end;
    end;
  end;;
end;

procedure tEspLoader.getOMODKeywordsSF(r: trecord; var loop: integer; var a: aCardinal; start: boolean = false);
var
  i, j: integer;
  rtmp: trecord;
  f: tField;
  offset, tmpCount: cardinal;
  iCount, pCount, FormIDOut: cardinal;
  modTmp: cardinal;

  function authNewEntry(id: cardinal): boolean;
  var
    k: integer;
  begin
    for k := 0 to length(a) - 1 do
      if a[k] = id then
        exit(false);
    result := true;
  end;

  function authRecType(rtmp2: trecord): boolean;
  var
    k: integer;
  begin
    result := false;
    for k := 0 to high(aAuthRecType) do
      if rtmp2.header.name = aAuthRecType[k] then
        exit(true);
  end;

begin

  if start then
    setlength(a, 0);

  if not assigned(r) or bWrongWorkSpace then
    exit;

  for i := 0 to pred(r.fList.count) do
  begin
    f := r.fList[i];
    if f.header.name = 'DATA' then
    begin
      move(f.buffer[0], iCount, sizeOf(cardinal));
      move(f.buffer[4], pCount, sizeOf(cardinal));

      offset := 10;
      // name
      move(f.buffer[offset], tmpCount, sizeOf(cardinal));
      offset := offset + 4 + tmpCount + 2;
      // attachPoint
      offset := offset + 4;
      // attach slots
      move(f.buffer[offset], tmpCount, sizeOf(cardinal));
      offset := offset + 4 + tmpCount * 4;

      // items  ?
      move(f.buffer[offset], tmpCount, sizeOf(cardinal));
      if tmpCount > 0 then
      begin
        // inc(debugerror);
        exit; // in case this happen, unknown
      end;
      offset := offset + 4 + tmpCount * 8;

      // includes
      for j := 1 to iCount do
      begin
        move(f.buffer[offset], modTmp, sizeOf(cardinal));
        if loop < 20 then
        begin
          inc(loop); // call stack security
          getOMODKeywords(getFastRecord(modTmp, headerOMOD), loop, a);
        end;
        offset := offset + 7;
      end;

      // properties
      for j := 1 to pCount do
      begin
        offset := offset + 12;
        move(f.buffer[offset], FormIDOut, sizeOf(cardinal)); // key

        rtmp := getFastRecord(FormIDOut);
        if assigned(rtmp) and authNewEntry(FormIDOut) and authRecType(rtmp) then
        begin
          setlength(a, length(a) + 1);
          a[length(a) - 1] := FormIDOut;
        end;
        offset := offset + 12;
      end;
    end;
  end;;
end;

// ======================save/load datacache refr=========================
function tEspLoader.saveArrayRefr(filename: string): boolean;
var
  f: tmemorystream;
  p: pCardinalPair;
  i: integer;
begin
  result := true;
  f := tmemorystream.create;
  try
    try
      for i := 0 to aRefList[0].count - 1 do
      begin
        p := aRefList[0][i];
        f.Write(p^, sizeOf(rCardinalPair));
      end;
      f.SaveToFile(filename);
    finally
      f.free;
    end;
  except
    result := false;
  end;
end;

function tEspLoader.loadArrayRefr(filename: string): boolean;
var
  f: tmemorystream;
  a, b: cardinal;
begin
  ProgressBar.Position := 0;
  result := true;
  updateStatus(getres('Stat_loadingcacheRef'));
  aRefList[0].clear;
  aRefList[0].PairSorted := false;
  f := tmemorystream.create;
  try
    try
      f.LoadFromFile(filename);
      f.Position := 0;
      repeat
      begin
        f.read(a, sizeOf(cardinal));
        f.read(b, sizeOf(cardinal));
        aRefList[0].AddPair(a, b);
      end;
      until f.Position = f.size;
    finally
      f.free;
      ProgressBar.Position := ProgressBar.max;
      ProgressBar.refresh;
    end;
  except
    result := false;
  end;
end;


// ===============================================

procedure tEspLoader.clearrecordList;
var
  i: integer;
begin
  for i := 0 to recordCompareList.count - 1 do
    trecord(recordCompareList[i]).free;
  recordCompareList.clear;
end;

function tEspLoader.getFirstNode: PVirtualNode;
begin
  if assigned(masterNode) then
    result := VT.GetNext(masterNode)
  else
    result := nil;
end;

function tEspLoader.validNode(Node: PVirtualNode): boolean;
begin
  result := assigned(Node) and (VT.GetNodeLevel(Node) > 0)
end;

function tEspLoader.getQustGrup: PVirtualNode;
begin
  result := getGenericGrup(getFirstNode, headerQUST);
end;

function tEspLoader.getTopScenGrup: PVirtualNode;
begin
  if topScenSet then
    exit(fTopScenGrup);

  if CURRENT_GAME_ID in [0, 4, 5] then
    fTopScenGrup := getQustGrup
  else
    fTopScenGrup := getGenericGrup(getFirstNode, headerSCEN);
  result := fTopScenGrup;
  topScenSet := true;
end;

function tEspLoader.getTopDialGrup: PVirtualNode;
begin
  if topDialSet then
    exit(fTopDialGrup);

  if CURRENT_GAME_ID in [0, 4, 5] then
    fTopDialGrup := getQustGrup
  else
    fTopDialGrup := getGenericGrup(getFirstNode, headerDIAL);
  result := fTopDialGrup;
  topDialSet := true;
end;

function tEspLoader.getGenericGrup(startNode: PVirtualNode; sHeader: sHeaderSig): PVirtualNode;
var
  Node: PVirtualNode;
  DataEsp: pespdata;
begin
  Node := startNode;
  while validNode(Node) do
  begin
    DataEsp := VT.getnodedata(Node);
    if (DataEsp.BasicND.p.sType = sGrup) and (sHeaderString(tGrup(DataEsp.BasicND.p).headerData.sIdent) = sHeader) then
      exit(Node);
    Node := VT.GetNextSibling(Node);
  end;
  result := nil;
end;

function tEspLoader.getDialIDFromInfo(r: trecord): cardinal;
var
  subGrup, infoRec: PVirtualNode;
  DataEsp: pespdata;
begin
  result := 0;
  infoRec := r.espRec;
  if assigned(infoRec) then
  begin
    subGrup := infoRec.Parent;
    DataEsp := VT.getnodedata(subGrup);
    if (DataEsp.BasicND.p.sType = sGrup) and (VT.GetNodeLevel(subGrup) > 1) then
      result := cardinal(tGrup(DataEsp.BasicND.p).headerData.sIdent);
  end;
end;

Function tEspLoader.getQustFromInfo(rInfo: trecord): trecord;
var
  masterDial: PVirtualNode;
  dialID, qustID: cardinal;
  DataEsp: pespdata;
  DialRefRec: trecord;
begin
  result := nil;
  dialID := getDialIDFromInfo(rInfo);
  masterDial := getSubRec(dialID, headerDIAL);
  if assigned(masterDial) then
  begin
    DataEsp := VT.getnodedata(masterDial);
    DialRefRec := trecord(DataEsp.BasicND.p);
    qustID := DialRefRec.getCardinalfromDataRef(sHeaderSig(gamesParams.sQUSTDIALREF));
    result := getFastRecord(qustID, headerQUST);
  end;
end;

function tEspLoader.getSubRec(id: cardinal; hSig: sHeaderSig): PVirtualNode;
var
  r: trecord;
begin
  r := getFastRecordSelf(id, hSig);
  if assigned(r) then
    result := r.espRec
  else
    result := nil;
end;

function tEspLoader.getValidDial(r: trecord): boolean;
var
  Node: PVirtualNode;
  DataEsp: pespdata;
  NodeLvl: cardinal;
begin
  // sub
  if assigned(r) then
  begin
    if r.handleStrings then
      exit(true);
    Node := r.espRec;
    NodeLvl := VT.GetNodeLevel(Node);
    Node := VT.GetNext(Node);
    while assigned(Node) and (VT.GetNodeLevel(Node) >= NodeLvl) do
    begin
      DataEsp := VT.getnodedata(Node);
      if (DataEsp.BasicND.p.sType = sRecord) and (DataEsp.BasicND.p.header.name = headerINFO) and (hasString in trecord(DataEsp.BasicND.p).params) then
        exit(true);
      if (DataEsp.BasicND.p.sType = sRecord) and ((DataEsp.BasicND.p.header.name <> headerINFO)) then
        exit(false);
      Node := VT.GetNext(Node);
    end;
  end;
  result := false;
end;

function tEspLoader.getDialSubGrup(dialNode: PVirtualNode; id: cardinal): PVirtualNode;
var
  Node: PVirtualNode;
  DataEsp: pespdata;
begin
  Node := dialNode;
  // .FirstChild;
  while validNode(Node) and (VT.GetNodeLevel(Node) > 1) do
  begin
    DataEsp := VT.getnodedata(Node);
    if (DataEsp.BasicND.p.sType = sGrup) and (cardinal(tGrup(DataEsp.BasicND.p).headerData.sIdent) = id) then
      exit(Node);
    Node := VT.GetNext(Node);
  end;
  result := nil;
end;

procedure tEspLoader.ValidGrupString(hideGrup: boolean);
var
  Data: pespdata;
  Node: PVirtualNode;
  grupString: boolean;
begin
  Node := getFirstNode;
  while validNode(Node) do
  begin
    Data := VT.getnodedata(Node);
    if Data.BasicND.p.sType = sGrup then
    begin
      grupString := false;
      VT.IterateSubtree(Node, vtIteration.getGrupString, @grupString, [], true);
      tGrup(Data.BasicND.p).grupString := grupString;
      if hideGrup then
        VT.IsVisible[Node] := grupString;
    end;
    Node := VT.GetNext(Node);
  end;
end;

// ------------------------------------------------------
procedure tEspLoader.rebuildAllRecords;
var
  Data: pespdata;
  Node: PVirtualNode;
begin
  ProgressBar.max := VT.TotalCount;
  pBar := 0;
  Node := getFirstNode;
  while validNode(Node) do
  begin
    Data := VT.getnodedata(Node);
    if Data.BasicND.p.sType = sRecord then
      trecord(Data.BasicND.p).rebuildData;
    Node := VT.GetNext(Node);
    // feedback
    UpdatePBar(500);
  end;
end;

procedure tEspLoader.RebuildGrupsSize;
var
  Data: pespdata;
  Node: PVirtualNode;
  grupSize: cardinal;
begin
  ProgressBar.max := VT.TotalCount;
  pBar := 0;
  Node := getFirstNode;
  while validNode(Node) do
  begin
    Data := VT.getnodedata(Node);
    if Data.BasicND.p.sType = sGrup then
    begin
      grupSize := 0;
      VT.IterateSubtree(Node, vtIteration.getgrupSize, @grupSize, [], true);
      tGrup(Data.BasicND.p).header.dsize := grupSize;
    end;
    Node := VT.GetNext(Node);
    // feedback
    UpdatePBar(250);
  end;
end;

function tEspLoader.saveEsp(filename: String): boolean;
var
  fStream: TwbWriteCachedFileStream;
  Data: pespdata;
  Node: PVirtualNode;
  r: trecord;
  fd: tField;
  i: integer;
begin
  result := false;
  rebuildAllRecords;
  RebuildGrupsSize;
  ProgressBar.max := VT.TotalCount;
  pBar := 0;
  fStream := nil;
  // m.create;
  try
    try
      fStream := TwbWriteCachedFileStream.create(filename);
      // record
      Node := getFirstNode;
      while validNode(Node) do
      begin
        Data := VT.getnodedata(Node);
        // case grup
        if Data.BasicND.p.sType = sGrup then
        begin
          fStream.Write(tGrup(Data.BasicND.p).header, sizeOf(rGenericHeader));
          fStream.Write(tGrup(Data.BasicND.p).headerData, sizeOf(rGrupheader));
        end
        // record
        else if Data.BasicND.p.sType = sRecord then
        begin
          r := trecord(Data.BasicND.p);
          fStream.Write(r.header, sizeOf(rGenericHeader));
          fStream.Write(r.headerData, sizeOf(rGenericHeaderData));
          if r.rawrecord or (compressed in r.params) then
          begin
            fStream.writeBuffer(Pointer(r.buffer)^, length(r.buffer));
            if (compressed in r.params) and (not r.rawrecord) then
              setlength(r.buffer, 0); // free the compression buffer
          end
          else
          begin
            for i := 0 to r.fList.count - 1 do
            begin
              fd := r.fList[i];
              fStream.Write(fd.header, sizeOf(fd.header));
              fStream.writeBuffer(Pointer(fd.buffer)^, length(fd.buffer));
            end;
          end;
        end;
        Node := VT.GetNext(Node);
        // feedback
        UpdatePBar(500);
      end;
      result := true;
    except
      On E: Exception do
        dofeedback(E.Message, true);
    end;
  finally
    fStream.free;
  end;
end;

function tEspLoader.openesp(filetoload, filename: String; validate: integer; bLoadAll, bgGetVmad: boolean; loadForCompare: boolean): boolean;
var
  fStream: TwbReadOnlyCachedFileStream;
begin
  result := false;
  fStream := nil;
  VT.beginUpdate;
  try
    try
      fStream := TwbReadOnlyCachedFileStream.create(filetoload);
      // create masterNode
      if not loadForCompare then
        masterNode := VT.AddChild(nil, TespData.create(tMaster.create(sMaster, extractFileName(filename), self))); // -devtest

      if getValidEsp(fStream, not loadForCompare) = validate then
        if loadForCompare then
          result := readCompareData(fStream, bLoadAll)
        else
          result := readEspData(fStream, bLoadAll, bgGetVmad);
    except
      On E: Exception do
        dofeedback(E.Message, true);
    end;
  finally
    fStream.free;
    VT.endUpdate;
  end;
end;

function tEspLoader.getValidEsp(fStream: tstream; saveHeader: boolean): integer;
var
  gh: rGenericHeader;
  ghd: rGenericHeaderData;
  r: trecord;
  endPos: int64;
begin
  result := -1;
  endPos := fStream.size;
  if endPos = 0 then
    exit;
  try
    fRead(fStream, @gh, sizeOf(gh), endPos);
    if gh.name = headerTES4 then
    begin
      fRead(fStream, @ghd, sizeOf(ghd), endPos);
      if fEspMasterVersion = 0 then
      begin
{$IFDEF TES4FORMAT}
        fEspMasterVersion := ghd.fVersion;
{$ELSE TES4FORMAT}
        fEspMasterVersion := 0;
{$ENDIF TES4FORMAT}
      end;
      result := ord(getLocalizedFlag(ghd.flags));
      if saveHeader then // regular laod
      begin
        bWrongWorkSpace := getGameByFormVersion(fEspMasterVersion) <> CURRENT_GAME_ID;
        fTES4Record := trecord.create(gh, sRecord);
        VT.AddChild(masterNode, TespData.create(fTES4Record));
        fTES4Record.headerData := ghd;
        fTES4Record.assignData(fStream, self, false, false, result = 0);
      end
      else // espCompareLoad
      begin
        r := trecord.create(gh, sRecord);
        r.headerData := ghd;
        r.assignData(fStream, self, false, false, result = 0);
        GetCompareMastersData(r);
        r.free;
      end;
    end;
  except
    if saveHeader then
      clearVT;
    result := -1;
  end;
end;

function tEspLoader.getEndPos(Node: PVirtualNode): int64;
var
  Data: pespdata;
begin
  if assigned(Node) and (Node <> VT.RootNode) then
  begin
    Data := VT.getnodedata(Node);
    exit(tGrup(Data.BasicND.p).endPos);
  end;
  result := 0;
end;

function tEspLoader.getNewCurrentNode(var Node: PVirtualNode; const pos: int64): int64;
begin
  if not assigned(Node) then
    exit(0);
  while assigned(Node) and (getEndPos(Node) = pos) do
    Node := Node.Parent;
  result := getEndPos(Node);
end;

function tEspLoader.readEspData(fStream: tstream; bLoadAll, bgGetVmad: boolean): boolean;
var
  gh: rGenericHeader;
  h: rGrupheader;
  newGrup: tGrup;
  newRecord: trecord;
  Node, currentGroupNode: PVirtualNode;
  NewPos, currentGroupEnd: int64;
  endPos: int64;
  bAnalyzeVMAD: boolean;
begin
  result := false;
  currentGroupNode := nil;

  bAnalyzeVMAD := bgGetVmad;

  // -devtest
  // if bGetVMADStringsFromLocalized then
  // bAnalyzeVMAD := true;
  // ------------------------------

  currentGroupNode := masterNode;
  newRecord := nil;
  currentGroupEnd := 0;
  endPos := fStream.size;
  pBar := 0;
  ProgressBar.max := Int64Rec(endPos).Lo;
  try
    try
      while fStream.Position < endPos do
      begin
        newRecord := nil;
        NewPos := fStream.Position;
        // currentGroupEnd
        if fStream.Position = currentGroupEnd then
          currentGroupEnd := getNewCurrentNode(currentGroupNode, fStream.Position);
        // next data
        fRead(fStream, @gh, sizeOf(gh), endPos);
        // grup
        if gh.name = headerGRUP then
        begin
          currentGroupEnd := NewPos + gh.dsize;
          newGrup := tGrup.create(gh, sGrup);
          Node := VT.AddChild(currentGroupNode, TespData.create(newGrup));
          fRead(fStream, @h, sizeOf(h), endPos);
          newGrup.setData(h, currentGroupEnd);
          currentGroupNode := Node;
        end
        else
        // record
        begin
          newRecord := trecord.create(gh, sRecord);
          fRead(fStream, @newRecord.headerData, sizeOf(rGenericHeaderData), endPos);
          newRecord.assignData(fStream, self, true, bAnalyzeVMAD, false);
          // --------------------------------
          if bLoadAll or espKeepValidRecordVT(newRecord) then
          begin
            Compute_FieldIndex(newRecord);
            newRecord.espRec := VT.AddChild(currentGroupNode, TespData.create(newRecord));
            addToFastRecList(newRecord);
          end
          else
            newRecord := nil; // := free;
        end;
        UpdatePBar(1000, Int64Rec(fStream.Position).Lo);
        if cancelStuff then
          raise Exception.create('abort');
      end;
      result := true;
    except
      On E: Exception do
      begin
        clearEspMemoryData;
        if assigned(newRecord) then
          newRecord.free;
        if E.Message <> 'abort' then
          dofeedback(E.Message, true);
      end;
    end;
  finally
  end;
end;

function tEspLoader.readCompareData(fStream: tstream; loadAll: boolean): boolean;
var
  gh: rGenericHeader;
  h: rGrupheader;
  newRecord: trecord;
  endPos: int64;
begin
  endPos := fStream.size;
  result := false;
  pBar := 0;
  ProgressBar.max := Int64Rec(endPos).Lo;
  try
    while fStream.Position < endPos do
    begin
      // next data
      fRead(fStream, @gh, sizeOf(gh), endPos);
      // grup  dont need them on compare
      if gh.name = headerGRUP then
        fRead(fStream, @h, sizeOf(h), endPos)
      else
      // record
      begin
        newRecord := trecord.create(gh, sRecord);
        recordCompareList.Add(newRecord);
        fStream.read(newRecord.headerData, sizeOf(rGenericHeaderData));
        newRecord.assignData(fStream, self, false, false, false);

        newRecord.headerData.formID := setCompareFormIdMapping(newRecord.headerData.formID);
        if newRecord.headerData.formID > 0 then
          espCompareKeepValidRecord(newRecord, recordCompareList);
      end;
      // feedback
      UpdatePBar(1000, Int64Rec(fStream.Position).Lo)
    end;
    result := true;
  except
    On E: Exception do
    begin
      clearrecordList;
      dofeedback(E.Message, true);
    end;
  end;
end;

procedure tEspLoader.addToFastRecList(r: trecord);
begin
  if (usedForAnalysis in r.params) then
  begin
    FastRecList.Add(r);
    if r.header.name = headerSCEN then
      SceneList.Add(r);
  end;
end;

procedure tEspLoader.Compute_FieldIndex(r: trecord);
var
  i, j: integer;
  f, f2: tField;
  indexMax: word;
begin
  // Compute FieldIndex
  for i := 0 to r.fList.count - 1 do
  begin
    f := r.fList[i];
    if (isString in f.params) then
    begin
      inc(nbEspString);
      indexMax := 0;
      for j := i downto 0 do
      begin
        f2 := r.fList[j];
        if (f <> f2) and (cardinal(f.header.name) = cardinal(f2.header.name)) then
        begin
          if indexMax = 0 then
          begin
            f.rIndex.index := f2.rIndex.index + 1;
            indexMax := f.rIndex.index;
          end;
          f.rIndex.indexMax := indexMax;
          f2.rIndex.indexMax := indexMax;
        end;
      end;
    end;
  end;
end;

procedure tEspLoader.espCompareKeepValidRecord(r: trecord; recList: tlist);
var
  i: integer;
begin
  // let's free all none-String fields. InvalidString record already have no fieldList (raw)
  for i := r.fList.count - 1 downto 0 do
  begin
    if tField(r.fList[i]).params * [isString] = [] then // , isEdid
    begin
      tField(r.fList[i]).free;
      r.fList.delete(i);
    end
  end;
  if r.fList.count = 0 then
  begin
    recList.delete(recList.count - 1);
    r.free;
  end;
  Compute_FieldIndex(r);
end;

function tEspLoader.espKeepValidRecordVT(r: trecord): boolean;
var
  i: integer;
  tmpid: cardinal;
  fdelete: boolean;
  f: tField;
begin
  // let's free all none-String fields. InvalidString record already have no fieldList (raw)
  for i := r.fList.count - 1 downto 0 do
  begin
    f := r.fList[i];
    fdelete := f.params * [isString, isEdid] = []; // we keep edid Field

    if not fdelete then
    begin
      // lets remove localized records with id =0 (since they have no string lookup
      fdelete := (isString in f.params);
      if fdelete then
      begin
        if (length(f.buffer) <> sizeOf(cardinal)) then
        begin
          bLocalizedLoadingWarning := true;
          if bLocalizedVerboseWarning then
            dofeedback(format('Analysis error [%s:%s, flags %8x ] should not be a lString)', [string(r.getname), string(f.header.name), r.headerData.flags]));
        end
        else
        begin
          move(f.buffer[0], tmpid, sizeOf(cardinal));
          if tmpid > 0 then
            fdelete := false;
        end;
      end;
    end;

    // --------------------------------------------------------
    if isVMAD in f.params then
      fdelete := false;
    // --------------------------------------------------------
    if isAnalysis in f.params then
      fdelete := false;
    // -------------------------------------------------------

    if fdelete then
    begin
      f.free;
      r.fList.delete(i);
    end;
  end;
  // let's keep afastRec + ref records no matter what.
  if (usedForAnalysis in r.params) then
    exit(true);

  // final result
  if (r.fList.count = 0) or ((r.fList.count = 1) and (r.fList[0] = r.nameField)) then
  begin
    r.free;
    result := false;
  end
  else
  begin
    // r.fList.Capacity := r.fList.Count;
    result := true;
  end;
end;

end.
