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
unit TESVT_SSTFunc;

interface

uses Windows, Messages, SysUtils, Classes, math, TESVT_Const, TESVT_Typedef, TESVT_espDefinition, TESVT_Ressources, TESVT_FastSearch, TESVT_fstreamSave,
  VirtualTrees, VirtualTrees.basetree, TESVT_Streams, TESVT_LinkedList;

procedure clearSkList(l: tlist; freePointer: boolean);
procedure cleararrayList(l: tAlist; freePointer, freeList: boolean);
procedure cleartrees;
procedure clearTreesSelection;
function getSSTFileName(filename: string; ext: string): string;
function getReverseSSTFileName(filename: string; ext: string): string;
procedure clearInternalRefList(list: tlist; freeList: boolean = false);
function SaveSSTFile(filename: string; listArray: tAlist; fproc: tCompareProc; onlyColabId: integer; oldList: tlist; colabLabel, masterList: tstringList): boolean;
function loadSstEdit(vlist: tAlist; filename: string; var count: integer; extraParamscheck, extraParams: sStrParams; initSk: boolean; colabLabel, masterList: tstringList): boolean;
function loadVocabUserCache(edidList, vlist: tlist; filename: string; Node: pointer; id: cardinal; var count: integer; extraParamscheck, extraParams: sStrParams;
  bForceInit: boolean; bFastLoad: boolean; colabLabel, masterList: tstringList; var version: integer; loadAll: boolean = false): boolean;

implementation

function getHeader(f: tstream): integer;
var
  tmpHeader: cardinal;
begin
  result := 0;
  try
    f.Read(tmpHeader, sizeof(tmpHeader));
    if tmpHeader = VocabUserHeader then
      result := 1
    else if tmpHeader = VocabUserHeader2 then
      result := 2
    else if tmpHeader = VocabUserHeader3 then
      result := 3
    else if tmpHeader = VocabUserHeader4 then
      result := 4
    else if tmpHeader = VocabUserHeader5 then
      result := 5
    else if tmpHeader = VocabUserHeader6 then
      result := 6
    else if tmpHeader = VocabUserHeader7 then
      result := 7
    else if tmpHeader = VocabUserHeader8 then
      result := 8;
  except
  end;
end;

function getSSTFileName(filename: string; ext: string): string;
var
  tmpname: string;
begin
  tmpname := removeFileExt(filename, '.' + ext);
  result := format('%s_%s_%s.%s', [tmpname, Sourcelanguage, Destlanguage, ext]);
end;

function getReverseSSTFileName(filename: string; ext: string): string;
var
  tmpname: string;
begin
  tmpname := removeFileExt(filename, '.' + ext);
  result := format('%s_%s_%s.%s', [tmpname, Destlanguage, Sourcelanguage, ext]);
end;

procedure WriteStringToStream(stream: tmemorystream; const s: string);
begin
  stream.WriteBuffer(pointer(s)^, length(s) * sizeof(char));
end;

procedure cleartrees;
var
  j: integer;
begin
  for j := 0 to 2 do
    treearray[j].clear;
end;

procedure clearTreesSelection;
var
  j: integer;
begin
  for j := 0 to 2 do
    treearray[j].ClearSelection;
end;

procedure clearSkList(l: tlist; freePointer: boolean);
var
  i: integer;
begin
  if freePointer then
    for i := 0 to l.count - 1 do
      tskystr(l.items[i]).free;
  l.clear;
end;

procedure cleararrayList(l: tAlist; freePointer, freeList: boolean);
var
  j: integer;
begin
  for j := 0 to 2 do
  begin
    clearSkList(l[j], freePointer);
    if freeList then
      l[j].free;
  end;
end;

procedure clearInternalRefList(list: tlist; freeList: boolean = false);
var
  i: integer;
begin
  for i := 0 to pred(list.count) do
    tEspStrRef(list.items[i]).free;
  list.clear;
  if freeList then
    list.free;
end;

procedure prepareSSTFile(listArray: tAlist; fproc: tCompareProc; onlyColabId: integer; oldList: tlist);
var
  i, j: integer;
  sk1: tskystr;
