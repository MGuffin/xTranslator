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
unit TESVT_StringsStatus;

interface

uses Windows, Messages, SysUtils, Classes, Controls, Forms, Graphics, math, Dialogs, VirtualTrees, TESVT_Colab, StdCtrls, ButtonGroup,
  TESVT_Undo, TESVT_sharedVTProc, TESVT_typedef, TESVT_espDefinition, TESVT_MainLoader, TESVT_Const, Clipbrd, TESVT_Utils, TESVT_ToolHeader,
  regularexpressions, regularexpressionscore, RegularExpressionsConsts, TESVT_RegexUtils, TESVT_XMLFunc, TESVT_Ressources;

procedure updateStringStatus(loader: tTranslatorLoader; VT: TVirtualStringTree; v1: sStrParams; fForceLD: single = 0);
procedure cancelStringStatus(loader: tTranslatorLoader; VT: TVirtualStringTree);
procedure FixValue(loader: tTranslatorLoader; VT: TVirtualStringTree; Const id: integer);
procedure FixValueEx(loader: tTranslatorLoader; Const id: integer; sk: tskystr; doUndo: boolean = true);
procedure SetColabID(loader: tTranslatorLoader; VT: TVirtualStringTree; tag: integer);
procedure setColabOnDialList(loader: tTranslatorLoader; tag: integer; l: tlistbox);

procedure applytoolBox(loader: tTranslatorLoader; VT: TVirtualStringTree; toolID: integer);
procedure setStr_UpperCase(sk: tskystr);
procedure setStr_LowerCase(sk: tskystr);
procedure setStr_FirstUpperCase(sk: tskystr);
procedure setStr_FirstEachWordUpperCase(sk: tskystr);
procedure setStr_Trim(sk: tskystr);
procedure setStr_addHeader(r: TPerlRegEx; sk: tskystr; sHeader: string; bUseSource: boolean = false);
function addHeaderToString(loader: tTranslatorLoader): integer;

procedure CopyStringFocus(VT: TBaseVirtualTree);
function getFocusedString(VT: TBaseVirtualTree): tskystr;
procedure PasteStringSelection(loader: tTranslatorLoader; VT: TBaseVirtualTree);

procedure tagNoTranslationStrings(loader: tTranslatorLoader; bSoftLock: boolean);

var
  lWordExceptionList: tstringList;

implementation

// --------regex utils

function getFocusedString(VT: TBaseVirtualTree): tskystr;
var
  Data: ptreedata;
  Node: PVirtualNode;
begin
  result := nil;
  if assigned(VT) then
  begin
    Node := VT.focusedNode;
    if assigned(Node) then
    begin
      Data := VT.GetNodeData(GetSharedIdNode(VT, Node));
      result := Data.BasicND.s;
    end
  end;
end;

procedure CopyStringFocus(VT: TBaseVirtualTree);
var
  sk: tskystr;
begin
  sk := getFocusedString(VT);
  if assigned(sk) then
    Clipboard.AsText := sk.strans;
end;

procedure PasteStringSelection(loader: tTranslatorLoader; VT: TBaseVirtualTree);
var
  Node: PVirtualNode;
  sk: tskystr;
begin
  if (not assigned(loader)) or (not assigned(VT)) then
    exit;
  timeUndo;

  Node := VT.GetFirst;
  while assigned(Node) do
  begin
    if VT.IsVisible[Node] and VT.Selected[Node] then
    begin
      sk := ptreedata(VT.GetNodeData(Node)).BasicND.s;
      if not sk.lockedStatus then
      begin
        loader.addUndo(sk, tTimeUndo, false);
        sk.strans := Clipboard.AsText;
        sk.resetStatus([incompleteTrans]);
        setuserCacheUpdated(loader, cacheLoaded);
      end;
    end;
    Node := VT.GetNext(Node);
  end;
  repaintTrees;
end;

procedure updateStringStatus(loader: tTranslatorLoader; VT: TVirtualStringTree; v1: sStrParams; fForceLD: single = 0);
var
  Node: PVirtualNode;
  sk: tskystr;
