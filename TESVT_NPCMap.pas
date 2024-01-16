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

unit TESVT_NPCMap;

interface

uses classes, sysutils, math, types, TESVT_Const, controls, TESVT_Utils, TESVT_FastSearch, TESVT_CustomList, TESVT_EspDefinition, TESVT_TypeDef,
  TESVT_MainLoader;

type
  tSceneData = class
    Dial: cardinal;
    Qust: cardinal;
    Scen: cardinal;
    Alias: integer;
    isPlayer: boolean;
  public
    constructor create(d, q, s: cardinal; a: integer; p: boolean = false);
  end;

  tDialData = class
  private
    iInfo: cardinal;
    iResponse: integer;
    iNpc: integer;
    procedure setdata(info: cardinal; response, npc: integer);
  public
    constructor create(r: rDialInfo; npc: integer);
  end;

  TImportDial = class(tObject)
  private
    dummy: tDialData;
    dummySD: tSceneData;
    currentSk: tSkyStr;
    loopCount: integer;
    procedure parseSceneRec(mEsp: tespLoader; r: tRecord);
    function getNPCFromQustAlias(loader: tTranslatorLoader; Qust: cardinal; Alias: integer; Recurse: integer = 0): boolean;
    function getNPCFromInfo(loader: tTranslatorLoader; r: tRecord): boolean;
    function getNPCFromInfoSF(loader: tTranslatorLoader; r: tRecord; fCurrent: tfield): boolean;
    function CTDADecoder(loader: tTranslatorLoader; Qust: cardinal; r: tRecord; startIndex: integer = 0; bBreakOnAnam: boolean = false;
      Recurse: integer = 0): boolean;
    function AddNPCToList(loader: tTranslatorLoader; formID: cardinal; defaultSig: sheaderSig; fallbackName: string = ''): boolean;
    procedure AddNPCToListEx(npc: string);
    procedure clearSceneParse;
    function getNPCName(r: tRecord; formID: cardinal; defaultSig: sheaderSig): string;
  public
    current: cardinal;
    lNpcName: tmcStringList;
    lDialListByInfo: tlist;
    lDialListByNPC: tlist;
    lSceneParse: tlist;
    constructor create;
    destructor Destroy; override;
    procedure fillList(l: tstrings; filter: string);
    function getNpcForDial(r: rDialInfo): boolean; overload;
    procedure getNpcForDial(l: tstrings; info: cardinal; response: integer; bDoClear: boolean); overload;
    function isDialFromActor(actor: integer; rinfo: rDialInfo): boolean;
    function getNPCIdByName(npc: string): integer;
    function reduceNpcName(npc: string; doExplode: boolean = false): string;
    procedure generateNPCMap(loader: tTranslatorLoader);
  end;

function CompareDialDataInfo(p1, p2: pointer): integer;
function CompareDialDataNPC(p1, p2: pointer): integer;
function CompareDialDataInfoAndResponse(p1, p2: pointer): integer;
function CompareSceneData(p1, p2: pointer): integer;
function CompareSceneDataNoAlias(p1, p2: pointer): integer;
function isNPCRequired(loader: tTranslatorLoader): boolean;
function isNPCLoaded(loader: tTranslatorLoader): boolean;

var
  mainDialData: TImportDial;

Const
  PlayerName = '[NPC_:Player]';
  PlayerFORM: cardinal = 7;

implementation

function isNPCRequired(loader: tTranslatorLoader): boolean;
begin
  result := assigned(loader) and loader.bNeedFuz;
  if result then
    if assigned(mainDialData) then
      result := (loader.uguid <> mainDialData.current);
end;

function isNPCLoaded(loader: tTranslatorLoader): boolean;
begin
  result := assigned(mainDialData) and (loader.uguid = mainDialData.current);
end;

constructor tSceneData.create(d, q, s: cardinal; a: integer; p: boolean = false);
begin
  Dial := d;
  Qust := q;
  Scen := s;
  Alias := a;
  isPlayer := p;
end;

// ---------
constructor tDialData.create(r: rDialInfo; npc: integer);
begin
  setdata(r.rFormid, r.rId, npc);
end;

