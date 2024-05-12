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
unit TESVT_search;

interface

uses Windows, Messages, SysUtils, Classes, Controls, Forms, Graphics, math, Dialogs, VirtualTrees, StdCtrls, ExtCtrls, Menus, ComCtrls,
  ComObj, Generics.Collections, Diff, richedit, Grids, SynEdit, SynEditTypes, SynEditMiscClasses, SynEditSearch, TESVT_sharedVTProc, TESVT_FastSearch,
  TESVT_espDefinition, TESVT_HeuristicSearch, TESVT_typedef, TESVT_Const, TESVT_fstreamSave, ToolWin, TESVT_SearchText, SynEditKeyCmds, TESVT_Ressources,
  TESVT_SpellCheck, TESVT_TranslateFunc, TESVT_Undo, TESVT_MainLoader, TESVT_spOptions, TESVT_Fuz, TESVT_bsa, shellApi, MMSYSTEM, Clipbrd, TESVT_Utils,
  TESVT_StringsStatus, TESVT_TranslatorApi, ActnList, TESVT_NPCMap, System.Actions, System.UITypes, TESVT_RegexUtils;

type

  TRichEdit = class(ComCtrls.TRichEdit)
  protected
    procedure WMPaint(var Message: TWMPaint); message WM_PAINT;
  end;

  TAliasData = class
  public
    sSource, sDest: String;
    cSource, cDest: tcolor;
    constructor create(s1, s2: string; c1, c2: integer);
  end;

  TCompareData = class
  public
    s: String;
    warning: boolean;
    constructor create(s: string; warning: boolean);
  end;

  rTreeGenericData = record
    BasicND: Pointer;
  end;

  pTreeGenericData = ^rTreeGenericData;

  TForm2 = class(TForm)
    Splitter2: TSplitter;
    PopupMenu1: TPopupMenu;
    Restore1: TMenuItem;
    PopupMenu2: TPopupMenu;
    Usethistranslation1: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    searchTree: TVirtualStringTree;
    RichEdit3: TRichEdit;
    PopupMenu3: TPopupMenu;
    InvertSourceDest1: TMenuItem;
    TabSheet3: TTabSheet;
    Panel6: TPanel;
    SynEditSearch1: TSynEditSearch;
    ShowSpecialChar1: TMenuItem;
    N1: TMenuItem;
    AliasTree: TVirtualStringTree;
    TabSheet4: TTabSheet;
    esprecordTree: TVirtualStringTree;
    ValidethisTranslation1: TMenuItem;
    TabSheet5: TTabSheet;
    espCompareTree: TVirtualStringTree;
    Panel1: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Splitter1: TSplitter;
    Panel5: TPanel;
    Panel7: TPanel;
    Memo1: TSynEdit;
    Panel8: TPanel;
    Button2: TButton;
    Button1: TButton;
    FontDialog1: TFontDialog;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    Panel9: TPanel;
    Memo2: TSynEdit;
    ListBox1: TListBox;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    Timer1: TTimer;
    Panel2: TPanel;
    Panel10: TPanel;
    ToolBar2: TToolBar;
    ToolButton3: TToolButton;
    ToolButton8: TToolButton;
    Panel11: TPanel;
    Edit1: TButtonedEdit;
    Splitter3: TSplitter;
    Memo3: TSynEdit;
    TabSheet6: TTabSheet;
    DialogTree: TVirtualStringTree;
    Label1: TLabel;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    Timer2: TTimer;
    N2: TMenuItem;
    ToolButton12: TToolButton;
    N3: TMenuItem;
    IgnoreMenu: TMenuItem;
    Panel12: TPanel;
    Edit4: TEdit;
    Panel13: TPanel;
    ComboBox1: TComboBox;
    Panel14: TPanel;
    ToolBar3: TToolBar;
    ToolButton9: TToolButton;
    ToolButton13: TToolButton;
    Zoom1: TMenuItem;
    Zoom2: TMenuItem;
    ZoomDefault1: TMenuItem;
    MenuDisplay1: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    Splitter4: TSplitter;
    PopupMenu4: TPopupMenu;
    MenuValidate31: TMenuItem;
    MenuPartial21: TMenuItem;
    MenuLocked1: TMenuItem;
    MenuCancel21: TMenuItem;
    MenuFixAlias21: TMenuItem;
    MenuFixNumber1: TMenuItem;
    MenuPartial22: TMenuItem;
    MenuLocked2: TMenuItem;
    N4: TMenuItem;
    MenuColab1: TMenuItem;
    MenuColabReset1: TMenuItem;
    PopupMenu5: TPopupMenu;
    MenuColab2: TMenuItem;
    MenuColabReset2: TMenuItem;
    ToolButton14: TToolButton;
    Menu_CopySource: TMenuItem;
    Timer3: TTimer;
    Panel16: TPanel;
    ActionList1: TActionList;
    launchTranslation: TAction;
    Panel17: TPanel;
    ComboBox2: TComboBox;
    Button3: TButton;
    Panel18: TPanel;
    Label3: TLabel;
    Panel15: TPanel;
    ListBox2: TListBox;
    ListBox3: TListBox;
    Splitter5: TSplitter;
    MenuCopy1: TMenuItem;
    MenuPaste1: TMenuItem;
    Memo4: TRichEdit;
    Memo5: TRichEdit;
    Timer4: TTimer;
    Timer5: TTimer;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    SynCopy: TMenuItem;
    N7: TMenuItem;
    SynPaste: TMenuItem;
    Panel19: TPanel;
    ConfirmChange: TCheckBox;
    Panel20: TPanel;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    Panel21: TPanel;
    Edit3: TEdit;
    Panel22: TPanel;
    Edit2: TEdit;
    ComboBox3: TComboBox;
    procedure spSuggestionOnClick(Sender: TObject);
    procedure searchTreeGetText(Sender: TBaseVirtualTree; Node: pvirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
    procedure searchTreeFreeNode(Sender: TBaseVirtualTree; Node: pvirtualNode);
    procedure Button1Click(Sender: TObject);
    procedure searchTreeHeaderClick(Sender: TVTHeader; HitInfo: TVTHeaderHitInfo);
    procedure searchTreeCompareNodes(Sender: TBaseVirtualTree; Node1, Node2: pvirtualNode; Column: TColumnIndex; var Result: integer);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure searchTreeInitNode(Sender: TBaseVirtualTree; ParentNode, Node: pvirtualNode; var InitialStates: TVirtualNodeInitStates);
    procedure searchTreeBeforeCellPaint(Sender: TBaseVirtualTree; TargetCanvas: TCanvas; Node: pvirtualNode; Column: TColumnIndex; CellPaintMode: TVTCellPaintMode; CellRect: TRect;
      var ContentRect: TRect);
    procedure Button2Click(Sender: TObject);
    procedure Restore1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Usethistranslation1Click(Sender: TObject);
    procedure InvertSourceDest1Click(Sender: TObject);
    procedure Edit1RightButtonClick(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, Arow: integer; Rect: TRect; State: TGridDrawState);
    procedure memo1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
    procedure Memo2MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
    procedure ShowSpecialChar1Click(Sender: TObject);
    procedure Memo2GutterClick(Sender: TObject; Button: TMouseButton; X, Y, Line: integer; Mark: TSynEditMark);
    procedure Memo1GutterClick(Sender: TObject; Button: TMouseButton; X, Y, Line: integer; Mark: TSynEditMark);
    procedure ListBox1Click(Sender: TObject);
    procedure ListBox1DrawItem(Control: TWinControl; Index: integer; Rect: TRect; State: TOwnerDrawState);
    procedure AliasTreeFreeNode(Sender: TBaseVirtualTree; Node: pvirtualNode);
    procedure AliasTreeGetText(Sender: TBaseVirtualTree; Node: pvirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
    procedure AliasTreeBeforeCellPaint(Sender: TBaseVirtualTree; TargetCanvas: TCanvas; Node: pvirtualNode; Column: TColumnIndex; CellPaintMode: TVTCellPaintMode; CellRect: TRect;
      var ContentRect: TRect);
    procedure AliasTreeMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
    procedure esprecordTreeDblClick(Sender: TObject);
    procedure esprecordTreeBeforeCellPaint(Sender: TBaseVirtualTree; TargetCanvas: TCanvas; Node: pvirtualNode; Column: TColumnIndex; CellPaintMode: TVTCellPaintMode; CellRect: TRect;
      var ContentRect: TRect);
    procedure searchTreePaintText(Sender: TBaseVirtualTree; const TargetCanvas: TCanvas; Node: pvirtualNode; Column: TColumnIndex; TextType: TVSTTextType);
    procedure esprecordTreeGetImageIndex(Sender: TBaseVirtualTree; Node: pvirtualNode; kind: TVTImageKind; Column: TColumnIndex; var Ghosted: boolean; var ImageIndex: TImageIndex);
    procedure ValidethisTranslation1Click(Sender: TObject);
    procedure espCompareTreeFreeNode(Sender: TBaseVirtualTree; Node: pvirtualNode);
    procedure espCompareTreeGetText(Sender: TBaseVirtualTree; Node: pvirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure getWinSize;
    procedure espCompareTreeGetImageIndex(Sender: TBaseVirtualTree; Node: pvirtualNode; kind: TVTImageKind; Column: TColumnIndex; var Ghosted: boolean; var ImageIndex: TImageIndex);
    procedure espCompareTreeDblClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure searchTreeFocusChanged(Sender: TBaseVirtualTree; Node: pvirtualNode; Column: TColumnIndex);
    procedure PageControl1Change(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure searchTreeMouseMove(Sender: TObject; Shift: TShiftState; X, Y: integer);
    procedure Memo2GutterGetText(Sender: TObject; aLine: integer; var aText: string);
    procedure esprecordTreeGetText(Sender: TBaseVirtualTree; Node: pvirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
    procedure ToolButton11Click(Sender: TObject);
    procedure Memo2PaintTransient(Sender: TObject; Canvas: TCanvas; TransientType: TTransientType);
    procedure FormDestroy(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Memo2Change(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure ToolButton12Click(Sender: TObject);
    procedure IgnoreMenuClick(Sender: TObject);
    procedure DialogTreeFocusChanged(Sender: TBaseVirtualTree; Node: pvirtualNode; Column: TColumnIndex);
    procedure ToolButton9Click(Sender: TObject);
    procedure ToolButton13Click(Sender: TObject);
    procedure esprecordTreeDrawText(Sender: TBaseVirtualTree; TargetCanvas: TCanvas; Node: pvirtualNode; Column: TColumnIndex; const Text: string; const CellRect: TRect; var DefaultDraw: boolean);
    procedure Zoom1Click(Sender: TObject);
    procedure ListBox2DrawItem(Control: TWinControl; Index: integer; Rect: TRect; State: TOwnerDrawState);
    procedure ListBox2DblClick(Sender: TObject);
    procedure MenuValidate31Click(Sender: TObject);
    procedure MenuCancel21Click(Sender: TObject);
    procedure MenuPartial21Click(Sender: TObject);
    procedure MenuLocked1Click(Sender: TObject);
    procedure MenuFixAlias21Click(Sender: TObject);
    procedure MenuFixNumber1Click(Sender: TObject);
    procedure MenuPartial22Click(Sender: TObject);
    procedure MenuLocked2Click(Sender: TObject);
    procedure MenuColab1Click(Sender: TObject);
    procedure MenuColab2Click(Sender: TObject);
    procedure ToolButton14MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
    procedure Menu_CopySourceClick(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure Memo2StatusChange(Sender: TObject; Changes: TSynStatusChanges);
    procedure Button3Click(Sender: TObject);
    procedure launchTranslationExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Panel18MouseEnter(Sender: TObject);
    procedure Panel18MouseLeave(Sender: TObject);
    procedure Panel18Click(Sender: TObject);
    procedure ComboBox3DrawItem(Control: TWinControl; Index: integer; Rect: TRect; State: TOwnerDrawState);
    procedure ListBox3DrawItem(Control: TWinControl; Index: integer; Rect: TRect; State: TOwnerDrawState);
    procedure MenuCopy1Click(Sender: TObject);
    procedure MenuPaste1Click(Sender: TObject);
    procedure ConfirmChangeClick(Sender: TObject);
    procedure Edit1LeftButtonClick(Sender: TObject);
    procedure Memo4Change(Sender: TObject);
    procedure Memo4SelectionChange(Sender: TObject);
    procedure Timer4Timer(Sender: TObject);
    procedure Timer5Timer(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ToolButton15Click(Sender: TObject);
    procedure ToolButton16Click(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure esprecordTreeAdvancedHeaderDraw(Sender: TVTHeader; var PaintInfo: THeaderPaintInfo; const Elements: THeaderPaintElements);
    procedure esprecordTreeHeaderDrawQueryElements(Sender: TVTHeader; var PaintInfo: THeaderPaintInfo; var Elements: THeaderPaintElements);
    procedure SynCopyClick(Sender: TObject);
    procedure SynPasteClick(Sender: TObject);
    procedure PopupMenu4Popup(Sender: TObject);
    function FormHelp(Command: Word; Data: NativeInt; var CallHelp: boolean): boolean;
  private
    espLoader: tEspLoader;
    espTree: TVirtualStringTree;
    currentEspRecord: trecord;
    CurrentMaxStringLength: integer;
    CurrentCRState: boolean;
    ssearchHistory: string;
    ssearchText: string;
    ssearchMemo: TSynEdit;
    authMemoDrawSpellCheck: boolean;
    authRefreshSpellCheck: boolean;
    backupOriginalSourceString: string;
    spReplaceCurrent: string;
    spReplaceCurrentScw: TscWord;
    OldQustId, OldDialId: cardinal;
    iApiDrawIcon: integer;
    bDrawSPUnderline: boolean;
    bSearchInProgress: boolean;
    currentDestCodepage: rcodepage;
    currentDialogTextLabel: string;
    bIsDropDownOpen: boolean;
    procedure sanitizeCombobox(c: TComboBox);
    function getTextforApi(var bReplaceAll: boolean): string;
    procedure updateApiTranslatedText(s: string; bReplaceAll: boolean);
    procedure StartApiTranslation(apiId: integer);
    procedure lockApiStuff(lock: boolean; i: integer);
    procedure poweredBy(s, h: string);
    procedure poweredByEnd;
    function getCurrentTree: TVirtualStringTree;
    procedure resetSpellCheck;
    procedure CheckMaxLength;
    procedure dosearchinText(opt: TSynSearchOptions; s: string; sMemo: TSynEdit; bResult: boolean = true);
    procedure startCommand(Command: Word);
    procedure updateSynFont;
    procedure updateFieldEdit(next: boolean);
    procedure setEspFocusedNode(sk: tskystr);
    procedure setEspFocusedNodeEx(tree: TVirtualStringTree; sk: tskystr);
    function getEspFocusedNode(tree: TVirtualStringTree; sk: tskystr): pvirtualNode;
    procedure spellCheck;
    procedure clearspMenu;
    procedure buildspMenu;
    Function assignEspLoader: boolean;
    procedure FinalyzeSpellCheckUpdate;
    procedure SwitchAutoDial(sk: tskystr);
    function GetEditedText(m1: TSynEdit; m2: TRichEdit): string;
    function GetSelText(m1: TSynEdit; m2: TRichEdit): string;
    procedure SetEditedText(m1: TSynEdit; m2: TRichEdit; s: String; bforceChange: boolean = false);
    procedure SetEditedSelText(m1: TSynEdit; m2: TRichEdit; s: String; bforceChange: boolean = false);
    procedure SetMemoFocus(m1: TSynEdit; m2: TRichEdit);
    procedure SetMemoSelText(m1: TSynEdit; m2: TRichEdit);
    procedure search;
    procedure getDiff(OriginalSourceString: string = '');
    procedure ListBoxKeyClick(id: integer);
    procedure executeSearchAction(aMemo: TSynEdit);
    procedure CheckAlias;
    procedure getEspData(bGetDialog: boolean);
    procedure getDialogData(r: trecord; fselect: tfield; DirectQuestId: cardinal = 0);
    procedure GetSceneFromMaster(const qustID: cardinal);
    function getCurrentDial(qustID: cardinal; currentDialRec: trecord; bIsTest: boolean = false): boolean;
    function getDialFromScene(qustID: cardinal; r: trecord; bIsTest: boolean = false): boolean;
    function getEspRecSharedID(tree: TVirtualStringTree; sk: tskystr): boolean;
    procedure assignDialogNode(r: trecord; fselect: tfield);
    procedure espcompareResultList;
    procedure getfieldMatch(f1: tfield; r: trecord);
    procedure getWordMatchCelltext(itext: string; startText: integer = 0);
    procedure GetStringWords(s: string);
    procedure AddCharToMemo(c: string; kind: TChangeKind);
    procedure searchEx(s: string);
    procedure repaintMemo(m1: TSynEdit; m2: TRichEdit);
    function GetFocusedMemo: TSynEdit;
    procedure SynCommand(co: TSynEditorCommand);
    procedure setWinSize;
    procedure toggleComboBoxKwList(bforceclose: boolean = false);
    procedure updateDialogFeedback(sk: tskystr);
    // function Search_And_Replace(richedit: TRichEdit; SearchText, ReplaceText: string): boolean;
  public
    procedure editNewString(bGetDialog: boolean; const newstring: string = '');
    procedure updateStringFromQuest(r: trecord; qustID: cardinal);
    procedure valideStringChange(forceValid: boolean; confirm, autotrim: boolean; statusIn: sStrParams);
  end;

var
  Form2: TForm2;
  timeOut: integer;

implementation

uses SynHighlighterSample, TESVT_main;
{$R *.dfm}

procedure TForm2.repaintMemo(m1: TSynEdit; m2: TRichEdit);
begin
  if not bUseSimpleMemo then
    m1.repaint
  else
    m2.repaint;
end;

function TForm2.GetEditedText(m1: TSynEdit; m2: TRichEdit): string;
begin
  if not bUseSimpleMemo then
    Result := m1.Text
  else
    Result := m2.Text;
end;

function TForm2.GetSelText(m1: TSynEdit; m2: TRichEdit): string;
begin
  if not bUseSimpleMemo then
    Result := m1.seltext
  else
    Result := m2.seltext;
end;

procedure TForm2.SetEditedText(m1: TSynEdit; m2: TRichEdit; s: String; bforceChange: boolean = false);
begin
  if not bUseSimpleMemo then
  begin
    m1.Text := s;
    if bforceChange then
      m1.OnChange(m1);
  end
  else
  begin
    m2.Text := s;
    if bforceChange then
      m2.OnChange(m2);
  end;
end;

procedure TForm2.SetEditedSelText(m1: TSynEdit; m2: TRichEdit; s: String; bforceChange: boolean = false);
begin
  if not bUseSimpleMemo then
  begin
    m1.seltext := s;
    if bforceChange then
      m1.OnChange(m1);
  end
  else
  begin
    m2.seltext := s;
    if bforceChange then
      m2.OnChange(m2);
  end;
end;

procedure TForm2.SetMemoFocus(m1: TSynEdit; m2: TRichEdit);
begin
  if not bUseSimpleMemo then
    m1.setFocus
  else
    m2.setFocus
end;

procedure TForm2.SetMemoSelText(m1: TSynEdit; m2: TRichEdit);
var
  selSize: integer;
begin
  // if bBidiBase = bdLeftToRight then
  if not bUseSimpleMemo then
  begin
    if m1.Lines.count > 0 then
    begin
      selSize := length(m1.Lines[0]);
      m1.SelStart := 0;
      m1.SelEnd := selSize;
    end;
  end
  else
  begin
    if m2.Lines.count > 0 then
    begin
      selSize := length(m2.Lines[0]);
      m2.SelStart := 0;
      m2.Sellength := selSize;
    end;
  end;
end;

constructor TAliasData.create(s1, s2: string; c1, c2: integer);
const
  acolor: array [0 .. 3] of tcolor = (clWhite, tcolor($F0DDDD), tcolor($DDDDFF), tcolor($AAAAFF));
begin
  self.sSource := s1;
  self.sDest := s2;
  self.cSource := acolor[c1];
  self.cDest := acolor[c2];
end;

constructor TCompareData.create(s: string; warning: boolean);
begin
  self.s := s;
  self.warning := warning;
end;

procedure TForm2.AliasTreeBeforeCellPaint(Sender: TBaseVirtualTree; TargetCanvas: TCanvas; Node: pvirtualNode; Column: TColumnIndex; CellPaintMode: TVTCellPaintMode; CellRect: TRect;
  var ContentRect: TRect);
var
  Data: pTreeGenericData;
begin
  Data := Sender.GetNodeData(Node);
  case Column of
    0:
      TargetCanvas.Brush.color := gradient(TAliasData(Data.BasicND).cSource);
    1:
      TargetCanvas.Brush.color := gradient(TAliasData(Data.BasicND).cDest);
  end;
  TargetCanvas.FillRect(CellRect);
end;

procedure TForm2.AliasTreeFreeNode(Sender: TBaseVirtualTree; Node: pvirtualNode);
var
  Data: pTreeGenericData;
begin
  Data := Sender.GetNodeData(Node);
  TAliasData(Data.BasicND).Free;
end;

procedure TForm2.AliasTreeGetText(Sender: TBaseVirtualTree; Node: pvirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
var
  Data: pTreeGenericData;
begin
  Data := Sender.GetNodeData(Node);
  case Column of
    0:
      CellText := TAliasData(Data.BasicND).sSource;
    1:
      CellText := TAliasData(Data.BasicND).sDest;
  end;
end;

procedure TForm2.AliasTreeMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
var
  Data: pTreeGenericData;
  Node: pvirtualNode;
begin
  Node := AliasTree.GetNodeAt(X, Y);
  if assigned(Node) then
  begin
    Data := AliasTree.GetNodeData(Node);
    if Button = mbRight then
    begin
      getWordMatchCelltext(TAliasData(Data.BasicND).sSource, 0);
      SetMemoFocus(Memo2, Memo4);
    end;
  end;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  valideStringChange(true, false, true, [validated]);
  close;
end;

procedure TForm2.valideStringChange(forceValid: boolean; confirm, autotrim: boolean; statusIn: sStrParams);
var
  i, Index: integer;
  sk: tskystr;
begin
  if assigned(focusedNode.fString) then
  begin
    bStringAutoTrim := ToolButton10.down;
    Timer2.enabled := false;
    authMemoDrawSpellCheck := false;
    exclude(focusedNode.fString.sInternalparams, asSpellCheckFault);

    if not forceValid then
      if focusedNode.fString.STrans = GetEditedText(Memo2, Memo4) then
        Exit;

    if confirm then
      if askDialog(getRes('Ask_ConfirmStr'), Form2, [askYes, askNo]) = mrNo then
        Exit;

    mainLoader.addUndo(focusedNode.fString, 0, false);
    // ---------------------------------
    if TESVTsstCustom then
      focusedNode.fString.setSourceEdit(GetEditedText(Memo1, Memo5), autotrim and bStringAutoTrim);
    focusedNode.fString.setTransEdit(GetEditedText(Memo2, Memo4), autotrim and bStringAutoTrim);
    // --------------------------------
    focusedNode.fString.resetStatus(statusIn, true, 0);
    for i := 0 to 2 do
      treearray[i].repaint;
    esprecordTree.repaint;
    setUserCacheUpdated(mainLoader, true);

    form1.ReplaceAllStrings(focusedNode.fString, statusIn, false);

    // dynamically add the string as Cache and heuristic
    if validated in focusedNode.fString.sparams then
    begin
      sk := tskystr.init(0, 0, focusedNode.fString.s, focusedNode.fString.STrans, focusedNode.fString.listIndex, 0, [], [isCache], nil, true);
      if not addPointertoSortedList(vocabBaseList, compareallHashesAndSources, sk, index) then
        sk.Free
      else if bHeuristicListValidated and (sk.aWords.count > 0) then
        forcedPointertoSortedList(HeuristicList, compareWordCount, sk);
    end;
  end;
end;

procedure TForm2.ValidethisTranslation1Click(Sender: TObject);
begin
  valideStringChange(true, false, true, [validated]);
  updateFieldEdit(true);
end;

procedure TForm2.lockApiStuff(lock: boolean; i: integer);
begin
  if lock then
    screen.Cursor := crHourGlass
  else
    screen.Cursor := crDefault;
  Form2.enabled := not lock;
  Button1.enabled := not lock;
  Button2.enabled := not lock;
  iApiDrawIcon := i;
  repaintMemo(Memo2, Memo4);
end;

procedure TForm2.Zoom1Click(Sender: TObject);
var
  tag: integer;
begin
  tag := TMenuItem(Sender).tag;
  if tag = 0 then
    SearchSynFontSize := defaultsynfontSize
  else
    SearchSynFontSize := SearchSynFontSize + tag;
  if SearchSynFontSize < 8 then
    SearchSynFontSize := 8;
  updateSynFont;
  resetSpellCheck;
end;

procedure TForm2.search;
var
  tmpstr: string;
begin
  Timer1.enabled := false;
  if bSearchInProgress then
    Exit;

  if (PageControl1.ActivePageIndex <> 1) then
    Exit;
  searchTree.clear;
  searchTree.repaint;
  screen.Cursor := crHourGlass;
  tmpstr := AnsiLowerCase(Edit1.Text);
  if (length(tmpstr) > 2) then
    searchEx(tmpstr);
  screen.Cursor := crDefault;
end;

procedure TForm2.searchEx(s: string);
var
  i: integer;
  sk: tskystr;
  Node: pvirtualNode;
  addnode: boolean;
  currentMod: string;
begin
  bSearchInProgress := true;
  searchTree.beginupdate;
  currentMod := AnsiLowerCase(mainLoader.addon_Name);
  for i := 0 to vocabBaseList.count - 1 do
  begin
    if i mod 10000 = 0 then
      application.ProcessMessages;

    sk := vocabBaseList.Items[i];

    if ToolButton14.down then
    begin
      if AnsiLowerCase(getSearchIDName(searchTree, sk)) <> currentMod then
        continue;
    end;
    addnode := false;
    if ToolButton3.down then
    begin
      if length(s) <= length(sk.s) then
        addnode := pos(s, AnsiLowerCase(sk.s)) > 0;
    end
    else
    begin
      if length(s) <= length(sk.STrans) then
        addnode := pos(s, AnsiLowerCase(sk.STrans)) > 0;
    end;

    if addnode then
    begin
      Node := searchTree.AddChild(nil, TNodeData.create(sk));
      searchTree.NodeHeight[Node] := getHeightforCell(sk.s, getFontX(mainLoader));
    end;
  end;
  searchTree.endupdate;
  bSearchInProgress := false;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  if ConfirmChange.checked then
    valideStringChange(false, ConfirmChange.checked, false, [validated]);
  close;
end;

procedure TForm2.Edit1RightButtonClick(Sender: TObject);
begin
  Edit1.Text := '';
  search;
end;

procedure TForm2.Edit1Change(Sender: TObject);
begin
  Timer1.enabled := false;
  Timer1.enabled := true;
end;

procedure TForm2.Edit1LeftButtonClick(Sender: TObject);
begin
  search;
end;

procedure TForm2.setWinSize;
begin
  // position:
  if SearchrWindowpos.width > screen.width then
    width := screen.width
  else
    width := SearchrWindowpos.width;
  if SearchrWindowpos.height > screen.height then
    height := screen.height
  else
    height := SearchrWindowpos.height;
  top := SearchrWindowpos.top;
  left := SearchrWindowpos.left;
  if SearchrWindowpos.Control1 > SearchrWindowpos.height - 100 then
    SearchrWindowpos.Control1 := SearchrWindowpos.height - 100;
  Panel15.width := SearchrWindowpos.List2;
  ListBox3.height  := SearchrWindowpos.List3;
  Panel1.height := SearchrWindowpos.Control1;
end;

procedure TForm2.getWinSize;
var
  windata: TWindowPlacement;
begin
  windata.length := sizeof(windata);
  GetWindowPlacement(handle, @windata);
  SearchrWindowpos.width := windata.rcNormalPosition.right - windata.rcNormalPosition.left;
  SearchrWindowpos.height := windata.rcNormalPosition.bottom - windata.rcNormalPosition.top;
  SearchrWindowpos.top := windata.rcNormalPosition.top;
  SearchrWindowpos.left := windata.rcNormalPosition.left;
  SearchrWindowpos.Control1 := Panel1.height;
  SearchrWindowpos.List2 := Panel15.width;
  SearchrWindowpos.List3 := ListBox3.height;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  getWinSize;
  espCompareTree.clear;
  esprecordTree.clear;
  searchTree.clear;
  AliasTree.clear;
  DialogTree.clear;
  ListBox2.clear;
  OldQustId := 0;
  OldDialId := 0;
  CurrentMaxStringLength := 0;
  CurrentCRState := false;
  focusedNode.fString := nil;
  currentEspRecord := nil;
  TabSheet3.ImageIndex := 31;
  TabSheet5.ImageIndex := 31;
  TabSheet6.ImageIndex := 31;
  Edit3.Text := '';
  backupOriginalSourceString := '';
  try
    if form1.HandleAllocated and IsWindowVisible(form1.handle) then
      form1.setFocus;
  except
  end;
end;

procedure TForm2.FormCreate(Sender: TObject);
var
  HL: TSynSampleSyn;
begin
  bIsDropDownOpen := false;
  bSearchInProgress := false;
  iApiDrawIcon := -1;
  bDrawSPUnderline := true;
  espTree := form1.espTree;
  InitTreeOpts(searchTree, genericTreeImageList);
  InitTreeOpts(esprecordTree, genericTreeImageList);
  InitTreeOpts(DialogTree, genericTreeImageList);
  espCompareTree.NodeDataSize := sizeof(rTreeGenericData);
  AliasTree.NodeDataSize := sizeof(rTreeGenericData);
  espCompareTree.Font.Name := virtualTreeFont;
  AliasTree.Font.Name := virtualTreeFont;

  ConfirmChange.checked := bConfirmChange;
  CurrentMaxStringLength := 0;
  CurrentCRState := false;
  HL := TSynSampleSyn.create(self);
  Memo1.Highlighter := HL;
  Memo2.Highlighter := HL;
  Memo3.Highlighter := HL;

  Memo4.maxlength := MAXSIZESTRING_GLOBALCAP;
  Memo5.maxlength := MAXSIZESTRING_GLOBALCAP;
  // Memo4.DoubleBuffered:= true;

  VTtreeList.Add(searchTree);
  VTtreeList.Add(esprecordTree);
  VTtreeList.Add(DialogTree);
  VTtreeList.Add(espCompareTree);
  VTtreeList.Add(AliasTree);

  VTtreeList_Tag.Add(esprecordTree);
  VTtreeList_Tag.Add(DialogTree);
  OldQustId := 0;
  OldDialId := 0;

  // edit synedit wordsplitter: synedit unit, line 10446

  // function TCustomSynEdit.IsIdentChar(AChar: WideChar): Boolean;
  // begin
  // Result := AChar >= #33;
  // Result := Result or CharInSet(AChar, Self.AdditionalIdentChars);
  // Result := Result and not IsWordBreakChar(AChar);
  // end;

  // function isChar_WordDelimiter(c:char): boolean;
  // begin
  // case c of
  // #0..#32, '.', ',', '?', '!', ':', ';', '(', ')', '[', ']', '{', ' } ',' ° ',
  // '"', '/', '\', '|', '+', '*', '=', '%', '&', '>', '<', '¡', '¿','$', '@', '§', '#', '~','^','_',
  // #160, #8239,           // Non-breaking spaces ,
  // #8230,                    // Suspension points
  // #8216,       // Single quotes
  // #171, #187, #8220, #8221, // Double quotes
  // #8211, #8212 : result:= true;             // Dashes
  // else
  // result:= false;
  // end;
  // end;

  // function TCustomSynEdit.IsWordBreakChar(AChar: WideChar): Boolean;
  // begin
  // Result:= isChar_WordDelimiter(AChar);    //need to copy isChar_WordDelimiter from tesvt_Const
  // Result := Result or CharInSet(AChar, Self.AdditionalWordBreakChars);
  // Result := Result and not CharInSet(AChar, Self.AdditionalIdentChars);
  // end;

  currentEspRecord := nil;
  setWinSize;

  ToolButton11.down := not tesvtnoReplace;

  updateSynFont;
  init_caption(self);
  ssearchHistory := '';
  ssearchText := '';
  backupOriginalSourceString := '';
  ssearchMemo := Memo2;
  try
    SPcheck := TSpellCheck.create(iUseSpellCheckID, bUseSpellCheck, iSpParseOptions, sUseSpellCheckDic);
  except
  end;
  FinalyzeSpellCheckUpdate;
end;

procedure TForm2.FinalyzeSpellCheckUpdate;
begin
  if SPcheck.Active then
    authRefreshSpellCheck := true
  else
  begin
    authRefreshSpellCheck := false;
    authMemoDrawSpellCheck := false;
    if bUseSpellCheck then
      dofeedback(getRes('msg_SPCheckFail'), true, [askOk]);
    bUseSpellCheck := false;
  end;
end;

procedure TForm2.FormDestroy(Sender: TObject);
begin
  freeAndNil(SPcheck);
end;

function TForm2.FormHelp(Command: Word; Data: NativeInt; var CallHelp: boolean): boolean;
begin
  CallHelp := false;
  Result := false;
end;

procedure TForm2.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin

  case Key of
    VK_ESCAPE:
      Button2Click(self);
    VK_RETURN:
      begin
        if (ssCtrl in Shift) then
          Button1Click(Button1)
        else if esprecordTree.Focused then
          esprecordTreeDblClick(esprecordTree);
      end;
    38:
      if (Shift = [ssCtrl]) then // up
      begin
        valideStringChange(false, ConfirmChange.checked, false, [validated]);
        updateFieldEdit(false);
      end;
    40:
      if (Shift = [ssCtrl]) then // down
      begin
        valideStringChange(false, ConfirmChange.checked, false, [validated]);
        updateFieldEdit(true);
      end;
    49 .. 53:
      if (ssCtrl in Shift) then // ctrl 1-5
        ListBoxKeyClick(Key - 48);
    97 .. 100:
      if (ssCtrl in Shift) then // ctrl 1-5 (numpad)
        ListBoxKeyClick(Key - 96);

    119:
      begin
        ToolButton14.down := not ToolButton14.down; // f8
        search;
      end;
    122:
      if (Shift = []) then
        ToolButton9Click(nil); // f11
    123:
      toggleComboBoxKwList; // F12
  end;
end;

procedure TForm2.toggleComboBoxKwList(bforceclose: boolean = false);
begin
  if (PageControl1.ActivePageIndex <> 0) then
  begin
    bIsDropDownOpen := false;
    Exit;
  end;

  if bIsDropDownOpen or bforceclose then
  begin
    SendMessage(ComboBox3.handle, CB_SHOWDROPDOWN, 0, 0);
    bIsDropDownOpen := false;
  end
  else
  begin
    SendMessage(ComboBox3.handle, CB_SHOWDROPDOWN, 1, 0);
    bIsDropDownOpen := true;
  end;
end;

function TForm2.getEspFocusedNode(tree: TVirtualStringTree; sk: tskystr): pvirtualNode;
var
  Node: pvirtualNode;
  Data: ptreedata;
begin

  Node := tree.getfirst;
  while assigned(Node) do
  begin
    Data := tree.GetNodeData(Node);
    if Data.BasicND.s = sk then
      Exit(Node);
    Node := tree.GetNextsibling(Node);
  end;
  Result := nil;
end;

procedure TForm2.setEspFocusedNode(sk: tskystr);
begin
  setEspFocusedNodeEx(esprecordTree, sk);
  setEspFocusedNodeEx(DialogTree, sk);
end;

procedure TForm2.setEspFocusedNodeEx(tree: TVirtualStringTree; sk: tskystr);
var
  Node: pvirtualNode;
  Data: ptreedata;
begin
  tree.ClearSelection;
  Node := tree.getfirst;
  while assigned(Node) do
  begin
    Data := tree.GetNodeData(Node);
    if Data.BasicND.s = sk then
    begin

      tree.focusedNode := Node;
      tree.Selected[Node] := true;
    end;
    Node := tree.GetNextsibling(Node);
  end;
end;

procedure TForm2.SwitchAutoDial(sk: tskystr);
begin
  if PageControl1.ActivePageIndex in [0, 5] then
  begin
    if (sk.esp.rName = headerINFO) or (sk.esp.rName = headerDIAL) then
      PageControl1.ActivePageIndex := 5
    else
      PageControl1.ActivePageIndex := 0;
  end;
end;

function TForm2.GetFocusedMemo: TSynEdit;
begin
  if Memo2.Focused then
    Result := Memo2
  else if Memo1.Focused then
    Result := Memo1
  else
    Result := nil;
end;

procedure TForm2.SynCommand(co: TSynEditorCommand);
var
  memo: TSynEdit;
begin
  memo := GetFocusedMemo;
  if assigned(memo) then
    memo.CommandProcessor(co, ' ', nil);
end;

procedure TForm2.SynCopyClick(Sender: TObject);
begin
  SynCommand(ecCopy);
end;

procedure TForm2.SynPasteClick(Sender: TObject);
begin
  SynCommand(ecPaste);
end;

procedure TForm2.updateFieldEdit(next: boolean);
var
  Node, startnode: pvirtualNode;
  DataEsp: pespdata;
  Data: ptreedata;
  i, start: integer;
  r: trecord;

  function nextNode(Node: pvirtualNode; tree: TVirtualStringTree; circle: boolean): pvirtualNode;
  begin
    if next then
    begin
      Result := tree.GetNext(Node);
      if circle and not assigned(Result) then
        Result := tree.getfirst;
    end
    else
    begin
      Result := tree.GetPrevious(Node);
      if circle and not assigned(Result) then
        Result := tree.Getlast;
    end;
  end;

  function nextNodeEsp(Node: pvirtualNode; tree: TVirtualStringTree): pvirtualNode;
  begin
    if next then
    begin
      Result := tree.GetNext(Node);
      if not espLoader.validNode(Result) then
        Result := nil;
    end
    else
    begin
      Result := tree.GetPrevious(Node);
      if not espLoader.validNode(Result) then
        Result := nil;
    end;
  end;

begin
  assignEspLoader;
  if assigned(focusedNode.fString) then
  begin
    if TESVTmodEspLoaded and assigned(espLoader) then
    begin
      if (focusedNode.fString.isDialogEditing) and (bSwitchAutoDial) then
      // if PageControl1.ActivePageIndex = 5 then
      begin
        // dialog crawl
        Node := getEspFocusedNode(DialogTree, focusedNode.fString);
        Node := nextNode(Node, DialogTree, false);
        if assigned(Node) then
        begin
          Data := DialogTree.GetNodeData(Node);
          focusedNode.fString := Data.BasicND.s;
          setEspFocusedNode(focusedNode.fString);
          editNewString(false);
          Exit;
        end;
        // next DIAL
        if (ListBox2.itemindex > 0) then
        begin
          if next then
          begin
            for i := min(ListBox2.itemindex + 1, ListBox2.count - 1) to ListBox2.count - 1 do
              if assigned(ListBox2.Items.Objects[i]) and (trecord(ListBox2.Items.Objects[i]).header.Name = headerDIAL) then
              begin
                updateStringFromQuest(trecord(ListBox2.Items.Objects[i]), 0);
                break;
              end;
          end
          else
          begin
            for i := max(ListBox2.itemindex - 1, 0) downto 0 do
              if assigned(ListBox2.Items.Objects[i]) and (trecord(ListBox2.Items.Objects[i]).header.Name = headerDIAL) then
              begin
                updateStringFromQuest(trecord(ListBox2.Items.Objects[i]), 0);
                break;
              end;
          end;
        end;
      end
      else
      begin
        // >====================Regular================>
        r := trecord(focusedNode.fString.esp.rec);
        if assigned(r) then
          start := r.fList.IndexOf(tfield(focusedNode.fString.esp.field))
        else
          start := -1;
        while assigned(r) do
        begin
          // crawl inside record and pull next editable field
          if next then
          begin
            if start = -1 then
              start := 0;
            for i := start to pred(r.fList.count) do
              if (isString in tfield(r.fList[i]).Params) and (focusedNode.fString <> tfield(r.fList[i]).sk) then
              begin
                focusedNode.fString := tfield(r.fList[i]).sk;
                editNewString(true);
                setEspFocusedNode(focusedNode.fString);
                Exit;
              end;
          end
          else
          begin
            if start = -1 then
              start := pred(r.fList.count);
            for i := start downto 0 do
              if (isString in tfield(r.fList[i]).Params) and (focusedNode.fString <> tfield(r.fList[i]).sk) then
              begin
                focusedNode.fString := tfield(r.fList[i]).sk;
                editNewString(true);
                setEspFocusedNode(focusedNode.fString);
                Exit;
              end;
          end;

          // get previous/next data in VTesp ---->
          Node := r.espRec;
          Node := nextNodeEsp(Node, espTree);
          r := nil;
          start := -1;
          while espLoader.validNode(Node) do
          begin
            DataEsp := espTree.GetNodeData(Node);
            if (DataEsp.BasicND.P.sType = sRecord) and not(trecord(DataEsp.BasicND.P).rawRecord) then
            begin
              r := trecord(DataEsp.BasicND.P);
              focusedNode.editedEspNode := Node;
              break;
            end;
            Node := nextNodeEsp(Node, espTree);
          end;
          // <------------------------------------
        end; // <===============Regular=================
      end;
    end
    else
    begin
      // deprecated: support for .string only ===========>
      startnode := focusedNode.fString.pNode;
      Node := nextNode(focusedNode.fString.pNode, treearray[focusedNode.fString.listIndex], true);
      while assigned(Node) do
      begin
        if vsVisible in Node.States then
        begin
          Data := treearray[focusedNode.fString.listIndex].GetNodeData(Node);
          focusedNode.fString := Data.BasicND.s;
          editNewString(false);
          setEspFocusedNode(focusedNode.fString);
          authFocus := false;
          treearray[focusedNode.fString.listIndex].focusedNode := Node;
          authFocus := true;
          Exit;
        end;
        Node := nextNode(Node, treearray[focusedNode.fString.listIndex], true);
        if Node = startnode then
          break;
      end;
    end;
  end;
  // fallback
  if (PageControl1.ActivePageIndex = 0) then
    esprecordTree.setFocus;
end;

procedure TForm2.FormResize(Sender: TObject);
begin
  if searchTree.width + 100 > clientWidth then
    searchTree.width := clientWidth - 100;
  if Panel7.width + 100 > clientWidth then
    Panel7.width := clientWidth - 100;
  if Panel1.height + 100 > clientHeight then
    Panel1.height := clientHeight - 100;
end;

procedure TForm2.FormShow(Sender: TObject);
var
  i: integer;
begin
  setWinSize;
  apidata.enabledAPIs;
  ComboBox2.clear;

  for i := 0 to MaxApiCount do
    if apidata.apiEnabled[i] then
      ComboBox2.AddItem(apidata.urlData.values[aApiBaseName[i] + 'Label'], TObject(i));
  for i := 0 to pred(ComboBox2.Items.count) do
    if integer(ComboBox2.Items.Objects[i]) = ilastUsedApi then
      ComboBox2.itemindex := i;
  if (ComboBox2.itemindex = -1) and (ComboBox2.Items.count > 0) then
    ComboBox2.itemindex := 0;
  Button3.enabled := (ComboBox2.Items.count > 0) and (Timer4.enabled = false);
  ComboBox2.enabled := ComboBox2.Items.count > 0;

  // fuz/npc ui
  ToolButton9.enabled := isFuzLoaded(mainLoader, fuz.current);
  ToolButton13.enabled := ToolButton9.enabled;
  if not ToolButton9.enabled then
    ComboBox1.clear;
  if not isNpcLoaded(mainLoader) then
    ListBox3.clear;
  ToolButton10.down := bStringAutoTrim;
end;

procedure TForm2.editNewString(bGetDialog: boolean; const newstring: string = '');
begin
  toggleComboBoxKwList(true);
  if assigned(focusedNode.fString) then
  begin

    focusedNode.fString.initstrings(false);
    if isVMADString in focusedNode.fString.sInternalparams then
      currentDestCodepage := getcodepage('_' + Destlanguage, codepageFiles, '', 'utf8')
    else
      currentDestCodepage := getcodepage('_' + Destlanguage, codepageFiles, '', bforceCpOnSave);

    // pexnotrans support
    Memo2.readonly := pexNoTrans in focusedNode.fString.sInternalparams;
    Memo4.readonly := pexNoTrans in focusedNode.fString.sInternalparams;

    SetEditedText(Memo1, Memo5, focusedNode.fString.s);
    if newstring = '' then
      SetEditedText(Memo2, Memo4, focusedNode.fString.STrans)
    else
      SetEditedText(Memo2, Memo4, newstring);
    backupOriginalSourceString := '';

    poweredByEnd;
    getDiff;
    getEspData(bGetDialog);
    CheckAlias;
    CheckMaxLength;
    resetSpellCheck;
    espcompareResultList;

    // feedback
    updateDialogFeedback(focusedNode.fString);
    if focusedNode.fString.esp.fName <> headerNAM1 then
    begin
      ComboBox1.clear;
      ComboBox1.color := gradient(clWhite);
      Edit4.Text := '';
    end;

    if bSwitchAutoDial and focusedNode.fString.isEspAssigned then
      SwitchAutoDial(focusedNode.fString);

    self.Show;

    if TESVTsstCustom then
      SetMemoFocus(Memo1, Memo5)
    else
    begin
      SetMemoFocus(Memo2, Memo4);
      SetMemoSelText(Memo2, Memo4);
    end;
  end
  else
  begin
    Memo1.readonly := true;
    Memo2.readonly := true;
    Memo4.readonly := true;
    Memo5.readonly := true;
    Memo1.clear;
    Memo2.clear;
    Memo4.clear;
    Memo5.clear;
    self.Show;
  end;
end;

procedure TForm2.esprecordTreeAdvancedHeaderDraw(Sender: TVTHeader; var PaintInfo: THeaderPaintInfo; const Elements: THeaderPaintElements);
begin
  TreeAdvancedHeaderDraw(Sender, PaintInfo, Elements);
end;

procedure TForm2.esprecordTreeBeforeCellPaint(Sender: TBaseVirtualTree; TargetCanvas: TCanvas; Node: pvirtualNode; Column: TColumnIndex; CellPaintMode: TVTCellPaintMode; CellRect: TRect;
  var ContentRect: TRect);
begin
  TreeCellPaint(Sender, TargetCanvas, Node, Column, CellPaintMode, CellRect, ContentRect, true);
end;

procedure TForm2.esprecordTreeDblClick(Sender: TObject);
var
  Data: ptreedata;
begin
  if assigned(TVirtualStringTree(Sender).focusedNode) then
  begin
    valideStringChange(false, ConfirmChange.checked, true, [validated]);
    Data := TVirtualStringTree(Sender).GetNodeData(TVirtualStringTree(Sender).focusedNode);
    focusedNode.fString := Data.BasicND.s;
    editNewString(true);
  end;
end;

procedure TForm2.esprecordTreeDrawText(Sender: TBaseVirtualTree; TargetCanvas: TCanvas; Node: pvirtualNode; Column: TColumnIndex; const Text: string; const CellRect: TRect; var DefaultDraw: boolean);
begin
  TreeDrawText(Sender, TargetCanvas, Node, Column, Text, CellRect, DefaultDraw);
end;

procedure TForm2.esprecordTreeGetImageIndex(Sender: TBaseVirtualTree; Node: pvirtualNode; kind: TVTImageKind; Column: TColumnIndex; var Ghosted: boolean; var ImageIndex: TImageIndex);
begin
  TreeGetImageIndex(Sender, Node, kind, Column, Ghosted, ImageIndex);
end;

procedure TForm2.esprecordTreeGetText(Sender: TBaseVirtualTree; Node: pvirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
var
  Data: ptreedata;
begin
  if Column = 0 then
  begin
    Data := Sender.GetNodeData(Node);
    if (TESVTmodEspLoaded) and Data.BasicND.s.isEspAssigned then
      CellText := format('%.4s', [Data.BasicND.s.esp.fName])
    else
      CellText := format('%.5x', [Data.BasicND.s.esp.strId]);
  end
  else
    TreeGetText(Sender, Node, Column, TextType, CellText, true, true, MAXSIZESTRING_IN_TREE[ord(bVTSimpleLine)]);
end;

procedure TForm2.esprecordTreeHeaderDrawQueryElements(Sender: TVTHeader; var PaintInfo: THeaderPaintInfo; var Elements: THeaderPaintElements);
begin
  Elements := [hpeBackground];
end;

procedure TForm2.executeSearchAction(aMemo: TSynEdit);
var
  tmpstr: string;
begin
  tmpstr := aMemo.WordAtCursor;
  if (length(tmpstr) > 0) then
    GetStringWords(tmpstr);
end;

procedure TForm2.Restore1Click(Sender: TObject);
begin
  if assigned(focusedNode.fString) then
  begin
    SetEditedText(Memo2, Memo4, focusedNode.fString.STrans, true);
    getDiff;
  end;
end;

procedure TForm2.searchTreeBeforeCellPaint(Sender: TBaseVirtualTree; TargetCanvas: TCanvas; Node: pvirtualNode; Column: TColumnIndex; CellPaintMode: TVTCellPaintMode; CellRect: TRect;
  var ContentRect: TRect);
begin
  TreeCellPaint(Sender, TargetCanvas, Node, Column, CellPaintMode, CellRect, ContentRect, false);
end;

procedure TForm2.searchTreeCompareNodes(Sender: TBaseVirtualTree; Node1, Node2: pvirtualNode; Column: TColumnIndex; var Result: integer);
begin
  TreeCompareNodes(Sender, Node1, Node2, Column, false, Result, true);
end;

procedure TForm2.searchTreeFocusChanged(Sender: TBaseVirtualTree; Node: pvirtualNode; Column: TColumnIndex);
var
  Data: ptreedata;
begin
  if assigned(Node) then
  begin
    Data := Sender.GetNodeData(Node);
    case Column of
      1:
        Memo3.Text := Data.BasicND.s.s;
      2:
        Memo3.Text := Data.BasicND.s.STrans;
    end;
    dosearchinText([ssoEntireScope], Edit1.Text, Memo3, false);
  end;
end;

procedure TForm2.searchTreeFreeNode(Sender: TBaseVirtualTree; Node: pvirtualNode);
begin
  TreeFreeNode(Sender, Node);
end;

procedure TForm2.searchTreeGetText(Sender: TBaseVirtualTree; Node: pvirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
begin
  TreeGetText(Sender, Node, Column, TextType, CellText, true, true, MAXSIZESTRING_IN_TREE[ord(bVTSimpleLine)]);
end;

procedure TForm2.searchTreeHeaderClick(Sender: TVTHeader; HitInfo: TVTHeaderHitInfo);
begin
  TreeHeaderClick(Sender, HitInfo);
end;

procedure TForm2.searchTreeInitNode(Sender: TBaseVirtualTree; ParentNode, Node: pvirtualNode; var InitialStates: TVirtualNodeInitStates);
begin
  if not bVTSimpleLine then
    InitialStates := [ivsMultiline];
end;

procedure TForm2.searchTreeMouseMove(Sender: TObject; Shift: TShiftState; X, Y: integer);
begin
  TreeMouseMove(TVirtualStringTree(Sender), X, Y);
end;

procedure TForm2.searchTreePaintText(Sender: TBaseVirtualTree; const TargetCanvas: TCanvas; Node: pvirtualNode; Column: TColumnIndex; TextType: TVSTTextType);
begin
  TreePaintText(Sender, TargetCanvas, Node, Column, TextType);
end;

procedure TForm2.ShowSpecialChar1Click(Sender: TObject);
begin
  TMenuItem(Sender).checked := not TMenuItem(Sender).checked;
  if TMenuItem(Sender).checked then
  begin
    Memo1.Options := Memo1.Options + [eoShowSpecialChars];
    Memo2.Options := Memo2.Options + [eoShowSpecialChars];
    Memo3.Options := Memo2.Options + [eoShowSpecialChars];
  end
  else
  begin
    Memo1.Options := Memo1.Options - [eoShowSpecialChars];
    Memo2.Options := Memo2.Options - [eoShowSpecialChars];
    Memo3.Options := Memo2.Options - [eoShowSpecialChars];
  end;
end;

procedure TForm2.StringGrid1DrawCell(Sender: TObject; ACol, Arow: integer; Rect: TRect; State: TGridDrawState);
begin
  with TStringGrid(Sender).Canvas do
  begin
    if ACol = 0 then
      Font.style := [fsBold]
    else
      Font.style := [];
    Brush.color := gradient(clWhite);
    Font.color := clWindowText;
    FillRect(Rect);
    TextRect(Rect, Rect.left + 3, Rect.top + 2, TStringGrid(Sender).Cells[ACol, Arow]);
  end;
end;

procedure TForm2.ListBox1Click(Sender: TObject);
begin
  if ListBox1.itemindex > 0 then
    getWordMatchCelltext(ListBox1.Items[ListBox1.itemindex], 4);
  SetMemoFocus(Memo2, Memo4);
end;

procedure TForm2.ListBox1DrawItem(Control: TWinControl; Index: integer; Rect: TRect; State: TOwnerDrawState);
begin
  with (Control as TListBox).Canvas do
  begin
    FillRect(Rect);
    inc(Rect.left, 2);
    Dec(Rect.right, 2);
    if index = 0 then
      Font.style := [fsBold]
    else
      Font.style := [];
    Drawtext(handle, PChar(TListBox(Control).Items[Index]), length(TListBox(Control).Items[Index]), Rect, 0);
  end;
end;

procedure TForm2.ListBox2DrawItem(Control: TWinControl; Index: integer; Rect: TRect; State: TOwnerDrawState);
begin
  if index = 0 then
    ListBoxDrawItem(Control, Index, Rect, State, ListBox2.color, form1.ImageList1, 75)
  else if not assigned(ListBox2.Items.Objects[Index]) then
    ListBoxDrawItem(Control, Index, Rect, State, ListBox2.color, form1.ImageList1, 73)
  else
    ListBoxDrawItem(Control, Index, Rect, State, ListBox2.color, form1.ImageList1, 33)
end;

procedure TForm2.ListBox3DrawItem(Control: TWinControl; Index: integer; Rect: TRect; State: TOwnerDrawState);
begin
  if assigned(TListBox(Control).Items.Objects[index]) then
    ListBoxDrawItem(Control, Index, Rect, State, ListBox3.color, form1.ImageList1, 67)
  else
    ListBoxDrawItem(Control, Index, Rect, State, ListBox3.color, form1.ImageList1, 72)
end;

procedure TForm2.ListBoxKeyClick(id: integer);
begin
  if (id > 0) and (id < ListBox1.count) then
    getWordMatchCelltext(ListBox1.Items[id], 4);
  SetMemoFocus(Memo2, Memo4);
end;

procedure TForm2.getWordMatchCelltext(itext: string; startText: integer = 0);
var
  P: integer;
begin
  if bUseSimpleMemo then
    Exit;
  if itext <> '' then
  begin
    if startText > 0 then
      itext := Copy(itext, startText, maxint);
    P := Memo2.SelStart;
    if Memo2.Sellength > 0 then
    begin
      if Memo2.SearchReplace(Memo2.seltext, itext, [ssoReplace, ssoSelectedOnly]) > 0 then
      begin
        Memo2.SelStart := P;
        Memo2.Sellength := length(itext);
      end
      else
        Memo2.SelStart := P;
    end
    else
    begin
      Memo2.seltext := itext;
      Memo2.SelStart := P;
      Memo2.Sellength := length(itext);
    end;
  end;
end;

procedure TForm2.Usethistranslation1Click(Sender: TObject);
var
  Data: ptreedata;
begin
  if assigned(searchTree.focusedNode) then
  begin
    Data := searchTree.GetNodeData(searchTree.focusedNode);
    SetEditedText(Memo2, Memo4, Data.BasicND.s.STrans);
    SetMemoFocus(Memo2, Memo4);

    getDiff(Data.BasicND.s.s);
    CheckAlias;
    CheckMaxLength;
  end;
end;

procedure TForm2.AddCharToMemo(c: string; kind: TChangeKind);
var
  format: CHARFORMAT2;
begin
  FillChar(format, sizeof(format), 0);
  format.cbSize := sizeof(format);
  format.dwMask := CFM_BACKCOLOR;
  RichEdit3.SelStart := RichEdit3.GetTextLen;
  case kind of
    ckAdd:
      begin
        RichEdit3.SelAttributes.color := clRed;
        RichEdit3.SelAttributes.style := [fsBold, fsUnderline];
        format.crBackColor := $DDDDFF;
      end;
    ckDelete:
      begin
        RichEdit3.SelAttributes.color := clsilver;
        RichEdit3.SelAttributes.style := [fsBold, fsUnderline];
        format.crBackColor := $DDDDFF;
      end;
    ckModify:
      begin
        RichEdit3.SelAttributes.color := clblue;
        RichEdit3.SelAttributes.style := [fsBold, fsUnderline];
        format.crBackColor := $DDDDFF;
      end;
  else
    begin
      RichEdit3.SelAttributes.color := clBlack;
      RichEdit3.SelAttributes.style := [];
      format.crBackColor := clsilver;
    end;
  end;
  RichEdit3.Perform(EM_SETCHARFORMAT, SCF_SELECTION, Int64(@format));
  RichEdit3.seltext := c;
end;

procedure TForm2.getDiff(OriginalSourceString: string = '');
var
  Diff: tdiff;
  i: integer;
  s: string;
  oldkind: TChangeKind;
begin
  RichEdit3.clear;
  if not assigned(focusedNode.fString) then
    Exit;

  if OriginalSourceString = '' then
  begin
    if focusedNode.bestLDString <> '' then
    begin
      OriginalSourceString := focusedNode.bestLDString;
      focusedNode.bestLDString := '';
    end
    else
      OriginalSourceString := ifthenStr(assigned(mainLoader), mainLoader.getBestLDMatchString(focusedNode.fString), '');
  end;
  if OriginalSourceString = '' then
  begin
    RichEdit3.Text := getRes('Fbk_DiffViewer');
    Exit;
  end;

  backupOriginalSourceString := OriginalSourceString;
  RichEdit3.Lines.beginupdate;
  Diff := tdiff.create(self);
  if InvertSourceDest1.checked then
    Diff.Execute(PChar(OriginalSourceString), PChar(Memo1.Text), length(OriginalSourceString), length(Memo1.Text))
  else
    Diff.Execute(PChar(Memo1.Text), PChar(OriginalSourceString), length(Memo1.Text), length(OriginalSourceString));

  AddCharToMemo(formatRes('Fbk_Diff1', [resfileInfo[ord(InvertSourceDest1.checked)]]), ckNone);
  AddCharToMemo(formatRes('Fbk_Diff2', [Diff.DiffStats.matches]), ckNone);
  AddCharToMemo(formatRes('Fbk_Diff3', [Diff.DiffStats.modifies]), ckModify);
  AddCharToMemo(formatRes('Fbk_Diff4', [Diff.DiffStats.adds]), ckAdd);
  AddCharToMemo(formatRes('Fbk_Diff5', [Diff.DiffStats.deletes]), ckDelete);

  s := '';
  oldkind := ckNone;
  for i := 0 to Diff.count - 1 do
  begin
    if Diff.Compares[i].kind <> oldkind then
    begin
      AddCharToMemo(s, oldkind);
      s := '';
    end;
    case Diff.Compares[i].kind of
      ckNone:
        s := s + Diff.Compares[i].chr2;
      ckAdd:
        s := s + Diff.Compares[i].chr2;
      ckDelete:
        s := s + Diff.Compares[i].chr1;
      ckModify:
        s := s + Diff.Compares[i].chr2;
    end;
    oldkind := Diff.Compares[i].kind;
  end;
  if s <> '' then
    AddCharToMemo(s, oldkind);
  RichEdit3.Lines.endupdate;
  RichEdit3.SelStart := 0;
  SendMessage(RichEdit3.handle, EM_SCROLLCARET, 0, 0);
  Diff.Free;
end;

procedure TForm2.IgnoreMenuClick(Sender: TObject);
begin
  if spReplaceCurrent <> '' then
  begin
    SPcheck.AddWordToIgnoreList(spReplaceCurrent);
    resetSpellCheck;
  end;
end;

procedure TForm2.InvertSourceDest1Click(Sender: TObject);
begin
  TMenuItem(Sender).checked := not(Sender as TMenuItem).checked;
  getDiff(backupOriginalSourceString);
end;

procedure TForm2.memo1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
var
  tmpstr: string;
begin
  tmpstr := trim(TSynEdit(Sender).seltext);
  if (length(tmpstr) > 0) then
  begin
    Edit1.Text := tmpstr;
    search;
  end;
  if not bUseSimpleMemo then
    executeSearchAction(TSynEdit(Sender));
end;

procedure TForm2.Memo2Change(Sender: TObject);
begin
  poweredByEnd;
  CheckAlias;
  CheckMaxLength;
  resetSpellCheck;
end;

procedure TForm2.Memo2GutterClick(Sender: TObject; Button: TMouseButton; X, Y, Line: integer; Mark: TSynEditMark);
begin
  Memo1.GotoLineAndCenter(Line);
end;

procedure TForm2.Memo2GutterGetText(Sender: TObject; aLine: integer; var aText: string);
begin
  if (not CurrentCRState) and (aLine > 1) then
    aText := '[!]';
end;

procedure TForm2.Memo1GutterClick(Sender: TObject; Button: TMouseButton; X, Y, Line: integer; Mark: TSynEditMark);
begin
  if not bUseSimpleMemo then
    Memo2.GotoLineAndCenter(Line);
end;

procedure TForm2.Memo2MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
begin
  executeSearchAction(Memo2);
end;

procedure TForm2.PageControl1Change(Sender: TObject);
begin
  if PageControl1.ActivePageIndex = 1 then
    search;
end;

procedure TForm2.Panel18Click(Sender: TObject);
var
  link: string;
begin
  if Panel18.hint <> '' then
  begin
    link := Panel18.hint;
    ShellExecute(0, nil, @link[1], nil, nil, SW_SHOWNORMAL);
  end;
end;

procedure TForm2.Panel18MouseEnter(Sender: TObject);
begin
  screen.Cursor := crHandPoint;
end;

procedure TForm2.Panel18MouseLeave(Sender: TObject);
begin
  screen.Cursor := crDefault;
end;

procedure TForm2.CheckMaxLength;
var
  b, bCR: boolean;
  textLength: integer;
Const
  ErrorColor: array [0 .. 1] of tcolor = (clWhite, tcolor($AAAAFF));
  ErrorColorFont: array [0 .. 1] of tcolor = (clWindowText, clRed);
  ErrorCR: array [0 .. 1] of string = ('', '[!]');

begin
  if bUseSimpleMemo then
    textLength := length(Memo4.Text)
  else
    textLength := length(Memo2.Text);
  if (currentTESVmode = sTESVPex) or (currentTESVmode = sTESVMCM) then
  begin
    Label1.caption := format('%d (%s: %d)', [textLength, currentDestCodepage.s, tEncoding.GetEncoding(currentDestCodepage.verif).GetByteCount(Memo2.Text)]);
  end
  else
  begin
    b := (CurrentMaxStringLength > 0) and (textLength > CurrentMaxStringLength);
    Label1.Font.color := ErrorColorFont[ord(b)];
    bCR := ((CurrentCRState = false) and (Memo2.Lines.count > 1));
    Memo2.Gutter.color := gradient(ErrorColor[ord(b or bCR)]);
    Label1.caption := format('%d/%d %s (%s: %d)', [textLength, CurrentMaxStringLength, ErrorCR[ord(bCR)], currentDestCodepage.s, GetByteCount(currentDestCodepage.verif, GetEditedText(Memo2, Memo4))]);

    // tEncoding.GetEncoding(currentDestCodepage.verif).GetByteCount(GetEditedText(Memo2, Memo4)))]);
  end;
end;

procedure TForm2.GetStringWords(s: string);
Var
  ts1, ts2: tstringList;
  j: integer;
begin
  ts1 := tstringList.create;
  ts2 := tstringList.create;
  checkTranslationSource(ts1, s);
  ListBox1.clear;
  ListBox1.Columns := ListBox1.width div 125;
  if ts1.count > 0 then
  begin
    checkTranslation(ts2, ts1[0]);
    ListBox1.Items.Add(ts1[0] + ':');
    for j := 0 to ts2.count - 1 do
    begin
      if (ListBox1.count = ListBox1.Columns) or (ListBox1.count = 6) then
        break;
      ListBox1.Items.Add(format('%d: %s', [j + 1, ts2[j]]));
    end;
  end;
  ts2.Free;
  ts1.Free;
end;

procedure TForm2.updateSynFont;
begin
  Memo1.Font.Name := DefaultSynFont;
  Memo2.Font.Name := DefaultSynFont;
  Memo3.Font.Name := DefaultSynFont;
  Memo4.Font.Name := DefaultSynFont;
  Memo5.Font.Name := DefaultSynFont;
  RichEdit3.Font.Name := DefaultSynFont;

  Memo1.Font.size := SearchSynFontSize;
  Memo2.Font.size := SearchSynFontSize;
  Memo3.Font.size := SearchSynFontSize;
  Memo4.Font.size := SearchSynFontSize;
  Memo5.Font.size := SearchSynFontSize;
  RichEdit3.Font.size := SearchSynFontSize;
end;

procedure TForm2.CheckAlias;
Var
  ts1, ts2: tstringList;
  s1, s2: string;
  c1, c2: integer;
  i: integer;
  h1, h2: cardinal;
begin
  AliasTree.clear;
  ts1 := tstringList.create;
  ts2 := tstringList.create;
  h1 := getAliasInString(GetEditedText(Memo1, Memo5), ts1);
  h2 := getAliasInString(GetEditedText(Memo2, Memo4), ts2);
  TabSheet3.ImageIndex := 31 + ord(h1 <> h2);
  i := 0;
  while i < max(ts1.count, ts2.count) do
  begin
    c1 := 0;
    c2 := 0;
    if (ts1.count > 0) and (i < ts1.count) then
      s1 := ts1[i]
    else
      s1 := '';
    if (ts2.count > 0) and (i < ts2.count) then
      s2 := ts2[i]
    else
      s2 := '';

    // getting color
    if s1 <> s2 then
    begin
      c1 := 1;
      c2 := 1;
    end;
    // check source integrity
    if (s1 <> '') and (ts2.IndexOf(s1) < 0) then
      c1 := 2;
    // check transintegrity
    if (s2 <> '') and (ts1.IndexOf(s2) < 0) then
      c2 := 3;
    AliasTree.AddChild(nil, TAliasData.create(s1, s2, c1, c2));
    inc(i);
  end;
  ts2.Free;
  ts1.Free;
end;

procedure TForm2.getEspData(bGetDialog: boolean);
var
  r, rComp: trecord;
  f, fselect: tfield;
  aKwd: aCardinal;
  aMisc: aCardinal;
  i: integer;
  kwdString, compoString: string;
  Node: pvirtualNode;
  b: boolean;
begin
  if not TESVTmodEspLoaded then
  begin
    Edit2.Text := getRes('Fbk_ModeEdit');
    Exit;
  end;

  if not assigned(focusedNode.fString) then
    Exit;
  // -----------------------------------
  // orphean
  if isOrphean in focusedNode.fString.sInternalparams then
  begin
    Edit2.Text := getRes('OrpheanStringInfo');
    Exit;
  end;

  // VMAD
  if isVMADString in focusedNode.fString.sInternalparams then
  begin
    Edit2.Text := format('[%.8x][%s]:%.4s:VMAD:[Script#%d/%d:%s][Prop:%s]', [focusedNode.fString.esp.formID, //
      focusedNode.fString.getedidname, //
      focusedNode.fString.esp.rName, //
      focusedNode.fString.VMAD.ScriptIndex, focusedNode.fString.VMAD.VMAD.scriptList.count - 1, focusedNode.fString.VMAD.VMAD.scriptList[focusedNode.fString.VMAD.ScriptIndex], //
      focusedNode.fString.VMAD.VMAD.propList[focusedNode.fString.VMAD.propIndex]]); //
    Exit;
  end;

  r := trecord(focusedNode.fString.esp.rec);
  fselect := tfield(focusedNode.fString.esp.field);

  if not assigned(r) or not assigned(fselect) then
  begin
    Edit2.Text := getRes('RecordDataError');
    Exit;
  end;

  // get max length
  CurrentMaxStringLength := fselect.maxStrSize;
  CurrentCRState := fselect.hasCR;

  Edit2.Text := format('Record: %.4s - %s[%.8x]', [r.header.Name, r.edidnameEX, r.headerData.formID]);
  // keywords
  if assignEspLoader then
  begin
    espLoader.buildInheritedData;
    ComboBox3.clear;

    aKwd := espLoader.getKwd(focusedNode.fString.esp.rec, focusedNode.fString.esp.field);
    for i := 1 to length(aKwd) do
      if aKwd[i - 1] <> 0 then
      begin
        kwdString := espLoader.findKeyWord(aKwd[i - 1], nil);
        ComboBox3.Items.Add(kwdString);
        if i < 8 then
          Edit2.Text := Edit2.Text + format(' [Kwd: %s]', [kwdString]);
      end;
    if ComboBox3.Items.count > 0 then
      ComboBox3.itemindex := 0;
  end;

  // --MISC
  if (r.header.Name = headerMISC) and assignEspLoader then
  begin
    espLoader.buildInheritedData;
    // junk
    aMisc := focusedNode.fString.GetMiscComponent;
    for i := 1 to length(aMisc) do
      if aMisc[i - 1] <> 0 then
      begin
        rComp := espLoader.getFastRecord(aMisc[i - 1], gamesParams.sHEADERCMPOREF);
        compoString := getStringFromRecRef(rComp, aMisc[i - 1], true, headerFULL, espLoader.mastersData, b);
        Edit2.Text := Edit2.Text + format('[c_%.2d:%s]', [i, compoString]);
      end;
  end;

  // --------------
  if currentEspRecord = r then
  begin
    esprecordTree.repaint;
    Exit;
  end;

  esprecordTree.clear;
  for i := 0 to r.fList.count - 1 do
  begin
    f := r.fList[i];
    if (isString in f.Params) and assigned(f.sk) and getEspRecSharedID(esprecordTree, f.sk) then
    begin
      Node := esprecordTree.AddChild(nil, TNodeData.create(f.sk));
      esprecordTree.NodeHeight[Node] := getHeightforCell(tskystr(f.sk).s, getFontX(mainLoader));
      if f = fselect then
        esprecordTree.Selected[Node] := true;
    end;
  end;
  currentEspRecord := r;

  // -------dialog
  if bGetDialog then
    getDialogData(r, fselect);

  // ------dialogFeedback
  Edit3.Text := currentDialogTextLabel + ' | ' + Edit2.Text;
end;

procedure TForm2.ListBox2DblClick(Sender: TObject);
begin
  if (ListBox2.itemindex > 0) and assigned(ListBox2.Items.Objects[ListBox2.itemindex]) then
    updateStringFromQuest(trecord(ListBox2.Items.Objects[ListBox2.itemindex]), 0);
end;

procedure TForm2.updateStringFromQuest(r: trecord; qustID: cardinal);
var
  Data: ptreedata;
begin
  valideStringChange(false, ConfirmChange.checked, true, [validated]);
  getDialogData(r, nil, qustID);
  if assigned(DialogTree.focusedNode) then
  begin
    Data := DialogTree.GetNodeData(DialogTree.focusedNode);
    focusedNode.fString := Data.BasicND.s;
  end
  else
    focusedNode.fString := nil;
  DialogTree.repaint;
  editNewString(false);
end;

function TForm2.getDialFromScene(qustID: cardinal; r: trecord; bIsTest: boolean = false): boolean;
var
  i, j: integer;
  f: tfield;
  openSection: integer;
  wAnam: Word;
  tmpDial: cardinal;
  // r: trecord;
  b: boolean;
const
  aPlayerDial: array [0 .. 4] of sheaderSig = ('PTOP', 'NTOP', 'NETO', 'QTOP', 'ESCE');
  aNpcDial1: array [0 .. 5] of sheaderSig = ('DATA', 'NPOT', 'NNGT', 'NNUT', 'NQUT', 'ESCS');
  aNpcDial2: array [0 .. 8] of sheaderSig = ('DATA', 'NPOT', 'NNGT', 'NNUT', 'NQUT', 'PTOP', 'NTOP', 'NETO', 'QTOP');
begin
  Result := false;

  if not bIsTest then
    ListBox2.Items.AddObject(format('SCEN {%s}', [r.EdidName(true)]), nil);

  openSection := -1;
  for i := 0 to pred(r.fList.count) do
  begin
    f := r.fList[i];
    if (f.header.Name = headerANAM) then
    begin
      if openSection = -1 then
      begin
        move(f.buffer[0], wAnam, sizeof(wAnam));
        openSection := wAnam;
      end
      else
        openSection := -1;
      continue;
    end;
    if openSection >= 0 then
    begin
      if openSection = 3 then // Player Dialog
      begin
        for j := 0 to high(aPlayerDial) do
          if (f.header.Name = aPlayerDial[j]) then
          begin
            move(f.buffer[0], tmpDial, sizeof(tmpDial));
            tmpDial := espLoader.setFormIdMapping(r, tmpDial);
            b := getCurrentDial(qustID, espLoader.getFastRecordSelf(tmpDial, headerDIAL), bIsTest);
            if bIsTest and b then
              Exit(true);

            break;
          end;
        for j := 0 to high(aNpcDial1) do
          if (f.header.Name = aNpcDial1[j]) then
          begin
            move(f.buffer[0], tmpDial, sizeof(tmpDial));
            tmpDial := espLoader.setFormIdMapping(r, tmpDial);
            b := getCurrentDial(qustID, espLoader.getFastRecordSelf(tmpDial, headerDIAL), bIsTest);
            if bIsTest and b then
              Exit(true);
            break;
          end;
      end
      else
      begin
        for j := 0 to high(aNpcDial2) do
          if (f.header.Name = aNpcDial2[j]) then
          begin
            move(f.buffer[0], tmpDial, sizeof(tmpDial));
            tmpDial := espLoader.setFormIdMapping(r, tmpDial);
            b := getCurrentDial(qustID, espLoader.getFastRecordSelf(tmpDial, headerDIAL), bIsTest);
            if bIsTest and b then
              Exit(true);
            break;
          end;
      end;
    end
  end;
end;

function TForm2.getCurrentDial(qustID: cardinal; currentDialRec: trecord; bIsTest: boolean = false): boolean;
var
  catString, kwdString, subString, tag: string;
  cData, tmp: cardinal;
  iCat: byte;
begin
  Result := false;
  if not assigned(currentDialRec) then
    Exit;
  if currentDialRec.bDialUsed then
    Exit;
  if (currentDialRec.header.Name <> headerDIAL) then
    Exit;
  tmp := currentDialRec.getCardinalfromDataRef(sheaderSig(gamesParams.sQUSTDIALREF));
  // if assigned(currentDialRec) and (not currentDialRec.bDialUsed) and (currentDialRec.header.Name = headerDIAL) and
  // (currentDialRec.getCardinalfromDataRef(sheaderSig(gamesParams.sQUSTDIALREF)) = qustID) then
  if tmp = qustID then
  begin
    if espLoader.getValidDial(currentDialRec) then
    begin
      if bIsTest then
        Exit(true);

      catString := '';
      kwdString := '';
      subString := '';
      // Category
      cData := currentDialRec.getCardinalfromDataRef(sheaderData);
      iCat := PCardinalRec(@cData)^.Byte2;
      if inrange(iCat, low(DialCategories), high(DialCategories)) then
        catString := format('%s', [DialCategories[iCat]]);
      // SubType
      cData := currentDialRec.getCardinalfromDataRef(headerSNAM);
      if not((sheaderSig(cData) = 'SCEN') or (sheaderSig(cData) = 'CUST')) then
      begin
        subString := trim(DialSubTypeList.values[string(sheaderSig(cData))]);
        if subString = '' then
          subString := string(sheaderSig(cData));
      end;
      // KeyWord  only if EdidName =''
      if not currentDialRec.hasValidEdid then
      begin
        cData := currentDialRec.getCardinalfromDataRef(headerKNAM);
        if cData > 0 then
          kwdString := espLoader.findKeyWord(cData, nil);
      end;
      if (kwdString <> '') or (subString <> '') then
        tag := ':'
      else
        tag := '';
      currentDialRec.bDialUsed := true;
      ListBox2.Items.AddObject(format('DIAL {%s%s%s%s} %s', [catString, tag, subString, kwdString, currentDialRec.EdidName(true)]), currentDialRec);
    end;
  end;
end;

procedure TForm2.GetSceneFromMaster(const qustID: cardinal);
var
  i, j: integer;
  mEsp: tEspLoader;
  r: trecord;
  Qust: cardinal;
begin
  for i := pred(espLoader.aInheritedEsp.count) downto 0 do
  begin
    mEsp := espLoader.aInheritedEsp[i];
    if assigned(mEsp) then
      for j := 0 to pred(mEsp.SceneList.count) do
      begin
        r := mEsp.SceneList[j];
        Qust := r.getCardinalfromDataRef_FromEnd('PNAM', 'ANAM');
        Qust := mEsp.setFormIdMapping(Qust);
        if ((Qust = 0) or (Qust <> qustID)) then
          continue;
        if getDialFromScene(qustID, r, true) then
          getDialFromScene(qustID, r);
      end;
  end;
end;

procedure TForm2.getDialogData(r: trecord; fselect: tfield; DirectQuestId: cardinal = 0);
var
  Node, masterDial, subGrup, infoRec: pvirtualNode;
  dialID, grupLvl, qustID: cardinal;
  DataEsp: pespdata;
  QustStr: string;
  QustRefRec, DialRefRec: trecord;
  i: integer;

  function authExec: boolean;
  begin
    if DirectQuestId > 0 then
      Exit(true)
    else
      Result := ((r.header.Name = headerINFO) or (r.header.Name = headerDIAL))
  end;

begin
  if (not assignEspLoader) or (espLoader.topDialGrup = nil) or not authExec then
  begin
    DialogTree.clear;
    TabSheet6.ImageIndex := 31;
    Edit4.Text := '';
    Edit3.Text := '';
    OldQustId := 0;
    OldDialId := 0;
    ListBox2.clear;
    Exit;
  end;

  TabSheet6.ImageIndex := 32;
  subGrup := nil;
  masterDial := nil;
  qustID := 0;
  dialID := 0;
  currentDialogTextLabel := '';
  QustStr := '';
  DialRefRec := nil;
  espLoader.buildInheritedData;

  // if directQuestID >0 , r = nil so do not call r
  if DirectQuestId <> 0 then
    qustID := DirectQuestId
  else
  begin
    if r.header.Name = headerDIAL then
    begin
      masterDial := r.espRec;
      subGrup := espLoader.getDialSubGrup(masterDial, r.headerData.formID);
    end
    else if r.header.Name = headerINFO then
    begin
      infoRec := r.espRec;
      if assigned(infoRec) then
      begin
        subGrup := infoRec.Parent;
        DataEsp := espTree.GetNodeData(subGrup);
        if (DataEsp.BasicND.P.sType = sGrup) and (espTree.GetNodeLevel(subGrup) > 1) then
        begin
          dialID := cardinal(tgrup(DataEsp.BasicND.P).headerData.sIdent);
          masterDial := espLoader.getSubRec(dialID, headerDIAL);
        end;
      end;
    end;

    if assigned(masterDial) then
    begin
      DataEsp := espTree.GetNodeData(masterDial);
      DialRefRec := trecord(DataEsp.BasicND.P);
      dialID := DialRefRec.headerData.formID;
      qustID := DialRefRec.getCardinalfromDataRef(sheaderSig(gamesParams.sQUSTDIALREF));
    end;

    if (dialID = 0) or (OldDialId = dialID) then
      Exit;
  end;

  DialogTree.beginupdate;
  DialogTree.clear;

  ListBox2.Items.beginupdate;
  // fillListBox
  if (qustID > 0) and (OldQustId <> qustID) then
  begin
    // get quest ref from Master if relevant
    QustRefRec := espLoader.getFastRecord(qustID, headerQUST);
    QustStr := getQuestString(QustRefRec, qustID, espLoader.mastersData);
    // ---------------------

    ListBox2.clear;
    ListBox2.Items.AddObject(QustStr, nil); // add quest node

    // clearDialUsed param
    Node := espLoader.topDialGrup;
    grupLvl := espTree.GetNodeLevel(Node);
    Node := espTree.GetNext(Node);
    while assigned(Node) and (espTree.GetNodeLevel(Node) > grupLvl) do
    begin
      DataEsp := espTree.GetNodeData(Node);
      if (DataEsp.BasicND.P.sType = sRecord) and (trecord(DataEsp.BasicND.P).header.Name = headerDIAL) then
        trecord(DataEsp.BasicND.P).bDialUsed := false;
      Node := espTree.GetNext(Node);
    end;

    // scene
    if bUseDialFromScene then
      GetSceneFromMaster(qustID);

    // Orphan Dial
    ListBox2.Items.AddObject('Unsorted', nil);
    Node := espLoader.topDialGrup;
    grupLvl := espTree.GetNodeLevel(Node);
    Node := espTree.GetNext(Node);
    while assigned(Node) and (espTree.GetNodeLevel(Node) > grupLvl) do
    begin
      DataEsp := espTree.GetNodeData(Node);
      getCurrentDial(qustID, trecord(DataEsp.BasicND.P));
      Node := espTree.GetNext(Node);
    end;

    OldQustId := qustID;
  end;

  // pick from ListBox2
  if not assigned(DialRefRec) then
    for i := 0 to ListBox2.count - 1 do
      if assigned(ListBox2.Items.Objects[i]) and (trecord(ListBox2.Items.Objects[i]).header.Name = headerDIAL) then
      begin
        DialRefRec := trecord(ListBox2.Items.Objects[i]);
        // get the first DIAL for DialList
        masterDial := DialRefRec.espRec;
        subGrup := espLoader.getDialSubGrup(masterDial, DialRefRec.headerData.formID);
        break;
      end;

  if assigned(DialRefRec) then
  begin
    currentDialogTextLabel := (format('DIAL: %s[%.8x]', [DialRefRec.edidnameEX, DialRefRec.headerData.formID]));
    assignDialogNode(DialRefRec, fselect);
  end;

  // let assign all descendants INFO:
  if assigned(subGrup) then
  begin
    if currentDialogTextLabel = '' then
    begin
      DataEsp := espTree.GetNodeData(subGrup);
      currentDialogTextLabel := (format('DIAL: [%.8x]', [cardinal(tgrup(DataEsp.BasicND.P).headerData.sIdent)]));
    end;
    grupLvl := espTree.GetNodeLevel(subGrup);
    Node := subGrup.FirstChild;
    while assigned(Node) and (espTree.GetNodeLevel(Node) > grupLvl) do
    begin
      DataEsp := espTree.GetNodeData(Node);
      if (DataEsp.BasicND.P.sType = sRecord) and (DataEsp.BasicND.P.header.Name = headerINFO) then
        assignDialogNode(trecord(DataEsp.BasicND.P), fselect);
      Node := espTree.GetNext(Node);
    end;
  end;
  // selection in DialogTree
  if fselect = nil then
  begin
    Node := DialogTree.getfirst;
    if assigned(Node) then
    begin
      DialogTree.Selected[Node] := true;
      DialogTree.focusedNode := Node;
    end;
  end;

  // feedback
  if assigned(DialRefRec) then
  begin
    // assignDialogNode(DialRefRec, fselect);
    ListBox2.ClearSelection;
    ListBox2.Selected[ListBox2.Items.IndexOfObject(DialRefRec)] := true;
  end;
  if ListBox2.count > 0 then
    currentDialogTextLabel := ListBox2.Items[0] + ' | ' + currentDialogTextLabel;

  currentDialogTextLabel := currentDialogTextLabel;
  OldDialId := dialID;

  ListBox2.Items.endupdate;
  DialogTree.endupdate;
end;

procedure TForm2.assignDialogNode(r: trecord; fselect: tfield);
var
  Node: pvirtualNode;
  f: tfield;
  i: integer;
begin
  for i := 0 to r.fList.count - 1 do
  begin
    f := r.fList[i];
    if (isString in f.Params) and getEspRecSharedID(DialogTree, f.sk) then
    begin
      Node := DialogTree.AddChild(nil, TNodeData.create(f.sk));
      DialogTree.NodeHeight[Node] := getHeightforCell(tskystr(f.sk).s, getFontX(mainLoader));
      if f = fselect then
      begin
        DialogTree.Selected[Node] := true;
        DialogTree.focusedNode := Node;
      end;
    end;
  end;
end;

function TForm2.getEspRecSharedID(tree: TVirtualStringTree; sk: tskystr): boolean;
var
  Node: pvirtualNode;
  Data: ptreedata;
begin
  Result := true;
  if currentTESVmode <> sTESVEspStrings then
    Exit;
  Node := tree.getfirst;
  while assigned(Node) do
  begin
    Data := tree.GetNodeData(Node);
    if Data.BasicND.s = sk then
    begin
      Result := false;
      break;
    end;
    Node := tree.GetNextsibling(Node);
  end;
end;

// --------ESP COMPARE---------
Function TForm2.assignEspLoader: boolean;
begin
  If assigned(mainLoader) then
    espLoader := mainLoader.espLoader
  else
    espLoader := nil;
  Result := assigned(espLoader);
end;

procedure TForm2.espcompareResultList;
var
  i: integer;
begin
  if not assignEspLoader then
    Exit;
  if (espLoader.recordCompareList.count = 0) or (not assigned(focusedNode.fString)) then
  begin
    TabSheet5.ImageIndex := 31;
    Exit;
  end;
  espCompareTree.clear;
  TabSheet5.ImageIndex := 31 + ord(warning in (focusedNode.fString.sInternalparams));
  if FastListSearch(espLoader.recordCompareList, compareFormID, focusedNode.fString.esp.rec, i, false) then
    getfieldMatch(focusedNode.fString.esp.field, espLoader.recordCompareList[i]);
end;

procedure TForm2.getfieldMatch(f1: tfield; r: trecord);
var
  j: integer;
  f2: tfield;
  tmpstr: rawbytestring;
  s: string;
  Node: pvirtualNode;
  bFallback: boolean;
begin
  for j := 0 to r.fList.count - 1 do
  begin
    f2 := r.fList[j];
    if (f1.header.Name = f2.header.Name) and (isString in f2.Params) then
    begin
      SetString(tmpstr, PAnsiChar(@f2.buffer[0]), length(f2.buffer));
      s := cleanString(rawStringtoString(tmpstr, espLoader.espCompareCodepage.codepage, bFallback));
      Node := espCompareTree.AddChild(nil, TCompareData.create(s, warning in tskystr(f1.sk).sInternalparams));
      espCompareTree.NodeHeight[Node] := getHeightforCell(s, getFontX(mainLoader), 2);
    end;
  end;
end;

procedure TForm2.espCompareTreeDblClick(Sender: TObject);
var
  Data: pTreeGenericData;
begin
  if assigned(espCompareTree.focusedNode) then
  begin
    Data := espCompareTree.GetNodeData(espCompareTree.focusedNode);
    SetEditedText(Memo2, Memo4, TCompareData(Data.BasicND).s);
    SetMemoFocus(Memo2, Memo4);
    CheckAlias;
    CheckMaxLength;
  end;
end;

procedure TForm2.espCompareTreeFreeNode(Sender: TBaseVirtualTree; Node: pvirtualNode);
var
  Data: pTreeGenericData;
begin
  Data := Sender.GetNodeData(Node);
  TCompareData(Data.BasicND).Free;
end;

procedure TForm2.espCompareTreeGetImageIndex(Sender: TBaseVirtualTree; Node: pvirtualNode; kind: TVTImageKind; Column: TColumnIndex; var Ghosted: boolean; var ImageIndex: TImageIndex);
var
  Data: pTreeGenericData;
begin
  if not((kind = ikNormal) or (kind = ikSelected)) then
    Exit;
  Data := Sender.GetNodeData(Node);
  if TCompareData(Data.BasicND).warning then
    ImageIndex := 32
end;

procedure TForm2.espCompareTreeGetText(Sender: TBaseVirtualTree; Node: pvirtualNode; Column: TColumnIndex; TextType: TVSTTextType;

  var CellText: string);
var
  Data: pTreeGenericData;
begin
  Data := Sender.GetNodeData(Node);
  CellText := defineCellText(TCompareData(Data.BasicND).s, true, false, false);
end;

procedure TForm2.Timer1Timer(Sender: TObject);
begin
  search;
end;

procedure TForm2.ToolButton11Click(Sender: TObject);
begin
  tesvtnoReplace := not ToolButton11.down;
end;

procedure TForm2.ToolButton12Click(Sender: TObject);
var
  Index: integer;
begin
  FormSpOpts := TFormSpOpts.create(self);
  FormSpOpts.checkbox1.checked := bUseSpellCheck;
  FormSpOpts.radiogroup1.itemindex := iUseSpellCheckID;
  FormSpOpts.checkbox2.checked := spParseIgnoreFirstUpper in SPcheck.parseOptions;
  FormSpOpts.checkbox3.checked := spParseIgnoreMultiUpper in SPcheck.parseOptions;
  FormSpOpts.checkbox4.checked := spParseIgnoreAlias in SPcheck.parseOptions;

  if SPcheck.getDict(mainpath + SPELL_CHECK_DICPATH, FormSpOpts.ComboBox1.Items) then
  begin
    index := FormSpOpts.ComboBox1.Items.IndexOf(sUseSpellCheckDic);
    if (index >= 0) and (sUseSpellCheckDic <> '') then
      FormSpOpts.ComboBox1.itemindex := index
    else
      FormSpOpts.ComboBox1.itemindex := 0;
  end;
  FormSpOpts.showmodal;
  try
    application.ProcessMessages;
    if FormSpOpts.ModalResult = mrOk then
    begin
      if FormSpOpts.checkbox2.checked then
        include(SPcheck.parseOptions, spParseIgnoreFirstUpper)
      else
        exclude(SPcheck.parseOptions, spParseIgnoreFirstUpper);
      if FormSpOpts.checkbox3.checked then
        include(SPcheck.parseOptions, spParseIgnoreMultiUpper)
      else
        exclude(SPcheck.parseOptions, spParseIgnoreMultiUpper);
      if FormSpOpts.checkbox4.checked then
        include(SPcheck.parseOptions, spParseIgnoreAlias)
      else
        exclude(SPcheck.parseOptions, spParseIgnoreAlias);

      iSpParseOptions := byte(SPcheck.parseOptions);
      bUseSpellCheck := FormSpOpts.checkbox1.checked;
      iUseSpellCheckID := FormSpOpts.radiogroup1.itemindex;
      sUseSpellCheckDic := FormSpOpts.ComboBox1.Text;

      SPcheck.reset;
      SPcheck.update(iUseSpellCheckID, bUseSpellCheck, sUseSpellCheckDic);
      FinalyzeSpellCheckUpdate;
      clearspMenu;
      if not bUseSimpleMemo then
      begin
        Memo2.OnChange(Memo2);
        Memo2.repaint;
      end
      else
      begin
        Memo4.OnChange(Memo4);
        Memo4.repaint;
      end;
    end;
  finally
    FormSpOpts.Free;
  end;
end;

procedure TForm2.ToolButton1Click(Sender: TObject);
begin
  FormsText := TFormsText.create(Form2);
  FormsText.SearchTextHistory := ssearchHistory;
  FormsText.cbSearchText.Text := ssearchText;
  FormsText.radiogroup1.itemindex := ssearchMemo.tag;
  FormsText.showmodal;
  ssearchHistory := FormsText.SearchTextHistory;
  ssearchText := FormsText.cbSearchText.Text;
  case FormsText.radiogroup1.itemindex of
    0: ssearchMemo := Memo1;
    1: ssearchMemo := Memo2;
  end;
  FormsText.Free;
  ToolButton2.enabled := ssearchText <> '';
  ToolButton4.enabled := ssearchText <> '';
  dosearchinText([ssoEntireScope], ssearchText, ssearchMemo, true);
end;

procedure TForm2.ToolButton2Click(Sender: TObject);
begin
  dosearchinText([], ssearchText, ssearchMemo, true);
end;

procedure TForm2.ToolButton4Click(Sender: TObject);
begin
  dosearchinText([ssoBackwards], ssearchText, ssearchMemo, true);
end;

procedure TForm2.ToolButton5Click(Sender: TObject);
begin
  startCommand(ecUpperCaseBlock);
end;

procedure TForm2.ToolButton6Click(Sender: TObject);
begin
  startCommand(ecLowerCaseBlock);
end;

procedure TForm2.ToolButton7Click(Sender: TObject);
begin
  startCommand(ecTitleCase);
end;

procedure TForm2.ToolButton8Click(Sender: TObject);
begin
  search;
end;

procedure TForm2.startCommand(Command: Word);
begin
  Memo2.CommandProcessor(Command, ' ', nil);
end;

procedure TForm2.dosearchinText(opt: TSynSearchOptions; s: string; sMemo: TSynEdit; bResult: boolean = true);
begin
  if sMemo.SearchReplace(s, '', opt) = 0 then
  begin
    if ssoBackwards in opt then
      sMemo.BlockEnd := sMemo.BlockBegin
    else
      sMemo.BlockBegin := sMemo.BlockEnd;
    sMemo.CaretXY := sMemo.BlockBegin;
    if bResult then
      askDialog(getRes('NoResult'), self, [askAuto], 500);
  end
end;

// spellCheckTest

procedure TForm2.resetSpellCheck;
begin
  authMemoDrawSpellCheck := false;
  Timer3.enabled := false;
  Timer2.enabled := false;
  Timer2.enabled := assigned(SPcheck) and SPcheck.Active and (not bUseSimpleMemo);
end;

procedure TForm2.Timer2Timer(Sender: TObject);
begin
  spellCheck;
end;

procedure TForm2.Timer3Timer(Sender: TObject);
begin
  Timer3.enabled := false;
  bDrawSPUnderline := true;
  // repaintMemo(Memo2, Memo4);
  Memo2.repaint;
end;

procedure TForm2.spellCheck;
begin
  Timer2.enabled := false;
  if bUseSimpleMemo or not assigned(SPcheck) or not SPcheck.Active then
    Exit;

  if authRefreshSpellCheck then
  begin
    authRefreshSpellCheck := false;
    // SPcheck.analyzeText(GetEditedText(Memo2, Memo4));
    SPcheck.analyzeText(Memo2.Text);
    authMemoDrawSpellCheck := true;
    authRefreshSpellCheck := true;
    bDrawSPUnderline := true;
    // repaintMemo(Memo2, Memo4);
    Memo2.repaint;
  end;
end;

Procedure RichEditLine(editor: TRichEdit);
Var
  aCanvas: TCanvas;
  sSize: tsize;
  pix1: tPoint;
  i: integer;
  scw: TscWord;

  function GetRichEditXY(CharIndex: integer): tPoint;
  begin
    Result.Y := SendMessage(editor.handle, EM_LINEFROMCHAR, CharIndex, 0);
    Result.X := CharIndex - SendMessage(editor.handle, EM_LINEINDEX, Result.Y, 0);
  end;

  function RowColumnToPixels(const ColRow: tPoint): tPoint;
  begin
    Result.X := (ColRow.X) * (aCanvas.TextWidth('W'));
    Result.Y := (ColRow.Y) * aCanvas.Textheight('Y');
  end;

  procedure UnderLine(const X1, X2, Y: integer);
  const
    underPoints: array [boolean] of ShortInt = (2, 0);
  var
    X, l: integer;
  begin
    l := X1;
    aCanvas.MoveTo(l, Y);
    X := X1;
    while (X2 > X) do
    begin
      if (X > X2) then
        break;
      aCanvas.LineTo(X, Y + underPoints[(l - X) mod 4 = 0]);
      inc(X, 2);
    end;
  end;

Begin
  aCanvas := TCanvas.create;
  Try
    aCanvas.handle := GetDC(editor.handle);
    aCanvas.Font := editor.Font;
    sSize := aCanvas.TextExtent(editor.seltext);
    With aCanvas do
    Begin
      Pen.color := clRed;
      for i := 0 to SPcheck.spWords.count - 1 do
      begin
        scw := SPcheck.spWords[i];
        if scw.isFault then
        begin
          if not scw.sSizeSet then
          begin
            scw.sSize := aCanvas.TextExtent(scw.sWord);
            scw.sSizeSet := true;
          end;
          pix1 := RowColumnToPixels(GetRichEditXY(scw.startpos));
          if inrange(pix1.Y, 0, editor.height) then
            UnderLine(pix1.X, pix1.X + scw.sSize.cx, pix1.Y + scw.sSize.cy - 1);
        end;
      end;
    End;

  Finally
    ReleaseDC(editor.handle, aCanvas.handle);
    aCanvas.Free;
  End;
End;

procedure TRichEdit.WMPaint(var Message: TWMPaint);
begin
  DefaultHandler(Message);
  // RichEditLine(self);
end;

// draw the red line for spellCheck:
procedure TForm2.Memo2PaintTransient(Sender: TObject; Canvas: TCanvas; TransientType: TTransientType);
var
  P1: TBufferCoord;
  pix1: tPoint;
  i: integer;
  scw: TscWord;
  function CharToPixels(P: TBufferCoord): tPoint;
  begin
    Result := Memo2.RowColumnToPixels(Memo2.BufferToDisplayPos(P));
  end;

  procedure UnderLine(const X1, X2, Y: integer);
  const
    underPoints: array [boolean] of ShortInt = (2, 0);
  var
    X, l: integer;
  begin
    l := X1;
    Canvas.MoveTo(l, Y);
    X := X1;
    while (X2 > X) do
    begin
      if (X > X2) then
        break;
      Canvas.LineTo(X, Y + underPoints[(l - X) mod 4 = 0]);
      inc(X, 2);
    end;
  end;

begin
  if bUseSimpleMemo then
    Exit;

  If iApiDrawIcon >= 0 then
    form1.ImageList1.Draw(Canvas, 2, 2, iApiDrawIcon);

  if (TransientType <> ttAfter) or (not authMemoDrawSpellCheck) then
    Exit;

  if not bDrawSPUnderline then
    Exit;

  Canvas.Pen.color := clRed;
  for i := 0 to SPcheck.spWords.count - 1 do
  begin
    scw := SPcheck.spWords[i];
    if scw.isFault then
    begin
      if not scw.sSizeSet then
      begin
        scw.sSize := Canvas.TextExtent(scw.sWord);
        scw.sSizeSet := true;
      end;

      P1 := Memo2.CharIndexToRowCol(scw.startpos);
      pix1 := CharToPixels(P1);
      if inrange(pix1.Y, 0, Memo2.height) then
        UnderLine(pix1.X, pix1.X + scw.sSize.cx, pix1.Y + scw.sSize.cy - 1);
    end;
  end;
end;

procedure TForm2.Memo2StatusChange(Sender: TObject; Changes: TSynStatusChanges);
begin
  bDrawSPUnderline := false;
  if authMemoDrawSpellCheck then
  begin
    Timer3.enabled := false;
    Timer3.enabled := assigned(SPcheck) and SPcheck.Active and (not bUseSimpleMemo);
  end;

  if scSelection in Changes then
    Label3.caption := formatRes('lbl_Selection', [length(Memo2.seltext)]);
end;

procedure TForm2.Memo4Change(Sender: TObject);
begin
  poweredByEnd;
  CheckAlias;
  CheckMaxLength;
  Memo4.repaint;
end;

procedure TForm2.Memo4SelectionChange(Sender: TObject);
begin
  Label3.caption := formatRes('lbl_Selection', [length(Memo4.seltext)]);
end;

function TForm2.getCurrentTree: TVirtualStringTree;
begin
  case PageControl1.ActivePageIndex of
    0: Result := esprecordTree;
    5: Result := DialogTree;
  else Result := nil;
  end;
end;

procedure TForm2.MenuCancel21Click(Sender: TObject);
begin
  cancelStringStatus(mainLoader, getCurrentTree);
end;

procedure TForm2.MenuColab1Click(Sender: TObject);
begin
  SetColabID(mainLoader, getCurrentTree, TMenuItem(Sender).tag);
end;

procedure TForm2.MenuColab2Click(Sender: TObject);
begin
  setColabOnDialList(mainLoader, TMenuItem(Sender).tag, ListBox2);
end;

procedure TForm2.MenuCopy1Click(Sender: TObject);
begin
  CopyStringFocus(getCurrentTree);
end;

procedure TForm2.MenuFixAlias21Click(Sender: TObject);
begin
  FixValue(mainLoader, getCurrentTree, 2);
end;

procedure TForm2.MenuFixNumber1Click(Sender: TObject);
begin
  FixValue(mainLoader, getCurrentTree, 1);
end;

procedure TForm2.MenuLocked1Click(Sender: TObject);
begin
  updateStringStatus(mainLoader, getCurrentTree, [lockedTrans]);
end;

procedure TForm2.MenuLocked2Click(Sender: TObject);
begin
  valideStringChange(true, false, true, [lockedTrans]);
  updateFieldEdit(true);
end;

procedure TForm2.MenuPartial21Click(Sender: TObject);
begin
  updateStringStatus(mainLoader, getCurrentTree, [IncompleteTrans])
end;

procedure TForm2.MenuPartial22Click(Sender: TObject);
begin
  valideStringChange(true, false, true, [IncompleteTrans]);
  updateFieldEdit(true);
end;

procedure TForm2.MenuPaste1Click(Sender: TObject);
begin
  PasteStringSelection(mainLoader, getCurrentTree);
end;

procedure TForm2.MenuValidate31Click(Sender: TObject);

begin
  updateStringStatus(mainLoader, getCurrentTree, [validated])
end;

procedure TForm2.Menu_CopySourceClick(Sender: TObject);
begin
  if assigned(focusedNode.fString) then
  begin
    SetEditedText(Memo2, Memo4, focusedNode.fString.s, true);
    getDiff;
  end;
end;

// compute correction
procedure TForm2.PopupMenu1Popup(Sender: TObject);
begin
  IgnoreMenu.visible := false;
  if assigned(SPcheck) and SPcheck.Active then
    buildspMenu;

  SynPaste.visible := PopupMenu1.PopupComponent = Memo2;
  SynPaste.enabled := Clipboard.AsText <> '';
end;

procedure TForm2.PopupMenu4Popup(Sender: TObject);
begin
  MenuPaste1.enabled := Clipboard.AsText <> '';
end;

procedure TForm2.clearspMenu;
var
  i: integer;
begin
  for i := PopupMenu1.Items.count - 1 downto 0 do
    if pos('mSuggestion', TMenuItem(PopupMenu1.Items[i]).Name) > 0 then
      TMenuItem(PopupMenu1.Items[i]).Free;
end;

procedure TForm2.ComboBox2Change(Sender: TObject);
begin
  Timer4Timer(self);
end;

procedure TForm2.ComboBox3DrawItem(Control: TWinControl; Index: integer; Rect: TRect; State: TOwnerDrawState);
begin
  ComboBoxDrawItem(Control, Index, Rect, State, form1.ImageList1, 72);
end;

procedure TForm2.ConfirmChangeClick(Sender: TObject);
begin
  bConfirmChange := ConfirmChange.checked;
end;

procedure TForm2.sanitizeCombobox(c: TComboBox);
begin
  if c.Items.count > 0 then
    c.itemindex := 0;
  if c.Items.count > 1 then
    c.style := csDropDown
  else
    c.style := csSimple;
end;

procedure TForm2.updateDialogFeedback(sk: tskystr);
var
  r: rDialInfo;
  tmpTxt: string;
begin
  if sk = focusedNode.dialString then
    Exit;
  ComboBox1.clear;
  ComboBox1.color := gradient(clWhite);
  ListBox3.Items.clear;
  tmpTxt := '';
  if sk.isDialog then
  begin
    r := sk.GetResponseInfo;
    tmpTxt := formatRes('DialInfoData2%d%s%s', [r.rId, getExpressionString(espLoader, r.rType), r.comment]);
    if (r.rId > 0) and (fuz.List.count > 0) then
      fuz.getFromRec(r, ComboBox1.Items);
    // --------looking for NPCdata if loaded
    ListBox3.Items.beginupdate;
    CTDADecoderOutput(espLoader, ListBox3.Items, trecord(sk.esp.rec));
    if assigned(mainDialData) then
      mainDialData.getNpcForDial(ListBox3.Items, sk.esp.formID, r.rId, false);
    ListBox3.Items.endupdate;
    focusedNode.dialString := sk;
  end;
  sanitizeCombobox(ComboBox1);
  Edit4.Text := tmpTxt;
end;

procedure TForm2.DialogTreeFocusChanged(Sender: TBaseVirtualTree; Node: pvirtualNode; Column: TColumnIndex);
var
  Data: ptreedata;
begin
  if assigned(Node) then
  begin
    Data := TVirtualStringTree(Sender).GetNodeData(Node);
    updateDialogFeedback(Data.BasicND.s);
  end;
end;

procedure TForm2.buildspMenu;
var
  mItem: TMenuItem;
  i: integer;
  Point: TBufferCoord;
  scw: TscWord;
begin
  clearspMenu;

  if bUseSimpleMemo then
    Exit;
  spReplaceCurrent := '';
  spReplaceCurrentScw := nil;

  if Memo2.GetPositionOfMouse(Point) then
  begin
    scw := SPcheck.getWordFromCharIndex(Memo2.RowColToCharIndex(Point));
    if assigned(scw) then
    begin
      spReplaceCurrentScw := scw;
      spReplaceCurrent := scw.sWord;
    end;
  end;

  if (spReplaceCurrent <> '') and not SPcheck.isWordInCache(spReplaceCurrent) then
  begin
    IgnoreMenu.visible := true;
    IgnoreMenu.caption := (formatRes('spIgnore %s', [spReplaceCurrent]));
    if not SPcheck.CheckSpelling(spReplaceCurrent, SPcheck.spSuggestionList) then
    begin

      for i := SPcheck.spSuggestionList.count - 1 downto 0 do
      begin
        mItem := TMenuItem.create(self);
        mItem.caption := SPcheck.spSuggestionList[i];
        mItem.Name := 'mSuggestion' + inttostr(i);
        mItem.ImageIndex := 33;
        mItem.OnClick := spSuggestionOnClick;
        mItem.tag := i;
        PopupMenu1.Items.Insert(0, mItem);
      end;
    end;
  end;
end;

procedure TForm2.spSuggestionOnClick(Sender: TObject);
begin
  if (SPcheck.spSuggestionList.count > TMenuItem(Sender).tag) and assigned(spReplaceCurrentScw) then // security
    with Memo2 do
    begin
      SelStart := spReplaceCurrentScw.startpos;
      SelEnd := spReplaceCurrentScw.endpos;
      SearchReplace(seltext, SPcheck.spSuggestionList[TMenuItem(Sender).tag], [ssoReplace, ssoSelectedOnly]);
    end;
end;

// =============================FUZ=============================

procedure TForm2.ToolButton13Click(Sender: TObject);
begin
  if (ComboBox1.Items.count > 0) then
    form1.copyFuztoClipBoard(DialogTree, DialogTree.focusedNode, ComboBox1.Items);
end;

procedure TForm2.ToolButton14MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
begin
  search;
end;

procedure TForm2.ToolButton15Click(Sender: TObject);
begin
  dosearchinText([], Edit1.Text, Memo3, true);
end;

procedure TForm2.ToolButton16Click(Sender: TObject);
begin
  dosearchinText([ssoBackwards], Edit1.Text, Memo3, true);
end;

procedure TForm2.ToolButton9Click(Sender: TObject);
begin
  if (PageControl1.ActivePageIndex = 5) then
  begin
    if (ComboBox1.itemindex < 0) and (ComboBox1.Items.count > 0) then
      ComboBox1.itemindex := 0;
    if isFuzLoaded(mainLoader, fuz.current) and (ComboBox1.itemindex >= 0) then
    begin
      if form1.loadFuzSound(tfuzExport(ComboBox1.Items.Objects[ComboBox1.itemindex])) then
        ComboBox1.color := gradient(clWhite)
      else
        ComboBox1.color := gradient($00CCCCFF);
    end;
  end;
end;

// =======================API

procedure TForm2.poweredBy(s, h: string);
begin
  Panel18.caption := getRes(s);
  Panel18.hint := getRes(h);
end;

procedure TForm2.poweredByEnd;
begin
  Panel18.caption := '';
  Panel18.hint := '';
end;

function TForm2.getTextforApi(var bReplaceAll: boolean): string;
begin
  if GetSelText(Memo2, Memo4) = '' then
  begin
    bReplaceAll := true;
    Result := focusedNode.fString.s;
  end
  else
  begin
    bReplaceAll := false;
    Result := GetSelText(Memo2, Memo4);
  end;
end;

procedure TForm2.updateApiTranslatedText(s: string; bReplaceAll: boolean);
begin
  if bReplaceAll then
    SetEditedText(Memo2, Memo4, s, true)
  else
    SetEditedSelText(Memo2, Memo4, s, true);
end;

procedure TForm2.launchTranslationExecute(Sender: TObject);
begin
  if Button3.enabled then
    Button3Click(nil);
end;

procedure TForm2.Button3Click(Sender: TObject);
var
  apiId: integer;
begin
  if (ComboBox2.itemindex >= 0) then
  begin
    apiId := integer(ComboBox2.Items.Objects[ComboBox2.itemindex]);
    StartApiTranslation(apiId);
  end
end;

procedure TForm2.StartApiTranslation(apiId: integer);
var
  bReplaceAll: boolean;
  Text, apiName: string;
  usage: cardinal;
  proc: tapiBaseTranslation;
begin
  poweredByEnd;
  Text := getTextforApi(bReplaceAll);
  lockApiStuff(true, 71);

  Button3.enabled := false;
  Timer4.enabled := false;
  Timer5.enabled := false;

  application.ProcessMessages;
  usage := apidata.setusage(apiId);
  if usage > 0 then
  begin
    Timer4.interval := usage;
    Button3.caption := inttostr(Timer4.interval div 1000);
    Timer4.enabled := true;
    Timer5.enabled := true;
    Timer5.tag := 0;
  end
  else
    Timer4Timer(self);

  proc := aApiBaseFunc[apiId];
  if proc(Text, apiId) then
  begin
    updateApiTranslatedText(Text, bReplaceAll);
    apiName := aApiBaseName[apiId];
    poweredBy(getRes(apiName + 'powered', apidata.urlData), getRes(apiName + 'poweredUrl', apidata.urlData));
  end;
  ilastUsedApi := apiId;

  lockApiStuff(false, -1);
end;

procedure TForm2.Timer4Timer(Sender: TObject);
begin
  Button3.enabled := true;
  Button3.caption := getRes('but_ApiTranslation');
  Timer4.enabled := false;
  Timer5.enabled := false;
  Timer5.tag := 0;
end;

procedure TForm2.Timer5Timer(Sender: TObject);
begin
  Timer5.tag := Timer5.tag + 1;
  Button3.caption := inttostr((Timer4.interval div 1000) - Timer5.tag);
end;

end.
