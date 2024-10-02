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
unit TESVT_sharedVTProc;

interface

uses forms, sysutils, virtualtrees, VirtualTrees.types, VirtualTrees.header, VirtualTrees.BaseTree, types, Windows, ComCtrls, StdCtrls, graphics, controls, math, classes, TESVT_typeDef, TESVT_espDefinition, TESVT_Const,
  TESVT_Fastsearch, TESVT_Hint, TESVT_MainLoader, TESVT_Ressources, TESVT_Utils, system.UITypes, SynEdit;

// -------shared VTfunction
procedure TreeCellPaint(Sender: TBaseVirtualTree; TargetCanvas: TCanvas; Node: pVirtualNode; Column: TColumnIndex; CellPaintMode: TVTCellPaintMode;
  CellRect: TRect; var ContentRect: TRect; doColor: boolean; useColortag: boolean = false);
procedure TreeGetText(Sender: TBaseVirtualTree; Node: pVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string; noCR: boolean;
  doShareId: boolean; stringSize: integer; getFullcolab: boolean = false);
procedure TreePaintText(Sender: TBaseVirtualTree; const TargetCanvas: TCanvas; Node: pVirtualNode; Column: TColumnIndex; TextType: TVSTTextType);
procedure TreeCompareNodes(Sender: TBaseVirtualTree; Node1, Node2: pVirtualNode; Column: TColumnIndex; eMode: boolean; var Result: integer;
  isSearch: boolean = false);
procedure TreeHeaderClick(Sender: TVTHeader; HitInfo: TVTHeaderHitInfo);
procedure InitTreeOpts(t: TBaseVirtualTree; ilist: timagelist);
procedure TreeGetImageIndex(Sender: TBaseVirtualTree; Node: pVirtualNode; Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: boolean;
  var ImageIndex: TImageIndex);
function defineCellText(s: string; noCR: boolean; sharedId, isWhite: boolean): string;
procedure TreeFreeNode(Sender: TBaseVirtualTree; Node: pVirtualNode);
function sharedIDnode(Sender: TBaseVirtualTree; Node: pVirtualNode; doShareId: boolean): boolean;
function GetSharedIdNode(Sender: TBaseVirtualTree; Node: pVirtualNode): pVirtualNode;
procedure TreeMouseMove(Sender: TVirtualStringTree; X, Y: integer; bSetFocus: boolean = false);
procedure TreeAdvancedHeaderDraw(Sender: TVTHeader; var PaintInfo: THeaderPaintInfo; const Elements: THeaderPaintElements);
procedure TreeDrawText(Sender: TBaseVirtualTree; TargetCanvas: TCanvas; Node: pVirtualNode; Column: TColumnIndex; const Text: string; const CellRect: TRect;
  var DefaultDraw: boolean);
procedure InitBIDITreeOpts(t: TBaseVirtualTree; bidiOpt: TBiDiMode);
// ListBox
procedure ListBoxDrawItem(control: TWinControl; Index: integer; Rect: TRect; State: TOwnerDrawState; baseColor: tcolor; il: timagelist; ImageIndex: integer);
// function getIDNum(sk: tSkyStr): int64;
procedure ShowColabCol(visible: boolean);
procedure InitFontTreeOpts(t: TBaseVirtualTree);
function getSearchIDName(Sender: TBaseVirtualTree; sk: tSkyStr): string;
procedure ComboBoxDrawItem(control: TWinControl; Index: integer; Rect: TRect; State: TOwnerDrawState; il: timagelist; ImageIndex: integer);
procedure repaintTrees;

var
  VTtreeList: tlist;
  VTtreeList_Tag: tlist;

implementation

procedure repaintTrees;
var
  i: integer;
begin
  for i := 0 to pred(VTtreeList.count) do
    TVirtualStringTree(VTtreeList[i]).Repaint;
end;

procedure ShowColabCol(visible: boolean);
var
  i: integer;
  VT: TVirtualStringTree;