procedure tDialData.setdata(info: cardinal; response, npc: integer);
begin
  iInfo := info;
  iResponse := response;
  iNpc := npc;
end;

// compareUtils
function CompareDialDataInfoAndResponse(p1, p2: pointer): integer;
begin
  result := CompareDialDataInfo(p1, p2);
  if (result = 0) then // and not bGameISSF then   //hack need cleaning
    result := (tDialData(p1).iResponse - tDialData(p2).iResponse);
end;

function CompareDialDataInfo(p1, p2: pointer): integer;
begin
  result := compareCardinal(tDialData(p1).iInfo, tDialData(p2).iInfo);
end;

function CompareDialDataNPC(p1, p2: pointer): integer;
begin
  result := tDialData(p1).iNpc - tDialData(p2).iNpc;
  if result = 0 then
    result := CompareDialDataInfoAndResponse(p1, p2);
end;

function CompareSceneData(p1, p2: pointer): integer;
begin
  result := compareCardinal(tSceneData(p1).Dial, tSceneData(p2).Dial);
  if result = 0 then
    result := compareCardinal(tSceneData(p1).Qust, tSceneData(p2).Qust);
  if result = 0 then
    result := tSceneData(p1).Alias - tSceneData(p2).Alias;
end;

function CompareSceneDataNoAlias(p1, p2: pointer): integer;
begin
  result := compareCardinal(tSceneData(p1).Dial, tSceneData(p2).Dial);
  if result = 0 then
    result := compareCardinal(tSceneData(p1).Qust, tSceneData(p2).Qust);
end;


// NPCMAP---->

constructor TImportDial.create;
begin
  loopCount := 0;
  lNpcName := tmcStringList.create;
  lNpcName.ObjSorted := false;
  lNpcName.sorted := true;
  lNpcName.Duplicates := dupIgnore;
  lDialListByInfo := tlist.create;
  lDialListByNPC := tlist.create;
  lSceneParse := tlist.create;
  dummy := tDialData.create(getDummyDialInfo, 0);
  dummySD := tSceneData.create(0, 0, 0, 0, false);
end;

destructor TImportDial.Destroy;
var
  i: integer;
begin
  lNpcName.free;
  // free up list (need to destroy only one content)
  for i := 0 to pred(lDialListByInfo.count) do
    tDialData(lDialListByInfo[i]).free;
  clearSceneParse;
  lDialListByInfo.free;
  lDialListByNPC.free;
  lSceneParse.free;
  dummy.free;
  dummySD.free;
  inherited;
end;

procedure TImportDial.clearSceneParse;
var
  i: integer;
begin
  for i := 0 to pred(lSceneParse.count) do
    tSceneData(lSceneParse[i]).free;
  lSceneParse.clear;
end;

procedure TImportDial.fillList(l: tstrings; filter: string);
var
  i: integer;
begin
  l.BeginUpdate;
  l.clear;
  filter := ansiLowerCase(trim(filter));
  for i := 0 to pred(lNpcName.count) do
    if (filter = '') or (pos(filter, ansiLowerCase(lNpcName[i])) > 0) then
      l.add(lNpcName[i]);
  l.endUpdate;
end;

function TImportDial.getNPCIdByName(npc: string): integer;
var
  t: integer;
begin
  result := -1;
  t := lNpcName.indexof(npc);
  if inrange(t, 0, pred(lNpcName.count)) then
    result := integer(lNpcName.objects[t]);
end;

function TImportDial.isDialFromActor(actor: integer; rinfo: rDialInfo): boolean;
var
  index: integer;
begin
  dummy.setdata(rinfo.rFormid, rinfo.rId, actor);
  result := FastListSearch(lDialListByNPC, CompareDialDataNPC, dummy, index, false);
end;

function TImportDial.getNpcForDial(r: rDialInfo): boolean;
var
  index: integer;
begin
  dummy.setdata(r.rFormid, r.rId, 0);
  result := FastListSearch(lDialListByInfo, CompareDialDataInfoAndResponse, dummy, index, false);
end;

procedure TImportDial.getNpcForDial(l: tstrings; info: cardinal; response: integer; bDoClear: boolean);
var
  index, i: integer;
  dD: tDialData;
