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
unit TESVT_Browser;

interface

uses Windows, Controls, sysutils, Forms, Classes, ExtCtrls, StdCtrls, messages, TESVT_Ressources, TESVT_Const, TESVT_Bsa, VirtualTrees, TESVT_sharedVTProc, TESVT_typedef, Menus;

const
  WM_AFTER_SHOW = WM_USER + 300; // custom message

type

  TFormBrowser = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    CheckBox1: TCheckBox;
    Panel2: TPanel;
    ButtonedEdit1: TButtonedEdit;
    BrowserTree: TVirtualStringTree;
    PopupMenu1: TPopupMenu;
    selectAll1: TMenuItem;
    deselectAll1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BrowserTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure BrowserTreeGetImageIndex(Sender: TBaseVirtualTree; Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: Boolean; var ImageIndex:TImageIndex);
    procedure BrowserTreeGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
    procedure BrowserTreeDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButtonedEdit1Change(Sender: TObject);
    procedure ButtonedEdit1RightButtonClick(Sender: TObject);
    procedure selectAll1Click(Sender: TObject);
    procedure deselectAll1Click(Sender: TObject);
    procedure BrowserTreeHeaderClick(Sender: TVTHeader; HitInfo: TVTHeaderHitInfo);
    procedure BrowserTreeCompareNodes(Sender: TBaseVirtualTree; Node1, Node2: PVirtualNode; Column: TColumnIndex; var Result: Integer);
    procedure BrowserTreeHeaderDrawQueryElements(Sender: TVTHeader; var PaintInfo: THeaderPaintInfo; var Elements: THeaderPaintElements);
    procedure BrowserTreeAdvancedHeaderDraw(Sender: TVTHeader; var PaintInfo: THeaderPaintInfo; const Elements: THeaderPaintElements);
  private
    bFirst: Boolean;
    l: tstringlist;
    procedure WmAfterShow(var Msg: TMessage); message WM_AFTER_SHOW;
    procedure search(s: string);
    procedure FillTreeForExtraction;
    procedure FillTreeForInjection;
  public
    bStream: TObject;
    bsafile: string;
    aFolder, aExt: TStringArray;
    bFilesFound: Boolean;
    bInjectionMode: Boolean;
    { Déclarations publiques }
  end;

var
  FormBrowser: TFormBrowser;

implementation

{$R *.dfm}

uses TESVT_main;

procedure TFormBrowser.BrowserTreeAdvancedHeaderDraw(Sender: TVTHeader; var PaintInfo: THeaderPaintInfo; const Elements: THeaderPaintElements);
begin
  TreeAdvancedHeaderDraw(Sender, PaintInfo, Elements);
end;

procedure TFormBrowser.BrowserTreeCompareNodes(Sender: TBaseVirtualTree; Node1, Node2: PVirtualNode; Column: TColumnIndex; var Result: Integer);
Var
  Data1, Data2: ptreedataBrw;
begin
  Data1 := Sender.GetNodeData(Node1);
  Data2 := Sender.GetNodeData(Node2);
  case Column of
    0: Result := CompareText(Data1.BasicND.fExt, Data2.BasicND.fExt);
    1: Result := CompareText(Data1.BasicND.filename, Data2.BasicND.filename);
    2: Result := Data1.BasicND.fSize - Data2.BasicND.fSize;
  end;
end;

procedure TFormBrowser.BrowserTreeDblClick(Sender: TObject);
begin
  modalResult := mrOK;
end;

procedure TFormBrowser.BrowserTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
Var
  Dataf: ptreedataBrw;
begin
  Dataf := Sender.GetNodeData(Node);
  Dataf.BasicND.destroy;
end;

procedure TFormBrowser.BrowserTreeGetImageIndex(Sender: TBaseVirtualTree; Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: Boolean; var ImageIndex: TImageIndex);
var
  Data: ptreedataBrw;
begin
  if not((kind = ikNormal) or (kind = ikSelected)) then exit;
  Data := Sender.GetNodeData(Node);
  if Column = 0 then
    ImageIndex := Data.BasicND.icon;
