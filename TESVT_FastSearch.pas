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
unit TESVT_FastSearch;

interface

uses classes, TESVT_typedef, sysutils, TESVT_const;

function addPointertoSortedList(List: Tlist; Compare: TListSortCompare; p: pointer): Boolean; overload;
function addPointertoSortedList(List: Tlist; Compare: TListSortCompare; p: pointer; var index: integer): Boolean; overload;
function forcedPointertoSortedList(List: Tlist; Compare: TListSortCompare; p: pointer): Boolean;
function FastListSearch(List: Tlist; Compare: TListSortCompare; p: pointer; var newindex: integer; getlowest: Boolean): Boolean;
procedure sortListArray(aList: tAlist; Compare: TListSortCompare);

function compareHashAndSourceNormalized(p1, p2: pointer): integer;
function compareInternalId(p1, p2: pointer): integer;
function compareStrId(p1, p2: pointer): integer;
function compareStrIdLow(p1, p2: pointer): integer;
function compareSource(p1, p2: pointer): integer;
function compareTrans(p1, p2: pointer): integer;
function compareHashTrans(p1, p2: pointer): integer;
function compareHashSourceAndInternalId(p1, p2: pointer): integer;
function compareWordCoundAndHashAndHashTrans(p1, p2: pointer): integer;
function compareEdidName(p1, p2: pointer): integer;
function compareEdidNameHash(p1, p2: pointer): integer;
function compareFormIDandEdidNameHash(p1, p2: pointer): integer;
function comparePureFormIDandEdidNameHash(p1, p2: pointer): integer;
function compareHashAndSource(p1, p2: pointer): integer;
function compareHashTransAndTrans(p1, p2: pointer): integer;
function compareFormID(p1, p2: pointer): integer;
function compareallHashesAndSourcesExp(expp1, expp2: pointer): integer;
function compareallHashesAndSources(p1, p2: pointer): integer;
function compareSourcesAndProxy(p1, p2: pointer): integer;
function compareHashTransandTransExp(expp1, expp2: pointer): integer;
function comparePureFormID(p1, p2: pointer): integer;
function comparePureFormIDAndRec(p1, p2: pointer): integer;
function compareEspStrRefEdidHash(p1, p2: pointer): integer;
function compareEspStrRefStringID(p1, p2: pointer): integer;
function compareEspStrHash(p1, p2: pointer): integer;
function compareProxy(p1, p2: pointer): integer;

function compareLDsize(p1, p2: pointer): integer;
function compareLowerLDsize(p1, p2: pointer): integer;
function compareWordCount(p1, p2: pointer): integer;
function compareLowerWordCount(p1, p2: pointer): integer;

function compareEspStr_Edid(p1, p2: pointer): integer;
function compareEspStr_Strict(p1, p2: pointer): integer;
function compareEspStr_Relax(p1, p2: pointer): integer;
function compareEspStr_V4Edid(p1, p2: pointer): integer;
function compareEspStr_V4EdidEspTranslator(p1, p2: pointer): integer; // SST V4
function compareEspStr_V4Strict(p1, p2: pointer): integer;
function compareEspStr_V4Relax(p1, p2: pointer): integer;
function compareEspStr_V4StrictAndProxy(p1, p2: pointer): integer;
function compareEspStr_V4RelaxAndProxy(p1, p2: pointer): integer;
function compareEspStrRefFormIDUnified(p1, p2: pointer): integer;
function compareEspFormIDUnified(p1, p2: pointer): integer;

function getfProcCompareOpt(biLocked: Boolean; icOpt: integer): tCompareProc;
function getfProcCompareOptVMAD(biLocked: Boolean; icOpt: integer): tCompareProc;
function getfProcCompareOptVMADString(biLocked: Boolean; icOpt: integer): tCompareProc;
function getProcSortCompare(iOpt: integer; fallback: Boolean): TListSortCompare;
function compareFullEdidName(p1, p2: pointer): integer;
function compareCardinal(a, b: cardinal): integer;