begin
  if bDoClear then
    l.clear;
  dummy.setdata(info, response, 0);
  if FastListSearch(lDialListByInfo, CompareDialDataInfoAndResponse, dummy, index, true) then
  begin
    for i := index to pred(lDialListByInfo.count) do
    begin
      dD := lDialListByInfo[i];
      if (dD.iInfo <> info) or (dD.iResponse <> response) then
        exit;
      if lNpcName.ObjFind(dD.iNpc, index) then
        if l.indexof(lNpcName[index]) = -1 then
          l.add(reduceNpcName(lNpcName[index], false));
    end;
  end;
end;

function TImportDial.reduceNpcName(npc: string; doExplode: boolean = false): string;
var
  aNpc: sArray;
begin
  if doExplode then
  begin
    explode(npc, aNpc, ' ');
    result := aNpc[0];
  end
  else
    result := npc;
end;


// ============================================================
// - On the fly section.
// - parsing data Logic based on the script export dialog (xEdit)
// ============================================================

procedure TImportDial.parseSceneRec(mEsp: tespLoader; r: tRecord);
var
  i, j: integer;
  f: tfield;
  openSection: integer;
  wAnam: word;
  Qust: cardinal;
  Alias: integer;
  bAliasSet: boolean;
  tmpDial: cardinal;
  tSD: tSceneData;
const
  aPlayerDial: array [0 .. 4] of sheaderSig = ('PTOP', 'NTOP', 'NETO', 'QTOP', 'ESCE');
  aNpcDial1: array [0 .. 5] of sheaderSig = ('DATA', 'NPOT', 'NNGT', 'NNUT', 'NQUT', 'ESCS');
  aNpcDial2: array [0 .. 8] of sheaderSig = ('DATA', 'NPOT', 'NNGT', 'NNUT', 'NQUT', 'PTOP', 'NTOP', 'NETO', 'QTOP');
begin
  Qust := r.getCardinalfromDataRef_FromEnd('PNAM', 'ANAM');
  Qust := mEsp.setFormIdMapping(Qust);

  bAliasSet := false;
  if Qust = 0 then
    exit;
  openSection := -1;
  for i := 0 to pred(r.fList.count) do
  begin
    f := r.fList[i];
    if (f.header.name = headerANAM) then
    begin
      if openSection = -1 then
      begin
        move(f.buffer[0], wAnam, SizeOf(wAnam));
        openSection := wAnam;
      end
      else
        openSection := -1;
      continue;
    end;

    if openSection >= 0 then
    begin
      if (f.header.name = headerALID) then
      begin
        move(f.buffer[0], Alias, SizeOf(Alias));
        bAliasSet := true;
        continue;
      end;
      if bAliasSet then
      begin
        if openSection = 3 then // Player Dialog
        begin
          for j := 0 to high(aPlayerDial) do
            if (f.header.name = aPlayerDial[j]) then
            begin
              move(f.buffer[0], tmpDial, SizeOf(tmpDial));
              tmpDial := mEsp.setFormIdMapping(tmpDial);
              tSD := tSceneData.create(tmpDial, Qust, r.headerdata.formID, Alias, true);
              if not forcedPointertoSortedList(lSceneParse, CompareSceneData, tSD) then
                tSD.free;
              break;
            end;
          for j := 0 to high(aNpcDial1) do
            if (f.header.name = aNpcDial1[j]) then
            begin
              move(f.buffer[0], tmpDial, SizeOf(tmpDial));
              tmpDial := mEsp.setFormIdMapping(tmpDial);
              tSD := tSceneData.create(tmpDial, Qust, r.headerdata.formID, Alias);
              if not forcedPointertoSortedList(lSceneParse, CompareSceneData, tSD) then
                tSD.free;
              break;
            end;
        end
        else
        begin
          for j := 0 to high(aNpcDial2) do
            if (f.header.name = aNpcDial2[j]) then
            begin
              move(f.buffer[0], tmpDial, SizeOf(tmpDial));
              tmpDial := mEsp.setFormIdMapping(tmpDial);
              tSD := tSceneData.create(tmpDial, Qust, r.headerdata.formID, Alias);
              if not forcedPointertoSortedList(lSceneParse, CompareSceneData, tSD) then
                tSD.free;
              break;
            end;
        end;
      end;
    end
    else
      bAliasSet := false;
  end;