begin
  for i := 0 to pred(VTtreeList_Tag.count) do
  begin
    VT := VTtreeList_Tag[i];
    if visible then
      VT.Header.Columns[5].Options := VT.Header.Columns[5].Options + [coVisible]
    else
      VT.Header.Columns[5].Options := VT.Header.Columns[5].Options - [coVisible];
  end;
end;

procedure DoHint(control: tcontrol; hintstr: string);
begin
  application.hidehint;
  control.Hint := hintstr;
  if hintstr <> '' then
    application.ActivateHint(mouse.CursorPos);
end;

procedure TreeMouseMove(Sender: TVirtualStringTree; X, Y: integer; bSetFocus: boolean = false);
var
  Node: pVirtualNode;
  tmpHint: string;
  i, col: integer;
  c: TVirtualTreeColumn;
begin
  // if bSetFocus then sender.setfocus;//devtest
  Node := Sender.GetNodeAt(X, Y);
  col := -1;
  // getcolumn
  for i := 0 to Sender.Header.Columns.count - 1 do
  begin
    c := Sender.Header.Columns[i];
    if (X > c.left) and (X < c.left + Min(colCatchhint, c.Width)) then
    begin
      col := i;
      break;
    end;
  end;
  // gethint
  if assigned(Node) and (col >= 0) then
  begin
    if hintActiveNode = Node then
      exit
    else
    begin
      TreeGetText(Sender, Node, col, ttNormal, tmpHint, false, false, MAXSIZESTRING_IN_HARDCAP, true);
      if tmpHint <> '' then
        tmpHint := '<font face="courier new">' + tmpHint;
      DoHint(Sender, cleanString(tmpHint, aCleanChar));
      hintActiveNode := Node;
    end;
  end
  else
  begin
    hintActiveNode := nil;
    DoHint(Sender, '');
  end;
end;

function GetSharedIdNode(Sender: TBaseVirtualTree; Node: pVirtualNode): pVirtualNode;
begin
  if sharedIDnode(Sender, Node, true) then
    Result := Node.parent
  else
    Result := Node;
end;

function sharedIDnode(Sender: TBaseVirtualTree; Node: pVirtualNode; doShareId: boolean): boolean;
Var
  Data: ptreedata;
begin
  Data := Sender.GetNodeData(Node);
  Result := doShareId and (toLocalizedSharedID in Data.basicNd.s.sInternalparams) and (Sender.GetNodeLevel(Node) > 0);
end;

function getID(Sender: TBaseVirtualTree; sk: tSkyStr): string;
var
  Data: ptreedatafdr;
begin
  if isCache in sk.sInternalparams then
  begin
    if assigned(sk.pNode) then
    begin
      Data := Sender.GetNodeData(sk.pNode);
      Result := Data.basicNd.s.name;
    end
    else
      Result := '-';
  end
  else
  begin
    if CurrentTESVmode = sTESVMCM then
      Result := GetMCMIdCount(mainloader, sk.esp.strId)
      // else if (TESVTmodEspLoaded) and sk.isEspAssigned then
    else if (CurrentTESVmode = sTESVStrings) or (CurrentTESVmode = sTESVPex) then
      Result := format('%.5x', [sk.esp.strId])
    else
      Result := format('%.4s %.4s', [string(sk.getRecSig), string(sk.getFieldSig)])
  end;
end;

{ function getIDNum(sk: tSkyStr): int64;
  begin
  Int64Rec(Result).Lo:= SwapEndian32uasm(cardinal(sk.getFieldSig));
  Int64Rec(Result).Hi:= SwapEndian32uasm(cardinal(sk.getRecSig));
  end; }

function defineCellText(s: string; noCR: boolean; sharedId, isWhite: boolean): string;
var
  i, p: integer;
begin
  if sharedId then
    exit('[SharedString]' + s);
  if s = '' then
    exit('[NULL]');
  if isWhite then
  begin
    Result := '[';
    for p := 1 to length(s) do
      for i := 0 to 32 do
        if Byte(s[p]) = i then
        begin
          Result := Result + ascIISymbols[i];
          break;
        end;
    Result := trim(Result) + ']';
  end
  else
  begin
    Result := s;
    if noCR then
      replaceLineBreak(Result);
  end;
