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
unit TESVT_XMLFunc;

interface

uses Windows, Messages, SysUtils, Classes, math, TESVT_Const, TESVT_Typedef, TESVT_Fuz, TESVT_espDefinition, TESVT_Ressources, TESVT_FastSearch,
  OmniXML, TESVT_TranslateFunc, TESVT_Streams, TESVT_SSTFunc;

procedure XMLExportbase(filename, addon_Name: string; listArray: tAlist; fProc: tCompareProc; bExportFuz: boolean);
procedure XMLImportbase(filename: string; listArray: tAlist; idProc: integer; fProc, fprocVmad, fProcVmadtrans: tCompareProc; resetState: boolean);
procedure XMLImportbase_EspTranslator(filename: string; listArray: tAlist; idProc: integer; fProc: tCompareProc; resetState: boolean);
procedure XMLImportTag(filename: string; l: tStrings);
function findEdidMatchExXML(edidlist, dlist: tlist; fProc: tCompareProc; proc: TListSortCompare; resetState, bVmad: boolean): integer;

implementation

procedure prepareSSTXML(listArray: tAlist);
var
  i, j: integer;
  sk: tskystr;
begin
  for j := 0 to 2 do
    for i := 0 to listArray[j].count - 1 do
    begin
      sk := listArray[j].items[i];
      if sk.isEmpty then
        continue;
      if sk.lockedStatus then
        continue;
      // remove delete
      if not(sk.sinternalparams * [isDeleted, lowwarning, warning, bigwarning, nTrans] = []) then
        continue;
      // pass on unsecure strings
      if sk.sparams * [translated, lockedTrans, incompleteTrans, validated] = [] then
        continue;
      // cleanUp LockedTransStatus
      if lockedTrans in sk.sparams then
        sk.sparams := sk.sparams - [translated, incompleteTrans, validated];
      LocalVocabBaseList.add(sk);
    end;
end;

function getNodeText(skNode: IXMLNode; Node: string): string;
begin
  if assigned(skNode.SelectSingleNode(Node)) then
    Result := skNode.SelectSingleNode(Node).text
  else
    Result := '';
end;

procedure XMLExportbase(filename, addon_Name: string; listArray: tAlist; fProc: tCompareProc; bExportFuz: boolean);
var
  i, j: integer;
  sk: tskystr;
  tmpchild, paramNode, contentNode, strNode, fuzFileNode, fuzNode: IXMLElement;
  XMLDoc: IXMLDocument;
  fuzList: tStringList;
  r: rDialInfo;
