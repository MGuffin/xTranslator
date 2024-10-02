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
unit TESVT_typedef;

interface

uses classes, sysutils, virtualtrees, virtualtrees.types, Generics.Collections, math, types, graphics, windows, menus, TESVT_espDefinition, TESVT_Const,
  controls, TESVT_Hint, TESVT_Utils, TESVT_VMAD, TESVT_RegexUtils;

type
  rId = record
    id: integer;
    offset: integer;
  end;

  rDialInfo = record
    rId: integer;
    rType: Cardinal;
    rFormid: Cardinal;
    sVoiceID: string;
    hVoiceID: Cardinal;
    comment: string;
  end;

type
  THash = array [0 .. 15] of Byte;

  // ==============================================
  // the 7 first entries must be exactly the same in rEspPointer and rEspPointer because of fast copy memory
  rEspPointer = packed record
    strId: integer;
    formID: Cardinal;
    rName: sHeaderSig;
    fName: sHeaderSig;
    index: word;
    indexMax: word;
    rHash: Cardinal;
    rec: pointer;
    field: pointer;
  end;

  rEspPointerLite = packed record
    strId: integer;
    formID: Cardinal;
    rName: sHeaderSig;
    fName: sHeaderSig;
    index: word;
    indexMax: word;
    rHash: Cardinal;
  end;
  // =============================================

  rStrSearch = record
    banned: boolean;
    s: string;
    nb: integer;
  end;

  pStrSearch = ^rStrSearch;

  // 8 definitions, these params are saved. (size = size of cardinal)
  sStrParam = (translated, // fully translated (white)
    lockedTrans, // locked (yellow)
    incompleteTrans, // partial (pink)
    validated, // validated (blue)
    deprecatedParam1, // old param not used actually
    deprecatedParam2, // old param not used actually
    oldData, // is loaded in sst but not applied/used by the belonging mod (old data from)
    pending // is a not translated string with collab ID (forced to be saved)
    );
  sStrParams = set of sStrParam;
  // Internals not saved.
  sStrInternalParam = (matchedIDfound, //
    isDeleted, // deleted pending (not saved in sst)
    isOneWord, // the string conatians only one word
    lowWarning, // low warning (derived/olddata)
    Warning, // small warning( yellow)
    bigWarning, // big warning( orange)
    nTrans, // has source similar to other strings
    isCache, // the sk is in the cache
    toLocalizedEsp, // the string has been found in esp + string applying process. If not, then the string is a placeholder lookup
    toLocalizedSharedID, // is esp+ string indicate a string that use an ID also used by another string (old issue provoked by early tes5edit for skyrim)
    isSourceInitialized, // the source has been initialized
    isTransInitialized, // the trans has been initialized
    aliasError, // the string has alias not matching
    bHasAliasStrict, // the string source contains alias
    bHasNumber, // the string source contains number
    isOrphean, // in esp + string, indicate a string present in .string file but not used in the esp
    isLookUpFailed, // in esp + string, indicate a string present in .string file but not used in the esp
    unAuthLineBreak, // the string can contains carriage return
    stringSizeError, // the string is bigger that it should
    stringCRError, // the string has a carriage return while it should'nt
    altColor, // for tree view draw (line are white/grey/white/grey etc...), indicate that line is grey
    pexNoTrans, // the string is a function (or is protected) in pex, and is locked
    pexWarn, // the string is editable in pex, and has a warning
    asSpellCheckFault, // the string contains a spellcheck fault
    unUsedInSST, // the string was in SST, and has not been applied (used to retains Old data in sst direct edition)
    fuzWarning, // the string (INFO:NAM1) has no fuz related
    isFemale, // for NPC,: it's a female
    isVMADString, // the string is from a VMAD
    SSTApplied, // the string was in SST, and has been applied /used
    npcWarning, // the string (INFO:NAM1) has no NPC linked
    sourceWhite, // the source string contains only white characterts (0-32 ascii)  for tree view draw
    transWhite, // the trans string contains only white characterts (0-32 ascii) for tree view draw
    derivedComputed, // set if the string has been successfully parsed as derived
    AllUnUsedInSST, // set unused for  Current and proxy calculation
    OnTranslationApiArray, // in line to go in batch for translation api
    OnTranslationApiArray_PreSelection, // in line to go in batch for translation api (preestimated)
    OnTranslationSoftLock, // like locked string, but only in the translation array
    OnTranslationCRLFArray, // the string remove CRLF for virtualArray
    OnTranslationRetry, // an error has been found while restairing string, retry once
    OnTranslationApiArray_block1, // first error on result, allowing it to be rerolled once in virtual array
    OnTranslationApiArray_block2, // seconde error or block fakearray virtual array. specify that this string should not ,use fake array and be sent 1 by 1
    StringIdChanged, // set if the string id is being modified
    doNotTagNoTrans, // set if the string is excluded from the automatic notranstag
    isversion4, // the sk is version 3 in vocabCachesst
    isNormalized // if the source has been normalized
    );
  sStrInternalParams = set of sStrInternalParam;

  sFdrParam = (fdrUser, fdrLoaded, fdrEmpty, fdrFileUnChecked, fdrIsFolder, fdrIsDefaultFolder, fdrIscollapsed);
  sFdrParams = set of sFdrParam;

  tSkyFolder = class
    name: string;
    id: integer;
    count: integer;
    fparams: sFdrParams;
  public
    constructor init(s: string; fp: sFdrParams; i: integer = 0; bIsdefault: boolean = false);
    function getFileName: string;
    function setFileData(s: string; i: integer): boolean;
    function getFolderName: string;
    procedure setFolderData(s: string);
  end;

  tSkyStr = class
  private
    gS, gTrans, gSNormalized: string;
    fproxy: double;
    fNormalizedHash: Cardinal; // Hash of the normalizedString
    procedure setTrans(s: string);
    procedure setSource(str: string);
    procedure InitSourceEx;
    procedure InitTransEx;
    procedure DeepTagCheck;
    procedure internalParamBool(b: boolean; p: sStrInternalParam);
    procedure setProxy;
    function getProxy: double;
    function getNormalizedSource: string;
    function getNormalizedHash: Cardinal;
  public
    iId: Cardinal; // internal ID (not saved)
    listIndex: Byte; // id of list (0: strings/ 1: dlstrings/2: ilstrings
    LDResult: single; // LDistance between the best String
    hash, hashTrans: Cardinal; // Hash of the not translated String /  translated String / slD
    SearchLDResult: integer; // LDistance between the best String in the SearchWindow
    LDFound: integer; // Nb String that have a low distance (<25)
    minWord: integer; // set the size min/max range correspondance to search for LD
    iTagHash: Cardinal; // Hash of the tagList in not translated String
    aWords: TList<Cardinal>; // hash list of all words in nottranslated String
    aRecRef: TList<uInt64>; // List of REC:FIELD  associated to the string
    pNode: pVirtualNode; // tree pointer  (vocab or addon)
    esp: rEspPointer; // point on the record Field (ESPMode)
    VMAD: tVMADString; // VMAD ref string;
    sparams: sStrParams; // saved params  must be 8bits for compatibility
    sInternalparams: sStrInternalParams; // not saved params,  size do not matter
    colabId: Byte;
    constructor init(i, sId: integer; sourceStr, destStr: string; l, ld: integer; sp: sStrParams; spi: sStrInternalParams; node: pVirtualNode; initStr: boolean = true);
    Destructor Destroy; override;
    function resetStatus(v1: sStrParams; bResetVmad: boolean = false; fForceLD: single = 0): boolean;
    function lockedStatus(bResetVmad: boolean = false): boolean;
    function resetTrans(bResetVmad: boolean = false): boolean;
    function isEspAssigned: boolean;
    property proxy: double read getProxy;
    function sLimited(outSize: integer): string;
    function sLimitedDot(outSize: integer): string;
    function sTransLimited(outSize: integer): string;
    function sTransLimitedDot(outSize: integer): string;
    function isVisibleVmad(bGlobalAnalyze: boolean): boolean;
    function isLockedVmad: boolean;
    procedure checkStringIntegrity;
    function stringID: Cardinal; // localized stringID
    property s: string read gS write setSource;
    property sNormalized: string read getNormalizedSource;
    property iNormalizedHash: Cardinal read getNormalizedHash;
    property sTrans: string read gTrans write setTrans;
    procedure setSourceLite(str: string);
    procedure setTransLite(str: string);
    function getUnused: integer;
    procedure setTransEdit(str: string; bTrim: boolean);
    procedure setSourceEdit(str: string; bTrim: boolean);
    procedure initStrings(bSourceOnly: boolean);
    function getEspRef: string;
    function getEdidName: string;
    function getEdidNameExport(bPropIsolated: boolean = false): string;
    function isDialog: boolean;
    function isDialogEditing: boolean;
    procedure AssignEspdata(r: trecord; f: tfield);
    function isEmpty: boolean;
    procedure assignSame;
    function getCardinalfromDataRef(h: sHeaderSig): Cardinal;
    function GetResponseInfo: rDialInfo;
    function GetResponseInfoSF: rDialInfo;
    function GetMiscComponent: aCardinal;
    procedure addRefRec(r, f: sHeaderSig);
    function isRefRec(r, f: sHeaderSig; bRef: boolean): boolean;
    function GetMiscComponentAdv: aaCardinal;
    procedure setFemaleNPC;
    procedure AssignVMADdata(sVMAD: tVMADString);
    function getRecSig: sHeaderSig;
    function getFieldSig: sHeaderSig;
    function getSize: Cardinal;
    function getRecFieldToInt64: uInt64; overload;
    function getRecFieldToInt64(r, f: sHeaderSig): uInt64; overload;
    function getOneWordHash: Cardinal;
    function restoreNormalized(const newS: string; bByPass: boolean): boolean;
    procedure updateNormalizedSourceForRetry;
    procedure resetNormalizedHash;
  end;

  TNodeData = class
  public
    s: tSkyStr;
    constructor create(pS: tSkyStr);
  end;

  rTreeData = record
    BasicND: TNodeData;
  end;

  ptreedata = ^rTreeData;

  TNodeDataBrw = class
  public
    filename, fext: string;
    fsize: integer;
    icon: integer;
    constructor create(fs: Cardinal; s: string; i: integer);
  end;

  rTreeDataBrw = record
    BasicND: TNodeDataBrw;
  end;

  ptreedataBrw = ^rTreeDataBrw;

  TNodeDataFdr = class
  public
    s: tSkyFolder;
    constructor create(pS: tSkyFolder);
  end;

  rTreeDataFdr = record
    BasicND: TNodeDataFdr;
  end;

  ptreedataFdr = ^rTreeDataFdr;

  rSearchData = record
    s1, s2: string;
    mode1, mode2: integer;
    caseSensitive, allList, restrictVisible: boolean;
    strformat: string;
  end;

  rRegexData = record
    s1, s2: string;
    mode1, mode2, LDLevel: integer;
    allList, noAlias, invalidate, bILocked, caseInsensitive: boolean;
  end;

  rfocusedNode = record
    fstring: tSkyStr;
    LDfstring: tSkyStr;
    dialString: tSkyStr;
    bestLDString: string;
    editedEspNode: pVirtualNode;
  end;

  tCompareProc = function(sk: tSkyStr): boolean;

  tnTransProc = function(sk1, sk2: tSkyStr): boolean;

  tStringExport = class
    id: integer;
    pos: integer;
    sk: tSkyStr;
    constructor init(i, p: integer; s: tSkyStr);
  end;

  tEspStrRef = class
    data: rEspPointerLite;
    list: integer;
    sk: tSkyStr;
    sparams: sStrParams;
    colabId: Byte;
    used: boolean;
    constructor init(s: tSkyStr); overload;
    constructor init(s: tSkyStr; esp: rEspPointerLite; l: integer; sp: sStrParams; cId: Byte; bNormaliseHash: boolean); overload;
    procedure adjustData;
  end;