end;
// ------Init

procedure InitFontTreeOpts(t: TBaseVirtualTree);
var
  i: integer;
begin
  if bForceAltHeaderDisplay then
    TVirtualStringTree(t).font.name := HeaderComponentFont
  else
    TVirtualStringTree(t).font.name := virtualTreeFont;
  TVirtualStringTree(t).font.size := virtualTreeFontsize[0];
  virtualTreeFontsize[1] := virtualTreeFontsize[0] - 2;
  virtualTreeFontsize[2] := virtualTreeFontsize[0] - 3;

  for i := 0 to 2 do
    if virtualTreeFontsize[i] < 7 then
      virtualTreeFontsize[i] := 7;

end;

procedure InitTreeOpts(t: TBaseVirtualTree; ilist: timagelist);
begin
  TVirtualStringTree(t).Header.parentfont := false;
  TVirtualStringTree(t).Header.height := 19;
  TVirtualStringTree(t).Header.Columns[0].Width := 85;
  TVirtualStringTree(t).Header.Columns[3].Width := 55;
  TVirtualStringTree(t).NodeDataSize := SizeOf(rTreeData);
  InitFontTreeOpts(t);
  TVirtualStringTree(t).Images := ilist;
  InitBIDITreeOpts(t, bBidiBase);
  TVirtualStringTree(t).Color := clWhite;
end;

procedure InitBIDITreeOpts(t: TBaseVirtualTree; bidiOpt: TBiDiMode);
begin
  TVirtualStringTree(t).Header.Columns[2].BiDiMode := bidiOpt;
end;

// -----Events-----------------
procedure TreeHeaderClick(Sender: TVTHeader; HitInfo: TVTHeaderHitInfo);
begin
  if HitInfo.Button = mbLeft then
  begin
    with Sender, TBaseVirtualTree(Treeview) do
    begin
      if (SortColumn = NoColumn) or (SortColumn <> HitInfo.Column) then
      begin
        SortColumn := HitInfo.Column;
        SortDirection := sdAscending;
      end
      else if SortDirection = sdAscending then
        SortDirection := sdDescending
      else
        SortDirection := sdAscending;
         SortTree(SortColumn, SortDirection, false);
    end;
  end;
end;

procedure TreeFreeNode(Sender: TBaseVirtualTree; Node: pVirtualNode);
Var
  Data: ptreedata;
begin
  Data := Sender.GetNodeData(Node);
  Data.basicNd.destroy;
end;

function getSearchIDName(Sender: TBaseVirtualTree; sk: tSkyStr): string;
var
  Data: ptreedatafdr;
begin
  if isCache in sk.sInternalparams then
  begin
    if assigned(sk.pNode) then
    begin
      Data := Sender.GetNodeData(sk.pNode);
      Result := Data.basicNd.s.name;
    end
    else
      Result := '-';
  end
end;

procedure TreeCompareNodes(Sender: TBaseVirtualTree; Node1, Node2: pVirtualNode; Column: TColumnIndex; eMode: boolean; var Result: integer;
  isSearch: boolean = false);
Var
  Data1, Data2: ptreedata;
  U1, U2: uInt64;