begin
  if (not assigned(loader)) or (not assigned(VT)) then
    exit;
  timeUndo;

  Node := VT.GetFirst;
  while assigned(Node) do
  begin
    if VT.IsVisible[Node] and VT.Selected[Node] then
    begin
      sk := ptreedata(VT.GetNodeData(Node)).BasicND.s;
      loader.addUndo(sk, tTimeUndo, false);
      if sk.resetStatus(v1, true, fForceLD) then
        setuserCacheUpdated(loader, cacheLoaded);
    end;
    Node := VT.GetNext(Node);
  end;
  repaintTrees;
end;

procedure cancelStringStatus(loader: tTranslatorLoader; VT: TVirtualStringTree);
var
  Node: PVirtualNode;
  sk: tskystr;
begin
  if not assigned(loader) or (not assigned(VT)) then
    exit;
  timeUndo;
  Node := VT.GetFirst;
  while assigned(Node) do
  begin
    if VT.IsVisible[Node] and VT.Selected[Node] then
    begin
      sk := ptreedata(VT.GetNodeData(Node)).BasicND.s;
      loader.addUndo(sk, tTimeUndo, false);
      if sk.resetTrans(true) then
        setuserCacheUpdated(loader, cacheLoaded);
    end;
    Node := VT.GetNext(Node);
  end;
  repaintTrees;
end;

procedure FixValueEx(loader: tTranslatorLoader; Const id: integer; sk: tskystr; doUndo: boolean = true);
var
  nList: TArray<string>;
  sOut: string;
begin
  nList := regExUtil.regExExtractValues(id, sk.s);
  if length(nList) = 0 then
    exit;
  sOut := sk.strans;
  if regExUtil.regExReplaceValues(id, sOut, nList) then
  begin
    if sOut <> sk.strans then
    begin
      if doUndo then
        loader.addUndo(sk, tTimeUndo, false);
      sk.strans := sOut;
      sk.resetStatus([incompleteTrans]);
      setuserCacheUpdated(loader, cacheLoaded);
    end;
  end;
  setlength(nList, 0);
end;

procedure FixValue(loader: tTranslatorLoader; VT: TVirtualStringTree; Const id: integer);
var
  Node: PVirtualNode;
  sk: tskystr;
begin
  if not assigned(loader) or (not assigned(VT)) then
    exit;

  timeUndo;
  Node := VT.GetFirst;
  while assigned(Node) do
  begin
    if VT.IsVisible[Node] and VT.Selected[Node] then
    begin
      sk := ptreedata(VT.GetNodeData(Node)).BasicND.s;
      if not sk.lockedStatus then
        FixValueEx(loader, id, sk);
    end;
    Node := VT.GetNext(Node);
  end;
  repaintTrees;
end;

// --------Collab

function getColabID(loader: tTranslatorLoader): integer;
var
  i: integer;
  ti: TGrpButtonItem;
begin
  loader.isColab;
  result := -1;
  FormColabId := TFormColabId.create(nil);
  FormColabId.loader := loader;
  FormColabId.colabId := -1;

  FormColabId.ButtonGroup1.ButtonWidth := FormColabId.ButtonGroup1.width div 8;

  for i := 1 to MAXCOLAB_ID do
  begin
    ti := FormColabId.ButtonGroup1.Items.add;
    ti.caption := inttohex(i, 2);

    if loader.aColab[i] > 0 then
      ti.ImageIndex := 70
    else
      ti.ImageIndex := 67;
  end;

  FormColabId.showmodal;
  if FormColabId.ModalResult = mrOK then
    result := FormColabId.colabId;
  FormColabId.Free;
end;

procedure SetColabID(loader: tTranslatorLoader; VT: TVirtualStringTree; tag: integer);
var
  Node: PVirtualNode;
  sk: tskystr;
  colabId: integer;
begin
  if not assigned(loader) or (not assigned(VT)) then
    exit;

  if tag = 1 then
    colabId := 0
  else
    colabId := getColabID(loader);
  if colabId = -1 then
    exit;

  timeUndo;
  Node := VT.GetFirst;
  while assigned(Node) do
  begin
    if VT.IsVisible[Node] and VT.Selected[Node] then
    begin
      sk := ptreedata(VT.GetNodeData(Node)).BasicND.s;
      if not(sk.lockedStatus) then
        sk.colabId := colabId;
    end;
    Node := VT.GetNext(Node);
  end;
  ShowColabCol(loader.isColab);
  repaintTrees;
