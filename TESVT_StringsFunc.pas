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
unit TESVT_StringsFunc;

interface

uses Windows, SysUtils, Classes, math, TESVT_Const, TESVT_Typedef, TESVT_Ressources, TESVT_FastSearch, TESVT_fstreamSave, TESVT_espDefinition;

type
  parseOpt = (createNodeCache, CreateNodeAddon, idMatchSource, idMatchSourceBuildVocab, idMatchTrans, idMatchTransTool, idMatchTransVocab);

  parseResult = record
    OrpheanCount: integer;
    codepage: string;
  end;

function parseStrings(filename: string; l: tlist; opt: parseOpt; baseindex, listIndex, LDBase: integer; forceCP: string; fProc: tCompareProc = nil): parseResult;
function parseStringsbuf(buffer: tbytes; filename: string; l: tlist; opt: parseOpt; baseindex, listIndex, LDBase: integer; forceCP: string; fProc: tCompareProc = nil): parseResult;
function parseStringsEx(fstream: tmemorystream; l: tlist; opt: parseOpt; baseindex, listIndex, LDBase: integer; codepage: rCodepage; fProc: tCompareProc = nil): integer;
function saveStringFile(filename: string; listArray: tAlist; listIndex: integer): boolean;

implementation

function parseStrings(filename: string; l: tlist; opt: parseOpt; baseindex, listIndex, LDBase: integer; forceCP: string; fProc: tCompareProc = nil): parseResult;
var
  fstream: tmemorystream;
  codepage: rCodepage;
begin
  Result.OrpheanCount:= 0;
  codepage:= getcodepage(filename, codepageFiles, forceCP, forcedCodepage);
  Result.codepage:= codepage.s;
  updateStatus(ExtractFileName(filename));
  dofeedback(ExtractFileName(filename));
  fstream:= tmemorystream.Create;
  try
    try
      fstream.loadfromfile(filename);
      if fstream.size > 0 then
        Result.OrpheanCount:= parseStringsEx(fstream, l, opt, baseindex, listIndex, LDBase, codepage, fProc);
    finally
      fstream.free;
    end;
  except
    On E: Exception do
    begin
      dofeedback(E.Message, true);
      Result.OrpheanCount:= -1;
    end;
  end
end;

function parseStringsbuf(buffer: tbytes; filename: string; l: tlist; opt: parseOpt; baseindex, listIndex, LDBase: integer; forceCP: string; fProc: tCompareProc = nil): parseResult;
var
  fstream: tmemorystream;
  codepage: rCodepage;
begin
  Result.OrpheanCount:= 0;
  codepage:= getcodepage(filename, codepageFiles, forceCP, forcedCodepage);
  Result.codepage:= codepage.s;
  updateStatus(ExtractFileName(filename));
  dofeedback(ExtractFileName(filename));
  fstream:= tmemorystream.Create;
  try
    try
      fstream.WriteBuffer(buffer[0], length(buffer));
      fstream.Position:= 0;
      if fstream.size > 0 then
        Result.OrpheanCount:= parseStringsEx(fstream, l, opt, baseindex, listIndex, LDBase, codepage, fProc);
    finally
      fstream.free;
    end;
  except
    On E: Exception do
    begin
      dofeedback(E.Message, true);
      Result.OrpheanCount:= -1;
    end;
  end
end;

procedure findIdmatchTrans(skyStr: tskystr; l: tlist);
var
  k: integer;
begin
  if FastListSearch(l, compareStrIdLow, skyStr, k, false) then
  begin
    include(tskystr(l[k]).sinternalparams, matchedIDfound);
    tskystr(l[k]).setTransLite(skyStr.s);
  end;
  skyStr.free;
end;

procedure findIdmatchTransVocab(skyStr: tskystr; l: tlist);
var
  i, k: integer;
  sk: tskystr;
begin
  if FastListSearch(l, compareStrIdLow, skyStr, k, true) then
  begin
    sk:= l[k];

    if sk.strans <> skyStr.s then
      sk.resetStatus([validated])
    else
      sk.resetStatus([translated]);
    tskystr(l[k]).setTransLite(skyStr.s);

    for i:= k to l.count - 1 do // sharedID
    begin
      if (compareStrIdLow(skyStr, l[i]) = 0) then
      begin
        if (sk <> l[i]) then
        begin
          if tskystr(l[i]).strans <> skyStr.s then
            tskystr(l[i]).resetStatus([validated])
          else
            tskystr(l[i]).resetStatus([translated]);
          tskystr(l[i]).setTransLite(skyStr.s);
        end;
      end
      else
        break;
    end;
  end;
  skyStr.free;
end;