begin
  // adding regular strings the old way
  for j := 0 to 2 do
    for i := 0 to listArray[j].count - 1 do
    begin
      sk1 := listArray[j].items[i];
      // filter
      if not fproc(sk1) then
        continue;
      // colab
      if onlyColabId > 0 then
        if sk1.colabId <> onlyColabId then
          continue;
      // colab stuff
      if sk1.sparams = [] then
      begin
        if sk1.colabId > 0 then
          include(sk1.sparams, pending);
        if sk1.colabId = 0 then
          exclude(sk1.sparams, pending);
      end;
      // skip empty string
      if sk1.isEmpty and (sk1.colabId = 0) then
        continue;
      // pexNoTrans , VMAD + lockedTrans
      if sk1.lockedStatus then
        continue;
      // badly defined string
      if not(sk1.sinternalparams * [isDeleted, lowwarning, warning, bigwarning, nTrans] = []) then
        continue;
      // pass on unsecure strings
      if sk1.sparams * [translated, lockedTrans, incompleteTrans, validated, pending] = [] then
        continue;
      // cleanUp LockedTransStatus
      if lockedTrans in sk1.sparams then
        sk1.sparams := sk1.sparams - [translated, incompleteTrans, validated];

      // restore OldData Status when saving a direcly opened sst
      if (unusedInSST in sk1.sinternalparams) and not(pending in sk1.sparams) then
        include(sk1.sparams, oldData);

      LocalVocabBaseList.add(sk1);
      UpdatePBar(1000);
    end;

  if assigned(oldList) then
    for i := 0 to pred(oldList.count) do
      LocalVocabBaseList.add(oldList[i]);

  LocalVocabBaseList.sort(compareallHashesAndSources);
end;

function SaveSSTFile(filename: string; listArray: tAlist; fproc: tCompareProc; onlyColabId: integer; oldList: tlist; colabLabel, masterList: tstringList): boolean;
var
  i, tmpSize: integer;
  f: tmemorystream;
  sk: tskystr;
  tmpParams: sStrParams;
  tmpByte: byte;
  data: rEspPointerLite;
  tmpInteger: integer;
begin
  result := false;

  ProgressBar.Max := getTotalVocabCount(listArray);
  if assigned(oldList) then
    ProgressBar.Max := ProgressBar.Max + oldList.count;
  pBar := 0;

  prepareSSTFile(listArray, fproc, onlyColabId, oldList);
  if (onlyColabId > 0) and (LocalVocabBaseList.count = 0) then
    exit(true);

  ProgressBar.Max := LocalVocabBaseList.count;
  pBar := 0;
  // save
  f := tmemorystream.Create;
  try
    try
      // save header
      f.Write(VocabUserHeader8, sizeof(cardinal));
      // v4: placeholder for flag
      tmpByte := 0;
      f.Write(tmpByte, sizeof(tmpByte));
      // masterList v8
      if assigned(masterList) then
      begin
        tmpInteger := masterList.count;
        f.Write(tmpInteger, sizeof(tmpInteger));
        for i := 0 to pred(masterList.count) do
        begin
          // --------StrSize
          tmpSize := length(masterList[i]) * sizeof(char);
          f.Write(tmpSize, sizeof(integer));
          WriteStringToStream(f, masterList[i]);
        end;
      end
      else
      begin
        tmpInteger := 0;
        f.Write(tmpInteger, sizeof(tmpInteger));
      end;
      // colabLabel
      if assigned(colabLabel) then
      begin
        tmpInteger := colabLabel.count;
        f.Write(tmpInteger, sizeof(tmpInteger));
        for i := 0 to pred(colabLabel.count) do
        begin
          // --------ColabID:
          tmpInteger := integer(colabLabel.Objects[i]);
          f.Write(tmpInteger, sizeof(tmpInteger));
          // --------StrSize
          tmpSize := length(colabLabel[i]) * sizeof(char);
          f.Write(tmpSize, sizeof(integer));
          // --------String
          WriteStringToStream(f, colabLabel[i]);
        end;
      end
      else
      begin
        tmpInteger := 0;
        f.Write(tmpInteger, sizeof(tmpInteger));
      end;

      // -------------------
      for i := 0 to LocalVocabBaseList.count - 1 do
      begin
        sk := LocalVocabBaseList[i];
        tmpParams := sk.sparams - [validated];
        f.Write(sk.listIndex, sizeof(sk.listIndex));
        CopyMemory(@data, @sk.esp, sizeof(rEspPointerLite));
        f.Write(data, sizeof(rEspPointerLite));
        f.Write(sk.colabId, sizeof(sk.colabId));
        f.Write(tmpParams, sizeof(tmpParams));
        tmpSize := length(sk.s) * sizeof(char);
        f.Write(tmpSize, sizeof(integer));
        WriteStringToStream(f, sk.s);
        tmpSize := length(sk.strans) * sizeof(char);
        f.Write(tmpSize, sizeof(integer));
        WriteStringToStream(f, sk.strans);
        UpdatePBar(1000);
      end;
      f.SaveToFile(filename);
      result := true;
    finally
      f.free;
      LocalVocabBaseList.clear;
    end;
  except
    On E: Exception do
      dofeedback(E.Message, true);
  end;
