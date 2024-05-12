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
unit TESVT_MainLoader;

interface

uses Classes, Controls, sysUtils, math, Dialogs, StdCtrls, VirtualTrees, comCtrls, windows, TESVT_fstreamsave, TESVT_Const,
  TESVT_Ressources, TESVT_Streams, TESVT_SSTFunc, TESVT_typedef, TESVT_Utils, TESVT_espDefinition, TESVT_FastSearch,
  TESVT_scriptPex, TESVT_Undo, TESVT_TranslateFunc, TESVT_VMAD, regularexpressions, regularexpressionscore,
  RegularExpressionsConsts;

Type
  sLoaderType = (sLoaderTypeNone, sLoaderTypeEsp, sLoaderTypePex, sLoaderTypeStr, sLoaderTypeMCM, sLoaderTypeSST);

  rEspStats = record
    nbRec: integer;
    nbField: integer;
    forceReloadUtf8: boolean;
  end;

  iArray3 = array [0 .. 2] of integer;
  skArray3 = array [0 .. 2] of tSkyStr;
  pArray3 = array [0 .. 2] of pVirtualNode;

  tMcMData = class
  public
    McMMemoryStream: tmemorystream;
    fExportStream: tmemorystream;
    MCMheaderList: tstringlist;
    MCMheaderListCompare: tstringlist;
    customTextNormalizedList: tstringlist;
    McmIdType: integer;
    Constructor create;
    Destructor Destroy; override;
    function useLangSuffixe: boolean;
    procedure parseMCM(fstream: tmemorystream; baselist: tlist; bIsOnCompare: boolean); overload;
    procedure parseMCM(f: tstringlist; baselist: tlist; bIsOnCompare: boolean); overload;
    function saveMCM(l: tlist; filename: string; tlistInject: tstringlist = nil): boolean;
    procedure doCompareMCM(l: tlist; fProc: tCompareProc);
  end;

  tTranslatorLoader = class(tObject)
  private
    sAddon_BsaPath: string;
    fUserCacheUpdated: boolean;
    floaderType: sLoaderType;
    procedure sharedIdLoadfillTree(tree: TBaseVirtualTree; Node: pVirtualNode; sk: tSkyStr);
    function NoTransPexCheck(s: string; opt: boolean): boolean;
    procedure setLoaderMode(mode: sTESVTMode);
    procedure setAddonBsaPath(s: string);
    procedure saveVMADStatus;
    procedure setloaderType(l: sLoaderType);
  public
    addon_Name: string;
    addon_Filename: string;
    addon_nameinBSA: string;
    addon_Fullpath: string;
    addon_BSAName: string;
    addon_Folder: string;
    addon_Lang: string;
    addon_Ext: string;
    addon_Hash: integer;
    addon_inBsa: boolean;
    customSSTName: string;
    uGuid: cardinal;
    // -------------------
    addonCanBeCached: boolean; // it's an localized esm; not loaded from cache
    addonSizeForCache: int64; // size on the original gamefile
    // -------------------
    FilteredRecord: cardinal;
    Initialized: boolean;
    settingsSet: boolean;
    bUseOneTree: boolean;
    FontX: single;
    bOptsForLocalString: integer;
    aLoadedStrings: array [0 .. 2] of boolean;
    lastestUsedCodepage: string;
    bVMADAllowed, bUseVMAD: boolean;
    // --------------------
    fLoaderMode: sTESVTMode;
    // ------------backup
    activePage: integer;
    SortColumn: iArray3;
    skTop: skArray3;
    pvTop: pArray3;
    bStatsUpdated: boolean;
    bStatsAuto: boolean;
    bNeedFuz: boolean;
    bQuestListbuilt: boolean;
    // -------------wizard
    savePending: boolean;
    // ------------
    undoList: tlist;
    // ------------
    listarray: tAlist;
    sharedIdList: tlist;
    PexDecompiler: tPexDecompiler;
    EspLoader: tEspLoader;
    espTree: TVirtualStringTree;
    McMData: tMcMData;
    // -------
    QuestsList: tstringlist;
    LDResultList: tstringlist;
    unusedSSTList: tlist;
    // -------
    aColab: array [1 .. MAXCOLAB_ID] of integer;
    aColabLabel: array [1 .. MAXCOLAB_ID] of String;
    lColabLabel: tstringlist;
    // undo -----------
    procedure clearUndoList;
    procedure addUndo(skUndo: tSkyStr; t: cardinal; bAntiFlood: boolean; bUpdateNotif: boolean = true);
    procedure doUndo;
    procedure sanitizeUndoList;
    // ---------------
    procedure excludeInternalParam(sp: sStrInternalParams);
    procedure resetNormalizedHash;
    procedure setDefaultVmadstatus;
    procedure buildEspInheritedData;
    procedure setPlaceHolderForStringNotFound;
    procedure resetForCacheUpdate(resetLocalizedData: boolean);
    procedure cleanUplocalizedUnused(var lookupfailed, sharedIdMaster, sharedIdTarget: integer; bVerbose: boolean = false);
    procedure updateSetting(vTree: integer; bSwitchMode: boolean = false);
    procedure setTopNode;
    procedure updateAllRecords;
    function GetEspStrings(forceutf8: string = ''): rEspStats;
    function GetLocalizedEspStrings: rEspStats;
    function getCleanAddonName(l: boolean): string;
    function getAddonHashStr: string;
    procedure initAddonReferences;
    procedure getaddonHash;
    procedure ResetallTrans;
    procedure ValidateallTrans;
    function GetCaption: string;
    procedure checkFieldSize;
    procedure AddonLoadfillTree;
    procedure getPexString(bOptcheck: boolean);
    procedure addBestLDMatch(sIn, sOut: tSkyStr);
    function getBestLDMatchString(sIn: tSkyStr): String;
    function openPex: boolean;
    constructor create(filename: string; var t: TVirtualStringTree; bOneList: boolean = false);
    destructor Destroy; override;
    property addon_bsaPath: string read sAddon_BsaPath write setAddonBsaPath;
    property loaderType: sLoaderType read floaderType write setloaderType;
    property LoaderMode: sTESVTMode read fLoaderMode write setLoaderMode;

    procedure doCompareEsp(fProc: tCompareProc);
    function getfieldMatch(r1, r2: trecord; fProc: tCompareProc; codepage: rCodepage): integer;
    procedure findHeuristicMatch(fProc: tCompareProc; lId: integer); // listarray: tlist);
    function getTotalVocabCountOnProc(proc: tCompareProc): integer;
    function getTotalStringCount: integer;
    procedure setusercacheUpdated(b: boolean);
    property usercacheUpdated: boolean read fUserCacheUpdated write setusercacheUpdated;
    function savePex(filename: string; injectList: tstringlist = nil): boolean;
    function getModOpenTypeLabel: string;
    function testForValidBSAExport(bsaName: string): boolean;
    procedure doApplySst(sstFile: string; proc: tListSortCompare; fProc, fprocVmad, fProcVmadtrans: tCompareProc; bResetTrans, bTagOnly, bApplyStringID: boolean);
    procedure keepOldData(lEdid, lDirect: tlist);
    procedure GetVMADStrings;
    procedure rebuildVMADBuffers;
    function isColab: boolean;
    function getFormattedMasterList: string;
    procedure UpdateFontSize;
    procedure buildQuestsList;
    procedure drawQuestsList(filter: string; l: tlistBox; bForceRedraw: boolean = false);
    procedure prepareColabExport;
    procedure readColabExport;
    procedure uniqueAudit; overload;
    function uniqueAudit(bnotTranslatedOnly: boolean): integer; overload;
    function OpenCacheProcess(var bLoadedFromCache: boolean): string;
    function CloseCacheProcess(bLoadedFromCache: boolean): integer;
    procedure SortListByStringID;
    procedure lockTES4;
    procedure tagTES4_SNAM;
    function isTaggedTES4_SNAM: boolean;
    function getMasterList: tstringlist;
    procedure updateAllRecordsForStringIDRestoration(bRandom: boolean);
  end;

Function GetListArrayCount(loader: tTranslatorLoader; i: integer): integer;
Function GetUndoCount(loader: tTranslatorLoader): integer;
Function GetMCMIdCount(loader: tTranslatorLoader; i: integer): string;
procedure removeFromComboList(var current: tTranslatorLoader);
function GetNewCurrentLoader: tTranslatorLoader;
procedure tabUpdateComboBox(value: integer);
procedure LoaderListUpdateCaption(current: tTranslatorLoader);
function getUserCacheUpdated(loader: tTranslatorLoader): boolean;
procedure setusercacheUpdated(loader: tTranslatorLoader; b: boolean);
function checkAllUserCacheUpdated: boolean;
function isAlreadyLoaded(filename: string; var index: integer): boolean;
function isAlreadyLoadedBSA(bsaName, filename: string; var index: integer): boolean;
function isLoaderOneList(loader: tTranslatorLoader): boolean;
function getMainLoaderStats(var bEditdata: boolean; bForceOneTree: boolean = true): boolean;
function MainLoaderStatsOutputRaw(id: integer): integer;
function isFuzRequired(loader: tTranslatorLoader; current: cardinal): boolean;
function isFuzLoaded(loader: tTranslatorLoader; current: cardinal): boolean;
function isFuzCompatible(loader: tTranslatorLoader): boolean;
function GetFontX(loader: tTranslatorLoader): single;
function AuthOnCheckAllUserCacheUpdated: boolean;
function getCurrentLoaderIndex(loader: tTranslatorLoader): integer;
function isLoaderHasVMAD(loader: tTranslatorLoader): boolean;
function isLoaderUseVMAD(loader: tTranslatorLoader): boolean;