procedure findIdmatchTransTool(skyStr: tskystr; l: tlist; fProc: tCompareProc = nil);
var
  k: integer;
  sk: tskystr;
begin
  if FastListSearch(l, compareStrIdLow, skyStr, k, false) then
  begin
    sk:= l[k];
    if fProc(sk) then
    begin
      if sk.strans <> skyStr.s then
        sk.resetStatus([validated])
      else
        sk.resetStatus([translated]);
      tskystr(l[k]).setTransLite(skyStr.s);
    end;
  end;
  skyStr.free;
end;

function findIdmatch(skyStr: tskystr; l: tlist; keepOrphean: boolean; bBuildVocab: boolean): boolean;
var
  i, k: integer;
  sk: tskystr;
begin
  Result:= false;
  if FastListSearch(l, compareStrIdLow, skyStr, k, true) then
  begin
    sk:= l[k];
    sk.setSourceLite(skyStr.s);
    if not bBuildVocab then
      if bInitLocStringatStart then
        sk.Initstrings(false);
    include(sk.sinternalparams, toLocalizedEsp);

    // apply all similarField to the same Sk  - should not happen on proper .strings files.
    for i:= k to l.count - 1 do
    begin
      if (compareStrIdLow(skyStr, l[i]) = 0) then
      begin
        if (sk <> l[i]) and not(toLocalizedSharedID in tskystr(l[i]).sinternalparams) then
        begin
          include(tskystr(l[i]).sinternalparams, toLocalizedEsp);
          tskystr(l[i]).setSourceLite(skyStr.s);
          tfield(tskystr(l[i]).esp.field).sk:= sk;
          if not bBuildVocab then
          begin
            include(sk.sinternalparams, toLocalizedSharedID);
            include(tskystr(l[i]).sinternalparams, toLocalizedSharedID);
            include(tskystr(l[i]).sinternalparams, isDeleted);
            if bInitLocStringatStart then
              tskystr(l[i]).Initstrings(false);
          end;
        end;
      end
      else
        break;
    end;
    Result:= true;
  end
  else
  begin
    if keepOrphean then
    begin
      include(skyStr.sinternalparams, isOrphean);
      if bInitLocStringatStart then
        skyStr.Initstrings(false);
      if addPointertoSortedList(l, compareStrIdLow, skyStr) then
        exit;
    end;
  end;
  skyStr.free
end;

function parseStringsEx(fstream: tmemorystream; l: tlist; opt: parseOpt; baseindex, listIndex, LDBase: integer; codepage: rCodepage; fProc: tCompareProc = nil): integer;
var
  // info from http://www.uesp.net/wiki/Tes5Mod:String_Table_File_Format
  sCount: integer;
  sDataSize: integer;
  ltmp: tlist;
  i: integer;
  pId: ^rId;
  skyStr: tskystr;
  dataPos: int64;
  c: ansichar;
  tmps: rawbytestring;
  stringsize: integer;
  orphean: integer;
  readExtraInt: boolean;
  bFallback: boolean;
  nbFallback: integer;