var
  focusedNode: rfocusedNode;
  searchdata: rSearchData;
  RegexData: rRegexData;
  dummySk: tSkyStr;

procedure ResetFocusedData;
function getAliasInString(const s: string; ts: tstringlist): Cardinal; overload;
function getAliasInString(const s: string): Cardinal; overload;
function getAliasInString(const s: string; var iTagHash: Cardinal): boolean; overload;
function getWords(s: string; aWords: TList<Cardinal>): integer;
function getWordsStr(s: string; aStr: TList; originalHash: Cardinal = 0): integer;
function getCap(

  const v, cap: integer): integer;

function addtoListStr(aStr: TList; tmps: string; addNb: integer; originalHash: Cardinal = 0; minLength: integer = 3): integer;
procedure checkTranslation(ts: tstrings; s: string; cap: integer = 5);
procedure checkTranslationSource(ts: tstrings; s: string; cap: integer = 12);
function compareOptEverything(sk: tSkyStr): boolean;

function compareOptNoTrans(sk: tSkyStr): boolean;
function compareOptNoTransAndPartials(sk: tSkyStr): boolean;
function compareOptSelection(sk: tSkyStr): boolean;
function compareOptPartialOnly(sk: tSkyStr): boolean;
function CompareOptDefault(sk: tSkyStr): boolean;

function compareOptEverythingExLocked(sk: tSkyStr): boolean;
function compareOptNoTransExLocked(sk: tSkyStr): boolean;
function compareOptNoTransAndPartialsExLocked(sk: tSkyStr): boolean;
function compareOptSelectionExLocked(sk: tSkyStr): boolean;
function compareOptPartialOnlyExLocked(sk: tSkyStr): boolean;

