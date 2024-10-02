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

unit TESVT_Fuz;

interface

uses classes, sysutils, TESVT_Const, TESVT_Utils, TESVT_FastSearch, ioutils, regularexpressions, TESVT_TypeDef, TESVT_EspDefinition;

type
  tfuzExport = class
    bsaId: integer;
    bIsCurrent: byte; // 0 = neutral, 1= current, 2= loose file
    index, indexFd, masterIndex: integer;
    responseID: integer;
    voiceIndex: integer;
    used: boolean;
    sVoiceID: string;
    hVoiceID: Cardinal;
    inFilename: string;
    inExt: string;
    inFolder: string;
    function getSize: Cardinal;
    constructor Create(folder, filename: string; i, j: Cardinal; bsaIndex: integer); overload;
  end;

  tFuz = class
    List: tlist;
    BsaList, voiceType: tstringList;
    current: Cardinal;
    espLoader: tEspLoader;
  private
    function getIndex(formID: Cardinal): byte;
  public
    function getFromRec(r: rdialInfo): boolean; overload;
    function getFromRec(r: rdialInfo; t: tstrings): boolean; overload;
    function getFromRec(r: rdialInfo; var index: integer): boolean; overload;
    function getVoiceFromRec(r: rdialInfo; voiceIndex: integer): boolean;
    procedure verifyFromRec(r: rdialInfo);
    procedure drawVoiceList(l: tstrings; filter: string = '');
    procedure sanitize(mList: tstringList);
    procedure cleanUnused(aList: tAlist);
    procedure buildVoiceType;
    procedure clear;
    constructor Create;
    destructor Destroy; override;
  end;

procedure FindVoiceBSAEx(addonlist: tstringList; Path: String; FBSAList: tstringList);
function compareFuzForSorting(p1, p2: pointer): integer;
function compareFuz(p1, p2: pointer): integer;
function getExpressionString(espLoader: tEspLoader; rEx: Cardinal): string;
procedure getFuzFromFile(folder, filename: string);
procedure getXmwFromFile(folder, filename: string);
procedure getWemFromFile(folder, filename: string);
procedure getFuzFromBuffer(buffer: tbytes);
procedure getXmvFromBuffer(buffer: tbytes);
procedure getFuzFromLooseFiles(l: tlist);
procedure getWemFromBuffer(buffer: tbytes);

var
  fuz: tFuz;
  lFuzBSA: tstringList;

implementation

constructor tfuzExport.Create(folder, filename: string; i, j: Cardinal; bsaIndex: integer);
var
  k: integer;
begin
  bsaId := bsaIndex;
  inFolder := folder;
  used := false;
  inExt := ansilowercase(extractfileext(filename));
  inFilename := trim(removefileext(filename));
  responseID := 0;
  sVoiceID := '';
  hVoiceID := 0;

  masterIndex := 0;
  if bGameIsSF then
  begin
    sVoiceID := ansilowercase(inFilename); // investigate for override
    hVoiceID := stringHash(sVoiceID);
    responseID := 1;
  end
  else
    for k := length(inFilename) downto 1 do
      if inFilename[k] = '_' then
        if (k + 1 <= length(inFilename)) and ((k - 1) >= 1) then
        begin
          responseID := strtointdef(copy(inFilename, k + 1, 3), 0);
          if responseID > 0 then
          begin
            if bGameIsSkyrim then
            begin
              if k - 8 > 0 then
                sVoiceID := ansilowercase(copy(inFilename, k - 8, 8));
            end
            else
              sVoiceID := ansilowercase(copy(inFilename, 1, k - 1));
            hVoiceID := stringHash(sVoiceID);
          end;
          break;
        end;
  index := i;
  indexFd := j;
end;

function tfuzExport.getSize: Cardinal;
begin
  Result := retCardinal(instancesize + length(inFilename) + length(inExt) + length(inFolder)) * 2;
end;

// ==========tFuz===================

constructor tFuz.Create;
begin
  List := tlist.Create;
  espLoader := nil;
  voiceType := tstringList.Create;
  voiceType.sorted := true;
  voiceType.Duplicates := dupIgnore;
  BsaList := tstringList.Create;
  BsaList.Duplicates := dupIgnore;
  BsaList.sorted := true;
  current := 0;
end;