procedure sortVocabBaseList(proc: TListSortCompare);
procedure sortVocabEdidList(l: Tlist; proc: TListSortCompare; bKeepSort: Boolean);

implementation

uses TESVT_espDefinition;

procedure sortVocabBaseList(proc: TListSortCompare);
begin
  if assigned(proc) and (@vocabBaselistCurrentCompareProc <> @proc) then
  begin
    vocabBaselistCurrentCompareProc := proc;
    vocabBaselist.Sort(proc);
  end;
end;

procedure sortVocabEdidList(l: Tlist; proc: TListSortCompare; bKeepSort: Boolean);
var
  tmpProc: TListSortCompare;
begin

  if @proc = @compareEspStr_V4Strict then
    tmpProc := compareEspStr_V4StrictAndProxy
  else if @proc = @compareEspStr_V4Relax then
    tmpProc := compareEspStr_V4RelaxAndProxy
  else
    tmpProc := proc;

  if bKeepSort then
  begin
    if assigned(tmpProc) and (@vocabEdidListCurrentCompareProc <> @tmpProc) then
    begin
      vocabEdidListCurrentCompareProc := tmpProc;
      l.Sort(tmpProc);
    end;
  end
  else
    l.Sort(tmpProc);
end;

function CompareMd5BytesHash(h1, h2: TBytes): Boolean; // md5 digest size = 16
begin
  Result := CompareMem(@h1[0], @h1[0], 16);
end;

// ============================

function getProcSortCompare(iOpt: integer; fallback: Boolean): TListSortCompare;
begin
  // define proc
  { if version = 5 then
    case iApplySSTModeOpt of
    0: proc := compareEspStr_Edid;
    1: proc := compareEspStr_Strict;
    2: proc := compareEspStr_RecDef;
    else proc := compareEspStrHash;
    end
    else }

  case iOpt of
    0: Result := compareEspStr_V4Edid;
    1: Result := compareEspStr_V4Strict;
    2: Result := compareEspStr_V4Relax;
  else Result := nil; // compareEspStrHash;
  end;

  // fallback
  if fallback then
  begin
    if currentTESVmode = sTESVStrings then
      Result := compareEspStrRefStringID
    else if not TESVTmodLoadedHeaderProc then // TESVTmodEspLoaded
      Result := nil
  end;
end;

function getfProcCompareOpt(biLocked: Boolean; icOpt: integer): tCompareProc;
begin
  if biLocked then
  begin
    case icOpt of
      1: Result := compareOptNoTransExFilter;
      2: Result := compareOptNoTransAndPartialsExFilter;
      3: Result := compareOptPartialOnlyExFilter;
      4: Result := compareOptSelectionExFilter;
    else Result := compareOptEverythingExFilter;
    end;
  end
  else
  begin
    case icOpt of
      1: Result := compareOptNoTransExLocked;
      2: Result := compareOptNoTransAndPartialsExLocked;
      3: Result := compareOptPartialOnlyExLocked;
      4: Result := compareOptSelectionExLocked;
    else Result := compareOptEverythingExLocked;
    end;
  end;
end;

function getfProcCompareOptVMAD(biLocked: Boolean; icOpt: integer): tCompareProc;
begin
  if biLocked then
  begin
    case icOpt of
      1: Result := compareOptNoTransExFilterVMAD;
      2: Result := compareOptNoTransAndPartialsExFilterVMAD;
      3: Result := compareOptPartialOnlyExFilterVMAD;
      4: Result := compareOptSelectionExFilterVMAD;
    else Result := compareOptEverythingExFilterVMAD;
    end;
  end
  else
  begin
    case icOpt of
      1: Result := compareOptNoTransExVMAD;
      2: Result := compareOptNoTransAndPartialsExVMAD;
      3: Result := compareOptPartialOnlyExVMAD;
      4: Result := compareOptSelectionExVMAD;
    else Result := compareOptVMAD;
    end;
  end;
end;