begin
  fuzList := tStringList.create;
  prepareSSTXML(listArray);
  ProgressBar.Max := LocalVocabBaseList.count;
  ProgressBar.Max := ProgressBar.Max + (ProgressBar.Max div 10);
  pBar := 0;
  try
    try
      XMLDoc := CreateXMLDoc;
      XMLDoc.AppendChild(XMLDoc.CreateProcessingInstruction('xml', 'version="1.0" encoding="UTF-8" standalone="yes"'));
      XMLDoc.DocumentElement := XMLDoc.CreateElement('SSTXMLRessources');
      paramNode := XMLDoc.CreateElement('Params');
      XMLDoc.DocumentElement.AppendChild(paramNode);

      tmpchild := XMLDoc.CreateElement('Addon');
      tmpchild.text := addon_Name;
      paramNode.AppendChild(tmpchild);
      tmpchild := XMLDoc.CreateElement('Source');
      tmpchild.text := Sourcelanguage;
      paramNode.AppendChild(tmpchild);
      tmpchild := XMLDoc.CreateElement('Dest');
      tmpchild.text := Destlanguage;
      paramNode.AppendChild(tmpchild);
      tmpchild := XMLDoc.CreateElement('Version');
      tmpchild.text := '2';
      paramNode.AppendChild(tmpchild);
      contentNode := XMLDoc.CreateElement('Content');
      XMLDoc.DocumentElement.AppendChild(contentNode);

      for i := 0 to LocalVocabBaseList.count - 1 do
      begin
        sk := LocalVocabBaseList[i];
        if not fProc(sk) then
          continue;
        strNode := XMLDoc.CreateElement('String');
        contentNode.AppendChild(strNode);
        // strnode.setAttributes:=('ver', 'value');
        strNode.SetAttribute('List', inttostr(sk.listIndex));

        // if string then add string ID
        if CurrentTESVmode in [sTESVTsstEdit, sTESVEspStrings, sTESVStrings] then
          strNode.SetAttribute('sID', inttohex(sk.esp.strId, 6));

        if incompleteTrans in sk.sparams then
          strNode.SetAttribute('Partial', '1')
        else if lockedTrans in sk.sparams then
          strNode.SetAttribute('Partial', '2');
        // AddEdid
        if CurrentTESVmode in [sTESVTsstEdit, sTESVEsp, sTESVEspStrings] then
        begin
          tmpchild := XMLDoc.CreateElement('EDID');
          tmpchild.text := sk.getEdidNameExport;
          strNode.AppendChild(tmpchild);
          tmpchild := XMLDoc.CreateElement('REC');
          if sk.esp.IndexMax > 0 then
            tmpchild.SetAttribute('id', inttostr(sk.esp.Index));
          if sk.esp.IndexMax > 0 then
            tmpchild.SetAttribute('idMax', inttostr(sk.esp.IndexMax));
          tmpchild.text := format('%.4s:%.4s', [sk.esp.rname, sk.esp.fname]);
          strNode.AppendChild(tmpchild);
        end;
        tmpchild := XMLDoc.CreateElement('Source');
        tmpchild.text := sk.s;
        strNode.AppendChild(tmpchild);
        tmpchild := XMLDoc.CreateElement('Dest');
        tmpchild.text := sk.strans;
        strNode.AppendChild(tmpchild);

        // fuz info
        if bExportFuz and sk.isDialog then
        begin
          fuzList.clear;
          r := sk.GetResponseInfo;
          if (r.rId > 0) and (fuz.List.count > 0) then
            fuz.getFromRec(r, fuzList);
          if fuzList.count > 0 then
          begin
            fuzNode := XMLDoc.CreateElement('FuzInfo');
            strNode.AppendChild(fuzNode);
            fuzFileNode := XMLDoc.CreateElement('responseId');
            fuzFileNode.text := inttostr(r.rId);
            fuzNode.AppendChild(fuzFileNode);
            for j := 0 to pred(fuzList.count) do
            begin
              fuzFileNode := XMLDoc.CreateElement('Fuz');
              fuzFileNode.text := fuzList[j];
              fuzNode.AppendChild(fuzFileNode);
            end;
          end;
          Finalize(r);
        end;
        UpdatePBar(1000);
      end;
      XMLDoc.Save(filename, ofIndent);
    except
      On E: Exception do
        dofeedback(getres('XML_ERROR'), true);
    end;
  finally
    XMLDoc := nil;
    LocalVocabBaseList.clear;
    fuzList.free;
  end
end;

function getXmlEdidHash(edid: string): cardinal;
var
  formId: cardinal;
begin
  // check if it's fake edid
  if (length(edid) = 10) and (edid[1] = '[') and (edid[10] = ']') then
  begin
    formId := strtointdef('$' + copy(edid, 2, 8), 0);
    if bApplySstOldMasterFix then
      Result := stringHash(format('[%.8x]', [sanitizeFormID(formId)]))
    else
      Result := stringHash(format('[%.8x]', [formId]))
  end
  else
    Result := stringHash(edid);
end;

procedure XMLImportbase(filename: string; listArray: tAlist; idProc: integer; fProc, fprocVmad, fProcVmadtrans: tCompareProc; resetState: boolean);
var
  sk: tskystr;
  j, l, k: integer;
  s1, s2, tmpEdid, tmpRec, tmpVersion: string;
  sP: sStrParams;
  XMLDoc: IXMLDocument;
  NodeList: IXMLNodeList;
  nl, np, ni, ns, skNode, tmpRecNode: IXMLNode;
  Index: integer;
  tmpAnsi: AnsiString;
  bNewXML, bRecInXML: boolean;
  data: rEspPointerLite;
  proc: TListSortCompare;

  // f: TwbReadOnlyCachedFileStream;