function tFuz.getIndex(formID: Cardinal): byte;
begin
  if assigned(espLoader) then
    Result := espLoader.getMasterIndex(formID)
  else
  begin
    // temp hack for first light / medium support for starfield.
    // Need fixing for extended medium master inheritance
    // works only with the base game medium esm for now.
    // starfield Light and medium master support
    if (byte(formID shr 24) = $FE) or (byte(formID shr 24) = $FD) then
      Result := 1
    else
      Result := byte(formID shr 24);
  end;
end;

destructor tFuz.Destroy;
begin
  clear;
  List.free;
  BsaList.free;
  voiceType.free;
  inherited;
end;

procedure tFuz.clear;
var
  i: integer;
begin
  for i := 0 to pred(List.count) do
    tfuzExport(List[i]).free;
  List.clear;
  voiceType.clear;
  BsaList.clear;
  current := 0;
  espLoader := nil;
end;

procedure tFuz.drawVoiceList(l: tstrings; filter: string = '');
var
  i: integer;
begin
  l.BeginUpdate;
  l.clear;
  for i := 0 to pred(voiceType.count) do
  begin
    if (filter = '') or (pos(filter, ansilowercase(voiceType[i])) > 0) then
      l.addObject(voiceType[i], tobject(i));
  end;
  l.endUpdate;
end;

procedure tFuz.sanitize(mList: tstringList);
var
  i: integer;
  a: sArray;
  tf: tfuzExport;
begin
  // delete unsupported fuz
  for i := pred(List.count) downto 0 do
    if (tfuzExport(List[i]).sVoiceID = '') or (tfuzExport(List[i]).responseID = 0) then
    begin
      // doFeedback(tfuzExport(List[i]).inFilename);
      tfuzExport(List[i]).free;
      List.delete(i);
    end;
  // get ID master
  //for i := pred(List.count) downto 0 do
  for i := 0 to pred(List.count) do
  begin
    tf := List[i];

    explode(tf.inFolder, a, saSlash);
    if length(a) >= 2 then
      tf.masterIndex := mList.indexof(ansilowercase(a[2]))
    else
      tf.masterIndex := 0;
    if tf.bsaId < 0 then
      tf.bIsCurrent := 2
    else if pos(RemoveFileExt(mList[pred(mList.count)]), BsaList[tf.bsaId]) = 1 then
      tf.bIsCurrent := 1;
  end;
  List.sort(compareFuzForSorting);
  setlength(a, 0);
end;

procedure tFuz.cleanUnused(aList: tAlist);
var
  i: integer;
  sk: tskyStr;
  tf: tfuzExport;
  rinfo: rdialInfo;
  // tmplist: tlist;
begin
  // check if the fuz is used
  for i := 0 to pred(aList[2].count) do // INFO are only into list = 2
  begin
    sk := aList[2][i];
    if sk.isEspAssigned then
    begin
      rinfo := sk.GetResponseInfo;
      verifyFromRec(rinfo);
      finalize(rinfo);
    end;
  end;
  // delete unused fuz
  if bCleanFuz then // set in dev Const
  begin
    { tmplist := tlist.Create;
      for i := 0 to pred(List.count) do
      begin
      tf := List[i];
      if not tf.used then
      tf.free
      else
      tmplist.Add(tf);
      end;
      List.clear;
      List.assign(tmplist);
      tmplist.free; }
    for i := pred(List.count) downto 0 do
    begin
      tf := List[i];
      if not tf.used then
      begin
        tf.free;
        List.delete(i);
      end;
    end;

  end;
end;

procedure tFuz.buildVoiceType;
var
  i: integer;
  a: sArray;
  tf: tfuzExport;
begin
  for i := 0 to pred(List.count) do
  begin
    tf := List[i];
    explode(tf.inFolder, a, saSlash);
    if length(a) > 3 then
      voiceType.Add(a[3]);
  end;
  // dispatch voiceType Index
  for i := 0 to pred(List.count) do
  begin
    tf := List[i];
    explode(tf.inFolder, a, saSlash);
    if length(a) > 3 then
      voiceType.Find(a[3], tf.voiceIndex)
  end;
end;

function tFuz.getVoiceFromRec(r: rdialInfo; voiceIndex: integer): boolean;
var
  i, index: integer;
  tf: tfuzExport;