function getfProcCompareOptVMADString(biLocked: Boolean; icOpt: integer): tCompareProc;
begin
  if biLocked then
  begin
    case icOpt of
      1: Result := compareOptBlock;
      2: Result := compareOptBlock;
      3: Result := compareOptPartialOnlyExFilterVMADString;
      4: Result := compareOptSelectionExFilterVMADString;
    else Result := compareOptBlock;
    end;
  end
  else
  begin
    case icOpt of
      1: Result := compareOptBlock;
      2: Result := compareOptBlock;
      3: Result := compareOptPartialOnlyExVMADString;
      4: Result := compareOptSelectionExVMADString;
    else Result := compareOptBlock;
    end;
  end;
end;

procedure sortListArray(aList: tAlist; Compare: TListSortCompare);
var
  j: integer;
begin
  for j := 0 to 2 do
    aList[j].Sort(Compare);
end;

function forcedPointertoSortedList(List: Tlist; Compare: TListSortCompare; p: pointer): Boolean;
var
  index: integer;
begin
  Result := false;
  FastListSearch(List, Compare, p, index, false);
  if (index >= 0) and (index <= List.count) then
  begin
    List.Insert(index, p);
    Result := true
  end;
end;

function addPointertoSortedList(List: Tlist; Compare: TListSortCompare; p: pointer): Boolean;
var
  index: integer;
begin
  Result := false;
  if not FastListSearch(List, Compare, p, index, false) then
  begin
    List.Insert(index, p);
    Result := true
  end;
end;

function addPointertoSortedList(List: Tlist; Compare: TListSortCompare; p: pointer; var index: integer): Boolean; overload;
begin
  Result := false;
  if not FastListSearch(List, Compare, p, index, false) then
  begin
    List.Insert(index, p);
    Result := true
  end;
end;

function getlowestID(List: Tlist; Compare: TListSortCompare; p: pointer; startID: integer): integer;
begin
  Result := startID;
  dec(startID);
  while (startID >= 0) do
  begin
    if (Compare(List[startID], p) = 0) then
      Result := startID
    else
      exit;
    dec(startID);
  end;
end;

// fastListsearch,
function FastListSearch(List: Tlist; Compare: TListSortCompare; p: pointer; var newindex: integer; getlowest: Boolean): Boolean;
var
  i, l, H: integer;
  c: integer;
begin
  Result := false;
  l := 0;
  H := List.count - 1;
  while (l <= H) do
  begin
    i := (l + H) shr 1;
    c := Compare(List[i], p);
    if c < 0 then
      l := i + 1
    else
    begin
      H := i - 1;
      if c = 0 then
      begin
        l := i;
        if getlowest then
          l := getlowestID(List, Compare, p, l);
        Result := true;
        break;
      end;
    end;
  end;
  newindex := l;
end;

// compare cardinal
function compareCardinal(a, b: cardinal): integer;
begin
  if a < b then
    exit(-1)
  else if a > b then
    exit(1);
  Result := 0;
end;

function compareHash(p1, p2: pointer): integer;
begin
  Result := compareCardinal(tSkyStr(p1).hash, tSkyStr(p2).hash);
end;

function compareHashTrans(p1, p2: pointer): integer;
begin
  Result := compareCardinal(tSkyStr(p1).hashTrans, tSkyStr(p2).hashTrans);
end;

// tstringexport
function compareHashTransandTransExp(expp1, expp2: pointer): integer;
var
  p1, p2: pointer;
begin
  p1 := tStringExport(expp1).sk;
  p2 := tStringExport(expp2).sk;
  Result := compareHashTrans(p1, p2);
  if Result = 0 then
    Result := compareTrans(p1, p2);
end;

function compareallHashesAndSourcesExp(expp1, expp2: pointer): integer;
var
  p1, p2: pointer;