end;

procedure TFormBrowser.BrowserTreeGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
var
  Data: ptreedataBrw;
begin
  Data := Sender.GetNodeData(Node);
  case Column of
    0: celltext:='';
    1: CellText := Data.BasicND.filename;
    2: CellText := inttostrShort(Data.BasicND.fsize);
  end;
end;

procedure TFormBrowser.BrowserTreeHeaderClick(Sender: TVTHeader; HitInfo: TVTHeaderHitInfo);
begin
  if HitInfo.Button = mbLeft then
  begin
    with Sender, Treeview do
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

procedure TFormBrowser.BrowserTreeHeaderDrawQueryElements(Sender: TVTHeader; var PaintInfo: THeaderPaintInfo; var Elements: THeaderPaintElements);
begin
  Elements := [hpeBackground];
end;

procedure TFormBrowser.ButtonedEdit1Change(Sender: TObject);
begin
  search(ButtonedEdit1.text);
end;

procedure TFormBrowser.ButtonedEdit1RightButtonClick(Sender: TObject);
begin
  ButtonedEdit1.text := '';
  search(ButtonedEdit1.text);
end;

procedure TFormBrowser.deselectAll1Click(Sender: TObject);
begin
  BrowserTree.ClearSelection;
end;

procedure TFormBrowser.selectAll1Click(Sender: TObject);
begin
  BrowserTree.SelectAll(true);
end;

procedure TFormBrowser.search(s: string);
var
  Data: ptreedataBrw;
  Node: PVirtualNode;
  tmpVisible: Boolean;
begin
  s := ansiLowercase(trim(ButtonedEdit1.text));
  BrowserTree.beginupdate;
  Node := BrowserTree.GetFirst;
  while assigned(Node) do
  begin
    if s = '' then
      tmpVisible := true
    else
    begin
      Data := BrowserTree.GetNodeData(Node);
      tmpVisible := pos(s, Data.BasicND.filename) > 0;
    end;
    BrowserTree.IsVisible[Node] := tmpVisible;
    Node := BrowserTree.getNext(Node);
  end;
  BrowserTree.endupdate;
end;

procedure TFormBrowser.FillTreeForInjection;
begin
  //--
end;

procedure TFormBrowser.FillTreeForExtraction;
var
  i: Integer;
begin
  screen.Cursor := crHourGlass;
  BrowserTree.AddChild(nil, tnodedatabrw.Create(0, getRes('fbk_Opening_Archive'), 31));
  getListfromArchive(bStream, bsafile, l, false, aFolder, aExt); // sFolderInArchive, sExtInArchive);
  BrowserTree.clear;
  if l.count = 0 then
    BrowserTree.AddChild(nil, tnodedatabrw.Create(0, getRes('fbk_Nothing_Found'), 32))
  else
  begin
    BrowserTree.beginupdate;
    for i := 0 to pred(l.count) do
      BrowserTree.AddChild(nil, tnodedatabrw.Create(cardinal(l.objects[i]),l[i], 0));
    BrowserTree.endupdate;
    bFilesFound := true;
  end;
  screen.Cursor := crDefault;
end;

procedure TFormBrowser.WmAfterShow(var Msg: TMessage);
begin
  if bFirst then
  begin
    if bInjectionMode then
      FillTreeForInjection
    else
      FillTreeForExtraction;
    bFirst := false;
  end;
end;

procedure TFormBrowser.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  l.free;
end;

procedure TFormBrowser.FormCreate(Sender: TObject);
begin
  BrowserTree.NodeDataSize := SizeOf(rTreeDataBrw);
  bFirst := true;
  bInjectionMode := false;
  bFilesFound := false;
  init_caption(self);
  l := tstringlist.Create;
end;

procedure TFormBrowser.FormShow(Sender: TObject);
begin
  PostMessage(self.Handle, WM_AFTER_SHOW, 0, 0);
end;

end.