begin
  Result := false;
  if getFromRec(r, index) then
  begin
    for i := index to pred(List.count) do
    begin
      tf := List[i];
      if (r.hVoiceID <> tf.hVoiceID) or (tf.masterIndex <> getIndex(r.rformID)) then
        break;
      if (tf.responseID = r.rID) then
      begin
        if voiceIndex = tf.voiceIndex then
          exit(true);
      end;
    end;
  end;
end;

procedure tFuz.verifyFromRec(r: rdialInfo);
var
  i, index: integer;
  tf: tfuzExport;
begin
  if getFromRec(r, index) then
  begin
    for i := index to pred(List.count) do
    begin
      tf := List[i];
      if (r.hVoiceID <> tf.hVoiceID) or (tf.masterIndex <> getIndex(r.rformID)) then
        break;
      if (tf.responseID = r.rID) then
        tf.used := true;
    end;
  end;
end;

function tFuz.getFromRec(r: rdialInfo; t: tstrings): boolean;
var
  i, index: integer;
  tf: tfuzExport;
begin
  Result := getFromRec(r, index);
  if Result then
  begin
    for i := index to pred(List.count) do
    begin
      tf := List[i];
      if (r.hVoiceID <> tf.hVoiceID) or (tf.masterIndex <> getIndex(r.rformID)) then
        break;
      if (tf.responseID = r.rID) then
      begin
        if tf.bsaId < 0 then
          t.addObject(format('[LooseFile] %s\%s%s', [tf.inFolder, tf.inFilename, tf.inExt]), tf)
        else
          t.addObject(format('[%s] %s\%s%s', [BsaList[tf.bsaId], tf.inFolder, tf.inFilename, tf.inExt]), tf);
      end;
    end;
  end;
end;

function tFuz.getFromRec(r: rdialInfo; var index: integer): boolean;
var
  tfSearch: tfuzExport;
begin
  tfSearch := tfuzExport.Create;
  tfSearch.masterIndex := getIndex(r.rformID); // byte(r.rformID shr 24);
  tfSearch.responseID := r.rID;
  tfSearch.sVoiceID := r.sVoiceID;
  tfSearch.hVoiceID := r.hVoiceID;
  Result := FastListSearch(List, compareFuz, tfSearch, index, true);
  tfSearch.free;
end;

function tFuz.getFromRec(r: rdialInfo): boolean;
var
  index: integer;
begin
  Result := getFromRec(r, index);
end;

procedure getFuzFromFile(folder, filename: string);
var
  f, fOut: tmemorystream;
  header: Cardinal;
  offset: Cardinal;
  size: int64;
begin
  f := tmemorystream.Create;
  fOut := tmemorystream.Create;
  try
    f.loadFromFile(folder + filename);
    f.position := 0;
    f.read(header, sizeof(header));
    f.read(header, sizeof(header));
    f.read(offset, sizeof(offset));
    f.position := f.position + offset;
    size := f.size - f.position;
    fOut.CopyFrom(f, size);
    fOut.savetofile(tmpFuzPath + fuzTMPXMW);
  finally
    fOut.free;
    f.free;
  end;
end;

procedure getXmwFromFile(folder, filename: string);
var
  f: tmemorystream;
begin
  f := tmemorystream.Create;
  try
    f.loadFromFile(folder + filename);
    f.position := 0;
    f.savetofile(tmpFuzPath + fuzTMPXMW);
  finally
    f.free;
  end;
end;

procedure getWemFromFile(folder, filename: string);
var
  f: tmemorystream;
begin
  f := tmemorystream.Create;
  try
    f.loadFromFile(folder + filename);
    f.position := 0;
    f.savetofile(tmpFuzPath + fuzTMPWEM);
  finally
    f.free;
  end;
end;

procedure getFuzFromBuffer(buffer: tbytes);
var
  f, fOut: tmemorystream;
  header: Cardinal;
  offset: Cardinal;
  size: int64;
begin
  f := tmemorystream.Create;
  fOut := tmemorystream.Create;
  try
    f.WriteBuffer(buffer[0], length(buffer));
    f.position := 0;
    f.read(header, sizeof(header));
    f.read(header, sizeof(header));
    f.read(offset, sizeof(offset));
    f.position := f.position + offset;
    size := f.size - f.position;
    fOut.CopyFrom(f, size);
    fOut.savetofile(tmpFuzPath + fuzTMPXMW);
  finally
    fOut.free;
    f.free;
  end;
end;