begin
  proc := nil;
  bNewXML := false;
  bRecInXML := false;
  updateStatus(getres('LoadingXml'));
  try
    try
      // f:= TwbReadOnlyCachedFileStream.Create(filename);
      XMLDoc := CreateXMLDoc;

      // Delphi Berlin. Seems obsolete in Alexandria
      // in OmniXML\OtextReadWrite.pas -> GetEncodingFromStream function  need to comment the line
      // [if Assigned(xEncoding) then Result := xEncoding;  ]
      // because it overrides utf8 default. (todo: investigate if it's a bug in omni xml, or if there is a better way to force UTF8)

      XMLDoc.Load(filename);

      nl := XMLDoc.SelectSingleNode('SSTXMLRessources');
      if not assigned(nl) then
      begin
        dofeedback(getres('XML_WRONG_FORMAT'), true);
        exit;
      end;

      NodeList := XMLDoc.DocumentElement.SelectNodes('Params');
      if NodeList.length > 0 then
      begin
        skNode := NodeList.nextNode;
        tmpVersion := getNodeText(skNode, 'Version');
        if tmpVersion = '2' then
          bNewXML := true;
      end;

      NodeList := XMLDoc.DocumentElement.SelectNodes('Content/String');
      ProgressBar.Max := NodeList.length;
      pBar := 0;
      updateStatus(getres('ReadingXml'));
      if NodeList.length > 0 then
      begin
        skNode := NodeList.nextNode;
        while assigned(skNode) do
        begin

          // init-----------------------------------------------
          fillChar(data, sizeOf(data), 0);
          s1 := '';
          s2 := '';
          nl := skNode.Attributes.GetNamedItem('List');
          np := skNode.Attributes.GetNamedItem('Partial');
          ns := skNode.Attributes.GetNamedItem('sID');
          l := -1;

          if assigned(nl) then
            l := strtointdef(nl.text, -1);
          if assigned(np) and (np.text = '1') then
            sP := [incompleteTrans]
          else if assigned(np) and (np.text = '2') then
            sP := [lockedTrans]
          else
            sP := [translated];

          tmpEdid := getNodeText(skNode, 'EDID');
          data.rhash := getXmlEdidHash(tmpEdid);
          tmpRec := getNodeText(skNode, 'REC');

          if (tmpEdid <> '') and (tmpRec <> '') then
            bRecInXML := true;

          // index
          tmpRecNode := skNode.SelectSingleNode('REC');
          ni := nil;
          if assigned(tmpRecNode) then
            ni := tmpRecNode.Attributes.GetNamedItem('id');

          if assigned(ni) then
          begin
            data.Index := strtointdef(ni.text, 0);
            if data.Index > 0 then
              bNewXML := true;
          end;
          // indexMax
          tmpRecNode := skNode.SelectSingleNode('REC');
          ni := nil;
          if assigned(tmpRecNode) then
            ni := tmpRecNode.Attributes.GetNamedItem('idMax');
          if assigned(ni) then
            data.IndexMax := strtointdef(ni.text, 0);

          // sID
          if assigned(ns) then
            data.strId := strtointdef(ns.text, 0);
          // ----------------

          if length(tmpRec) = 9 then
          begin
            tmpAnsi := AnsiString(tmpRec);
            for k := 0 to 3 do
            begin
              data.rname[k] := ansichar(tmpAnsi[k + 1]);
              data.fname[k] := ansichar(tmpAnsi[k + 6]);
            end;
          end;

          if CurrentTESVmode = sTESVPex then
          begin
            s1 := AdjustLineBreaks(getNodeText(skNode, 'Source'), tlbsLF);
            s2 := AdjustLineBreaks(getNodeText(skNode, 'Dest'), tlbsLF);
          end
          else
          begin
            s1 := AdjustLineBreaks(getNodeText(skNode, 'Source'));
            s2 := AdjustLineBreaks(getNodeText(skNode, 'Dest'));
          end;

          if inrange(l, 0, 2) then
          begin
            sk := tskystr.init(0, 0, s1, s2, l, 0, sP, [], nil, true);
            if not addPointertoSortedList(LocalVocabBaseList, compareallHashesAndSources, sk, index) then
            begin
              sk.free;
              sk := LocalVocabBaseList[index];
            end;
            // LocalVocabBaseList.add(sk);
            if (tmpEdid <> '') and (data.fname <> header0000) then
            begin
              LocalVocabEdidList.add(tEspStrRef.init(sk, data, l, sP, 0, false));
              sk.addRefRec(data.rname, data.fname);
            end;
          end;

          UpdatePBar(1000);
          skNode := NodeList.nextNode;
        end;

        LocalVocabBaseList.sort(compareallHashesAndSources);
        // pbar
        ProgressBar.Max := getTotalVocabCount(listArray);
        pBar := 0;

        if bRecInXML then
          case idProc of
            0:
              if bNewXML then
                proc := compareEspStr_Edid;
            1:
              if bNewXML then
                proc := compareEspStr_Strict
              else
                proc := compareEspStr_Relax;
            2: proc := compareEspStr_Relax;
          end;
        if CurrentTESVmode = sTESVStrings then
          proc := compareEspStrRefStringId
        else if not TESVTmodEspLoaded then
          proc := nil;

        if (idProc in [0 .. 1]) and (not bNewXML or not bRecInXML) then
        begin
          dofeedback(getres('XML_ERROR_CONTENT2'), false);
          proc := nil;
        end;

        if assigned(proc) then
          LocalVocabEdidList.sort(proc);
        // -------------------------------------------
        for j := 0 to 2 do
        begin
          if assigned(proc) then
            findEdidMatchExXML(LocalVocabEdidList, listArray[j], fProc, proc, resetState, false)
          else
            findStrMatchEx(LocalVocabBaseList, listArray[j], fProc, [validated], resetState, true, true, false, false);
        end;

        // VMAD
        if bApplyVMAD then
        begin
          if assigned(proc) then
          begin
            if bNewXML then
            begin
              LocalVocabEdidList.sort(compareEspStr_Strict);
              findEdidMatchExXML(LocalVocabEdidList, listArray[0], fprocVmad, compareEspStr_Strict, false, true);
            end;
          end
          else
          begin
            if assigned(fProcVmadtrans) then
              findStrMatchEx(LocalVocabBaseList, listArray[0], fProcVmadtrans, [validated], resetState, true, true, true, true);
          end;
        end;

        setTreeSortAndSort(3);
      end;

    except
      On E: Exception do
        dofeedback(getres('XML_ERROR'), true);
    end;
  finally
    updateStatus(getres('ReleasingXml'));
    XMLDoc := nil;
    clearSkList(LocalVocabBaseList, true);
    clearInternalRefList(LocalVocabEdidList);
  end