begin
  Data1 := Sender.GetNodeData(Node1);
  Data2 := Sender.GetNodeData(Node2);
  case Column of
    0:
      begin
        if isSearch then
        begin
          Result := CompareText(getSearchIDName(Sender, Data1.basicNd.s), getSearchIDName(Sender, Data2.basicNd.s), sortLocalOptions);
        end
        else
        begin
          if CurrentTESVmode in [sTESVEsp, sTESVEspStrings, sTESVTsstEdit] then
          begin
            U1 := Data1.basicNd.s.getRecFieldToInt64;
            U2 := Data2.basicNd.s.getRecFieldToInt64;
            if U1 < U2 then
              Result := -1
            else if U2 < U1 then
              Result := 1
            else
              Result := 0;
          end
          else if eMode then
            Result := CompareText(getID(Sender, Data1.basicNd.s), getID(Sender, Data2.basicNd.s), sortLocalOptions)
          else
            Result := Data1.basicNd.s.esp.strId - Data2.basicNd.s.esp.strId;
        end;
      end;
    1: Result := CompareText(Data1.basicNd.s.sLimited(MAXSIZESTRING_IN_TREE_FOR_SORT), Data2.basicNd.s.sLimited(MAXSIZESTRING_IN_TREE_FOR_SORT),
        sortLocalOptions);
    2: Result := CompareText(Data1.basicNd.s.sTransLimited(MAXSIZESTRING_IN_TREE_FOR_SORT), Data2.basicNd.s.sTransLimited(MAXSIZESTRING_IN_TREE_FOR_SORT),
        sortLocalOptions);
    3:
      begin
        if isSearch then
          Result := length(Data1.basicNd.s.s) - length(Data2.basicNd.s.s)
        else
          Result := floor(((Data2.basicNd.s.LDResult) - (Data1.basicNd.s.LDResult)) * 20000) * $6F + //
            (ord(Warning in Data2.basicNd.s.sInternalparams) - ord(Warning in Data1.basicNd.s.sInternalparams)) * $5F + //
            (ord(nTrans in Data2.basicNd.s.sInternalparams) - ord(nTrans in Data1.basicNd.s.sInternalparams)) * $4F + //
            (ord(IncompleteTrans in Data2.basicNd.s.sparams) - ord(IncompleteTrans in Data1.basicNd.s.sparams)) * $3F + //
            (ord(Validated in Data2.basicNd.s.sparams) - ord(Validated in Data1.basicNd.s.sparams)) * $2F + //
            (ord(Translated in Data2.basicNd.s.sparams) - ord(Translated in Data1.basicNd.s.sparams)) * $1F + //
            (ord(pexNoTrans in Data2.basicNd.s.sInternalparams) - ord(pexNoTrans in Data1.basicNd.s.sInternalparams)) * $F + //
            (ord(LockedTrans in Data2.basicNd.s.sparams) - ord(LockedTrans in Data1.basicNd.s.sparams));
      end;
    4: Result := compareFullEdidName(Data1.basicNd.s, Data2.basicNd.s);
    5: Result := Data1.basicNd.s.colabId - Data2.basicNd.s.colabId;
  end;
end;

procedure TreePaintText(Sender: TBaseVirtualTree; const TargetCanvas: TCanvas; Node: pVirtualNode; Column: TColumnIndex; TextType: TVSTTextType);
var
  Data: ptreedata;
const
  c = $00CC6666;
  function defineTextColor(sk: tSkyStr; p: sStrInternalParam): tcolor;
  begin
    if p in sk.sInternalparams then
      exit(c)
    else
      exit(clblack);
  end;

begin
  Data := Sender.GetNodeData(Node);

  if sharedIDnode(Sender, Node, true) then
    TargetCanvas.font.Color := c
  else
    case Column of
      1: TargetCanvas.font.Color := defineTextColor(Data.basicNd.s, sourceWhite);
      2: TargetCanvas.font.Color := defineTextColor(Data.basicNd.s, transWhite);
    else TargetCanvas.font.Color := clblack;
    end;

  if isDeleted in Data.basicNd.s.sInternalparams then
    TargetCanvas.font.style := [fsStrikeOut]
  else
    TargetCanvas.font.style := [];
  if Column in [0, 4] then
  begin
    TargetCanvas.font.name := virtualTreeFixedFont;
    TargetCanvas.font.size := virtualTreeFontsize[1];
  end
  else if Column in [3, 5] then
  begin
    TargetCanvas.font.name := virtualTreeFixedFont;
    TargetCanvas.font.size := virtualTreeFontsize[2];
  end
  else if (Column in [1, 2]) and (Data.basicNd.s.sInternalparams * [isOrphean, unusedInSST] <> []) then
    TargetCanvas.font.style := [fsItalic];