end;

procedure setTagOnDialNode(loader: tTranslatorLoader; r: trecord; colabId: integer);
var
  f: tfield;
  i: integer;
  sk: tskystr;
begin
  for i := 0 to r.fList.count - 1 do
  begin
    f := r.fList[i];
    if (isString in f.params) then
    begin
      sk := tskystr(f.sk);
      if not(sk.lockedStatus(false)) then
        sk.colabId := colabId;
    end;
  end;
end;

procedure setColabOnDialList(loader: tTranslatorLoader; tag: integer; l: tlistbox);
var
  i, colabId: integer;

  Node: PVirtualNode;
  DataEsp: pespdata;
  r: trecord;
begin
  if not assigned(loader) or (loader.loaderType <> sLoaderTypeEsp) then
    exit;
  if tag = 1 then
    colabId := 0
  else
    colabId := getColabID(loader);
  if colabId = -1 then
    exit;

  For i := 0 to pred(l.count) do
  begin
    if l.Selected[i] then
    begin
      r := trecord(l.Items.objects[i]);
      if assigned(r) and assigned(r.esprec) then
      begin
        setTagOnDialNode(loader, r, colabId);
        Node := loader.espLoader.VT.GetNext(r.esprec);
        while assigned(Node) do
        begin
          DataEsp := loader.espLoader.VT.GetNodeData(Node);
          if (DataEsp.BasicND.P.sType = sRecord) and (DataEsp.BasicND.P.header.name <> headerINFO) then
            break;
          if (DataEsp.BasicND.P.sType = sRecord) and (DataEsp.BasicND.P.header.name = headerINFO) then
            setTagOnDialNode(loader, trecord(DataEsp.BasicND.P), colabId);

          Node := loader.espLoader.VT.GetNext(Node);
        end;
      end;
    end;
  end;
  ShowColabCol(loader.isColab);
  repaintTrees;
end;

// toolbox

procedure applytoolBox(loader: tTranslatorLoader; VT: TVirtualStringTree; toolID: integer);
var
  Node: PVirtualNode;
  sk: tskystr;
  iHeader: integer;
  sHeader: string;
  r: TPerlRegEx;
begin
  if not assigned(loader) or (not assigned(VT)) then
    exit;
  r := nil;
  // indirect
  if toolID = 5 then
  begin
    // header
    iHeader := addHeaderToString(loader);
    if iHeader = -1 then
      exit
    else if iHeader = 0 then
      sHeader := ''
    else
      sHeader := lDEFUIHeader[iHeader - 1];
    // init regex
    r := TPerlRegEx.create;
    r.RegEx := sDEFUICleanHeader;
    r.study;
  end;

  // direct
  timeUndo;
  Node := VT.GetFirst;
  while assigned(Node) do
  begin
    if VT.IsVisible[Node] and VT.Selected[Node] then
    begin
      sk := ptreedata(VT.GetNodeData(Node)).BasicND.s;
      if not(sk.lockedStatus) then
      begin
        loader.addUndo(sk, tTimeUndo, false);
        setuserCacheUpdated(loader, cacheLoaded);
        case toolID of
          0: setStr_UpperCase(sk);
          1: setStr_LowerCase(sk);
          2: setStr_FirstUpperCase(sk);
          3: setStr_FirstEachWordUpperCase(sk);
          4: FixValueEx(loader, 2, sk);
          5: setStr_addHeader(r, sk, sHeader);
          6: setStr_Trim(sk);
        end;
      end;
    end;
    Node := VT.GetNext(Node);
  end;
  repaintTrees;
  if assigned(r) then
    freeandnil(r);
end;

function setStr_WordExcept(const s: string; var sOut: string): boolean;
var
  i: integer;
begin
  for i := 0 to pred(lWordExceptionList.count) do
  begin
    if ansilowercase(s) = ansilowercase(lWordExceptionList[i]) then
    begin
      sOut := lWordExceptionList[i];
      exit(true);
    end;
  end;
  result := false;
