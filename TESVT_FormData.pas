unit TESVT_FormData;

interface

uses Windows, Messages, SysUtils, System.types, Variants, Classes, Graphics, Controls, Forms, Dialogs, TESVT_Batcher, TESVT_Const,
  TESVT_Ressources, Menus, TESVT_sharedVTProc, TESVT_espDefinition, StdCtrls, TESVT_tagID,
  ExtCtrls, ComCtrls, ShellAPI, grids, TESVT_HeaderList, VirtualTrees, ActiveX, ClipBrd, inifiles;

type
  TFormKeyWord = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel7: TPanel;
    Button10: TButton;
    Panel5: TPanel;
    Button6: TButton;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    LoadDefault1: TMenuItem;
    LoadCustom1: TMenuItem;
    AppendCustom1: TMenuItem;
    N1: TMenuItem;
    rulesSaveCustom1: TMenuItem;
    Close1: TMenuItem;
    N3: TMenuItem;
    rulesClearList1: TMenuItem;
    Options1: TMenuItem;
    LoadDefaultAtStart1: TMenuItem;
    LoadLastCustomAtStart1: TMenuItem;
    DoNotLoad1: TMenuItem;
    Button8: TButton;
    Button9: TButton;
    Button12: TButton;
    Panel8: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ListBoxKw_Y: TListBox;
    ListBoxKw_N: TListBox;
    Button4: TButton;
    Button5: TButton;
    CheckBox3: TCheckBox;
    Edit3: TButtonedEdit;
    Edit2: TButtonedEdit;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Panel12: TPanel;
    Button3: TButton;
    Button7: TButton;
    Panel6: TPanel;
    ListBox1: TListBox;
    Splitter1: TSplitter;
    Panel11: TPanel;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    CheckBox5: TCheckBox;
    CheckBox4: TCheckBox;
    Button11: TButton;
    FontDialog1: TFontDialog;
    Panel13: TPanel;
    headerTree: TVirtualStringTree;
    Panel14: TPanel;
    ButtonedEdit2: TButtonedEdit;
    ButtonedEdit3: TButtonedEdit;
    ButtonedEdit4: TButtonedEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Panel15: TPanel;
    CheckBox6: TCheckBox;
    Button13: TButton;
    Button2: TButton;
    CheckBox8: TCheckBox;
    ComboBox1: TComboBox;
    EditRname: TEdit;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    CheckBox7: TCheckBox;
    GroupBox2: TGroupBox;
    ComboBox2: TComboBox;
    PopupMenu1: TPopupMenu;
    CutSuffixes: TMenuItem;
    PasteSuffixes: TMenuItem;
    pasteTag: TMenuItem;
    N4: TMenuItem;
    Button14: TButton;
    Button15: TButton;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    MenurulesSaveCustomSelected1: TMenuItem;
    N6: TMenuItem;
    MenuspecialSave1: TMenuItem;
    N2: TMenuItem;
    AdvancedMode1: TMenuItem;
    EditFname: TEdit;
    Button16: TButton;
    Templates1: TMenuItem;
    Panel9: TPanel;
    CheckBox9: TCheckBox;
    CombofbBank: TComboBox;
    Button17: TButton;
    Button18: TButton;
    N5: TMenuItem;
    pasteFeedback1: TMenuItem;
    GroupBox3: TGroupBox;
    Edit4: TEdit;
    N7: TMenuItem;
    procedure ListBox1DrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
    procedure Button1Click(Sender: TObject);
    procedure ListBoxKw_NDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure ListBoxKw_YDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Edit3RightButtonClick(Sender: TObject);
    procedure Edit2RightButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rulesClearList1Click(Sender: TObject);
    procedure LoadDefaultAtStart1Click(Sender: TObject);
    procedure LoadCustom1Click(Sender: TObject);
    procedure AppendCustom1Click(Sender: TObject);
    procedure rulesSaveCustom1Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure menuOnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure headerTreeInitNode(Sender: TBaseVirtualTree; ParentNode, Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
    procedure headerTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure headerTreeGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
    procedure headerTreeBeforeCellPaint(Sender: TBaseVirtualTree; TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex;
      CellPaintMode: TVTCellPaintMode; CellRect: TRect; var ContentRect: TRect);
    procedure headerTreeGetImageIndex(Sender: TBaseVirtualTree; Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: Boolean;
      var ImageIndex: TImageIndex);
    procedure headerTreePaintText(Sender: TBaseVirtualTree; const TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType);
    procedure headerTreeDragAllowed(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; var Allowed: Boolean);
    procedure headerTreeDragDrop(Sender: TBaseVirtualTree; Source: TObject; DataObject: IDataObject; Formats: TFormatArray; Shift: TShiftState; Pt: TPoint;
      var Effect: Integer; Mode: TDropMode);
    procedure headerTreeDragOver(Sender: TBaseVirtualTree; Source: TObject; Shift: TShiftState; State: TDragState; Pt: TPoint; Mode: TDropMode;
      var Effect: Integer; var Accept: Boolean);
    procedure headerTreeDblClick(Sender: TObject);
    procedure ButtonedEdit1Change(Sender: TObject);
    procedure ButtonedEdit1RightButtonClick(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure ButtonedEdit1LeftButtonClick(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure PasteSuffixesClick(Sender: TObject);
    procedure CutSuffixesClick(Sender: TObject);
    procedure ComboBox2Exit(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure pasteTagClick(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure ListBoxKw_YClick(Sender: TObject);
    procedure ListBoxKw_NClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure setTemplate(id: Integer);
    procedure MenurulesSaveCustomSelected1Click(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure AdvancedMode1Click(Sender: TObject);
    procedure headerTreeChecked(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure Button16Click(Sender: TObject);
    procedure Templates1Click(Sender: TObject);
    procedure CombofbBankChange(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure pasteFeedback1Click(Sender: TObject);
    procedure headerTreeAdvancedHeaderDraw(Sender: TVTHeader; var PaintInfo: THeaderPaintInfo; const Elements: THeaderPaintElements);
    procedure headerTreeHeaderDrawQueryElements(Sender: TVTHeader; var PaintInfo: THeaderPaintInfo; var Elements: THeaderPaintElements);
  protected
    procedure WMDropFiles(var Msg: TMessage); message WM_DROPFILES;
  private
    lTemplateList: tstringlist;
    menulist: tstringlist;
    postProcessOpts: string;
    bLockedUpdate: Boolean;
    bFirstTime: Boolean;
    procedure updateRule(bForceNewName: Boolean = false);
    procedure ClearRule;
    procedure assignCurrentTB(tb: tBatcherRules);
    function getTbNode(tb: tBatcherRules): PVirtualNode;
    Procedure createRule;
    Procedure showRules(tb: tBatcherRules);
    procedure clearBatcherList(bAddDefault: Boolean; bfeedback: Boolean = true);
    Procedure SaveRules(bSelected: Boolean);
    Procedure SaveRulesEx(filename: string; bSelected: Boolean);
    procedure builddefaultRules;
    procedure setHeaderFont;
    function createRuleNode(var Node: PVirtualNode): tBatcherRules;
    Function getHeaderWidth(hw: Integer; s: string): Integer;
    procedure actualiseSearch(rs: rHeaderSearch);
    Procedure generateTag(t: tstrings; bUseTag: Boolean; header: string = '');
    procedure generatecomboSpecial(t: TComboBox);
    procedure generateAllTags;
    procedure addDefaultTemplate;
    procedure EditedData(b: Boolean);
  public
    rName: sHeaderSig;
    fName: sHeaderSig;
    ruleListLoaded: Boolean;
    doMcM: Boolean;
    currentFile: string;
    currentTB: tBatcherRules;
    bEditedData: Boolean;
    procedure lockRule;
    procedure LoadDefaultRules;
    procedure generateTemplate(cb: TComboBox);
    Procedure LoadRules(filename: string; bClear: Boolean = true);
    procedure loadCustomRules(bClear: Boolean);
  end;

var
  FormKeyWord: TFormKeyWord;

Const
  RulesFileDefault = 'defaultRules_Text.txt';
  defaulttemplate = 'defaultTemplate';
  mcmRecName = '*MCM';
  currentMasterVersion = 3;

implementation

uses TESVT_main, TESVT_preProcessingOpts, TESVT_Templates;
{$R *.dfm}

function getEdidFromList(lb: TListBox): string;
var
  l: tstringlist;
  i: Integer;
  tmpString: string;
begin
  Result := '';
  for i := 0 to lb.items.count - 1 do
    if lb.selected[i] then
    begin
      tmpString := lb.items[i];
      l := tstringlist.create;
      l.Delimiter := '|';
      l.QuoteChar := '"';
      l.DelimitedText := tmpString;
      // ---------
      if (l.count > 1) and ((l[0] = 'edid') or (l[0] = 'ekwd')) then
        Result := l[1];
      // ---------
      l.free;
      break;
    end;
end;

function getEdidLabelFromList(lb: TListBox): string;
var
  l: tstringlist;
  i: Integer;
  tmpString: string;
begin
  Result := '';
  for i := 0 to lb.items.count - 1 do
    if lb.selected[i] then
    begin
      tmpString := lb.items[i];
      l := tstringlist.create;
      l.Delimiter := '|';
      l.QuoteChar := '"';
      l.DelimitedText := tmpString;
      // ---------
      if (l.count > 1) and ((l[0] = 'form') or (l[0] = 'for+')) then
        Result := l[1];
      // ---------
      l.free;
      break;
    end;
end;

procedure TFormKeyWord.EditedData(b: Boolean);
const
  tagEdited: array [0 .. 1] of string = (' ', '*');
begin
  bEditedData := b;
  caption := getRes('hProcessorForm') + ' [' + currentFile + ']' + tagEdited[ord(bEditedData)];
end;

procedure TFormKeyWord.addDefaultTemplate;
begin
  if lTemplateList.count = 0 then
  begin
    lTemplateList.add(defaulttemplate + ',*');
    generateTemplate(ComboBox1);
  end;
end;

procedure TFormKeyWord.generateTemplate(cb: TComboBox);
var
  i, Index: Integer;
  template: string;
begin
  if lTemplateList.count = 0 then
    lTemplateList.add(defaulttemplate + ',*');
  cb.clear;
  for i := 0 to pred(lTemplateList.count) do
  begin
    template := lTemplateList[i];
    index := pos(',', template);
    if (index > 1) then
      template := copy(template, 1, index - 1);
    cb.items.add(template);
  end;
  cb.itemIndex := 0;
end;

procedure TFormKeyWord.generateAllTags;
begin
  generateTag(ComboBox4.items, false);
  ComboBox4.items.insert(0, '');
  generateTag(ComboBox2.items, true);
  generatecomboSpecial(ComboBox3);
end;

procedure TFormKeyWord.setTemplate(id: Integer);
var
  Node: PVirtualNode;
  Data: pTreeHeaderData;
  tb: tBatcherRules;
  t: tstringlist;
  i, Index: Integer;
  template: string;
  isdefault: Boolean;
begin
  t := tstringlist.create;
  if (id < 0) or (id > lTemplateList.count - 1) then
    isdefault := true
  else
  begin
    addDefaultTemplate;
    t.sorted := true;
    t.Duplicates := dupIgnore;
    t.Delimiter := ',';
    template := ansilowercase(lTemplateList[id]);
    index := pos(',', template);
    if (index > 0) and (length(template) > index) then
      template := copy(template, index + 1, maxInt);
    t.DelimitedText := template;
    isdefault := (t.count > 0) and (t[0] = '*');
  end;

  Node := headerTree.getFirst;
  while assigned(Node) do
  begin
    Data := headerTree.getNodedata(Node);
    tb := Data.BasicND;
    tb.bDynamicFallback := false; // reset
    tb.bDynamicDisable := false; // reset
    if not(isdefault) then
    begin
      if t.find('!' + ansilowercase(tb.tagID), i) then // fallback
        tb.bDynamicFallback := true
      else if not t.find(ansilowercase(tb.tagID), i) then // disable
        tb.bDynamicDisable := true;
    end;
    Node := headerTree.getnext(Node);
  end;
  t.free;
end;

procedure TFormKeyWord.generatecomboSpecial(t: TComboBox);
var
  i: Integer;
begin
  generateTag(t.items, true, '#');
  for i := 0 to high(defaultComboSpecial) do
    t.items.add(defaultComboSpecial[i]);
  t.items.insert(0, '');
end;

procedure TFormKeyWord.builddefaultRules;
var
  searchResult: TSearchRec;
  mItem: TMenuItem;
  i: Integer;
begin
  LoadDefault1.clear;
  menulist.clear;
  i := 0;
  if FindFirst(mainpath + CURRENT_GAME_SUBFOLDER + HeaderProcessorFolder + '*.txt', faAnyFile, searchResult) = 0 then
    repeat
      mItem := TMenuItem.create(self);
      mItem.name := 'lDefault' + inttostr(i);
      mItem.OnClick := menuOnClick;
      mItem.ImageIndex := 67;
      mItem.caption := extractfilename(searchResult.name);
      menulist.add(extractfilename(searchResult.name));
      mItem.tag := i;
      LoadDefault1.add(mItem);
      inc(i);
    until FindNext(searchResult) <> 0;
  FindClose(searchResult);
  LoadDefault1.Enabled := LoadDefault1.count > 0;
end;

procedure TFormKeyWord.menuOnClick(Sender: TObject);
var
  id: Integer;
  filename: string;
begin
  id := TMenuItem(Sender).tag;
  filename := menulist[id];
  if not FileExists(mainpath + CURRENT_GAME_SUBFOLDER + HeaderProcessorFolder + filename) then
    exit;
  LoadRules(mainpath + CURRENT_GAME_SUBFOLDER + HeaderProcessorFolder + filename);
end;

procedure TFormKeyWord.MenurulesSaveCustomSelected1Click(Sender: TObject);
begin
  if askDialog(getRes('fbk_Confirm_save_sel'), self, [askYes, askNo]) = mrYes then
    SaveRules(true);
end;

procedure TFormKeyWord.pasteFeedback1Click(Sender: TObject);
var
  Node: PVirtualNode;
  Data: pTreeHeaderData;
  tb: tBatcherRules;
  i: Integer;
  fb: Boolean;
  fbBank: Integer;
const
  fbCut = 'fb:noBank';
begin
  form21 := tform21.create(self);
  form21.caption := getRes('FallBack');
  form21.ComboBox1.items.add(fbCut);
  for i := 0 to $F do
    form21.ComboBox1.items.add(format('fb:%x', [i]));
  form21.ComboBox1.itemIndex := 0;
  form21.ComboBox1.style := csdropdownlist;
  form21.showmodal;

  if form21.newtag <> '' then
  begin
    fb := form21.newtag <> fbCut;
    fbBank := strtointdef('$' + copy(form21.newtag, 4, 1), 0);

    Node := headerTree.getFirst;
    while assigned(Node) do
    begin
      if headerTree.selected[Node] then
      begin
        Data := headerTree.getNodedata(Node);
        tb := Data.BasicND;
        tb.bFallback := fb;
        tb.fallbackbank := fbBank;
        tb.UpdateRuleEx;
      end;
      Node := headerTree.getnext(Node);
    end;
    headerTree.Repaint;
    form21.free;
  end;
end;

procedure TFormKeyWord.PasteSuffixesClick(Sender: TObject);
var
  Node: PVirtualNode;
  Data: pTreeHeaderData;
  tb: tBatcherRules;
begin
  Node := headerTree.getFirst;
  while assigned(Node) do
  begin
    if headerTree.selected[Node] then
    begin
      Data := headerTree.getNodedata(Node);
      tb := Data.BasicND;
      tb.UpdateSuffixeOpts(Clipboard.AsText, true);
    end;
    Node := headerTree.getnext(Node);
  end;
  headerTreeDblClick(headerTree);
  headerTree.Repaint;
end;

procedure TFormKeyWord.pasteTagClick(Sender: TObject);
var
  Node: PVirtualNode;
  Data: pTreeHeaderData;
  tb: tBatcherRules;

begin
  form21 := tform21.create(self);
  generateTag(form21.ComboBox1.items, true);
  form21.showmodal;

  if form21.newtag <> '' then
  begin

    Node := headerTree.getFirst;
    while assigned(Node) do
    begin
      if headerTree.selected[Node] then
      begin
        Data := headerTree.getNodedata(Node);
        tb := Data.BasicND;
        tb.tagID := form21.newtag;
        tb.UpdateRuleEx;
      end;
      Node := headerTree.getnext(Node);
    end;
    headerTree.Repaint;
    generateAllTags;
    form21.free;
  end;
end;

procedure TFormKeyWord.CutSuffixesClick(Sender: TObject);
var
  Node: PVirtualNode;
  Data: pTreeHeaderData;
  tb: tBatcherRules;
begin
  if assigned(currentTB) then
  begin
    Node := headerTree.getFirst;
    while assigned(Node) do
    begin
      if headerTree.selected[Node] then
      begin
        Data := headerTree.getNodedata(Node);
        tb := Data.BasicND;
        tb.UpdateSuffixeOpts('', false);
      end;
      Node := headerTree.getnext(Node);
    end;
  end;
  headerTreeDblClick(headerTree);
  headerTree.Repaint;
end;

procedure TFormKeyWord.WMDropFiles(var Msg: TMessage);
var
  DropH: THandle;
  DroppedFileCount: Integer;
  FileNameLength: Integer;
  filename: string;
begin
  inherited;
  DropH := Msg.wParam;
  try
    DroppedFileCount := DragQueryFile(DropH, $FFFFFFFF, nil, 0);

    if DroppedFileCount > 0 then
    begin
      FileNameLength := DragQueryFile(DropH, 0, nil, 0);
      SetLength(filename, FileNameLength);
      DragQueryFile(DropH, 0, PChar(filename), FileNameLength + 1);
      LoadRules(filename, true);
    end;

  finally
    DragFinish(DropH);

  end;
  Msg.Result := 0;
end;

procedure TFormKeyWord.AdvancedMode1Click(Sender: TObject);
begin

  bHeaderAdvanced := not bHeaderAdvanced;
  AdvancedMode1.checked := bHeaderAdvanced;
end;

procedure TFormKeyWord.AppendCustom1Click(Sender: TObject);
begin
  if askDialog(getRes('fbk_Confirm_insert'), self, [askYes, askNo]) = mrYes then
    loadCustomRules(false);
end;

procedure TFormKeyWord.Button10Click(Sender: TObject);
begin
  form1.ApplyBatcher(ComboBox1.itemIndex);
end;

procedure TFormKeyWord.Button11Click(Sender: TObject);
begin
  FontDialog1.Font.name := HeaderComponentFont;
  if FontDialog1.Execute then
  begin
    HeaderComponentFont := FontDialog1.Font.name;
    setHeaderFont;
    headerTree.Repaint;
  end;
end;

procedure TFormKeyWord.Button12Click(Sender: TObject);
var
  tb: tBatcherRules;
  i, j: Integer;
  l: tstringlist;
  bChanged: Boolean;
  Data: pTreeHeaderData;
  Node: PVirtualNode;
begin
  l := tstringlist.create;
  l.sorted := true;
  l.Duplicates := dupIgnore;
  bChanged := false;
  Node := headerTree.getFirst;
  While assigned(Node) do
  begin
    Data := headerTree.getNodedata(Node);
    tb := Data.BasicND;
    l.add(tb.header);
    Node := headerTree.getnext(Node);
  end;

  FormhList := tFormhList.create(self);

  FormhList.stringGrid1.rowcount := l.count;
  for i := 0 to pred(l.count) do
    FormhList.stringGrid1.cells[0, i] := l[i];

  if FormhList.stringGrid1.rowcount > 1 then
    FormhList.stringGrid1.Selection := tgridrect(Rect(1, 0, 1, 0));

  FormhList.showmodal;
  headerTree.beginupdate;
  if FormhList.ModalResult = mrOK then
  begin
    for j := 0 to pred(FormhList.stringGrid1.rowcount) do
      if (FormhList.stringGrid1.cells[1, j] <> '') and (FormhList.stringGrid1.cells[0, j] <> FormhList.stringGrid1.cells[1, j]) then
      begin
        Node := headerTree.getFirst;
        While assigned(Node) do
        begin
          Data := headerTree.getNodedata(Node);
          tb := Data.BasicND;
          if tb.header = FormhList.stringGrid1.cells[0, j] then
          begin
            tb.UpdateHeader(FormhList.stringGrid1.cells[1, j]);
            bChanged := true;
          end;
          Node := headerTree.getnext(Node);
        end;
      end;
  end;
  headerTree.endupdate;
  l.free;
  FormhList.free;
  if bChanged then
    EditedData(true);
end;

procedure TFormKeyWord.Button1Click(Sender: TObject);
begin
  close;
end;

procedure TFormKeyWord.assignCurrentTB(tb: tBatcherRules);
begin
  currentTB := tb;
  headerTree.Repaint;
end;

procedure TFormKeyWord.Button2Click(Sender: TObject);
begin
  ClearRule;
  updateRule;
end;

procedure TFormKeyWord.ClearRule;
begin
  bLockedUpdate := true;
  ListBoxKw_N.clear;
  ListBoxKw_Y.clear;
  CheckBox1.checked := false;
  CheckBox2.checked := false;
  CheckBox3.checked := false;
  CheckBox6.checked := false;
  CheckBox7.checked := false;
  CheckBox8.checked := false;
  CheckBox9.checked := false;
  CombofbBank.itemIndex := 0;
  ComboBox2.text := defaultTagID;
  Edit2.text := '';
  Edit3.text := '';
  postProcessOpts := defaultprocessorSuffixeOptions[CURRENT_GAME_ID];
  bLockedUpdate := false;

end;

procedure TFormKeyWord.Close1Click(Sender: TObject);
begin
  close;
end;

procedure TFormKeyWord.ComboBox2Change(Sender: TObject);
begin
  updateRule;
end;

procedure TFormKeyWord.ComboBox2Exit(Sender: TObject);
begin
  generateAllTags;
end;

procedure TFormKeyWord.CombofbBankChange(Sender: TObject);
begin
  updateRule;
end;

procedure TFormKeyWord.lockRule;
var
  bAllow: Boolean;
begin
  bAllow := assigned(currentTB) and assigned(getTbNode(currentTB));
  ListBoxKw_N.Enabled := bAllow;
  ListBoxKw_Y.Enabled := bAllow;
  CheckBox1.Enabled := bAllow;
  CheckBox2.Enabled := bAllow;
  CheckBox3.Enabled := bAllow;
  CheckBox6.Enabled := bAllow;
  CheckBox7.Enabled := bAllow;
  CheckBox8.Enabled := bAllow;
  ComboBox2.Enabled := bAllow;
  Button13.Enabled := bAllow;
  Edit1.Enabled := bAllow;
  Edit2.Enabled := bAllow;
  Edit3.Enabled := bAllow;
end;

procedure TFormKeyWord.Button3Click(Sender: TObject);
begin
  ClearRule;
  createRule;
end;

procedure TFormKeyWord.Button4Click(Sender: TObject);
begin
  deleteListEntry(ListBoxKw_Y);
  updateRule;
end;

procedure TFormKeyWord.Button5Click(Sender: TObject);
begin
  deleteListEntry(ListBoxKw_N);
  updateRule;
end;

procedure TFormKeyWord.Button6Click(Sender: TObject);
begin
  headerTree.DeleteSelectedNodes;
  EditedData(true);
  assignCurrentTB(nil);
end;

procedure TFormKeyWord.Button7Click(Sender: TObject);
var
  tb: tBatcherRules;
begin
  if not assigned(currentTB) then
    exit;
  tb := currentTB;
  ClearRule;
  createRule;
  currentTB.updateRule(tb.rName, //
    tb.fName, //
    tb.suffixeOpts.text, //
    tb.ruleKeyWord[0].text, //
    tb.ruleKeyWord[1].text, //
    tb.header, //
    tb.tagID, //
    tb.regexString, //
    tb.bNoKw, //
    tb.bAnyKw, //
    tb.bHasComponent, //
    tb.bPreProcess, //
    tb.bFullReplace, //
    tb.bIncludeOr, tb.bFallback, tb.fallbackbank);
  showRules(currentTB);
  headerTree.Repaint;
end;

procedure TFormKeyWord.headerTreeAdvancedHeaderDraw(Sender: TVTHeader; var PaintInfo: THeaderPaintInfo; const Elements: THeaderPaintElements);
begin
  TreeAdvancedHeaderDraw(Sender, PaintInfo, Elements);
end;

procedure TFormKeyWord.headerTreeBeforeCellPaint(Sender: TBaseVirtualTree; TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex;
  CellPaintMode: TVTCellPaintMode; CellRect: TRect; var ContentRect: TRect);
const
  selMargin = 5;
begin
  TargetCanvas.Brush.color := clHighlight;
  if (Node = Sender.focusedNode) then
    TargetCanvas.FrameRect(CellRect);

  if (Sender.selected[Node]) then
  begin
    if Column = 0 then
    begin
      dec(CellRect.right, TVirtualStringTree(Sender).header.Columns[Column].Width - selMargin);
      TargetCanvas.FillRect(CellRect);
    end
    else
    begin
      inc(CellRect.left, TVirtualStringTree(Sender).header.Columns[Column].Width - selMargin);
      TargetCanvas.FillRect(CellRect);
    end;
  end;
end;

procedure TFormKeyWord.headerTreeChecked(Sender: TBaseVirtualTree; Node: PVirtualNode);
begin
  EditedData(true);
end;

procedure TFormKeyWord.headerTreeDblClick(Sender: TObject);
var
  Node: PVirtualNode;
  Data: pTreeHeaderData;
begin
  Node := headerTree.focusedNode;
  if assigned(Node) then
  begin
    Data := headerTree.getNodedata(Node);
    assignCurrentTB(Data.BasicND);
    showRules(currentTB);
  end;
end;

procedure TFormKeyWord.headerTreeDragAllowed(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; var Allowed: Boolean);
begin
  Allowed := true;
end;

procedure TFormKeyWord.headerTreeDragDrop(Sender: TBaseVirtualTree; Source: TObject; DataObject: IDataObject; Formats: TFormatArray; Shift: TShiftState;
  Pt: TPoint; var Effect: Integer; Mode: TDropMode);
var
  pSource, pTarget: PVirtualNode;
  attMode: TVTNodeAttachMode;
begin
  pSource := Sender.focusedNode;
  pTarget := Sender.DropTargetNode;

  case Mode of
    dmNowhere: attMode := amNoWhere;
    dmAbove: attMode := amInsertBefore;
  else attMode := amInsertAfter;
  end;
  Sender.MoveTo(pSource, pTarget, attMode, false);
end;

procedure TFormKeyWord.headerTreeDragOver(Sender: TBaseVirtualTree; Source: TObject; Shift: TShiftState; State: TDragState; Pt: TPoint; Mode: TDropMode;
  var Effect: Integer; var Accept: Boolean);
begin
  Accept := Source = Sender;
end;

procedure TFormKeyWord.headerTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
Var
  Data: pTreeHeaderData;
begin
  Data := Sender.getNodedata(Node);
  Data.BasicND.destroy;
end;

procedure TFormKeyWord.headerTreeGetImageIndex(Sender: TBaseVirtualTree; Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: Boolean;
  var ImageIndex: TImageIndex);
var
  Data: pTreeHeaderData;
begin
  if not((Kind = ikNormal) or (Kind = ikSelected)) then
    exit;
  Data := Sender.getNodedata(Node);
  case Column of
    0:
      if not(Data.BasicND.bAuth) then
        ImageIndex := 77;
    1:
      if (Data.BasicND = currentTB) then
        ImageIndex := 23;
  end;

end;

procedure TFormKeyWord.headerTreeGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
var
  Data: pTreeHeaderData;
begin
  Data := Sender.getNodedata(Node);
  if Column = 0 then
    CellText := Data.BasicND.header
  else
    CellText := Data.BasicND.title
end;

procedure TFormKeyWord.headerTreeHeaderDrawQueryElements(Sender: TVTHeader; var PaintInfo: THeaderPaintInfo; var Elements: THeaderPaintElements);
begin
  Elements := [hpeBackground];
end;

procedure TFormKeyWord.headerTreeInitNode(Sender: TBaseVirtualTree; ParentNode, Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
begin
  Node.CheckType := ctCheckBox;
end;

procedure TFormKeyWord.headerTreePaintText(Sender: TBaseVirtualTree; const TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex;
  TextType: TVSTTextType);
begin
  if Column = 0 then
  begin
    TargetCanvas.Font.name := HeaderComponentFont;
    TargetCanvas.Font.Size := 12;
  end
  else
  begin
    TargetCanvas.Font.name := virtualTreeFixedFont;
    TargetCanvas.Font.Size := 8;
  end;
end;

function TFormKeyWord.getTbNode(tb: tBatcherRules): PVirtualNode;
var
  Node: PVirtualNode;
  Data: pTreeHeaderData;
begin
  Result := nil;
  if assigned(currentTB) then
  begin
    Node := headerTree.getFirst;
    while assigned(Node) do
    begin
      Data := headerTree.getNodedata(Node);
      if Data.BasicND = tb then
        exit(Node);
      Node := headerTree.getnext(Node);
    end;
  end;
end;

function stringToSig(s: string): sHeaderSig;
var
  i: Integer;
begin
  s := ansiuppercase(s);
  Result := ALL_REC;
  for i := 1 to length(s) do
  begin
    Result[i - 1] := ansichar(s[i]);
    if i = 4 then
      break;
  end;
end;

procedure TFormKeyWord.updateRule(bForceNewName: Boolean = false);
var
  tmpRName, tmpFName: sHeaderSig;
begin
  if bLockedUpdate then
    exit;
  if assigned(currentTB) and assigned(getTbNode(currentTB)) then
  begin
    if (rName = ALL_REC) or (fName = ALL_REC) then
    begin
      dofeedback(getRes('fb_needRecordRef2'), true);
      exit;
    end;
    if bForceNewName then
    begin
      tmpRName := stringToSig(EditRname.text);
      tmpFName := stringToSig(EditFname.text);
    end
    else
    begin
      tmpRName := currentTB.rName;
      tmpFName := currentTB.fName;
    end;

    currentTB.updateRule(tmpRName, tmpFName, postProcessOpts, ListBoxKw_Y.items.text, ListBoxKw_N.items.text, Edit1.text, ComboBox2.text, Edit4.text,CheckBox1.checked,
      CheckBox2.checked, CheckBox3.checked, CheckBox6.checked, CheckBox7.checked, CheckBox8.checked, CheckBox9.checked, CombofbBank.itemIndex);

    EditRname.text := string(currentTB.rName);
    EditFname.text := string(currentTB.fName);
    headerTree.Repaint;
    EditedData(true);
  end
  else
  begin
    assignCurrentTB(nil);
    dofeedback(getRes('fb_NoRuleEdited'), true);
  end;
end;

procedure TFormKeyWord.Button8Click(Sender: TObject);
var
  Node, NewNode: PVirtualNode;
begin
  Node := headerTree.focusedNode;
  if assigned(Node) then
  begin
    NewNode := headerTree.getnextvisible(Node);
    if assigned(NewNode) then
    begin
      headerTree.MoveTo(Node, NewNode, amInsertAfter, false);
      EditedData(true);
    end;
  end;
end;

procedure TFormKeyWord.Button9Click(Sender: TObject);
var
  Node, NewNode: PVirtualNode;
begin
  Node := headerTree.focusedNode;
  if assigned(Node) then
  begin
    NewNode := headerTree.getpreviousvisible(Node);
    if assigned(NewNode) then
    begin
      headerTree.MoveTo(Node, NewNode, amInsertBefore, false);
      EditedData(true);
    end;
  end;
end;

procedure TFormKeyWord.Edit1Change(Sender: TObject);
begin
  updateRule;
end;

procedure TFormKeyWord.Edit2RightButtonClick(Sender: TObject);
begin
  Edit2.text := '';
end;

procedure TFormKeyWord.Edit3RightButtonClick(Sender: TObject);
begin
  Edit3.text := '';
end;

procedure TFormKeyWord.LoadDefaultRules;
begin
  if bFirstTime then
  begin
    bFirstTime := false;
    if hProcessorDefault = 0 then
    begin
      if FileExists(mainpath + CURRENT_GAME_SUBFOLDER + HeaderProcessorFolder + RulesFileDefault) then
        LoadRules(mainpath + CURRENT_GAME_SUBFOLDER + HeaderProcessorFolder + RulesFileDefault)
    end
    else if hProcessorDefault = 1 then
    begin
      if (hProcessorLastCustom <> '') and FileExists(hProcessorLastCustom) then
        LoadRules(hProcessorLastCustom);
    end;
  end;
end;

procedure TFormKeyWord.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  bFirstTime := true;
  EditedData(false);
  init_caption(self);
  headerTree.NodeDataSize := SizeOf(rTreeHeaderData);
  AdvancedMode1.checked := bHeaderAdvanced;
  DragAcceptFiles(Handle, true);
  rName := ALL_REC;
  fName := ALL_REC;
  for i := 0 to pred(Options1.count) do
    with Options1.items[i] as TMenuItem do
    begin
      if tag = hProcessorDefault then
        checked := true;
    end;
  ruleListLoaded := false;
  doMcM := false;
  menulist := tstringlist.create;
  builddefaultRules;
  lTemplateList := tstringlist.create;
  addDefaultTemplate;
  // font      HeaderComponentFont
  setHeaderFont;
  ComboBox4.Font.name := virtualTreeFixedFont;
  ButtonedEdit3.Font.name := virtualTreeFixedFont;
  ButtonedEdit4.Font.name := virtualTreeFixedFont;
  ComboBox3.Font.name := virtualTreeFixedFont;
  ComboBox1.Font.name := virtualTreeFixedFont;
  ComboBox2.Font.name := virtualTreeFixedFont;
  // init defaultPath
  LoadRules(mainpath + CURRENT_GAME_SUBFOLDER + HeaderProcessorFolder);
  // init customPath
  ForceDirectories(mainpath + CURRENT_PREFS_SUBFOLDER + customPath);
  assignCurrentTB(nil);
  postProcessOpts := defaultprocessorSuffixeOptions[CURRENT_GAME_ID];
  bLockedUpdate := false;
end;

procedure TFormKeyWord.setHeaderFont;
begin
  Edit1.Font.name := HeaderComponentFont;
  ButtonedEdit2.Font.name := HeaderComponentFont;
end;

procedure TFormKeyWord.FormDestroy(Sender: TObject);
begin
  clearBatcherList(false, false);
  menulist.free;
  lTemplateList.free;
end;

procedure TFormKeyWord.FormShow(Sender: TObject);
begin
  Button10.Enabled := TESVTSameLanguage;
end;

procedure TFormKeyWord.ListBox1Click(Sender: TObject);
begin
  Edit2.text := getEdidLabelFromList(ListBox1);
end;

procedure TFormKeyWord.ListBox1DrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
  icon: Integer;
  tag: string;
begin
  tag := copy((Control as TListBox).items[Index], 1, 4);
  if tag = 'form' then
    icon := 68
  else if tag = 'kwd_' then
    icon := 23
  else if tag = 'kwd+' then
    icon := 25
  else if tag = 'c___' then
    icon := 67
  else if tag = 'for+' then
    icon := 69
  else if tag = 'edid' then
    icon := 36
  else if tag = 'ekwd' then
    icon := 37
  else
    icon := 73;
  ListBoxDrawItem(Control, Index, Rect, State, ListBox1.color, form1.ImageList1, icon)
end;

procedure TFormKeyWord.ListBoxKw_NDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := (Source is TListBox) and (TListBox(Source).name <> TListBox(Sender).name);
end;

procedure TFormKeyWord.ListBoxKw_YClick(Sender: TObject);
begin
  Edit2.text := getEdidFromList(ListBoxKw_Y);
end;

procedure TFormKeyWord.ListBoxKw_NClick(Sender: TObject);
begin
  Edit3.text := getEdidFromList(ListBoxKw_N);
end;

procedure TFormKeyWord.ListBoxKw_YDragDrop(Sender, Source: TObject; X, Y: Integer);
var
  i: Integer;
  CursorPos: TPoint;
  Index: Integer;
  List: tstringlist;
  bDelete: Boolean;
begin
  List := tstringlist.create;
  try
    bDelete := (TListBox(Source) <> ListBox1);

    with TListBox(Source) do
    begin
      for i := 0 to items.count - 1 do
        if selected[i] then
          List.add(items[i]);
      if bDelete then
        for i := items.count - 1 downto 0 do
          if selected[i] then
            items.delete(i);
    end;
    CursorPos := Point(X, Y);
    with TListBox(Sender) do
    begin
      Index := ItemAtPos(CursorPos, true);
      for i := List.count - 1 downto 0 do
        if Index > -1 then
          items.insert(Index, List[i])
        else
          items.add(List[List.count - 1 - i]);
    end;
  finally
    List.free;
    updateRule;
  end;
end;

procedure TFormKeyWord.clearBatcherList(bAddDefault: Boolean; bfeedback: Boolean = true);
begin
  headerTree.clear;
  lTemplateList.clear;
  ruleListLoaded := false;
  doMcM := false;
  ComboBox1.clear;
  if bAddDefault then
    addDefaultTemplate;
  ClearRule;
  assignCurrentTB(nil);
  currentFile := '';
  if bfeedback then
    EditedData(false);
end;

function TFormKeyWord.createRuleNode(var Node: PVirtualNode): tBatcherRules;
var
  Data: pTreeHeaderData;
begin
  if Node = nil then
    Node := headerTree.AddChild(nil, tBatcherRules.init)
  else
    Node := headerTree.InsertNode(Node, amInsertAfter, tBatcherRules.init);
  Data := headerTree.getNodedata(Node);
  headerTree.CheckState[Node] := csCheckedNormal;
  headerTree.focusedNode := Node;
  Result := Data.BasicND;
end;

Procedure TFormKeyWord.createRule;
var
  tb: tBatcherRules;
  Node: PVirtualNode;
begin
  if (rName = ALL_REC) or (fName = ALL_REC) then
  begin
    dofeedback(getRes('fb_needRecordRef2'), true);
    exit;
  end;
  Node := headerTree.focusedNode;
  tb := createRuleNode(Node);
  tb.updateRule(rName, fName, postProcessOpts, ListBoxKw_Y.items.text, ListBoxKw_N.items.text, Edit1.text, ComboBox2.text, Edit4.text, CheckBox1.checked,
    CheckBox2.checked, CheckBox3.checked, CheckBox6.checked, CheckBox7.checked, CheckBox8.checked, CheckBox9.checked, CombofbBank.itemIndex);
  assignCurrentTB(tb);
end;

Procedure TFormKeyWord.showRules(tb: tBatcherRules);
begin
  bLockedUpdate := true;
  rName := tb.rName;
  fName := tb.fName;

  EditRname.text := string(sHeaderString(tb.rName));
  EditFname.text := string(sHeaderString(tb.fName));

  ListBoxKw_Y.items.text := tb.ruleKeyWord[0].text;
  ListBoxKw_N.items.text := tb.ruleKeyWord[1].text;
  Edit1.text := tb.header;
  ComboBox2.text := tb.tagID;
  CheckBox1.checked := tb.bNoKw;
  CheckBox2.checked := tb.bAnyKw;
  CheckBox3.checked := tb.bHasComponent;
  CheckBox6.checked := tb.bPreProcess;
  CheckBox7.checked := tb.bFullReplace;
  CheckBox8.checked := tb.bIncludeOr;
  CheckBox9.checked := tb.bFallback;
  Edit4.text := tb.regexString;
  CombofbBank.itemIndex := tb.fallbackbank;
  postProcessOpts := UpdateOptions(tb.suffixeOpts.text);
  bLockedUpdate := false;
end;

procedure TFormKeyWord.Templates1Click(Sender: TObject);
begin
  addDefaultTemplate;
  form22 := tform22.create(self);
  form22.templateList := lTemplateList;
  generateTag(form22.taglist, true);
  if form22.showmodal = mrOK then
  begin
    generateTemplate(ComboBox1);
    EditedData(true);
  end;
  form22.free;
end;

procedure TFormKeyWord.rulesSaveCustom1Click(Sender: TObject);
begin
  SaveRules(false);
end;

procedure TFormKeyWord.SaveRules(bSelected: Boolean);
var
  filename, filepath, tmpSave: string;
begin
  if hProcessorLastCustom <> '' then
    filename := hProcessorLastCustom
  else
    filename := mainpath + CURRENT_PREFS_SUBFOLDER + customPath;

  filename := extractfilename(filename);
  filepath := ExtractFilePath(filename);

  if not directoryexists(filepath) then
  begin
    ForceDirectories(mainpath + CURRENT_PREFS_SUBFOLDER + customPath);
    filepath := mainpath + CURRENT_PREFS_SUBFOLDER + customPath;
  end;

  tmpSave := SaveFileDialog(getRes('Dia_SaveProcessor'), filepath, filename, 'txt|*.txt', '.txt');
  if tmpSave <> '' then
  begin
    if not bSelected then
    begin
      hProcessorLastCustom := tmpSave;
      currentFile := extractfilename(tmpSave);
    end;
    SaveRulesEx(tmpSave, bSelected);
  end;
end;

Procedure TFormKeyWord.generateTag(t: tstrings; bUseTag: Boolean; header: string = '');
var
  tb: tBatcherRules;
  i: Integer;
  Node: PVirtualNode;
  Data: pTreeHeaderData;
  ts: tstringlist;
begin
  ts := tstringlist.create;
  ts.sorted := true;
  ts.Duplicates := dupIgnore;
  Node := headerTree.getFirst;
  While assigned(Node) do
  begin
    Data := headerTree.getNodedata(Node);
    tb := Data.BasicND;
    if bUseTag then
      ts.add(tb.tagID)
    else
      ts.add(string(tb.rName));
    Node := headerTree.getnext(Node);
  end;

  t.clear;
  for i := 0 to pred(ts.count) do
    t.add(header + ts[i]);
  ts.free;
end;

Procedure TFormKeyWord.SaveRulesEx(filename: string; bSelected: Boolean);
var
  tb: tBatcherRules;
  lSave: tstringlist;
  taglist: tstringlist;
  j: Integer;
  Node: PVirtualNode;
  Data: pTreeHeaderData;
  i: Integer;
begin
  if headerTree.TotalCount = 0 then
  begin
    dofeedback(getRes('fbk_RuleListEmpty'), true);
    exit;
  end;
  lockForm(self, false);

  taglist := tstringlist.create;
  generateTag(taglist, true);

  lSave := tstringlist.create;
  try
    lSave.add('#Do Not Edit');
    lSave.add('[version=3]');
    lSave.add('[StartHeader]');
    for i := 0 to pred(taglist.count) do
      lSave.add(#9 + format('Tag_%d=%s', [i, taglist[i]]));
    for i := 0 to pred(lTemplateList.count) do
      lSave.add(#9 + format('Template_%d=%s', [i, lTemplateList[i]]));
    lSave.add('[EndHeader]');

    Node := headerTree.getFirst;
    While assigned(Node) do
    begin

      if bSelected and not headerTree.selected[Node] then
      begin
        Node := headerTree.getnext(Node);
        continue;
      end;

      Data := headerTree.getNodedata(Node);
      tb := Data.BasicND;

      lSave.add('[StartRule]');
      lSave.add(#9 + 'Header=' + tb.header);
      lSave.add(#9 + 'rSig=' + string(sHeaderString(tb.rName)));
      lSave.add(#9 + 'fSig=' + string(sHeaderString(tb.fName)));
      lSave.add(#9 + 'enabled=' + booltostr(headerTree.CheckState[Node] = csCheckedNormal));
      lSave.add(#9 + 'tagID=' + tb.tagID);
      lSave.add(#9 + 'noKW=' + booltostr(tb.bNoKw));
      lSave.add(#9 + 'anyKW=' + booltostr(tb.bAnyKw));
      lSave.add(#9 + 'hasCompo=' + booltostr(tb.bHasComponent));
      lSave.add(#9 + 'preProcess=' + booltostr(tb.bPreProcess));
      lSave.add(#9 + 'fullReplace=' + booltostr(tb.bFullReplace));
      lSave.add(#9 + 'includeOR=' + booltostr(tb.bIncludeOr));
      lSave.add(#9 + 'isFallBack=' + booltostr(tb.bFallback));
      lSave.add(#9 + 'fallbackBank=' + inttostr(tb.fallbackbank));
      lSave.add(#9 + 'regex=' + tb.regexString);

      if tb.bPreProcess then
        for j := 0 to pred(tb.suffixeOpts.count) do
        begin
          if j > 20 then
            break;
          lSave.add(#9 + format('SuffixeOpts_%d="%s"', [j, tb.suffixeOpts[j]]));
        end;

      for j := 0 to pred(tb.ruleKeyWord[0].count) do
      begin
        if j > 255 then
          break;
        lSave.add(#9 + format('Include_%d=%s', [j, tb.ruleKeyWord[0][j]]));
      end;
      for j := 0 to pred(tb.ruleKeyWord[1].count) do
      begin
        if j > 255 then
          break;
        lSave.add(format(#9 + 'Exclude_%d=%s', [j, tb.ruleKeyWord[1][j]]));
      end;
      lSave.add('[EndRule]');
      lSave.add('');

      Node := headerTree.getnext(Node);
    end;
    if secureSavetStringList(lSave, filename) then
      dofeedback(formatRes('RulesSaved%s', [filename]), true);
  finally
    lSave.free;
    taglist.free;
    lockForm(self, true);
    if not bSelected then
      EditedData(false);
  end;
end;

procedure TFormKeyWord.LoadCustom1Click(Sender: TObject);
begin
  loadCustomRules(true);
end;

procedure TFormKeyWord.loadCustomRules(bClear: Boolean);
var
  filename: string;
begin
  filename := OpenFileDialog(getRes('Dia_loadprocessor'), mainpath + CURRENT_PREFS_SUBFOLDER + customPath, '', 'txt|*.txt');
  if (filename = '') then
    exit;
  if not FileExists(filename) then
  begin
    dofeedback(getRes('FileNotFound'), true);
    exit;
  end;
  LoadRules(filename, bClear);
end;

procedure TFormKeyWord.LoadDefaultAtStart1Click(Sender: TObject);
var
  i: Integer;
begin
  TMenuItem(Sender).checked := true;
  for i := 0 to 2 do
    if ((Sender as TMenuItem).tag = i) and (Sender as TMenuItem).checked then
      hProcessorDefault := i;
end;

Function TFormKeyWord.getHeaderWidth(hw: Integer; s: string): Integer;
var
  w: Integer;
begin
  canvas.Font.name := HeaderComponentFont;
  canvas.Font.Size := 12;
  w := canvas.TextWidth(s);
  if w > hw then
    Result := w
  else
    Result := hw;
end;

Procedure TFormKeyWord.LoadRules(filename: string; bClear: Boolean = true);
var
  lLoad: tstringlist;
  lRule: THashedStringList;
  i, j, z: Integer;
  bOpenRule, bOpenHeader: Boolean;
  strtmp, tValue: string;
  tb: tBatcherRules;
  Node: PVirtualNode;
  hw: Integer;
  tmpEdid0, tmpEdid1: string;
  iCurrentrules: Integer;
begin
  lockForm(self, false);
  Refresh;
  if bClear then
  begin
    clearBatcherList(false);
    currentFile := extractfilename(filename);
  end
  else
    Node := headerTree.focusedNode;

  iCurrentrules := 0;
  assignCurrentTB(nil);
  ClearRule;

  hw := 0;
  lLoad := loadStringList(filename, false, 2);
  lRule := THashedStringList.create;
  lRule.StrictDelimiter := true;

  headerTree.beginupdate;
  try
    try
      bOpenRule := false;
      bOpenHeader := false;
      for i := 0 to lLoad.count - 1 do
      begin
        if pos('[version=', (lLoad[i])) > 0 then
        begin
          iCurrentrules := getHeaderProcVersion(lLoad[i]);
          if iCurrentrules > currentMasterVersion then
            raise Exception.create('wrongVersion');
        end;

        if (lLoad[i]) = '[StartHeader]' then
          bOpenHeader := true;

        if bOpenHeader and (lLoad[i] = '[EndHeader]') then
        begin
          bOpenHeader := false;
          for j := 0 to 25 do
          begin
            strtmp := format('Template_%d', [j]);
            tValue := lRule.values[strtmp];
            if (tValue <> '') and bClear then
              lTemplateList.add(tValue);
          end;
        end;

        if (lLoad[i]) = '[StartRule]' then
          bOpenRule := true;
        if bOpenRule and (lLoad[i] = '[EndRule]') then
        begin
          bOpenRule := false;

          if bClear then
            Node := nil;

          tb := createRuleNode(Node);
          // ----------------------
          tb.header := lRule.values['Header'];
          tb.iVersion := iCurrentrules;
          try
            strtmp := (lRule.values['rSig']);
            for z := 0 to 3 do
              tb.rName[z] := ansichar(strtmp[z + 1]);
            strtmp := (lRule.values['fSig']);
            for z := 0 to 3 do
              tb.fName[z] := ansichar(strtmp[z + 1]);
          finally
          end;

          if not strtobooldef(lRule.values['enabled'], true) then
            headerTree.CheckState[Node] := csUnCheckedNormal;
          tmpEdid0 := ansilowercase(lRule.values['inEdid']);
          tmpEdid1 := ansilowercase(lRule.values['exEdid']);
          if tmpEdid0 <> '' then
            tb.ruleKeyWord[0].add('edid|' + tmpEdid0);
          if tmpEdid1 <> '' then
            tb.ruleKeyWord[1].add('edid|' + tmpEdid1);
          tb.bNoKw := strtobooldef(lRule.values['noKW'], false);
          tb.bHasComponent := strtobooldef(lRule.values['hasCompo'], false);
          tb.bAnyKw := strtobooldef(lRule.values['anyKW'], false);
          tb.bPreProcess := strtobooldef(lRule.values['preProcess'], false);
          tb.bFullReplace := strtobooldef(lRule.values['fullReplace'], false);
          tb.bIncludeOr := strtobooldef(lRule.values['includeOR'], false);
          tb.bFallback := strtobooldef(lRule.values['isFallBack'], false);
          tb.fallbackbank := strtointdef(lRule.values['fallbackBank'], 0);
          tb.tagID := lRule.values['tagID'];
          tb.regexString := lRule.values['regex'];

          if tb.bPreProcess then
            for j := 0 to 20 do
            begin
              strtmp := format('SuffixeOpts_%d', [j]);
              tValue := lRule.values[strtmp];
              if tValue <> '' then
                tb.suffixeOpts.add(copy(tValue, 2, length(tValue) - 2));
            end;

          for j := 0 to 255 do
          begin
            strtmp := format('Include_%d', [j]);
            tValue := lRule.values[strtmp];
            if tValue <> '' then
              tb.ruleKeyWord[0].add(tValue);
          end;

          for j := 0 to 255 do
          begin
            strtmp := format('Exclude_%d', [j]);
            tValue := lRule.values[strtmp];
            if tValue <> '' then
              tb.ruleKeyWord[1].add(tValue);
          end;
          // ----------------------
          tb.UpdateRuleEx;
          if tb.rName = mcmRecName then
            doMcM := true;

          lRule.clear;
          hw := getHeaderWidth(hw, tb.header);
        end;
        if bOpenRule or bOpenHeader then
          lRule.add(trimleft(lLoad[i]));
      end;
    except
      On E: Exception do
      begin
        if E.Message <> 'wrongVersion' then
          dofeedback(E.Message, true)
        else
          dofeedback(getRes('Fbk_needupdate'), true);
      end;
    end;
  finally
    headerTree.header.Columns[0].Width := hw + 50;
    headerTree.endupdate;
    ruleListLoaded := headerTree.RootNodeCount > 0;
    generateAllTags;
    generateTemplate(ComboBox1);
    lRule.free;
    lLoad.free;
    lockForm(self, true);
    EditedData(not bClear);
  end;
end;

procedure TFormKeyWord.rulesClearList1Click(Sender: TObject);
begin
  clearBatcherList(true);
end;

procedure TFormKeyWord.ButtonedEdit1Change(Sender: TObject);
var
  rs: rHeaderSearch;
begin
  rs.header := ButtonedEdit2.text;
  rs.rName := ansilowercase(ComboBox4.text);
  rs.include := ansilowercase(ButtonedEdit3.text);
  rs.exclude := ansilowercase(ButtonedEdit4.text);
  rs.special := ansilowercase(ComboBox3.text);
  actualiseSearch(rs);
end;

procedure TFormKeyWord.ButtonedEdit1LeftButtonClick(Sender: TObject);
begin
  ButtonedEdit1Change(nil);
end;

procedure TFormKeyWord.ButtonedEdit1RightButtonClick(Sender: TObject);
begin
  TButtonedEdit(Sender).text := '';
end;

procedure TFormKeyWord.CheckBox6Click(Sender: TObject);
begin
  updateRule;
end;

procedure TFormKeyWord.actualiseSearch(rs: rHeaderSearch);
var
  Node: PVirtualNode;
  Data: pTreeHeaderData;
  tb: tBatcherRules;
begin

  Node := headerTree.getFirst;
  headerTree.beginupdate;
  While assigned(Node) do
  begin
    Data := headerTree.getNodedata(Node);
    tb := Data.BasicND;
    headerTree.isvisible[Node] := tb.matchSearch(rs);
    Node := headerTree.getnext(Node);
  end;
  headerTree.endupdate;
end;

procedure TFormKeyWord.Button13Click(Sender: TObject);
begin
  form20 := tform20.create(self);
  form20.ValueListEditor1.Strings.text := postProcessOpts;
  form20.showmodal;
  if form20.ModalResult = mrOK then
  begin
    postProcessOpts := form20.ValueListEditor1.Strings.text;
    updateRule;
  end;
  form20.free;
end;

procedure addEdidToList(l: TListBox; edid: string);
begin
  edid := trim(ansilowercase(edid));
  if edid <> '' then
    l.items.add('edid|' + edid)
end;

procedure addEKwdToList(l: TListBox; edid: string);
begin
  edid := trim(ansilowercase(edid));
  if edid <> '' then
    l.items.add('ekwd|' + edid)
end;

procedure TFormKeyWord.Button14Click(Sender: TObject);
begin
  addEdidToList(ListBoxKw_Y, Edit2.text);
  updateRule;
  Edit2.text := '';
end;

procedure TFormKeyWord.Button15Click(Sender: TObject);
begin
  addEdidToList(ListBoxKw_N, Edit3.text);
  updateRule;
  Edit3.text := '';
end;

procedure TFormKeyWord.Button17Click(Sender: TObject);
begin
  addEKwdToList(ListBoxKw_Y, Edit2.text);
  updateRule;
  Edit2.text := '';
end;

procedure TFormKeyWord.Button18Click(Sender: TObject);
begin
  addEKwdToList(ListBoxKw_N, Edit3.text);
  updateRule;
  Edit3.text := '';
end;

procedure TFormKeyWord.Button16Click(Sender: TObject);
begin
  updateRule(true);
end;

end.