procedure getXmvFromBuffer(buffer: tbytes);
var
  f: tmemorystream;
begin
  f := tmemorystream.Create;
  try
    f.WriteBuffer(buffer[0], length(buffer));
    f.position := 0;
    f.savetofile(tmpFuzPath + fuzTMPXMW);
  finally
    f.free;
  end;
end;

procedure getWemFromBuffer(buffer: tbytes);
var
  f: tmemorystream;
begin
  f := tmemorystream.Create;
  try
    f.WriteBuffer(buffer[0], length(buffer));
    f.position := 0;
    f.savetofile(tmpFuzPath + fuzTMPWEM);
  finally
    f.free;
  end;
end;

// ==============emote===============

function getExpressionString(espLoader: tEspLoader; rEx: Cardinal): string;
begin
  if bGameIsSF and assigned(espLoader) then
    Result := espLoader.findkeyword(rEx, nil, true)
  else
    Result := EmoteDefinitionList.values[inttohex(rEx, 8)];
  if (Result = '') then
    Result := EmoteDefinitionList.values['FFFFFFFF'];
end;

// ==============folder===============

function isFuzBSA(sSearch, sFile: string): boolean;
var
  r: TRegEx;
begin
  r := TRegEx.Create(sSearch);
  Result := false;
  try
    Result := r.ismatch(sFile);
  except
  end;
end;

procedure FindVoiceBSAEx(addonlist: tstringList; Path: String; FBSAList: tstringList);
var
  searchResult: TSearchRec;
  tmpResult, tmpSearch: string;
  i, j: integer;
begin
  FBSAList.clear;
  Path := IncludeTrailingPathDelimiter(Path);
  try
    if (FindFirst(Path + '*.*', faAnyFile - faDirectory, searchResult) = 0) then
    begin
      repeat
        tmpResult := ansilowercase(searchResult.Name);
        for i := 0 to pred(addonlist.count) do
        begin
          if AnsiPos(extractfileext(tmpResult), '.ba2;.bsa') > 0 then
          begin
            for j := 0 to pred(lFuzBSA.count) do
            begin
              tmpSearch := ansilowercase(stringReplace(lFuzBSA[j], '%basename%', removefileext(addonlist[i]), [rfIgnoreCase]));
              if isFuzBSA(tmpSearch, removefileext(tmpResult)) then
                FBSAList.Add(tmpResult)
            end;
          end;
        end;
      until FindNext(searchResult) <> 0;
    end;
  finally
    FindClose(searchResult);
  end;
end;

procedure getFuzFromLooseFiles(l: tlist);
var
  Path, pathLower: string;
begin
  if directoryExists(Game_CacheDataFolder + fuzLooseFolder) then
    for Path in TDirectory.GetFiles(Game_CacheDataFolder + fuzLooseFolder, '*.*', TSearchOption.soAllDirectories) do
    begin
      pathLower := ansilowercase(copy(Path, length(Game_CacheDataFolder) + 1, length(Path)));
      if pos(extractfileext(pathLower), sfuzExt) > 0 then
        l.Add(tfuzExport.Create(extractFileDir(pathLower), extractFileName(pathLower), 0, 0, -1));
    end;
end;

// -----------
// =FUZ quick sort & search=
function compareFuzHashID(p1, p2: pointer): integer;
begin
  Result := compareCardinal(tfuzExport(p1).hVoiceID, tfuzExport(p2).hVoiceID);
  if Result = 0 then
    Result := AnsiCompareText(tfuzExport(p1).sVoiceID, tfuzExport(p2).sVoiceID);
end;

function compareFuzForSorting(p1, p2: pointer): integer;
begin
  Result := compareFuzHashID(p1, p2);
  if Result = 0 then
    Result := tfuzExport(p1).responseID - tfuzExport(p2).responseID;
  if Result = 0 then
    Result := tfuzExport(p1).masterIndex - tfuzExport(p2).masterIndex;
  if Result = 0 then
    Result := tfuzExport(p2).bIsCurrent - tfuzExport(p1).bIsCurrent;
end;

function compareFuz(p1, p2: pointer): integer;
begin
  Result := compareFuzHashID(p1, p2);
  if Result = 0 then
    Result := tfuzExport(p1).responseID - tfuzExport(p2).responseID;
  if Result = 0 then
    Result := tfuzExport(p1).masterIndex - tfuzExport(p2).masterIndex;
end;

end.