end;

function TImportDial.getNPCFromQustAlias(loader: tTranslatorLoader; Qust: cardinal; Alias: integer; Recurse: integer = 0): boolean;
var
  r: tRecord;
  i: integer;
  f: tfield;
  tmpAlias: integer;
  openSection: integer;
  tmpValue, tmpValueRefr, Aleq: cardinal;
  Alea: integer;
  AliasName: String;
begin

  if Alias < 0 then
  begin
    AddNPCToList(loader, 0, headerNPC_, PlayerName);
    exit(true);
  end;

  result := false;
  AliasName := '';
  r := loader.EspLoader.getFastRecord(Qust, headerQUST);
  if (Recurse > 10) or not assigned(r) then
    exit;
  openSection := -1;
  Aleq := 0;
  Alea := 0;
  // check
  for i := 0 to pred(r.fList.count) do
  begin
    f := r.fList[i];
    // open relevant Alias section
    if (f.header.name = headerALST) and (openSection = -1) then
    begin
      move(f.buffer[0], tmpAlias, SizeOf(tmpAlias));
      if tmpAlias = Alias then
        openSection := i;
      continue;
    end;
    // close AliasSection
    if (f.header.name = headerALED) and (openSection <> -1) then
      break;
    // ---
    if openSection = -1 then
      continue;
    // ---
    tmpValue := 0;
    // ---
    if (f.header.name = 'ALID') then
    begin
      SetString(AliasName, PAnsiChar(@f.buffer[0]), length(f.buffer) - 1);
      continue;
    end;
    // ---
    if (f.header.name = 'ALFR') then
    begin
      move(f.buffer[0], tmpValue, SizeOf(tmpValue));
      tmpValue := loader.EspLoader.setFormIdMapping(r, tmpValue);
      if tmpValue <> 0 then
      begin
        // first search in fastRefr list
        tmpValueRefr := loader.EspLoader.getFastRefr(tmpValue);
        if tmpValueRefr <> 0 then
          tmpValue := tmpValueRefr;
        if AddNPCToList(loader, tmpValue, ALL_REC) then
          result := true;
        continue;
      end;
    end;
    // ---
    if (f.header.name = 'ALUA') then
    begin
      move(f.buffer[0], tmpValue, SizeOf(tmpValue));
      tmpValue := loader.EspLoader.setFormIdMapping(r, tmpValue);
      if AddNPCToList(loader, tmpValue, headerNPC_) then
        result := true;
      continue;
    end;
    // ---
    if (f.header.name = 'ALEQ') then
    begin
      move(f.buffer[0], Aleq, SizeOf(tmpValue));
      tmpValue := loader.EspLoader.setFormIdMapping(r, tmpValue);
    end;
    if (f.header.name = 'ALEA') then
      move(f.buffer[0], Alea, SizeOf(tmpValue));
    if (Aleq <> 0) then
      if getNPCFromQustAlias(loader, Aleq, Alea) then
        result := true;
    // ---
    if (f.header.name = 'ALCO') then
    begin
      move(f.buffer[0], tmpValue, SizeOf(tmpValue));
      tmpValue := loader.EspLoader.setFormIdMapping(r, tmpValue);
      if AddNPCToList(loader, tmpValue, headerNPC_) then
        result := true;
      continue;
    end;
    // ---
    if (f.header.name = 'VTCK') or (f.header.name = 'ALFV') then
    begin
      move(f.buffer[0], tmpValue, SizeOf(tmpValue));
      tmpValue := loader.EspLoader.setFormIdMapping(r, tmpValue);
      if AddNPCToList(loader, tmpValue, 'VTYP') then
        result := true; // no 'or' here so it can override
    end;
  end;

  if (openSection <> -1) and CTDADecoder(loader, Qust, r, openSection, false, Recurse) then
    result := true;

  if not result and (AliasName <> '') then
    result := AddNPCToList(loader, 0, headerNPC_, '<Alias=' + AliasName + '>');