function compareOptVMAD(sk: tSkyStr): boolean;
function compareOptNoTransExVMAD(sk: tSkyStr): boolean;
function compareOptNoTransAndPartialsExVMAD(sk: tSkyStr): boolean;
function compareOptSelectionExVMAD(sk: tSkyStr): boolean;
function compareOptPartialOnlyExVMAD(sk: tSkyStr): boolean;

function compareOptEverythingExFilter(sk: tSkyStr): boolean;
function compareOptNoTransExFilter(sk: tSkyStr): boolean;
function compareOptNoTransAndPartialsExFilter(sk: tSkyStr): boolean;
function compareOptSelectionExFilter(sk: tSkyStr): boolean;
function compareOptPartialOnlyExFilter(sk: tSkyStr): boolean;

function compareOptEverythingExFilterVMAD(sk: tSkyStr): boolean;
function compareOptNoTransExFilterVMAD(sk: tSkyStr): boolean;
function compareOptNoTransAndPartialsExFilterVMAD(sk: tSkyStr): boolean;
function compareOptSelectionExFilterVMAD(sk: tSkyStr): boolean;
function compareOptPartialOnlyExFilterVMAD(sk: tSkyStr): boolean;

function compareOptBlock(sk: tSkyStr): boolean;
function compareOptSelectionExFilterVMADString(sk: tSkyStr): boolean;
function compareOptPartialOnlyExFilterVMADString(sk: tSkyStr): boolean;
function compareOptSelectionExVMADString(sk: tSkyStr): boolean;
function compareOptPartialOnlyExVMADString(sk: tSkyStr): boolean;

function compareOptEverythingLockedStatus(sk: tSkyStr): boolean;
function compareOptNoTransLockedStatus(sk: tSkyStr): boolean;
function compareOptTranslatedAndValidated(sk: tSkyStr): boolean;
function compareOptNoTransValid(sk: tSkyStr): boolean;
function compareSourceDestEqual(sk: tSkyStr): boolean;
function compareSourceDestDiffandColab(sk: tSkyStr): boolean;
function compareSourceDestDiff(sk: tSkyStr): boolean;
procedure initVocabStrings(list: TList);
procedure addHashtoListHash(s: string; aWords: TList<Cardinal>);
function AuthTrans(h1, h2: Cardinal): boolean;
function isInFilter(sk: tSkyStr): boolean;
function getDummyDialInfo: rDialInfo;
function getTmpDialInfo(id: Cardinal; response: integer): rDialInfo;

implementation

uses TESVT_FastSearch;

function getDummyDialInfo: rDialInfo;
begin
  Fillchar(result, SizeOf(result), 0);
end;

function getTmpDialInfo(id: Cardinal; response: integer): rDialInfo;
begin
  result := getDummyDialInfo;
  result.rId := response;
  result.rFormid := id;
  result.sVoiceID := '';
  result.hVoiceID := 0;
end;

constructor TNodeDataBrw.create(fs: Cardinal; s: string; i: integer);
var
  stmp: string;
begin
  if i = 0 then
  begin
    stmp := ansiLowerCase(extractFileExt(s));
    if stmp = '.pex' then
      icon := 16
    else if stmp = '.txt' then
      icon := 2
    else if stmp = '.strings' then
      icon := 1
    else
      icon := 12;
  end
  else
    icon := i;
  filename := s;
  fext := extractFileExt(filename);
  fsize := fs;
end;

constructor tStringExport.init(i, p: integer; s: tSkyStr);
begin
  self.id := i;
  self.pos := p;
  self.sk := s;
end;

constructor tEspStrRef.init(s: tSkyStr);
begin
  Fillchar(data, SizeOf(rEspPointerLite), 0);
  self.sk := nil;
  used := false;
  list := 0;
  sparams := [];
  colabId := 0;
end;

constructor tEspStrRef.init(s: tSkyStr; esp: rEspPointerLite; l: integer; sp: sStrParams; cId: Byte; bNormaliseHash: boolean);
begin
  CopyMemory(@self.data, @esp, SizeOf(rEspPointerLite));
  self.sk := s;
  list := l;
  sparams := sp;
  colabId := cId;
  used := false;

  if bApplySstOldMasterFix and bNormaliseHash then
  begin
    // normalize rHash- fix for REC with no formID that were saved in sst through not sanitized Hash
    if data.rHash = stringHash(format('[%.8x]', [data.formID])) then
      data.rHash := stringHash(format('[%.8x]', [sanitizeFormID(data.formID)]));
  end;
end;

procedure tEspStrRef.adjustData;
begin
  if Cardinal(self.data.fName) = 0 then
    self.data.fName := ALL_REC;
  if Cardinal(self.data.rName) = 0 then
    self.data.rName := ALL_REC;
end;

function compareString(p1, p2: pointer): integer;
begin
  result := AnsiCompareText(pStrSearch(p2).s, pStrSearch(p1).s);
end;

function compareNb(p1, p2: pointer): integer;
begin
  result := pStrSearch(p1).nb - pStrSearch(p2).nb;
end;

// compare proc
function compareSourceDestEqual(sk: tSkyStr): boolean;
begin
  result := sk.hash = sk.hashTrans;
end;

function compareSourceDestDiff(sk: tSkyStr): boolean;
begin
  result := (sk.hash <> sk.hashTrans);
end;

function compareSourceDestDiffandColab(sk: tSkyStr): boolean;
begin
  result := (sk.colabId <> 0) or (compareSourceDestDiff(sk));
end;

function compareOptNoTransLockedStatus(sk: tSkyStr): boolean;
begin
  result := compareOptEverythingLockedStatus(sk);
  if result then
    result := compareOptNoTrans(sk);
end;

function compareOptEverythingLockedStatus(sk: tSkyStr): boolean;
begin
  if (sk.lockedStatus) then
    result := false
  else
    result := true
end;

function CompareOptDefault(sk: tSkyStr): boolean;
begin
  result := sk.sparams = [];
end;

// ================Compare Simple=============

function compareOptEverything(sk: tSkyStr): boolean;
begin
  result := true
end;

function compareOptNoTrans(sk: tSkyStr): boolean;
begin
  result := sk.sparams * [translated, validated] = [];
end;

function compareOptNoTransAndPartials(sk: tSkyStr): boolean;
begin
  result := sk.sparams * [translated, incompleteTrans, validated] = [];
end;

function compareOptPartialOnly(sk: tSkyStr): boolean;
begin
  result := (incompleteTrans in sk.sparams);
end;

function compareOptSelection(sk: tSkyStr): boolean;
begin
  result := (treearray[sk.listIndex].Selected[pVirtualNode(sk.pNode)]);
end;

// ============Locked Filter===>

function isInFilter(sk: tSkyStr): boolean;
begin
  result := (vsVisible in sk.pNode.States);
end;

