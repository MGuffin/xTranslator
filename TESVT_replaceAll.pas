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
unit TESVT_replaceAll;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, system.UITypes, Vcl.ExtCtrls, TESVT_sharedVTProc, VirtualTrees,
  TESVT_Ressources, TESVT_Const, TESVT_Hint,VirtualTrees.types,
  Vcl.StdCtrls, VirtualTrees.BaseAncestorVCL, VirtualTrees.BaseTree, VirtualTrees.AncestorVCL;

type
  TForm5 = class(TForm)
    Panel1: TPanel;
    replaceTree: TVirtualStringTree;
    Button1: TButton;
    Label1: TLabel;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure replaceTreeGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
    procedure FormCreate(Sender: TObject);
    procedure replaceTreeBeforeCellPaint(Sender: TBaseVirtualTree; TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex;
      CellPaintMode: TVTCellPaintMode; CellRect: TRect; var ContentRect: TRect);
    procedure replaceTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure replaceTreeGetImageIndex(Sender: TBaseVirtualTree; Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: Boolean;
      var ImageIndex: TImageIndex);
    procedure replaceTreePaintText(Sender: TBaseVirtualTree; const TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure replaceTreeMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure replaceTreeHeaderDrawQueryElements(Sender: TVTHeader; var PaintInfo: THeaderPaintInfo; var Elements: THeaderPaintElements);
    procedure replaceTreeAdvancedHeaderDraw(Sender: TVTHeader; var PaintInfo: THeaderPaintInfo; const Elements: THeaderPaintElements);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

procedure TForm5.Button2Click(Sender: TObject);
begin
  replaceTree.SelectAll(false);
end;

procedure TForm5.Button3Click(Sender: TObject);
var
  Node: PVirtualNode;
begin
  Node := replaceTree.getfirst;
  while assigned(Node) do
  begin
    replaceTree.Selected[Node] := false;
    Node := replaceTree.GetNext(Node);
  end;
end;

procedure TForm5.FormCreate(Sender: TObject);
begin
  init_caption(self);
  InitTreeOpts(replaceTree, genericTreeImageList);
  if TESVTmodEspLoaded then
    replaceTree.Header.Columns[4].Options := replaceTree.Header.Columns[4].Options + [coVisible]
  else
    replaceTree.Header.Columns[4].Options := replaceTree.Header.Columns[4].Options - [coVisible];
  replaceTree.Header.Columns[4].Width := edidColumnSize;
  if assigned(treearray[0]) then
    replaceTree.Header.Columns[0].Width := treearray[0].Header.Columns[0].Width;
end;

procedure TForm5.FormShow(Sender: TObject);
begin
  replaceTree.SetFocus;
end;

procedure TForm5.replaceTreeAdvancedHeaderDraw(Sender: TVTHeader; var PaintInfo: THeaderPaintInfo; const Elements: THeaderPaintElements);
begin
  TreeAdvancedHeaderDraw(Sender, PaintInfo, Elements);
end;

procedure TForm5.replaceTreeBeforeCellPaint(Sender: TBaseVirtualTree; TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex;
  CellPaintMode: TVTCellPaintMode; CellRect: TRect; var ContentRect: TRect);
begin
  TreeCellPaint(Sender, TargetCanvas, Node, Column, CellPaintMode, CellRect, ContentRect, true);
end;

procedure TForm5.replaceTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
begin
  TreeFreeNode(Sender, Node);
end;

procedure TForm5.replaceTreeGetImageIndex(Sender: TBaseVirtualTree; Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: Boolean;
  var ImageIndex: TImageIndex);
begin
  TreeGetImageIndex(Sender, Node, Kind, Column, Ghosted, ImageIndex);
end;

procedure TForm5.replaceTreeGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
begin
  TreeGetText(Sender, Node, Column, TextType, CellText, true, true, MAXSIZESTRING_IN_TREE[ord(bVTSimpleLine)]);
end;

procedure TForm5.replaceTreeHeaderDrawQueryElements(Sender: TVTHeader; var PaintInfo: THeaderPaintInfo; var Elements: THeaderPaintElements);
begin
  Elements := [hpeBackground];
end;

procedure TForm5.replaceTreeMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  TreeMouseMove(TVirtualStringTree(Sender), X, Y);
end;

procedure TForm5.replaceTreePaintText(Sender: TBaseVirtualTree; const TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType);
begin
  TreePaintText(Sender, TargetCanvas, Node, Column, TextType);
end;

end.