end;

function loadSstEdit(vlist: tAlist; filename: string; var count: integer; extraParamscheck, extraParams: sStrParams; initSk: boolean; colabLabel, masterList: tstringList): boolean;
var
  f: tmemorystream;
  sk: tskystr;
  ssize: integer;
  l, tmpByte, colabId: byte;
  s, strans: string;
  sP: sStrParams;
  endpos: int64;
  version: integer;
  data: rEspPointerLite;
  i, tmpInteger: integer;
begin
  result := false;
  pBar := 0;
  if not FileExists(filename) then
    exit;
  f := tmemorystream.Create;
  try
    try
      f.loadfromfile(filename);
      endpos := f.size;

      version := getHeader(f);

      if version > 0 then
      begin
        ProgressBar.Max := Int64Rec(endpos).Lo;

        // v4 placeholder Flag
        if version > 3 then
          f.Read(tmpByte, sizeof(tmpByte));

        if version > 7 then // v8 masterlist
        begin
          // masterList count
          f.Read(tmpInteger, sizeof(tmpInteger));
          for i := 0 to tmpInteger - 1 do
          begin
            // --------String
            f.Read(ssize, sizeof(ssize));
            SetString(s, nil, ssize div sizeof(char));
            f.Read(pointer(s)^, ssize);
            if assigned(masterList) then
              masterList.add(s);
          end;
        end;

        if version > 6 then
        begin
          // colab count
          f.Read(tmpInteger, sizeof(tmpInteger));
          for i := 0 to tmpInteger - 1 do
          begin
            // --------ColabID:
            f.Read(tmpInteger, sizeof(tmpInteger));
            // --------String
            f.Read(ssize, sizeof(ssize));
            SetString(s, nil, ssize div sizeof(char));
            f.Read(pointer(s)^, ssize);
            if assigned(colabLabel) then
              colabLabel.AddObject(s, tObject(tmpInteger));
          end;
        end;

        while f.Position < endpos do
        begin
          f.Read(l, sizeof(l));
          // init
          fillChar(data, sizeof(data), 0);
          colabId := 0;
          // new version2 & 3
          if version > 1 then
          begin
            f.Read(data.strID, sizeof(data.strID));
            f.Read(data.FormID, sizeof(data.FormID));

            if version > 4 then
              f.Read(data.rName, sizeof(data.rName));
            f.Read(data.fName, sizeof(data.fName));
            if version > 2 then
            begin
              // index
              f.Read(data.index, sizeof(data.index));
            end;
            if version > 3 then
            begin
              // indexMax
              f.Read(data.indexMax, sizeof(data.indexMax));
              // Edidash
              f.Read(data.rHash, sizeof(data.rHash));
            end;
            if version > 5 then
              f.Read(colabId, sizeof(colabId));
          end;
          // ----------------------
          f.Read(sP, sizeof(sP));
          f.Read(ssize, sizeof(ssize));
          SetString(s, nil, ssize div sizeof(char));
          f.Read(pointer(s)^, ssize);
          f.Read(ssize, sizeof(ssize));
          SetString(strans, nil, ssize div sizeof(char));
          f.Read(pointer(strans)^, ssize);
          if checkForNullTrans(s, strans) then
            continue;
          // clean deprecated data for old sst
          if version < 4 then
            sP := sP - [lockedTrans, deprecatedParam1, deprecatedParam2];
          if sP * extraParamscheck = [] then
            sP := sP + extraParams;
          sk := tskystr.init(0, data.strID, s, strans, l, 0, sP, [], nil, initSk);
          sk.colabId := colabId;
          CopyMemory(@sk.esp, @data, sizeof(rEspPointerLite));

          if oldData in sk.sparams then
          begin
            exclude(sk.sparams, oldData);
            include(sk.sinternalparams, unusedInSST);
          end;

          if pending in sk.sparams then
            sk.resetTrans;

          // -----------------
          vlist[l].add(sk);
          inc(count);
          inc(pBar);
          if pBar mod 50 = 0 then
            ProgressBar.Position := Int64Rec(f.Position).Lo;
        end;
        result := true;
      end;
    except
      dofeedback(getres('FbK_SSTLoadError'), true)
    end;
  finally
    ProgressBar.Position := endpos;
    f.free;
  end;
end;

function loadVocabUserCache(edidList, vlist: tlist; filename: string; Node: pointer; id: cardinal; var count: integer; extraParamscheck, extraParams: sStrParams;
  bForceInit: boolean; bFastLoad: boolean; colabLabel, masterList: tstringList; var version: integer; loadAll: boolean = false): boolean;