end;

procedure TreeCellPaint(Sender: TBaseVirtualTree; TargetCanvas: TCanvas; Node: pVirtualNode; Column: TColumnIndex; CellPaintMode: TVTCellPaintMode;
  CellRect: TRect; var ContentRect: TRect; doColor: boolean; useColortag: boolean = false);
var
  Data: ptreedata;
  colmin, colMax, colPos, i, tmpcellleft, tmpcellright: integer;
  B: boolean;
const
  selMargin = 5;
  warnMargin = 5;
begin
  if (CellPaintMode <> cpmPaint) then
    exit;
  // --------------
  if sharedIDnode(Sender, Node, doColor) then
  begin
    TargetCanvas.Brush.Color := Gradient($00FFEEEE);
    TargetCanvas.FillRect(CellRect);
    exit;
  end;
  Data := Sender.GetNodeData(Node);

  if useColortag then
    B := altColor in Data.basicNd.s.sInternalparams
  else
    B := odd(Node.Index);

  if B then
    TargetCanvas.Brush.Color := Gradient($00EDEDED)
  else
    TargetCanvas.Brush.Color := Gradient($00FFFFFF);
  // <---
  if doColor then
    case ceil(Data.basicNd.s.LDResult) of
      0:;
      1:
        if B then
          TargetCanvas.Brush.Color := blendcolor($00AACCAA)
        else
          TargetCanvas.Brush.Color := blendcolor($00BBDDBB);
      2:
        if B then
          TargetCanvas.Brush.Color := blendcolor($00AABBAA)
        else
          TargetCanvas.Brush.Color := blendcolor($00BBCCBB);
      3:
        if B then
          TargetCanvas.Brush.Color := blendcolor($00AAAAAA)
        else
          TargetCanvas.Brush.Color := blendcolor($00BBBBBB);
      4:
        if B then
          TargetCanvas.Brush.Color := blendcolor($00AAAABB)
        else
          TargetCanvas.Brush.Color := blendcolor($00BBBBBB);
      5:
        if B then
          TargetCanvas.Brush.Color := blendcolor($00AAAACA)
        else
          TargetCanvas.Brush.Color := blendcolor($00BBBBCA);
      6:
        if B then
          TargetCanvas.Brush.Color := blendcolor($00AAAADA)
        else
          TargetCanvas.Brush.Color := blendcolor($00BBBBDA);
      7:
        if B then
          TargetCanvas.Brush.Color := blendcolor($00AAAADD)
        else
          TargetCanvas.Brush.Color := blendcolor($00BBBBDD);
    else
      if B then
        TargetCanvas.Brush.Color := blendcolor($00AAAAEA)
      else
        TargetCanvas.Brush.Color := blendcolor($00BBBBEA);
    end;

  // sparams
  if Validated in Data.basicNd.s.sparams then
    if B then
      TargetCanvas.Brush.Color := blendcolor($00DCBBBB)
    else
      TargetCanvas.Brush.Color := blendcolor($00DCAAAA);

  // sparams
  if IncompleteTrans in Data.basicNd.s.sparams then
    if B then
      TargetCanvas.Brush.Color := blendcolor($00DCBBDC)
    else
      TargetCanvas.Brush.Color := blendcolor($00DCAADC);

  // sparams
  if LockedTrans in Data.basicNd.s.sparams then
    if B then
      TargetCanvas.Brush.Color := blendcolor($00BBDCDC)
    else
      TargetCanvas.Brush.Color := blendcolor($00AADCDC);

  colmin := TVirtualStringTree(Sender).Header.Columns.count - 1;
  colMax := 0;
  for i := 0 to TVirtualStringTree(Sender).Header.Columns.count - 1 do
    if (coVisible in TVirtualStringTree(Sender).Header.Columns[i].Options) then
    begin
      colmin := Min(TVirtualStringTree(Sender).Header.Columns[i].position, colmin);
      colMax := max(TVirtualStringTree(Sender).Header.Columns[i].position, colMax);
    end;
  colPos := TVirtualStringTree(Sender).Header.Columns[Column].position;

  tmpcellright := CellRect.right;

  if (Node <> Sender.focusedNode) and not(Sender.Selected[Node]) then
  begin
    if colPos = colmin then
      inc(CellRect.left, selMargin)
    else if colPos = colMax then
      dec(CellRect.right, selMargin);
  end;

  if colPos = colmin then
    inc(CellRect.right, 1)
  else if colPos = colMax then
    dec(CellRect.left, 1)
  else
  begin
    inc(CellRect.right, 1);
    dec(CellRect.left, 1);
  end;
  TargetCanvas.FillRect(CellRect);

  // special

  tmpcellleft := CellRect.left;
  if colPos = colMax then
  begin
    CellRect.left := tmpcellright - (selMargin + 1);
    if aliaserror in Data.basicNd.s.sInternalparams then
      dec(CellRect.left, warnMargin);
    if StringSizeError in Data.basicNd.s.sInternalparams then
      dec(CellRect.left, warnMargin);
    if StringCRError in Data.basicNd.s.sInternalparams then
      dec(CellRect.left, warnMargin);

    if aliaserror in Data.basicNd.s.sInternalparams then
    begin
      TargetCanvas.Brush.Color := Gradient($0088FFFF);
      TargetCanvas.FillRect(CellRect);
      TargetCanvas.Brush.Color := clHighlight;
      TargetCanvas.FrameRect(CellRect);
      inc(CellRect.left, warnMargin);
    end;
    // strerror
    if StringSizeError in Data.basicNd.s.sInternalparams then
    begin
      TargetCanvas.Brush.Color := Gradient($006FD0FF);
      TargetCanvas.FillRect(CellRect);
      TargetCanvas.Brush.Color := clHighlight;
      TargetCanvas.FrameRect(CellRect);
      inc(CellRect.left, warnMargin);
    end;
    // strerror
    if StringCRError in Data.basicNd.s.sInternalparams then
    begin
      TargetCanvas.Brush.Color := Gradient($004444FF);
      TargetCanvas.FillRect(CellRect);
      TargetCanvas.Brush.Color := clHighlight;
      TargetCanvas.FrameRect(CellRect);
    end;
  end;
  CellRect.left := tmpcellleft;

  // selection
  TargetCanvas.Brush.Color := clHighlight;
  if (Node = Sender.focusedNode) then
    TargetCanvas.FrameRect(CellRect);
  if (Sender.Selected[Node]) then
  begin
    if colPos = colmin then
    begin
      dec(CellRect.right, TVirtualStringTree(Sender).Header.Columns[Column].Width - selMargin);
      TargetCanvas.FillRect(CellRect);
    end
    else if colPos = colMax then
    begin
      inc(CellRect.left, TVirtualStringTree(Sender).Header.Columns[Column].Width - selMargin);
      TargetCanvas.FillRect(CellRect);
    end;
  end;
  dec(ContentRect.right, selMargin);