end;

function setStr_FirstUpperCaseEx(s: string; firstWord: boolean): string;
var
  l: integer;
begin
  if not firstWord and setStr_WordExcept(s, result) then
    exit;
  l := length(s);
  if l = 1 then
    result := ansiupperCase(copy(s, 1, 1))
  else if l > 1 then
    result := ansiupperCase(copy(s, 1, 1)) + ansilowercase(copy(s, 2, l));
end;

function setStr_FilteredLowerCase(s: string): string;
begin
  if setStr_WordExcept(s, result) then
    exit;
  result := ansilowercase(s);
end;

function setStr_Splitter(s: string; mode: integer): string;
var
  word: string;
  startPos, endPos, WordCount: integer;
  bOpenTag: boolean;
begin
  result := '';

  // ----------
  startPos := 1;
  WordCount := 0;
  bOpenTag := false;
  while startPos <= length(s) do
  begin
    // --skip all stuff between <  >
    while (startPos <= length(s)) and isChar_WordDelimiterextended(s[startPos]) do
    begin
      if (s[startPos] = '<') and not bOpenTag then
        bOpenTag := true;
      if (s[startPos] = '>') and bOpenTag then
        bOpenTag := false;
      result := result + s[startPos];
      inc(startPos);
    end;
    // get word
    if startPos <= length(s) then
    begin
      endPos := startPos + 1;
      while (endPos <= length(s)) and (not isChar_WordDelimiterextended(s[endPos])) do
        inc(endPos);

      word := copy(s, startPos, endPos - startPos);
      inc(WordCount);

      if bOpenTag then
        result := result + word
      else
      begin
        case mode of
          0: result := result + ansiupperCase(word);
          1: result := result + ansilowercase(word);
          2:
            begin
              if WordCount = 1 then
                result := result + setStr_FirstUpperCaseEx(word, WordCount = 1)
              else
                result := result + setStr_FilteredLowerCase(word);
            end;
          3: result := result + setStr_FirstUpperCaseEx(word, WordCount = 1);
        end;
      end;
      startPos := endPos; // + 1;
    end;
  end;
end;

procedure setStr_addHeader(r: TPerlRegEx; sk: tskystr; sHeader: string; bUseSource: boolean = false);
var
  s, olds: string;
begin
  olds := sk.strans;
  if bUseSource then
    s := sk.s
  else
    s := sk.strans;
  r.subject := s;
  if r.match and (r.GroupCount > 0) then
    s := r.Groups[1];

  if sHeader = '' then
    sk.strans := s
  else
    sk.strans := sHeader + ' ' + s;
  if sk.strans <> olds then
    sk.resetStatus([incompleteTrans]);
end;

procedure setStr_UpperCase(sk: tskystr);
var
  olds: string;
begin
  olds := sk.strans;
  sk.strans := setStr_Splitter(sk.strans, 0);
  if sk.strans <> olds then
    sk.resetStatus([incompleteTrans]);
end;

procedure setStr_Trim(sk: tskystr);
var
  olds: string;
begin
  olds := sk.strans;
  sk.strans := trim(sk.strans);
  if sk.strans <> olds then
    sk.resetStatus([incompleteTrans]);
end;

procedure setStr_LowerCase(sk: tskystr);
var
  olds: string;
begin
  olds := sk.strans;
  sk.strans := setStr_Splitter(sk.strans, 1);
  if sk.strans <> olds then
    sk.resetStatus([incompleteTrans]);
end;

procedure setStr_FirstUpperCase(sk: tskystr);
var
  olds: string;
begin
  olds := sk.strans;
  sk.strans := setStr_Splitter(sk.strans, 2);
  if sk.strans <> olds then
    sk.resetStatus([incompleteTrans]);
end;

procedure setStr_FirstEachWordUpperCase(sk: tskystr);
var
  olds: string;
begin
  olds := sk.strans;
  sk.strans := setStr_Splitter(sk.strans, 3);
  if sk.strans <> olds then
    sk.resetStatus([incompleteTrans]);
end;