var
  loaderList: tComboBox;
  MainLoader: tTranslatorLoader;
  mainLoaderStatRaw: array [0 .. 2] of array [1 .. 6] of integer;
  mainLoaderStat: array [0 .. 2] of array [1 .. 6] of double;

implementation

uses TESVT_NPCMap;

constructor tMcMData.create;
begin
  McmIdType := -1;
  McMMemoryStream := tmemorystream.create;
  MCMheaderList := tstringlist.create;
  MCMheaderListCompare := tstringlist.create;
  customTextNormalizedList := tstringlist.create;
  fExportStream := tmemorystream.create;
end;

destructor tMcMData.Destroy;
begin
  McMMemoryStream.free;
  MCMheaderList.free;
  MCMheaderListCompare.free;
  customTextNormalizedList.free;
  fExportStream.free;
  inherited;
end;

procedure tMcMData.parseMCM(f: tstringlist; baselist: tlist; bIsOnCompare: boolean);
var
  i, j, refID: integer;
  tmpid: string;
  sk: tSkyStr;
  RegEx: tperlRegex;
  NormalizedString: string;
begin
  McmIdType := CustomTxtParams.mcmDecider(f);
  if McmIdType = -1 then
    exit;

  RegEx := tperlRegex.create;
  RegEx.RegEx := CustomTxtParams.getRegex(McmIdType);
  refID := CustomTxtParams.getrefId(McmIdType);

  try
    for i := 0 to f.count - 1 do
    begin
      NormalizedString := f[i];
      tmpid := inttohex(i, 8);
      if length(f[i]) <> 0 then
      begin
        RegEx.subject := f[i];
        if RegEx.Match then
        begin
          for j := RegEx.Groupcount downto 1 do
          begin
            if j = refID then
              tmpid := RegEx.Groups[j]
            else
            begin
              if RegEx.Groups[j] <> '' then
              begin
                NormalizedString := MidStrReplace(NormalizedString, '<%' + inttostr(j) + '%>', RegEx.GroupOffsets[j], RegEx.GroupLengths[j]);
                sk := tSkyStr.init(j, i, RegEx.Groups[j], '', 0, 0, [], [], nil, true);
                // iId = refn lId = line
                baselist.add(sk);
              end;
            end;
          end;
        end
      end;

      if not bIsOnCompare then
      begin
        MCMheaderList.add(tmpid);
        customTextNormalizedList.add(NormalizedString);
      end
      else
        MCMheaderListCompare.add(tmpid);
    end;
  finally
    RegEx.free;
  end;
end;

function tMcMData.useLangSuffixe: boolean;
begin
  result := CustomTxtParams.useSuffixe(McmIdType);
end;

procedure tMcMData.parseMCM(fstream: tmemorystream; baselist: tlist; bIsOnCompare: boolean);
var
  f: tstringlist;
begin
  f := tstringlist.create;
  try
    fstream.position := 0;
    f.LoadFromStream(fstream); // , TEncoding.UTF8
    parseMCM(f, baselist, bIsOnCompare);
  finally
    f.free;
  end;
end;

function tMcMData.saveMCM(l: tlist; filename: string; tlistInject: tstringlist = nil): boolean;
var
  f: tstringlist;
  i: integer;
  sk: tSkyStr;
begin
  result := false;
  f := tstringlist.create;
  try
    try
      f.Assign(customTextNormalizedList); // listarray[0]
      for i := 0 to l.count - 1 do
      begin
        sk := l[i];
        f[sk.stringID] := stringreplace(f[sk.stringID], '<%' + inttostr(sk.iId) + '%>', sk.strans, []);
      end;

      if assigned(tlistInject) then
      begin
        f.SaveToStream(fExportStream, CustomTxtParams.getEncoding(McmIdType));
        tlistInject.AddObject(filename, tObject(fExportStream));
      end
      else
        f.SaveToFile(filename, CustomTxtParams.getEncoding(McmIdType));

      result := true;
    except
      On E: Exception do
        doFeedback(E.Message, true);
    end
  finally
    f.free;
  end;
end;

// ---compare MCM

procedure tMcMData.doCompareMCM(l: tlist; fProc: tCompareProc);
var
  i, j, refID: integer;
  sk, sksst: tSkyStr;

  function indexOf(l: tstringlist; s: string): integer;
  var
    i: integer;
  begin
    for i := 0 to l.count - 1 do
      if lowercase(l[i]) = lowercase(s) then
        exit(i);
    result := -1;
  end;

begin
  for i := 0 to LocalVocabBaseList.count - 1 do
  begin
    sksst := LocalVocabBaseList[i];
    refID := indexOf(MCMheaderList, MCMheaderListCompare[sksst.stringID]);
    if refID >= 0 then
      for j := 0 to l.count - 1 do
      begin
        sk := l[j];
        if fProc(sk) and (integer(sk.stringID) = refID) and (sk.iId = sksst.iId) then
        begin
          sk.strans := sksst.s;
          sk.resetStatus([incompleteTrans]);
        end;
      end
  end;
end;
// ---------------------

function isFuzLoaded(loader: tTranslatorLoader; current: cardinal): boolean;
begin
  result := assigned(loader) and (loader.uGuid = current);
end;

function isFuzRequired(loader: tTranslatorLoader; current: cardinal): boolean;
begin
  result := isFuzCompatible(loader) and (loader.uGuid <> current);
end;

function isFuzCompatible(loader: tTranslatorLoader): boolean;
begin
  result := assigned(loader) and loader.bNeedFuz;
end;

Function GetFontX(loader: tTranslatorLoader): single;
begin
  if assigned(loader) then
    result := loader.FontX
  else
    result := -1;
end;

function MainLoaderStatsOutputRaw(id: integer): integer;
begin
  result := mainLoaderStatRaw[0][id] + mainLoaderStatRaw[1][id] + mainLoaderStatRaw[2][id];
end;

function getMainLoaderStats(var bEditdata: boolean; bForceOneTree: boolean = true): boolean;
var
  i, j, k, z: integer;
  aTotal: array [0 .. 2] of integer;
begin
  result := false;
  bEditdata := false;
  if not assigned(MainLoader) then
    exit;
  bEditdata := MainLoader.bStatsAuto;

  if MainLoader.bStatsUpdated then
    exit;

  MainLoader.bStatsAuto := false;
  fillchar(mainLoaderStatRaw, sizeof(mainLoaderStatRaw), 0);
  fillchar(mainLoaderStat, sizeof(mainLoaderStat), 0);
  fillchar(aTotal, sizeof(aTotal), 0);

  for j := 0 to 2 do
  begin
    if bForceOneTree or MainLoader.bUseOneTree then
      k := 0
    else
      k := j;
    for i := 0 to pred(MainLoader.listarray[j].count) do
    begin
      if tSkyStr(MainLoader.listarray[j][i]).isEmpty then
        continue;
      if not tSkyStr(MainLoader.listarray[j][i]).isVisibleVmad(MainLoader.bUseVMAD) then
        continue;
      inc(aTotal[k]);
      // 6=yellow
      // 5=red
      // 4=grey (heuristic)
      // 3=pink
      // 2=blue
      // 1=white
      if lockedTrans in tSkyStr(MainLoader.listarray[j][i]).sparams then
        inc(mainLoaderStatRaw[k][6])
      else if inrange(ceil(tSkyStr(MainLoader.listarray[j][i]).LDResult), 1, 25) then
        inc(mainLoaderStatRaw[k][4])
      else if tSkyStr(MainLoader.listarray[j][i]).sparams * [translated .. validated] = [] then
        inc(mainLoaderStatRaw[k][5])
      else if incompleteTrans in tSkyStr(MainLoader.listarray[j][i]).sparams then
        inc(mainLoaderStatRaw[k][3])
      else if validated in tSkyStr(MainLoader.listarray[j][i]).sparams then
        inc(mainLoaderStatRaw[k][2])
      else if translated in tSkyStr(MainLoader.listarray[j][i]).sparams then
        inc(mainLoaderStatRaw[k][1]);
    end;
  end;
  MainLoader.bStatsUpdated := true;

  // compute %
  if bForceOneTree or MainLoader.bUseOneTree then
    z := 0
  else
    z := 2;
  for j := 0 to z do
    for k := 1 to 6 do
    begin
      if (k > 1) and (mainLoaderStatRaw[j][k] > 0) then
        MainLoader.bStatsAuto := true;
      mainLoaderStat[j][k] := divide(mainLoaderStatRaw[j][k], aTotal[j]) * 100;
    end;

  bEditdata := MainLoader.bStatsAuto;
  result := true;