function compareOptEverythingExFilter(sk: tSkyStr): boolean;
begin
  result := compareOptEverythingExLocked(sk) and isInFilter(sk);
end;

function compareOptNoTransExFilter(sk: tSkyStr): boolean;
begin

  result := compareOptEverythingExFilter(sk) and (sk.sparams * [translated, validated] = []);
end;

function compareOptNoTransAndPartialsExFilter(sk: tSkyStr): boolean;
begin
  result := compareOptEverythingExFilter(sk) and (sk.sparams * [translated, incompleteTrans, validated] = []);
end;

function compareOptPartialOnlyExFilter(sk: tSkyStr): boolean;
begin
  result := compareOptEverythingExFilter(sk) and (incompleteTrans in sk.sparams);
end;

function compareOptSelectionExFilter(sk: tSkyStr): boolean;
begin
  result := compareOptEverythingExFilter(sk) and (treearray[sk.listIndex].Selected[pVirtualNode(sk.pNode)]);
end;

// ============Locked Simple===>

function compareOptEverythingExLocked(sk: tSkyStr): boolean;
begin
  result := not(compareOptVMAD(sk) or (lockedTrans in sk.sparams)); //
end;

function compareOptNoTransExLocked(sk: tSkyStr): boolean;
begin
  result := compareOptEverythingExLocked(sk) and (sk.sparams * [translated, validated] = []);
end;

function compareOptNoTransAndPartialsExLocked(sk: tSkyStr): boolean;
begin
  result := compareOptEverythingExLocked(sk) and (sk.sparams * [translated, incompleteTrans, validated] = []);
end;

function compareOptPartialOnlyExLocked(sk: tSkyStr): boolean;
begin

  result := compareOptEverythingExLocked(sk) and (incompleteTrans in sk.sparams);
end;

function compareOptSelectionExLocked(sk: tSkyStr): boolean;
begin
  result := compareOptEverythingExLocked(sk) and (treearray[sk.listIndex].Selected[pVirtualNode(sk.pNode)]);
end;

// <============Locked Simple
// ========> VMAD ==============>
function compareOptVMAD(sk: tSkyStr): boolean;
begin
  result := isVMADString in sk.sInternalparams;
end;

function compareOptNoTransExVMAD(sk: tSkyStr): boolean;
begin
  result := compareOptVMAD(sk) and (sk.sparams * [translated, validated] = []);
end;

function compareOptNoTransAndPartialsExVMAD(sk: tSkyStr): boolean;
begin
  result := compareOptVMAD(sk) and (sk.sparams * [translated, incompleteTrans, validated] = []);
end;

function compareOptPartialOnlyExVMAD(sk: tSkyStr): boolean;
begin
  result := compareOptVMAD(sk) and (incompleteTrans in sk.sparams);
end;

function compareOptSelectionExVMAD(sk: tSkyStr): boolean;
begin
  result := compareOptVMAD(sk) and (treearray[sk.listIndex].Selected[pVirtualNode(sk.pNode)]);
end;

// --VMAD in filter
function compareOptEverythingExFilterVMAD(sk: tSkyStr): boolean;
begin
  result := compareOptVMAD(sk) and isInFilter(sk);
end;

function compareOptNoTransExFilterVMAD(sk: tSkyStr): boolean;
begin
  result := compareOptEverythingExFilterVMAD(sk) and (sk.sparams * [translated, validated] = []);
end;

function compareOptNoTransAndPartialsExFilterVMAD(sk: tSkyStr): boolean;
begin
  result := compareOptEverythingExFilterVMAD(sk) and (sk.sparams * [translated, incompleteTrans, validated] = []);
end;

function compareOptPartialOnlyExFilterVMAD(sk: tSkyStr): boolean;
begin
  result := compareOptEverythingExFilterVMAD(sk) and (incompleteTrans in sk.sparams);
end;

function compareOptSelectionExFilterVMAD(sk: tSkyStr): boolean;
begin
  result := compareOptEverythingExFilterVMAD(sk) and ((treearray[sk.listIndex].Selected[pVirtualNode(sk.pNode)]));
end;

// ---------- Vmad String Trans
function compareOptBlock(sk: tSkyStr): boolean;
begin
  result := false;
end;

function compareOptPartialOnlyExVMADString(sk: tSkyStr): boolean;
begin
  result := compareOptVMAD(sk) and (incompleteTrans in sk.sparams);
end;

function compareOptSelectionExVMADString(sk: tSkyStr): boolean;
begin
  result := compareOptVMAD(sk) and (treearray[sk.listIndex].Selected[pVirtualNode(sk.pNode)]);
end;

function compareOptPartialOnlyExFilterVMADString(sk: tSkyStr): boolean;
begin
  result := compareOptEverythingExFilterVMAD(sk) and (incompleteTrans in sk.sparams);
end;

function compareOptSelectionExFilterVMADString(sk: tSkyStr): boolean;
begin
  result := compareOptEverythingExFilterVMAD(sk) and ((treearray[sk.listIndex].Selected[pVirtualNode(sk.pNode)]));
end;

// <======== VMAD <==============

function compareOptTranslatedAndValidated(sk: tSkyStr): boolean;
begin
  result := (translated in sk.sparams) or (validated in sk.sparams);
end;

function compareOptNoTransValid(sk: tSkyStr): boolean;
begin
  result := sk.sparams * [translated, validated] = [];
  // not((translated in sk.sparams) or (validated in sk.sparams));
end;

procedure initVocabStrings(list: TList);
var
  i: integer;
begin
  pBar := 0;
  progressbar.max := list.count;
  for i := 0 to list.count - 1 do
  begin
    if length(tSkyStr(list[i]).s) < 25 then
      tSkyStr(list[i]).initStrings(false);
    UpdatePBar(progressbar.max div 50);
  end;
end;

// ---------------------------

function getCap(

  const v, cap: integer): integer;
begin
  if v > cap then
    result := cap
  else
    result := v;
end;

procedure ResetFocusedData;
begin
  focusedNode.editedEspNode := nil;
  focusedNode.fstring := nil;
  focusedNode.LDfstring := nil;
  focusedNode.bestLDString := '';
end;

constructor TNodeData.create(pS: tSkyStr);
begin
  s := pS;
end;

constructor TNodeDataFdr.create(pS: tSkyFolder);
begin
  s := pS;
end;

procedure tSkyStr.setSource(str: string);
begin
  setSourceLite(str);
  InitSourceEx;
end;

procedure tSkyStr.setTrans(s: string);
begin
  setTransLite(s);
  InitTransEx;
end;

function tSkyStr.getUnused: integer;
begin
  result := ord(AllUnUsedInSST in sInternalparams);
end;

function tSkyStr.getProxy: double;
begin
  if AllUnUsedInSST in sInternalparams then
    result := fproxy + 0.21
  else
    result := fproxy;
end;