end;

// Starfield
function TImportDial.getNPCFromInfoSF(loader: tTranslatorLoader; r: tRecord; fCurrent: tfield): boolean;
var
  i, j, index: integer;
  f: tfield;
  tmpValue: cardinal;
  rDial, rQust, rTmp: tRecord;
  tSD: tSceneData;
  infoDial, infoQust: cardinal;
begin
  result := false;
  infoQust := 0;
  infoDial := loader.EspLoader.setFormIdMapping(r, loader.EspLoader.GetdialIDFromInfo(r));
  if infoDial > 0 then
  begin
    rDial := loader.EspLoader.getFastRecord(infoDial, headerDIAL);
    if assigned(rDial) then
      infoQust := loader.EspLoader.setFormIdMapping(rDial, rDial.getCardinalfromDataRef((sheaderSig(gamesParams.sQUSTDIALREF))));
  end;

  // firstpass TROT
  if assigned(fCurrent) then
  begin
    index := r.fList.indexof(fCurrent);
    if index >= 0 then
      for i := index downto 0 do
      begin
        f := r.fList[i];
        if (f.header.name = headerTRDA) then
        begin
          if result = true then
            exit
          else
            break;
        end;
        if (f.header.name = headerTROT) then
        begin
          move(f.buffer[0], tmpValue, SizeOf(tmpValue));
          tmpValue := loader.EspLoader.setFormIdMapping(r, tmpValue);
          if AddNPCToList(loader, tmpValue, headerNPC_) then
            result := true;
        end;
      end;
  end;

  // second pass ANAM/GNAM
  for i := 0 to pred(r.fList.count) do
  begin
    f := r.fList[i];
    if (f.header.name = headerANAM) then
    begin
      move(f.buffer[0], tmpValue, SizeOf(tmpValue));
      tmpValue := loader.EspLoader.setFormIdMapping(r, tmpValue);
      if AddNPCToList(loader, tmpValue, headerNPC_) then
        exit(true)
    end;

    if (f.header.name = 'GNAM') or (f.header.name = 'DNAM') then
    begin
      move(f.buffer[0], tmpValue, SizeOf(tmpValue));
      tmpValue := loader.EspLoader.setFormIdMapping(r, tmpValue);
      if tmpValue <> 0 then
      begin
        rTmp := loader.EspLoader.getFastRecord(tmpValue, headerINFO);
        if assigned(rTmp) and getNPCFromInfoSF(loader, rTmp, nil) then
          result := true;
      end;
    end;
  end;

  if (infoDial <> 0) and (infoQust <> 0) then
  begin
    dummySD.Dial := infoDial;
    dummySD.Qust := infoQust;
    if FastListSearch(lSceneParse, CompareSceneDataNoAlias, dummySD, index, true) then
    begin
      for j := index to pred(lSceneParse.count) do
      begin
        tSD := lSceneParse[j];
        if tSD.Dial <> dummySD.Dial then
          break;
        if tSD.isPlayer then
        begin
          AddNPCToList(loader, 0, headerNPC_, PlayerName);
          result := true;
        end
        else if getNPCFromQustAlias(loader, tSD.Qust, tSD.Alias) then
          result := true;
      end;
    end;
  end;

  // Conditions->
  if CTDADecoder(loader, infoQust, r) then
    result := true;

  if not result then
  begin
    rQust := loader.EspLoader.getFastRecord(infoQust, headerQUST);
    result := ((assigned(rQust) and CTDADecoder(loader, infoQust, rQust, 0, true)));
  end;

  if (not result) and r.isFieldExists('RNAM') then
    result := AddNPCToList(loader, 0, headerNPC_, PlayerName);

end;

// Skyrim/fallout
function TImportDial.getNPCFromInfo(loader: tTranslatorLoader; r: tRecord): boolean;
var
  i, j, index: integer;
  f: tfield;
  tmpValue: cardinal;
  rDial, rQust, rTmp: tRecord;
  tSD: tSceneData;
  infoDial, infoQust: cardinal;