begin
  p1 := tStringExport(expp1).sk;
  p2 := tStringExport(expp2).sk;
  Result := compareHash(p1, p2);
  if Result = 0 then
    Result := compareSource(p1, p2);
  if Result = 0 then
    Result := compareHashTrans(p1, p2);
  if Result = 0 then
    Result := compareTrans(p1, p2);
end;


// tskystr

function compareLDsize(p1, p2: pointer): integer;
begin
  Result := length(tSkyStr(p1).s) - length(tSkyStr(p2).s)
end;

function compareLowerLDsize(p1, p2: pointer): integer;
begin
  Result := length(tSkyStr(p1).s) - (length(tSkyStr(p1).s) - 3);
end;

function compareWordCount(p1, p2: pointer): integer;
begin
  Result := tSkyStr(p1).awords.count - tSkyStr(p2).awords.count;
  if Result = 0 then
    Result := tSkyStr(p1).getOneWordHash - tSkyStr(p2).getOneWordHash;
end;

function compareLowerWordCount(p1, p2: pointer): integer;
begin
  Result := tSkyStr(p1).awords.count - tSkyStr(p2).minWord;
end;

function compareallHashesAndSources(p1, p2: pointer): integer;
begin
  Result := compareHash(p1, p2);
  if Result = 0 then
    Result := compareSource(p1, p2);
  if Result = 0 then
    Result := compareHashTrans(p1, p2);
  if Result = 0 then
    Result := compareTrans(p1, p2);
end;

function compareProxy(p1, p2: pointer): integer;
begin
  if tSkyStr(p1).proxy > tSkyStr(p2).proxy then
    Result := 1
  else if tSkyStr(p1).proxy < tSkyStr(p2).proxy then
    Result := -1
  else
    Result := 0;
end;

function compareSourcesAndProxy(p1, p2: pointer): integer;
begin
  Result := compareHash(p1, p2);
  if Result = 0 then
    Result := compareSource(p1, p2);
  if Result = 0 then
    Result := compareProxy(p1, p2);
end;

function compareWordCoundAndHashAndHashTrans(p1, p2: pointer): integer;
begin
  Result := compareWordCount(p1, p2);
  if Result = 0 then
    Result := compareHash(p1, p2);
  if Result = 0 then
    Result := compareHashTrans(p1, p2);
end;

function compareHashAndSourceNormalized(p1, p2: pointer): integer;
begin
  Result := compareCardinal(tSkyStr(p1).iNormalizedHash, tSkyStr(p2).iNormalizedHash);
  if Result = 0 then
    Result := AnsiCompareText(tSkyStr(p1).sNormalized, tSkyStr(p2).sNormalized);
end;

function compareSource(p1, p2: pointer): integer;
begin
  Result := AnsiCompareText(tSkyStr(p1).s, tSkyStr(p2).s);
end;

function compareTrans(p1, p2: pointer): integer;
begin
  Result := AnsiCompareText(tSkyStr(p1).sTrans, tSkyStr(p2).sTrans);
end;

function compareInternalId(p1, p2: pointer): integer;
begin
  Result := compareCardinal(tSkyStr(p1).iId, tSkyStr(p2).iId);
end;

function compareStrId(p1, p2: pointer): integer;
begin
  Result := compareCardinal(tSkyStr(p1).esp.strId, tSkyStr(p2).esp.strId);
end;

function compareStrIdLow(p1, p2: pointer): integer;
begin
  Result := compareCardinal(tSkyStr(p1).stringID, tSkyStr(p2).stringID);
end;

function compareHashTransAndTrans(p1, p2: pointer): integer;
begin
  Result := compareHashTrans(p1, p2);
  if Result = 0 then
    Result := compareTrans(p1, p2);
end;

function compareHashAndSource(p1, p2: pointer): integer;
begin
  Result := compareHash(p1, p2);
  if Result = 0 then
    Result := compareSource(p1, p2);
end;

function compareHashSourceAndInternalId(p1, p2: pointer): integer;
begin
  Result := compareHashAndSource(p1, p2);
  if Result = 0 then
    Result := compareInternalId(p1, p2);