end;

procedure TreeGetText(Sender: TBaseVirtualTree; Node: pVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string; noCR: boolean;
  doShareId: boolean; stringSize: integer; getFullcolab: boolean = false);
var
  Data: ptreedata;
  function LDtag(f: single; fr: integer): string;
  const
    tag: array [0 .. 1] of string[1] = ('', '+');
  begin
    if f > 50 then
      Result := '-'
    else if f > 9.0 then
      Result := format('%.1f%s', [f, tag[ord(fr > 1)]])
    else if f > 0.1 then
      Result := format('%.1f%s', [(ceil(f * 10)) / 10, tag[ord(fr > 1)]])
    else if f > 0.0 then
      Result := format('%.1f%s', [f, tag[ord(fr > 1)]])
    else
      Result := '';
  end;

begin
  Data := Sender.GetNodeData(Node);
  case Column of
    0: CellText := getID(Sender, Data.basicNd.s);
    1: CellText := defineCellText(Data.basicNd.s.sLimitedDot(stringSize), noCR, sharedIDnode(Sender, Node, doShareId),
        sourceWhite in Data.basicNd.s.sInternalparams);
    2: CellText := defineCellText(Data.basicNd.s.sTransLimitedDot(stringSize), noCR, sharedIDnode(Sender, Node, doShareId),
        transWhite in Data.basicNd.s.sInternalparams);
    3: CellText := LDtag(Data.basicNd.s.LDResult, Data.basicNd.s.LDFound);
    4:
      begin
        if isOrphean in Data.basicNd.s.sInternalparams then
          CellText := format('Orphan[%.6x]', [Data.basicNd.s.esp.strId])
        else
          CellText := Data.basicNd.s.getEdidNameExport(true);
      end;
    5:
      if Data.basicNd.s.colabId > 0 then
      begin
        if getFullcolab and assigned(mainloader) then
          CellText := '[' + inttohex(Data.basicNd.s.colabId, 2) + '] ' + mainloader.aColabLabel[Data.basicNd.s.colabId]
        else
          CellText := inttohex(Data.basicNd.s.colabId, 2);
      end
      else
        CellText := '';
  end;