end;

function isLoaderHasVMAD(loader: tTranslatorLoader): boolean;
begin
  result := assigned(loader) and loader.bVMADAllowed;
end;

function isLoaderUseVMAD(loader: tTranslatorLoader): boolean;
begin
  result := assigned(loader) and loader.bVMADAllowed and loader.bUseVMAD;
end;

function isLoaderOneList(loader: tTranslatorLoader): boolean;
begin
  result := assigned(loader) and loader.bUseOneTree;
end;

function checkAllUserCacheUpdated: boolean;
var
  i: integer;
begin
  result := false;
  for i := 0 to pred(loaderList.items.count) do
    if tTranslatorLoader(loaderList.items.Objects[i]).usercacheUpdated then
      exit(true);
end;

function AuthOnCheckAllUserCacheUpdated: boolean;
begin
  result := true;
  If checkAllUserCacheUpdated then
    result := askDialog(getres('Fbk_UserCacheUpdated'), nil, [askNo, askYes]) = mrYes;
end;

function getUserCacheUpdated(loader: tTranslatorLoader): boolean;
begin
  if assigned(loader) then
    result := loader.usercacheUpdated
  else
    result := false;
end;

procedure setusercacheUpdated(loader: tTranslatorLoader; b: boolean);
begin
  if assigned(loader) then
    loader.usercacheUpdated := b;
end;

Function GetMCMIdCount(loader: tTranslatorLoader; i: integer): string;
begin
  if not assigned(loader) or (i >= loader.McMData.MCMheaderList.count) then
    result := ''
  else
    result := loader.McMData.MCMheaderList[i];
end;

procedure tabUpdateComboBox(value: integer);
var
  i: integer;
begin
  if (loaderList.items.count <= 1) or (loaderList.itemIndex = -1) then
    exit;
  i := loaderList.itemIndex;
  i := i + value;
  if i < 0 then
    i := pred(loaderList.items.count)
  else if i > pred(loaderList.items.count) then
    i := 0;
  loaderList.itemIndex := i;
  loaderList.OnChange(loaderList);
end;

function GetNewCurrentLoader: tTranslatorLoader;
begin
  if (loaderList.itemIndex >= 0) and (loaderList.itemIndex < loaderList.items.count) then
  begin
    result := tTranslatorLoader(loaderList.items.Objects[loaderList.itemIndex]);
    currentTESVmode := result.LoaderMode;
  end
  else
    result := nil;
end;

function getCurrentLoaderIndex(loader: tTranslatorLoader): integer;
var
  i: integer;
begin
  result := -1;
  if loader = nil then
    exit;
  for i := 0 to loaderList.items.count - 1 do
    if tTranslatorLoader(loaderList.items.Objects[i]) = loader then
      exit(i);
end;

function isAlreadyLoadedBSA(bsaName, filename: string; var index: integer): boolean;
var
  i: integer;
begin
  index := -1;
  result := false;
  for i := 0 to loaderList.items.count - 1 do
  begin
    if (tTranslatorLoader(loaderList.items.Objects[i]).addon_bsaPath = bsaName) and (tTranslatorLoader(loaderList.items.Objects[i]).addon_Filename = filename) then
    begin
      index := i;
      exit(true);
    end;
  end;
end;

function isAlreadyLoaded(filename: string; var index: integer): boolean;
var
  i: integer;
begin
  result := false;
  for i := 0 to loaderList.items.count - 1 do
  begin
    if (ansilowercase(tTranslatorLoader(loaderList.items.Objects[i]).addon_Filename) = ansilowercase(filename)) and (tTranslatorLoader(loaderList.items.Objects[i]).addon_bsaPath = '') then
    begin
      index := i;
      exit(true);
    end;
  end;
  index := -1;
end;

procedure LoaderListUpdateCaption(current: tTranslatorLoader);
var
  index: integer;
begin
  index := loaderList.items.indexofObject(current);
  if (Index >= 0) then
  begin
    loaderList.items[index] := tTranslatorLoader(loaderList.items.Objects[index]).GetCaption;
    loaderList.itemIndex := Index;
  end;
end;

procedure removeFromComboList(var current: tTranslatorLoader);
var
  index: integer;
begin
  if not assigned(current) then
    exit;
  index := loaderList.items.indexofObject(current);
  if Index >= 0 then
  begin
    tTranslatorLoader(loaderList.items.Objects[index]).free;
    loaderList.items.delete(index);
    current := nil;
  end;
  // define new index
  dec(index);
  if (index < 0) and (loaderList.items.count > 0) then
    Index := 0;
  loaderList.itemIndex := index;
  loaderList.repaint;
  loaderList.OnChange(loaderList);
end;

Function GetListArrayCount(loader: tTranslatorLoader; i: integer): integer;
begin
  if assigned(loader) then
  begin
    if loader.bUseOneTree then
      result := getTotalVocabCount(loader.listarray)
    else
      result := loader.listarray[i].count;
  end
  else
    result := 0;

end;

Function GetUndoCount(loader: tTranslatorLoader): integer;
begin
  if assigned(loader) then
    result := loader.undoList.count
  else
    result := 0;
end;

// -------------------------------------------

constructor tTranslatorLoader.create(filename: string; var t: TVirtualStringTree; bOneList: boolean = false);
var
  i: integer;
begin
  espTree := t;
  addonCanBeCached := false;
  addonSizeForCache := 0;
  uGuid := GetTickCount;
  // baseStuff
  FilteredRecord := 0;
  bNeedFuz := false;
  savePending := false;
  bUseVMAD := false;
  bOptsForLocalString := -1;
  lastestUsedCodepage := '';
  bQuestListbuilt := false;
  bUseOneTree := bOneList;
  bStatsUpdated := false;
  bStatsAuto := false;
  addon_Filename := filename;
  bVMADAllowed := false;
  initAddonReferences;
  fillchar(aColab, sizeof(aColab), 0);
  fillchar(aLoadedStrings, sizeof(aLoadedStrings), 0);
  for i := 1 to MAXCOLAB_ID do
    aColabLabel[i] := '';
  customSSTName := '';
  sharedIdList := tlist.create;
  LDResultList := tstringlist.create;
  QuestsList := tstringlist.create;
  QuestsList.sorted := true;
  QuestsList.Duplicates := dupIgnore;
  unusedSSTList := tlist.create;
  for i := 0 to 2 do
    listarray[i] := tlist.create;
  undoList := tlist.create;

  lColabLabel := tstringlist.create;
  UpdateFontSize;
end;

destructor tTranslatorLoader.Destroy;
begin
  saveVMADStatus;
  QuestsList.free;

  if loaderType = sLoaderTypeEsp then
    freeAndNil(EspLoader)
  else if loaderType = sLoaderTypePex then
    freeAndNil(PexDecompiler)
  else if loaderType = sLoaderTypeMCM then
    freeAndNil(McMData);

  ClearSkList(sharedIdList, true);
  ClearSkList(unusedSSTList, true);
  cleararrayList(listarray, true, true);
  clearUndoList;
  lColabLabel.free;
  LDResultList.free;
  unusedSSTList.free;
  sharedIdList.free;
  undoList.free;
  inherited;
end;

procedure tTranslatorLoader.setloaderType(l: sLoaderType);
begin
  floaderType := l;

  if floaderType = sLoaderTypeEsp then
    EspLoader := tEspLoader.create(self.espTree)
  else if floaderType = sLoaderTypePex then
    PexDecompiler := tPexDecompiler.create(addon_Filename)
  else if floaderType = sLoaderTypeMCM then
    McMData := tMcMData.create;
end;

function tTranslatorLoader.getMasterList: tstringlist;
begin
  if assigned(EspLoader) then
    result := EspLoader.mastersData
  else
    result := nil;
end;

procedure tTranslatorLoader.tagTES4_SNAM;
var
  r: trecord;
  sk: tSkyStr;
  f: tfield;
  codepage: rCodepage;
begin
  if assigned(EspLoader) and (currentTESVmode = sTESVEsp) then
  begin
    r := EspLoader.TES4Record;
    if assigned(r) then
    begin
      sk := tSkyStr(r.getSkfromDataRef('SNAM'));
      if assigned(sk) then
      begin
        if pos(xtHrTag, sk.strans) = 0 then
        begin
          if sk.strans <> '' then
            sk.strans := sk.strans + sstLineBreak + xtHrTag
          else
            sk.strans := xtHrTag;
        end;
      end
      else
      begin
        f := EspLoader.validateTES4_SNAM;
        if assigned(f) then
        begin
          codepage := getcodepage('_' + Destlanguage, codepageFiles, bforceCpOnSave, '');
          f.updateBuffer('', xtHrTag, codepage.fb, MAXSIZESTRING_TES4_SNAM);
        end;
      end;
    end;
  end;