var
  f: TwbReadOnlyCachedFileStream;
  sk: tskystr;
  ssize: integer;
  s, strans: string;
  sP: sStrParams;
  endpos: int64;
  l, tmpByte, colabId: byte;
  i, tmpInteger: integer;
  index: integer;
  data: rEspPointerLite;
begin
  result := false;
  f := nil;
  if not FileExists(filename) then
    exit;
  try
    try
      f := TwbReadOnlyCachedFileStream.Create(filename);
      endpos := f.size;

      version := getHeader(f);

      if version > 0 then
      begin
        // v4 placeholder Flag
        if version > 3 then
          f.Read(tmpByte, sizeof(tmpByte));

        if version > 7 then // v8 masterlist
        begin
          // masterList count
          f.Read(tmpInteger, sizeof(tmpInteger));
          for i := 0 to tmpInteger - 1 do
          begin
            // --------String
            f.Read(ssize, sizeof(ssize));
            SetString(s, nil, ssize div sizeof(char));
            f.Read(pointer(s)^, ssize);
            if assigned(masterList) then
              masterList.add(s);
          end;
        end;

        if version > 6 then
        begin
          // colab count
          f.Read(tmpInteger, sizeof(tmpInteger));
          for i := 0 to tmpInteger - 1 do
          begin
            // --------ColabID:
            f.Read(tmpInteger, sizeof(tmpInteger));
            // --------String
            f.Read(ssize, sizeof(ssize));
            SetString(s, nil, ssize div sizeof(char));
            f.Read(pointer(s)^, ssize);
            if assigned(colabLabel) then
              colabLabel.AddObject(s, tObject(tmpInteger));
          end;
        end;

        while f.Position < endpos do
        begin
          f.Read(l, sizeof(l));
          // init
          fillChar(data, sizeof(data), 0);
          colabId := 0;
          // new version2 & 3
          if version > 1 then
          begin
            f.Read(data.strID, sizeof(data.strID));
            f.Read(data.FormID, sizeof(data.FormID));

            if version > 4 then
              f.Read(data.rName, sizeof(data.rName));
            f.Read(data.fName, sizeof(data.fName));
            if version > 2 then
            begin
              // index
              f.Read(data.index, sizeof(data.index));
            end;
            if version > 3 then
            begin
              // indexMax
              f.Read(data.indexMax, sizeof(data.indexMax));
              // Edidash
              f.Read(data.rHash, sizeof(data.rHash));
            end;
            if version > 5 then
              f.Read(colabId, sizeof(colabId));
          end;
          // ----------------------
          f.Read(sP, sizeof(sP));
          f.Read(ssize, sizeof(ssize));
          SetString(s, nil, ssize div sizeof(char));
          f.Read(pointer(s)^, ssize);
          f.Read(ssize, sizeof(ssize));
          SetString(strans, nil, ssize div sizeof(char));
          f.Read(pointer(strans)^, ssize);
          if checkForNullTrans(s, strans) then
            continue;
          // clean deprecated data for old sst
          if version < 4 then
            sP := sP - [lockedTrans, deprecatedParam1, deprecatedParam2];
          // in the cache we dont allow partial, but we load it in sststringLoad
          if loadAll or (sP * [lockedTrans, incompleteTrans, pending] = []) then
          begin
            inc(count);
            if sP * extraParamscheck = [] then
              sP := sP + extraParams;
            // init Sk
            sk := tskystr.init(id, data.strID, s, strans, l, 0, sP, [isCache], Node, bForceInit);
            CopyMemory(@sk.esp, @data, sizeof(rEspPointerLite));
            if loadAll then
              sk.colabId := colabId;

            if oldData in sk.sparams then
            begin
              exclude(sk.sparams, oldData);
              include(sk.sinternalparams, AllUnUsedInSST);
              if not loadAll then // if vocab, then add unused tag
                include(sk.sinternalparams, unusedInSST);
            end;
            if version > 3 then
              include(sk.sinternalparams, isversion4);

            // test 1.4.6
            if bFastLoad then
              vlist.add(sk)
            else
            // -----old loading
            begin
              if not addPointertoSortedList(vlist, compareallHashesAndSources, sk, index) then
              begin
                sk.free;
                sk := vlist[index];
              end;
              if (data.rHash <> 0) and (version > 3) then
              begin
                edidList.add(tEspStrRef.init(sk, data, l, sP, colabId, true));
                sk.addRefRec(data.rName, data.fName);
              end;
            end
          end;
        end;
        result := true;

      end;
    except
      dofeedback(getres('FbK_SSTLoadError'), true)
    end;
  finally
    f.free;
  end;
end;

end.