end;

function compareFormID(p1, p2: pointer): integer;
begin
  Result := compareCardinal(sanitizeFormID(trecord(p1).headerData.formID), sanitizeFormID(trecord(p2).headerData.formID));
end;

function comparePureFormID(p1, p2: pointer): integer;
begin
  Result := compareCardinal(trecord(p1).headerData.formID, trecord(p2).headerData.formID);
end;

function compareRecName(p1, p2: pointer): integer;
begin
  Result := compareCardinal(cardinal(trecord(p1).header.name), cardinal(trecord(p2).header.name));
end;

function comparePureFormIDAndRec(p1, p2: pointer): integer;
begin
  Result := comparePureFormID(p1, p2);
  if Result = 0 then
    Result := compareRecName(p1, p2);
end;

function compareEdidNameHash(p1, p2: pointer): integer;
begin
  Result := compareCardinal(trecord(p1).edidNameHash, trecord(p2).edidNameHash);
end;

function comparePureFormIDandEdidNameHash(p1, p2: pointer): integer;
begin
  Result := comparePureFormID(p1, p2);
  if Result = 0 then
    Result := compareCardinal(trecord(p1).edidNameHash, trecord(p2).edidNameHash);
end;

function compareFormIDandEdidNameHash(p1, p2: pointer): integer;
begin
  Result := compareFormID(p1, p2);
  if Result = 0 then
    Result := compareCardinal(trecord(p1).edidNameHash, trecord(p2).edidNameHash);
end;
// ----------

function compareEdidName(p1, p2: pointer): integer;
begin
  if assigned(tSkyStr(p1).esp.rec) and assigned(tSkyStr(p2).esp.rec) then
    Result := AnsiCompareText(trecord(tSkyStr(p1).esp.rec).edidName, trecord(tSkyStr(p2).esp.rec).edidName)
  else
    Result := 0;
end;

// ----------------------

function compareFullEdidName(p1, p2: pointer): integer;
begin
  Result := AnsiCompareText(tSkyStr(p1).getEdidName, tSkyStr(p2).getEdidName)
end;

// -------Internal ref tEspStrRef

function compareEspFormIDUnified(p1, p2: pointer): integer;
begin
  Result := compareCardinal(sanitizeFormID(tEspStrRef(p1).data.formID), sanitizeFormID(tEspStrRef(p2).data.formID));
end;

function compareEspStrRefFormIDUnified(p1, p2: pointer): integer;
begin
  Result := compareEspFormIDUnified(p1, p2);
  if Result = 0 then
    Result := compareEspStrRefEdidHash(p1, p2);
end;

function compareEspStrRefEdidHash(p1, p2: pointer): integer;
begin
  Result := compareCardinal(tEspStrRef(p1).data.rHash, tEspStrRef(p2).data.rHash);
end;

function compareEspStrRecName(p1, p2: pointer): integer;
begin
  Result := compareCardinal(cardinal(tEspStrRef(p1).data.rName), cardinal(tEspStrRef(p2).data.rName));
end;

function compareEspStrFieldName(p1, p2: pointer): integer;
begin
  Result := compareCardinal(cardinal(tEspStrRef(p1).data.fName), cardinal(tEspStrRef(p2).data.fName));
end;

function compareEspStrRefName(p1, p2: pointer): integer;
begin
  Result := compareEspStrFieldName(p1, p2);
end;

function compareEspStrRefNameV5(p1, p2: pointer): integer;
begin
  Result := compareEspStrRecName(p1, p2);
  if Result = 0 then
    Result := compareEspStrFieldName(p1, p2);
end;

function compareEspStrRefIndex(p1, p2: pointer): integer;
begin
  Result := compareCardinal(tEspStrRef(p1).data.index, tEspStrRef(p2).data.index);
end;

function compareEspStrRefStringID(p1, p2: pointer): integer;
begin
  Result := compareCardinal(tEspStrRef(p1).data.strId, tEspStrRef(p2).data.strId);