procedure tSkyStr.setProxy;
begin
  fproxy := GetStringProxy(gS, gTrans);
  if isCache in sInternalparams then
  begin
    if derivedComputed in sInternalparams then
      fproxy := fproxy + 0.20;
    fproxy := fproxy + iId / 5000.0;
  end;
end;

// --------
function isStringwWhiteChar(s: string): boolean;
begin
  if s = '' then
    exit(true);
  if checkStringWOnlyWhiteChar(s) then
    exit(true)
  else
    result := false;
end;

procedure tSkyStr.internalParamBool(b: boolean; p: sStrInternalParam);
begin
  if b then
    include(sInternalparams, p)
  else
    exclude(sInternalparams, p);
end;

procedure tSkyStr.setSourceLite(str: string);
begin
  gS := cleanString(copy(str, 1, min(length(str), MAXSIZESTRING_GLOBALCAP)));
  hash := stringHash(gS + HashSalt);
  internalParamBool(isStringwWhiteChar(str), sourceWhite);
end;

procedure tSkyStr.setTransLite(str: string);
begin
  gTrans := cleanString(copy(str, 1, min(length(str), MAXSIZESTRING_GLOBALCAP)));
  hashTrans := stringHash(gTrans + HashSalt);
  internalParamBool(isStringwWhiteChar(str), transWhite);
  setProxy;
end;

procedure tSkyStr.setSourceEdit(str: string; bTrim: boolean);
begin
  if bTrim then
    gS := trim(cleanString(copy(str, 1, min(length(str), MAXSIZESTRING_GLOBALCAP)), aCleanChar))
  else
    gS := cleanString(copy(str, 1, min(length(str), MAXSIZESTRING_GLOBALCAP)));
  hash := stringHash(gS + HashSalt);
  internalParamBool(isStringwWhiteChar(str), sourceWhite);
  InitSourceEx;
end;

procedure tSkyStr.setTransEdit(str: string; bTrim: boolean);
begin
  if bTrim then
    gTrans := trim(cleanString(copy(str, 1, min(length(str), MAXSIZESTRING_GLOBALCAP)), aCleanChar))
  else
    gTrans := cleanString(copy(str, 1, min(length(str), MAXSIZESTRING_GLOBALCAP)));
  hashTrans := stringHash(gTrans + HashSalt);
  InitTransEx;
  internalParamBool(isStringwWhiteChar(str), transWhite);
end;

procedure tSkyStr.initStrings(bSourceOnly: boolean);
begin
  if not(isSourceInitialized in sInternalparams) then
    InitSourceEx;
  if bSourceOnly then
    exit;
  if not(isTransInitialized in sInternalparams) then
    InitTransEx;
end;

procedure tSkyStr.checkStringIntegrity;
begin
  self.sInternalparams := self.sInternalparams - [stringSizeError, stringCRError];
  if self.isEspAssigned then
  begin
    if ((not tfield(esp.field).hasCR) and (pos(sLineBreak, gTrans) > 0)) then
      include(self.sInternalparams, stringCRError);
    if ((tfield(esp.field).maxStrSize > 0) and (length(gTrans) > tfield(esp.field).maxStrSize)) then
      include(self.sInternalparams, stringSizeError);
  end;
end;

procedure tSkyStr.InitSourceEx;
begin
  // wordslist   + tag
  aWords.clear;
  exclude(sInternalparams, isOneWord);
  if getAliasInString(gS, iTagHash) then
    include(sInternalparams, bHasAliasStrict);

  getWords(gS, aWords);

  if (aWords.count = 1) and (iTagHash = 0) and regExUtil.noWhiteChar(gS) then
    include(self.sInternalparams, isOneWord);

  // ------
  minWord := aWords.count - (defineHeuristicThreshold(aWords.count) + 1);
  if minWord < 1 then
    minWord := 1;
  // finish
  include(sInternalparams, isSourceInitialized);
  aWords.TrimExcess;
end;

function tSkyStr.isLockedVmad: boolean;
begin
  result := (isVMADString in sInternalparams) and (lockedTrans in sparams);
end;

function tSkyStr.isVisibleVmad(bGlobalAnalyze: boolean): boolean;
begin
  if bGlobalAnalyze then
    result := true
  else
    result := not isLockedVmad;
end;

procedure tSkyStr.InitTransEx;
begin
  sInternalparams := sInternalparams - [aliasError];
  if pos('<', gTrans) > 0 then // just avoid string without that char
    if iTagHash <> getAliasInString(gTrans) then
      DeepTagCheck;
  include(sInternalparams, isTransInitialized);
  checkStringIntegrity
end;

// making direct call to avoid huge strings to travel too much between function --------->
function tSkyStr.sLimited(outSize: integer): string;
begin
  result := copy(gS, 1, min(outSize, length(gS)));
end;

function tSkyStr.sLimitedDot(outSize: integer): string;
begin
  if length(gS) > outSize then
    result := copy(gS, 1, outSize) + ENDING_DOTS
  else
    result := gS;
end;

function tSkyStr.sTransLimited(outSize: integer): string;
begin
  result := copy(gTrans, 1, min(outSize, length(gTrans)));
end;

function tSkyStr.sTransLimitedDot(outSize: integer): string;
begin
  if length(gTrans) > outSize then
    result := copy(gTrans, 1, outSize) + ENDING_DOTS
  else
    result := gTrans;
end;
// <---------

function tSkyStr.stringID: Cardinal; // localized stringID
begin
  result := esp.strId;
end;

function tSkyStr.getSize: Cardinal;
begin
  result := instancesize + aWords.instancesize;
  result := result + retCardinal(length(gS) + length(gTrans)) * SizeOf(Char) + retCardinal(aWords.count) * SizeOf(Cardinal);
end;

procedure tSkyStr.DeepTagCheck;
var
  ts1, ts2: tstringlist;
  i: integer;
begin
  // deep search for alias. only trigger is alias hash doesnt match
  ts1 := tstringlist.create;
  ts2 := tstringlist.create;
  getAliasInString(gS, ts1);
  getAliasInString(gTrans, ts2);
  // the hash alert only occurs if a tag is in trans and not in source.
  for i := 0 to ts1.count - 1 do
    if ts2.indexof(ts1[i]) < 0 then
    begin
      include(sInternalparams, aliasError);
      break;
    end;
  ts1.Free;
  ts2.Free;
end;

function tSkyStr.getEspRef: string;
begin
  if isEspAssigned then
  begin
    result := format('EDID %s FormID %s:%s', [trecord(esp.rec).edidname, trecord(esp.rec).getStringNamelite, sHeaderString(tfield(esp.field).header.name)]);
  end
  else
    result := 'EDID [Null]'
end;

function tSkyStr.getRecSig: sHeaderSig;
begin
  result := self.esp.rName;
end;

function tSkyStr.getFieldSig: sHeaderSig;
begin
  result := self.esp.fName;