begin
  result := false;
  infoQust := 0;
  infoDial := loader.EspLoader.setFormIdMapping(r, loader.EspLoader.GetdialIDFromInfo(r));
  if infoDial > 0 then
  begin
    rDial := loader.EspLoader.getFastRecord(infoDial, headerDIAL);
    if assigned(rDial) then
      infoQust := loader.EspLoader.setFormIdMapping(rDial, rDial.getCardinalfromDataRef((sheaderSig(gamesParams.sQUSTDIALREF))));
  end;

  for i := 0 to pred(r.fList.count) do
  begin
    f := r.fList[i];
    if (f.header.name = headerANAM) then
    begin
      move(f.buffer[0], tmpValue, SizeOf(tmpValue));
      tmpValue := loader.EspLoader.setFormIdMapping(r, tmpValue);
      if AddNPCToList(loader, tmpValue, headerNPC_) then
        exit(true)
    end;

    if (f.header.name = 'GNAM') or (f.header.name = 'DNAM') then
    begin
      move(f.buffer[0], tmpValue, SizeOf(tmpValue));
      tmpValue := loader.EspLoader.setFormIdMapping(r, tmpValue);
      if tmpValue <> 0 then
      begin
        rTmp := loader.EspLoader.getFastRecord(tmpValue, headerINFO);
        if assigned(rTmp) and getNPCFromInfo(loader, rTmp) then
          result := true;
      end;
    end;
  end;

  if (infoDial <> 0) and (infoQust <> 0) then
  begin
    dummySD.Dial := infoDial;
    dummySD.Qust := infoQust;
    if FastListSearch(lSceneParse, CompareSceneDataNoAlias, dummySD, index, true) then
    begin
      for j := index to pred(lSceneParse.count) do
      begin
        tSD := lSceneParse[j];
        if tSD.Dial <> dummySD.Dial then
          break;
        if tSD.isPlayer then
        begin
          AddNPCToList(loader, 0, headerNPC_, PlayerName);
          result := true;
        end
        else if getNPCFromQustAlias(loader, tSD.Qust, tSD.Alias) then
          result := true;
      end;
    end;
  end;

  // Conditions->
  if CTDADecoder(loader, infoQust, r) then
    result := true;

  if not result then
  begin
    rQust := loader.EspLoader.getFastRecord(infoQust, headerQUST);
    result := ((assigned(rQust) and CTDADecoder(loader, infoQust, rQust, 0, true)));
  end;

  if (not result) and r.isFieldExists('RNAM') then
    result := AddNPCToList(loader, 0, headerNPC_, PlayerName);
end;

function TImportDial.CTDADecoder(loader: tTranslatorLoader; Qust: cardinal; r: tRecord; startIndex: integer = 0; bBreakOnAnam: boolean = false;
  Recurse: integer = 0): boolean;
var
  i: integer;
  f: tfield;
  ctda: rCtdaData;
  openCTDA: boolean;
begin
  result := false;
  openCTDA := false;
  for i := startIndex to pred(r.fList.count) do
  begin
    f := r.fList[i];
    if bBreakOnAnam and (f.header.name = 'ANAM') then
      exit;
    if (f.header.name = 'CTDA') then
    begin
      ctda := r.CTDADecoderEx(f);
      openCTDA := true;
      if result and not ctda.boolOr then
        continue;
      if not((ctda.runOn = 0) or (ctda.runOn = 2)) or (ctda.opType <> 0) or (round(ctda.value) <> 1) then
        continue;
      if (ctda.func = 72) or (ctda.func = 426) then
      begin
        if AddNPCToList(loader, loader.EspLoader.setFormIdMapping(r, ctda.param1), headerNPC_) then
          result := true;
      end
      else if (ctda.func = 71) then
      begin
        if AddNPCToList(loader, loader.EspLoader.setFormIdMapping(r, ctda.param1), headerFACT) then
          result := true;
      end
      else if (ctda.func = 566) then
      begin
        if getNPCFromQustAlias(loader, loader.EspLoader.setFormIdMapping(r, Qust), integer(ctda.param1), Recurse + 1) then
          result := true
      end;
    end
    else
    begin
      if openCTDA then
        exit;
    end;
  end;
end;

procedure TImportDial.AddNPCToListEx(npc: string);
var
  npcIndex, tmpNPCid: integer;
  dD: tDialData;