end;

function compareEspStrSource(p1, p2: pointer): integer;
begin
  Result := AnsiCompareText(tEspStrRef(p1).sk.s, tEspStrRef(p2).sk.s);
end;

function compareEspStrHash(p1, p2: pointer): integer;
begin
  Result := compareCardinal(tEspStrRef(p1).sk.hash, tEspStrRef(p2).sk.hash);
  if Result = 0 then
    Result := compareEspStrSource(p1, p2);
end;

function compareV4Proxy(p1, p2: pointer): integer;
begin
  Result := tEspStrRef(p1).sk.getUnused - tEspStrRef(p2).sk.getUnused;
end;

function compareEspStr_V4Strict(p1, p2: pointer): integer; // SST V4
begin
  Result := compareEspStrRefFormIDUnified(p1, p2);
  if Result = 0 then
    Result := compareEspStrHash(p1, p2);
  if Result = 0 then
    Result := compareEspStrRefName(p1, p2);
  if Result = 0 then
    Result := compareEspStrRefIndex(p1, p2);
end;

function compareEspStr_V4Relax(p1, p2: pointer): integer; // SST V4
begin
  Result := compareEspStrRefFormIDUnified(p1, p2);
  if Result = 0 then
    Result := compareEspStrRefName(p1, p2);
  if Result = 0 then
    Result := compareEspStrHash(p1, p2);
end;

function compareEspStr_V4RelaxAndProxy(p1, p2: pointer): integer; // SST V4
begin
  Result := compareEspStrRefFormIDUnified(p1, p2);
  if Result = 0 then
    Result := compareEspStrRefName(p1, p2);
  if Result = 0 then
    Result := compareEspStrHash(p1, p2);
  if Result = 0 then
    Result := compareV4Proxy(p1, p2);
end;

function compareEspStr_V4StrictAndProxy(p1, p2: pointer): integer; // SST V4
begin
  Result := compareEspStrRefFormIDUnified(p1, p2);
  if Result = 0 then
    Result := compareEspStrHash(p1, p2);
  if Result = 0 then
    Result := compareEspStrRefName(p1, p2);
  if Result = 0 then
    Result := compareEspStrRefIndex(p1, p2);
  if Result = 0 then
    Result := compareV4Proxy(p1, p2);
end;

function compareEspStr_V4Edid(p1, p2: pointer): integer; // SST V4
begin
  Result := compareEspStrRefFormIDUnified(p1, p2);
  if Result = 0 then
    Result := compareEspStrRefName(p1, p2);
  if Result = 0 then
    Result := compareEspStrRefIndex(p1, p2);
end;

function compareEspStr_V4EdidEspTranslator(p1, p2: pointer): integer; // SST V4
begin
  Result := compareEspFormIDUnified(p1, p2);
  if Result = 0 then
    Result := compareEspStrRefName(p1, p2);
  if Result = 0 then
    Result := compareEspStrRefIndex(p1, p2);
end;

function compareEspStr_Strict(p1, p2: pointer): integer;
begin
  Result := compareEspStrRefEdidHash(p1, p2);
  if Result = 0 then
    Result := compareEspStrRefNameV5(p1, p2);
  if Result = 0 then
    Result := compareEspStrHash(p1, p2);
  if Result = 0 then
    Result := compareEspStrRefIndex(p1, p2);
end;

function compareEspStr_Edid(p1, p2: pointer): integer;
begin
  Result := compareEspStrRefEdidHash(p1, p2);
  if Result = 0 then
    Result := compareEspStrRefNameV5(p1, p2);
  if Result = 0 then
    Result := compareEspStrRefIndex(p1, p2);
end;

function compareEspStr_Relax(p1, p2: pointer): integer;
begin
  Result := compareEspStrRefEdidHash(p1, p2);
  if Result = 0 then
    Result := compareEspStrRefNameV5(p1, p2);
  if Result = 0 then
    Result := compareEspStrHash(p1, p2);
end;

end.