end;

procedure TreeAdvancedHeaderDraw(Sender: TVTHeader; var PaintInfo: THeaderPaintInfo; const Elements: THeaderPaintElements);
begin
  if hpeBackground in Elements then
  begin
    if bCurrentWrongWorkspace then
    begin
      PaintInfo.TargetCanvas.Brush.Color := clRed;
      PaintInfo.TargetCanvas.Pen.Color := $008888EA;
    end
    else
    begin
      PaintInfo.TargetCanvas.Brush.Color := Gradient(clWhite, darkPercent + 10);
      PaintInfo.TargetCanvas.Pen.Color := Gradient(clWhite, darkPercent + 15);
    end;
    PaintInfo.TargetCanvas.Rectangle(PaintInfo.PaintRectangle);
  end;
end;

procedure TreeGetImageIndex(Sender: TBaseVirtualTree; Node: pVirtualNode; Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: boolean;
  var ImageIndex: TImageIndex);
Var
  Data: ptreedata;
begin
  ImageIndex := -1;
  if not((Kind = ikNormal) or (Kind = ikSelected)) then
    exit;
  Data := Sender.GetNodeData(Node);
  case Column of
    0:
      begin
        if Data.basicNd.s.sInternalparams * [unusedInSST] <> [] then
          ImageIndex := 33;
      end;
    1:
      begin
        if Data.basicNd.s.isDialog then
          ImageIndex := 59
        else if Data.basicNd.s.getRecSig = headerQUST then
          ImageIndex := 75
        else if pos(#13, Data.basicNd.s.s) > 0 then
          ImageIndex := 6;
        // override default:
        if isFemale in Data.basicNd.s.sInternalparams then
          ImageIndex := 48
        else if fuzWarning in Data.basicNd.s.sInternalparams then
        begin
          if npcWarning in Data.basicNd.s.sInternalparams then
            ImageIndex := 76
          else
            ImageIndex := 60
        end
        else if npcWarning in Data.basicNd.s.sInternalparams then
          ImageIndex := 77
        else if pexWarn in Data.basicNd.s.sInternalparams then
          ImageIndex := 58
        else if pexNoTrans in Data.basicNd.s.sInternalparams then
          ImageIndex := 19
        else if isVMADString in Data.basicNd.s.sInternalparams then
          ImageIndex := 17
      end;
    2:
      begin
        if nTrans in Data.basicNd.s.sInternalparams then
          ImageIndex := 15;
        if asSpellCheckFault in Data.basicNd.s.sInternalparams then
          ImageIndex := 56;
        if (length(Data.basicNd.s.strans) > 0) and (Data.basicNd.s.strans[1] = UCODE_START_RTL) then
          ImageIndex := 24;
      end;
    3:
      begin
        if bigWarning in Data.basicNd.s.sInternalparams then
          ImageIndex := 60
        else if Warning in Data.basicNd.s.sInternalparams then
          ImageIndex := 58
        else if lowWarning in Data.basicNd.s.sInternalparams then
          ImageIndex := 77
      end;
    4:
      begin
        if Data.basicNd.s.sInternalparams * [isOrphean] <> [] then
          ImageIndex := 33;
      end;
    5:
      if Data.basicNd.s.colabId > 0 then
        ImageIndex := 65;

  end;
end;

function getEllipsisString(canvas: TCanvas; s: string; margin, spacing: integer; R: TRect): string;
var
  NodeWidth, EllipsisWidth: integer;
  size: TSize;
begin
  GetTextExtentPoint32W(canvas.Handle, PChar(s), length(s), size);
  NodeWidth := size.cx + 2 * margin;
  GetTextExtentPoint32W(canvas.Handle, '...', 3, size);
  EllipsisWidth := size.cx;
  if ((NodeWidth - 2 * margin) > R.right - (R.left + spacing)) then
    Result := ShortenStringEx(canvas.Handle, s, R.right - (R.left + spacing), EllipsisWidth)
  else
    Result := s;
end;

procedure TreeDrawText(Sender: TBaseVirtualTree; TargetCanvas: TCanvas; Node: pVirtualNode; Column: TColumnIndex; const Text: string; const CellRect: TRect;
  var DefaultDraw: boolean);
var
  DrawFormat: cardinal;
  R: TRect;
  s: String;
begin
  if not(Column in [1, 2]) then
  begin
    DefaultDraw := false;
    R := CellRect;
    s := getEllipsisString(TargetCanvas, Text, TVirtualStringTree(Sender).TextMargin, 0, R);
    DrawFormat := DT_NOPREFIX or DT_VCENTER or DT_SINGLELINE;
    Windows.DrawTextW(TargetCanvas.Handle, PChar(s), length(s), R, DrawFormat);
  end;
end;

procedure ListBoxDrawItem(control: TWinControl; Index: integer; Rect: TRect; State: TOwnerDrawState; baseColor: tcolor; il: timagelist; ImageIndex: integer);
var
  xTmp: integer;
  s: string;
begin
  // s := getEllipsisString((control as TListBox).canvas, (control as TListBox).items[Index], 2, 25, Rect);
  s := (control as TListBox).items[Index];
  with (control as TListBox).canvas do
  begin
    Brush.style := bsClear;
    // CleanUp
    if odSelected in State then
    begin
      Brush.Color := blendcolor(clHighlight, baseColor, 20);
      FillRect(Rect);
    end
    else
    begin
      Brush.Color := baseColor;
      FillRect(Rect);
    end;

    // image
    if assigned(il) then
      il.Draw((control as TListBox).canvas, Rect.left + 7, Rect.top + 1, ImageIndex);
    // text
    font.Color := clblack;

    TextOut(Rect.left + 25, Rect.top + 1, s);
    // framerect
    if odFocused In State then
    begin
      if odSelected in State then
      begin
        Brush.Color := clHighlight;
        FrameRect(Rect);
      end
      else
      begin
        Brush.Color := baseColor;
        DrawFocusRect(Rect);
      end;
    end;
    if odSelected in State then
    begin
      Brush.Color := clHighlight;
      // block left
      xTmp := Rect.right;
      Rect.right := Rect.left + 5;
      FillRect(Rect);
      // block right
      Rect.right := xTmp;
      Rect.left := xTmp - 5;
      FillRect(Rect);
    end;
  end;
end;

procedure ComboBoxDrawItem(control: TWinControl; Index: integer; Rect: TRect; State: TOwnerDrawState; il: timagelist; ImageIndex: integer);
begin
  with control as TComboBox do
  begin
    canvas.FillRect(Rect);
    if assigned(il) then
      il.Draw(canvas, Rect.left + 6, Rect.top, ImageIndex);
    canvas.TextOut(Rect.left + 25, Rect.top, items[index])
  end;
end;

end.