begin
  orphean:= 0;
  nbFallback:= 0;
  readExtraInt:= listIndex > 0;
  ltmp:= tlist.Create;
  try
    // parse
    fstream.read(sCount, SizeOf(sCount));
    fstream.read(sDataSize, SizeOf(sDataSize));

    ltmp.capacity:= sCount;

    dofeedback(format(resLogCount, [sCount]));
    dofeedback(format(resLogSize, [sDataSize]));
    dofeedback(format(resLogcodepage, [codepage.s]));

    for i:= 0 to sCount - 1 do
    begin
      new(pId);
      fstream.read(pId^, SizeOf(rId));
      ltmp.add(pId);
    end;
    // store pos of data
    dataPos:= fstream.Position;

    ProgressBar.Max:= ltmp.count;
    // read actual string
    pBar:= 0;
    for i:= 0 to ltmp.count - 1 do
    begin
      pId:= ltmp.items[i];
      tmps:= '';
      UpdatePBar(pBarFrequencies);
      fstream.seek(int64(dataPos + pId^.offset), soFromBeginning);
      if readExtraInt then // for ilstrings/dlstrings
      begin
        fstream.read(stringsize, SizeOf(stringsize));
        SetString(tmps, nil, stringsize - 1);
        fstream.read(pointer(tmps)^, stringsize - 1);
      end
      else
      begin
        fstream.read(c, SizeOf(c));
        while (fstream.Position < fstream.size) and (c <> #0) do
        begin
          tmps:= tmps + c;
          fstream.read(c, SizeOf(c));
        end;
      end;

      skyStr:= tskystr.init(0, pId^.id + baseindex, rawStringtoString(tmps, codepage, bFallback), '', listIndex, LDBase, [], [], nil, false);
      if bFallback then
        inc(nbFallback);
      // opt = createNode
      case opt of
        createNodeCache, CreateNodeAddon: l.add(skyStr);
        idMatchSource:
          if not findIdmatch(skyStr, l, OptKeepOrpheanStr, false) then
            inc(orphean);
        idMatchSourceBuildVocab:
          if not findIdmatch(skyStr, l, OptKeepOrpheanStr, true) then
            inc(orphean);
        idMatchTrans: findIdmatchTrans(skyStr, l);
        idMatchTransTool: findIdmatchTransTool(skyStr, l, fProc);
        idMatchTransVocab: findIdmatchTransVocab(skyStr, l);
      end;
    end;
    Result:= orphean;
  finally
    // cleanup
    for i:= 0 to ltmp.count - 1 do
    begin
      pId:= ltmp.items[i];
      dispose(pId);
    end;
    ltmp.free;
    fallbackFbk(nbFallback, codepage);
    dofeedback(strSeparator);
  end;
end;

function saveStringFile(filename: string; listArray: tAlist; listIndex: integer): boolean;
var
  fstream: tmemorystream;
  i, k, index: integer;
  sk: tskystr;
  datasize, stringPos: integer;
  codepage: rCodepage;
  tmpdatapos: integer;
  tmpstringsize: integer;
  WriteextraInt: boolean;
  datalist: tlist;
  sxp, sxpTmp: tstringexport;
begin
  Result:= false;

  datalist:= tlist.Create;
  datalist.capacity:= listArray[listIndex].count;

  codepage:= getcodepage(filename, codepageFiles, bforceCpOnSave, ''); // ForceUtf8onsave1.checked
  dofeedback(formatres('Fbk_Saving', [filename + strList[listIndex]]));
  dofeedback(formatres('Fbk_Codepage', [codepage.s]));

  // preparedatalist
  listArray[listIndex].Sort(compareHashTransandTrans);
  for i:= 0 to listArray[listIndex].count - 1 do
  begin
    sk:= listArray[listIndex].items[i];
    // check for nulltrans
    if checkForNullTrans(sk.s, sk.strans) then
      sk.strans:= ' ';
    sxp:= tstringexport.init(0, -1, sk);
    if datalist.count = 0 then
      datalist.add(sxp)
    else
    begin
      sxpTmp:= datalist[datalist.count - 1];
      if compareHashTransandTransExp(sxp, sxpTmp) <> 0 then
        datalist.add(sxp)
      else
        sxp.free;
    end
  end;
  // -------------
  listArray[listIndex].Sort(compareStrIdLow);

  WriteextraInt:= listIndex > 0;
  fstream:= tmemorystream.Create;
  try
    try
      fstream.SetSize(listArray[listIndex].count * 2 * 4 + 4 * 2);
      tmpdatapos:= listArray[listIndex].count * 2 * 4 + 4 * 2;
      datasize:= 0;

      for i:= 0 to listArray[listIndex].count - 1 do
      begin
        UpdatePBar(pBarFrequencies);
        fstream.Position:= tmpdatapos;
        sk:= listArray[listIndex].items[i];
        // check for nulltrans
        if checkForNullTrans(sk.s, sk.strans) then
          sk.strans:= ' ';
        sxp:= tstringexport.init(0, datasize, sk);
        if FastListSearch(datalist, compareHashTransandTransExp, sxp, index, false) then
        begin
          sxpTmp:= datalist[index];
          if sxpTmp.pos = -1 then
          begin
            sxpTmp.pos:= datasize;
            tmpstringsize:= codepage.f(sk.strans, fstream, WriteextraInt);
          end
          else
            tmpstringsize:= 0;

          stringPos:= sxpTmp.pos;
          tmpdatapos:= fstream.Position;
          fstream.Position:= 4 * 2 + i * 4 * 2;
          fstream.Write(sk.esp.strId, 4);
          fstream.Write(stringPos, 4);
          datasize:= datasize + tmpstringsize;
        end
        else
          inc(debugError); // shouldNotHappen
        sxp.free;
      end;
      // -header
      fstream.Position:= 0;
      fstream.Write(listArray[listIndex].count, SizeOf(integer));
      fstream.Write(datasize, SizeOf(integer));
      // save
      fstream.Position:= 0;
      fstream.SaveToFile(filename + ansiUpperCase(strList[listIndex]));
      dofeedback(strSeparator);
      Result:= true;

    finally
      fstream.free;
      for k:= 0 to datalist.count - 1 do
        tstringexport(datalist[k]).free;
      datalist.free;
    end
  except
    On E: Exception do
      dofeedback(E.Message, true);
  end;
end;

end.