end;

function tTranslatorLoader.isTaggedTES4_SNAM: boolean;
var
  r: trecord;
  tmpsnam: string;
  tmps: rawbytestring;
  f: tfield;
  codepage: rCodepage;
  b: boolean;
begin
  result := false;
  if assigned(EspLoader) and (currentTESVmode = sTESVEsp) then
  begin
    r := EspLoader.TES4Record;
    if assigned(r) then
    begin
      f := r.getFieldfromDataRef('SNAM');
      if assigned(f) then
      begin
        codepage := getcodepage('_' + sourcelanguage, codepageFiles, bforceCpOnSave, '');
        SetString(tmps, PAnsiChar(@f.buffer[0]), length(f.buffer));
        tmpsnam := rawStringtoString(tmps, codepage, b);
        result := (pos(xtHrTag, tmpsnam) > 0);
      end;
    end;
  end;
end;

procedure tTranslatorLoader.lockTES4;
var
  r: trecord;
  sk: tSkyStr;
begin
  if assigned(EspLoader) then
  begin
    r := EspLoader.TES4Record;
    if assigned(r) then
    begin
      sk := tSkyStr(r.getSkfromDataRef('CNAM'));
      if assigned(sk) then
        sk.resetStatus([lockedTrans]);
      sk := tSkyStr(r.getSkfromDataRef('SNAM'));
      if assigned(sk) then
        sk.resetStatus([lockedTrans]);
    end;
  end;
end;

procedure tTranslatorLoader.setDefaultVmadstatus;
var
  i: integer;
begin
  bUseVMAD := bGetVMADStrings and lfileusingVMAD.find(lowercase(addon_Name), i);
end;

procedure tTranslatorLoader.buildEspInheritedData;
begin
  if assigned(EspLoader) then
    EspLoader.buildInheritedData;
end;

function tTranslatorLoader.OpenCacheProcess(var bLoadedFromCache: boolean): string;
var
  sFileToLoadTmp: string;
begin
  result := addon_Fullpath;
  bLoadedFromCache := false;
  if bUseDataCache then
  begin
    if verifyFileVsCache(addon_Fullpath, addon_Name, addonCanBeCached, addonSizeForCache) then
    begin
      sFileToLoadTmp := datacache + ChangeFileExt(addon_Name, DATACACHE_EXT);
      if authFileAccess(sFileToLoadTmp) then
      begin
        result := sFileToLoadTmp;
        bLoadedFromCache := true;
      end;
    end;
  end;
end;

function tTranslatorLoader.CloseCacheProcess(bLoadedFromCache: boolean): integer;
var
  savecache, saveref: boolean;
begin
  result := 0;
  if bUseDataCache then
  begin
    if bLoadedFromCache then
    begin
      if authFileAccess(datacache + ChangeFileExt(addon_Name, DATACACHE_EXT_REF)) then
        EspLoader.loadArrayRefr(datacache + ChangeFileExt(addon_Name, DATACACHE_EXT_REF));
    end
    else if not bLoadedFromCache and addonCanBeCached then
    begin
      // save
      // 0: not relevant for cache
      // 1: error while saving cache
      // 2: cache saved
      savecache := EspLoader.saveEsp(datacache + ChangeFileExt(addon_Name, DATACACHE_EXT));
      saveref := EspLoader.saveArrayRefr(datacache + ChangeFileExt(addon_Name, DATACACHE_EXT_REF));
      result := ord(savecache and saveref) + 1;
      if result = 2 then
        writeFileVsCache(addon_Name, addonSizeForCache);
    end;
  end;
end;

// --------
procedure tTranslatorLoader.updateAllRecordsForStringIDRestoration(bRandom: boolean);
var
  i, j: integer;
  sk: tSkyStr;
  strID: integer;
begin
  strID := 0;
  // devtest
  if bRandom then
  begin
    inc(strID);
    for j := 0 to 2 do
      for i := 0 to listarray[j].count - 1 do
      begin
        sk := listarray[j][i];
        if not(isVMADString in sk.sInternalparams) then
        begin
          if not(StringIdChanged in sk.sInternalparams) then
          begin
            sk.esp.strID := strID;
            include(sk.sInternalparams, StringIdChanged);
            inc(strID);
          end;

          if assigned(tfield(sk.esp.field)) then
            tfield(sk.esp.field).updateBufferLocalized(sk.esp.strID);
        end;
      end;
    exit;
  end;

  // get Highest stringID
  for j := 0 to 2 do
    for i := 0 to listarray[j].count - 1 do
    begin
      sk := listarray[j][i];
      if StringIdChanged in sk.sInternalparams then
        if sk.esp.strID > strID then
          strID := sk.esp.strID;
    end;
  inc(strID);
  for j := 0 to 2 do
    for i := 0 to listarray[j].count - 1 do
    begin
      sk := listarray[j][i];
      if not(isVMADString in sk.sInternalparams) then
      begin
        if not(StringIdChanged in sk.sInternalparams) then
        begin
          sk.esp.strID := strID;
          include(sk.sInternalparams, StringIdChanged);
          inc(strID);
        end;

        if assigned(tfield(sk.esp.field)) then
          tfield(sk.esp.field).updateBufferLocalized(sk.esp.strID);
      end;
    end;
end;

// ---------
procedure tTranslatorLoader.saveVMADStatus;
var
  a: string;
  i: integer;
begin
  a := lowercase(addon_Name);
  if bUseVMAD then
    lfileusingVMAD.add(a)
  else
  begin
    if lfileusingVMAD.find(a, i) then
      lfileusingVMAD.delete(i);
  end;
end;

procedure tTranslatorLoader.setusercacheUpdated(b: boolean);
var
  doUpdate: boolean;
begin
  doUpdate := fUserCacheUpdated <> b;
  bStatsUpdated := false;
  fUserCacheUpdated := b;
  if doUpdate then
    LoaderListUpdateCaption(self);
end;

procedure tTranslatorLoader.setAddonBsaPath(s: String);
begin
  sAddon_BsaPath := s;
  addon_BSAName := ExtractFileName(s);
  addon_inBsa := true;
end;

function tTranslatorLoader.GetCaption: string;
begin
  if addon_inBsa then
    result := format('%s[%s]%s--->%s', [sModChanged[ord(usercacheUpdated)], getModOpenTypeLabel, addon_BSAName, addon_nameinBSA])
  else
    result := format('%s[%s]%s', [sModChanged[ord(usercacheUpdated)], getModOpenTypeLabel, addon_Name]);
end;

// -------Undo----------------->
procedure tTranslatorLoader.clearUndoList;
var
  i: integer;
begin
  for i := 0 to undoList.count - 1 do
    tUndoData(undoList[i]).free;
  undoList.clear;
end;

Procedure tTranslatorLoader.doUndo;
var
  t: cardinal;
  i: integer;
  u: tUndoData;
begin
  if undoList.count = 0 then
    exit;
  u := undoList[undoList.count - 1];
  t := u.tUndo;
  for i := pred(undoList.count) downto 0 do
  begin
    u := undoList[undoList.count - 1];
    if u.tUndo <> t then
      break;
    u.restoreAndFree;
    undoList.delete(i);
  end;
  bStatsUpdated := false;
end;

procedure tTranslatorLoader.sanitizeUndoList;
begin
  if undoList.count > iUndoListMax then
  begin
    tUndoData(undoList[0]).free;
    undoList.delete(0);
  end;
end;

procedure tTranslatorLoader.addUndo(skUndo: tSkyStr; t: cardinal; bAntiFlood: boolean; bUpdateNotif: boolean = true);
begin
  if t = 0 then
    tAntiFlood := 0;
  if (iUndoListMax = 0) or (bAntiFlood and (tAntiFlood > iUndoAntiFlood)) then
    exit;
  undoList.add(tUndoData.init(skUndo, t));
  sanitizeUndoList;
  undoMenu.enabled := undoList.count > 0;
  if bUpdateNotif then
    usercacheUpdated := true;
  inc(tAntiFlood);
end;

// <-------EndUndo-----------------

procedure tTranslatorLoader.addBestLDMatch(sIn, sOut: tSkyStr);
begin
  LDResultList.AddObject(sOut.s, tObject(sIn))
end;

function tTranslatorLoader.getBestLDMatchString(sIn: tSkyStr): String;
var
  j: integer;
begin
  j := LDResultList.indexofObject(sIn);
  if (j < 0) then
    result := ''
  else
    result := LDResultList[j];
end;

function getRealTopNode(t: TVirtualStringTree): pVirtualNode;
var
  tmpnode2: pVirtualNode;