end;

function tSkyStr.getEdidName: string;
begin
  if isEspAssigned then
    result := trecord(esp.rec).edidname
  else
    result := format('%.8x|%.5x|%d|%d', [esp.formID, esp.strId, esp.index, esp.indexMax]);
end;

function tSkyStr.getEdidNameExport(bPropIsolated: boolean = false): string;
begin
  if isEspAssigned then
  begin
    if assigned(VMAD) then
    begin
      if bPropIsolated then
        result := trecord(VMAD.VMAD.rec).edidname + ' [' + VMAD.VMAD.propList[VMAD.PropIndex] + ']'
      else
        result := trecord(VMAD.VMAD.rec).edidname + '_' + VMAD.VMAD.propList[VMAD.PropIndex];
    end
    else
      result := trecord(esp.rec).edidname;
  end
  else
    result := format('%.8x|%.8x|%d|%d', [esp.formID, esp.rHash, esp.index, esp.indexMax]);
end;

function tSkyStr.isDialog: boolean;
begin
  result := (esp.rName = headerINFO) and (esp.fName = headerNAM1);
end;

function tSkyStr.isDialogEditing: boolean;
begin
  result := (esp.rName = headerINFO) or (esp.rName = headerDIAL);
end;

function tSkyStr.GetMiscComponent: aCardinal;
var
  r: trecord;
begin
  if self.isEspAssigned then
  begin
    r := trecord(esp.rec);
    result := r.GetMiscComponent(gamesParams.sMISCCMPOREF);
  end
  else
    setlength(result, 0);
end;

function tSkyStr.GetMiscComponentAdv: aaCardinal;
var
  r: trecord;
begin
  if self.isEspAssigned then
  begin
    r := trecord(esp.rec);
    result := r.GetMiscComponentAdv;
  end
  else
  begin
    setlength(result[0], 0);
    setlength(result[1], 0);
  end;

end;

function tSkyStr.GetResponseInfoSF: rDialInfo;
var
  r: trecord;
  i, index: integer;
  f: tfield;
  tmpVoiceID: Cardinal;
begin
  result := getTmpDialInfo(0, 1);

  if not self.isEspAssigned then
    exit;
  r := trecord(esp.rec);
  if r.header.name <> headerINFO then
    exit;
  index := r.fList.indexof(esp.field);
  if index < 0 then
    exit;
  inc(index); // to get NAM2
  if index >= r.fList.count then
    exit;

  result.rFormid := r.headerdata.formID;

  for i := index downto 0 do
  begin
    f := r.fList[i];
    if f.header.name = headerTRDA then
    begin
      move(f.buffer[0], result.rType, SizeOf(Cardinal)); // emotion
      result.rId := 1; // response always 1 in Starfield
      move(f.buffer[4], tmpVoiceID, SizeOf(Cardinal)); // formID audio for starfield

      tmpVoiceID := (tmpVoiceID and $00FFFFFF) or (Cardinal(0) shl 24);

      result.sVoiceID := ansiLowerCase(inttohex(tmpVoiceID, 8));
      result.hVoiceID := stringHash(result.sVoiceID);
      break;
    end
    else if f.header.name = headerNAM2 then
      SetString(result.comment, PAnsiChar(@f.buffer[0]), length(f.buffer) - 1);
  end;
end;

function tSkyStr.GetResponseInfo: rDialInfo;
var
  r: trecord;
  i, index: integer;
  f: tfield;
begin
  if bGameIsSF then
    exit(GetResponseInfoSF);

  result := getTmpDialInfo(0, 1);
  if not self.isEspAssigned then
    exit;
  r := trecord(esp.rec);
  if r.header.name <> headerINFO then
    exit;

  // get field index and eventual override
  index := -1;
  for i := 0 to pred(r.fList.count) do
  begin
    f := r.fList[i];
    if f.header.name = headerIOVR then
      SetString(result.sVoiceID, PAnsiChar(@f.buffer[0]), length(f.buffer) - 1);
    if esp.field = r.fList[i] then
    begin
      index := i;
      break;
    end;
  end;

  if index < 0 then
    exit;
  decPositive(index);

  result.rFormid := r.headerdata.formID;
  if result.sVoiceID = '' then
    result.sVoiceID := inttohex(sanitizeFormID(r.headerdata.formID, $00), 8);
  result.sVoiceID := ansiLowerCase(result.sVoiceID);
  result.hVoiceID := stringHash(result.sVoiceID);

  for i := index to pred(r.fList.count) do
  begin
    f := r.fList[i];
    if f.header.name = headerTRDA then
    begin
      move(f.buffer[0], result.rType, SizeOf(Cardinal));
      // emotion
      result.rId := f.buffer[4]; // Fallout4 Check index 4
    end
    else if f.header.name = headerTRDT then
    begin
      if CURRENT_GAME_ID in [1, 3] then
      begin
        move(f.buffer[0], result.rType, SizeOf(Cardinal));
        result.rId := f.buffer[12];
        // Skyrim
      end;
    end
    else if f.header.name = headerNAM2 then
      SetString(result.comment, PAnsiChar(@f.buffer[0]), length(f.buffer) - 1);
    if i > index + 1 then
      exit;
  end;
end;

function tSkyStr.getCardinalfromDataRef(h: sHeaderSig): Cardinal;
begin
  if isEspAssigned then
    result := trecord(esp.rec).getCardinalfromDataRef(h)
  else
    result := 0;
end;

procedure tSkyStr.setFemaleNPC;
var
  r: trecord;
  value: Cardinal;
begin
  r := trecord(esp.rec);
  value := r.getCardinalfromDataRef(headerACBS);
  if getBit(value, 0) then
    include(self.sInternalparams, isFemale);
end;

procedure tSkyStr.AssignEspdata(r: trecord; f: tfield);
begin
  esp.rec := r;
  esp.field := f;
  esp.formID := r.headerdata.formID;
  esp.fName := f.header.name;
  esp.rName := r.header.name;
  esp.rHash := r.edidNameHash;
  esp.index := f.rIndex.index;
  esp.indexMax := f.rIndex.indexMax;
end;

procedure tSkyStr.AssignVMADdata(sVMAD: tVMADString);
begin
  VMAD := sVMAD;
  esp.rec := trecord(VMAD.VMAD.rec);
  esp.field := trecord(VMAD.VMAD.field);
  esp.formID := trecord(VMAD.VMAD.rec).headerdata.formID;
  esp.fName := headerVMAD;
  esp.rName := trecord(VMAD.VMAD.rec).header.name;
  esp.rHash := stringHash(getEdidNameExport);
  esp.index := 0;
  esp.indexMax := 0;
end;

function tSkyStr.lockedStatus(bResetVmad: boolean = false): boolean;
begin
  if pexNoTrans in sInternalparams then
    exit(true);
  if isLockedVmad then
    exit(not bResetVmad);
  result := false;