end;

procedure XMLImportbase_EspTranslator(filename: string; listArray: tAlist; idProc: integer; fProc: tCompareProc; resetState: boolean);
var
  sk: tskystr;
  i, j, l, k: integer;
  s1, s2: string;
  tmpEdid: string;
  sP: sStrParams;
  XMLDoc: IXMLDocument;
  NodeList: IXMLNodeList;
  skNode: IXMLNode;
  Index, nStatus, tmpIndex: integer;
  tmpAnsi1, tmpAnsi2: AnsiString;
  data: rEspPointerLite;
  proc: TListSortCompare;
  bSkipped: boolean;
const
  typexmlDB: array [0 .. 1] of string = ('BDD', 'ESP');
begin
  updateStatus(getres('LoadingXml'));
  try
    try
      XMLDoc := CreateXMLDoc;
      // Delphi Berlin. Seems obsolete in Alexandria
      // in OmniXML\OtextReadWrite.pas -> GetEncodingFromStream function  need to comment the line
      // [if Assigned(xEncoding) then Result := xEncoding;  ]
      // because it overrides utf8 default. (todo: investigate if it's a bug in omni xml, or if there is a better way to force UTF8)
      XMLDoc.Load(filename);

      for i := 0 to 1 do
      begin
        NodeList := XMLDoc.DocumentElement.SelectNodes(typexmlDB[i]);

        if NodeList.length > 0 then
        begin
          ProgressBar.Max := NodeList.length;
          pBar := 0;
          updateStatus(getres('ReadingXml'));
          skNode := NodeList.nextNode;
          while assigned(skNode) do
          begin

            // init-----------------------------------------------
            fillChar(data, sizeOf(data), 0);
            s1 := '';
            s2 := '';
            l := 0;
            bSkipped := false;
            tmpEdid := getNodeText(skNode, 'EDID');
            // formID
            data.formId := cardinal(strtointdef('$' + getNodeText(skNode, 'ID'), 0));

            data.rhash := stringHash(tmpEdid);
            tmpAnsi1 := AnsiString(getNodeText(skNode, 'GRUP'));
            tmpAnsi2 := AnsiString(getNodeText(skNode, 'CHAMP'));
            if (tmpAnsi1 <> '') and (tmpAnsi2 <> '') then
            begin
              for k := 0 to 3 do
              begin
                data.rname[k] := ansichar(tmpAnsi1[k + 1]);
                data.fname[k] := ansichar(tmpAnsi2[k + 1]);
              end;
            end;

            if i = 0 then // we are in BDD
              sP := [translated]
            else
            begin
              nStatus := strtointdef(getNodeText(skNode, 'STATUS'), -$FFFF);
              case nStatus of
                - 1: sP := [lockedTrans];
                0: bSkipped := true;
                1: sP := [translated];
                2 .. 97: sP := [incompleteTrans];
                98 .. 99: sP := [translated];
              end;
            end;

            // index
            tmpIndex := strtointdef(getNodeText(skNode, 'INDEX'), 0) - 1;
            if tmpIndex < 0 then
              tmpIndex := 0;
            data.Index := tmpIndex;

            // ----------------

            if CurrentTESVmode = sTESVPex then
            begin
              s1 := AdjustLineBreaks(getNodeText(skNode, 'ORIGINAL'), tlbsLF);
              s2 := AdjustLineBreaks(getNodeText(skNode, 'TRADUIT'), tlbsLF);
            end
            else
            begin
              s1 := AdjustLineBreaks(getNodeText(skNode, 'ORIGINAL'));
              s2 := AdjustLineBreaks(getNodeText(skNode, 'TRADUIT'));
            end;

            if inrange(l, 0, 2) and not bSkipped then
            begin
              sk := tskystr.init(0, 0, s1, s2, l, 0, sP, [], nil, false);
              if not addPointertoSortedList(LocalVocabBaseList, compareallHashesAndSources, sk, index) then
              begin
                sk.free;
                sk := LocalVocabBaseList[index];
              end;
              // LocalVocabBaseList.add(sk);
              if (data.rname <> header0000) and (data.fname <> header0000) then
              begin
                LocalVocabEdidList.add(tEspStrRef.init(sk, data, l, sP, 0, false));
                sk.addRefRec(data.rname, data.fname);
              end;
            end;

            UpdatePBar(1000);
            skNode := NodeList.nextNode;
          end;
        end;
      end;

      if LocalVocabBaseList.count > 0 then
      begin
        // ntrans backward
        LocalVocabBaseList.sort(compareallHashesAndSources);
        // pbar
        ProgressBar.Max := getTotalVocabCount(listArray);
        pBar := 0;

        proc := nil;
        case idProc of
          0: proc := compareEspStr_V4EdidEspTranslator;
          1 .. 2: proc := compareEspStr_V4Relax;
        end;

        if not TESVTmodEspLoaded then
          proc := nil;
        if assigned(proc) then
          LocalVocabEdidList.sort(proc);
        // -------------------------------------------
        for j := 0 to 2 do
        begin
          if assigned(proc) then
            findEdidMatchExXML(LocalVocabEdidList, listArray[j], fProc, proc, resetState, false)
          else
            findStrMatchEx(LocalVocabBaseList, listArray[j], fProc, [validated], resetState, true, true, false, false);
        end;
        setTreeSortAndSort(3);
      end;
    except
      On E: Exception do
        dofeedback(getres('XML_ERROR'), true);
    end;
  finally
    updateStatus(getres('ReleasingXml'));
    XMLDoc := nil;
    clearSkList(LocalVocabBaseList, true);
    clearInternalRefList(LocalVocabEdidList);
  end