begin
  if not lNpcName.Find(npc, npcIndex) then
  begin
    tmpNPCid := lNpcName.count;
    lNpcName.AddObject(npc, tObject(lNpcName.count));
  end
  else
    tmpNPCid := integer(lNpcName.objects[npcIndex]);
  dD := tDialData.create(currentSk.GetResponseinfo, tmpNPCid);
  lDialListByInfo.add(dD);
  lDialListByNPC.add(dD);
end;

function TImportDial.getNPCName(r: tRecord; formID: cardinal; defaultSig: sheaderSig): string;
var
  sk: tSkyStr;
  rName: string;
begin
  if formID = PlayerFORM then
    exit(PlayerName);

  if assigned(r) then
  begin
    sk := r.getSkfromDataRef(headerFULL);
    if assigned(sk) then
    begin
      try
        try
          rName := format('[%s]', [sk.s]);
        except
          rName := sk.s + '[StackError]';
        end;
      finally
      end;
    end
    else
      rName := '';
    result := format('%s[%s:%s]', [rName, string(r.header.name), r.EdidName])
  end
  else
    result := format('[%s:%.8x]', [string(defaultSig), formID]);
end;

function TImportDial.AddNPCToList(loader: tTranslatorLoader; formID: cardinal; defaultSig: sheaderSig; fallbackName: string = ''): boolean;
var
  r, rFlst: tRecord;
  formFlst: cardinal;
  i: integer;
  f: tfield;
begin
  result := false;
  if fallbackName <> '' then
  begin
    AddNPCToListEx(fallbackName);
    exit(true);
  end;
  if formID <> 0 then
  begin
    result := true;
    r := loader.EspLoader.getFastRecord(formID);
    if assigned(r) and (r.header.name = headerFLST) then
    begin
      for i := 0 to pred(r.fList.count) do
      begin
        f := r.fList[i];
        if cardinal(f.header.name) = cardinal(headerLNAM) then
        begin
          move(f.buffer[0], formFlst, SizeOf(formFlst));
          formFlst := loader.EspLoader.setFormIdMapping(r, formFlst);
          rFlst := loader.EspLoader.getFastRecord(formFlst);
          AddNPCToListEx(getNPCName(rFlst, formFlst, defaultSig));
        end;
      end
    end
    else
      AddNPCToListEx(getNPCName(r, formID, defaultSig));
  end;
end;

procedure TImportDial.generateNPCMap(loader: tTranslatorLoader);
var
  i, j: integer;
  scenFormID: cardinal;
  mEsp: tespLoader;
  r: tRecord;
begin

  loader.EspLoader.buildInheritedData;
  // scen parsing
  for i := 0 to pred(loader.EspLoader.aInheritedEsp.count) do
  begin
    mEsp := loader.EspLoader.aInheritedEsp[i];
    if assigned(mEsp) then
      for j := pred(mEsp.SceneList.count) downto 0 do
      begin
        r := mEsp.SceneList[j];
        // get the scene_ref, then get the latest override for the scene.
        scenFormID := mEsp.setFormIdMapping(r.headerdata.formID);
        r := loader.EspLoader.getFastRecord(scenFormID, headerSCEN);
        if assigned(r) then
          parseSceneRec(mEsp, r);
      end;
  end;
  ProgressBar.Max := loader.listarray[2].count;
  pBar := 0;
  // ---------Generate all dialog
  for i := 0 to pred(loader.listarray[2].count) do
  begin
    currentSk := loader.listarray[2][i];
    if assigned(currentSk.esp.rec) then
    begin
      if bGameIsSF then
        getNPCFromInfoSF(loader, currentSk.esp.rec, currentSk.esp.field)
      else
        getNPCFromInfo(loader, currentSk.esp.rec);
    end;
    UpdatePBar(500);
  end;
  // dofeedback
  // finalyze
  clearSceneParse;
  lDialListByInfo.sort(CompareDialDataInfoAndResponse);
  lDialListByNPC.sort(CompareDialDataNPC);
  lNpcName.sorted := false;
  lNpcName.ObjSorted := true;
end;

end.