end;

function tSkyStr.resetStatus(v1: sStrParams; bResetVmad: boolean = false; fForceLD: single = 0): boolean;
begin
  if lockedStatus(bResetVmad) then
    exit(false);
  sparams := v1;
  LDResult := fForceLD;
  LDFound := 0;
  sInternalparams := sInternalparams - [lowWarning, Warning, bigWarning, nTrans, asSpellCheckFault];
  result := true;
end;

function tSkyStr.resetTrans(bResetVmad: boolean = false): boolean;
begin
  if lockedStatus(bResetVmad) then
    exit(false);
  sTrans := s;
  if (isVMADString in sInternalparams) then
    result := resetStatus([lockedTrans], false, 99)
  else
    result := resetStatus([], false, 99);
end;

function tSkyStr.isEspAssigned: boolean;
begin
  result := assigned(esp.rec) and assigned(esp.field);
end;

constructor tSkyStr.init(i, sId: integer; sourceStr, destStr: string; l, ld: integer; sp: sStrParams; spi: sStrInternalParams; node: pVirtualNode; initStr: boolean = true);
begin
  self.gSNormalized := '';
  self.fNormalizedHash := 0;
  // ---
  self.iId := i;
  self.sparams := sp - [deprecatedParam1];
  self.sInternalparams := spi;
  self.LDResult := ld;
  self.LDFound := 0;
  self.listIndex := l;
  self.SearchLDResult := 0;
  self.iTagHash := 0;
  self.esp.rec := nil;
  self.esp.field := nil;
  self.esp.formID := 0;
  self.esp.fName := ALL_REC;
  self.esp.rName := ALL_REC;
  self.esp.rHash := 0;
  self.esp.index := 0;
  self.esp.indexMax := 0;
  self.esp.strId := sId;
  self.VMAD := nil;
  self.hash := 0;
  self.fproxy := 0;
  colabId := 0;
  self.pNode := node;
  aWords := TList<Cardinal>.create;
  aRecRef := TList<uInt64>.create;
  if initStr then
  begin
    self.s := sourceStr;
    self.sTrans := destStr;
  end
  else
  begin
    setSourceLite(sourceStr);
    setTransLite(destStr);
  end;
end;

function tSkyStr.getOneWordHash: Cardinal;
begin
  if aWords.count > 0 then
    result := aWords[0]
  else
    result := $FFFFFFFF;
end;

function tSkyStr.restoreNormalized(const newS: string; bByPass: boolean): boolean;
var
  a: TArray<string>;
  strtmp: string;
begin
  result := true;

  if (gS <> '') and (newS = '') then
    exit(false);

  if bByPass then
  begin
    self.sTrans := newS;
    exit;
  end;

  strtmp := newS;
  if bHasNumber in self.sInternalparams then
  begin
    a := regExUtil.regExExtractNumber(gS);
    result := regExUtil.regExReplaceValues(rxNormalizedNumber, strtmp, a);
  end;
  if bHasAliasStrict in self.sInternalparams then
  begin
    a := regExUtil.regExExtractAliasStrict(gS);
    result := result and regExUtil.regExReplaceValues(rxNormalizedAliasRestore, strtmp, a);
  end;
  if result then
    self.sTrans := strtmp;
end;

function tSkyStr.getNormalizedSource: string;
begin
  if not(isNormalized in self.sInternalparams) then
  begin
    gSNormalized := gS;
    if regExUtil.regExNormalizeAlias(gSNormalized) then
      include(self.sInternalparams, bHasAliasStrict);
    if regExUtil.regExNormalizeNumber(gSNormalized) then
      include(self.sInternalparams, bHasNumber);
    include(self.sInternalparams, isNormalized);
  end;
  result := gSNormalized;
end;

procedure tSkyStr.updateNormalizedSourceForRetry;
begin
  gSNormalized := gS;
  if regExUtil.regExNormalizeAlias(gSNormalized) then
    include(self.sInternalparams, bHasAliasStrict);
  include(self.sInternalparams, isNormalized);
  exclude(self.sInternalparams, bHasNumber);
end;

procedure tSkyStr.resetNormalizedHash;
begin
  fNormalizedHash := 0;
end;

function tSkyStr.getNormalizedHash: Cardinal;
begin
  if fNormalizedHash = 0 then
    fNormalizedHash := stringHash(getNormalizedSource);
  result := fNormalizedHash;
end;

function tSkyStr.getRecFieldToInt64: uInt64;
begin
  result := getRecFieldToInt64(getFieldSig, getRecSig);
end;

function tSkyStr.getRecFieldToInt64(r, f: sHeaderSig): uInt64;
begin
  Int64Rec(result).Lo := SwapEndian32uasm(Cardinal(r));
  Int64Rec(result).Hi := SwapEndian32uasm(Cardinal(f));
end;

procedure tSkyStr.addRefRec(r, f: sHeaderSig);
var
  u: uInt64;
  index: integer;
begin
  // create a list with all Rec:Field encountered by the string
  u := getRecFieldToInt64(r, f);
  if not aRecRef.BinarySearch(u, index) then
    aRecRef.Insert(index, u);
end;

function tSkyStr.isRefRec(r, f: sHeaderSig; bRef: boolean): boolean;
var
  index: integer;
begin
  if not bRef then
    exit(true);

  if ((r = ALL_REC) and (f = ALL_REC)) or (aRecRef.count = 0) then
    result := true
  else
    result := aRecRef.BinarySearch(getRecFieldToInt64(r, f), index)
end;

function tSkyStr.isEmpty: boolean;
begin
  result := (gS = '') and (gS = gTrans);
end;

procedure tSkyStr.assignSame;
begin
  sTrans := s;
  resetStatus([translated]);
end;

destructor tSkyStr.Destroy;
begin
  aWords.Free;
  aRecRef.Free;
  inherited;
end;

// ======================================vocabfolder======================================
constructor tSkyFolder.init(s: string; fp: sFdrParams; i: integer = 0; bIsdefault: boolean = false);
begin
  // (fdrUser, fdrLoaded, fdrEmpty, fdrFileChecked, fdrIsFolder, fdrIsDefaultFolder, fdrIscollapsed);
  self.fparams := fp;
  self.id := i;
  self.count := 0;

  if fdrIsFolder in fp then
  begin
    setFolderData(s);
    if bIsdefault then
      include(self.fparams, fdrIsDefaultFolder);
  end
  else
    self.name := ansiLowerCase(s);
end;

procedure tSkyFolder.setFolderData(s: string);
var
  a: sArray;
  i: integer;
begin
  explode(s, a, sBar);
  for i := 0 to length(a) - 1 do
    case i of
      0: self.name := ansiLowerCase(a[0]);
      1:
        if a[1] = '1' then
          include(self.fparams, fdrIsDefaultFolder);
      2:
        if a[2] = '1' then
          include(self.fparams, fdrIscollapsed);
    end;