end;

function findEdidMatchExXML(edidlist, dlist: tlist; fProc: tCompareProc; proc: TListSortCompare; resetState, bVmad: boolean): integer;
var
  i: integer;
  sk1, sk2: tskystr;
  searchP, foundP: tEspStrRef;
  newindex: integer;
  OnlyEdid: boolean;
begin
  OnlyEdid := (@proc = @compareEspStr_Edid) or (@proc = @compareEspStr_V4Edid);
  Result := 0;

  searchP := tEspStrRef.init(nil);

  // --------------------------
  for i := 0 to dlist.count - 1 do
  begin
    UpdatePBar(pBarFrequencies);
    sk1 := dlist.items[i];

    if pexNoTrans in sk1.sinternalparams then
      continue;
    if not fProc(sk1) then
      continue;
    if resetState or (nTrans in (sk1.sinternalparams)) then
      sk1.resetTrans(bVmad);
    // ------------------
    CopyMemory(@searchP.data, @sk1.esp, sizeOf(rEspPointerLite));
    searchP.sk := sk1;

    if FastListSearch(edidlist, proc, searchP, newindex, true) then
    begin
      foundP := edidlist[newindex];
      sk2 := foundP.sk;
      sk1.sinternalparams := sk1.sinternalparams - [nTrans, lowwarning, warning, bigwarning];
      sk1.strans := sk2.strans;
      if incompleteTrans in sk2.sparams then
        sk1.resetStatus([incompleteTrans], bVmad)
      else if lockedTrans in sk2.sparams then
        sk1.resetStatus([lockedTrans], bVmad)
      else
        sk1.resetStatus([validated], bVmad);

      if OnlyEdid and TESVTmodEspLoaded then
      begin
        if (searchP.data.IndexMax > 0) or (foundP.data.IndexMax > 0) then
        begin
          sk1.resetStatus([incompleteTrans]);
          if (searchP.data.IndexMax <> foundP.data.IndexMax) then
            include(sk1.sinternalparams, bigwarning)
          else
            include(sk1.sinternalparams, warning);
        end;
      end;
    end
    else if sk1.isEmpty then
      sk1.assignSame;
  end;
  searchP.free;
end;

procedure XMLImportTag(filename: string; l: tStrings);
var
  XMLDoc: IXMLDocument;
  NodeList: IXMLNodeList;
  nl, skNode: IXMLNode;
  h: string;
begin
  updateStatus(getres('LoadingXml'));
  l.clear;
  try
    XMLDoc := CreateXMLDoc;
    XMLDoc.Load(filename);
    NodeList := XMLDoc.DocumentElement.SelectNodes('tag');
    ProgressBar.Max := NodeList.length;
    pBar := 0;
    updateStatus(getres('ReadingXml'));
    if NodeList.length > 0 then
    begin
      skNode := NodeList.nextNode;
      while assigned(skNode) do
      begin
        nl := skNode.Attributes.GetNamedItem('keyword');
        h := nl.text;
        if h <> '' then
          l.add('[' + h + ']');
        UpdatePBar(1);
        skNode := NodeList.nextNode;
      end;
    end;
  finally
    updateStatus('');
    XMLDoc := nil;
  end;
end;

end.