begin
  if t.totalcount > 0 then
  begin
    result := t.GetNodeat(1, 1);
    if assigned(result) then
    begin
      tmpnode2 := t.GetNodeat(1, 1 + t.NodeHeight[result] div 2);
      if result <> tmpnode2 then
        result := tmpnode2;
    end;
  end
  else
    result := nil;
end;

procedure tTranslatorLoader.updateSetting(vTree: integer; bSwitchMode: boolean = false);
var
  i: integer;
  topNode: pVirtualNode;
begin
  settingsSet := true;
  activePage := vTree;
  for i := 0 to 2 do
  begin
    topNode := getRealTopNode(treearray[i]);
    if assigned(topNode) and not bSwitchMode then
      skTop[i] := ptreedata(treearray[i].getnodedata(topNode)).BasicND.s
    else
      skTop[i] := nil;
    SortColumn[i] := treearray[i].Header.SortColumn;
  end;
end;

procedure tTranslatorLoader.setTopNode;
var
  i: integer;
begin
  for i := 0 to 2 do
    if assigned(pvTop[i]) then
      treearray[i].topNode := pvTop[i];
end;

procedure tTranslatorLoader.setLoaderMode(mode: sTESVTMode);
begin
  fLoaderMode := mode;
  currentTESVmode := fLoaderMode;
end;

procedure tTranslatorLoader.checkFieldSize;
var
  i, j: integer;
  index, strSize: integer;
  strCR: boolean;
  sk: tSkyStr;
  r: trecord;
  f: tfield;
  tmpname: string;
begin
  for j := 0 to 2 do
    for i := 0 to listarray[j].count - 1 do
    begin
      sk := listarray[j][i];
      if sk.isEspAssigned then
      begin
        r := sk.esp.rec;
        f := sk.esp.field;
        tmpname := format('%.4s:%.4s', [r.Header.name, f.Header.name]);

        strSize := length(tSkyStr(f.sk).s); // getsize
        strCR := pos(sLinebreak, tSkyStr(f.sk).s) > 0; // getlinebreak

        if not fieldStrName.find(tmpname, index) then
        begin
          fieldStrName.Insert(index, tmpname);
          fieldStrCR.Insert(index, strCR);
          fieldStrSize.Insert(index, strSize);
        end
        else
        begin
          fieldStrCR[index] := strCR or fieldStrCR[index];
          fieldStrSize[index] := Max(fieldStrSize[index], strSize);
        end;
      end;
    end;
end;

procedure tTranslatorLoader.ValidateallTrans;
var
  i, j: integer;
begin
  for j := 0 to 2 do
    for i := 0 to listarray[j].count - 1 do
      tSkyStr(listarray[j][i]).resetStatus([validated]);
  usercacheUpdated := true;
end;

procedure tTranslatorLoader.ResetallTrans;
var
  i, j: integer;
begin
  for j := 0 to 2 do
    for i := 0 to listarray[j].count - 1 do
      tSkyStr(listarray[j][i]).resetTrans;
  usercacheUpdated := true;
end;

procedure tTranslatorLoader.SortListByStringID;
var
  j: integer;
begin
  if assigned(EspLoader) then
    for j := 0 to 2 do
      listarray[j].sort(compareStrIdLow);
end;

procedure tTranslatorLoader.getaddonHash;
var
  i, j: integer;
begin
  addon_Hash := 0;
  if bUseAddonHash2 then
  begin
    for j := 0 to 2 do
      for i := 0 to listarray[j].count - 1 do
        addon_Hash := doAddonHash(addon_Hash, tSkyStr(listarray[j][i]).hash);
    doFeedback(format('%s [Hash: %s]', [addon_Name, getAddonHashStr]));
  end;
end;

procedure tTranslatorLoader.initAddonReferences;
var
  i: integer;
begin
  Initialized := false;
  settingsSet := false;
  usercacheUpdated := false;
  addon_Name := '';
  addon_nameinBSA := '';
  addon_Fullpath := '';
  addon_bsaPath := '';
  addon_BSAName := '';
  addon_Folder := '';
  addon_Lang := '';
  addon_Hash := 0;
  addon_inBsa := false;
  fLoaderMode := sTESVTNone;
  loaderType := sLoaderTypeNone;
  EspLoader := nil;
  PexDecompiler := nil;
  activePage := 0;
  for i := 0 to 2 do
  begin
    skTop[i] := nil;
    pvTop[i] := nil;
    SortColumn[i] := 3;
  end;
end;

function tTranslatorLoader.getAddonHashStr: string;
begin
  if (not bUseAddonHash2) or (addon_Hash = 0) then
    result := ''
  else
    result := ansilowercase(format('_%.8x', [addon_Hash]));
end;

function tTranslatorLoader.getCleanAddonName(l: boolean): string;
begin
  result := conditionalCase(RemoveFileExt(addon_Name), l);
  if (LoaderMode = sTESVMCM) then
    result := result + '_' + CustomTxtParams.getLabel(McMData.McmIdType)
  else if (LoaderMode = sTESVPex) then
    result := result + pexExt;
end;

procedure tTranslatorLoader.GetVMADStrings;
var
  i, j: integer;
  codepage: rCodepage;
  pVMAD: tVMADDecoder;
  sVMAD: tVMADString;
  skyStr: tSkyStr;
  count: integer;
  tmps: rawbytestring;
  tmpString: string;
begin
  if (EspLoader.VMADList.count = 0) then
    exit;

  // if askDialog(getres('beta_Warning') + getres('VMADFound'), nil, 9, true, [askNo, askYes]) = mrNo
  // --------------------------------------------
  bVMADAllowed := true;
  setDefaultVmadstatus;
  count := 0;
  codepage := getcodepage('_' + sourcelanguage, codepageFiles, 'utf8', '');
  for i := 0 to pred(EspLoader.VMADList.count) do
  begin
    pVMAD := EspLoader.VMADList[i];
    for j := 0 to pred(pVMAD.sList.count) do
    begin
      sVMAD := pVMAD.sList[j];
      SetString(tmps, PAnsiChar(@sVMAD.buffer[0]), length(sVMAD.buffer));
      tmpString := UTF8toString(tmps);
      skyStr := tSkyStr.init(0, 0, tmpString, tmpString, 0, 99, [lockedTrans], [isVMADString], nil);
      skyStr.assignVMADData(sVMAD);
      sVMAD.sk := skyStr;
      // --------------
      listarray[0].add(skyStr);
      inc(count);
    end;
  end;
  doFeedback(getres('VMADkept') + inttostr(EspLoader.VMADList.count));
  doFeedback(getres('VMADdiscarded') + inttostr(EspLoader.BrokenVMAD));
  doFeedback(getres('VMADString') + inttostr(count));
end;

function tTranslatorLoader.GetEspStrings(forceutf8: string = ''): rEspStats;
var
  Data: pespdata;
  Node: pVirtualNode;
  r: trecord;
  f: tfield;
  i: integer;
  tmps: rawbytestring;
  codepage: rCodepage;
  skyStr: tSkyStr;
  rCount: boolean;

  bFallback: boolean;
  nbFallback: integer;
begin
  // -------------------

  result.forceReloadUtf8 := false;
  fillchar(result, sizeof(result), 0);
  codepage := getcodepage('_' + sourcelanguage, codepageFiles, bforceCpOnLoad, forceutf8);
  lastestUsedCodepage := lowercase(codepage.s);
  nbFallback := 0;
  Node := EspLoader.getFirstNode;
  while EspLoader.validNode(Node) do
  begin
    Data := EspLoader.VT.getnodedata(Node);
    if Data.BasicND.p.sType = sRecord then
    begin
      r := trecord(Data.BasicND.p);
      rCount := true;
      for i := 0 to r.fList.count - 1 do
      begin
        f := r.fList[i];
        if isString in f.params then
        begin
          inc(result.nbField);
          if rCount then
          begin
            inc(result.nbRec);
            rCount := false;
          end;

          SetString(tmps, PAnsiChar(@f.buffer[0]), length(f.buffer));
          skyStr := tSkyStr.init(result.nbField, 0, rawStringtoString(tmps, codepage, bFallback), '', f.listIndex, 99, [], [], nil);
          if bFallback then
            inc(nbFallback);
          // --------------
          listarray[f.listIndex].add(skyStr);
          skyStr.assignEspData(r, f);
          f.sk := skyStr;
          // setup check
          getMaxStringSize(r, f);
          if skyStr.isDialog then
            bNeedFuz := true;
          skyStr.setFemaleNPC;
        end;
      end;
    end;
    Node := EspLoader.VT.GetNext(Node);
  end;
  fallbackFbk(nbFallback, codepage);
  GetVMADStrings;
end;

function tTranslatorLoader.GetLocalizedEspStrings: rEspStats;
var
  Data: pespdata;
  Node: pVirtualNode;
  r: trecord;
  f: tfield;
  i: integer;
  tmpid: cardinal;
  skyStr: tSkyStr;