end;

function tSkyFolder.setFileData(s: string; i: integer): boolean;
var
  a: sArray;
begin
  result := false;
  explode(s, a, sBar);
  if length(a) > 0 then
  begin
    if ansiLowerCase(a[0]) = ansiLowerCase(name) then
    begin
      if (length(a) > 1) and (a[1] = '1') then
        include(self.fparams, fdrFileUnChecked);
      self.id := i;
      result := true;
    end;
  end;
end;

function tSkyFolder.getFileName: string;
const
  tag: array [0 .. 1] of string = ('0', '1');
begin
  result := name + '|' + tag[ord((fdrFileUnChecked in self.fparams))];
end;

function tSkyFolder.getFolderName: string;
const
  tag: array [0 .. 1] of string = ('0', '1');
begin
  result := '*' + self.name + '|' + tag[ord(fdrIsDefaultFolder in self.fparams)] + '|' + tag[ord((fdrIscollapsed in self.fparams))];
end;

// ======================================
function getAliasInString(const s: string; var iTagHash: Cardinal): boolean;
var
  a: TArray<string>;
  i: integer;
  strtmp, strNormalized: string;
begin
  strtmp := '';
  a := regExUtil.regExExtractAliasStrict(s);
  strNormalized := s;
  if length(a) > 0 then
  begin
    result := true;
    for i := 0 to length(a) - 1 do
      strtmp := strtmp + a[i];
    iTagHash := stringHash(ansiLowerCase(strtmp));
  end
  else
    result := false;
end;

function getAliasInString(const s: string): Cardinal;
var
  a: TArray<string>;
  i: integer;
  strtmp: string;
begin
  strtmp := '';
  a := regExUtil.regExExtractAliasStrict(s);
  if length(a) > 0 then
  begin
    for i := 0 to length(a) - 1 do
      strtmp := strtmp + a[i];
    result := stringHash(ansiLowerCase(strtmp));
  end
  else
    result := 0;
end;

function getAliasInString(const s: string; ts: tstringlist): Cardinal;
var
  a: TArray<string>;
  i: integer;
  strtmp: string;
begin
  strtmp := '';
  a := regExUtil.regExExtractAliasStrict(s);
  for i := 0 to length(a) - 1 do
    ts.Add(a[i]);
  result := stringHash(ansiLowerCase(ts.text));
end;

procedure addHashtoListHash(s: string; aWords: TList<Cardinal>);
var
  h: Cardinal;
begin
  h := stringHash(ansiLowerCase(s));
  aWords.Add(h);
end;

function getWords(s: string; aWords: TList<Cardinal>): integer;
var
  i: integer;
  a: TArray<string>;
begin
  a := regExUtil.regExExtractWords(s);
  result := length(a);
  for i := 0 to min(iWordThreshold, length(a) - 1) do
    addHashtoListHash(a[i], aWords);
end;

function addtoListStr(aStr: TList; tmps: string; addNb: integer; originalHash: Cardinal = 0; minLength: integer = 3): integer;
var
  j: integer;
  pS: pStrSearch;
begin
  result := 0;
  if (length(tmps) > minLength) then
  begin
    for j := 0 to aStr.count - 1 do
    begin
      pS := aStr[j];
      if pS^.s = tmps then
      begin
        if not pS^.banned then
          inc(pS^.nb, addNb);
        exit(pS^.nb);
      end;
    end;
    pS := new(pStrSearch);
    pS^.s := tmps;
    pS^.nb := addNb;
    aStr.Add(pS);
    pS^.banned := not(AuthTrans(originalHash, stringHash(tmps)));
    result := addNb;
  end;
end;

function getWordsStr(s: string; aStr: TList; originalHash: Cardinal = 0): integer;
var
  i: integer;
  a: TArray<string>;
begin
  result := 0;
  a := regExUtil.regExExtractWords(s);
  for i := 0 to length(a) - 1 do
    result := max(result, addtoListStr(aStr, a[i], 1, originalHash));
end;

// -----------------------------

procedure checkTranslationSource(ts: tstrings; s: string; cap: integer = 12);
var
  t: TList;
  i: integer;
begin
  ts.clear;
  t := TList.create;
  getWordsStr(s, t);
  t.sort(compareString);
  for i := t.count - 1 downto 0 do
  begin
    if ts.count < cap then
      ts.Add(pStrSearch(t[i]).s);
    dispose(pStrSearch(t[i]));
  end;
  t.Free;
end;

procedure checkTranslation(ts: tstrings; s: string; cap: integer = 5);
var
  i, k, nbMax: integer;
  hash: Cardinal;
  t: TList;
  sk: tSkyStr;
  tmpstr: string;
const
  idSearch: array [0 .. 1] of integer = (0, 2);
  nbMaxCap = 99;
begin
  tmpstr := trim(ansiLowerCase(s));
  if length(tmpstr) < 3 then
    exit;
  hash := stringHash(tmpstr);
  ts.clear;
  t := TList.create;
  nbMax := 0;
  // one word
  for i := 0 to onewordList.count - 1 do
  begin
    sk := onewordList[i];
    if (sk.aWords[0] = hash) then
    begin
      addtoListStr(t, ansiLowerCase(RemoveChar(sk.sTrans)), nbMaxCap, 0, 1);
      nbMax := nbMaxCap;
    end;
  end;
  // deep search - avoid list dlStrings, too messy.
  if nbMax = 0 then
    for i := 0 to vocabBaseList.count - 1 do
    begin
      sk := vocabBaseList[i];
      if sk.aWords.count > 20 then
        continue;
      for k := 0 to sk.aWords.count - 1 do
        if sk.aWords[k] = hash then
        begin
          nbMax := max(nbMax, getWordsStr(sk.sTrans, t, hash));
          break;
        end;
      if nbMax > nbMaxCap then
        break;
    end;
  // finalize
  t.sort(compareNb);
  nbMax := (nbMax + 5) div 3;
  if nbMax > 1 then
    for i := t.count - 1 downto 0 do
    begin
      if (ts.count < cap) and not(pStrSearch(t[i]).banned) and (pStrSearch(t[i]).nb >= nbMax) then
        ts.Add(pStrSearch(t[i]).s);
      dispose(pStrSearch(t[i]));
    end;
  t.Free;
end;

function AuthTrans(h1, h2: Cardinal): boolean;
var
  i, j: integer;
  sk: tSkyStr;
begin
  result := true;
  if h1 = 0 then
    exit;
  dummySk.hashTrans := h2;
  if FastListSearch(onewordList, compareHashTrans, dummySk, i, true) then
    for j := i to onewordList.count - 1 do
    begin
      sk := onewordList[j];
      if (sk.hashTrans <> h2) then
        exit;
      result := sk.aWords[0] = h1;
      if result then
        exit;
    end;
end;

end.