// --AddHeader
function addHeaderToString(loader: tTranslatorLoader): integer;
begin
  Form19 := TForm19.create(nil);
  Form19.showmodal;
  if Form19.ModalResult = mrOK then
    result := Form19.HeaderOut
  else
    result := -1;
  Form19.Free;
end;


// ===================AutoNoTrans

function searchRegEx(RegEx: TPerlRegEx; const s: string): boolean;
begin
  try
    RegEx.subject := s;
    result := RegEx.match;
  except
    on E: Exception do
      result := false;
  end;
end;

procedure lockSk(loader: tTranslatorLoader; var sk: tskystr; const bSoftLock: boolean);
begin
  loader.addUndo(sk, tTimeUndo, false);
  if bSoftLock then
    include(sk.sInternalparams, OnTranslationSoftLock);
  sk.resetStatus([lockedTrans]);
end;

procedure tagNoTransationRegEx(loader: tTranslatorLoader; pattern: string; bOut, bSoftLock: boolean);
var
  RegEx: TPerlRegEx;
  i, j: integer;
  sk: tskystr;
begin
  RegEx := TPerlRegEx.create;
  try
    try
      RegEx.RegEx := pattern;

      for j := 0 to 2 do
        for i := 0 to pred(loader.listarray[j].count) do
        begin
          sk := loader.listarray[j][i];
          if bSoftLock and not(OnTranslationApiArray_PreSelection in sk.sInternalparams) then
            continue;

          if not sk.isVisibleVmad(MainLoader.bUseVMAD) then
            continue;
          if doNotTagNoTrans in sk.sInternalparams then
            continue;

          if not bOut and (sk.s = '') then
            lockSk(loader, sk, bSoftLock);

          if searchRegEx(RegEx, sk.s) then
          begin
            if bOut then
              include(sk.sInternalparams, doNotTagNoTrans)
            else
              lockSk(loader, sk, bSoftLock);
          end;
        end;
    except
      doFeedBack(formatRes('ErrorRegex%s', [pattern]));
    end;
  finally
    RegEx.Free;
  end;
end;

procedure tagNoTransationByID(loader: tTranslatorLoader; r, f: sheaderSig; bOut, bSoftLock: boolean);
var
  i, j: integer;
  sk: tskystr;
begin
  for j := 0 to 2 do
    for i := 0 to pred(loader.listarray[j].count) do
    begin
      sk := loader.listarray[j][i];
      if bSoftLock and not(OnTranslationApiArray_PreSelection in sk.sInternalparams) then
        continue;
      if not sk.isVisibleVmad(MainLoader.bUseVMAD) then
        continue;
      if doNotTagNoTrans in sk.sInternalparams then
        continue;

      if (sk.esp.rName = r) and (sk.esp.fName = f) then
      begin
        if bOut then
          include(sk.sInternalparams, doNotTagNoTrans)
        else
          lockSk(loader, sk, bSoftLock);
      end;
    end;
end;

function getHeaderSig(offset: integer; s: rawbytestring): sheaderSig;
begin
  move(s[offset], result[0], 4)
end;

procedure tagNoTransationStringsEx(loader: tTranslatorLoader; l: tstringList; bOut, bSoftLock: boolean);
var
  i: integer;
begin
  for i := 0 to l.count - 1 do
  begin
    if is_comment(l[i]) then
      continue;
    if is_adress(l[i]) then
      tagNoTransationByID(loader, getHeaderSig(2, rawbytestring(trim(l[i]))), getHeaderSig(7, rawbytestring(trim(l[i]))), bOut, bSoftLock)
    else
      tagNoTransationRegEx(loader, l[i], bOut, bSoftLock);

    UpdatePBar(1, 0, false);
  end;
end;

procedure tagNoTranslationStrings(loader: tTranslatorLoader; bSoftLock: boolean);
begin
  ProgressBar.max := lRulesNoTransListOut.count + lRulesNoTransListIn.count;
  pbar := 0;
  timeUndo;
  // --------------------------
  loader.excludeInternalParam([doNotTagNoTrans]);
  tagNoTransationStringsEx(loader, lRulesNoTransListOut, true, bSoftLock);
  tagNoTransationStringsEx(loader, lRulesNoTransListIn, false, bSoftLock);
end;

end.