begin
  fillchar(result, sizeof(result), 0);
  Node := EspLoader.getFirstNode;
  while EspLoader.validNode(Node) do
  begin
    Data := EspLoader.VT.getnodedata(Node);
    if Data.BasicND.p.sType = sRecord then
    begin
      r := trecord(Data.BasicND.p);

      for i := r.fList.count - 1 downto 0 do
      begin
        f := r.fList[i];
        if (isString in f.params) then
        begin
          move(f.buffer[0], tmpid, sizeof(cardinal));
          if tmpid > 0 then
          // avoid orphan record with ID=0 when ForceKeepAllFields=true
          begin
            skyStr := tSkyStr.init(0, tmpid, '', '', f.listIndex, 99, [], [], nil, false);
            listarray[f.listIndex].add(skyStr);
            skyStr.assignEspData(r, f);
            f.sk := skyStr;
            // feedback
            inc(result.nbField);
            inc(result.nbRec);
            // setup check
            getMaxStringSize(r, f);
            if skyStr.isDialog then
              bNeedFuz := true;
            skyStr.setFemaleNPC;
          end;
        end;
      end;
    end;
    Node := EspLoader.VT.GetNext(Node);
  end;
  GetVMADStrings;
end;

function getMaxSize(sk: tSkyStr): integer;
begin
  if sk.esp.rName = headerTES4 then
  begin
    if sk.esp.fName = 'CNAM' then
      exit(MAXSIZESTRING_TES4_CNAM)
    else if sk.esp.fName = 'SNAM' then
      exit(MAXSIZESTRING_TES4_SNAM);
  end;
  result := MAXSIZESTRING_GLOBALCAP;
end;

procedure tTranslatorLoader.updateAllRecords;
var
  i, j: integer;
  sk: tSkyStr;
  codepage: rCodepage;
begin
  codepage := getcodepage('_' + Destlanguage, codepageFiles, bforceCpOnSave, '');
  for j := 0 to 2 do
    for i := 0 to listarray[j].count - 1 do
    begin
      sk := listarray[j][i];
      if not(isVMADString in sk.sInternalparams) then
        tfield(sk.esp.field).updateBuffer(sk.s, sk.strans, codepage.fb, getMaxSize(sk));
    end;

  if bVMADAllowed then
    rebuildVMADBuffers;
end;

procedure tTranslatorLoader.sharedIdLoadfillTree(tree: TBaseVirtualTree; Node: pVirtualNode; sk: tSkyStr);
var
  i, k: integer;
begin
  if toLocalizedSharedID in sk.sInternalparams then
  begin
    if FastListSearch(sharedIdList, compareStrIdLow, sk, k, true) then
    begin
      for i := k to sharedIdList.count - 1 do
        if compareStrIdLow(sk, sharedIdList[i]) = 0 then
          tSkyStr(sharedIdList[i]).pnode := tree.AddChild(Node, TNodeData.create(sharedIdList[i]))
        else
          break;
    end;
  end;
end;

procedure tTranslatorLoader.UpdateFontSize;
var
  i, j: integer;
begin
  Testcanvas.font.name := virtualTreeFont;
  Testcanvas.font.size := virtualTreeFontsize[0];
  FontX := -1;
  for j := 0 to 2 do
    for i := 0 to listarray[j].count - 1 do
      if length(tSkyStr(listarray[j][i]).s) > 80 then
      begin
        FontX := Testcanvas.TextWidth(tSkyStr(listarray[j][i]).s) / length(tSkyStr(listarray[j][i]).s);
        exit;
      end;
end;

procedure tTranslatorLoader.AddonLoadfillTree;
var
  i, j, treeId: integer;
  Node: pVirtualNode;
begin
  UpdateFontSize;
  for j := 0 to 2 do
  begin
    treeId := ifThen(bUseOneTree, 0, j);
    pvTop[j] := nil;
    globalBeginUpdate(treearray[j]);

    for i := 0 to listarray[j].count - 1 do
    begin
      Node := treearray[treeId].AddChild(nil, TNodeData.create(listarray[j][i]));
      treearray[treeId].NodeHeight[Node] := getHeightforCell(tSkyStr(listarray[j][i]).s, FontX);
      tSkyStr(listarray[j][i]).pnode := Node;
      tSkyStr(listarray[j][i]).initStrings(true);
      // retrievTopNode
      if assigned(skTop[treeId]) and (skTop[treeId] = tSkyStr(listarray[j][i])) then
        pvTop[treeId] := Node;
      if LoaderMode = sTESVEspStrings then
        sharedIdLoadfillTree(treearray[treeId], Node, listarray[j][i]);
    end;
    globalEndUpdate(treearray[j]);
  end;
end;

function tTranslatorLoader.NoTransPexCheck(s: string; opt: boolean): boolean;
begin
  result := opt and (pos('$', s) = 1);
end;

procedure tTranslatorLoader.getPexString(bOptcheck: boolean);
var
  i: integer;
  sk: tSkyStr;
begin
  for i := 0 to PexDecompiler.pexStringList.count - 1 do
  begin
    sk := tSkyStr.init(0, i, pPex(PexDecompiler.pexStringList[i]).s, pPex(PexDecompiler.pexStringList[i]).s, 0, 99, [], [], nil);
    // noTrans
    if (not pPex(PexDecompiler.pexStringList[i]).auth) or NoTransPexCheck(pPex(PexDecompiler.pexStringList[i]).s, bOptcheck) then
    begin
      sk.resetStatus([lockedTrans]);
      include(sk.sInternalparams, pexNoTrans);
    end
    else if (pPex(PexDecompiler.pexStringList[i]).warn) then
      include(sk.sInternalparams, pexWarn);
    listarray[0].add(sk);
  end;
end;

function tTranslatorLoader.openPex: boolean;
var
  fstream: tmemorystream;
begin
  result := false;
  fstream := tmemorystream.create;
  try
    try
      fstream.loadfromfile(addon_Fullpath);
      result := PexDecompiler.readPex(fstream, false);
      if result then
        SavePexFiletoTmp(fstream, bUseExternalDecompiler, ExtractFileName(addon_Name));
    except
      On E: Exception do
        doFeedback(E.Message, true);
    end;
  finally
    fstream.free;
  end;
end;

procedure tTranslatorLoader.resetForCacheUpdate(resetLocalizedData: boolean);
var
  i, j: integer;
  sk: tSkyStr;
begin
  for j := 0 to 2 do
  begin
    for i := listarray[j].count - 1 downto 0 do
    begin
      sk := listarray[j][i];
      sk.resetTrans(false);

      if resetLocalizedData then
        sk.sInternalparams := sk.sInternalparams - [toLocalizedEsp, toLocalizedSharedID, isSourceInitialized]; //

      // test remove orphan
      if isOrphean in sk.sInternalparams then
      begin
        sk.free;
        listarray[j].delete(i);
      end;
    end;
  end;
  SortListByStringID;
  ClearSkList(sharedIdList, true);
  ClearSkList(unusedSSTList, true);
  clearUndoList;
  Initialized := false;
  setusercacheUpdated(false);
end;

procedure tTranslatorLoader.excludeInternalParam(sp: sStrInternalParams);
var
  i, j: integer;
  sk: tSkyStr;
begin
  for j := 0 to 2 do
    for i := listarray[j].count - 1 downto 0 do
    begin
      sk := listarray[j][i];
      sk.sInternalparams := sk.sInternalparams - sp;
    end;
end;

procedure tTranslatorLoader.resetNormalizedHash;
var
  i, j: integer;
begin
  for j := 0 to 2 do
    for i := listarray[j].count - 1 downto 0 do
      tSkyStr(listarray[j][i]).resetNormalizedHash;
end;

procedure tTranslatorLoader.setPlaceHolderForStringNotFound;
var
  i, j: integer;
  sk: tSkyStr;
begin
  exit;
  for j := 0 to 2 do
  begin
    for i := listarray[j].count - 1 downto 0 do
    begin
      sk := listarray[j][i];
      sk.resetTrans(false);
      sk.sInternalparams := [toLocalizedEsp, isLookupFailed];
      sk.s := format(StringNotFoundPlaceHolder, [sk.esp.strID]);
    end;
  end;
end;

procedure tTranslatorLoader.cleanUplocalizedUnused(var lookupfailed, sharedIdMaster, sharedIdTarget: integer; bVerbose: boolean = false);
var
  i, j: integer;
  sk: tSkyStr;
begin
  lookupfailed := 0;
  sharedIdMaster := 0;
  for j := 0 to 2 do
  begin
    for i := listarray[j].count - 1 downto 0 do
    begin
      sk := listarray[j][i];
      if isOrphean in sk.sInternalparams then
        continue;

      if (toLocalizedSharedID in sk.sInternalparams) then
      begin
        inc(sharedIdMaster);
        if bVerbose then
          doFeedback(format('Shared Field(s): %s', [sk.s]));
      end;

      if not(toLocalizedEsp in sk.sInternalparams) then
        if not(isVMADString in sk.sInternalparams) then
        begin
          if not(isDeleted in sk.sInternalparams) then
          begin
            inc(lookupfailed);
            include(sk.sInternalparams, isLookupFailed);
            include(sk.sInternalparams, toLocalizedEsp);
            if bVerbose then
              doFeedback(formatres('Fbk_RecOrphean', [sk.esp.strID, sk.getEspRef])) // lookupfailed
          end;
          if bDeleteLookUpfailed then
            include(sk.sInternalparams, isDeleted)
          else
            sk.s := format(StringNotFoundPlaceHolder, [sk.esp.strID]);
        end;

      // handle lookupfailed/sharedID
      if isDeleted in sk.sInternalparams then
      begin
        if toLocalizedSharedID in tSkyStr(tfield(sk.esp.field).sk).sInternalparams then
        begin
          exclude(sk.sInternalparams, isDeleted);
          sharedIdList.add(sk)
        end
        else
          sk.free;
        listarray[j].delete(i);
      end;
    end;
  end;
  sharedIdTarget := sharedIdList.count;
  sharedIdList.sort(compareStrIdLow);
end;

procedure tTranslatorLoader.doCompareEsp(fProc: tCompareProc);
var
  j: integer;
  r: trecord;
  Data: pespdata;
  Node: pVirtualNode;
  matchProc: tListSortCompare;
  nbFallback: integer;
begin
  TimeUndo;
  nbFallback := 0;
  // matchProc := comparePureFormIDandEdidNameHash;
  matchProc := comparePureFormID;
  EspLoader.recordCompareList.sort(matchProc); //
  EspLoader.espCompareCodepage.assignCodepage(getcodepage('_' + Destlanguage, codepageFiles, '', forcedCodepage));
  Node := EspLoader.getFirstNode;
  while EspLoader.validNode(Node) do
  begin
    Data := EspLoader.VT.getnodedata(Node);
    if Data.BasicND.p.sType = sRecord then
    begin
      r := trecord(Data.BasicND.p);
      if FastListSearch(EspLoader.recordCompareList, matchProc, r, j, false) then
        nbFallback := nbFallback + getfieldMatch(r, EspLoader.recordCompareList[j], fProc, EspLoader.espCompareCodepage.codepage);
    end;
    Node := EspLoader.VT.GetNext(Node);
  end;
  fallbackFbk(nbFallback, EspLoader.espCompareCodepage.codepage);
end;

function tTranslatorLoader.getfieldMatch(r1, r2: trecord; fProc: tCompareProc; codepage: rCodepage): integer;
var
  i, j: integer;
  f1, f2: tfield;
  tmpstr: rawbytestring;
  tmpstrans: string;
  bDiff: boolean;
  bFallback: boolean;
begin
  result := 0;
  for i := 0 to r1.fList.count - 1 do
  begin
    f1 := r1.fList[i];
    if assigned(f1.sk) then
    begin
      for j := 0 to r2.fList.count - 1 do
      begin
        f2 := r2.fList[j];
        if (isString in f2.params) then
        begin
          if not(compared in f2.params) and (f1.Header.name = f2.Header.name) then
          begin
            include(f2.params, compared);
            if fProc(f1.sk) then
            begin
              // test if new dest string = old dest
              SetString(tmpstr, PAnsiChar(@f2.buffer[0]), length(f2.buffer));
              tmpstrans := rawStringtoString(tmpstr, codepage, bFallback);
              if bFallback then
                result := 1;
              addUndo(tSkyStr(f1.sk), tTimeUndo, true);
              bDiff := (tmpstrans <> tSkyStr(f1.sk).strans);
              tSkyStr(f1.sk).strans := tmpstrans;
              if bDiff then
              begin
                tSkyStr(f1.sk).resetStatus([validated]);
                if (f1.rIndex.IndexMax > 0) or (f2.rIndex.IndexMax > 0) then
                begin
                  tSkyStr(f1.sk).sparams := [incompleteTrans];

                  if f1.rIndex.IndexMax <> f2.rIndex.IndexMax then
                    include(tSkyStr(f1.sk).sInternalparams, bigwarning)
                  else
                    include(tSkyStr(f1.sk).sInternalparams, warning)
                end;
              end
              else
                tSkyStr(f1.sk).resetStatus([translated]);
            end;
            break;
          end;
        end;
      end;
    end;
  end;
end;

function tTranslatorLoader.getTotalStringCount: integer;
var
  j: integer;
begin
  result := 0;
  for j := 0 to 2 do
    result := result + listarray[j].count;
end;

function tTranslatorLoader.getTotalVocabCountOnProc(proc: tCompareProc): integer;
var
  i, j: integer;
begin
  result := 0;
  for j := 0 to 2 do
    for i := 0 to listarray[j].count - 1 do
      if proc(tSkyStr(listarray[j][i])) then
        inc(result);
end;

procedure tTranslatorLoader.findHeuristicMatch(fProc: tCompareProc; lId: integer);
var
  i, j, k: integer;
  sk1, sk2, tmpsk: tSkyStr;
  count: integer;
  limitLD, bestLD: single;
  bBreak: boolean;
begin
  count := 0;
  for k := 0 to listarray[lId].count - 1 do
  begin
    sk1 := listarray[lId].items[k];
    sk1.initStrings(false);
    if sk1.lockedStatus then
      continue;
    if sk1.aWords.count = 0 then
      continue;
    if CancelStuff then
      exit;
    if not fProc(sk1) then
      continue;

    UpdatePBar(20, 0, false);
    sk1.resetTrans;
    tmpsk := nil;
    bestLD := iLDDistanceMax;
    bBreak := false;

    FastListSearch(HeuristicList, compareLowerWordCount, sk1, i, true);
    for j := i to pred(HeuristicList.count) do
    begin
      sk2 := HeuristicList.items[j];
      if not sk2.isRefRec(sk1.esp.rName, sk1.esp.fName, bUseHeuristicRefRec) then
        continue;

      if getWordsMatchHash(sk1, sk2, limitLD, bBreak) then
      begin
        sk2.LDResult := limitLD;
        inc(sk1.LDfound);
        if sk2.LDResult < bestLD then
        begin
          bestLD := sk2.LDResult;
          tmpsk := sk2;
        end;
      end;
      if bBreak then
        break;
    end;

    if assigned(tmpsk) then
    begin
      addUndo(sk1, timedebut, true);
      sk1.LDResult := bestLD;
      sk1.strans := tmpsk.strans;
      addBestLDMatch(sk1, tmpsk);
    end
    else
      inc(count);
  end;

  doFeedback(formatres('Fbk_LDResult', [count, listarray[lId].count, divide(count, listarray[lId].count) * 100]))
end;

// ----------------------------PEX--------------------

function tTranslatorLoader.testForValidBSAExport(bsaName: string): boolean;
var
  i: integer;
  sk: tSkyStr;
begin
  result := bsaName = addon_bsaPath;
  result := result and (loaderType = sLoaderTypePex);

  if result then
  begin
    if bDevDontInjectAllScripts and not PexDecompiler.hasAuthString then
      exit(false);
    for i := 0 to listarray[0].count - 1 do
    begin
      sk := listarray[0][i];
      if (sk.sparams * [translated, lockedTrans, validated] = []) then
        exit(false);
    end;
  end;
end;

function tTranslatorLoader.savePex(filename: string; injectList: tstringlist = nil): boolean;
var
  i: integer;
  t: tstringlist;
  sk: tSkyStr;
begin
  result := false;
  t := tstringlist.create;
  try
    try
      for i := 0 to listarray[0].count - 1 do
      begin
        sk := listarray[0][i];
        if pexNoTrans in sk.sInternalparams then
          t.add(sk.s)
        else
          t.add(AdjustLineBreaks(sk.strans, tlbsLF));
      end;
      result := PexDecompiler.dosavePex(t, filename);
      if result then
        if assigned(injectList) then
          injectList.AddObject(filename, tObject(PexDecompiler.fExportStream))
        else
        begin
          PexDecompiler.fExportStream.SaveToFile(filename);
          PexDecompiler.fExportStream.clear;
        end;
    except
      On E: Exception do
        doFeedback(E.Message, true);
    end;
  finally
    t.free;
  end
end;

function tTranslatorLoader.getModOpenTypeLabel: string;
begin
  if ord(loaderType) <> 4 then
    result := sModOpenType[ord(loaderType)]
  else
    result := Uppercase(CustomTxtParams.getLabel(McMData.McmIdType));
end;

procedure tTranslatorLoader.doApplySst(sstFile: string; proc: tListSortCompare; fProc, fprocVmad, fProcVmadtrans: tCompareProc; bResetTrans, bTagOnly, bApplyStringID: boolean);
var
  j, c, version: integer;
  transParams: sStrParams;
begin
  c := 0;
  try
    if FileExists(sstFile) and loadVocabUserCache(LocalVocabEdidList, LocalVocabBaseList, sstFile, nil, 0, c, [lockedTrans, incompleteTrans], [translated], false, false, lColabLabel, nil, version,
      true) then
    begin
      readColabExport;
      if TESVTSameLanguage then
        transParams := [validated]
      else
        transParams := [translated];

      if assigned(proc) then
        SortVocabEdidList(LocalVocabEdidList, proc, false);
      // pbar
      ProgressBar.Max := getTotalVocabCount(listarray) * 2;
      pBar := 0;
      for j := 0 to 2 do
      begin
        if (LocalVocabEdidList.count = 0) or (not assigned(proc)) then
          findStrMatchEx(LocalVocabBaseList, listarray[j], fProc, [validated], bResetTrans, true, true, false, false)
        else
          findEdidMatchEx(LocalVocabEdidList, listarray[j], fProc, proc, bResetTrans, transParams, [translated], true, bTagOnly, false, bApplyStringID);
      end;
      // VMAD
      if bApplyVMAD and bVMADAllowed then
      begin
        if (LocalVocabEdidList.count = 0) or (not assigned(proc)) then
        begin
          if assigned(fProcVmadtrans) then
            findStrMatchEx(LocalVocabBaseList, listarray[0], fProcVmadtrans, [validated], bResetTrans, true, true, true, true)
        end
        else
        begin
          if assigned(fprocVmad) then
          begin
            SortVocabEdidList(LocalVocabEdidList, compareEspStr_V4Strict, false);
            findEdidMatchEx(LocalVocabEdidList, listarray[0], fprocVmad, compareEspStr_V4Strict, false, [validated], [translated], true, bTagOnly, true, false);
          end;
        end;
      end;
      lockTES4;
    end
    else
      doFeedback(getres('FbK_SSTLoadError'), true);
  finally
    ClearSkList(LocalVocabBaseList, true);
    clearInternalRefList(LocalVocabEdidList);
  end;
end;

procedure tTranslatorLoader.keepOldData(lEdid, lDirect: tlist);
var
  i: integer;
  r: tEspStrRef;
  sk, skDirect: tSkyStr;
begin
  // add not SSTApplied in tmpBaseList
  for i := 0 to pred(lDirect.count) do
  begin
    skDirect := lDirect[i];
    if (not(SSTApplied in skDirect.sInternalparams)) and (skDirect.esp.formID = 0) then
    begin
      sk := tSkyStr.init(0, 0, skDirect.s, skDirect.strans, skDirect.listIndex, 0, skDirect.sparams + [oldData], [unusedInSST], nil, false);
      CopyMemory(@sk.esp, @skDirect.esp, sizeof(rEspPointerLite));
      unusedSSTList.add(sk);
    end;
  end;

  if not(loaderType = sLoaderTypeEsp) then
    exit;

  for i := 0 to pred(lEdid.count) do
  begin
    r := lEdid[i];
    if r.used then
      continue;
    if (r.sk.isEmpty) then
      continue;
    // -------------
    sk := tSkyStr.init(0, r.Data.strID, r.sk.s, r.sk.strans, r.list, 0, r.sparams + [oldData], [unusedInSST], nil, false);
    CopyMemory(@sk.esp, @r.Data, sizeof(rEspPointerLite));
    unusedSSTList.add(sk);
  end;
end;

// ------------------VMAD Exporter----------------------
procedure tTranslatorLoader.rebuildVMADBuffers;
var
  i: integer;
begin
  for i := 0 to pred(EspLoader.VMADList.count) do
    tVMADDecoder(EspLoader.VMADList[i]).exportData;
end;

// ------------------Quest----------------------
function tTranslatorLoader.getFormattedMasterList: string;
var
  i: integer;
begin
  result := '';
  for i := 0 to EspLoader.mastersData.count - 2 do
    result := result + EspLoader.mastersData[i] + '<br>';
end;

procedure tTranslatorLoader.buildQuestsList;
var
  Node: pVirtualNode;
  DataEsp: pespdata;
  grupLvl: cardinal;
  QustID, LastQuestID: cardinal;
  QustRefRec: trecord;
  QustStr: string;
begin
  if loaderType <> sLoaderTypeEsp then
    exit;
  updateStatus(getres('BuildQuestList'));
  EspLoader.buildInheritedData;
  MainLoader.QuestsList.clear;
  Node := EspLoader.topDialGrup;
  grupLvl := EspLoader.VT.GetNodeLevel(Node);
  Node := EspLoader.VT.GetNext(Node);
  LastQuestID := 0;
  while assigned(Node) and (EspLoader.VT.GetNodeLevel(Node) > grupLvl) do
  begin
    DataEsp := EspLoader.VT.getnodedata(Node);
    if (DataEsp.BasicND.p.sType = sRecord) and (DataEsp.BasicND.p.Header.name = headerDIAL) then
    begin
      if EspLoader.getValidDial(trecord(DataEsp.BasicND.p)) then
      begin
        QustID := trecord(DataEsp.BasicND.p).getCardinalfromDataRef(sHeaderSig(gamesParams.sQUSTDIALREF));

        if QustID <> LastQuestID then
        begin
          QustRefRec := EspLoader.getFastRecord(QustID, headerQUST);
          QustStr := getQuestString(QustRefRec, QustID, EspLoader.mastersData);
          QuestsList.AddObject(QustStr, tObject(QustID)); // add Qust Record instead
          LastQuestID := QustID;
        end;
      end;
    end;
    Node := EspLoader.VT.GetNext(Node);
  end;
  bQuestListbuilt := true;
  updateStatus(getres(''));
end;

procedure tTranslatorLoader.drawQuestsList(filter: string; l: tlistBox; bForceRedraw: boolean = false);
var
  i: integer;
begin
  if not bQuestListbuilt then
    buildQuestsList;
  if (l.count = 0) or bForceRedraw then
  begin
    filter := ansilowercase(filter);
    l.items.beginUpdate;
    l.clear;
    for i := 0 to pred(QuestsList.count) do
    begin
      if filter = '' then
        l.items.AddObject(QuestsList[i], QuestsList.Objects[i])
      else if pos(filter, ansilowercase(QuestsList[i])) > 0 then
        l.items.AddObject(QuestsList[i], QuestsList.Objects[i])
    end;
    l.items.endUpdate;
  end;
end;

function tTranslatorLoader.isColab: boolean;
var
  i, j: integer;
begin
  result := false;
  fillchar(aColab, sizeof(aColab), 0);
  for j := 0 to 2 do
    for i := 0 to listarray[j].count - 1 do
      if tSkyStr(listarray[j][i]).colabId > 0 then
      begin
        inc(aColab[tSkyStr(listarray[j][i]).colabId]);
        result := true;
      end;
  {
    for i := 1 to MAXCOLAB_ID do
    begin
    if (aColab[i] = 0) then
    aColabLabel[i] = '';
    end;
  }
end;

procedure tTranslatorLoader.prepareColabExport;
var
  i: integer;
begin
  lColabLabel.clear;
  for i := 1 to MAXCOLAB_ID do
  begin
    if (aColab[i] > 0) and (aColabLabel[i] <> '') then
      lColabLabel.AddObject(aColabLabel[i], tObject(i));
  end;
end;

procedure tTranslatorLoader.readColabExport;
var
  i: integer;
  index: integer;
begin
  for i := 0 to pred(lColabLabel.count) do
  begin
    index := integer(lColabLabel.Objects[i]);
    if inrange(index, 1, MAXCOLAB_ID) then
      aColabLabel[index] := lColabLabel[i];
  end;
  lColabLabel.clear;
end;

procedure tTranslatorLoader.uniqueAudit;
begin
  doFeedback('Uniques: ' + inttostr(MainLoader.uniqueAudit(false)));
  doFeedback('Uniques (notTranslated): ' + inttostr(MainLoader.uniqueAudit(true)));
end;

function tTranslatorLoader.uniqueAudit(bnotTranslatedOnly: boolean): integer;
var
  i, j: integer;
  sk: tSkyStr;
  l: tlist;
begin
  l := tlist.create;
  ProgressBar.Max := getTotalVocabCount(listarray);
  pBar := 0;
  for j := 0 to 2 do
    for i := 0 to listarray[j].count - 1 do
    begin
      sk := listarray[j][i];
      UpdatePBar(pBarFrequencies);
      if bnotTranslatedOnly and (sk.LDResult = 0) then
        continue;
      if not bUseVMAD and sk.isLockedVmad then
        continue;
      addPointertoSortedList(l, compareHashAndSource, sk);
    end;
  // -----------
  result := l.count;
  // UpdatePBar(0, ProgressBar.Max);
  // ------------
  l.clear;
  l.free;
end;

end.
