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

  Extra note: changed the  VK_F2 to  VK_F12 key  virtual tree.pas to use F12 to edit (wip)
}
unit TESVT_main;

interface

uses Windows, Messages, SysUtils, Classes, Controls, Forms, Graphics, StdCtrls, VirtualTrees, ExtCtrls, ComCtrls, SynHighlighterURI,
  HTMLUn2, StrUtils, Menus, ImgList, ToolWin, SynEdit, math, SynURIOpener, SynEditHighlighter, ButtonGroup, TESVT_HeuristicSearch,
  TESVT_searchandreplace, TESVT_espDefinition, activeX, TESVT_Const, TESVT_typedef, TESVT_fstreamsave, TESVT_search, TESVT_langpref,
  HtmlView, ShellAPI, Dialogs, TESVT_Fastsearch, TESVT_bsa, TESVT_Ressources, TESVT_Hint, TESVT_sharedVTProc, TESVT_scriptPex,
  SynEditMiscClasses, SynEditSearch, SynEditTypes, SynEditKeyCmds, regularexpressionscore, ClipBrd, TESVT_TranslateFunc,
  TESVT_SSTFunc, TESVT_Undo, TESVT_StringsFunc, TESVT_XMLFunc, TESVT_MainLoader, TESVT_SpellCheck, TESVT_Fuz, TESVT_Utils, MMSystem,
  TESVT_StringsStatus, TESVT_Threads, SyncObjs, TESVT_Batcher, TESVT_TranslatorApi, PsAPI, Grids, IdBaseComponent,
  TESVT_NpcMap, System.ImageList, System.UITypes, urlSubs, RegularExpressionsConsts, System.inifiles, ioutils,
  Vcl.Themes, TESVT_RegexUtils;

type
  rCommandData = record
    source, dest: string;
    command, customExport: string;
    GlobalVocab, GlobalImport, GlobalExport: string;
    usedatadir: boolean;
  end;

  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    SkyTree: TVirtualStringTree;
    ProgressBar1: TProgressBar;
    Splitter1: TSplitter;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    dlSkyTree: TVirtualStringTree;
    ilSkyTree: TVirtualStringTree;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Load1: TMenuItem;
    Save1: TMenuItem;
    PopupMenu1: TPopupMenu;
    EditString2: TMenuItem;
    CancelTranslation1: TMenuItem;
    PopupMenu2: TPopupMenu;
    translate1: TMenuItem;
    Close1: TMenuItem;
    Recentfiles1: TMenuItem;
    ValidTranslation1: TMenuItem;
    SetOptions12: TMenuItem;
    TranslationMenu1: TMenuItem;
    TranslateExactMenu1: TMenuItem;
    HeuristicMenu1: TMenuItem;
    N4: TMenuItem;
    translate2: TMenuItem;
    Panel2: TPanel;
    ImageList1: TImageList;
    ValidTranslationPartial: TMenuItem;
    N5: TMenuItem;
    SearchandReplace1: TMenuItem;
    Panel1: TPanel;
    Panel3: TPanel;
    LoadEsp1: TMenuItem;
    EspCompare1: TMenuItem;
    ImageList2: TImageList;
    N8: TMenuItem;
    SaveSSTStrings: TMenuItem;
    N9: TMenuItem;
    Tools1: TMenuItem;
    Panel4: TPanel;
    pagecontrol2: TPageControl;
    TabSheet8: TTabSheet;
    Panel5: TPanel;
    HtmlViewer1: THtmlViewer;
    TabSheet7: TTabSheet;
    LDtree: TVirtualStringTree;
    TabSheet9: TTabSheet;
    VocabTree: TVirtualStringTree;
    TabSheet5: TTabSheet;
    espTree: TVirtualStringTree;
    TabSheet2: TTabSheet;
    StatusBar1: TStatusBar;
    Save2: TMenuItem;
    OpenSSTcustom: TMenuItem;
    N7: TMenuItem;
    AddFieldCustom1: TMenuItem;
    TabSheet6: TTabSheet;
    SynEditRecord: TSynEdit;
    Vocabulary1: TMenuItem;
    langpresetsmenu1: TMenuItem;
    addPreset1: TMenuItem;
    clearPreset1: TMenuItem;
    N2: TMenuItem;
    LocalTimerSearch: TTimer;
    PopupMenu3: TPopupMenu;
    ExpandAll1: TMenuItem;
    CollapseAll1: TMenuItem;
    N3: TMenuItem;
    MenuCloseALL1: TMenuItem;
    xmlSave1: TMenuItem;
    LoadCurrentXML1: TMenuItem;
    TimerLD: TTimer;
    N1: TMenuItem;
    ResetallTranslations1: TMenuItem;
    loadMCMmenu1: TMenuItem;
    McmCompare1: TMenuItem;
    Panel6: TPanel;
    Panel7: TPanel;
    ToolBar3: TToolBar;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    ToolButton18: TToolButton;
    ToolButtonForceSST: TToolButton;
    ToolButton28: TToolButton;
    ToolButton21: TToolButton;
    Panel8: TPanel;
    ButtonedEdit2: TButtonedEdit;
    ToolButton31: TToolButton;
    ToolButton32: TToolButton;
    ToolButton33: TToolButton;
    ToolButton35: TToolButton;
    ToolButton36: TToolButton;
    PopupMenu4: TPopupMenu;
    menuDelete1: TMenuItem;
    menueditsst1: TMenuItem;
    N10: TMenuItem;
    menuApplysst1: TMenuItem;
    LoadScriptPex1: TMenuItem;
    TabSheet10: TTabSheet;
    SynEditSearch1: TSynEditSearch;
    Panel9: TPanel;
    Panel10: TPanel;
    ToolBar2: TToolBar;
    ToolButton37: TToolButton;
    ToolButton38: TToolButton;
    Panel11: TPanel;
    ButtonedEdit3: TButtonedEdit;
    TimerSearchPex: TTimer;
    ToolButton39: TToolButton;
    ToolButton40: TToolButton;
    ImageList3: TImageList;
    AddIdToStr: TMenuItem;
    N12: TMenuItem;
    OldDialogStyle1: TMenuItem;
    N13: TMenuItem;
    ShowRecStruct1: TMenuItem;
    ShowRecStruct2: TMenuItem;
    LoadStringAsDest1: TMenuItem;
    N14: TMenuItem;
    LangSpecific1: TMenuItem;
    ConvertTCSC1: TMenuItem;
    ConvertSCTC1: TMenuItem;
    Batch1: TMenuItem;
    N15: TMenuItem;
    CompareSourceDest: TMenuItem;
    TagDiff1: TMenuItem;
    TagSame1: TMenuItem;
    ValidateallTranslations1: TMenuItem;
    RegexTranslation1: TMenuItem;
    SelectionFixNumberMatch1: TMenuItem;
    SelectionColler: TMenuItem;
    SelectionCopier: TMenuItem;
    translate2fixNumber: TMenuItem;
    N16: TMenuItem;
    Undo1: TMenuItem;
    MenuLocked1: TMenuItem;
    Save3bsa: TMenuItem;
    MenuCloseCurrent: TMenuItem;
    Panel12: TPanel;
    ComboBox1: TComboBox;
    LoadBSA: TMenuItem;
    N17: TMenuItem;
    ButtonedEdit1: TButtonedEdit;
    spCheckOpt1: TMenuItem;
    gbSpellCheck1: TMenuItem;
    SetOptions11: TMenuItem;
    Experimental1: TMenuItem;
    TabSheet11: TTabSheet;
    Panel13: TPanel;
    Edit1: TEdit;
    Panel14: TPanel;
    ToolBar4: TToolBar;
    ToolButton30: TToolButton;
    ToolButton34: TToolButton;
    Panel15: TPanel;
    Panel16: TPanel;
    Restart1: TMenuItem;
    Restart2: TMenuItem;
    N18: TMenuItem;
    Restart3: TMenuItem;
    Startup1: TMenuItem;
    startupMenu1: TMenuItem;
    startupMenu2: TMenuItem;
    startupMenu3: TMenuItem;
    startupMenu4: TMenuItem;
    startupMenu5: TMenuItem;
    startupMenu6: TMenuItem;
    ToolBar5: TToolBar;
    ToolButton43: TToolButton;
    Panel17: TPanel;
    SetOptions31: TMenuItem;
    N19: TMenuItem;
    MenuExport1: TMenuItem;
    MenuImport1: TMenuItem;
    MenuColab1: TMenuItem;
    N11: TMenuItem;
    MenuColabReset1: TMenuItem;
    sstExport1: TMenuItem;
    importSST1: TMenuItem;
    N20: TMenuItem;
    zoom1: TMenuItem;
    Zoom2: TMenuItem;
    default1: TMenuItem;
    MenuDisplay1: TMenuItem;
    N21: TMenuItem;
    SearchMenu: TPopupMenu;
    Menu_Search_Source: TMenuItem;
    Menu_Search_Dest: TMenuItem;
    Menu_Search_Edid: TMenuItem;
    Menu_Search_Rec: TMenuItem;
    TabSheet12: TTabSheet;
    ListBox2: TListBox;
    Panel18: TPanel;
    TimerPageControl2: TTimer;
    Panel19: TPanel;
    AlwaysSkyrimSE1: TMenuItem;
    Restart4: TMenuItem;
    ForceCP21: TMenuItem;
    ComboBox_changeCP: TComboBox;
    N6: TMenuItem;
    ArrayTranslatorApi_2: TMenuItem;
    PopupMenu5: TPopupMenu;
    addPreset2: TMenuItem;
    N22: TMenuItem;
    clearPreset2: TMenuItem;
    Panel23: TPanel;
    ButtonedEdit4: TButtonedEdit;
    Panel24: TPanel;
    ToolBar7: TToolBar;
    ToolButton53: TToolButton;
    ToolButton54: TToolButton;
    Panel20: TPanel;
    Panel21: TPanel;
    ButtonedEdit6: TButtonedEdit;
    Panel22: TPanel;
    ToolBar6: TToolBar;
    ToolButton50: TToolButton;
    ToolButton46: TToolButton;
    ToolButton51: TToolButton;
    ToolButton47: TToolButton;
    Panel26: TPanel;
    Panel25: TPanel;
    Panel27: TPanel;
    ListBox1: TListBox;
    Splitter2: TSplitter;
    Splitter4: TSplitter;
    Panel28: TPanel;
    ListBox3: TListBox;
    ListBox4: TListBox;
    N23: TMenuItem;
    menuReverseSST1: TMenuItem;
    LoadCurrentXML2: TMenuItem;
    MenuToolbox1: TMenuItem;
    menuCustomDic1: TMenuItem;
    Splitter3: TSplitter;
    loadAllMasters1: TMenuItem;
    ToolButton55: TToolButton;
    MenuFilterCurrentFormID1: TMenuItem;
    derived1: TMenuItem;
    DEFUIComponent1: TMenuItem;
    MenuAddHeader1: TMenuItem;
    PopupMenu7: TPopupMenu;
    ClearLog1: TMenuItem;
    QuickTransExactonSel1: TMenuItem;
    Panel29: TPanel;
    PanelFeedBack: TPanel;
    TimerFeedback: TTimer;
    MenuFinalizeEspsc1: TMenuItem;
    N24: TMenuItem;
    OpenScript1: TMenuItem;
    PageControlPex: TPageControl;
    TabSheet13: TTabSheet;
    SynEditPex: TSynEdit;
    TabSheet14: TTabSheet;
    SynEditScript: TSynEdit;
    Restart5: TMenuItem;
    HeaderProcessor1: TMenuItem;
    AltDisplay1: TMenuItem;
    TimerFontResize: TTimer;
    TagNoTrans1: TMenuItem;
    Panel30: TPanel;
    ToolBar8: TToolBar;
    ToolButton59: TToolButton;
    ToolButton65: TToolButton;
    ToolButton13: TToolButton;
    ToolButton25: TToolButton;
    ToolButton11: TToolButton;
    ToolButton41: TToolButton;
    ToolButton66: TToolButton;
    ToolButton24: TToolButton;
    headerWizard1: TMenuItem;
    Wizard1: TMenuItem;
    CloseAndFinalyseAll: TMenuItem;
    UsageAudit1: TMenuItem;
    Restart6: TMenuItem;
    UniqueAudit: TMenuItem;
    DebugMenu: TMenuItem;
    setoption32: TMenuItem;
    Darker1: TMenuItem;
    Darker2: TMenuItem;
    Theme1: TMenuItem;
    ThemeObsidian: TMenuItem;
    ThemeDefault: TMenuItem;
    ThemeLite: TMenuItem;
    ThemeGrey: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    TranslationMeter1: TMenuItem;
    TranslationMeterShow: TMenuItem;
    TranslationMeterAll: TMenuItem;
    Panel31: TPanel;
    Image1: TImage;
    TimerTheme: TTimer;
    Timer_AutoSave: TTimer;
    PopupWarning: TPopupMenu;
    MenuWarn1: TMenuItem;
    MenuWarn2: TMenuItem;
    MenuWarn3: TMenuItem;
    MenuWarn4: TMenuItem;
    MenuWarn5: TMenuItem;
    MenuWarn6: TMenuItem;
    MenuWarn7: TMenuItem;
    MenuWarn8: TMenuItem;
    MenuWarn9: TMenuItem;
    MenuWarnA: TMenuItem;
    N28: TMenuItem;
    MenuWarnCheck: TMenuItem;
    MenuWarnUnCheck: TMenuItem;
    MenuWarnB: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton20: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton7: TToolButton;
    ToolButton6: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton15: TToolButton;
    ToolButton42: TToolButton;
    ToolButton57: TToolButton;
    ToolButton12: TToolButton;
    ToolButton44: TToolButton;
    ToolButton26: TToolButton;
    ToolButton48: TToolButton;
    ToolButton56: TToolButton;
    ToolButton27: TToolButton;
    ToolButton10: TToolButton;
    ToolButton19: TToolButton;
    ToolButton14: TToolButton;
    ToolButton22: TToolButton;
    ToolButton23: TToolButton;
    ToolButton29: TToolButton;
    N29: TMenuItem;
    Menu_RestrictRefRec: TMenuItem;
    BatchCommand: TMenuItem;
    N30: TMenuItem;
    SaveLocalized: TMenuItem;
    SaveLocalizedRandom: TMenuItem;
    TestFixStringID: TMenuItem;
    ToolButton45: TToolButton;
    N31: TMenuItem;
    MenuAddFolder1: TMenuItem;
    MenurenameFolder1: TMenuItem;
    MenuDeleteEmpty1: TMenuItem;
    FixTES4SNAM1: TMenuItem;
    checkTaggedTES4SNAM1: TMenuItem;
    N32: TMenuItem;
    MenuExpandAll1: TMenuItem;
    MenuCollapseAll1: TMenuItem;
    ApiTransMenu: TMenuItem;
    ToolButton49: TToolButton;
    Panel32: TPanel;
    MemoLog: TRichEdit;
    TimerVocabSearch: TTimer;
    RtlToLtr1: TMenuItem;
    function ApplyBatcher(id: integer; bSilent: boolean = false): boolean;
    procedure menuOnClick(Sender: TObject);
    procedure RecentmenuMesure(Sender: TObject; ACanvas: TCanvas; var Width, Height: integer);
    procedure RecentmenuOnDraw(Sender: TObject; ACanvas: TCanvas; ARect: TRect; Selected: boolean);
    procedure PresetOnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure VocabTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure VocabTreeGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SkyTreeBeforeCellPaint(Sender: TBaseVirtualTree; TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; CellPaintMode: TVTCellPaintMode; CellRect: TRect;
      var ContentRect: TRect);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditString2Click(Sender: TObject);
    procedure CancelTranslation1Click(Sender: TObject);
    procedure translate1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure Close1Click(Sender: TObject);
    procedure ValidTranslation1Click(Sender: TObject);
    procedure TranslateExactMenu1Click(Sender: TObject);
    procedure HeuristicMenu1Click(Sender: TObject);
    procedure SkyTreeDblClick(Sender: TObject);
    procedure translate2Click(Sender: TObject);
    procedure ButtonedEdit1RightButtonClick(Sender: TObject);
    procedure ValidTranslationPartialClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure SearchandReplace1Click(Sender: TObject);
    procedure VocabTreePaintText(Sender: TBaseVirtualTree; const TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType);
    procedure LoadEsp1Click(Sender: TObject);
    procedure espTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure espTreeGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
    procedure SkyTreeCompareNodes(Sender: TBaseVirtualTree; Node1, Node2: PVirtualNode; Column: TColumnIndex; var Result: integer);
    procedure EspCompare1Click(Sender: TObject);
    procedure SkyTreeGetImageIndex(Sender: TBaseVirtualTree; Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: boolean; var ImageIndex: TImageIndex);
    procedure SaveSSTStringsClick(Sender: TObject);

    procedure FormActivate(Sender: TObject);
    procedure SkyTreeGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
    procedure SkyTreeHeaderClick(Sender: TVTHeader; HitInfo: TVTHeaderHitInfo);
    procedure SkyTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure SkyTreePaintText(Sender: TBaseVirtualTree; const TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType);
    procedure SkyTreeInitNode(Sender: TBaseVirtualTree; ParentNode, Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
    procedure VocabTreeGetImageIndex(Sender: TBaseVirtualTree; Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: boolean; var ImageIndex: TImageIndex);
    procedure HtmlViewer1HotSpotClick(Sender: TObject; const SRC: string; var Handled: boolean);
    procedure Save1Click(Sender: TObject);
    procedure Save2Click(Sender: TObject);
    procedure OpenSSTcustomClick(Sender: TObject);
    procedure AddFieldCustom1Click(Sender: TObject);
    procedure VocabTreeInitNode(Sender: TBaseVirtualTree; ParentNode, Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
    procedure ToolButton18Click(Sender: TObject);
    procedure ToolButton16Click(Sender: TObject);
    procedure ToolButton17Click(Sender: TObject);
    procedure VocabTreeDragDrop(Sender: TBaseVirtualTree; source: TObject; DataObject: IDataObject; Formats: TFormatArray; Shift: TShiftState; Pt: TPoint; var Effect: integer; Mode: TDropMode);
    procedure VocabTreeDragOver(Sender: TBaseVirtualTree; source: TObject; Shift: TShiftState; State: TDragState; Pt: TPoint; Mode: TDropMode; var Effect: integer; var Accept: boolean);
    procedure VocabTreeDragAllowed(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; var Allowed: boolean);
    procedure VocabTreeCompareNodes(Sender: TBaseVirtualTree; Node1, Node2: PVirtualNode; Column: TColumnIndex; var Result: integer);
    procedure addPreset1Click(Sender: TObject);
    procedure clearPreset1Click(Sender: TObject);
    procedure LocalTimerSearchTimer(Sender: TObject);
    procedure ButtonedEdit1Change(Sender: TObject);
    procedure ToolButton28Click(Sender: TObject);
    procedure espTreeDblClick(Sender: TObject);
    procedure espTreePaintText(Sender: TBaseVirtualTree; const TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType);
    procedure ExpandAll1Click(Sender: TObject);
    procedure CollapseAll1Click(Sender: TObject);
    procedure MenuCloseALL1Click(Sender: TObject);
    procedure xmlSave1Click(Sender: TObject);
    procedure LoadCurrentXML1Click(Sender: TObject);
    procedure TimerLDTimer(Sender: TObject);
    procedure SkyTreeFocusChanged(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex);
    procedure pagecontrol2Change(Sender: TObject);
    procedure ResetallTranslations1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure ForceUtf8onload1Click(Sender: TObject);
    procedure SkyTreeMouseMove(Sender: TObject; Shift: TShiftState; X, Y: integer);
    procedure LDtreeBeforeCellPaint(Sender: TBaseVirtualTree; TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; CellPaintMode: TVTCellPaintMode; CellRect: TRect;
      var ContentRect: TRect);
    procedure SkyTreeEndOperation(Sender: TBaseVirtualTree; OperationKind: TVTOperationKind);
    procedure loadMCMmenu1Click(Sender: TObject);
    procedure McmCompare1Click(Sender: TObject);
    procedure ButtonedEdit2RightButtonClick(Sender: TObject);
    procedure ButtonedEdit2Change(Sender: TObject);
    procedure ToolButton31Click(Sender: TObject);
    procedure VocabTreeMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
    procedure ToolButton35Click(Sender: TObject);
    procedure menuDelete1Click(Sender: TObject);
    procedure LoadScriptPex1Click(Sender: TObject);
    procedure ButtonedEdit3RightButtonClick(Sender: TObject);
    procedure ButtonedEdit3Change(Sender: TObject);
    procedure ToolButton37Click(Sender: TObject);
    procedure ToolButton38Click(Sender: TObject);
    procedure TimerSearchPexTimer(Sender: TObject);
    procedure ButtonedEdit3LeftButtonClick(Sender: TObject);
    procedure SynEditPexGutterClick(Sender: TObject; Button: TMouseButton; X, Y, Line: integer; Mark: TSynEditMark);
    procedure SynEditPexMouseCursor(Sender: TObject; const aLineCharPos: TBufferCoord; var aCursor: TCursor);
    procedure TabSheet10Show(Sender: TObject);
    procedure SynEditPexMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
    procedure AddIdToStrClick(Sender: TObject);
    procedure OldDialogStyle1Click(Sender: TObject);
    procedure ShowRecStruct1Click(Sender: TObject);
    procedure ShowRecStruct(r: trecord);
    procedure ShowRecStruct2Click(Sender: TObject);
    procedure LoadStringAsDest1Click(Sender: TObject);
    procedure ConvertTCSC1Click(Sender: TObject);
    procedure ConvertSCTC1Click(Sender: TObject);
    procedure Batch1Click(Sender: TObject);
    procedure TagDiff1Click(Sender: TObject);
    procedure TagSame1Click(Sender: TObject);
    procedure ValidateallTranslations1Click(Sender: TObject);
    procedure RegexTranslation1Click(Sender: TObject);
    procedure ToolButton41bClick(Sender: TObject);
    procedure SelectionFixNumberMatch1Click(Sender: TObject);
    procedure SelectionCollerClick(Sender: TObject);
    procedure SelectionCopierClick(Sender: TObject);
    procedure translate2fixNumberClick(Sender: TObject);
    procedure Undo1Click(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure MenuLocked1Click(Sender: TObject);
    procedure Save3bsaClick(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure MenuCloseCurrentClick(Sender: TObject);
    procedure LoadBSAClick(Sender: TObject);
    procedure spCheckOpt1Click(Sender: TObject);
    procedure gbSpellCheck1Click(Sender: TObject);
    procedure ButtonedEdit1LeftButtonClick(Sender: TObject);
    procedure ToolButton4MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
    procedure SaveSSTcustomClick(Sender: TObject);
    procedure menueditsst1Click(Sender: TObject);
    procedure ToolButton19Click(Sender: TObject);
    procedure SetOptions12Click(Sender: TObject);
    procedure SetOptions11Click(Sender: TObject);
    procedure Experimental1Click(Sender: TObject);
    procedure ToolButton30Click(Sender: TObject);
    procedure ToolButton34Click(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
    procedure ListBox1DrawItem(Control: TWinControl; Index: integer; Rect: TRect; State: TOwnerDrawState);
    procedure Restart1Click(Sender: TObject);
    procedure startupMenu1Click(Sender: TObject);
    procedure SetOptions31Click(Sender: TObject);
    procedure MenuColab1Click(Sender: TObject);
    procedure sstExport1Click(Sender: TObject);
    procedure importSST1Click(Sender: TObject);
    procedure zoom1Click(Sender: TObject);
    procedure SkyTreeDrawText(Sender: TBaseVirtualTree; TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; const Text: string; const CellRect: TRect; var DefaultDraw: boolean);
    procedure Menu_Search_SourceClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
    procedure ListBox2DrawItem(Control: TWinControl; Index: integer; Rect: TRect; State: TOwnerDrawState);
    procedure ListBox2DblClick(Sender: TObject);
    procedure ButtonedEdit4RightButtonClick(Sender: TObject);
    procedure ButtonedEdit4Change(Sender: TObject);
    procedure TimerPageControl2Timer(Sender: TObject);
    procedure ListBox3DrawItem(Control: TWinControl; Index: integer; Rect: TRect; State: TOwnerDrawState);
    procedure ToolButton26MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
    procedure ListBox3MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
    procedure ListBox3KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ToolButton10Click(Sender: TObject);
    procedure ToolButton43MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
    procedure ToolButton27Click(Sender: TObject);
    procedure ForceCP21Click(Sender: TObject);
    procedure ComboBox_changeCPChange(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure ArrayTranslatorApi_2Click(Sender: TObject);
    procedure ListBox4DrawItem(Control: TWinControl; Index: integer; Rect: TRect; State: TOwnerDrawState);
    procedure Load1Click(Sender: TObject);
    procedure ListBox4MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
    procedure ButtonedEdit6RightButtonClick(Sender: TObject);
    procedure ToolButton47Click(Sender: TObject);
    procedure ToolButton48MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
    procedure ListBox4KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ToolButton50Click(Sender: TObject);
    procedure ToolButton46Click(Sender: TObject);
    procedure ToolButton54Click(Sender: TObject);
    procedure ButtonedEdit6Change(Sender: TObject);
    procedure menuReverseSST1Click(Sender: TObject);
    procedure PopupMenu4Popup(Sender: TObject);
    procedure LoadCurrentXML2Click(Sender: TObject);
    procedure MenuToolbox1Click(Sender: TObject);
    procedure menuCustomDic1Click(Sender: TObject);
    procedure loadAllMasters1Click(Sender: TObject);
    procedure MenuFilterCurrentFormID1Click(Sender: TObject);
    procedure ToolButton55MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
    procedure derived1Click(Sender: TObject);
    procedure DEFUIComponent1Click(Sender: TObject);
    procedure MenuAddHeader1Click(Sender: TObject);
    procedure SkyTreeChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure ClearLog1Click(Sender: TObject);
    procedure QuickTransExactonSel1Click(Sender: TObject);
    procedure ToolButton56Click(Sender: TObject);
    procedure TimerFeedbackTimer(Sender: TObject);
    procedure OpenScript1Click(Sender: TObject);
    procedure ToolButton58Click(Sender: TObject);
    procedure HeaderProcessor1Click(Sender: TObject);
    procedure AltDisplay1Click(Sender: TObject);
    procedure TimerFontResizeTimer(Sender: TObject);
    procedure TagNoTrans1Click(Sender: TObject);
    procedure ToolButton59bClick(Sender: TObject);
    procedure headerWizard1Click(Sender: TObject);
    function executeWizard(filename, lang: string; bResetString, bTemplateFolder: boolean): boolean;
    function executeWizardMCM(bsaName, filename, lang, ext: string; bTemplateFolder: boolean = false): boolean;
    procedure loadListRulesWizard(filename: string = '');
    procedure CloseAndFinalyseAllClick(Sender: TObject);
    procedure UsageAudit1Click(Sender: TObject);
    procedure UniqueAuditClick(Sender: TObject);
    procedure setoption32Click(Sender: TObject);
    procedure Darker1Click(Sender: TObject);
    procedure updateCompoColor;
    procedure SkyTreeHeaderDrawQueryElements(Sender: TVTHeader; var PaintInfo: THeaderPaintInfo; var Elements: THeaderPaintElements);
    procedure SkyTreeAdvancedHeaderDraw(Sender: TVTHeader; var PaintInfo: THeaderPaintInfo; const Elements: THeaderPaintElements);
    procedure ThemeDefaultClick(Sender: TObject);
    procedure Panel31AlignPosition(Sender: TWinControl; Control: TControl; var NewLeft, NewTop, NewWidth, NewHeight: integer; var AlignRect: TRect; AlignInfo: TAlignInfo);
    procedure TranslationMeterShowClick(Sender: TObject);
    procedure TranslationMeterAllClick(Sender: TObject);
    procedure TimerThemeTimer(Sender: TObject);
    procedure Timer_AutoSaveTimer(Sender: TObject);
    procedure MenuWarnCheckClick(Sender: TObject);
    procedure MenuWarningCheck(bCheck: boolean);
    procedure MenuWarnUnCheckClick(Sender: TObject);
    procedure MenuWarn1Click(Sender: TObject);
    procedure ToolButton12MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
    function FormHelp(command: Word; Data: NativeInt; var CallHelp: boolean): boolean;
    procedure BatchCommandClick(Sender: TObject);
    procedure SaveLocalizedClick(Sender: TObject);
    procedure SaveLocalizedRandomClick(Sender: TObject);
    procedure SkyTreeEditing(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; var Allowed: boolean);
    procedure SkyTreeNewText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; NewText: string);
    procedure SkyTreeEdited(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex);
    procedure MenuAddFolder1Click(Sender: TObject);
    procedure MenurenameFolder1Click(Sender: TObject);
    procedure MenuDeleteEmpty1Click(Sender: TObject);
    procedure FixTES4SNAM1Click(Sender: TObject);
    procedure checkTaggedTES4SNAM1Click(Sender: TObject);
    procedure MenuCollapseAll1Click(Sender: TObject);
    procedure MenuExpandAll1Click(Sender: TObject);
    procedure ApiTransMenuClick(Sender: TObject);
    procedure ToolButton49Click(Sender: TObject);
    procedure TimerVocabSearchTimer(Sender: TObject);
    procedure RtlToLtr1Click(Sender: TObject);
  protected
    procedure WMCommand(var Msg: TMessage); message WM_COMMAND;
    procedure WMDropFiles(var Msg: TMessage); message WM_DROPFILES;
    procedure CMDialogKey(var AMessage: TCMDialogKey); message CM_DIALOGKEY;
  private
    cmdWorkSpace, cmdFile: string;
    focusedTree: TVirtualStringTree;
    pageCaptionLabel: array [0 .. 2] of string;
    pexLogCursorLine: integer;
    windowpos: rwindowpos;
    presetlang: tstringlist;
    loadOrder: tstringlist;
    vtChecking: boolean;
    bUseReGexSearch: boolean;
    bDataClosed: boolean;
    bAdvFirstTime: boolean;
    bIdleAutosave: boolean; // trus to activate on next Idle section
    bBlockAutoSave: boolean; // Temporaty block on stuff.
    searchInMode: integer; // 0 = source, 1 = dest, 2 = edid 3= rec
    colabIdFilterAdd: set of byte;
    colabIdFilterSub: set of byte;
    procedure batchCommands;
    procedure runCommands(rCom: rCommandData; slcommand: tstringlist);
    procedure batcherImportFile(rCom: rCommandData; param1, param2, filename: string; Mode: integer);
    procedure launchHeaderWizard;
    procedure ValidateLoadedRules;
    function executeWizardEX(lang: string; bTemplateFolder: boolean): boolean;
    procedure getKeyWordForString(s: tskystr);
    function ApplyBatcherExEsp(loader: tTranslatorLoader; id: integer; bSilent: boolean = false): boolean;
    function ApplyBatcherExMCM(loader: tTranslatorLoader; id: integer; bSilent: boolean = false): boolean;
    procedure ApplyRules(loader: tTranslatorLoader; sk: tskystr; var bNeedMaster: boolean; var totalCount: integer);
    function ApplyRulesEx(loader: tTranslatorLoader; r: trecord; hf: sHeaderSig; s, strans: string; aKwd: aCardinal; oldTb: tBatcherRules; bIsFbStrict: boolean; var bNeedMaster: boolean;
      iFallBack: integer = -1): string;
    function ApplyRulesExMCM(loader: tTranslatorLoader; s, strans: string; tmpEdid: string): string;
    function getFallbackReplacement(loader: tTranslatorLoader; r: trecord; aKwd: aCardinal; iFallBack: integer; oldTb: tBatcherRules; var bNeedMaster: boolean): string;
    procedure validateExternalDecompiler;
    procedure openScriptFromExternal(filenamePex, filenamePsc: string);
    function loadPscScript(filenamePsc: string; var activepage: integer): boolean;
    procedure openVMADScript(sk: tskystr);
    function openVMADScriptEx(bsaName, scriptname: string; var Index: integer): boolean;
    function getVMADScriptFromMaster(loader: tTranslatorLoader; scriptname: string; var Index: integer): boolean;
    function openVMADScriptDispatch(loader: tTranslatorLoader; scriptname: string; bBsa: boolean): boolean;
    procedure CreateCustomDicEntry(s, strans: string);
    procedure ReverseSST(filename: string);
    procedure UsageAudit;
    procedure LoadAllMasters;
    procedure showAdvSearch;
    function SetLanguagePair(s1, s2: string): boolean;
    procedure startLoadsMaster(filenames: tstringlist);
    procedure StartApiTranslationArray(btransOnSel, bAutoNoTransTag, bForceshowUI: boolean; iAutoApiNumber: integer = -1);
    procedure StartApiTranslationArrayEx(iApiNumber: integer; proc: tapiBaseTranslationArray; bNormalize: boolean);
    procedure SelectCodepage(c: TComboBox; cp: String);
    procedure findCurrentCodepage(c: TComboBox; loader: tTranslatorLoader);
    procedure openDefineTagFilter(loader: tTranslatorLoader);
    procedure GetTreeRange(loader: tTranslatorLoader; var a, b: integer; optBool: boolean = false);
    function loadStringAsDest(loader: tTranslatorLoader; filename: string): integer;
    function loadStringAsDestBsa(loader: tTranslatorLoader; bsa: string): integer;
    function loadAddonStringsDirect(loader: tTranslatorLoader; var bStream: TObject; bsaName, folder, addon, lang: string; opt: parseOpt; forceCp: string; bIsCompare: boolean;
      fProc: tcompareproc = nil; bLoadAllStrings: boolean = true): boolean;
    procedure updateSearchIcon(icon: integer);
    procedure globalSpellCheck(loader: tTranslatorLoader);
    procedure globalSpellCheckEx(dlist: tlist);
    procedure doOldDialogStyle(loader: tTranslatorLoader);
    procedure doComponentGenerator(loader: tTranslatorLoader; bAuto: boolean = false; bForceDoNotClean: boolean = false);
    procedure InjectInBSA(loader: tTranslatorLoader; multi: boolean);
    procedure InjectInBSAMulti(loader: tTranslatorLoader; tlistInject: tstringlist);
    procedure InjectInBSAMultiEx(loader: tTranslatorLoader; tlistInject: tstringlist);
    procedure doPrepareInjectInBSA(loader: tTranslatorLoader; tlistInject: tstringlist);
    function generateBsaExportFeedback(tlistInject: tstringlist): string;
    function generateBsaExportAskMulti(bsaPath: string; var output: string): integer;
    function doInjectInBSA(bsafile, bsaFileTmp: string; tlistInject: tstringlist): boolean;
    function openCompareOpt(var proc: tListSortCompare; var fProc, fProcVmad, fprocVmadTrans: tcompareproc; fallBack: boolean; Mode: integer; sTitle: string = ''): boolean;
    function openCompareOpt2(var fProc, fProcVmad, fprocVmadTrans: tcompareproc; Mode: integer; sTitle: string = ''): boolean; overload;
    function openCompareOpt2(var forceCp: string; var fProc: tcompareproc; Mode: integer; sTitle: string = ''): boolean; overload;
    procedure recentRegEx(s: string; t: tstringlist);
    procedure saveSizeList;
    procedure CommonReadmeLoad;
    procedure buildPresetmenu;
    procedure buildPresetmenuEx(mParent: TMenuItem; presetBaseName: string);
    procedure clearPresetMenu(m: TMenuItem);
    function enableEditSST(f: sFdrParam; bTestDeleteFolder: boolean = false): boolean;
    procedure checkVocabTree(cs: TCheckState);
    procedure updateLoadOrder;
    procedure sortVocabTree(Column: integer);
    procedure ExpandVocabTree;
    function getIdAndFolderID(var skf: tskyfolder; defaultid: integer): integer;
    function getDefaultFolder: PVirtualNode;
    function getFolderByID(id: integer): PVirtualNode;
    procedure loadCacheSSTStrings(filename: string; tm: sTESVTMode);
    function loadCacheSSTStringsEx(filename: string; tm: sTESVTMode): integer;
    procedure loadSstString(loader: tTranslatorLoader; folder: string);

    procedure ClearHeuristicData(bOnlyTree: boolean = false);
    procedure searchIntree;
    function prepareWarningSet: sStrInternalParams;
    procedure prepareWarningRegex(parent: TForm; ts: string; bDiscard: boolean);
    function PrepareSearchRegex(var r: TPerlRegEx; s: string; opts: TPerlRegExOptions): boolean;
    function SearchInString(pattern, s: string; var r: TPerlRegEx; var backref: string; bfRegexDiscard: boolean): boolean;
    function SearchInKeyWord(pattern: string; sk: tskystr; var r: TPerlRegEx; var backref: string; bfRegexDiscard: boolean): boolean;
    procedure unloadCache;
    procedure saveVocabData;
    procedure loadStrings(filename: string; savefolder: boolean);
    function doloadStrings(filename: string; savefolder: boolean): integer;
    procedure updateAddonFeedback;
    procedure HeuristicTranslation;
    procedure findStrMatch(loader: tTranslatorLoader; bSort: boolean; fProc, fProcVmad, fprocVmadTrans: tcompareproc; forceAutoTranslate: boolean = false);
    procedure doFindStrMatch(loader: tTranslatorLoader; bSort: boolean; fProc, fProcVmad, fprocVmadTrans: tcompareproc; forceAutoTranslate: boolean = false);
    procedure doFindStrMatchDirect(loader: tTranslatorLoader);
    procedure RegexTranslate(rData: rRegexData);
    function findregexTrans(rData: rRegexData; bLd: boolean; l: integer; s: string; var strans: string): integer;
    procedure addIdToString;
    procedure addIdToStringEx(dlist: tlist; fProc: tcompareproc; a, b, c, d: boolean);
    procedure saveprefs(prefsFolder, prefsFile: string; bCommon: boolean);
    procedure cleanStuff(bFreeCurrent: boolean = false);
    procedure updateCurrentLoader;
    procedure applyLoaderSettings(loader: tTranslatorLoader);
    procedure toggleOneList(b: boolean);
    function initializeLoader(loader: tTranslatorLoader): boolean;
    procedure loadEspCompare(filename: string);
    function doSaveSSTDictionary(loader: tTranslatorLoader; bSaveAs: boolean): string;
    function doAutoSaveSSTDictionary(loader: tTranslatorLoader; bSaveAs: boolean): integer;
    function doSaveSSTCustomDictionary(loader: tTranslatorLoader): string;
    function removeAllLoaders(bSilent: boolean): boolean;
    function removeAndFinalyzeAllLoaders: boolean;
    function checkUserCacheUpdatedLite(loader: tTranslatorLoader): boolean;
    procedure ClearUnchangedLoaderList(loader: tTranslatorLoader);
    procedure ClearSSTLoaderList(loader: tTranslatorLoader);
    procedure NullifyMainLoader(updateMode: boolean = true);
    procedure NullifyMainLoaderData;
    procedure ClearLoaderList(updateMode: boolean = true);
    function removeCurrentLoader(bSilent: boolean): boolean;
    procedure loadprefs(prefsFolder, prefsFile: string; bCommon: boolean);
    procedure buildRecentmenu;
    procedure FinalizeEsp(folder, filename: string; doNotRename: boolean);
    procedure FinalizeStrings(folder, filename: string);
    procedure FinalizeMCM(folder, filename: string; bOriginalName, doNotRename: boolean);
    procedure FinalizePex(folder, filename: string; doNotRename: boolean);
    procedure getStringTextDirect;
    procedure getStringText(doValid: boolean; forcedFocus: tskystr = nil; const newstring: string = '');
    function loadAddonStrings(loader: tTranslatorLoader; folder, addon, lang: string; opt: parseOpt; forceCp: string; locOpts: integer = 0; bAuthBsa: boolean = false; fProc: tcompareproc = nil;
      bBuildCache: boolean = false; bLoadAllStrings: boolean = true): boolean;
    procedure checkAllSearchOpt(b: boolean);
    procedure checkThisSearchOpt(id: integer);
    function getSearchOptState(id: integer): boolean;
    procedure searchReplace(listArray: tAlist; sData: rsearchdata; repainttree: boolean = true);
    procedure batchSearchReplace;

    procedure prepareCacheList;
    procedure LaunchLoadCache;
    procedure recentMenuUpdate(filename: string; bsaType: integer);
    procedure recentMenuUpdateCleanNotFound(filename: string);
    function loadLocalizedEsp(filename: string; savefolder, saveRecent: boolean): integer;
    procedure updateAllLoadersForCacheUpdate(forceCp: string = '');
    procedure updateLoaderForCacheUpdate(loader: tTranslatorLoader; forceCp: string = '');
    procedure updateLoaderForCacheUpdateEx(loader: tTranslatorLoader);
    procedure loadStringInLocalEsp(loader: tTranslatorLoader);
    function launchLocOpt(filename: string): integer;
    function loadDeLocalizedEsp(filename: string; savefolder, saveRecent: boolean): integer;
    procedure startLoadsMultiEsp(filenames: tstringlist; savefolder: boolean);
    function doloadEsp(filename: string; savefolder, saveRecent: boolean): integer;
    procedure loadSingleEsp(filename: string; savefolder, saveRecent: boolean);
    function getQuickLoadCP(filename: string): string;
    procedure updatePageControlCaption;
    procedure updateCacheList(sstName: string); overload;
    procedure updateCacheList(sstName: string; sstNode: PVirtualNode); overload;
    procedure updateDerivedStrings;
    function getSstNode(s: string): PVirtualNode;
    procedure vocabTreeFilter(s: string);
    procedure enableChildMenu(tm: TMenuItem; b, pB: boolean);
    procedure globalUIlockON(iLevel: integer; Text: string = ''; bCloseSearch: boolean = true);
    procedure globalUIlockOFF(iLevel: integer);
    function checkuserCacheUpdated(loader: tTranslatorLoader): boolean;

    procedure findHeuristicFocus;
    procedure setTESVMode(setSearch: boolean);

    procedure openAddonCommandLine(filename: string);
    procedure loadMCM(filename: string; savefolder: boolean);
    function doloadMCM(filename: string; savefolder: boolean): integer;
    function loadAddonMCM(loader: tTranslatorLoader; folder, filename, lang, ext: string; baselist: tlist; bIsOnCompare: boolean): boolean;
    function loadAddonMCMbsa(loader: tTranslatorLoader; bsa: string; baselist: tlist; bIsOnCompare, bGetAddondata: boolean): boolean;
    function browseArchive(var bStream: TObject; const bsafile, fLabelParam: string; const aFolder, aExt: array of string; var filesToLoad: tstringlist; var discardPex: boolean;
      bAllowMulti: boolean = true): boolean;
    procedure loadMCMCompare(filename: string);
    procedure applySst(loader: tTranslatorLoader);
    procedure loadpex(filename: string; savefolder: boolean);
    function doloadpex(filename: string; savefolder: boolean; var Index: integer): boolean;
    procedure startLoadsMultiPex(filenames: tstringlist);
    procedure dosearchinPexText(opt: TSynSearchOptions);
    function assignDialogNAM(loader: tTranslatorLoader; r: trecord; fProc: tcompareproc; sl: tstringlist; fstring: string; skipmax, adjust: integer; doAll, keepChange, aliasCopy, copyall: boolean;
      var bNeedMaster: boolean): integer;
    function getDnamInfoData(loader: tTranslatorLoader; dnamref: cardinal; var n: string; var bNeedMaster: boolean): boolean;
    procedure ConvertTCSC(loader: tTranslatorLoader; Mode: boolean);
    procedure ConvertRTL(loader: tTranslatorLoader; Index, linesize: integer; bResize, bRemovetag: boolean);
    procedure CompareStringsSD(loader: tTranslatorLoader; fProc: tcompareproc);
    procedure CompareStringsSDEx(dlist: tlist; fProc: tcompareproc);
    procedure validateLD(fixNum: boolean);
    procedure updatePexFeedback(p: tPexDecompiler; topline: integer = 1);
    procedure UpdateLoaderSetting(loader: tTranslatorLoader; bSwitchMode: boolean = false);
    procedure OpenBSA(filename: string; savefolder: boolean);
    function OpenFileFromBSA(filename, filetoload: string; var bStream: TObject; discardPex: boolean; var Index: integer): boolean;
    procedure IdleHandler(Sender: TObject; var Done: boolean);
    function loadLocalizedEspCache(filename: string; bAuthBsa: boolean): tTranslatorLoader;
    procedure buildCacheFromEsp(filename: string; bAuthBsa: boolean);
    procedure LaunchBuildAdvancedCache(cacheList: tstringlist; bAuthBsa: boolean);
    procedure clearFuzUI(resetSearchBut: boolean = true);
    procedure clearNPCUI(resetSearchBut: boolean = true);
    Procedure closeEverything;
    function AuthApplicationClose: boolean;
    Procedure restartApplication(forceID: integer = -1; sFile: string = ''; sExtra: string = '');
    procedure validGamesMenu;
    procedure importSSTDirect(sstfile: string);
    procedure importXMLDirect(sstfile: string);
    procedure startStuff(Text: string; closeSearch: boolean = true; drawinLog: boolean = true; disablePc: boolean = true);
    procedure stopStuff(bforcefocus: boolean = false; drawinLog: boolean = true);
    procedure RefreshCheckStates;
    function openArchivedFile(bsaName, filename: string): boolean;
    function openArchivedFileEx(bsaName, filename: string; var Index: integer): boolean;

    // inject
    function F76_doInjectInBSA(bsafile, bsaFileTmp: string; tlistInject: tstringlist): boolean;
    procedure F76_InjectInBSA(dataPath, bsaName: string; filelist: tstringlist);
    procedure F76_InjectInBSAEx(dataPath, bsaName: string; filelist: tstringlist);
    procedure F76_InjectInBSAMulti(dataPath: string; tlistInject, filelist: tstringlist);
    procedure F76_InjectInBSAMultiEx(dataPath, filename: string; tlistInject: tstringlist);
    procedure F76_doPrepareInjectInBSA(bsaName: string; tlistInject: tstringlist);
    procedure f76_doBackupEx(gamePath, bsaName: string);
    function f76_doBackupVerif(gamePath: string; Text: string): boolean;
    procedure f76_doRestoreBackupEx(gamePath, bsaName: string);
    // cache
    procedure saveCacheLocalizedEsp(currentloader: tTranslatorLoader; bLoadedFromCache: boolean);
    procedure setTheme(bDarkFromTheme, bUpdateCompo: boolean);
    procedure drawTranslationStats;
    procedure AutoSave;
    procedure AutoSaveOn;
    procedure AutoSaveOff;
    procedure translatorMeter;
    procedure openlog;
    procedure closeAllLoaders(bSilent: boolean = false);
    procedure closeCurrentLoader(bSilent: boolean = false);
    procedure SaveSSTFiles(bUpdateCacheList: boolean = false);
  public
    procedure SaveFile(overrideOutputFolder: string = ''; overrideMethod: integer = 0);
    procedure OpenOptions(tTab: integer);
    procedure f76_doRestoreBackup(gamePath: string);
    procedure f76_PatchFileWizard(dataPath, lang: string);
    procedure f76_doBackup(gamePath: string);
    function generateFuzMap: boolean;
    function generateNpcMap(forced: boolean): boolean;
    procedure copyFuztoClipBoard(tree: TVirtualStringTree; Node: PVirtualNode; t: tstrings);
    function loadFuzSound(tf: tfuzExport): boolean;
    procedure ReplaceAllStrings(sourceSk: tskystr; v1: sStrParams; autoAccept: boolean; fixNum: boolean = false);
  end;

var
  Form1: TForm1;
  openAppli: boolean = true;
  bDoUpdateStats: boolean = true;
  TCSCList: tlist;

implementation

uses TESVT_EspCompareOpts, TESVT_replaceAll, SynHighlighterPex, TESVT_AddId, TESVT_OldDialog, TESVT_EspStruct, TESVT_batch,
  TESVT_ApplySSTOpts, TESVT_regex, TESVT_XMLExportOpts,
  TESVT_delocOpts, TESVT_Browser, TESVT_Colab, TESVT_ColabFilter, TESVT_Codepage, TESVT_ChooseCP, TESVT_ToolBox, TESVT_AdvSearch,
  TESVT_DefUIGen, TESVT_FormData, TESVT_HeaderWizard, TESVT_commandProcessor, TESVT_TranslatorApiDialog, TESVT_RtlPreview;
{$R *.dfm}
// ------------------------------

procedure TForm1.openlog;
begin
  pagecontrol2.ActivePageIndex := 8;
end;

procedure TForm1.translatorMeter;
var
  bAuto: boolean;
begin
  // translator Meter
  if getMainLoaderStats(bAuto, TranslationMeterAll.checked) then // or bDoUpdateStats
  begin
    drawTranslationStats;
    bDoUpdateStats := false;
  end;
  Panel31.visible := bAuto and TranslationMeterShow.checked; // autohide the widget if the mod is fully translated.
end;

procedure TForm1.IdleHandler(Sender: TObject; var Done: boolean);
begin
  Done := false;
  if bIdleReady then
  begin
    translatorMeter;
    // autosave
    if (iUseAutosaveDelay > 0) and not bBlockAutoSave then
      if bIdleAutosave then
      begin
        bIdleAutosave := false;
        AutoSave;
      end;
  end;
  Done := true;
end;

procedure TForm1.CMDialogKey(var AMessage: TCMDialogKey);
begin
  if (AMessage.CharCode = VK_TAB) and (GetKeyState(VK_CONTROL) < 0) then
  begin
    if GetKeyState(VK_SHIFT) < 0 then
      tabUpdateComboBox(-1)
    else
      tabUpdateComboBox(1);
    AMessage.Result := 1;
  end
  else
    inherited;
end;

procedure TForm1.setTheme(bDarkFromTheme, bUpdateCompo: boolean);
var
  i: integer;
begin
  if not inrange(iTheme, 0, high(atheme)) then
    iTheme := 0;

  if bDarkFromTheme then
    iDarkPercent := aThemeDarkPercentUI[iTheme];
  darkPercent := getDarkPercent(0);

  if assigned(form2) then
    form2.getWinSize;
  if assigned(AdvSearchForm) then
    AdvSearchForm.getWinSize;

  DragAcceptFiles(Handle, false);
  Application.ProcessMessages;

  TStyleManager.SetStyle(atheme[iTheme]);
  if bUpdateCompo then
    updateCompoColor;
  Application.ProcessMessages; // process the message queue;

  DragAcceptFiles(Handle, true);

  for i := 0 to Theme1.count - 1 do
    if Theme1.items[i].tag = iTheme then
      Theme1.items[i].checked := true;

  // crash with tvirtualtree. Edit:  TVclStyleScrollBarsHook to be sure the hook is not nil.
  {
    destructor TVclStyleScrollBarsHook.Destroy;
    begin
    if Assigned(FVertScrollWnd) then
    FVertScrollWnd.StyleHook:= nil;
    FreeAndNil(FVertScrollWnd);
    if Assigned(FHorzScrollWnd) then
    FHorzScrollWnd.StyleHook:= nil;
    FreeAndNil(FHorzScrollWnd);
    inherited;
    end;
  }
end;

procedure TForm1.ThemeDefaultClick(Sender: TObject);
begin
  iTheme := TMenuItem(Sender).tag;

  startStuff('');
  TimerTheme.Enabled := false;
  TimerTheme.Enabled := true;

end;

procedure TForm1.WMCommand(var Msg: TMessage);
var
  lbIdent: Word;
begin
  inherited;

  if (Msg.wParam div $FFFF) = LBN_SELCHANGE then
  begin
    lbIdent := Msg.wParam and $FFFF;
    ShowMessage('Listbox ' + IntToStr(lbIdent) + 'selection changed');
  end;
end;

procedure TForm1.WMDropFiles(var Msg: TMessage);
var
  DropH: THandle;
  DroppedFileCount: integer;
  FileNameLength: integer;
  filename: string;
  i: integer;
begin
  inherited;
  DropH := Msg.wParam;
  try
    DroppedFileCount := DragQueryFile(DropH, $FFFFFFFF, nil, 0);
    globalUIlockON(20);
    for i := 0 to pred(DroppedFileCount) do
    begin
      FileNameLength := DragQueryFile(DropH, i, nil, 0);
      SetLength(filename, FileNameLength);
      DragQueryFile(DropH, i, PChar(filename), FileNameLength + 1);
      openAddonCommandLine(filename);
    end;
  finally
    DragFinish(DropH);
    globalUIlockOFF(20);
  end;
  Msg.Result := 0;
end;

procedure TForm1.openAddonCommandLine(filename: string);
var
  ext: string;
begin
  Application.ProcessMessages;
  ext := ansilowercase(extractFileExt(filename));
  if (ext = '.pex') then
    loadpex(filename, false)
  else if (ext = '.sst') then
    importSSTDirect(filename)
  else if (ext = '.xml') then
    importXMLDirect(filename)
  else if CustomTxtParams.isValidTxtExt(ext) then
    loadMCM(filename, false)
  else if (ext = '.esp') or (ext = '.esm') or (ext = '.esl') then
    loadSingleEsp(filename, false, true)
  else if (ext = '.bsa') or (ext = '.ba2') then
    OpenBSA(filename, false);
  {
    else
    begin
    for i := 0 to high(strList) do
    if ext = strList[i] then
    begin
    loadStrings(filename, true);
    exit;
    end;
    end; }
end;

procedure TForm1.importXMLDirect(sstfile: string);
var
  fProc, fProcVmad, fprocVmadTrans: tcompareproc;
begin
  if not assigned(MainLoader) then
    exit;

  iCompareEspOpt[1] := 0;
  bDontUseFilter := false;
  bApplyTagOnly := false;
  iApplySSTModeOpt := 2;
  bResetStateOpt := false;
  fProc := getfProcCompareOpt(bDontUseFilter, iCompareEspOpt[1]);
  fProcVmad := getfProcCompareOptVMAD(bDontUseFilter, iCompareEspOpt[1]);
  fprocVmadTrans := getfProcCompareOptVMADString(bDontUseFilter, iCompareEspOpt[1]);

  Game_XMLFolder := ExtractFilePath(sstfile);

  startStuff(formatres('ImportXMLRes', [sstfile]));
  XMLImportbase(sstfile, MainLoader.listArray, iApplySSTModeOpt, fProc, fProcVmad, fprocVmadTrans, bResetStateOpt);
  setTreeSortAndSort(3);
  VocabTree.Repaint;
  stopStuff;
end;

procedure TForm1.importSSTDirect(sstfile: string);
var
  fProc, fProcVmad, fprocVmadTrans: tcompareproc;
  proc: tListSortCompare;
begin
  if not assigned(MainLoader) then
    exit;

  iCompareEspOpt[1] := 0;
  bDontUseFilter := false;
  bApplyTagOnly := false;
  iApplySSTModeOpt := 2;
  bResetStateOpt := false;
  fProc := getfProcCompareOpt(bDontUseFilter, iCompareEspOpt[1]);
  fProcVmad := getfProcCompareOptVMAD(bDontUseFilter, iCompareEspOpt[1]);
  fprocVmadTrans := getfProcCompareOptVMADString(bDontUseFilter, iCompareEspOpt[1]);
  proc := getProcSortCompare(iApplySSTModeOpt, true);

  Game_SSTFolder := ExtractFilePath(sstfile);
  startStuff(getRes('Fbk_applySST'));
  MainLoader.doApplySst(sstfile, proc, fProc, fProcVmad, fprocVmadTrans, bResetStateOpt, bApplyTagOnly, false);
  setTreeSortAndSort(3);
  VocabTree.Repaint;
  stopStuff;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  i, j: integer;
  testSizeList: tstringlist;
  HL: TSynSampleSyn;
  bNoPref: boolean;
begin
  bIdleReady := false;
  Lock := tCriticalSection.create;
  bDataClosed := false;
  randomize;
  testCanvas := canvas;
  bAdvFirstTime := true;
  bNoPref := false;
  bIdleAutosave := false;
  bBlockAutoSave := true;
  // dllsearch

  // ---default
  initWindowPos(windowpos);
  initWindowPos(SearchrWindowpos);
  // default pages
  mainPageControl := PageControl1;
  gTimerFeedback := TimerFeedback;
  gPanelFeedback := PanelFeedBack;
  PageControl1.ActivePageIndex := 0;
  pagecontrol2.ActivePageIndex := 0;
  VTtreeList := tlist.create;
  VTtreeList_Tag := tlist.create;
  Application.OnIdle := IdleHandler;
  FormatSettings.decimalSeparator := '.';
  mainpath := ExtractFilePath(Application.Exename);
  toolPath := mainpath + TOOLFIXEDPATH;
  tmpFuzPath := mainpath + TOOLFIXEDPATH + TMPTOOLSUBFOLDER;
  mainform := self;
  undoMenu := Undo1;

  ProgressBar := ProgressBar1;
  ProgressBar.parent := StatusBar1;
  ProgressBar.SetBounds(4, 2, StatusBar1.Panels[0].Width - 5, StatusBar1.Height - 3);
  stringLog := MemoLog.lines;
  treearray[0] := SkyTree;
  treearray[1] := dlSkyTree;
  treearray[2] := ilSkyTree;

  VTtreeList.add(SkyTree);
  VTtreeList.add(dlSkyTree);
  VTtreeList.add(ilSkyTree);
  VTtreeList.add(LDtree);

  VTtreeList_Tag.add(SkyTree);
  VTtreeList_Tag.add(dlSkyTree);
  VTtreeList_Tag.add(ilSkyTree);

  resetTreeArrayState;
  searchdata.s1 := '';
  searchdata.s2 := '';
  searchdata.strformat := defaultReplacePattern;
  searchdata.mode1 := 1;
  searchdata.mode2 := 1;
  searchdata.allList := false;
  searchdata.caseSensitive := false;
  searchdata.restrictvisible := true;
  pexLogCursorLine := 0;
  StatusBar := StatusBar1;
  // hint
  Application.ShowHint := true;
  HintWindowClass := TTESVTHint;
  Application.hintpause := 500;
  Application.HintHidePause := 99999;
  genericTreeImageList := ImageList1;
  HL := TSynSampleSyn.create(self);
  SynEditPex.Highlighter := HL;
  SynEditScript.Highlighter := HL;
  TimerSearch := LocalTimerSearch;
  // -----------dllpath-------------------
{$IFDEF WIN64}
  SetDllDirectory(PChar(mainpath + '\bin\x64\'));
{$ELSE}
  SetDllDirectory(PChar(mainpath + '\bin\x32\'));
{$ENDIF}
  // compute commandline
  cmdWorkSpace := '';
  cmdFile := '';
  for i := 1 to ParamCount do
  begin
    if paramstr(i)[1] = '-' then
    begin
      cmdWorkSpace := ansilowercase(copy(paramstr(1), 2, 50));
      if cmdWorkSpace = 'noprefs' then
        bNoPref := true;
    end
    else
      cmdFile := paramstr(i);
    // dofeedback(paramStr(i));
  end;

  // -----------COMMON Prefs-------------------
  fillchar(askPrefsArray, SizeOf(askPrefsArray), 0);
  if not bNoPref then
    loadprefs(mainpath + PREFS_BASEFOLDER, mainpath + PREFS_BASEFOLDER + USERPREFSCOMMON_FILE, true);

  // ---theme
  setTheme(false, false);
  // DragAcceptFiles(Handle, true);
  // --------res-------------->
  initressources;

  // -------------TranslatorApi
  apiData := tApiPersistentData.create;
  // --------------------------

  for i := 0 to pred(Startup1.count) do
    with Startup1.items[i] as TMenuItem do
    begin
      if tag = LOADING_PREFS_ID then
        checked := true;
    end;

  // get Game
  if cmdWorkSpace <> '' then
    setGameByCommand(cmdWorkSpace)
  else
    setGameByIni;

  // recorddef
  if bUseRecorddef and authFileAccess(mainpath + CURRENT_GAME_SUBFOLDER + RECORDSFILENAME_FILE) then
  begin
    SynEditRecord.clear;
    SynEditRecord.lines.loadfromfile(mainpath + CURRENT_GAME_SUBFOLDER + RECORDSFILENAME_FILE);
  end;
  initrecDefList(SynEditRecord.lines);
  initlFastRec;

  lCtdaFunc := loadStringList(mainpath + CURRENT_GAME_SUBFOLDER + CTDAFUNC_FILE, true);

  if bWriteEmoteKeyWord then
    EmoteDefinitionList := tstringlist.create
  else
    EmoteDefinitionList := loadStringList(mainpath + CURRENT_GAME_SUBFOLDER + EMOTEEXPORTFILE_FILE, false);
  DialSubTypeList := loadStringList(mainpath + CURRENT_GAME_SUBFOLDER + DIALSUBTYPE_FILE, true);

  lWordExceptionList := loadStringList(mainpath + PREFS_BASEFOLDER + wordExceptionFile, true);
  // --------Master Loader----------------
  MainLoader := nil;
  currentTesvMode := sTESVTNone;
  loaderList := ComboBox1;
  updateStatusFile(-1, 0);
  // -----------------------------------------
  LocalVocabBaseList := tlist.create;
  LocalVocabEdidList := tlist.create;
  vocabBaselist := tlist.create;
  vocabEdidList := tlist.create;
  HeuristicList := tlist.create;
  VocabTree.NodeDataSize := SizeOf(rtreedatafdr);
  onewordList := tlist.create;

  getAllGamePath(0);
  Game_XMLFolder := mainpath + CURRENT_PREFS_SUBFOLDER;
  Game_SSTFolder := mainpath + CURRENT_PREFS_SUBFOLDER;

  // SSTCacheFolder:= mainpath + CURRENT_CACHE_BASEFOLDER;
  datacache := mainpath + CURRENT_DATACACHE_BASEFOLDER;
  // ForceDirectories(SSTCacheFolder);
  ForceDirectories(mainpath + SPELL_CHECK_DICPATH);
  ForceDirectories(toolPath);
  ForceDirectories(tmpFuzPath);
  ForceDirectories(datacache);

  SSTUserFolder := mainpath + CURRENT_USERDIC_BASEFOLDER;
  SSTUserFolderBackup := mainpath + CURRENT_USERDIC_SUBBACKUP;
  SSTUserFolderAutoBackup := mainpath + CURRENT_USERDIC_AUTOBACKUP;
  ForceDirectories(SSTUserFolderBackup);
  ForceDirectories(SSTUserFolderAutoBackup);
  vocabFiles := loadStringList(mainpath + CURRENT_GAME_SUBFOLDER + vocabfileName_FILE, false);
  // esp init
  espTree.NodeDataSize := SizeOf(rEspData);
  // PEX
  pexNoTransProcList := loadStringList(mainpath + CURRENT_GAME_SUBFOLDER + pexNoTransProcName_FILE, true);

  codepageFiles := loadStringList(mainpath + CURRENT_GAME_SUBFOLDER + codepagefileName_FILE, false);
  for i := 0 to codepageFiles.count - 1 do
    codepageFiles[i] := ansilowercase(codepageFiles[i]);

  for i := 0 to high(supportedCodepage) do
    ComboBox_changeCP.items.add(supportedCodepage[i]);
  ComboBox_changeCP.itemIndex := 0;

  bGameHasWizardProc := authFileAccess(mainpath + CURRENT_GAME_SUBFOLDER + HeaderWizardIni);

  // fieldsize //bsaveSizeList to force benchmark
  testSizeList := loadStringList(mainpath + CURRENT_GAME_SUBFOLDER + recordSizeMaxName_FILE, false);
  testSizeList.duplicates := dupIgnore;
  initFieldSizeList(testSizeList);
  testSizeList.free;
  // prefs list init
  recentAddon := tstringlist.create;
  presetlang := tstringlist.create;
  presetlang.sorted := true;
  presetlang.duplicates := dupIgnore;
  loadOrder := tstringlist.create;

  // regex base init:
  RegexData.s1 := '(.*)';
  RegexData.s2 := '%1';
  RegexData.noAlias := true;
  RegexData.LDLevel := 2;
  RegexData.mode1 := 1;
  RegexData.mode2 := 0;
  RegexData.bILocked := true;
  RegexData.invalidate := true;
  RegexData.caseInsensitive := true;
  RegexData.allList := false;

  bUseReGexSearch := false;

  sCurrentDEFUIOut := sDEFUIOut[CURRENT_GAME_ID];

  lRegEx_RegEx := tstringlist.create;
  lRegEx_Replace := tstringlist.create;
  lRegExPreset_Label := tstringlist.create;
  lRegExPreset_RegEx := tstringlist.create;
  lRegExPreset_Replace := tstringlist.create;
  lAdvSearchPreset := tstringlist.create;
  lfileUsingVMAD := tstringlist.create;
  lfileUsingVMAD.sorted := true;
  lfileUsingVMAD.duplicates := dupIgnore;
  lDEFUIIgnore := tstringlist.create;

  fuz := tfuz.create;
  lFuzBSA := tstringlist.create;
  derivedParseList := tstringlist.create;
  lRulesNoTransListIn := tstringlist.create;
  lRulesNoTransListOut := tstringlist.create;
  lBSAdef := tstringlist.create;
  lBSAAlias := tstringlist.create;
  lScriptdef := tstringlist.create;
  defUIoptions := tstringlist.create;

  CustomTxtParams := tcustomtxt.create(loadStringList(mainpath + miscPath + customTxtDefinition, false));

  // prefs
  loadprefs(mainpath + CURRENT_PREFS_SUBFOLDER, mainpath + CURRENT_PREFS_SUBFOLDER + USERPREFS_FILE, false);
  if lfileUsingVMAD.count = 0 then
    loadStringListEx(lfileUsingVMAD, mainpath + CURRENT_PREFS_SUBFOLDER + USERPREFS_VmadFile_FILE, true);

  InitTreeOpts(LDtree, genericTreeImageList);
  for j := 0 to 2 do
  begin
    pageCaptionLabel[j] := strListLabel[j] + '[0/0]';
    InitTreeOpts(treearray[j], genericTreeImageList);
  end;

  sPref_rxPatternNumber := rxPatternNumber;
  sPref_rxPatternAliasStrict := rxPatternAliasStrict;
  sPref_rxPatternAlias := rxPatternAlias;
  sPref_rxPatternWord := rxPatternWord;
  regExUtil := tregExUtil.create;

  lDEFUIHeader := loadStringList(mainpath + CURRENT_PREFS_SUBFOLDER + sDefUITagList_FILE, true);
  if lDEFUIHeader.count = 0 then
    lDEFUIHeader.Text := sDefaultDEFUIHeader;
  if defUIoptions.count = 0 then
    defUIoptions.Text := defaultdefUIoptions[CURRENT_GAME_ID];

  if lFuzBSA.count = 0 then
    lFuzBSA.Text := defaultFUZBSA;
  if derivedParseList.count = 0 then
    derivedParseList.Text := defaultDerivedRegex;
  if lRulesNoTransListIn.count = 0 then
    lRulesNoTransListIn.Text := lRulesNoTransListInDefault;
  if lRulesNoTransListOut.count = 0 then
    lRulesNoTransListOut.Text := lRulesNoTransListOutDefault;

  if lScriptdef.count = 0 then
    lScriptdef.Text := defaultscriptdef[CURRENT_GAME_ID];
  if lBSAdef.count = 0 then
    lBSAdef.Text := defaultBSAdef[CURRENT_GAME_ID];
  if lBSAAlias.count = 0 then
    lBSAAlias.Text := defaultBSAAlias[CURRENT_GAME_ID];
  if lDEFUIIgnore.count = 0 then
    lDEFUIIgnore.Text := defaultDefUIIgnoreList[CURRENT_GAME_ID];
  // position:
  if windowpos.Width > screen.Width then
    Width := screen.Width
  else
    Width := windowpos.Width;
  if windowpos.Height > screen.Height then
    Height := screen.Height
  else
    Height := windowpos.Height;
  top := windowpos.top;
  left := windowpos.left;

  if windowpos.Control1 > windowpos.Height - 100 then
    windowpos.Control1 := windowpos.Height - 100;
  Panel4.Height := windowpos.Control1;
  initResVar;
  Init_caption(self);
  headerString := tstringlist.create;
  if authFileAccess(SSTResFolder + HTM_HEADER) then
    headerString.loadfromfile(SSTResFolder + HTM_HEADER);
  CommonReadmeLoad;
  // ----------last Inits

  validGamesMenu;
  ResetFocusedData;
  updateAddonFeedback;
  buildRecentmenu;
  buildPresetmenu;
  ToolButton19.Enabled := false;
  searchInMode := 0;
  colabIdFilterAdd := [0];
  colabIdFilterSub := [0];
  setTESVMode(false);
  prepareCacheList;
  dummySk := tskystr.init(0, 0, '', '', 0, 0, [], [], nil, false);
  fillchar(mainLoaderStat, SizeOf(mainLoaderStat), 0);
  checkAllSearchOpt(true);

  findCurrentCodepage(ComboBox_changeCP, nil);

  // updateCaption  for XML import
  LoadCurrentXML1.caption := getRes('lbl_XML') + format(' (%s)', [basePROG_NAME]);
  LoadCurrentXML2.caption := getRes('lbl_XML') + format(' (%s)', [baseAltTranslator1]);

  bIdleReady := true;
  // -----------------
  MenuFinalizeEspsc1.ShortCut := $6053;
  validateExternalDecompiler;
{$IFDEF DEBUG}
  UsageAudit1.visible := true;
  derived1.visible := true;
  AltDisplay1.visible := true;
  TagNoTrans1.visible := true;
  DebugMenu.visible := true;
{$ENDIF}
end;

procedure TForm1.validateExternalDecompiler;
begin
  bUseExternalDecompiler := bUseExternalDecompilerOpt and (sUseExternalDecompilerPath <> '') and authFileAccess(sUseExternalDecompilerPath);
  TabSheet14.TabVisible := bUseExternalDecompiler;
end;

procedure TForm1.FormDeactivate(Sender: TObject);
begin
  Undo1.ShortCut := 0;
end;

function TForm1.FormHelp(command: Word; Data: NativeInt; var CallHelp: boolean): boolean;
begin
  CallHelp := false;
  Result := false;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  globalUIlockON(1);
  // -------------------
  UpdateLoaderSetting(MainLoader);
  // -------------------
  MainLoader := GetNewCurrentLoader;
  updateCurrentLoader;
  globalUIlockOFF(1);
end;

procedure TForm1.ComboBox_changeCPChange(Sender: TObject);
begin
  if assigned(MainLoader) then
  begin
    globalUIlockON(10);
    updateLoaderForCacheUpdate(MainLoader, ComboBox_changeCP.items[ComboBox_changeCP.itemIndex]);
    loaderList.OnChange(loaderList);
    globalUIlockOFF(10);
  end;
end;

procedure TForm1.CommonReadmeLoad;
begin
  openHtmFile(sstreadme, HtmlViewer1, HTMLType);
end;

procedure TForm1.saveprefs(prefsFolder, prefsFile: string; bCommon: boolean);
var
  t: tstringlist;
  i: integer;
  strtmp: string;
  windata: TWindowPlacement;
begin
  t := tstringlist.create;
  if bCommon then
  begin
    windata.length := SizeOf(windata);
    GetWindowPlacement(Handle, @windata);
    t.add('UILang=' + lang_res);
    t.add('SYNFONTSIZE=' + IntToStr(SearchSynFontSize));
    t.add('VTFONT=' + virtualTreeFont);
    t.add('VTFIXEDFONT=' + virtualTreeFixedFont);
    t.add('VTFONTSIZE=' + IntToStr(virtualTreeFontsize[0]));
    t.add('iTheme=' + IntToStr(iTheme));
    t.add('iDarkPercent=' + IntToStr(iDarkPercent));
    t.add('startup_Id=' + IntToStr(LOADING_PREFS_ID));
    t.add('last_Id=' + IntToStr(CURRENT_GAME_ID));
    t.add('authSound=' + booltostr(OptAuthSound));
    t.add('VTSimpleLine3=' + booltostr(bVTSimpleLine));
    t.add('bUseSpellCheck=' + booltostr(bUseSpellCheck));
    t.add('iUseSpellCheckID=' + IntToStr(iUseSpellCheckID));
    t.add('sUseSpellCheckDic=' + sUseSpellCheckDic);
    t.add('iSpParseOptions=' + IntToStr(iSpParseOptions));
    t.add('ilastUsedApi=' + IntToStr(ilastUsedApi));
    t.add('ilastUsedApiArray=' + IntToStr(ilastUsedApiArray));
    t.add('iUndoListMax=' + IntToStr(iUndoListMax));
    t.add('bAllowDirectEdit=' + booltostr(bAllowDirectEdit));
    t.add('bAllowDirectEditCtrl=' + booltostr(bAllowDirectEditCtrl));
    // ----------
    // sauvegarde taille windows
    t.add('POSW=' + IntToStr(windata.rcNormalPosition.right - windata.rcNormalPosition.left));
    t.add('POSH=' + IntToStr(windata.rcNormalPosition.bottom - windata.rcNormalPosition.top));
    // sauvegarde pos de windows
    t.add('POST=' + IntToStr(windata.rcNormalPosition.top));
    t.add('POSL=' + IntToStr(windata.rcNormalPosition.left));
    t.add('PAGE1=' + IntToStr(Panel4.Height));
    // sauvegarde taille searchwindows
    t.add('SPOSW=' + IntToStr(SearchrWindowpos.Width));
    t.add('SPOSH=' + IntToStr(SearchrWindowpos.Height));
    // sauvegarde pos de searchwindows
    t.add('SOST=' + IntToStr(SearchrWindowpos.top));
    t.add('SPOSL=' + IntToStr(SearchrWindowpos.left));
    t.add('SPAGE1=' + IntToStr(SearchrWindowpos.Control1));
    t.add('SPAGE2=' + IntToStr(SearchrWindowpos.List2));
    t.add('SPAGE3=' + IntToStr(SearchrWindowpos.List3));
    // sauvegarde taille Advsearchwindows
    t.add('AdvSPOSW=' + IntToStr(AdvSearchrWindowpos.Width));
    t.add('AdvSPOSH=' + IntToStr(AdvSearchrWindowpos.Height));
    // sauvegarde pos de Advsearchwindows
    t.add('AdvSPOST=' + IntToStr(AdvSearchrWindowpos.top));
    t.add('AdvSPOSL=' + IntToStr(AdvSearchrWindowpos.left));
    t.add('SPANELSearchW=' + IntToStr(Panel1.Width));

    t.add('regexSPOSW=' + IntToStr(regexwWidth));
    t.add('regexSPOSH=' + IntToStr(regexwHeight));
    t.add('regexSPOST=' + IntToStr(regexwtop));
    t.add('regexSPOSL=' + IntToStr(regexwleft));
    t.add('bshowProcessorSave=' + booltostr(bshowProcessorSave));
    t.add('bForceSSTLoad=' + booltostr(ToolButtonForceSST.down));

    // argPrefs
    strtmp := '';
    for i := 0 to high(askPrefsArray) do
      strtmp := strtmp + IntToStr(askPrefsArray[i]) + ',';
    t.add('ArgsPref=' + copy(strtmp, 1, length(strtmp) - 1));

    t.add('bLocalizedVerboseWarning=' + booltostr(bLocalizedVerboseWarning));
    t.add('bApiTranslationVerbose=' + booltostr(bApiTranslationVerbose));
    t.add('bRessourceFallBackFeedback=' + booltostr(bRessourceFallBackFeedback));
  end
  else
  begin
    t.add('isFirstLaunch2=' + booltostr(isfirstLaunch));
    t.add('bUseSimpleMemo=' + booltostr(bUseSimpleMemo));
    t.add('bSimpleMemoRTL=' + booltostr(bSimpleMemoRTL));
    t.add('HEADERFONT=' + HeaderComponentFont);
    t.add('Game_CacheStringFolder=' + Game_CacheStringFolder);
    t.add('Game_CacheDataFolder=' + Game_CacheDataFolder);
    t.add('Game_FuzDataFolder=' + Game_FuzDataFolder);
    t.add('StringsAddonFolder=' + Game_StringFolder);
    t.add('Game_StringCompareFolder=' + Game_StringCompareFolder);
    t.add('papyrusPexFolder=' + Game_PexFolder);
    t.add('EspFolder=' + Game_EspFolder);
    t.add('NpcMapFolder=' + Game_NpcMapFolder);
    t.add('XMLFolder=' + Game_XMLFolder);
    t.add('SSTFolder=' + Game_SSTFolder);
    t.add('BSAFolder=' + Game_BSAFolder);
    t.add('TXTFolder=' + Game_TXTFolder);
    t.add('EspFolderSaveAs=' + Game_EspFolderSaveAs);
    t.add('EspFolderFixedExport=' + Game_EspFolderFixedExport);
    t.add('bTranslationMeterShow=' + booltostr(TranslationMeterShow.checked));
    t.add('bUseFixedFolderExport=' + booltostr(bUseFixedFolderExport));
    t.add('bUseExternalDecompilerOpt=' + booltostr(bUseExternalDecompilerOpt));
    t.add('sUseExternalDecompilerpath=' + sUseExternalDecompilerPath);
    t.add('EspCompareFolder=' + Game_EspCompareFolder);
    t.add('EspBackup=' + EspBackup_Folder);
    t.add('SourceLang=' + Sourcelanguage);
    t.add('DestLang=' + Destlanguage);
    t.add('useAddonHash=' + booltostr(bUseAddonHash2));
    t.add('EspBackupOptSimple=' + booltostr(OptEspBackupOptSimple));
    t.add('EspBackupOptFolder=' + booltostr(OptEspBackupOptFolder));
    t.add('UseLocOptions=' + booltostr(bUseLocOptions));
    t.add('showNullDefault2=' + booltostr(ToolButton27.down));
    t.add('sstbackupCount=' + IntToStr(sstBackupCount));
    t.add('noReplace=' + booltostr(tesvtnoReplace));
    t.add('bGetVMADStrings=' + booltostr(bGetVMADStrings));
    t.add('AuthAutoTranslate2=' + booltostr(bAuthAutoTranslate));
    t.add('bForceCodepageOnLoad=' + booltostr(bForceCodepageOnLoad));
    t.add('bForceCodepageOnSave=' + booltostr(bForceCodepageOnSave));
    t.add('bSaveCodepageSetting=' + booltostr(bSaveCodepageSetting));
    t.add('bDerivedVerbose=' + booltostr(bDerivedVerbose));
    t.add('bAllowPexCodepage=' + booltostr(bAllowPexCodepage));
    t.add('bEnableDerived=' + booltostr(bEnableDerived));
    t.add('bStringAutoTrim=' + booltostr(bStringAutoTrim));
    t.add('bApplyVMADOpt=' + booltostr(bApplyVMADOpt));
    t.add('sForceCodepageOnLoad=' + sForceCodepageOnLoad);
    t.add('sForceCodepageOnSave=' + sForceCodepageOnSave);
    t.add('bConfirmChange=' + booltostr(bConfirmChange));
    t.add('bPexUnLockGlobalVar=' + booltostr(bPexUnLockGlobalVar));
    t.add('bLoadEspSingleListA=' + booltostr(bLoadEspSingleListA));
    t.add('bSwitchAutoDial=' + booltostr(bSwitchAutoDial));
    t.add('bHeaderAdvanced=' + booltostr(bHeaderAdvanced));
    t.add('bForceAltHeaderDisplay=' + booltostr(bForceAltHeaderDisplay));
    t.add('bUseDataCache=' + booltostr(bUseDataCache));
    t.add('sPref_rxPatternNumber=' + sPref_rxPatternNumber);
    t.add('sPref_rxPatternAliasStrict=' + sPref_rxPatternAliasStrict);
    t.add('sPref_rxPatternAlias=' + sPref_rxPatternAlias);
    t.add('sPref_rxPatternWord=' + sPref_rxPatternWord);

    t.add('sCurrentDEFUIOut=' + sCurrentDEFUIOut);
    t.add('iUseAutosaveDelay=' + IntToStr(iUseAutosaveDelay));
    t.add('hProcessorLastCustom=' + hProcessorLastCustom);
    t.add('hProcessorDefault=' + IntToStr(hProcessorDefault));

    // ---------------------------------
    for i := 0 to defUIoptions.count - 1 do
    begin
      if i >= 25 then
        break;
      t.add(format('DefuiOpts2_%d=%s', [i, defUIoptions[i]]));
    end;

    // ---------------------------------
    for i := 0 to lBSAdef.count - 1 do
    begin
      if i >= 25 then
        break;
      t.add(format('bsadef_%d=%s', [i, lBSAdef[i]]));
    end;
    for i := 0 to lBSAAlias.count - 1 do
    begin
      if i >= 25 then
        break;
      t.add(format('bsaAliasA_%d=%s', [i, lBSAAlias[i]]));
    end;
    // ---------------------------------
    for i := 0 to derivedParseList.count - 1 do
    begin
      if i >= 25 then
        break;
      t.add(format('DerivedPattern_%d=%s', [i, derivedParseList[i]]));
    end;
    // ---------------------------------
    for i := 0 to lRulesNoTransListIn.count - 1 do
    begin
      if i >= 50 then
        break;
      t.add(format('lRulesNoTransListIn3_%d=%s', [i, lRulesNoTransListIn[i]]));
    end;
    // ---------------------------------
    for i := 0 to lRulesNoTransListOut.count - 1 do
    begin
      if i >= 50 then
        break;
      t.add(format('lRulesNoTransListOut3_%d=%s', [i, lRulesNoTransListOut[i]]));
    end;

    // ---------------------------------
    for i := 0 to lFuzBSA.count - 1 do
    begin
      if i >= 25 then
        break;
      t.add(format('FuzBSA_%d=%s', [i, lFuzBSA[i]]));
    end;
    // ---------------------------------
    for i := 0 to lScriptdef.count - 1 do
    begin
      if i >= 25 then
        break;
      t.add(format('Scriptdef_%d=%s', [i, lScriptdef[i]]));
    end;
    // ---------------------------------
    for i := 0 to lDEFUIIgnore.count - 1 do
    begin
      if i >= 25 then
        break;
      t.add(format('lDefUIIgnore_%d=%s', [i, lDEFUIIgnore[i]]));
    end;
    // ------------
    for i := 0 to lRegEx_RegEx.count - 1 do
    begin
      if i > MAXREGEXPREFS then
        break;
      t.add(format('Regex1_%d=%s', [i, lRegEx_RegEx[i]]));
    end;

    for i := 0 to lRegEx_Replace.count - 1 do
    begin
      if i > MAXREGEXPREFS then
        break;
      t.add(format('Regex2_%d=%s', [i, lRegEx_Replace[i]]));
    end;
    // advSearch
    for i := 0 to AdvSearchForm.ListBox1.items.count - 1 do
    begin
      if i > MAXREGEXPRESET then
        break;
      t.add(format('AdvSearchPreset_%.2x=%s', [i, AdvSearchForm.ListBox1.items[i]]));
    end;
    // regExPreset
    for i := 0 to lRegExPreset_Label.count - 1 do
    begin
      if i > MAXREGEXPRESET then
        break;
      t.add(format('RegexPresetLbl_%.2x=%s', [i, lRegExPreset_Label[i]]));
    end;
    for i := 0 to lRegExPreset_RegEx.count - 1 do
    begin
      if i > MAXREGEXPRESET then
        break;
      t.add(format('RegexPresetRegEx_%.2x=%s', [i, lRegExPreset_RegEx[i]]));
    end;
    for i := 0 to lRegExPreset_Replace.count - 1 do
    begin
      if i > MAXREGEXPRESET then
        break;
      t.add(format('RegexPresetReplace_%.2x=%s', [i, lRegExPreset_Replace[i]]));
    end;

    for i := 0 to recentAddon.count - 1 do
    begin
      if i > MAXRECENTADDON then
        break;
      t.add(format('Recent%d=%s', [i, recentAddon.strings[i]]));
    end;

    for i := 0 to presetlang.count - 1 do
    begin
      if i > MAXPRESETLANG then
        break;
      t.add(format('PresetLang%d=%s', [i, presetlang.strings[i]]));
    end;

  end; // bcommon

  try
    try
      ForceDirectories(prefsFolder);
      t.SaveToFile(prefsFile, TEncoding.UTF8);
    except
    end
  finally
    t.free;
  end;
end;

procedure getStrValue(tVal: string; var sPref: string);
begin
  if tVal <> '' then
    sPref := tVal;
end;

procedure TForm1.loadprefs(prefsFolder, prefsFile: string; bCommon: boolean);
var
  t: THashedStringList;
  tmp: tstringlist;
  i: integer;
  strtmp: string;
  tValue1, tValue2, tValue3: string;

begin
  ForceDirectories(prefsFolder);
  if not authFileAccess(prefsFile) then
    exit;
  t := THashedStringList.create;
  t.loadfromfile(prefsFile);

  if bCommon then
  begin
    getStrValue(t.Values['UILang'], lang_res);
    SearchSynFontSize := strtointdef(t.Values['SYNFONTSIZE'], defaultSynFontSize);
    getStrValue(t.Values['VTFONT'], virtualTreeFont);
    getStrValue(t.Values['VTFIXEDFONT'], virtualTreeFixedFont);
    virtualTreeFontsize[0] := strtointdef(t.Values['VTFONTSIZE'], defaultvirtualTreeFontSize);

    LOADING_PREFS_ID := strtointdef(t.Values['startup_Id'], 3);
    if not inrange(LOADING_PREFS_ID, 0, high(STARTUP_INI_VALUES)) then
      LOADING_PREFS_ID := 3;
    LAST_GAME_ID := strtointdef(t.Values['last_Id'], 0);
    if not isGameHandled(LAST_GAME_ID) then
      LAST_GAME_ID := 0;

    iTheme := strtointdef(t.Values['iTheme'], 0);
    iDarkPercent := strtointdef(t.Values['iDarkPercent'], 0);
    windowpos.Width := strtointdef(t.Values['POSW'], 1150);
    windowpos.Height := strtointdef(t.Values['POSH'], 600);
    windowpos.top := strtointdef(t.Values['POST'], 50);
    windowpos.left := strtointdef(t.Values['POSL'], 50);
    windowpos.Control1 := strtointdef(t.Values['PAGE1'], 300);
    SearchrWindowpos.Width := strtointdef(t.Values['SPOSW'], 900);
    SearchrWindowpos.Height := strtointdef(t.Values['SPOSH'], 600);
    SearchrWindowpos.top := strtointdef(t.Values['SPOST'], 50);
    SearchrWindowpos.left := strtointdef(t.Values['SPOSL'], 50);
    Panel1.Width := strtointdef(t.Values['SPANELSearchW'], 180);
    AdvSearchrWindowpos.Width := 340;
    AdvSearchrWindowpos.Height := strtointdef(t.Values['AdvSPOSH'], 320);
    AdvSearchrWindowpos.top := strtointdef(t.Values['AdvSPOST'], 50);
    AdvSearchrWindowpos.left := strtointdef(t.Values['AdvSPOSL'], 50);

    bAllowDirectEdit := strtobooldef(t.Values['bAllowDirectEdit'], true);
    bAllowDirectEditCtrl := strtobooldef(t.Values['bAllowDirectEditCtrl'], true);

    SearchrWindowpos.Control1 := strtointdef(t.Values['SPAGE1'], 300);
    SearchrWindowpos.List2 := strtointdef(t.Values['SPAGE2'], 300);
    SearchrWindowpos.List3 := strtointdef(t.Values['SPAGE3'], 90);

    regexwWidth := strtointdef(t.Values['regexSPOSW'], 900);
    regexwHeight := strtointdef(t.Values['regexSPOSH'], 600);
    regexwtop := strtointdef(t.Values['regexSPOST'], 50);
    regexwleft := strtointdef(t.Values['regexSPOSL'], 50);

    iUndoListMax := strtointdef(t.Values['iUndoListMax'], 50000);
    OptAuthSound := strtobooldef(t.Values['authSound'], true);
    iUseSpellCheckID := strtointdef(t.Values['iUseSpellCheckID'], 0);
    if not inrange(iUseSpellCheckID, 0, 1) then
      iUseSpellCheckID := 0;
    iSpParseOptions := strtointdef(t.Values['iSpParseOptions'], 7);

    getStrValue(t.Values['sUseSpellCheckDic'], sUseSpellCheckDic);
    bVTSimpleLine := strtobooldef(t.Values['VTSimpleLine3'], true);
    bUseSpellCheck := strtobooldef(t.Values['bUseSpellCheck'], false);
    ilastUsedApiArray := strtointdef(t.Values['ilastUsedApiArray'], 0);
    ilastUsedApi := strtointdef(t.Values['ilastUsedApi'], 0);
    ToolButtonForceSST.down := strtobooldef(t.Values['bForceSSTLoad'], true);

    // manually set in prefs.ini := strtobooldef(t.Values['bLocalizedVerboseWarning'], false); // manually set in prefs.ini
    bLocalizedVerboseWarning := strtobooldef(t.Values['bLocalizedVerboseWarning'], false); // manually set in prefs.ini
    bApiTranslationVerbose := strtobooldef(t.Values['bApiTranslationVerbose'], false); // manually set in prefs.ini
    bRessourceFallBackFeedback := strtobooldef(t.Values['bRessourceFallBackFeedback'], false); // manually set in prefs.ini

    // argPrefs
    getStrValue(t.Values['ArgsPref'], strtmp);
    tmp := tstringlist.create;
    tmp.CommaText := strtmp;

    bshowProcessorSave := strtobooldef(t.Values['bshowProcessorSave'], false);

    for i := 0 to pred(tmp.count) do
    begin
      if i > high(askPrefsArray) then
        break;
      askPrefsArray[i] := strtointdef(tmp[i], 0);
    end;
    tmp.free;
  end
  else
  begin
    isfirstLaunch := strtobooldef(t.Values['isFirstLaunch2'], true);
    getStrValue(t.Values['HEADERFONT'], HeaderComponentFont);
    getStrValue(t.Values['EspFolder'], Game_EspFolder);
    getStrValue(t.Values['NpcMapFolder'], Game_NpcMapFolder);
    getStrValue(t.Values['EspCompareFolder'], Game_EspCompareFolder);
    getStrValue(t.Values['Game_CacheStringFolder'], Game_CacheStringFolder);
    getStrValue(t.Values['Game_CacheDataFolder'], Game_CacheDataFolder);
    getStrValue(t.Values['Game_FuzDataFolder'], Game_FuzDataFolder);
    getStrValue(t.Values['StringAddonFolder'], Game_StringFolder);
    getStrValue(t.Values['Game_StringCompareFolder'], Game_StringCompareFolder);
    getStrValue(t.Values['papyrusPexFolder'], Game_PexFolder);
    getStrValue(t.Values['BSAFolder'], Game_BSAFolder);
    getStrValue(t.Values['TXTFolder'], Game_TXTFolder);
    getStrValue(t.Values['XMLFolder'], Game_XMLFolder);
    getStrValue(t.Values['SSTFolder'], Game_SSTFolder);
    getStrValue(t.Values['SourceLang'], Sourcelanguage);
    getStrValue(t.Values['DestLang'], Destlanguage);
    getStrValue(t.Values['EspBackup'], EspBackup_Folder);
    getStrValue(t.Values['EspFolderSaveAs'], Game_EspFolderSaveAs);
    getStrValue(t.Values['EspFolderFixedExport'], Game_EspFolderFixedExport);
    TranslationMeterShow.checked := strtobooldef(t.Values['bTranslationMeterShow'], true);
    bUseFixedFolderExport := strtobooldef(t.Values['bUseFixedFolderExport'], false);
    bApplyVMADOpt := strtobooldef(t.Values['bApplyVMADOpt'], true);
    sstBackupCount := strtointdef(t.Values['sstbackupCount'], 3);
    ToolButton27.down := strtobooldef(t.Values['showNullDefault2'], false);
    bUseDataCache := strtobooldef(t.Values['bUseDataCache'], true);
    iUseAutosaveDelay := strtointdef(t.Values['iUseAutosaveDelay'], 0);
    bUseAddonHash2 := strtobooldef(t.Values['useAddonHash'], false);
    bLoadEspSingleListA := strtobooldef(t.Values['bLoadEspSingleListA'], true);
    OptEspBackupOptSimple := strtobooldef(t.Values['EspBackupOptSimple'], true);
    OptEspBackupOptFolder := strtobooldef(t.Values['EspBackupOptFolder'], false);
    bGetVMADStrings := strtobooldef(t.Values['bGetVMADStrings'], false);
    bStringAutoTrim := strtobooldef(t.Values['bStringAutoTrim'], false);
    bUseLocOptions := strtobooldef(t.Values['UseLocOptions'], false);
    tesvtnoReplace := strtobooldef(t.Values['noReplace'], false);
    bSwitchAutoDial := strtobooldef(t.Values['bSwitchAutoDial'], true);
    bConfirmChange := strtobooldef(t.Values['bConfirmChange'], false);
    bPexUnLockGlobalVar := strtobooldef(t.Values['bPexUnLockGlobalVar'], false);
    bAuthAutoTranslate := strtobooldef(t.Values['AuthAutoTranslate2'], true);
    bDerivedVerbose := strtobooldef(t.Values['bDerivedVerbose'], false);
    bAllowPexCodepage := strtobooldef(t.Values['bAllowPexCodepage'], false);
    bEnableDerived := strtobooldef(t.Values['bEnableDerived'], false);
    bHeaderAdvanced := strtobooldef(t.Values['bHeaderAdvanced'], false);
    bForceAltHeaderDisplay := strtobooldef(t.Values['bForceAltHeaderDisplay'], false);

    bUseSimpleMemo := strtobooldef(t.Values['bUseSimpleMemo'], false);
    bSimpleMemoRTL := strtobooldef(t.Values['bSimpleMemoRTL'], false);

    getStrValue(t.Values['sPref_rxPatternNumber'], sPref_rxPatternNumber);
    getStrValue(t.Values['sPref_rxPatternAliasStrict'], sPref_rxPatternAliasStrict);
    getStrValue(t.Values['sPref_rxPatternAlias'], sPref_rxPatternAlias);
    getStrValue(t.Values['sPref_rxPatternWord'], sPref_rxPatternWord);

    hProcessorDefault := strtointdef(t.Values['hProcessorDefault'], 0);
    if not inrange(hProcessorDefault, 0, 2) then
      hProcessorDefault := 0;
    getStrValue(t.Values['hProcessorLastCustom'], hProcessorLastCustom);

    getStrValue(t.Values['sCurrentDEFUIOut'], sCurrentDEFUIOut);
    bUseExternalDecompilerOpt := strtobooldef(t.Values['bUseExternalDecompilerOpt'], false);
    getStrValue(t.Values['sUseExternalDecompilerPath'], sUseExternalDecompilerPath);

    bSaveCodepageSetting := strtobooldef(t.Values['bSaveCodepageSetting'], false);
    if bSaveCodepageSetting then
    begin
      bForceCodepageOnLoad := strtobooldef(t.Values['bForceCodepageOnLoad'], false);
      bForceCodepageOnSave := strtobooldef(t.Values['bForceCodepageOnSave'], false);
      getStrValue(t.Values['sForceCodepageOnLoad'], sForceCodepageOnLoad);
      getStrValue(t.Values['sForceCodepageOnSave'], sForceCodepageOnSave);
    end;

    for i := 0 to MAXREGEXPRESET do
    begin
      strtmp := format('AdvSearchPreset_%.2x', [i]);
      tValue1 := t.Values[strtmp];
      if tValue1 <> '' then
        lAdvSearchPreset.add(tValue1);
    end;

    for i := 0 to MAXREGEXPREFS do
    begin
      strtmp := format('Regex1_%d', [i]);
      tValue1 := t.Values[strtmp];
      if tValue1 <> '' then
        lRegEx_RegEx.add(tValue1);

      strtmp := format('Regex2_%d', [i]);
      tValue1 := t.Values[strtmp];
      if tValue1 <> '' then
        lRegEx_Replace.add(tValue1);
    end;

    for i := 0 to MAXREGEXPRESET do
    begin
      strtmp := format('RegexPresetLbl_%.2x', [i]);
      tValue1 := t.Values[strtmp];
      strtmp := format('RegexPresetRegEx_%.2x', [i]);
      tValue2 := t.Values[strtmp];
      strtmp := format('RegexPresetReplace_%.2x', [i]);
      tValue3 := t.Values[strtmp];
      if (tValue1 <> '') and (tValue2 <> '') and (tValue2 <> '') then
      begin
        lRegExPreset_Label.add(tValue1);
        lRegExPreset_RegEx.add(tValue2);
        lRegExPreset_Replace.add(tValue3);
      end
    end;

    for i := 0 to MAXRECENTADDON do
    begin
      strtmp := format('Recent%d', [i]);
      tValue1 := t.Values[strtmp];
      if tValue1 <> '' then
        recentAddon.add(tValue1);
    end;

    for i := 0 to MAXPRESETLANG do
    begin
      strtmp := format('PresetLang%d', [i]);
      tValue1 := t.Values[strtmp];
      if tValue1 <> '' then
        presetlang.add(tValue1);
    end;

    for i := 0 to 25 do
    begin
      strtmp := format('DefuiOpts2_%d', [i]);
      tValue1 := t.Values[strtmp];
      if tValue1 <> '' then
        defUIoptions.add(tValue1);
    end;

    for i := 0 to 25 do
    begin
      strtmp := format('FuzBSA_%d', [i]);
      tValue1 := t.Values[strtmp];
      if tValue1 <> '' then
        lFuzBSA.add(ansilowercase(tValue1));
    end;

    for i := 0 to 25 do
    begin
      strtmp := format('DerivedPattern_%d', [i]);
      tValue1 := t.Values[strtmp];
      if tValue1 <> '' then
        derivedParseList.add(tValue1);
    end;

    for i := 0 to 50 do
    begin
      strtmp := format('lRulesNoTransListIn3_%d', [i]);
      tValue1 := t.Values[strtmp];
      if tValue1 <> '' then
        lRulesNoTransListIn.add(tValue1);
    end;

    for i := 0 to 50 do
    begin
      strtmp := format('lRulesNoTransListOut3_%d', [i]);
      tValue1 := t.Values[strtmp];
      if tValue1 <> '' then
        lRulesNoTransListOut.add(tValue1);
    end;

    for i := 0 to 25 do
    begin
      strtmp := format('bsadef_%d', [i]);
      tValue1 := t.Values[strtmp];
      if tValue1 <> '' then
        lBSAdef.add(ansilowercase(tValue1));
    end;

    for i := 0 to 25 do
    begin
      strtmp := format('bsaAliasA_%d', [i]);
      tValue1 := t.Values[strtmp];
      if tValue1 <> '' then
        lBSAAlias.add(ansilowercase(tValue1));
    end;

    for i := 0 to 25 do
    begin
      strtmp := format('scriptdef_%d', [i]);
      tValue1 := t.Values[strtmp];
      if tValue1 <> '' then
        lScriptdef.add(ansilowercase(tValue1));
    end;

    for i := 0 to 25 do
    begin
      strtmp := format('lDefUIIgnore_%d', [i]);
      tValue1 := t.Values[strtmp];
      if tValue1 <> '' then
        lDEFUIIgnore.add(ansilowercase(tValue1));
    end;

    for i := 0 to 99 do
    begin
      strtmp := format('fileuseVMAD_%d', [i]);
      tValue1 := t.Values[strtmp];
      if tValue1 <> '' then
        lfileUsingVMAD.add(ansilowercase(tValue1));
    end;

  end;
  t.free;
end;

procedure cleanFillStringList(m: tmemo; l: tstringlist; cleanStr: boolean = true);
var
  i: integer;
  strtmp: string;
begin
  l.clear;
  for i := 0 to pred(m.lines.count) do
  begin
    if cleanStr then
      strtmp := ansilowercase(trim(m.lines[i]))
    else
      strtmp := m.lines[i];
    if (strtmp <> '') then
      l.add(strtmp);
  end;
end;

procedure TForm1.OpenOptions(tTab: integer);
var
  i, j: integer;
  bUpdateRes: boolean;
  oldLangRes, tmpStr: string;
  bUpdateTree: boolean;
  bUpdatederived: boolean;
  bRestartNoPrefs: boolean;
begin
  form2.close;
  if codepageFiles.count < 2 then
  begin
    askDialog(getRes('Ask_ErrorLangFile'), Form1, [askOK]);
    exit;
  end;
  bBlockAutoSave := true;
  bUpdatederived := false;
  bUpdateTree := false;
  bUpdateRes := false;
  form3 := tform3.create(self);
  form3.RecentMenu := Recentfiles1;
  form3.ComboBox1.clear;
  form3.ComboBox2.clear;
  form3.PageControl1.ActivePageIndex := tTab;
  for i := 0 to codepageFiles.count - 1 do
  begin
    form3.ComboBox1.items.add(codepageFiles.names[i]);
    if ansilowercase(Sourcelanguage) = codepageFiles.names[i] then
      form3.ComboBox1.itemIndex := i;
    form3.ComboBox2.items.add(codepageFiles.names[i]);
    if ansilowercase(Destlanguage) = codepageFiles.names[i] then
      form3.ComboBox2.itemIndex := i;
  end;

  if (form3.ComboBox1.itemIndex = -1) then
    form3.ComboBox1.itemIndex := 0;
  if (form3.ComboBox2.itemIndex = -1) then
    form3.ComboBox2.itemIndex := 1;

  // for i := 0 to pred(lFuzBSA.count) do
  // form3.memo2.lines.add(lFuzBSA[i]);
  form3.memo2.Text := lFuzBSA.Text;
  form3.memo3.Text := lBSAdef.Text;
  form3.memo4.Text := lBSAAlias.Text;
  form3.memo5.Text := derivedParseList.Text;
  form3.memo6.Text := lScriptdef.Text;
  form3.memo7.Text := lRulesNoTransListIn.Text;
  form3.memo8.Text := lRulesNoTransListOut.Text;
  // -api
  form3.ValueListEditor1.strings.clear;
  form3.ValueListEditor2.strings.clear;

  for i := 0 to pred(apiData.aPreferencesApi.count) do
    if pos('Count=', apiData.aPreferencesApi[i]) = 0 then
    begin
      form3.ValueListEditor1.strings.add(apiData.aPreferencesApi[i]);
      if pos('OpenAI_Model', apiData.aPreferencesApi[i]) = 1 then
      begin
        if trim(form3.ValueListEditor1.Values['OpenAI_Model']) = '' then
          form3.ValueListEditor1.Values['OpenAI_Model'] := apiData.Urldata.Values['OpenAI_Model0'];
        form3.ValueListEditor1.ItemProps[form3.ValueListEditor1.strings.count - 1].EditStyle := esPickList;
        for j := 0 to 9 do
        begin
          tmpStr := apiData.Urldata.Values['OpenAI_Model' + IntToStr(j)];
          if tmpStr <> '' then
            form3.ValueListEditor1.ItemProps[form3.ValueListEditor1.strings.count - 1].PickList.add(tmpStr);
        end;
      end
      else if pos('OpenAI_Query', apiData.aPreferencesApi[i]) = 1 then
      begin
        if trim(form3.ValueListEditor1.Values['OpenAI_Query']) = '' then
          form3.ValueListEditor1.Values['OpenAI_Query'] := apiData.Urldata.Values['OpenAI_DefaultQuery'];
        form3.ValueListEditor1.ItemProps[form3.ValueListEditor1.strings.count - 1].EditStyle := esPickList;
        form3.ValueListEditor1.ItemProps[form3.ValueListEditor1.strings.count - 1].PickList.add(apiData.Urldata.Values['OpenAI_DefaultQuery']);
      end
      else if pos('OpenAI_URL', apiData.aPreferencesApi[i]) = 1 then
      begin
        if trim(form3.ValueListEditor1.Values['OpenAI_URL']) = '' then
          form3.ValueListEditor1.Values['OpenAI_URL'] := apiData.Urldata.Values['OpenAI_ApiURL'];
        form3.ValueListEditor1.ItemProps[form3.ValueListEditor1.strings.count - 1].EditStyle := esPickList;
        form3.ValueListEditor1.ItemProps[form3.ValueListEditor1.strings.count - 1].PickList.add(apiData.Urldata.Values['OpenAI_ApiURL']);
      end;
    end
    else
    begin
      form3.ValueListEditor2.strings.add(apiData.aPreferencesApi[i]);
      form3.ValueListEditor2.ItemProps[form3.ValueListEditor2.strings.count - 1].EditStyle := esPickList;
      form3.ValueListEditor2.ItemProps[form3.ValueListEditor2.strings.count - 1].ReadOnly := true;
    end;

  oldLangRes := lang_res;
  // ---set prefs
  form3.UpDown1.Position := sstBackupCount;
  form3.UpDown2.Position := iUndoListMax;
  form3.UpDown3.Position := round(iUseAutosaveDelay / 60000);

  form3.CheckBoxOptSound.checked := OptAuthSound;
  form3.Edit1.Text := Game_CacheStringFolder;
  form3.Edit6.Text := Game_CacheDataFolder;
  form3.Edit7.Text := Game_FuzDataFolder;
  form3.Edit2.Text := EspBackup_Folder;
  form3.CheckBox8.checked := bUseLocOptions;
  form3.CheckBoxOptBackup.checked := OptEspBackupOptSimple;
  form3.validEspBackupFolder(OptEspBackupOptSimple);
  form3.CheckBoxOptFolder.checked := OptEspBackupOptSimple and OptEspBackupOptFolder;
  form3.CheckBox3.checked := bUseAddonHash2;
  form3.CheckBox1.checked := bLoadEspSingleListA;
  form3.CheckBox5.checked := bVTSimpleLine;
  form3.CheckBox7.checked := bAuthAutoTranslate;
  form3.CheckBox2.checked := bSwitchAutoDial;
  form3.CheckBox6.checked := bGetVMADStrings;
  form3.CheckBox13.checked := bUseExternalDecompilerOpt;
  form3.CheckBox14.checked := bAllowPexCodepage;

  form3.CheckBox4.checked := bAllowDirectEdit;
  form3.CheckBox16.checked := not bAllowDirectEditCtrl;

  form3.CheckBox15.checked := bUseDataCache;
  form3.CheckBox10.checked := bDerivedVerbose;
  form3.CheckBox11.checked := bEnableDerived;
  form3.CheckBoxLockGlobal.checked := bPexUnLockGlobalVar;
  form3.Edit4.Text := sPref_rxPatternNumber;
  form3.Edit5.Text := sPref_rxPatternAlias;
  form3.Edit12.Text := sPref_rxPatternAliasStrict;
  form3.Edit13.Text := sPref_rxPatternWord;

  form3.Edit9.Text := Game_EspFolderFixedExport;
  form3.CheckBox12.checked := bUseFixedFolderExport;
  form3.edit10.Text := sUseExternalDecompilerPath;

  form3.showmodal;
  if form3.ModalResult = mrOK then
  begin
    isfirstLaunch := false;
    // -prefs
    sstBackupCount := form3.UpDown1.Position;
    OptAuthSound := form3.CheckBoxOptSound.checked;
    Game_CacheStringFolder := form3.Edit1.Text;
    Game_CacheDataFolder := form3.Edit6.Text;
    Game_FuzDataFolder := form3.Edit7.Text;
    EspBackup_Folder := form3.Edit2.Text;
    iUndoListMax := form3.UpDown2.Position;
    iUseAutosaveDelay := form3.UpDown3.Position * 60000;
    OptEspBackupOptSimple := form3.CheckBoxOptBackup.checked;
    OptEspBackupOptFolder := OptEspBackupOptSimple and form3.CheckBoxOptFolder.checked;
    bUseLocOptions := form3.CheckBox8.checked;
    bUseAddonHash2 := form3.CheckBox3.checked;

    Game_EspFolderFixedExport := form3.Edit9.Text;
    bUseFixedFolderExport := form3.CheckBox12.checked;

    bUpdateTree := bVTSimpleLine <> form3.CheckBox5.checked;
    bVTSimpleLine := form3.CheckBox5.checked;
    bLoadEspSingleListA := form3.CheckBox1.checked;
    bAuthAutoTranslate := form3.CheckBox7.checked;
    bSwitchAutoDial := form3.CheckBox2.checked;
    bGetVMADStrings := form3.CheckBox6.checked;
    bUseExternalDecompilerOpt := form3.CheckBox13.checked;
    sUseExternalDecompilerPath := form3.edit10.Text;

    bDerivedVerbose := form3.CheckBox10.checked;
    bAllowPexCodepage := form3.CheckBox14.checked;
    bPexUnLockGlobalVar := form3.CheckBoxLockGlobal.checked;
    if (form3.memo5.Text <> derivedParseList.Text) or (bEnableDerived <> form3.CheckBox11.checked) then
      bUpdatederived := true;

    bUseDataCache := form3.CheckBox15.checked;
    bEnableDerived := form3.CheckBox11.checked;

    bAllowDirectEdit := form3.CheckBox4.checked;
    bAllowDirectEditCtrl := not form3.CheckBox16.checked;

    cleanFillStringList(form3.memo2, lFuzBSA);
    cleanFillStringList(form3.memo3, lBSAdef);
    cleanFillStringList(form3.memo4, lBSAAlias);
    cleanFillStringList(form3.memo5, derivedParseList, false);
    cleanFillStringList(form3.memo6, lScriptdef);
    cleanFillStringList(form3.memo7, lRulesNoTransListIn, false);
    cleanFillStringList(form3.memo8, lRulesNoTransListOut, false);

    apiData.aPreferencesApi.clear;

    for i := 0 to pred(form3.ValueListEditor1.strings.count) do
      apiData.aPreferencesApi.add(form3.ValueListEditor1.strings[i]);

    for i := 0 to pred(form3.ValueListEditor2.strings.count) do
      apiData.aPreferencesApi.add(form3.ValueListEditor2.strings[i]);
    // -----------------------
    sPref_rxPatternNumber := form3.Edit4.Text;
    sPref_rxPatternAlias := form3.Edit5.Text;
    sPref_rxPatternAliasStrict := form3.Edit12.Text;
    sPref_rxPatternWord := form3.Edit13.Text;
    regExUtil.regExInitPattern;
    // get UIlang
    if form3.combobox3.itemIndex >= 0 then
      lang_res := form3.combobox3.items[form3.combobox3.itemIndex]
    else
      lang_res := defaultLang_Res;

    bUpdateRes := oldLangRes <> lang_res;

    // handle cache operation
    if form3.doreload then
    begin
      if AuthOnCheckAllUserCacheUpdated then
      begin
        ClearSSTLoaderList(MainLoader);
        unloadCache;
        Sourcelanguage := codepageFiles.names[form3.ComboBox1.itemIndex];
        Destlanguage := codepageFiles.names[form3.ComboBox2.itemIndex];
        updateAddonFeedback;
        if form3.doCache = 1 then
        begin
          LaunchBuildAdvancedCache(form3.cacheResult, not form3.checkBox9.checked);
          dofeedback(getRes('fbk_AdvDicDone'), true);
        end;
        Application.ProcessMessages;
        updateAllLoadersForCacheUpdate;
        prepareCacheList;
        loaderList.OnChange(loaderList);
      end;
    end
    else
      AutoSaveOn;
  end;

  bRestartNoPrefs := form3.bRestartNoPrefs;
  form3.free;

  apiData.enabledAPIs;
  validateExternalDecompiler;

  if bRestartNoPrefs then
    restartApplication(-1, '', '-noprefs')
  else if bUpdateRes then
    restartApplication
  else
  begin
    if bUpdatederived then
      derived1Click(nil);
    if assigned(MainLoader) then
      MainLoader.bStatsUpdated := false;
    if bUpdateTree then
      ComboBox1Change(nil)
    else
    begin
      updateAddonFeedback;
      searchIntree;
    end;
  end;
  bBlockAutoSave := false;
end;

procedure TForm1.ClearHeuristicData(bOnlyTree: boolean = false);
begin
  TimerLD.Enabled := false;
  LDtree.clear;
  if not bOnlyTree then
  begin
    LDtree.Repaint;
    ClearHeuristicList;
  end;
end;

procedure TForm1.buildRecentmenu;
var
  mItem: TMenuItem;
  i: integer;
  r: rRecentData;
begin
  Recentfiles1.clear;
  for i := 0 to recentAddon.count - 1 do
  begin
    mItem := TMenuItem.create(self);
    mItem.name := 'RecentMenu' + IntToStr(i);
    mItem.OnClick := menuOnClick;
    if bUseRecentFileOwnerDraw then
    begin
      mItem.OnMeasureItem := RecentmenuMesure;
      mItem.OnDrawItem := RecentmenuOnDraw;
    end;
    mItem.tag := i;
    mItem.ImageIndex := 10;
    r := parseRecentMenuData(recentAddon.strings[i]);
    mItem.caption := format('%s - %s [%s]', [r.fNameType, r.fNameFile, r.fNameFolder]);
    Recentfiles1.add(mItem);
  end;
  Recentfiles1.Enabled := Recentfiles1.count > 0;
end;

procedure TForm1.RecentmenuMesure(Sender: TObject; ACanvas: TCanvas; var Width, Height: integer);
var
  r: rRecentData;
  mItem: TMenuItem;
  w: integer;
begin
  mItem := TMenuItem(Sender);
  r := parseRecentMenuData(recentAddon.strings[mItem.tag]);
  ACanvas.Font.Style := [];
  w := ACanvas.TextWidth(r.fNameType);
  ACanvas.Font.Style := [fsBold];
  w := w + ACanvas.TextWidth(r.fNameFile);
  ACanvas.Font.Style := [fsItalic];
  w := w + ACanvas.TextWidth(r.fNameFolder);
  Width := w + 19 + 16;
end;

procedure TForm1.RecentmenuOnDraw(Sender: TObject; ACanvas: TCanvas; ARect: TRect; Selected: boolean);
var
  r: rRecentData;
  mItem: TMenuItem;
  w: integer;
begin
  mItem := TMenuItem(Sender);
  r := parseRecentMenuData(recentAddon.strings[mItem.tag]);

  if Selected then
    ACanvas.Brush.Color := clHighlight
  else
    ACanvas.Brush.Color := clMenu;
  ACanvas.FillRect(ARect);

  ImageList1.Draw(ACanvas, ARect.left + 3, ARect.top + 1, 10);

  ACanvas.Font.Style := [];
  ACanvas.TextOut(ARect.left + 7 + 16, ARect.top + 2, r.fNameType);
  w := ACanvas.TextWidth(r.fNameType);

  ACanvas.Font.Style := [fsBold];
  ACanvas.TextOut(ARect.left + w + 13 + 16, ARect.top + 2, r.fNameFile);
  w := w + ACanvas.TextWidth(r.fNameFile);

  ACanvas.Font.Style := [fsItalic];
  ACanvas.TextOut(ARect.left + w + 18 + 16, ARect.top + 2, r.fNameFolder);
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_RETURN:
      begin
        if bAllowDirectEdit then
        begin
          if bAllowDirectEditCtrl then
          begin
            if (ssCtrl in Shift) then
              getStringTextDirect
            else
              getStringText(true);
          end
          else
          begin
            if (ssCtrl in Shift) then
              getStringText(true)
            else
              getStringTextDirect
          end
        end
        else
          getStringText(true);
      end;

    VK_ESCAPE:
      CancelStuff := true;

    122:
      if (Shift = []) then
        ToolButton30Click(nil) // f11
  end;
end;

procedure TForm1.FormResize(Sender: TObject);
begin
  if Panel4.Height + (100 + Panel2.Height) > clientHeight then
    Panel4.Height := clientHeight - (100 + Panel2.Height);
  bDoUpdateStats := true;
end;

procedure TForm1.enableChildMenu(tm: TMenuItem; b, pB: boolean);
var
  i: integer;
begin
  for i := 0 to tm.count - 1 do
    TMenuItem(tm.items[i]).Enabled := b;
  tm.Enabled := pB;
end;

procedure TForm1.globalUIlockON(iLevel: integer; Text: string = ''; bCloseSearch: boolean = true);
begin
  startStuff(Text, bCloseSearch);
  if iLevel > bGlobalUILocked then
    bGlobalUILocked := iLevel;
end;

procedure TForm1.globalUIlockOFF(iLevel: integer);
begin
  if iLevel = bGlobalUILocked then
  begin
    bGlobalUILocked := 0;
    stopStuff(false, false);
    if currentEditedTree.canfocus then
      currentEditedTree.setFocus;
  end;
end;

procedure TForm1.startStuff(Text: string; closeSearch: boolean = true; drawinLog: boolean = true; disablePc: boolean = true);
var
  i: integer;
begin
  screen.Cursor := crHourGlass;
  canCloseProg := false;
  bBlockAutoSave := true;
  bUIStopped := true;
  timedebut := GetTickCount;
  tAntiFlood := 0;
  if Text <> '' then
  begin
    updateStatus(Text);
    if drawinLog then
      dofeedback(Text);
  end;
  TimerLD.Enabled := false;
  TimerSearch.Enabled := false;
  TimerSearchPex.Enabled := false;
  if closeSearch then
    form2.close;
  CancelStuff := false;

  if bCountCompressedData then
  begin
    iCompressedRecords := 0;
    iCompressedGain := 0;
  end;
  debugError := 0;

  ProgressBar.Position := 0;
  ProgressBar.max := 100;

  focusedTree := nil;
  for i := 0 to ComponentCount - 1 do
    if components[i] is TVirtualStringTree then
      if TVirtualStringTree(components[i]).Focused then
      begin
        focusedTree := TVirtualStringTree(components[i]);
        break;
      end;

  if bGlobalUILocked = 0 then
  begin
    if assigned(form23) then
      form23.cancloseW(false);

    ComboBox1.Enabled := false;
    ComboBox_changeCP.Enabled := false;
    enableChildMenu(File1, false, false);
    enableChildMenu(TranslationMenu1, false, false);
    enableChildMenu(Tools1, false, false);
    enableChildMenu(Wizard1, false, false);
    enableChildMenu(Vocabulary1, false, false);
    enableChildMenu(MenuImport1, false, false);
    enableChildMenu(MenuExport1, false, false);
    enableToolBar(ToolBar1, false);
    enableToolBar(ToolBar8, false);
    enableToolBar(form2.ToolBar1, false);
    enableToolBar(form2.ToolBar2, false);
    enableToolBar(form2.ToolBar3, false);
    enableToolBar(ToolBar2, false);
    enableToolBar(ToolBar3, false);
    enableToolBar(ToolBar4, false);
    enableToolBar(ToolBar5, false);
    enableToolBar(ToolBar6, false);
    enableToolBar(ToolBar7, false);
    ButtonedEdit1.Enabled := false;

    enableToolBar(form2.ToolBar3, false);
    // TFormKeyWord
    lockForm(FormKeyWord, false);

    SynEditPex.Enabled := false;
    if disablePc then
    begin
      PageControl1.Enabled := false;
      pagecontrol2.Enabled := false;
    end;
  end;
  Application.ProcessMessages;
end;

procedure TForm1.validGamesMenu;
begin
  Restart1.visible := CURRENT_GAME_ID <> 0;
  Restart2.visible := CURRENT_GAME_ID <> 1;
  Restart3.visible := CURRENT_GAME_ID <> 2;
  Restart4.visible := CURRENT_GAME_ID <> 3;
  Restart5.visible := CURRENT_GAME_ID <> 4;
  Restart6.visible := CURRENT_GAME_ID <> 5;
  OldDialogStyle1.visible := CURRENT_GAME_ID = 0;
  Wizard1.visible := true;
  DEFUIComponent1.visible := CURRENT_GAME_ID in [0, 4];
  headerWizard1.visible := bGameHasWizardProc;
end;

procedure TForm1.stopStuff(bforcefocus: boolean = false; drawinLog: boolean = true);
var
  bModOrSST: boolean;
begin

  if drawinLog then
  begin
    dofeedback(format(ResTotal + ' %.2fs', [(GetTickCount - timedebut) / 1000]));
    dofeedback(strSeparator);
  end;

  if bGlobalUILocked = 0 then
  begin
    if assigned(form23) then
      form23.cancloseW(true);
    bModOrSST := TESVTmodLoaded or (currentTesvMode in [sTESVTsstEdit, sTESVTsstCustom]);
    enableChildMenu(File1, true, true);
    enableChildMenu(TranslationMenu1, TESVTmodLoaded and not TESVTsst, true);
    enableChildMenu(Tools1, bModOrSST, true);
    enableChildMenu(Wizard1, true, true);
    enableChildMenu(Vocabulary1, true, true);
    enableChildMenu(MenuImport1, TESVTmodLoaded, true);
    enableChildMenu(MenuExport1, TESVTmodLoaded, true);
    SearchandReplace1.Enabled := bModOrSST;
    Batch1.Enabled := bModOrSST;
    RegexTranslation1.Enabled := bModOrSST;
    enableToolBar(ToolBar1, true);
    enableToolBar(ToolBar8, true);
    enableToolBar(ToolBar2, true);
    enableToolBar(ToolBar3, true);
    enableToolBar(ToolBar4, true);
    enableToolBar(ToolBar5, true);
    enableToolBar(ToolBar6, true);
    enableToolBar(ToolBar7, true);
    enableToolBar(form2.ToolBar1, true);
    enableToolBar(form2.ToolBar2, true);
    enableToolBar(form2.ToolBar3, isFuzCompatible(MainLoader));

    // if simplememo
    form2.ToolButton1.Enabled := not bUseSimpleMemo;
    form2.ToolButton2.Enabled := not bUseSimpleMemo;
    form2.ToolButton4.Enabled := not bUseSimpleMemo;
    form2.ToolButton5.Enabled := not bUseSimpleMemo;
    form2.ToolButton6.Enabled := not bUseSimpleMemo;
    form2.ToolButton7.Enabled := not bUseSimpleMemo;
    // translatemenu
    ToolButton13.Enabled := TESVTmodLoaded and not TESVTsst and not TESVTSameLanguage;
    ToolButton25.Enabled := TESVTmodLoaded and not TESVTsst and not TESVTSameLanguage;
    ToolButton49.Enabled := TESVTmodLoaded and not TESVTsst and not TESVTSameLanguage and apiData.checkForArrayEnabled;
    TranslateExactMenu1.Enabled := ToolButton13.Enabled;
    HeuristicMenu1.Enabled := ToolButton25.Enabled;
    ApiTransMenu.Enabled := ToolButton49.Enabled;
    // loadmastermenu
    ToolButton45.Enabled := assigned(MainLoader) and assigned(MainLoader.espLoader);
    loadAllMasters1.Enabled := ToolButton45.Enabled;
    // --------

    ToolButton11.Enabled := bModOrSST;
    ToolButton41.Enabled := bModOrSST;
    ToolButton19.down := isLoaderOneList(MainLoader);
    ToolButton19.Enabled := (currentTesvMode in [sTESVTsstCustom, sTESVTsstEdit, sTESVEsp, sTESVEspStrings]);
    ToolButton59.Enabled := TESVTmodLoaded and bGetVMADStrings and isLoaderHasVMAD(MainLoader);
    Undo1.Enabled := getUndoCount(MainLoader) > 0;
    PageControl1.Enabled := true;
    pagecontrol2.Enabled := true;
    lockForm(FormKeyWord, true);
    FormKeyWord.Button10.Enabled := TESVTSameLanguage;
    Save1.Enabled := TESVTmodLoaded;
    CompareSourceDest.Enabled := bModOrSST;
    Save1.caption := ExportModCaption[getMenuCaptionId];
    Save2.Enabled := TESVTmodLoaded;
    spCheckOpt1.Enabled := assigned(form2);
    Save3bsa.Enabled := TESVTmodLoaded;
    Save3bsa.visible := assigned(MainLoader) and (MainLoader.addon_BSApath <> '') and (currentTesvMode = sTESVPex);
    // ((currentTesvMode = sTESVPex) or (currentTesvMode = sTESVMcM));
    SynEditPex.Enabled := currentTesvMode = sTESVPex;
    Save2.caption := ExportModCaption2[getMenuCaptionId];
    AddIdToStr.Enabled := TESVTmodLoaded;
    OldDialogStyle1.Enabled := TESVTmodEspLoaded;
    DEFUIComponent1.Enabled := TESVTmodEspLoaded;
    TagNoTrans1.Enabled := TESVTmodEspLoaded;
    HeaderProcessor1.Enabled := TESVTmodLoadedHeaderProc; // TESVTmodEspLoaded;
    ToolButton35.Enabled := TESVTmodLoaded and (VocabTree.SelectedCount > 0);
    menuApplysst1.Enabled := ToolButton35.Enabled;
    ToolButton56.Enabled := assigned(MainLoader) and (MainLoader.FilteredRecord <> 0);
    ConvertTCSC1.Enabled := bModOrSST;
    ConvertSCTC1.Enabled := bModOrSST;
    ValidateallTranslations1.Enabled := bModOrSST;
    ResetallTranslations1.Enabled := bModOrSST;
    gbSpellCheck1.Enabled := bModOrSST and bUseSpellCheck and assigned(Spcheck) and Spcheck.Active;
    MenuCloseCurrent.Enabled := assigned(MainLoader) and (ComboBox1.items.count > 0);
    SaveSSTStrings.Enabled := (not BlockSameLanguageEditing) and (not(currentTesvMode = sTESVStrings)) and bModOrSST;
    ButtonedEdit1.Enabled := not AdvSearchForm.visible;
    EspCompare1.Enabled := (TESVTmodEspLoaded);
    McmCompare1.Enabled := (currentTesvMode = sTESVMcM);
    LoadStringAsDest1.Enabled := (currentTesvMode = sTESVEspStrings) or (currentTesvMode = sTESVStrings);
    form2.memo1.ReadOnly := not TESVTsstCustom;
    form2.memo5.ReadOnly := not TESVTsstCustom;
    AddFieldCustom1.Enabled := TESVTsstCustom;
    MenuExport1.Enabled := TESVTmodLoaded;
    MenuImport1.Enabled := TESVTmodLoaded;
    validGamesMenu;
    ComboBox1.Enabled := true;
    ComboBox_changeCP.visible := TESVTmodLoadedHeaderProc; // TESVTmodEspLoaded
    ComboBox_changeCP.Enabled := ComboBox_changeCP.visible;
    if assigned(MainLoader) then
    begin
      MainLoader.bStatsUpdated := false;
      ShowColabCol(MainLoader.isColab);
    end;
    bUIStopped := false;
    screen.Cursor := crDefault;
  end;
  if bforcefocus and assigned(focusedTree) and focusedTree.canfocus then
    focusedTree.setFocus;
  // clean progress
  ProgressBar.max := 100;
  ProgressBar.Position := ProgressBar.max;
  ProgressBar.Repaint;
  repaintTrees;
  updateStatus('');
  updateStatusFile(loaderList.itemIndex, loaderList.items.count);
  updateAddonFeedback;
  bDoUpdateStats := true;
  canCloseProg := true;
  bBlockAutoSave := false;

  // ---------------
  if debugError > 0 then
    dofeedback('debugError: ' + IntToStr(debugError), false);
  if iCompressedRecords > 0 then
    dofeedback('NbCompressedRecords: ' + IntToStr(iCompressedRecords), false);
  if iCompressedGain > 0 then
    dofeedback(format('CompressedSizeGain: %.2f Mb', [iCompressedGain / 1000000]), false);
  if (debugError > 0) or (iCompressedRecords > 0) or (iCompressedGain > 0) then
    dofeedback(strSeparator);
  MemoLog.Repaint;
  // ---------------
  Application.ProcessMessages;
end;

procedure TForm1.SynEditPexGutterClick(Sender: TObject; Button: TMouseButton; X, Y, Line: integer; Mark: TSynEditMark);
var
  str: string;
  posJump: integer;
  newline: integer;
begin
  if currentTesvMode <> sTESVPex then
    exit;
  str := SynEditPex.lines[Line - 1];
  posJump := pos('jump', str);
  if posJump = 0 then
    exit;
  newline := Line + strtointdef(trim(copy(str, posJump + 4, maxInt)), 0);
  if (newline <= 0) or (newline > SynEditPex.lines.count) then
    exit;
  SynEditPex.CommandProcessor(ecSetMarker0, ' ', nil);
  SynEditPex.GotoLineAndCenter(newline);
end;

procedure TForm1.SynEditPexMouseCursor(Sender: TObject; const aLineCharPos: TBufferCoord; var aCursor: TCursor);
var
  pLine: tpexObjLine;
begin
  if currentTesvMode <> sTESVPex then
    exit;
  if (aLineCharPos.Line = 0) or (aLineCharPos.Line > SynEditPex.lines.count) then
  begin
    pexLogCursorLine := 0;
    aCursor := crIBeam;
    exit;
  end;
  // --------

  pLine := MainLoader.PexDecompiler.pFbData.LineList[aLineCharPos.Line - 1];
  if (pLine.datatype in [3, 4, 20, 21, 22, 23]) and (aLineCharPos.char < 4) then
  begin
    pexLogCursorLine := aLineCharPos.Line;
    aCursor := crArrow;
  end
  else
  begin
    pexLogCursorLine := 0;
    aCursor := crIBeam;
  end;
end;

procedure TForm1.updatePexFeedback(p: tPexDecompiler; topline: integer = 1);
var
  i: integer;
begin
  SynEditPex.lines.beginupdate;
  SynEditPex.clear;
  p.decompilationFeedback;
  for i := 0 to p.pFbData.LineList.count - 1 do
    SynEditPex.lines.add(tpexObjLine(p.pFbData.LineList[i]).sFeedback);
  SynEditPex.topline := topline;
  SynEditPex.lines.endupdate;
end;

procedure TForm1.SynEditPexMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
var
  pLine: tpexObjLine;
  PexDecompiler: tPexDecompiler;
begin
  if currentTesvMode <> sTESVPex then
    exit;
  PexDecompiler := MainLoader.PexDecompiler;

  if (pexLogCursorLine = 0) or (pexLogCursorLine > SynEditPex.lines.count) then
    exit;
  // --------
  pLine := PexDecompiler.pFbData.LineList[pexLogCursorLine - 1];
  case pLine.datatype of
    1:; // vars
    2:; // prop
    3: TpexState(pLine.pdata).open := not TpexState(pLine.pdata).open; // state
    4: TpexFunc(pLine.pdata).open := not TpexFunc(pLine.pdata).open; // state
    5:; // struct;
    6:; // guard
    10:; // pObj
    20: PexDecompiler.pFbData.varOpen := not PexDecompiler.pFbData.varOpen; // varheader
    21: PexDecompiler.pFbData.propOpen := not PexDecompiler.pFbData.propOpen; // Propheader
    22: PexDecompiler.pFbData.structOpen := not PexDecompiler.pFbData.structOpen; // structheader
    23: PexDecompiler.pFbData.guardOpen := not PexDecompiler.pFbData.guardOpen; // guardHeader
  else exit;
  end;
  updatePexFeedback(PexDecompiler, SynEditPex.topline);
  exit;
end;

procedure TForm1.translate2Click(Sender: TObject);
var
  Data: ptreedata;
begin
  if assigned(focusedNode.LDfstring) and assigned(LDtree.focusedNode) then
  begin
    Data := LDtree.GetNodeData(LDtree.focusedNode);
    focusedNode.bestLDString := Data.BasicND.s.s;
    if not assigned(focusedNode.fstring) or (focusedNode.LDfstring = focusedNode.fstring) then
      getStringText(false, nil, Data.BasicND.s.strans)
    else
      askDialog(getRes('FbK_LDNodeerror'), Form1, [askOK]);
  end;
end;

procedure TForm1.updateAddonFeedback;
begin
  if assigned(MainLoader) then
  begin
    ToolButton59.Enabled := not bUIStopped and TESVTmodLoaded and bGetVMADStrings and isLoaderHasVMAD(MainLoader);
    ToolButton59.down := ToolButton59.Enabled and isLoaderUseVMAD(MainLoader);

    StatusBar1.Panels[1].Text := format('[%s]->[%s] %s', [Sourcelanguage, Destlanguage, MainLoader.addon_name])
  end
  else
    StatusBar1.Panels[1].Text := format('[%s]->[%s]', [Sourcelanguage, Destlanguage])
end;

procedure TForm1.SelectCodepage(c: TComboBox; cp: String);
var
  i: integer;
begin
  c.itemIndex := 0;
  for i := 0 to pred(c.items.count) do
    if lowercase(c.items[i]) = lowercase(cp) then
    begin
      c.itemIndex := i;
      exit;
    end;
end;

procedure TForm1.findCurrentCodepage(c: TComboBox; loader: tTranslatorLoader);
var
  codepageIn: rcodepage;
  latest: string;
begin
  if assigned(loader) then
    latest := loader.lastestUsedCodepage
  else
    latest := '';
  codepageIn := getcodepage('_' + Sourcelanguage, codepageFiles, bforceCpOnLoad, latest, isMcMLoader(loader));
  SelectCodepage(c, ansilowercase(codepageIn.s));
end;

procedure TForm1.FixTES4SNAM1Click(Sender: TObject);
begin
  if assigned(MainLoader) then
    MainLoader.tagTES4_SNAM;
end;

procedure TForm1.ForceCP21Click(Sender: TObject);
var
  codepageIn, codepageOut: rcodepage;
  defaultCpIn, defaultCpOut: string;
begin
  form2.close; // security
  codepageIn := getcodepage('_' + Sourcelanguage, codepageFiles, '', '');
  codepageOut := getcodepage('_' + Destlanguage, codepageFiles, '', '');
  defaultCpIn := ansilowercase(codepageIn.s);
  defaultCpOut := ansilowercase(codepageOut.s);
  if sForceCodepageOnLoad <> '' then
    defaultCpIn := sForceCodepageOnLoad;
  if sForceCodepageOnSave <> '' then
    defaultCpOut := sForceCodepageOnSave;

  form14 := tform14.create(self);
  // select cp
  SelectCodepage(form14.ComboBox1, defaultCpIn);
  SelectCodepage(form14.ComboBox2, defaultCpOut);
  form14.CheckBox1.checked := bForceCodepageOnLoad;
  form14.CheckBox2.checked := bForceCodepageOnSave;
  form14.CheckBox3.checked := bSaveCodepageSetting;
  form14.showmodal;

  bForceCodepageOnLoad := form14.CheckBox1.checked;
  bForceCodepageOnSave := form14.CheckBox2.checked;
  bSaveCodepageSetting := form14.CheckBox3.checked;
  sForceCodepageOnLoad := form14.ComboBox1.items[form14.ComboBox1.itemIndex];
  sForceCodepageOnSave := form14.ComboBox2.items[form14.ComboBox2.itemIndex];
  form14.free;
end;

procedure TForm1.ForceUtf8onload1Click(Sender: TObject);
begin
  TMenuItem(Sender).checked := not TMenuItem(Sender).checked;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  Undo1.ShortCut := 16474; // Ctrl-Z
  if openAppli then
  begin
    openAppli := false;
    stopStuff(false, false);
    ToolButton43.ImageIndex := CURRENT_GAME_ID_ICON[CURRENT_GAME_ID];
    if isfirstLaunch then
      OpenOptions(0)
    else if (cmdFile <> '') then
      openAddonCommandLine(cmdFile);
  end;
  bApplicationStarted := true;
  launchSearchTimer;
end;

procedure TForm1.saveSizeList;
var
  tmplist: tstringlist;
  i, nb: integer;
  b: boolean;
  s: string;
const
  cSimpleBoolStrs: array [boolean] of String = ('0', '1');
begin
  tmplist := tstringlist.create;
  for i := 0 to fieldStrName.count - 1 do
  begin
    s := fieldStrName[i];
    b := fieldStrCR[i];
    nb := fieldStrSize[i];
    tmplist.add(s + ':' + cSimpleBoolStrs[b] + '=' + IntToStr(nb));
  end;
  tmplist.SaveToFile(mainpath + CURRENT_GAME_SUBFOLDER + recordSizeMaxName_FILE);
  tmplist.free;
end;

procedure TForm1.Restart1Click(Sender: TObject);
begin
  restartApplication(TMenuItem(Sender).tag);
end;

Procedure TForm1.restartApplication(forceID: integer = -1; sFile: string = ''; sExtra: string = '');
begin
  if not AuthApplicationClose then
    exit;
  closeEverything;
  Application.ProcessMessages;
  Application.terminate;

  if sExtra <> '' then
    ShellExecute(Application.Handle, 'Open', PChar(Application.Exename), PChar('"' + sExtra + '"'), nil, SW_NORMAL)
  else if isGameHandled(forceID) then
  begin
    if sFile <> '' then
      sFile := ' "' + sFile + '"';
    ShellExecute(Application.Handle, 'Open', PChar(Application.Exename), PChar('"-' + STARTUP_INI_VALUES[STARTUP_INI_VALUES_BYGAME[forceID]] + '"' + sFile), nil, SW_NORMAL);
  end
  else
    ShellExecute(Application.Handle, 'Open', PChar(Application.Exename), nil, nil, SW_NORMAL);
  halt;
end;

Procedure TForm1.closeEverything;
begin
  if bDataClosed then
    exit;

  AdvSearchForm.close;

  if assigned(mainDialdata) then
    mainDialdata.free;
  ClearLoaderList(false);

  // saveprefs
  saveVocabData;
  secureSavetStringList(lfileUsingVMAD, mainpath + CURRENT_PREFS_SUBFOLDER + USERPREFS_VmadFile_FILE);
  saveprefs(mainpath + PREFS_BASEFOLDER, mainpath + PREFS_BASEFOLDER + USERPREFSCOMMON_FILE, true);
  saveprefs(mainpath + CURRENT_PREFS_SUBFOLDER, mainpath + CURRENT_PREFS_SUBFOLDER + USERPREFS_FILE, false);
  // -----------

  apiData.saveApiPreferences;

  apiData.free;
  headerString.free;
  if bsaveSizeList then
    saveSizeList;

  // --------
  LDtree.clear;
  onewordList.free;
  HeuristicList.free;

  clearInternalRefList(vocabEdidList, true);
  clearInternalRefList(LocalVocabEdidList, true);
  clearSkList(vocabBaselist, true);

  vocabBaselist.free;
  LocalVocabBaseList.free;
  derivedParseList.free;
  lRulesNoTransListIn.free;
  lRulesNoTransListOut.free;
  regExUtil.free;
  ClearTmpFiles;
  fuz.free;
  lRegEx_RegEx.free;
  lRegEx_Replace.free;
  lfileUsingVMAD.free;
  lRegExPreset_Label.free;
  lRegExPreset_RegEx.free;
  lRegExPreset_Replace.free;
  lAdvSearchPreset.free;
  recentAddon.free;
  presetlang.free;
  loadOrder.free;
  vocabFiles.free;
  codepageFiles.free;
  SSTRessources.free;
  clearDefRecList;
  lFastrec.free;
  lCtdaFunc.free;
  freeFieldSizeList;
  dummySk.free;
  pexNoTransProcList.free;
  VTtreeList.free;
  VTtreeList_Tag.free;
  secureSavetStringList(lWordExceptionList, mainpath + PREFS_BASEFOLDER + wordExceptionFile);
  secureSavetStringList(lDEFUIHeader, mainpath + CURRENT_PREFS_SUBFOLDER + sDefUITagList_FILE);
  lDEFUIHeader.free;
  lWordExceptionList.free;
  if bWriteEmoteKeyWord and (EmoteDefinitionList.count > 0) then
    EmoteDefinitionList.SaveToFile(mainpath + CURRENT_GAME_SUBFOLDER + EMOTEEXPORTFILE_FILE);
  EmoteDefinitionList.free;
  DialSubTypeList.free;
  lFuzBSA.free;
  lBSAdef.free;
  lScriptdef.free;
  lBSAAlias.free;
  lDEFUIIgnore.free;
  defUIoptions.free;
  CustomTxtParams.free;
  Lock.free;
  espTree.clear; // Must be at the end
  bDataClosed := true;
  DragAcceptFiles(Handle, false);
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  closeEverything;
end;

function TForm1.AuthApplicationClose: boolean;
begin
  Result := false;
  if not canCloseProg then
    exit;

  if assigned(FormKeyWord) and FormKeyWord.bEditedData then
  begin
    if askDialog(getRes('Fbk_HeaderProcCanclose'), self, [askYes, askNo]) <> mrYes then
      exit(false);
  end;

  if checkAllUserCacheUpdated then
    removeAllLoaders(false);
  Result := not checkAllUserCacheUpdated;
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  CanClose := AuthApplicationClose;
end;

function TForm1.checkuserCacheUpdated(loader: tTranslatorLoader): boolean;
begin
  Result := true;
  if (BlockSameLanguageEditing) or (currentTesvMode = sTESVStrings) then
    setuserCacheUpdated(loader, false);

  if getuserCacheUpdated(loader) then
  begin
    // if bforceRefreshLoader then updateCurrentLoader;
    case askDialog(formatres('Ask_SavingSST', [loader.addon_name]), Form1, [askYes, askNo, askCancel]) of
      mrYes:
        begin
          if loader.fLoaderMode = sTESVTsstCustom then
            doSaveSSTCustomDictionary(loader)
          else
            doSaveSSTDictionary(loader, false);
          Result := true;
        end;
      mrNo:
        begin
          Result := true;
          setuserCacheUpdated(loader, false);
        end
    else Result := false;
    end;
  end;
end;

procedure TForm1.Close1Click(Sender: TObject);
begin
  close;
end;

procedure TForm1.CloseAndFinalyseAllClick(Sender: TObject);
begin
  globalUIlockON(5);
  removeAndFinalyzeAllLoaders;
  globalUIlockOFF(5)
end;

procedure TForm1.EditString2Click(Sender: TObject);
begin
  getStringText(true);
end;

procedure TForm1.SearchandReplace1Click(Sender: TObject);
begin
  form2.close;
  form4 := tform4.create(self);
  form4.skSource := getFocusedString(currentEditedTree);
  form4.RadioGroup1.itemIndex := searchdata.mode1;
  form4.RadioGroup2.itemIndex := searchdata.mode2;
  form4.ComboBox1.Text := searchdata.s1;
  form4.ComboBox2.Text := searchdata.s2;
  form4.CheckBox1.checked := searchdata.caseSensitive;
  form4.combobox3.Text := searchdata.strformat;
  form4.CheckBox2.checked := searchdata.allList;
  form4.CheckBox4.checked := searchdata.restrictvisible;
  if searchdata.strformat = '' then
    form4.combobox3.itemIndex := 0;

  form4.showmodal;
  if form4.ModalResult = mrOK then
  begin
    searchdata.s2 := form4.ComboBox2.Text;
    searchdata.mode1 := form4.RadioGroup1.itemIndex;
    searchdata.mode2 := form4.RadioGroup2.itemIndex;
    searchdata.caseSensitive := form4.CheckBox1.checked;
    searchdata.strformat := form4.combobox3.Text;
    searchdata.allList := form4.CheckBox2.checked;
    searchdata.restrictvisible := form4.CheckBox4.checked;
    searchdata.s1 := conditionalCase(form4.ComboBox1.Text, not searchdata.caseSensitive);
    if (searchdata.s1 <> '') or (searchdata.mode2 = 2) then
      searchReplace(MainLoader.listArray, searchdata);
  end;
  form4.free;
end;

procedure TForm1.Batch1Click(Sender: TObject);
begin
  batchSearchReplace;
end;

procedure TForm1.batchSearchReplace;
var
  sl, slRules: tstringlist;
  i: integer;
  openrule: boolean;
  filename, tmpmode: string;
begin
  form2.close;
  filename := OpenFileDialog(getRes('Dia_loadBatch'), mainpath + BatchPath, '', getRes('FilterTXT|*.TXT'));
  if (filename = '') then
    exit;
  if not FileExists(filename) then
  begin
    dofeedback(getRes('FileNotFound'), true);
    exit;
  end;

  form11 := tform11.create(self);
  form11.memo1.lines.loadfromfile(filename);
  form11.filenamefull := filename;
  form11.showmodal;

  if form11.ModalResult = mrOK then
  begin
    sl := tstringlist.create;
    slRules := tstringlist.create;

    sl.Text := form11.memo1.Text;
    removeCommentLine(sl);

    openrule := false;
    for i := 0 to sl.count - 1 do
    begin
      if ansilowercase(sl[i]) = 'startrule' then
        openrule := true;
      if ansilowercase(sl[i]) = 'endrule' then
      begin
        openrule := false;

        // reset
        searchdata.mode1 := 0;
        searchdata.mode2 := 0;
        searchdata.caseSensitive := false;
        searchdata.s1 := '';
        searchdata.s2 := '';
        searchdata.strformat := '';
        searchdata.allList := false;
        searchdata.restrictvisible := false;
        searchdata.caseSensitive := false;
        // ---------------

        searchdata.s2 := slRules.Values['replace'];
        searchdata.strformat := slRules.Values['pattern'];

        tmpmode := ansilowercase(trim(slRules.Values['select']));
        if tmpmode <> '' then
          searchdata.mode1 := strtointdef(tmpmode, 0);

        tmpmode := ansilowercase(trim(slRules.Values['mode']));
        if tmpmode <> '' then
          searchdata.mode2 := strtointdef(tmpmode, 0);

        tmpmode := slRules.Values['casesensitive'];
        if tmpmode = '1' then
          searchdata.caseSensitive := true;

        tmpmode := slRules.Values['alllists'];
        if tmpmode = '1' then
          searchdata.allList := true;

        searchdata.s1 := conditionalCase(slRules.Values['search'], not searchdata.caseSensitive);

        searchReplace(MainLoader.listArray, searchdata, false);
        slRules.clear;
      end;
      if openrule then
        slRules.add(sl[i]);
    end;
    slRules.free;
    sl.free;
  end;
  form11.free;
  repaintTrees;
end;

procedure TForm1.GetTreeRange(loader: tTranslatorLoader; var a, b: integer; optBool: boolean = false);
begin
  if isLoaderOneList(loader) or optBool then
  begin
    a := 0;
    b := 2;
  end
  else
  begin
    a := mainPageControl.ActivePageIndex;
    b := a
  end;
end;

procedure TForm1.searchReplace(listArray: tAlist; sData: rsearchdata; repainttree: boolean = true);
var
  i, j, a, b: integer;
  sk: tskystr;
begin
  timeUndo;
  GetTreeRange(MainLoader, a, b, sData.allList);

  for j := a to b do
  begin
    for i := 0 to listArray[j].count - 1 do
    begin
      sk := listArray[j][i];
      if sk.lockedStatus then
        continue;

      if sData.restrictvisible and not isInFilter(sk) then
        continue;

      case sData.mode1 of
        1:
          if (translated in sk.sparams) or (validated in sk.sparams) then
            continue;
        2:
          if sk.LDResult < 90 then
            continue;
        3:
          if not treearray[j].Selected[sk.pnode] then
            continue;
      end;
      case sData.mode2 of
        0:
          if pos(sData.s1, conditionalCase(sk.strans, not searchdata.caseSensitive)) > 0 then
          begin
            MainLoader.addUndo(sk, tTimeUndo, false);
            if searchdata.caseSensitive then
              sk.strans := stringreplace(sk.strans, sData.s1, sData.s2, [rfReplaceAll])
            else
              sk.strans := stringreplace(sk.strans, sData.s1, sData.s2, [rfReplaceAll, rfIgnoreCase]);
            sk.resetStatus([incompleteTrans]);
            setuserCacheUpdated(MainLoader, cacheLoaded);
          end;

        1:
          if pos(sData.s1, conditionalCase(sk.s, not searchdata.caseSensitive)) > 0 then
          begin
            MainLoader.addUndo(sk, tTimeUndo, false);
            sk.strans := replaceDIALPattern(searchdata.strformat, sData.s2, sk.strans, '%REPLACE%', '%ORIG%');
            sk.resetStatus([incompleteTrans]);
            setuserCacheUpdated(MainLoader, cacheLoaded);
          end;

        2:
          begin
            MainLoader.addUndo(sk, tTimeUndo, false);
            sk.strans := replaceDIALPattern(searchdata.strformat, sData.s2, sk.strans, '%REPLACE%', '%ORIG%');
            sk.resetStatus([incompleteTrans]);
            setuserCacheUpdated(MainLoader, cacheLoaded);
          end;
      end;
    end;
  end;
  if repainttree then
    repaintTrees;
end;

procedure TForm1.menuDelete1Click(Sender: TObject);
var
  nodeList: TNodeArray;
  Data: ptreedatafdr;
  i: integer;
  pSource: PVirtualNode;
  b: boolean;
begin
  if not checkuserCacheUpdated(MainLoader) then
    exit;
  b := true;
  nodeList := VocabTree.Getsortedselection(true);
  for i := 0 to length(nodeList) - 1 do
  begin
    pSource := nodeList[i];
    Data := VocabTree.GetNodeData(pSource);
    if (fdrUser in Data.BasicND.s.fparams) then
    begin
      if b then
        b := DelFileOperation(SSTUserFolder + getSSTFileName(Data.BasicND.s.name, 'sst'), '', FO_DELETE, FOF_ALLOWUNDO);
    end;
  end;
  if b then
    LaunchLoadCache;
end;

procedure TForm1.MenuDeleteEmpty1Click(Sender: TObject);
var
  Data: ptreedatafdr;
begin
  if assigned(VocabTree.focusedNode) then
  begin
    Data := VocabTree.GetNodeData(VocabTree.focusedNode);
    if Data.BasicND.s.fparams * [fdrIsFolder, fdrIsDefaultFolder] = [fdrIsFolder] then
    begin
      if VocabTree.focusedNode.ChildCount = 0 then
        VocabTree.DeleteNode(VocabTree.focusedNode)
    end;
  end;
end;

procedure TForm1.MenuExpandAll1Click(Sender: TObject);
begin
  VocabTree.FullExpand;
end;

procedure TForm1.MenuFilterCurrentFormID1Click(Sender: TObject);
var
  sk: tskystr;
begin
  if assigned(MainLoader) then
  begin
    if MainLoader.FilteredRecord > 0 then
    begin
      MainLoader.FilteredRecord := 0;
      ToolButton56.Enabled := false;
      searchIntree;
    end
    else
    begin
      sk := getFocusedString(currentEditedTree);
      if assigned(sk) and sk.isEspAssigned then
      begin
        MainLoader.FilteredRecord := sk.esp.formID;
        ToolButton56.Enabled := true;
        searchIntree;
      end;
    end;
  end;
end;

procedure TForm1.MenuLocked1Click(Sender: TObject);
begin
  currentEditedTree.endeditnode;
  updateStringStatus(MainLoader, currentEditedTree, [lockedTrans]);
end;

procedure TForm1.menuOnClick(Sender: TObject);
var
  ext: string;
  r: rRecentData;
begin
  r := parseRecentMenuData(recentAddon.strings[TMenuItem(Sender).tag]);
  if not FileExists(r.fNameFull) then
  begin
    recentMenuUpdateCleanNotFound(recentAddon.strings[TMenuItem(Sender).tag]);
    dofeedback(getRes('FbK_menuFail'), true);
    exit;
  end;
  ext := ansilowercase(extractFileExt(r.fNameFull));
  if CustomTxtParams.isValidTxtExt(ext) then
    loadMCM(r.fNameFull, false)
  else if (ext = '.esp') or (ext = '.esm') or (ext = '.esl') then
    loadSingleEsp(r.fNameFull, false, true)
  else if (ext = '.pex') then
    loadpex(r.fNameFull, false)
  else if (ext = '.bsa') or (ext = '.ba2') then
    OpenBSA(r.fNameFull, false)
  else
    loadStrings(r.fNameFull, false);
  bAutocloseWithWizard := false;
end;

procedure TForm1.Menu_Search_SourceClick(Sender: TObject);
begin
  searchInMode := TMenuItem(Sender).tag;
  ToolButton1.ImageIndex := searchImageID[searchInMode];
  ToolButton1.Hint := getRes(searchImageHINT[searchInMode]);
  searchIntree;
end;

procedure TForm1.updateSearchIcon(icon: integer);
begin
  with ButtonedEdit1.leftbutton do
  begin
    DisabledImageIndex := icon;
    HotImageIndex := icon;
    ImageIndex := icon;
    PressedImageIndex := icon;
  end;
end;

procedure TForm1.drawTranslationStats;
var
  i, oldpos, newPos: integer;
begin
  if not bApplicationStarted then
    exit;
  if assigned(MainLoader) then
  begin
    oldpos := 0;
    for i := 1 to 6 do
    begin
      newPos := round((Image1.Width * mainLoaderStat[0][i]) / 100);
      if newPos > 0 then
      begin
        Image1.canvas.Brush.Color := cWidgetColor[i];
        Image1.canvas.FillRect(Rect(oldpos, 0, oldpos + newPos, Image1.Height));
      end;
      oldpos := oldpos + newPos;
    end;
  end
  else
  begin
    Image1.canvas.Brush.Color := $DDDDDD;
    Image1.canvas.FillRect(Rect(0, 0, Image1.Width, Image1.Height));
  end;
  // draw scale
  Image1.canvas.pen.Color := clBlack;
  Image1.canvas.Brush.Color := clBlack;
  for i := 1 to 3 do
  begin
    Image1.canvas.moveto(round(i * ((Image1.Width - 1) / 4)), 0);
    Image1.canvas.lineto(round(i * ((Image1.Width - 1) / 4)), Image1.Height);
  end;
  Image1.canvas.framerect(Rect(0, 0, Image1.Width, Image1.Height));

  Image1.Hint := formatres('hint_statTranslated', [MainLoaderStatsOutputRaw(1) + MainLoaderStatsOutputRaw(2), MainLoaderStatsOutputRaw(6), MainLoaderStatsOutputRaw(3),
    MainLoaderStatsOutputRaw(4) + MainLoaderStatsOutputRaw(5)]);
end;

procedure TForm1.PageControl1Change(Sender: TObject);
begin
  clearTreesSelection;
end;

procedure TForm1.McmCompare1Click(Sender: TObject);
var
  filename: string;
begin
  if (currentTesvMode = sTESVMcM) then
  begin
    filename := OpenFileDialog('', Game_EspCompareFolder, '', formatres('FilterMCM3%s|%s', [CustomTxtParams.sCustomExtList, CustomTxtParams.sCustomExtList]));
    if (filename = '') then
      exit;
    if not FileExists(filename) then
    begin
      dofeedback(getRes('FileNotFound'), true);
      exit;
    end;
    loadMCMCompare(filename);
    searchIntree;
  end;
end;

procedure TForm1.MenuAddHeader1Click(Sender: TObject);
begin
  applytoolBox(MainLoader, currentEditedTree, 5);
end;

procedure TForm1.closeAllLoaders(bSilent: boolean = false);
begin
  globalUIlockON(5);
  removeAllLoaders(bSilent);
  globalUIlockOFF(5)
end;

procedure TForm1.closeCurrentLoader(bSilent: boolean = false);
begin
  form2.close;
  globalUIlockON(5);
  removeCurrentLoader(bSilent);
  globalUIlockOFF(5)
end;

procedure TForm1.MenuCloseCurrentClick(Sender: TObject);
begin
  closeCurrentLoader(false);
end;

procedure TForm1.MenuCloseALL1Click(Sender: TObject);
begin
  closeAllLoaders(false);
end;

procedure TForm1.openDefineTagFilter(loader: tTranslatorLoader);
var
  i: byte;
  ti: TGrpButtonItem;
begin
  if assigned(loader) then
    loader.isColab;

  FormColabFilter := TFormColabFilter.create(self);
  FormColabFilter.loader := loader;
  FormColabFilter.ButtonGroup1.ButtonWidth := FormColabFilter.ButtonGroup1.Width div 8;
  for i := 1 to MAXCOLAB_ID do
  begin
    ti := FormColabFilter.ButtonGroup1.items.add;
    ti.caption := inttohex(i, 2);

    if assigned(loader) then
      FormColabFilter.aColab[i] := loader.aColab[i] > 0;

    FormColabFilter.aColabFilter[i] := 0;
    if i in colabIdFilterAdd then
      FormColabFilter.aColabFilter[i] := 1
    else if i in colabIdFilterSub then
      FormColabFilter.aColabFilter[i] := 2;

    if FormColabFilter.aColab[i] then
      ti.ImageIndex := 70;
    if FormColabFilter.aColabFilter[i] = 1 then
      ti.ImageIndex := 79
    else if FormColabFilter.aColabFilter[i] = 2 then
      ti.ImageIndex := 80;
    if (not FormColabFilter.aColab[i]) and (FormColabFilter.aColabFilter[i] = 0) then
      ti.ImageIndex := 67;
  end;

  FormColabFilter.showmodal;

  if FormColabFilter.ModalResult = mrOK then
  begin
    colabIdFilterAdd := [];
    colabIdFilterSub := [];
    for i := 1 to MAXCOLAB_ID do
    begin
      if FormColabFilter.aColabFilter[i] = 1 then
        include(colabIdFilterAdd, i)
      else if FormColabFilter.aColabFilter[i] = 2 then
        include(colabIdFilterSub, i);
    end;
    if colabIdFilterAdd = [] then
      colabIdFilterAdd := [0];
    if colabIdFilterSub = [] then
      colabIdFilterSub := [0];
  end;

  FormColabFilter.free;
  if ((colabIdFilterSub <> []) and (colabIdFilterSub <> [0])) and ((colabIdFilterAdd <> []) and (colabIdFilterAdd <> [0])) then
    ToolButton2.ImageIndex := 81
  else if ((colabIdFilterSub <> []) and (colabIdFilterSub <> [0])) then
    ToolButton2.ImageIndex := 80
  else if ((colabIdFilterAdd <> []) and (colabIdFilterAdd <> [0])) then
    ToolButton2.ImageIndex := 79
  else
    ToolButton2.ImageIndex := 67;
end;

procedure TForm1.MenuColab1Click(Sender: TObject);
begin
  SetColabID(MainLoader, currentEditedTree, TMenuItem(Sender).tag);
end;

procedure TForm1.MenuCollapseAll1Click(Sender: TObject);
begin
  VocabTree.FullCollapse;
end;

procedure TForm1.CollapseAll1Click(Sender: TObject);
begin
  espTree.FullCollapse;
end;

procedure TForm1.ExpandAll1Click(Sender: TObject);
begin
  espTree.FullExpand;
end;

function TForm1.removeCurrentLoader(bSilent: boolean): boolean;
begin
  Result := false;
  if not assigned(MainLoader) then
    exit;
  if bSilent or checkuserCacheUpdated(MainLoader) then
  begin
    if isFuzLoaded(MainLoader, fuz.current) then
      fuz.clear;
    if isNpcLoaded(MainLoader) then
      freeandNil(mainDialdata);
    NullifyMainLoaderData;
    removeFromComboList(MainLoader);
    Result := true;
  end;
end;

procedure TForm1.UpdateLoaderSetting(loader: tTranslatorLoader; bSwitchMode: boolean = false);
begin
  if assigned(loader) then
    loader.updateSetting(mainPageControl.ActivePageIndex, bSwitchMode);
end;

function TForm1.checkUserCacheUpdatedLite(loader: tTranslatorLoader): boolean;
begin
  if (BlockSameLanguageEditing) or (currentTesvMode = sTESVStrings) then
    setuserCacheUpdated(loader, false);
  Result := getuserCacheUpdated(loader);
end;

procedure TForm1.ClearUnchangedLoaderList(loader: tTranslatorLoader);
var
  i: integer;
begin
  loaderList.items.beginupdate;
  for i := pred(loaderList.items.count) downto 0 do
  begin
    if (tTranslatorLoader(loaderList.items.Objects[i]) <> loader) and (not checkUserCacheUpdatedLite(tTranslatorLoader(loaderList.items.Objects[i]))) then
    begin
      tTranslatorLoader(loaderList.items.Objects[i]).free;
      loaderList.items.delete(i);
    end;
  end;
  loaderList.items.endupdate;
end;

procedure TForm1.ClearSSTLoaderList(loader: tTranslatorLoader);
var
  i, newIndex: integer;
  lastLoader: tTranslatorLoader;
begin
  lastLoader := loader;
  loaderList.items.beginupdate;
  for i := pred(loaderList.items.count) downto 0 do
  begin
    if (tTranslatorLoader(loaderList.items.Objects[i]).loaderType = sLoaderTypeSST) then
    // (tTranslatorLoader(loaderList.Items.Objects[i]) <> loader) and
    begin
      if loader = tTranslatorLoader(loaderList.items.Objects[i]) then
        loader := nil;
      tTranslatorLoader(loaderList.items.Objects[i]).free;
      loaderList.items.delete(i);
    end;
  end;
  loaderList.items.endupdate;

  if loaderList.items.count = 0 then
  begin
    loaderList.itemIndex := -1;
    loaderList.Repaint;
    cleanStuff;
  end
  else
  begin
    newIndex := getCurrentLoaderIndex(lastLoader);
    if newIndex = -1 then
      newIndex := 0;
    loaderList.itemIndex := newIndex;
    ComboBox1Change(nil);
  end;
end;

function TForm1.removeAllLoaders(bSilent: boolean): boolean;
begin
  Result := false;

  if not assigned(MainLoader) then
    exit;
  form2.close;
  FormKeyWord.close;
  ClearUnchangedLoaderList(MainLoader);

  while loaderList.items.count > 0 do
    if not removeCurrentLoader(bSilent) then
      break;

  if loaderList.items.count = 0 then
  begin
    loaderList.itemIndex := -1;
    loaderList.Repaint;
    Result := true;
    cleanStuff;
  end;

  Application.ProcessMessages;
end;

function TForm1.removeAndFinalyzeAllLoaders: boolean;
begin
  Result := false;
  bSuspendstringwarning := true;
  if not assigned(MainLoader) then
    exit;
  form2.close;
  FormKeyWord.close;

  while loaderList.items.count > 0 do
  begin
    SaveFile;
    if not removeCurrentLoader(false) then
      break;
  end;

  if loaderList.items.count = 0 then
  begin
    loaderList.itemIndex := -1;
    loaderList.Repaint;
    Result := true;
    cleanStuff;
  end;
  bSuspendstringwarning := false;
  Application.ProcessMessages;
end;

procedure TForm1.ClearLoaderList(updateMode: boolean = true);
var
  i: integer;
begin
  for i := 0 to pred(loaderList.items.count) do
    tTranslatorLoader(loaderList.items.Objects[i]).free;
  loaderList.clear;
  NullifyMainLoader(updateMode);
end;

procedure TForm1.ClearLog1Click(Sender: TObject);
begin
  MemoLog.clear;
end;

procedure TForm1.NullifyMainLoaderData;
begin
  clearTrees;
  fillchar(mainLoaderStat, SizeOf(mainLoaderStat), 0);
  SynEditPex.clear;
  SynEditScript.clear;
  ListBox2.clear;
  ClearHeuristicData(true);
  clearFuzUI;
  clearNPCUI;
  ResetFocusedData;
end;

procedure TForm1.NullifyMainLoader(updateMode: boolean = true);
begin
  form2.close;
  MainLoader := nil;
  NullifyMainLoaderData;
  currentTesvMode := sTESVTNone;
  if updateMode then
  begin
    updateStatusFile(loaderList.itemIndex, loaderList.items.count);
    setTESVMode(true);
  end;
end;

procedure TForm1.importSST1Click(Sender: TObject);
var
  t: tstringlist;
  fProc, fProcVmad, fprocVmadTrans: tcompareproc;
  proc: tListSortCompare;
  i: integer;
begin
  if not assigned(MainLoader) then
    exit;
  t := tstringlist.create;
  try
    if OpenFileDialogMulti(getRes('ImportSST'), Game_SSTFolder, '', getRes('FilterSST|*.SST'), t) then
      if (t.count > 0) and openCompareOpt(proc, fProc, fProcVmad, fprocVmadTrans, true, 1, '') then
      begin
        Game_SSTFolder := ExtractFilePath(t[0]);
        startStuff(getRes('Fbk_applySST'));
        for i := 0 to t.count - 1 do
          MainLoader.doApplySst(t[i], proc, fProc, fProcVmad, fprocVmadTrans, bResetStateOpt, bApplyTagOnly, false);
        setTreeSortAndSort(3);
        VocabTree.Repaint;
        stopStuff;
      end;
  finally
    t.free;
  end;
end;

function TForm1.initializeLoader(loader: tTranslatorLoader): boolean;
begin
  if loader.initialized then
    exit(false);
  if not TESVTsst then
  begin
    loadSstString(loader, SSTUserFolder);
    if (loader.LoaderMode = sTESVPex) then
      setTreeSortAndSort(0, 3)
    else
      doFindStrMatch(loader, true, compareOptDefault, nil, nil);
  end;
  if bsaveSizeList then
    loader.checkFieldSize; // dev
  loader.initialized := true;
  Result := true;
end;

procedure TForm1.applyLoaderSettings(loader: tTranslatorLoader);
var
  i: integer;
begin
  if loader.settingsSet then
    for i := 0 to 2 do
    begin
      if inrange(loader.SortColumn[i], 0, 4) then
        treearray[i].Header.SortColumn := loader.SortColumn[i]
      else
        treearray[i].Header.SortColumn := 3;

      if loader.bUseOneTree then
        loader.activepage := 0;
      if inrange(loader.activepage, 0, 2) then
        mainPageControl.ActivePageIndex := loader.activepage;
    end;
  sortAllTree;
  searchIntree;
  loader.setTopNode;
end;

procedure TForm1.toggleOneList(b: boolean);
begin
  if assigned(MainLoader) then
  begin
    form2.close;
    UpdateLoaderSetting(MainLoader, true);
    globalUpdateAll(globalBeginUpdate, 1);
    startStuff('');
    ResetFocusedData;
    ClearHeuristicData(true);
    clearTrees;
    MainLoader.bUseOneTree := b;
    setTESVMode(false);
    MainLoader.AddonLoadfillTree;
    applyLoaderSettings(MainLoader);
    stopStuff(false, false);
    currentEditedTree.setFocus;
    globalUpdateAll(globalEndUpdate, 1);
  end;
end;

procedure TForm1.updateCurrentLoader;
var
  b: boolean;
begin
  // --------------------
  AutoSaveOff;

  if assigned(MainLoader) then
  begin

    if not bcacheloaded then
      LaunchLoadCache;

    globalUpdateAll(globalBeginUpdate, 1);

    startStuff('');
    form2.close;
    clearFuzUI;
    clearNPCUI;
    ResetFocusedData;
    ClearHeuristicData(true);
    SynEditPex.clear;
    SynEditScript.clear;
    ListBox2.clear;
    clearTrees;
    currentTesvMode := MainLoader.LoaderMode;
    b := initializeLoader(MainLoader);
    setTESVMode(true);
    MainLoader.AddonLoadfillTree;
    findCurrentCodepage(ComboBox_changeCP, MainLoader);
    MainLoader.lockTES4;
    applyLoaderSettings(MainLoader);
    // wrongWorkSpace
    if (MainLoader.loaderType = sLoaderTypeEsp) then
    begin
      if getGameByFormVersion(MainLoader.espLoader.fEspMasterVersion) <> CURRENT_GAME_ID then
        bCurrentWrongWorkspace := true
      else
        bCurrentWrongWorkspace := false;
    end
    else
      bCurrentWrongWorkspace := false;
    updateCompoColor;
    // -------------
    if (MainLoader.loaderType = sloaderTypePex) then
    begin
      openScriptFromExternal(extractFileName(MainLoader.addon_name), removefileext(extractFileName(MainLoader.addon_name)) + '.psc');
      updatePexFeedback(MainLoader.PexDecompiler, 1);
    end;
    MainLoader.bQuestListbuilt := false;
    MainLoader.QuestsList.clear;
    if pagecontrol2.ActivePageIndex = PageControl_Quest then
      MainLoader.drawQuestsList(ButtonedEdit4.Text, ListBox2, true);

    stopStuff(false, b);

    globalUpdateAll(globalEndUpdate, 1);

    if pagecontrol2.ActivePageIndex = PageControl_Fuz then
    begin
      startStuff('');
      generateFuzMap;
      generateNpcMap(false);
      if isFuzLoaded(MainLoader, fuz.current) then
        fuz.drawVoiceList(ListBox3.items, ButtonedEdit6.Text);
      if isNpcLoaded(MainLoader) then
        mainDialdata.fillList(ListBox4.items, ButtonedEdit6.Text);
      stopStuff;
    end;
    AutoSaveOn;
  end
  else
  begin
    globalUpdateAll(globalBeginUpdate, 1);
    startStuff('');
    cleanStuff;
    stopStuff(false, false);
    globalUpdateAll(globalEndUpdate, 1);
  end;
end;

procedure TForm1.cleanStuff;
var
  i: integer;
begin
  fuz.clear;
  freeandNil(mainDialdata);
  NullifyMainLoader;
  bCurrentWrongWorkspace := false;
  updateCompoColor;
  for i := 0 to 2 do
    pageCaptionLabel[i] := format('%s [0/0]', [strListLabel[i]]);
  updatePageControlCaption;
end;

procedure TForm1.saveVocabData;
begin
  if (Sourcelanguage <> '') and (Destlanguage <> '') then
  begin
    Sourcelanguage := ansilowercase(Sourcelanguage);
    Destlanguage := ansilowercase(Destlanguage);
    if loadOrder.count > 0 then
    begin
      updateLoadOrder;
      secureSavetStringList(loadOrder, mainpath + CURRENT_PREFS_SUBFOLDER + USERPREFS_Vocab_FILE + Sourcelanguage + '_' + Destlanguage + USERPREFS_Vocab_Ext);
    end;
  end;
end;

procedure TForm1.unloadCache;
begin
  saveVocabData;
  // clear all datas that have vocabRef
  ClearHeuristicData;
  onewordList.clear;
  clearSkList(vocabBaselist, true);
  clearInternalRefList(vocabEdidList);
  VocabTree.clear;
  bcacheloaded := false;
  idleVocabCounter := 0;
  vocabEdidListCurrentCompareProc := nil;
  vocabBaseListCurrentCompareProc := nil;
end;

procedure TForm1.loadStrings(filename: string; savefolder: boolean);
var
  Index: integer;
begin
  globalUIlockON(10, formatres('FbK_LoadindAddonStr', [extractFileName(filename)]));
  UpdateLoaderSetting(MainLoader);
  ResetFocusedData;

  index := doloadStrings(filename, true);
  stopStuff;
  if index = -1 then
    index := loaderList.items.count - 1;
  loaderList.itemIndex := index;
  loaderList.OnChange(loaderList);
  bAutocloseWithWizard := false;
  globalUIlockOFF(10);
end;

function TForm1.doloadStrings(filename: string; savefolder: boolean): integer;
var
  currentloader: tTranslatorLoader;
  b: boolean;
  r: rFileData;
begin
  b := false;
  // -check for existing
  if isAlreadyLoaded(filename, Result) then
    exit;

  currentloader := tTranslatorLoader.create(filename, espTree);
  currentloader.loaderType := sLoaderTypeStr;
  try
    r := parseFileNameData(filename);
    currentloader.addon_folder := r.fPathSlash;
    currentloader.addon_Lang := r.fLang;
    currentloader.addon_name := r.fNameStrict;
    currentloader.addon_Fullpath := filename;
    updateStatus(currentloader.addon_name);
    b := loadAddonStrings(currentloader, currentloader.addon_folder, ansilowercase(currentloader.addon_name), currentloader.addon_Lang, CreateNodeAddon, bforceCpOnLoad, 0, false, nil, false, false);

  finally
    if b then
    begin
      loaderList.items.AddObject(currentloader.getcaption, currentloader);
      currentloader.fLoaderMode := sTESVStrings;
      // change silent
      recentMenuUpdate(filename, 3);
      if savefolder then
        Game_StringFolder := currentloader.addon_folder;
    end
    else
      currentloader.free;
  end;
end;

function TForm1.loadAddonStrings(loader: tTranslatorLoader; folder, addon, lang: string; opt: parseOpt; forceCp: string; locOpts: integer = 0; bAuthBsa: boolean = false; fProc: tcompareproc = nil;
  bBuildCache: boolean = false; bLoadAllStrings: boolean = true): boolean;
var
  j, totalParseResult: integer;
  presult: ParseResult;
  filename, bsafilename: string;
  b: boolean;
  buffer: tbytes;
  bStream: TObject;
  bfile: array [0 .. 2] of byte;
begin
  // bLoadAllStrings:=false;
  presult.OrpheanCount := 0;
  presult.codepage := '';

  bStream := nil;
  Result := true;
  if bBuildCache then
  begin
    folder := Game_CacheStringFolder;
    bAuthBsa := bAuthBsa and getBSAFileName(lBSAdef, lBSAAlias, bsafilename, Game_CacheDataFolder, addon);
  end
  else
    bAuthBsa := bAuthBsa and getBSAFileName(lBSAdef, lBSAAlias, bsafilename, GetParentDirectory(folder), addon);

  try
    b := bLoadAllStrings;
    filename := format('%s%s_%s', [folder, addon, lang]);
    // checking
    for j := 0 to 2 do
    begin
      if locOpts = 1 then
      begin
        if (bAuthBsa and getStringfromArchive(bStream, buffer, bsafilename, strBSAfolder, addon + '_' + lang, strList[j], false)) then
          bfile[j] := 2
        else if authFileAccess(filename + strList[j]) then
          bfile[j] := 1
        else
          bfile[j] := 0;
      end
      else
      begin
        if authFileAccess(filename + strList[j]) then
          bfile[j] := 1
        else if (locOpts = 0) and (bAuthBsa and getStringfromArchive(bStream, buffer, bsafilename, strBSAfolder, addon + '_' + lang, strList[j], false)) then
          bfile[j] := 2
        else
          bfile[j] := 0;
      end;

      if bLoadAllStrings then
        b := b and (bfile[j] > 0)
      else if (bfile[j] > 0) then
        b := true;
    end;
    // if we have all files, lets load them
    totalParseResult := 0;
    if b then
    begin
      for j := 0 to 2 do
      begin
        if Result then
        begin
          if bfile[j] = 1 then
          begin
            dofeedback(getRes('Fbk_ReadFile'));
            presult := parseStrings(filename + strList[j], loader.listArray[j], opt, 0, j, 99, forceCp, fProc);
            loader.aLoadedStrings[j] := presult.OrpheanCount >= 0;
          end
          else if bfile[j] = 2 then
          begin
            dofeedback(getRes('Fbk_ReadBsa'));
            getStringfromArchive(bStream, buffer, bsafilename, strBSAfolder, addon + '_' + lang, strList[j], true);
            presult := parseStringsbuf(buffer, filename, loader.listArray[j], opt, 0, j, 99, forceCp, fProc);
            loader.aLoadedStrings[j] := presult.OrpheanCount >= 0;
          end
          else if not bLoadAllStrings then
            presult.OrpheanCount := 0;

          if presult.OrpheanCount < 0 then
            Result := false;
          totalParseResult := totalParseResult + presult.OrpheanCount;
        end;
      end;
    end
    else
    begin
      dofeedback(getRes('Fbk_MissingStr'), false);
      Result := false;
    end;
    if Result and (totalParseResult > 0) then
      dofeedback(formatres('Fbk_StrOrphean2', [totalParseResult, DiscardTag[ord(OptKeepOrpheanStr)]]));
  finally
    loader.lastestUsedCodepage := presult.codepage;
    freeStreamArchive(bStream);
    buffer := nil;
  end;
end;

function TForm1.loadAddonStringsDirect(loader: tTranslatorLoader; var bStream: TObject; bsaName, folder, addon, lang: string; opt: parseOpt; forceCp: string; bIsCompare: boolean;
  fProc: tcompareproc = nil; bLoadAllStrings: boolean = true): boolean;
var
  j, totalParseResult: integer;
  presult: ParseResult;
  filename: string;
  b: boolean;
  buffer: tbytes;
  bfile: array [0 .. 2] of byte;
begin
  Result := true;
  try
    b := bLoadAllStrings;
    filename := format('%s%s_%s', [folder, addon, lang]);
    // checking
    for j := 0 to 2 do
    begin
      if (getStringfromArchive(bStream, buffer, bsaName, folder, addon + '_' + lang, strList[j], false)) then
        bfile[j] := 2
      else
        bfile[j] := 0;
      if bLoadAllStrings then
        b := b and (bfile[j] > 0)
      else if (bfile[j] > 0) then
        b := true;
    end;
    // if we have all files, lets load them
    totalParseResult := 0;
    if b then
    begin
      for j := 0 to 2 do
        if Result then
        begin
          dofeedback(getRes('Fbk_ReadBsa'));
          if bfile[j] = 2 then
          begin
            getStringfromArchive(bStream, buffer, bsaName, folder, addon + '_' + lang, strList[j], true);
            presult := parseStringsbuf(buffer, filename, loader.listArray[j], opt, 0, j, 99, forceCp, fProc);
            if bIsCompare then
              loader.aLoadedStrings[j] := presult.OrpheanCount >= 0;
          end
          else if not bLoadAllStrings then
            presult.OrpheanCount := 0;

          if presult.OrpheanCount < 0 then
            Result := false;
          totalParseResult := totalParseResult + presult.OrpheanCount;
        end;
    end
    else
    begin
      dofeedback(getRes('Fbk_MissingStr'), true);
      Result := false;
    end;
    if Result and (totalParseResult > 0) then
      dofeedback(formatres('Fbk_StrOrphean2', [totalParseResult, DiscardTag[ord(OptKeepOrpheanStr)]]));
  finally
    buffer := nil;
  end;
end;

procedure TForm1.pagecontrol2Change(Sender: TObject);
begin
  TimerPageControl2.Enabled := false;
  TimerPageControl2.Enabled := true;
end;

procedure TForm1.Panel31AlignPosition(Sender: TWinControl; Control: TControl; var NewLeft, NewTop, NewWidth, NewHeight: integer; var AlignRect: TRect; AlignInfo: TAlignInfo);
begin
  NewLeft := AlignRect.left + ((AlignRect.Width - Control.Width) div 2);
  NewTop := AlignRect.top + ((AlignRect.Height - Control.Height) div 2);
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
var
  selCount: boolean;
  sk: tskystr;
begin
  OpenScript1.Enabled := false;
  OpenScript1.visible := false;
  if assigned(MainLoader) and bGetVMADStrings then
  begin
    sk := getFocusedString(currentEditedTree);
    if assigned(sk) and (isVMADString in sk.sinternalparams) then
    begin
      OpenScript1.Enabled := bGetVMADStrings;
      OpenScript1.visible := bGetVMADStrings;
    end;
  end;
  SelectionColler.Enabled := Clipboard.AsText <> '';

  selCount := currentEditedTree.SelectedCount > 0;
  ArrayTranslatorApi_2.Enabled := selCount and apiData.checkForArrayEnabled;
end;

procedure TForm1.PopupMenu4Popup(Sender: TObject);
begin
  menuApplysst1.Enabled := ToolButton35.Enabled;
  menueditsst1.Enabled := enableEditSST(fdrUser);
  MenurenameFolder1.Enabled := enableEditSST(fdrIsFolder);
  MenuDeleteEmpty1.Enabled := enableEditSST(fdrIsFolder, true);
  menuReverseSST1.Enabled := menueditsst1.Enabled;
  menuDelete1.Enabled := menueditsst1.Enabled;
end;

procedure TForm1.checkAllSearchOpt(b: boolean);
var
  i: integer;
begin
  for i := 4 to ToolBar1.Buttoncount - 1 do
    if ToolBar1.buttons[i].tag > 0 then
      ToolBar1.buttons[i].down := b;
  launchSearchTimer;
end;

procedure TForm1.checkTaggedTES4SNAM1Click(Sender: TObject);
begin
  if assigned(MainLoader) then
    if MainLoader.isTaggedTES4_SNAM then
      dofeedback('tagFound: ' + xtHrTag);
end;

procedure TForm1.checkThisSearchOpt(id: integer);
var
  i: integer;
begin
  for i := 4 to ToolBar1.Buttoncount - 1 do
    if ToolBar1.buttons[i].tag > 0 then
      ToolBar1.buttons[i].down := ToolBar1.buttons[i].tag = id;
  launchSearchTimer;
end;

function TForm1.getSearchOptState(id: integer): boolean;
var
  i: integer;
begin
  for i := 4 to ToolBar1.Buttoncount - 1 do
    if (ToolBar1.buttons[i].tag > 0) and (ToolBar1.buttons[i].tag <> id) then
      if ToolBar1.buttons[i].down then
        exit(true);
  Result := false;
end;

procedure TForm1.SkyTreeNewText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; NewText: string);
var
  Data: ptreedata;
begin
  Data := Sender.GetNodeData(Node);
  MainLoader.addUndo(Data.BasicND.s, 0, false);
  Data.BasicND.s.strans := NewText;
  Data.BasicND.s.resetStatus([validated]);

  // ReplaceAllStrings(Data.BasicND.s, [validated], false);
  setuserCacheUpdated(MainLoader, cacheLoaded);
end;

procedure TForm1.SkyTreeEdited(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex);
var
  NewNode: PVirtualNode;
begin
  NewNode := Sender.GetNextvisible(Node);
  if assigned(NewNode) then
    Sender.focusedNode := NewNode;
end;

procedure TForm1.SkyTreeEditing(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; var Allowed: boolean);
begin
  Allowed := Column = 2;
end;

procedure TForm1.translate2fixNumberClick(Sender: TObject);
begin
  validateLD(true);
end;

procedure TForm1.translate1Click(Sender: TObject);
begin
  validateLD(false);
end;

procedure TForm1.validateLD(fixNum: boolean);
var
  Data: ptreedata;
begin
  if assigned(focusedNode.LDfstring) and assigned(LDtree.focusedNode) then
  begin
    Data := LDtree.GetNodeData(LDtree.focusedNode);
    if not assigned(focusedNode.fstring) or (focusedNode.LDfstring = focusedNode.fstring) then
    begin
      MainLoader.addUndo(focusedNode.LDfstring, 0, false);
      focusedNode.LDfstring.strans := Data.BasicND.s.strans;
      focusedNode.LDfstring.resetStatus([validated]);

      if fixNum then
         FixValueEx(MainLoader, 1, focusedNode.LDfstring, false);

      ReplaceAllStrings(focusedNode.LDfstring, [validated], false);
      repaintTrees;
      setuserCacheUpdated(MainLoader, cacheLoaded);

      if currentEditedTree.canfocus then
        currentEditedTree.setFocus;
    end
    else
      askDialog(getRes('FbK_LDNodeerror'), Form1, [askOK]);
  end;
end;

// --------------------------------------
procedure TForm1.updateLoadOrder;
var
  Data: ptreedatafdr;
  Node: PVirtualNode;
begin
  loadOrder.clear;
  Node := VocabTree.GetFirst;
  while assigned(Node) do
  begin
    Data := VocabTree.GetNodeData(Node);
    if fdrIsFolder in Data.BasicND.s.fparams then
    begin
      if not VocabTree.Expanded[Node] then
        include(Data.BasicND.s.fparams, fdrIscollapsed)
      else
        exclude(Data.BasicND.s.fparams, fdrIscollapsed);
      loadOrder.add(Data.BasicND.s.getFolderName)
    end
    else
    begin
      if (VocabTree.CheckState[Node] = csUnCheckedNormal) then
        include(Data.BasicND.s.fparams, fdrFileUnChecked)
      else
        exclude(Data.BasicND.s.fparams, fdrFileUnChecked);
      loadOrder.add(Data.BasicND.s.getFileName);
    end;
    Node := VocabTree.GetNext(Node);
  end;
end;

procedure TForm1.sortVocabTree(Column: integer);
var
  Node: PVirtualNode;
begin
  VocabTree.beginupdate;
  VocabTree.Sort(nil, Column, sdAscending);
  Node := VocabTree.GetFirst;
  while assigned(Node) do
  begin
    VocabTree.Sort(Node, Column, sdAscending);
    Node := VocabTree.GetNextSibling(Node);
  end;
  VocabTree.endupdate;
end;

procedure TForm1.ExpandVocabTree;
var
  Data: ptreedatafdr;
  Node: PVirtualNode;
begin
  Node := VocabTree.GetFirst;
  while assigned(Node) do
  begin
    Data := VocabTree.GetNodeData(Node);
    if not(fdrIscollapsed in Data.BasicND.s.fparams) then
      VocabTree.Expanded[Node] := true;
    Node := VocabTree.GetNextSibling(Node);
  end;
end;

function TForm1.getFolderByID(id: integer): PVirtualNode;
var
  Data: ptreedatafdr;
  Node: PVirtualNode;
begin
  Result := nil;
  Node := VocabTree.GetFirst;
  while assigned(Node) do
  begin
    Data := VocabTree.GetNodeData(Node);
    if (fdrIsFolder in Data.BasicND.s.fparams) and (Data.BasicND.s.id = id) then
      exit(Node);
    Node := VocabTree.GetNextSibling(Node);
  end;
end;

function TForm1.getDefaultFolder: PVirtualNode;
var
  Data: ptreedatafdr;
  Node: PVirtualNode;
begin
  Node := VocabTree.GetFirst;
  Result := Node;
  while assigned(Node) do
  begin
    Data := VocabTree.GetNodeData(Node);
    if (fdrIsDefaultFolder in Data.BasicND.s.fparams) then
      exit(Node);
    Node := VocabTree.GetNextSibling(Node);
  end;
end;

function TForm1.getIdAndFolderID(var skf: tskyfolder; defaultid: integer): integer;
var
  i: integer;
  currentID: integer;
begin
  currentID := 0;
  for i := 0 to loadOrder.count - 1 do
  begin
    if pos('*', loadOrder[i]) = 1 then
      currentID := i
    else if skf.setFileData(loadOrder[i], i) then
      exit(currentID);
  end;
  loadOrder.add(skf.name);
  skf.id := loadOrder.count - 1;
  Result := defaultid;
end;

procedure TForm1.prepareCacheList;
var
  searchResult: TSearchRec;
  Node: PVirtualNode;
  recs1, recs2, recs3: string;
  skf: tskyfolder;
  tmpfp: sFdrParams;
  i: integer;
  defautltID: integer;
begin
  bcacheloaded := false;
  VocabTree.beginupdate;
  VocabTree.clear;
  defautltID := 0;
  Sourcelanguage := ansilowercase(Sourcelanguage);
  Destlanguage := ansilowercase(Destlanguage);

  loadStringListEx(loadOrder, mainpath + CURRENT_PREFS_SUBFOLDER + USERPREFS_Vocab_FILE + Sourcelanguage + '_' + Destlanguage + USERPREFS_Vocab_Ext, false);

  // init  folder
  for i := 0 to loadOrder.count - 1 do
  begin
    if pos('*', loadOrder[i]) = 1 then
    begin
      skf := tskyfolder.init(copy(loadOrder[i], 2, maxInt), [fdrIsFolder], i);
      VocabTree.AddChild(nil, tnodedatafdr.create(skf));
      if (defautltID = 0) and (fdrIsDefaultFolder in skf.fparams) then
        defautltID := i;
    end;
  end;
  // add first folder if empty
  if VocabTree.GetFirst = nil then
    VocabTree.AddChild(nil, tnodedatafdr.create(tskyfolder.init('Unsorted', [fdrIsFolder], 0, true)));

  try
    // -SST first
    if FindFirst(SSTUserFolder + '*.sst', faAnyFile, searchResult) = 0 then
      repeat
        getLangSST(ansilowercase(removefileext(searchResult.name)), recs1, recs2, recs3);
        if (recs1 = Sourcelanguage) and (recs2 = Destlanguage) then
        begin
          tmpfp := [fdrUser];
          if searchResult.size <= SizeOf(cardinal) then
            include(tmpfp, fdrEmpty);
          skf := tskyfolder.init(recs3, tmpfp);
          Node := VocabTree.AddChild(getFolderByID(getIdAndFolderID(skf, defautltID)), tnodedatafdr.create(skf)); //
          VocabTree.ValidateNode(Node, false);
          if fdrFileUnChecked in skf.fparams then
            VocabTree.CheckState[Node] := csUnCheckedNormal
          else
            VocabTree.CheckState[Node] := csCheckedNormal;
        end;
      until FindNext(searchResult) <> 0;
    FindClose(searchResult);
  finally
    sortVocabTree(1);
    ExpandVocabTree;
    VocabTree.endupdate;
  end;
end;

// ----------------------------

procedure TForm1.updateCacheList(sstName: string);
begin
  updateCacheList(sstName, getSstNode(ansilowercase(sstName)));
end;

procedure TForm1.updateCacheList(sstName: string; sstNode: PVirtualNode);
var
  skf: tskyfolder;
  tmpfp: sFdrParams;
  Node: PVirtualNode;
begin
  // get Vocab SST node
  if assigned(sstNode) then
    VocabTree.CheckState[sstNode] := csCheckedNormal
  else
  begin
    tmpfp := [fdrUser];
    skf := tskyfolder.init(sstName, tmpfp);
    Node := VocabTree.AddChild(getDefaultFolder, tnodedatafdr.create(skf)); //
    VocabTree.ValidateNode(Node, false);
    VocabTree.CheckState[Node] := csCheckedNormal;
  end;

  vocabTreeFilter(ButtonedEdit2.Text);
end;

procedure TForm1.LaunchLoadCache;
var
  Node: PVirtualNode;
  filename: string;
  Data: ptreedatafdr;
  b: boolean;
  count, fileCount: integer;
  v, i: integer;
  tmpVocabList: tlist;
  Espdata: rEspPointerLite;
  skEdid, sktmp: tskystr;
begin
  startStuff(getRes('FbK_CacheLoad'));
  // ----cleaning---
  unloadCache;
  prepareCacheList;
  vocabTreeFilter(ButtonedEdit2.Text);
  // ----test 1.4.6
  tmpVocabList := tlist.create;
  fileCount := 0;
  VocabTree.beginupdate;
  // get progressbarBar Count
  Node := VocabTree.GetFirst;
  while assigned(Node) do
  begin
    Data := VocabTree.GetNodeData(Node);
    // initstates
    exclude(Data.BasicND.s.fparams, fdrLoaded);
    Data.BasicND.s.count := 0;
    // Count
    if (VocabTree.CheckState[Node] = csCheckedNormal) and (Data.BasicND.s.fparams * [fdrEmpty, fdrIsFolder] = []) then
      inc(fileCount);
    Node := VocabTree.GetNext(Node);
  end;
  ProgressBar.max := fileCount;
  ProgressBar.Position := 0;
  // ----------------------
  Destlanguage := ansilowercase(Destlanguage);
  fileCount := 0;
  try
    Node := VocabTree.GetFirst;
    while assigned(Node) do
    begin
      Data := VocabTree.GetNodeData(Node);
      // -load
      if VocabTree.CheckState[Node] = csCheckedNormal then
        if Data.BasicND.s.fparams * [fdrEmpty, fdrIsFolder] = [] then
        begin
          inc(fileCount);
          // --------------
          if fdrUser in Data.BasicND.s.fparams then
          begin
            filename := getSSTFileName(Data.BasicND.s.name, 'sst');
            if bUseQuickVocabLoading then
              b := loadVocabUserCache(vocabEdidList, tmpVocabList, SSTUserFolder + filename, Node, Data.BasicND.s.id, Data.BasicND.s.count, [], [], false, true, nil, nil, v)
            else
              b := loadVocabUserCache(vocabEdidList, vocabBaselist, SSTUserFolder + filename, Node, Data.BasicND.s.id, Data.BasicND.s.count, [], [], false, false, nil, nil, v);
            if b then
              include(Data.BasicND.s.fparams, fdrLoaded)
            else
              VocabTree.CheckState[Node] := csUnCheckedNormal;
          end;
          updatepBar(max(ProgressBar.max div 50, 1), fileCount, false);
        end;
      Node := VocabTree.GetNext(Node);
    end;

    updateStatus(getRes('FbK_Init'));
    ProgressBar.max := tmpVocabList.count;
    ProgressBar.Position := 0;
    // test 1.4.6
    if bUseQuickVocabLoading then
    begin
      tmpVocabList.Sort(compareallHashesAndSources);
      i := 0;
      while i < tmpVocabList.count do
      begin
        skEdid := tmpVocabList[i];
        // look for compareallHashesAndSources identical, then delete sk whiole keeping the skesp
        while i < tmpVocabList.count do
        begin
          sktmp := tmpVocabList[i];
          CopyMemory(@Espdata, @sktmp.esp, SizeOf(rEspPointerLite));
          if sktmp = skEdid then
          begin
            if (Espdata.rHash <> 0) and (isversion4 in sktmp.sinternalparams) then
            begin
              vocabEdidList.add(tEspStrRef.init(skEdid, Espdata, sktmp.listIndex, sktmp.sparams, sktmp.colabID, true));
              skEdid.addRefRec(Espdata.rName, Espdata.fName);
            end;
            // add the firstref (stredid) to vocablist
            vocabBaselist.add(skEdid);
          end
          else if compareallHashesAndSources(sktmp, skEdid) = 0 then
          begin
            if (Espdata.rHash <> 0) and (isversion4 in sktmp.sinternalparams) then
            begin
              vocabEdidList.add(tEspStrRef.init(skEdid, Espdata, sktmp.listIndex, sktmp.sparams, sktmp.colabID, true));
              skEdid.addRefRec(Espdata.rName, Espdata.fName);
            end;
            sktmp.free;
            // skTmp data is not needed anymore
          end
          else
            break;
          inc(i);
          updatepBar(ProgressBar.max div 50, i, false);
        end;
      end;
    end;

    // cleaning+feedback
    count := vocabBaselist.count;
    dofeedback(formatres('FbK_cachecount', [count]) + '[strings]');
    count := vocabEdidList.count;
    dofeedback(formatres('FbK_cachecount', [count]) + '[edid]');
    // cleaning+feedback
    count := 0;
    for i := 0 to pred(vocabBaselist.count) do
      if unusedInSST in tskystr(vocabBaselist[i]).sinternalparams then
        inc(count);
    dofeedback(formatres('Unused: %d', [count]));

    initVocabStrings(vocabBaselist);
    generateDerivedStringData;
    vocabBaselist.Sort(compareSourcesAndProxy);

    sortVocabEdidList(vocabEdidList, compareEspStr_V4Strict, true);
    generateOneWordList;

    if (vocabBaselist.count > 0) then
      initStrThread := TinitStringThread.create(Lock, false);

  finally
    tmpVocabList.free;
    VocabTree.endupdate;
    bcacheloaded := true;
    stopStuff;
  end;
end;

procedure TForm1.LDtreeBeforeCellPaint(Sender: TBaseVirtualTree; TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; CellPaintMode: TVTCellPaintMode; CellRect: TRect;
  var ContentRect: TRect);
begin
  TreeCellPaint(Sender, TargetCanvas, Node, Column, CellPaintMode, CellRect, ContentRect, true);
end;

function FileOperation(ASource, ADest: string): boolean;
begin
  Result := true;
  try
    tfile.move(ASource, ADest);
  except
    Result := false;
  end;
end;

function makeBackup(filename: string): boolean;
var
  f: file;
  basename: string;
begin
  // user doesnt want backup
  if not OptEspBackupOptSimple then
    exit(true);
  if not FileExists(filename) then
    exit(true);

  Result := false;
  try
    basename := appendDatetoName(MainLoader.addon_name);
    // --simple rename
    if not OptEspBackupOptFolder then
    begin
      AssignFile(f, filename);
      Rename(f, ExtractFilePath(filename) + '\' + basename);
      Result := true;
    end
    // --backupfolder
    else
      Result := FileOperation(filename, EspBackup_Folder + basename);
    if not Result then
      dofeedback(getRes('Fbk_RenameError'), true);
  except
    on E: Exception do
      dofeedback(getRes('Fbk_RenameError'), true);
  end;
end;

procedure TForm1.Save1Click(Sender: TObject);
begin
  SaveFile('');
end;

procedure TForm1.SaveFile(overrideOutputFolder: string = ''; overrideMethod: integer = 0);
var
  tmpFolder: string;
begin
  // closing editWindows
  // Note MenuFinalizeEsp-sc is used to handled short for chinese

  form2.valideStringChange(false, true, true, [validated]);
  form2.close;

  if not bSuspendstringwarning then
    if (askDialog(formatres('Fbk_FinalizeWarn', [MainLoader.addon_name, Sourcelanguage, Destlanguage]), Form1, 0, true, [askYes, askNo]) = mrNo) then
      exit;
  if currentTesvMode = sTESVPex then
    FinalizePex(MainLoader.addon_folder, MainLoader.addon_name, false)
  else if currentTesvMode = sTESVMcM then
  begin
    if TESVTSameLanguage or (MainLoader.addon_Lang = '') or not MainLoader.McMData.useLangSuffixe then
      FinalizeMCM(override_ExportFolder(overrideMethod, MainLoader.addon_folder, overrideOutputFolder), MainLoader.addon_Filename, true, false)
    else
      FinalizeMCM(override_ExportFolder(overrideMethod, MainLoader.addon_folder, overrideOutputFolder), MainLoader.addon_NameWithSuffixe, false, false)
  end
  else if TESVTmodSaveEsp then
  begin
    tmpFolder := override_ExportFolder(overrideMethod, MainLoader.addon_folder, overrideOutputFolder); // MainLoader.addon_folder
    if bUseFixedFolderExport and (overrideMethod = 0) then // use fixed dir if we are not in batcher with force Dir
    begin
      if directoryexists(ExcludeTrailingPathDelimiter(Game_EspFolderFixedExport)) then
        tmpFolder := Game_EspFolderFixedExport
      else
        dofeedback(formatres('fbk_fixedExportDirError%s%s', [Game_EspFolderFixedExport, MainLoader.addon_folder]), true);
    end;
    FinalizeEsp(tmpFolder, MainLoader.addon_name, false)
  end
  else
    // FinalizeStrings(MainLoader.addon_folder, MainLoader.addon_name)
    FinalizeStrings(override_ExportFolder(overrideMethod, MainLoader.addon_folder, overrideOutputFolder), MainLoader.addon_name)
end;

procedure TForm1.Save2Click(Sender: TObject);
var
  filename: string;
  tmpFolder, tmpFilename: string;
  bskipSuffixe: boolean;
begin
  // closing editWindows
  form2.valideStringChange(false, true, true, [validated]);
  form2.close;
  if (askDialog(formatres('Fbk_FinalizeWarn', [MainLoader.addon_name, Sourcelanguage, Destlanguage]), Form1, 0, true, [askYes, askNo]) = mrNo) then
    exit;
  if currentTesvMode = sTESVPex then
  begin
    ForceDirectories(MainLoader.addon_folder); // creating the string directory if necessary
    filename := SaveFileDialog(getRes('Dia_SavePexAs'), MainLoader.addon_folder, MainLoader.addon_name, pexFilter);
    if filename <> '' then
      FinalizePex(ExtractFilePath(filename), extractFileName(filename), true)
  end
  else if currentTesvMode = sTESVMcM then
  begin
    // creating the  directory if necessary
    ForceDirectories(MainLoader.addon_folder);
    bskipSuffixe := TESVTSameLanguage or (MainLoader.addon_Lang = '') or (not CustomTxtParams.useSuffixe(MainLoader.McMData.McmIdType));

    if bskipSuffixe then
      tmpFilename := extractFileName(MainLoader.addon_Filename)
    else
      tmpFilename := MainLoader.addon_NameWithSuffixe;

    filename := SaveFileDialog(getRes('Dia_SaveMCMAs'), MainLoader.addon_folder, tmpFilename, formatres('FilterTXT2%s|%s', [CustomTxtParams.sCustomExtList, CustomTxtParams.sCustomExtList]));

    if filename <> '' then
      FinalizeMCM(ExtractFilePath(filename), extractFileName(filename), bskipSuffixe, true);

  end
  else if TESVTmodSaveEsp then
  begin
    if (Game_EspFolderSaveAs <> '') and directoryexists(ExcludeTrailingPathDelimiter(Game_EspFolderSaveAs)) then
      tmpFolder := Game_EspFolderSaveAs
    else
      tmpFolder := MainLoader.addon_folder;
    filename := SaveFileDialog(getRes('Dia_SaveEspAs'), tmpFolder, MainLoader.addon_name, espFilter);
    if filename <> '' then
    begin
      Game_EspFolderSaveAs := ExtractFilePath(filename);
      FinalizeEsp(Game_EspFolderSaveAs, extractFileName(filename), true)
    end;
  end
  else
  begin
    ForceDirectories(MainLoader.addon_folder);
    // creating the string directory if necessary
    filename := SaveFileDialog(getRes('Dia_SaveStrAs'), MainLoader.addon_folder, removefileext(MainLoader.addon_name), stringsFilter);
    if filename <> '' then
      FinalizeStrings(ExtractFilePath(filename), extractFileName(filename));
  end;
end;

procedure TForm1.Save3bsaClick(Sender: TObject);
var
  i: integer;
  output: string;
  multi, b: boolean;
begin
  // closing editWindows
  form2.valideStringChange(false, true, true, [validated]);
  form2.close;

  if CURRENT_GAME_ID = 5 then
  begin
    dofeedback('Starfield Alpha version, not ready for this operation', true);
    exit;
  end;

  if (MainLoader.addon_BSApath = '') or not FileExists(MainLoader.addon_BSApath) then
  begin
    dofeedback(getRes('Fbk_BsaMissing'), true);
    exit;
  end;
  if not authFileAccessRW(MainLoader.addon_BSApath) then
  begin
    dofeedback(getRes('Fbk_BsaLocked'), true);
    exit;
  end;

  i := generateBsaExportAskMulti(MainLoader.addon_BSApath, output);
  if i <= 1 then
  begin
    b := askDialog(getRes('beta_Warning') + formatres('Fbk_ExportInBSA_Ask', [extractFileName(MainLoader.addon_nameinBSA)]), Form1, [askYes, askNo]) = mrYes;
    multi := false;
  end
  else
  begin
    b := true;
    multi := true;
    case askDialog(getRes('beta_Warning') + formatres('Fbk_ExportInBSAMulti_Ask', [MainLoader.addon_BSAName, output]), Form1, [askYes, askNo, askCancel]) of
      mrYes: multi := true;
      mrNo: multi := false;
    else b := false;
    end;
  end;

  if b then
  begin
    startStuff(getRes('Fbk_Savebsa'));
    InjectInBSA(MainLoader, multi);
    stopStuff;
  end;
end;

procedure TForm1.FinalizeEsp(folder, filename: string; doNotRename: boolean);
var
  okSave: boolean;
  tag: string;
begin
  if not warnForcedCodepage then
    exit;

  okSave := true;
  if doNotRename or (not OptEspBackupOptSimple) then
    tag := ''
  else
    tag := getRes('Fbk_FinalizeBackup');
  ForceDirectories(folder);
  if FileExists(folder + filename) then
    okSave := askDialog(formatres('Fbk_FinalizeConfirm', [folder + filename, tag]), Form1, 3, true, [askYes, askNo]) = mrYes;
  if okSave and (doNotRename or makeBackup(folder + filename)) then
  begin
    startStuff(getRes('Fbk_Saveesp'));
    MainLoader.updateAllRecords;
    if MainLoader.espLoader.saveEsp(folder + filename) then
      dofeedback(formatres('Fbk_Saved', [folder + filename]), true, [askPanel])
    else
      dofeedback(formatres('Fbk_SavedError', [folder + filename]), true);
    stopStuff;
  end;
end;

procedure TForm1.FinalizeMCM(folder, filename: string; bOriginalName, doNotRename: boolean);
var
  okSave: boolean;
  tag: string;
  tmpOutput: string;
begin
  okSave := true;
  iGlobalLastError := 0;

  // if bOriginalName then
  tmpOutput := folder + extractFileName(filename);
  // else
  // tmpOutput := folder + filename + '_' + Destlanguage + '.txt';

  if FileExists(tmpOutput) and not bSuspendstringwarning then
    okSave := askDialog(formatres('Fbk_FinalizeConfirm', [tmpOutput, tag]), Form1, 4, true, [askYes, askNo]) = mrYes;

  if okSave and (bSuspendstringwarning or makeBackup(tmpOutput)) then
  begin
    ForceDirectories(folder); // creating the string directory if necessary
    startStuff(getRes('Fbk_SaveMCM'));
    if MainLoader.McMData.saveMCM(MainLoader.listArray[0], tmpOutput) then
      dofeedback(formatres('Fbk_Saved', [tmpOutput]), true, [askPanel])
    else
    begin
      iGlobalLastError := 1;
      dofeedback(formatres('Fbk_SavedError', [tmpOutput]), true);
    end;
    stopStuff;
  end;
end;

procedure TForm1.FinalizePex(folder, filename: string; doNotRename: boolean);
var
  okSave: boolean;
  tag: string;
begin
  okSave := true;
  if doNotRename or (not OptEspBackupOptSimple) then
    tag := ''
  else
    tag := getRes('Fbk_FinalizeBackup');

  if FileExists(folder + filename) then
    okSave := askDialog(formatres('Fbk_FinalizeConfirm', [filename, tag]), Form1, 5, true, [askYes, askNo]) = mrYes;

  if okSave and (doNotRename or makeBackup(folder + filename)) then
  begin
    ForceDirectories(folder); // creating the string directory if necessary
    startStuff(getRes('Fbk_SavePex'));
    if MainLoader.savePex(folder + filename) then
      dofeedback(formatres('Fbk_Saved', [folder + filename]), true, [askPanel])
    else
      dofeedback(formatres('Fbk_SavedError', [folder + filename]), true);
    stopStuff;
  end;
end;

procedure TForm1.FinalizeStrings(folder, filename: string);
var
  j: integer;
  tmpexists, okSave: boolean;
begin
  iGlobalLastError := 0;
  if not bSuspendstringwarning and not warnForcedCodepage then
    exit;

  okSave := true;
  for j := 0 to 2 do
  begin
    tmpexists := FileExists(folder + filename + '_' + Destlanguage + strList[j]);
    if tmpexists then
      break;
  end;
  if tmpexists and not bSuspendstringwarning then
    okSave := askDialog(formatres('Fbk_FinalizeConfirm', [filename + '_' + Destlanguage, '']), Form1, 6, true, [askYes, askNo]) = mrYes;
  if okSave then
  begin
    ForceDirectories(folder); // creating the string directory if necessary
    startStuff(getRes('Fbk_SaveStr'));
    pbar := 0;
    ProgressBar.max := getTotalVocabCount(MainLoader.listArray);

    for j := 0 to 2 do
    begin
      if MainLoader.aLoadedStrings[j] then
        if not saveStringFile(folder + filename + '_' + Destlanguage, MainLoader.listArray, j) then
        begin
          iGlobalLastError := 1;
          dofeedback(formatres('Fbk_SavedError', [folder + filename + '_' + Destlanguage]), true);
        end;
    end;
    if iGlobalLastError = 0 then
      dofeedback(formatres('Fbk_Saved', [folder + filename + '_' + Destlanguage]), true, [askPanel]);
    stopStuff;
  end;
end;

procedure TForm1.ButtonedEdit1Change(Sender: TObject);
begin
  launchSearchTimer;
end;

procedure TForm1.ButtonedEdit1LeftButtonClick(Sender: TObject);
begin
  bUseReGexSearch := not bUseReGexSearch;
  if bUseReGexSearch then
    updateSearchIcon(57)
  else
    updateSearchIcon(13);
  launchSearchTimer;
end;

procedure TForm1.ButtonedEdit1RightButtonClick(Sender: TObject);
begin
  ButtonedEdit1.Text := '';
  launchSearchTimer;
end;

procedure TForm1.ButtonedEdit2Change(Sender: TObject);
begin
  TimerVocabSearch.Enabled := false;
  TimerVocabSearch.Enabled := true;
end;

procedure TForm1.ButtonedEdit2RightButtonClick(Sender: TObject);
begin
  ButtonedEdit2.Text := '';
  vocabTreeFilter(ButtonedEdit2.Text)
end;

procedure TForm1.ButtonedEdit3Change(Sender: TObject);
begin
  ButtonedEdit3.Color := gradient(clWhite);
  TimerSearchPex.Enabled := false;
  TimerSearchPex.Enabled := true;
end;

procedure TForm1.ButtonedEdit3LeftButtonClick(Sender: TObject);
begin
  dosearchinPexText([ssoEntireScope]);
end;

procedure TForm1.ButtonedEdit3RightButtonClick(Sender: TObject);
begin
  ButtonedEdit3.Text := '';
end;

procedure TForm1.ButtonedEdit4Change(Sender: TObject);
begin
  if assigned(MainLoader) then
    MainLoader.drawQuestsList(ButtonedEdit4.Text, ListBox2, true);
end;

procedure TForm1.ButtonedEdit4RightButtonClick(Sender: TObject);
begin
  ButtonedEdit4.Text := '';
end;

procedure TForm1.ButtonedEdit6Change(Sender: TObject);
begin
  if assigned(mainDialdata) then
    mainDialdata.fillList(ListBox4.items, ButtonedEdit6.Text);
  if assigned(MainLoader) and isFuzLoaded(MainLoader, fuz.current) then
    fuz.drawVoiceList(ListBox3.items, ButtonedEdit6.Text);
end;

procedure TForm1.ButtonedEdit6RightButtonClick(Sender: TObject);
begin
  ButtonedEdit6.Text := '';
end;

procedure TForm1.ToolButton26MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
begin
  launchSearchTimer;
end;

procedure TForm1.ToolButton27Click(Sender: TObject);
begin
  launchSearchTimer
end;

procedure TForm1.ToolButton28Click(Sender: TObject);
begin
  ShellExecute(Application.Handle, nil, 'explorer.exe', PChar(SSTUserFolder), nil, SW_NORMAL);
end;

procedure TForm1.ToolButton2MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
begin
  if Button = mbRight then
    openDefineTagFilter(MainLoader);
  launchSearchTimer;
end;

procedure TForm1.ToolButton31Click(Sender: TObject);
begin
  sortVocabTree(0);
end;

procedure TForm1.ToolButton35Click(Sender: TObject);
begin
  if (VocabTree.SelectedCount > 0) and TESVTmodLoaded then
    applySst(MainLoader);
end;

procedure TForm1.ToolButton37Click(Sender: TObject);
begin
  dosearchinPexText([]);
end;

procedure TForm1.ToolButton38Click(Sender: TObject);
begin
  dosearchinPexText([ssoBackwards]);
end;

procedure TForm1.ToolButton41bClick(Sender: TObject);
begin
  RegexTranslation1Click(Sender);
end;

procedure TForm1.ToolButton43MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
var
  strtmp: string;
  i: integer;
begin
  if Button = mbRight then
  begin
    if assigned(MainLoader) and assigned(MainLoader.espLoader) then
    begin
      strtmp := '<b>' + MainLoader.addon_name + '</b>' + htmlBR + htmlBR + 'Masters FormID refs:' + htmlBR;
      for i := 0 to pred(MainLoader.espLoader.mastersData.count) do
        strtmp := strtmp + format('%.2x : %s', [i, MainLoader.espLoader.mastersData[i]]) + htmlBR;
      openQuickHtmlViewer(self, strtmp, 200);
      exit;
    end;
  end;

  if CURRENT_GAME_ID >= 0 then
    openQuickHtmlViewer(self, format(ABOUTDATA, [aPROG_NAME[CURRENT_GAME_ID], aPROG_CURRENTVERSION, AuthorName]), 175)
end;

procedure TForm1.ToolButton46Click(Sender: TObject);
begin
  LoadAllMasters;
end;

procedure TForm1.LoadAllMasters;
var
  filenames: tstringlist;
  i: integer;
begin
  if assigned(MainLoader) and assigned(MainLoader.espLoader) then
  begin
    filenames := tstringlist.create;
    try
      for i := 0 to MainLoader.espLoader.mastersData.count - 2 do
        filenames.add(Game_CacheDataFolder + MainLoader.espLoader.mastersData[i]);
      startLoadsMaster(filenames);
    finally
      filenames.free;
    end;
    MainLoader.espLoader.buildInheritedData;
  end;
end;

procedure TForm1.loadAllMasters1Click(Sender: TObject);
begin
  LoadAllMasters;
end;

procedure TForm1.startLoadsMaster(filenames: tstringlist);
var
  i, Index: integer;
begin
  globalUIlockON(10, getRes('Fbk_Loadesp'));
  clearNPCUI;
  if assigned(mainDialdata) then
    freeandNil(mainDialdata);
  index := loaderList.itemIndex;
  UpdateLoaderSetting(MainLoader);
  ResetFocusedData;
  for i := 0 to pred(filenames.count) do
    if FileExists(filenames[i]) then
    begin
      CancelStuff := false;
      doloadEsp(filenames[i], false, false);
    end;
  stopStuff;
  loaderList.itemIndex := index;
  loaderList.OnChange(loaderList);
  globalUIlockOFF(10);
end;

procedure TForm1.ToolButton4MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
begin
  if Button = mbLeft then
    launchSearchTimer
  else
  begin
    if getSearchOptState(TToolButton(Sender).tag) then
      checkThisSearchOpt(TToolButton(Sender).tag)
    else
      checkAllSearchOpt(true);
  end;
end;

// -----addId to string
procedure TForm1.MenuAddFolder1Click(Sender: TObject);
var
  s: string;
begin
  s := trim(localInput(getRes('input_Newfolder'), '', ''));
  s := stringreplace(s, sBar, '', [rfReplaceAll]);
  if s <> '' then
    VocabTree.AddChild(nil, tnodedatafdr.create(tskyfolder.init(s, [fdrIsFolder], VocabTree.totalCount + 1)));
end;

procedure TForm1.MenurenameFolder1Click(Sender: TObject);
var
  Data: ptreedatafdr;
  s: string;
begin
  // -------
  if assigned(VocabTree.focusedNode) then
  begin
    Data := VocabTree.GetNodeData(VocabTree.focusedNode);
    if (fdrIsFolder in Data.BasicND.s.fparams) then
    begin
      s := trim(localInput(getRes('input_renamefolder'), '', Data.BasicND.s.name));
      if s <> '' then
      begin
        s := stringreplace(s, sBar, '', [rfReplaceAll]);
        Data.BasicND.s.name := s;
        VocabTree.Repaint;
      end
    end;
  end;
end;

procedure TForm1.AddIdToStrClick(Sender: TObject);
begin
  addIdToString;
end;

procedure TForm1.addIdToString;
var
  j, idOpt: integer;
  fProc: tcompareproc;
  a, b, c, d: boolean;
begin
  form2.close; // security
  form8 := tform8.create(self);
  form8.RadioGroup1.itemIndex := 1;

  if (currentTesvMode = sTESVEsp) or (currentTesvMode = sTESVEspStrings) then
  begin
    form8.CheckBox3.Enabled := true;
    form8.CheckBox4.Enabled := true;
    form8.CheckBox2.Enabled := true;
  end;
  if (currentTesvMode = sTESVStrings) or (currentTesvMode = sTESVEspStrings) then
    form8.CheckBox1.Enabled := true;

  form8.showmodal;
  if form8.ModalResult = mrOK then
  begin
    idOpt := form8.RadioGroup1.itemIndex;
    case idOpt of
      1: fProc := compareOptNoTransValid;
      2: fProc := compareOptSelection;
    else fProc := compareOptEverything;
    end;
    a := form8.CheckBox1.checked;
    b := form8.CheckBox3.checked;
    c := form8.CheckBox4.checked;
    d := form8.CheckBox2.checked;
    if a or b or c or d then
    begin
      startStuff('');
      for j := 0 to 2 do
      begin
        addIdToStringEx(MainLoader.listArray[j], fProc, a, b, c, d);
        setTreeSortAndSort(j, 3);
      end;
      stopStuff(false, false);
    end;
  end;
  form8.free;
end;

procedure TForm1.addIdToStringEx(dlist: tlist; fProc: tcompareproc; a, b, c, d: boolean);
var
  i: integer;
  sk1: tskystr;
  strtmp: string;
  infoRec, subgrup, masterDial: PVirtualNode;
  dialID: cardinal;
  DataEsp: pespdata;
const
  stridformat = '%s %s %s';
begin
  ProgressBar.max := dlist.count;
  // --------------------------
  pbar := 0;
  for i := 0 to dlist.count - 1 do
  begin
    updatepBar(pBarFrequencies);
    sk1 := dlist.items[i];
    if not fProc(sk1) then
      continue;
    // pexnotrans support
    if sk1.lockedStatus then
      continue;
    if sk1.isempty then
      continue;
    strtmp := '';
    masterDial := nil;
    if a then
      strtmp := strtmp + format('[%.5x]', [sk1.esp.strId, 5]);
    if b then
      strtmp := strtmp + format('[%.8x]', [sk1.esp.formID]);
    if c and (TESVTmodEspLoaded) and sk1.isEspAssigned then
      strtmp := strtmp + format('[%.4s:%.4s]', [sk1.esp.rName, sk1.esp.fName]);
    if d and (TESVTmodEspLoaded) and sk1.isEspAssigned then
    begin
      if trecord(sk1.esp.rec).Header.name = headerINFO then
      begin
        infoRec := trecord(sk1.esp.rec).espRec;
        if assigned(infoRec) then
        begin
          subgrup := infoRec.parent;
          DataEsp := espTree.GetNodeData(subgrup);
          if (DataEsp.BasicND.p.sType = sGrup) and (espTree.GetNodeLevel(subgrup) > 0) then
          begin
            dialID := cardinal(tgrup(DataEsp.BasicND.p).headerData.sIdent);
            masterDial := MainLoader.espLoader.getSubRec(dialID, headerDIAL);
          end;
          // lets assign master stuff
          if assigned(masterDial) then
          begin
            DataEsp := espTree.GetNodeData(masterDial);
            strtmp := strtmp + (format('[@%.8x]', [trecord(DataEsp.BasicND.p).headerData.formID]));
          end;
        end;
      end;
    end;
    sk1.strans := strtmp + ' ' + sk1.strans
  end;
end;

// ------exact search----------

procedure TForm1.TranslateExactMenu1Click(Sender: TObject);
var
  fProc, fProcVmad, fprocVmadTrans: tcompareproc;
begin
  if not assigned(MainLoader) then
    exit;
  if not openCompareOpt2(fProc, fProcVmad, fprocVmadTrans, 0, ' ') then
    exit;
  findStrMatch(MainLoader, true, fProc, fProcVmad, fprocVmadTrans, true);
end;

procedure TForm1.TranslationMeterAllClick(Sender: TObject);
begin
  TranslationMeterAll.checked := not TranslationMeterAll.checked;
end;

procedure TForm1.TranslationMeterShowClick(Sender: TObject);
begin
  TranslationMeterShow.checked := not TranslationMeterShow.checked;
  Panel31.visible := TranslationMeterShow.checked;
end;

procedure TForm1.QuickTransExactonSel1Click(Sender: TObject);
begin
  if not assigned(MainLoader) then
    exit;
  startStuff(getRes('Fbk_DirectTrans'));
  doFindStrMatchDirect(MainLoader);
  stopStuff(false, false);
end;

procedure TForm1.Undo1Click(Sender: TObject);
begin
  if not assigned(MainLoader) then
    exit;
  MainLoader.doUndo;
  Undo1.Enabled := MainLoader.undolist.count > 0;
  repaintTrees;
end;

procedure TForm1.UniqueAuditClick(Sender: TObject);
begin
  if assigned(MainLoader) then
    MainLoader.UniqueAudit;
end;

procedure TForm1.findStrMatch(loader: tTranslatorLoader; bSort: boolean; fProc, fProcVmad, fprocVmadTrans: tcompareproc; forceAutoTranslate: boolean = false);
begin
  startStuff(getRes('Fbk_DirectTrans'));
  doFindStrMatch(loader, bSort, fProc, fProcVmad, fprocVmadTrans, forceAutoTranslate);
  stopStuff;
end;

procedure TForm1.doFindStrMatch(loader: tTranslatorLoader; bSort: boolean; fProc, fProcVmad, fprocVmadTrans: tcompareproc; forceAutoTranslate: boolean = false);
var
  j, notTranslatedTot, totalString: integer;
  proc: tListSortCompare;
  transParams: sStrParams;
begin

  proc := compareEspStr_V4Strict;

  if TESVTSameLanguage then
    transParams := [validated]
  else
    transParams := [translated];
  // pbar
  ProgressBar.max := getTotalVocabCount(loader.listArray) * 2;
  pbar := 0;

  sortVocabEdidList(vocabEdidList, proc, true);

  for j := 0 to 2 do
  begin
    // edid+string translation
    findEdidMatchEx(vocabEdidList, loader.listArray[j], fProc, proc, false, transParams, [translated], false, false, false, false);
    // direct string translation
    findStrMatchEx(vocabBaselist, loader.listArray[j], fProc, [validated], false, forceAutoTranslate, false, true, false);
  end;
  // vmad
  if bApplyVMAD and isLoaderHasVMAD(loader) then
  begin
    sortVocabEdidList(vocabEdidList, compareEspStr_V4Strict, true);
    if assigned(fProcVmad) then
      findEdidMatchEx(vocabEdidList, loader.listArray[0], fProcVmad, compareEspStr_V4Strict, false, [validated], [translated], false, false, true, false);
    if assigned(fprocVmadTrans) then
      findStrMatchEx(vocabBaselist, loader.listArray[0], fprocVmadTrans, [validated], false, forceAutoTranslate, false, true, true);
  end;

  if bSort then
    setTreeSortAndSort(3);

  notTranslatedTot := MainLoader.getTotalVocabCountOnProc(compareOptNoTransAndPartialsExLocked);
  totalString := MainLoader.getTotalStringCount;
  dofeedback(formatres('Fbk_TransResult', [getRes('All'), notTranslatedTot, totalString, divide(notTranslatedTot, totalString) * 100]));
end;

procedure TForm1.doFindStrMatchDirect(loader: tTranslatorLoader);
var
  j: integer;
  transParams: sStrParams;
begin
  ProgressBar.max := getTotalVocabCount(loader.listArray) * 2;
  pbar := 0;

  if TESVTSameLanguage then
    transParams := [validated]
  else
    transParams := [translated];

  /// need one sorting
  sortVocabEdidList(vocabEdidList, compareEspStr_V4Strict, true);
  for j := 0 to 2 do
  begin
    findEdidMatchEx(vocabEdidList, loader.listArray[j], compareOptSelectionExFilter, compareEspStr_V4Strict, false, transParams, [translated], false, false, false, false);
    if bApplyVMAD and (j = 0) and isLoaderHasVMAD(loader) then
      findEdidMatchEx(vocabEdidList, loader.listArray[j], compareOptSelectionExFilterVMAD, compareEspStr_V4Strict, false, [validated], [translated], false, false, true, false);
  end;
end;

procedure TForm1.findHeuristicFocus;
begin
  ClearHeuristicData(true);
  if bUIStopped or (focusedNode.LDfstring = nil) then
    exit;
  bCanSave := false;
  screen.Cursor := crHourGlass;
  LDtree.beginupdate;
  try
    dofindHeuristicFocus(LDtree, Menu_RestrictRefRec.checked);
  finally
    LDtree.endupdate;
    screen.Cursor := crDefault;
    bCanSave := true;
  end;
end;

procedure TForm1.ValidTranslation1Click(Sender: TObject);
begin
  currentEditedTree.endeditnode;
  updateStringStatus(MainLoader, currentEditedTree, [validated]);

end;

procedure TForm1.ValidTranslationPartialClick(Sender: TObject);
begin
  currentEditedTree.endeditnode;
  updateStringStatus(MainLoader, currentEditedTree, [incompleteTrans]);
end;

procedure TForm1.CancelTranslation1Click(Sender: TObject);
begin
  currentEditedTree.endeditnode;
  cancelStringStatus(MainLoader, currentEditedTree);
end;

procedure TForm1.VocabTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
Var
  Dataf: ptreedatafdr;
begin
  Dataf := Sender.GetNodeData(Node);
  Dataf.BasicND.s.free;
  Dataf.BasicND.destroy;
end;

procedure TForm1.VocabTreeGetImageIndex(Sender: TBaseVirtualTree; Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: boolean; var ImageIndex: TImageIndex);
var
  Data: ptreedatafdr;
begin
  if not((Kind = ikNormal) or (Kind = ikSelected)) then
    exit;
  Data := Sender.GetNodeData(Node);
  if (Column = 1) then
    if (fdrLoaded in Data.BasicND.s.fparams) then
      ImageIndex := 0
    else if (fdrIsFolder in Data.BasicND.s.fparams) then
      ImageIndex := 21
end;

procedure TForm1.VocabTreeGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
var
  Data: ptreedatafdr;
const
  tagDefault: array [0 .. 1] of string = ('', ' (default)');
begin
  Data := Sender.GetNodeData(Node);
  if Column = 1 then
  begin
    CellText := Data.BasicND.s.name;
    if fdrLoaded in Data.BasicND.s.fparams then
      CellText := format('%s - [%d]', [CellText, Data.BasicND.s.count]);
    if fdrIsFolder in Data.BasicND.s.fparams then
      CellText := format('%s%s [%d]', [CellText, tagDefault[ord(fdrIsDefaultFolder in Data.BasicND.s.fparams)], Node.ChildCount]);
  end
  else
    CellText := '';
end;

procedure TForm1.VocabTreeInitNode(Sender: TBaseVirtualTree; ParentNode, Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
begin
  Node.CheckType := ctTriStateCheckBox;
end;

procedure TForm1.VocabTreeMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
begin
  ToolButton35.Enabled := TESVTmodLoaded and (VocabTree.SelectedCount > 0);

end;

procedure TForm1.VocabTreePaintText(Sender: TBaseVirtualTree; const TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType);
var
  Data: ptreedatafdr;
begin
  TargetCanvas.Font.Style := [];
  Data := Sender.GetNodeData(Node);
  if (ButtonedEdit2.Text <> '') then
  begin
    if (pos(ansilowercase(ButtonedEdit2.Text), Data.BasicND.s.name) > 0) then
      TargetCanvas.Font.Style := [fsBold]
  end;

  if fdrEmpty in Data.BasicND.s.fparams then
    TargetCanvas.Font.Style := TargetCanvas.Font.Style + [fsStrikeOut];

  if fdrIsFolder in Data.BasicND.s.fparams then
    TargetCanvas.Font.Style := TargetCanvas.Font.Style + [fsBold]
  else if fdrUser in Data.BasicND.s.fparams then
    TargetCanvas.Font.Style := TargetCanvas.Font.Style - [fsItalic]
  else
    TargetCanvas.Font.Style := TargetCanvas.Font.Style + [fsItalic];
end;

procedure TForm1.SkyTreeAdvancedHeaderDraw(Sender: TVTHeader; var PaintInfo: THeaderPaintInfo; const Elements: THeaderPaintElements);
begin
  TreeAdvancedHeaderDraw(Sender, PaintInfo, Elements);
end;

procedure TForm1.SkyTreeBeforeCellPaint(Sender: TBaseVirtualTree; TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; CellPaintMode: TVTCellPaintMode; CellRect: TRect;
  var ContentRect: TRect);
begin
  TreeCellPaint(Sender, TargetCanvas, Node, Column, CellPaintMode, CellRect, ContentRect, true, true);
end;

procedure TForm1.SkyTreeChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
begin
  updateStatus(formatres('lbl_Selection', [TBaseVirtualTree(Sender).SelectedCount]));
end;

procedure TForm1.SkyTreeCompareNodes(Sender: TBaseVirtualTree; Node1, Node2: PVirtualNode; Column: TColumnIndex; var Result: integer);
begin
  TreeCompareNodes(Sender, Node1, Node2, Column, TESVTmodEspLoaded or (currentTesvMode = sTESVMcM), Result);
end;

procedure TForm1.SkyTreeDblClick(Sender: TObject);
begin
  getStringText(true);
end;

procedure TForm1.SkyTreeDrawText(Sender: TBaseVirtualTree; TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; const Text: string; const CellRect: TRect; var DefaultDraw: boolean);
begin
  TreeDrawText(Sender, TargetCanvas, Node, Column, Text, CellRect, DefaultDraw);
end;

procedure TForm1.SkyTreeEndOperation(Sender: TBaseVirtualTree; OperationKind: TVTOperationKind);
var
  Data: ptreedata;
  nodecount: integer;
  Node: PVirtualNode;
begin
  if OperationKind = okSortTree then
  begin
    nodecount := 0;
    Node := Sender.GetFirst;
    while assigned(Node) do
    begin
      if not sharedIDnode(Sender, Node, true) then
      begin
        Data := Sender.GetNodeData(Node);
        // parameter
        inc(nodecount, ord(Sender.IsVisible[Node]));
        if odd(nodecount) then
          include(Data.BasicND.s.sinternalparams, altColor)
        else
          exclude(Data.BasicND.s.sinternalparams, altColor);
      end;
      Node := Sender.GetNext(Node);
    end;
  end;
end;

procedure TForm1.SkyTreeFocusChanged(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex);
var
  Data: ptreedata;
  tmptxt: string;
  r: rDialInfo;
begin
  TimerLD.Enabled := false;
  focusedNode.LDfstring := nil;
  tmptxt := '';
  ListBox1.clear;
  if assigned(Node) then
  begin
    Data := Sender.GetNodeData(GetSharedIdNode(Sender, Node));
    focusedNode.LDfstring := Data.BasicND.s;
    if assigned(focusedNode.LDfstring) then
      focusedNode.LDfstring.initstrings(false);
    if TESVTmodLoadedHeaderProc then
      getKeyWordForString(Data.BasicND.s);

    if (pagecontrol2.ActivePageIndex = PageControl_Heuristic) and authFocus then
      TimerLD.Enabled := true;
    if currentTesvMode = sTESVPex then
    begin
      if pexNoTrans in Data.BasicND.s.sinternalparams then
        ButtonedEdit3.Text := Data.BasicND.s.s
      else
        ButtonedEdit3.Text := '"' + Data.BasicND.s.s + '"';

      if (pagecontrol2.ActivePageIndex = PageControl_Pex) then
        dosearchinPexText([ssoEntireScope])
      else
        TimerSearchPex.Enabled := false;
    end;
    if (pagecontrol2.ActivePageIndex = PageControl_Fuz) then
    begin
      r := Data.BasicND.s.GetResponseInfo;
      ListBox1.items.beginupdate;
      // ctda
      CTDADecoderOutput(MainLoader.espLoader, ListBox1.items, trecord(Data.BasicND.s.esp.rec));
      // npc
      if assigned(mainDialdata) then
        mainDialdata.getNpcForDial(ListBox1.items, Data.BasicND.s.esp.formID, r.rId, false);
      // fuz
      if Data.BasicND.s.isDialog then
      begin
        tmptxt := formatres('DialInfoData2%d%s%s', [r.rId, getExpressionString(MainLoader.espLoader, r.rType), r.comment]);
        if (r.rId > 0) and (fuz.List.count > 0) then
          fuz.getFromRec(r, ListBox1.items);
      end;
      ListBox1.items.endupdate;
      finalize(r);
    end;
    if ListBox1.items.count > 0 then
      ListBox1.itemIndex := 0;
    Edit1.Text := tmptxt;
  end;
end;

procedure TForm1.SkyTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
begin
  TreeFreeNode(Sender, Node);
end;

procedure TForm1.SkyTreeGetImageIndex(Sender: TBaseVirtualTree; Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: boolean; var ImageIndex: TImageIndex);
begin
  TreeGetImageIndex(Sender, Node, Kind, Column, Ghosted, ImageIndex);
end;

procedure TForm1.SkyTreeGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
begin
  TreeGetText(Sender, Node, Column, TextType, CellText, true, true, MAXSIZESTRING_IN_TREE[ord(bVTSimpleLine)]);
end;

procedure TForm1.SkyTreeHeaderClick(Sender: TVTHeader; HitInfo: TVTHeaderHitInfo);
begin
  TreeHeaderClick(Sender, HitInfo);
end;

procedure TForm1.SkyTreeHeaderDrawQueryElements(Sender: TVTHeader; var PaintInfo: THeaderPaintInfo; var Elements: THeaderPaintElements);
begin
  Elements := [hpeBackground];
end;

procedure TForm1.SkyTreeInitNode(Sender: TBaseVirtualTree; ParentNode, Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
begin
  if not bVTSimpleLine then
    InitialStates := [ivsMultiline];
end;

procedure TForm1.SkyTreeMouseMove(Sender: TObject; Shift: TShiftState; X, Y: integer);
begin
  TreeMouseMove(TVirtualStringTree(Sender), X, Y, true);
end;

procedure TForm1.SkyTreePaintText(Sender: TBaseVirtualTree; const TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType);
begin
  TreePaintText(Sender, TargetCanvas, Node, Column, TextType);
end;

procedure TForm1.getStringTextDirect;
begin
  if assigned(MainLoader) and assigned(currentEditedTree.focusedNode) then
  begin
    currentEditedTree.ClearSelection;
    currentEditedTree.Selected[currentEditedTree.focusedNode] := true;
    currentEditedTree.EditNode(currentEditedTree.focusedNode, 2);
  end;
end;

procedure TForm1.getStringText(doValid: boolean; forcedFocus: tskystr = nil; const newstring: string = '');
begin
  if doValid and assigned(focusedNode.fstring) then
    form2.valideStringChange(false, form2.ConfirmChange.checked, true, [validated]);
  if assigned(forcedFocus) then
    focusedNode.fstring := forcedFocus
  else
    focusedNode.fstring := getFocusedString(currentEditedTree);
  if assigned(focusedNode.fstring) then
    form2.editNewString(true, newstring);
end;

procedure TForm1.HeaderProcessor1Click(Sender: TObject);
begin
  if FormKeyWord.visible then
    FormKeyWord.close
  else
  begin
    form2.close;

    if assigned(MainLoader) and TESVTmodLoadedHeaderProc then
    begin
      startStuff('');
      if not FormKeyWord.ruleListLoaded then
        FormKeyWord.LoadDefaultRules;
      MainLoader.buildEspInheritedData;
      stopStuff(false, false);
      FormKeyWord.show;
    end;
  end;
end;

procedure TForm1.headerWizard1Click(Sender: TObject);
begin
  launchHeaderWizard;
end;

procedure TForm1.HeuristicMenu1Click(Sender: TObject);
begin
  if not assigned(MainLoader) then
    exit;
  HeuristicTranslation
end;

procedure TForm1.HeuristicTranslation;
var
  j: integer;
  fProc, fProcVmad, fprocVmadTrans: tcompareproc;
begin
  if not openCompareOpt2(fProc, fProcVmad, fprocVmadTrans, 0, ' ') then
    exit;
  startStuff(getRes('Fbk_LDLaunch2'));
  generateHeuristicList;

  pbar := 0;
  ProgressBar.max := MainLoader.getTotalVocabCountOnProc(fProc);
  updatepBar(0);

  for j := 0 to 2 do
    MainLoader.findHeuristicMatch(fProc, j);
  if bApplyVMAD and isLoaderHasVMAD(MainLoader) and assigned(fProcVmad) then
    MainLoader.findHeuristicMatch(fProcVmad, 0);
  setTreeSortAndSort(3);
  stopStuff;
end;

procedure TForm1.espTreeDblClick(Sender: TObject);
var
  Data: pespdata;
  i: integer;
  r: trecord;
begin
  exit;
  // todo: need to update CurrentLoader before pulling string
  if not assigned(TBaseVirtualTree(Sender).focusedNode) then
    exit;
  Data := TBaseVirtualTree(Sender).GetNodeData(TBaseVirtualTree(Sender).focusedNode);
  if Data.BasicND.p.sType = sRecord then
  begin
    focusedNode.editedEspNode := TBaseVirtualTree(Sender).focusedNode;
    r := trecord(Data.BasicND.p);
    for i := 0 to r.fList.count - 1 do
      if isString in tfield(r.fList[i]).params then
      begin
        getStringText(true, tfield(r.fList[i]).sk);
        exit;
      end;
  end;
end;

procedure TForm1.espTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
var
  Data: pespdata;
begin
  Data := Sender.GetNodeData(Node);
  case Data.BasicND.p.sType of
    sRecord: trecord(Data.BasicND.p).free;
    sGrup: tgrup(Data.BasicND.p).free;
    sMaster: tmaster(Data.BasicND.p).free;
  end;
  Data.BasicND.free;
end;

procedure TForm1.espTreeGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
var
  Data: pespdata;
begin
  Data := Sender.GetNodeData(Node);
  case Data.BasicND.p.sType of
    sRecord: CellText := trecord(Data.BasicND.p).getStringName;
    sGrup: CellText := tgrup(Data.BasicND.p).getname;
    sMaster: CellText := tmaster(Data.BasicND.p).EspName;
  end;
end;

procedure TForm1.espTreePaintText(Sender: TBaseVirtualTree; const TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType);
var
  Data: pespdata;
begin
  Data := TBaseVirtualTree(Sender).GetNodeData(Node);

  case Data.BasicND.p.sType of
    sRecord:
      if trecord(Data.BasicND.p).rawRecord = true then
      begin
        TargetCanvas.Font.Style := [fsItalic];
        TargetCanvas.Font.Color := clSilver;
      end;
    sGrup:
      if tgrup(Data.BasicND.p).grupString = false then
      begin
        TargetCanvas.Font.Style := [fsItalic];
        TargetCanvas.Font.Color := clSilver;
      end;
    sMaster: TargetCanvas.Font.Style := [fsBold];
  end;

end;

function getSkID(sk: tskystr): integer;
begin
  if TESVTmodEspLoaded then
    Result := sk.esp.formID
  else if currentTesvMode = sTESVStrings then
    Result := sk.esp.strId
  else if currentTesvMode = sTESVPex then
    Result := sk.esp.strId
  else
    Result := -1;
end;

function getSkIDName(sk: tskystr): string;
begin
  if TESVTmodEspLoaded then
    Result := sk.getEdidNameexport(true)
  else if currentTesvMode = sTESVMcM then
    Result := GetMCMIdCount(MainLoader, sk.esp.strId)
  else
    Result := '';
end;

function TForm1.SearchInKeyWord(pattern: string; sk: tskystr; var r: TPerlRegEx; var backref: string; bfRegexDiscard: boolean): boolean;
var
  aKwd: aCardinal;
  i: integer;
  kwdString: string;
begin
  Result := false;
  // keywords
  if assigned(MainLoader) and assigned(MainLoader.espLoader) then
  begin
    aKwd := MainLoader.espLoader.getKwd(sk.esp.rec, sk.esp.field);
    for i := 1 to length(aKwd) do
      if aKwd[i - 1] <> 0 then
      begin
        kwdString := MainLoader.espLoader.findKeyWord(aKwd[i - 1], nil);
        if SearchInString(pattern, kwdString, r, backref, bfRegexDiscard) then
          exit(true);
      end;
  end;
end;

function TForm1.SearchInString(pattern, s: string; var r: TPerlRegEx; var backref: string; bfRegexDiscard: boolean): boolean;
var
  i: integer;
begin
  backref := '';
  if not assigned(r) then
    exit(pos(pattern, ansilowercase(s)) > 0);
  if bfRegexDiscard then
    exit(false);
  try
    r.Subject := s;
    Result := r.match;
    if Result and (r.GroupCount >= 1) then
    begin
      for i := 1 to r.GroupCount do
        backref := backref + (r.Groups[i]);
    end;
  except
    on E: Exception do
      Result := false;
  end;
end;

procedure transposesHeader(start: integer; s: string; var h: sHeaderSig);
var
  i: integer;
begin
  for i := start to (start + 3) do
  begin
    if i > length(s) then
      break;
    if charInSet(s[i], sHEADERCHAR) then
      h[i - start] := ansiChar(s[i]);
  end;
end;

procedure SearchInHeader(s: string; var outR, outF, outF2: sHeaderSig);
begin
  outR := ALL_REC;
  outF := ALL_REC;
  outF2 := ALL_REC;
  s := ansiUppercase(s);
  transposesHeader(1, s, outR);
  transposesHeader(6, s, outF);
  if length(s) = 4 then
    outF2 := outR;
end;

function TForm1.PrepareSearchRegex(var r: TPerlRegEx; s: string; opts: TPerlRegExOptions): boolean;
begin
  Result := false;
  r := TPerlRegEx.create;
  // add casesensitiveopt:
  if (length(s) > 1) and (pos('\i', s) = length(s) - 1) then
  begin
    opts := opts + [preCaseLess];
    s := copy(s, 1, length(s) - 2);
  end;
  // -----------------
  r.Options := opts;
  try
    r.regEx := s;
    r.study;
  except
    Result := true;
  end;
end;

function TForm1.prepareWarningSet: sStrInternalParams;
var
  i: integer;
begin
  Result := [];
  for i := 0 to PopupWarning.items.count - 1 do
  begin
    if TMenuItem(PopupWarning.items[i]).checked then
      case TMenuItem(PopupWarning.items[i]).tag of
        1: include(Result, fuzWarning);
        2: include(Result, npcWarning);
        3: include(Result, lowWarning);
        4: include(Result, Warning);
        5: include(Result, bigWarning);
        6: include(Result, isOrphean);
        7: include(Result, toLocalizedSharedID);
        8: include(Result, aliasError);
        9: include(Result, stringSizeError);
        10: include(Result, stringCRError);
        11: include(Result, unusedInSST);
      end;
  end;
end;

procedure TForm1.prepareWarningRegex(parent: TForm; ts: string; bDiscard: boolean);
var
  c: TComponent;
begin
  c := parent.FindComponent(ts);
  if assigned(c) and (c is TButtonedEdit) then
  begin
    if bDiscard then
      TButtonedEdit(c).Color := gradient(tcolor($AAAAFF))
    else
      TButtonedEdit(c).Color := gradient(clWhite);
  end;
end;

procedure TForm1.searchIntree;
var
  Node: PVirtualNode;
  Data: ptreedata;
  i, sCount: integer;
  tmpVisible: boolean;
  nodecount: integer;
  tmpFormID: integer;
  BaseLabel: string;
  rSearch, fSearch, fSearch2: sHeaderSig;
  bColabAdd, bColabSub: boolean;
  dialNpc: integer;
  iCompareMatch: integer;
  SimpleSearch: boolean;
  warningset: sStrInternalParams;
  s: array [1 .. 6] of string;
  sBack: array [1 .. 4] of string;
  r: array [1 .. 4] of TPerlRegEx;
  rInfo: rDialInfo;
  bfRegexDiscard: array [1 .. 4] of boolean;
const
  iRegexAdvButtonId: array [1 .. 4] of integer = (1, 2, 3, 6);
  // name of tbuttonededit in advsearchform
begin
  TimerSearch.Enabled := false;
  iCompareMatch := 0;
  fillchar(bfRegexDiscard, SizeOf(bfRegexDiscard), 0);
  for i := 1 to 4 do
    r[i] := nil;
  for i := 1 to 6 do
    s[i] := '';
  SimpleSearch := not AdvSearchForm.visible;

  warningset := prepareWarningSet;
  // ======SIMPLE SEARCH====================
  if SimpleSearch then
  begin
    s[1] := ButtonedEdit1.Text;
    SearchInHeader(s[1], rSearch, fSearch, fSearch2);
    if (s[1] <> '') and (searchInMode <> 3) and bUseReGexSearch then
      bfRegexDiscard[1] := PrepareSearchRegex(r[1], s[1], [preNoAutoCapture, preSingleLine, preCaseLess]) //
    else
      r[1] := nil;
    prepareWarningRegex(Form1, 'ButtonedEdit1', bUseReGexSearch and bfRegexDiscard[1]);

    s[1] := ansilowercase(s[1]);
    tmpFormID := strtointdef('$' + s[1], -1);
  end
  else
  // ======ADVANCED SEARCH====================
  begin
    for i := 0 to AdvSearchForm.PopupMenu1.items.count - 1 do
    begin
      if AdvSearchForm.PopupMenu1.items[i].checked then
        iCompareMatch := i;
    end;

    s[1] := AdvSearchForm.ButtonedEdit1.Text;
    s[2] := AdvSearchForm.ButtonedEdit2.Text;
    s[3] := AdvSearchForm.ButtonedEdit3.Text;
    s[4] := AdvSearchForm.ButtonedEdit6.Text; // keyword
    s[5] := AdvSearchForm.ButtonedEdit4.Text; // REC
    s[6] := AdvSearchForm.ButtonedEdit5.Text; // FIELD

    for i := 1 to 4 do
    begin
      if (s[i] <> '') and sSearchUseRegex[i] then
        bfRegexDiscard[i] := PrepareSearchRegex(r[i], s[i], [preSingleLine])
        // preNoAutoCapture,
      else
        s[i] := ansilowercase(s[i]);
      prepareWarningRegex(AdvSearchForm, 'ButtonedEdit' + IntToStr(iRegexAdvButtonId[i]), sSearchUseRegex[i] and bfRegexDiscard[i]);
    end;
    tmpFormID := strtointdef('$' + s[3], -1);
    transposesHeader(1, ansiUppercase(s[5]), rSearch);
    // REC
    transposesHeader(1, ansiUppercase(s[6]), fSearch); // FIELD
  end;

  // ========================================
  if (s[4] <> '') and assigned(MainLoader) and assigned(MainLoader.espLoader) then
    MainLoader.espLoader.buildInheritedData(false);
  // ========================================
  if assigned(mainDialdata) and (ListBox4.itemIndex > -1) then
    dialNpc := mainDialdata.getNPCIdByName(ListBox4.items[ListBox4.itemIndex])
  else
    dialNpc := -1;

  sCount := 0;

  if colabIdFilterAdd = [] then
    colabIdFilterAdd := [0];
  if colabIdFilterSub = [] then
    colabIdFilterSub := [0];
  bColabAdd := ToolButton2.down and (colabIdFilterAdd <> [0]);
  bColabSub := ToolButton2.down and (colabIdFilterSub <> [0]);

  i := mainPageControl.ActivePageIndex;
  while sCount < 3 do
  begin
    nodecount := 0;
    globalBeginUpdate(treearray[i]);
    Node := treearray[i].GetFirst;
    while assigned(Node) do
    begin
      // reset (TEST)
      treearray[i].IsVisible[Node] := true;
      Data := treearray[i].GetNodeData(Node);

      // filteredRecord:
      if assigned(MainLoader) and (MainLoader.FilteredRecord > 0) then
        tmpVisible := Data.BasicND.s.esp.formID = MainLoader.FilteredRecord
      else
        tmpVisible := true;
      // VMAD Invisible
      if Data.BasicND.s.isLockedVmad then
        tmpVisible := tmpVisible and isLoaderUseVMAD(MainLoader);
      // Colab
      if bColabAdd then
        tmpVisible := tmpVisible and (Data.BasicND.s.colabID in colabIdFilterAdd);
      if bColabSub then
        tmpVisible := tmpVisible and not(Data.BasicND.s.colabID in colabIdFilterSub);
      // filters
      if tmpVisible then
      begin
        // parameter
        tmpVisible := ToolButton4.down and (translated in Data.BasicND.s.sparams);
        tmpVisible := tmpVisible or (ToolButton7.down and (validated in Data.BasicND.s.sparams));
        tmpVisible := tmpVisible or (ToolButton6.down and (incompleteTrans in Data.BasicND.s.sparams));
        tmpVisible := tmpVisible or (ToolButton8.down and (Data.BasicND.s.LDfound > 0));
        tmpVisible := tmpVisible or (ToolButton9.down and (lockedTrans in Data.BasicND.s.sparams));
        tmpVisible := tmpVisible or (ToolButton15.down and ((nTrans in Data.BasicND.s.sinternalparams)));
        tmpVisible := tmpVisible or (ToolButton5.down and (Data.BasicND.s.sparams * [translated .. validated] = []) and (Data.BasicND.s.LDResult = 99));
      end;
      // handle Nullstring
      if Data.BasicND.s.isempty then
        tmpVisible := ToolButton27.down;
      // Vmad
      if ToolButton57.down then
        tmpVisible := isVMADString in Data.BasicND.s.sinternalparams;
      // spellcheck
      if tmpVisible and ToolButton42.down then
        tmpVisible := (Data.BasicND.s.sinternalparams * [asSpellCheckFault] <> []);
      // warning
      if tmpVisible and ToolButton12.down then
        tmpVisible := Data.BasicND.s.sinternalparams * warningset <> [];

      // voice filter
      if tmpVisible and ToolButton26.down then
      begin
        if (Data.BasicND.s.esp.rName = headerINFO) and (Data.BasicND.s.esp.fName = headerNAM1) then
        begin
          if (ListBox3.itemIndex >= 0) and (fuz.List.count > 0) then
          begin
            rInfo := Data.BasicND.s.GetResponseInfo;
            tmpVisible := (rInfo.rId > 0) and fuz.getVoiceFromRec(rInfo, integer(ListBox3.items.Objects[ListBox3.itemIndex]));
            finalize(rInfo);
          end
          else
            tmpVisible := false;
        end
        else
          tmpVisible := false;
      end;
      // dialData filter
      if tmpVisible and ToolButton48.down then
      begin
        if (Data.BasicND.s.esp.rName = headerINFO) and (Data.BasicND.s.esp.fName = headerNAM1) and (dialNpc > -1) then
        begin
          rInfo := Data.BasicND.s.GetResponseInfo;
          tmpVisible := (rInfo.rId > 0) and mainDialdata.isDialFromActor(dialNpc, rInfo);
          finalize(rInfo);
        end
        else
          tmpVisible := false;
      end;

      if tmpVisible then
      begin
        // ======SIMPLE SEARCH===============
        if SimpleSearch then
        begin
          // HeaderSearch
          if (searchInMode = 3) then
          begin
            if not((rSearch = ALL_REC) and (fSearch = ALL_REC)) then
            begin
              if (rSearch = ALL_REC) then
                tmpVisible := tmpVisible and (Data.BasicND.s.getFieldSig = fSearch)
              else if (fSearch = ALL_REC) then
              begin
                if fSearch2 <> ALL_REC then
                  tmpVisible := tmpVisible and ((Data.BasicND.s.getRecSig = rSearch) or (Data.BasicND.s.getFieldSig = fSearch2))
                else
                  tmpVisible := tmpVisible and (Data.BasicND.s.getRecSig = rSearch)
              end
              else
                tmpVisible := tmpVisible and (Data.BasicND.s.getRecSig = rSearch) and (Data.BasicND.s.getFieldSig = fSearch);
            end;
          end
          else
          // TextSearch
          begin
            if (s[1] <> '') then
            begin
              case searchInMode of
                0: tmpVisible := tmpVisible and SearchInString(s[1], Data.BasicND.s.s, r[1], sBack[1], bfRegexDiscard[1]);
                1: tmpVisible := tmpVisible and SearchInString(s[1], Data.BasicND.s.strans, r[1], sBack[1], bfRegexDiscard[1]);
                2: tmpVisible := tmpVisible and (((tmpFormID >= 0) and (tmpFormID = getSkID(Data.BasicND.s))) or SearchInString(s[1], getSkIDName(Data.BasicND.s), r[1], sBack[1], bfRegexDiscard[1]));
              end;
            end;
          end;
        end
        else
        // ========ADVANCED SEARCH==============
        begin
          if s[1] <> '' then
            tmpVisible := SearchInString(s[1], Data.BasicND.s.s, r[1], sBack[1], bfRegexDiscard[1]);
          if tmpVisible then
            if s[2] <> '' then
              tmpVisible := SearchInString(s[2], Data.BasicND.s.strans, r[2], sBack[2], bfRegexDiscard[2]);

          // search compare match
          if tmpVisible and (iCompareMatch > 0) and (sBack[1] <> '') and (sBack[2] <> '') then
          begin
            if iCompareMatch = 1 then
              tmpVisible := sBack[1] = sBack[2]
            else
              tmpVisible := sBack[1] <> sBack[2]
          end;

          if tmpVisible then
            if s[3] <> '' then
              tmpVisible := (((tmpFormID >= 0) and (tmpFormID = getSkID(Data.BasicND.s))) or SearchInString(s[3], getSkIDName(Data.BasicND.s), r[3], sBack[3], bfRegexDiscard[3]));
          if tmpVisible then
            if s[5] <> '' then
              tmpVisible := (Data.BasicND.s.getRecSig = rSearch);
          if tmpVisible then
            if s[6] <> '' then
              tmpVisible := (Data.BasicND.s.getFieldSig = fSearch);
          if tmpVisible then
            if s[4] <> '' then
              tmpVisible := SearchInKeyWord(s[4], Data.BasicND.s, r[4], sBack[4], bfRegexDiscard[4]);

        end;
      end;
      // assignation
      treearray[i].IsVisible[Node] := tmpVisible;
      inc(nodecount, ord(tmpVisible));
      if odd(nodecount) then
        include(Data.BasicND.s.sinternalparams, altColor)
      else
        exclude(Data.BasicND.s.sinternalparams, altColor);
      // endLoop
      Node := treearray[i].GetNextSibling(Node);
    end;
    globalEndUpdate(treearray[i]);

    BaseLabel := strListLabel[i];
    pageCaptionLabel[i] := format('%s [%d/%d]', [BaseLabel, nodecount, GetListArrayCount(MainLoader, i)]);

    // handle the loop (always start with the active tab)
    inc(sCount);
    inc(i);
    if i = 3 then
      i := 0;
    Application.ProcessMessages;
  end;

  if not assigned(currentEditedTree.focusedNode) then
    ListBox1.clear
  else if not(currentEditedTree.IsVisible[currentEditedTree.focusedNode]) then
    ListBox1.clear;

  updatePageControlCaption;
  for i := 1 to 3 do
    if assigned(r[i]) then
      freeandNil(r[i]);
end;

procedure TForm1.updatePageControlCaption;
var
  i, w, wMax: integer;
begin
  wMax := 0;
  for i := 0 to 2 do
  begin
    w := mainPageControl.canvas.TextWidth(pageCaptionLabel[i]);
    wMax := max(w, wMax);
  end;
  for i := 0 to 2 do
    mainPageControl.Pages[i].caption := pageCaptionLabel[i];
end;

procedure TForm1.setTESVMode(setSearch: boolean);
var
  i, tagSize: integer;
  bMultiTree: boolean;
begin
  caption := getCaptionLabel;

  testCanvas.Font.size := virtualTreeFontsize[0];
  testCanvas.Font.name := virtualTreeFont;
  GlobalFontHeight := testCanvas.TextHeight('hy') + 1;
  testCanvas.Font.name := virtualTreeFixedFont;
  tagSize := testCanvas.TextWidth('00') + 40;

  bMultiTree := not isLoaderOneList(MainLoader);

  mainPageControl.ActivePageIndex := 0;
  clearTreesSelection;

  for i := 0 to pred(VTtreeList_Tag.count) do
    TVirtualStringTree(VTtreeList_Tag[i]).Header.Columns[5].Width := tagSize;

  for i := 0 to 2 do
  begin
    case currentTesvMode of
      sTESVTsstCustom:
        begin
          treearray[i].Header.Columns[0].Options := treearray[i].Header.Columns[0].Options - [coVisible];
          treearray[i].Header.Columns[3].Options := treearray[i].Header.Columns[3].Options + [coVisible];
          treearray[i].Header.Columns[4].Options := treearray[i].Header.Columns[4].Options - [coVisible];
          treearray[i].Header.MainColumn := 1;
          TabSheet3.TabVisible := bMultiTree;
          TabSheet4.TabVisible := bMultiTree;
          form2.ToolButton10.down := bDefaultTrimState;
          form2.ToolButton10.Enabled := true;
        end;
      sTESVTsstEdit:
        begin
          treearray[i].Header.Columns[0].Options := treearray[i].Header.Columns[0].Options + [coVisible];
          treearray[i].Header.Columns[3].Options := treearray[i].Header.Columns[3].Options + [coVisible];
          treearray[i].Header.Columns[4].Options := treearray[i].Header.Columns[4].Options + [coVisible];
          treearray[i].Header.MainColumn := 1;
          TabSheet3.TabVisible := bMultiTree;
          TabSheet4.TabVisible := bMultiTree;
          form2.ToolButton10.down := bDefaultTrimState;
          form2.ToolButton10.Enabled := true;
        end;
      sTESVStrings:
        begin
          treearray[i].Header.Columns[0].Options := treearray[i].Header.Columns[0].Options + [coVisible];
          treearray[i].Header.Columns[3].Options := treearray[i].Header.Columns[3].Options + [coVisible];
          treearray[i].Header.Columns[4].Options := treearray[i].Header.Columns[4].Options - [coVisible];
          treearray[i].Header.MainColumn := 1;
          treearray[i].Header.Columns[0].Width := testCanvas.TextWidth('00000') + 20;
          TabSheet3.TabVisible := bMultiTree;
          TabSheet4.TabVisible := bMultiTree;
          form2.ToolButton10.down := bDefaultTrimState;
          form2.ToolButton10.Enabled := true;
        end;
      sTESVEsp, sTESVEspStrings:
        begin
          treearray[i].Header.Columns[0].Options := treearray[i].Header.Columns[0].Options + [coVisible];
          treearray[i].Header.Columns[3].Options := treearray[i].Header.Columns[3].Options + [coVisible];
          treearray[i].Header.Columns[4].Options := treearray[i].Header.Columns[4].Options + [coVisible];
          treearray[i].Header.MainColumn := 4;
          treearray[i].Header.Columns[0].Width := testCanvas.TextWidth('XXXX XXXX') + 20;
          if assigned(form2) then
            form2.DialogTree.Header.Columns[0].Width := treearray[i].Header.Columns[0].Width;
          TabSheet3.TabVisible := bMultiTree;
          TabSheet4.TabVisible := bMultiTree;
          form2.ToolButton10.down := bDefaultTrimState;
          form2.ToolButton10.Enabled := true;
        end;
      sTESVMcM:
        begin
          treearray[i].Header.Columns[0].Options := treearray[i].Header.Columns[0].Options + [coVisible];
          treearray[i].Header.Columns[3].Options := treearray[i].Header.Columns[3].Options + [coVisible];
          treearray[i].Header.Columns[4].Options := treearray[i].Header.Columns[4].Options - [coVisible];
          treearray[i].Header.MainColumn := 1;
          treearray[i].Header.Columns[0].Width := 200;
          TabSheet3.TabVisible := false;
          TabSheet4.TabVisible := false;
          form2.ToolButton10.down := bDefaultTrimState;
          form2.ToolButton10.Enabled := true;
        end;
      sTESVPex:
        begin
          treearray[i].Header.Columns[0].Options := treearray[i].Header.Columns[0].Options + [coVisible];
          treearray[i].Header.Columns[3].Options := treearray[i].Header.Columns[3].Options + [coVisible];
          treearray[i].Header.Columns[4].Options := treearray[i].Header.Columns[4].Options - [coVisible];
          treearray[i].Header.MainColumn := 1;
          treearray[i].Header.Columns[0].Width := 200;
          TabSheet3.TabVisible := false;
          TabSheet4.TabVisible := false;
          form2.ToolButton10.down := false;
          form2.ToolButton10.Enabled := false;
        end;
    end;
    treearray[i].Header.Columns[4].Width := edidColumnSize;
  end;

  if setSearch then
  begin
    form2.TabSheet4.TabVisible := TESVTmodEspLoaded;
    form2.TabSheet5.TabVisible := TESVTmodEspLoaded;
    form2.TabSheet6.TabVisible := TESVTmodEspLoaded;
    form2.DialogTree.Header.Columns[4].Width := edidColumnSize;
    form2.PageControl1.ActivePageIndex := ord(not(TESVTmodEspLoaded));
  end;
end;

procedure TForm1.recentMenuUpdate(filename: string; bsaType: integer);
var
  i: integer;
  tmp: string;
begin
  case bsaType of
    1: tmp := '[TXT] ';
    2: tmp := '[PEX] ';
    3: tmp := '[STR] ';
    4: tmp := '[ESP] ';
    5: tmp := '[BSA] ';
  else tmp := ''
  end;
  for i := recentAddon.count - 1 downto 0 do
    if ansilowercase(recentAddon.strings[i]) = ansilowercase(tmp + filename) then
      recentAddon.delete(i);
  recentAddon.Insert(0, tmp + filename);
  buildRecentmenu;
end;

procedure TForm1.recentMenuUpdateCleanNotFound(filename: string);
var
  i: integer;
begin
  for i := recentAddon.count - 1 downto 0 do
    if ansilowercase(recentAddon.strings[i]) = ansilowercase(filename) then
      recentAddon.delete(i);
  buildRecentmenu;
end;

procedure TForm1.recentRegEx(s: string; t: tstringlist);
var
  i: integer;
begin
  for i := t.count - 1 downto 0 do
    if t[i] = s then
      t.delete(i);
  t.Insert(0, s);
end;

procedure TForm1.RegexTranslation1Click(Sender: TObject);
  procedure fillCombo(c: TComboBox; t: tstringlist);
  var
    i: integer;
  begin
    for i := 0 to t.count - 1 do
      c.items.add(t[i]);
  end;

begin
  form2.close; // security
  form13 := tform13.create(self);
  form13.ComboBox1.Text := RegexData.s1; // '(.*)->(.*)';
  form13.ComboBox2.Text := RegexData.s2; // '%1->%2';
  fillCombo(form13.ComboBox1, lRegEx_RegEx);
  fillCombo(form13.ComboBox2, lRegEx_Replace);

  form13.RadioGroup1.itemIndex := RegexData.mode1;
  form13.RadioGroup2.itemIndex := RegexData.mode2;
  form13.UpDown1.Position := RegexData.LDLevel - 1;
  form13.CheckBox1.checked := RegexData.noAlias;
  form13.CheckBox3.checked := RegexData.invalidate;
  form13.CheckBox4.checked := RegexData.bILocked;
  form13.skSource := getFocusedString(currentEditedTree);
  form13.CheckBox2.checked := not RegexData.caseInsensitive;

  // pos
  form13.Width := regexwWidth;
  form13.Height := regexwHeight;
  form13.top := regexwtop;
  form13.left := regexwleft;

  form13.showmodal;

  if form13.ModalResult = mrOK then
  begin
    RegexData.s1 := form13.ComboBox1.Text;
    RegexData.s2 := form13.ComboBox2.Text;
    recentRegEx(RegexData.s1, lRegEx_RegEx);
    recentRegEx(RegexData.s2, lRegEx_Replace);
    RegexData.noAlias := form13.CheckBox1.checked;
    RegexData.bILocked := form13.CheckBox4.checked;
    RegexData.LDLevel := form13.UpDown1.Position + 1;
    RegexData.mode1 := form13.RadioGroup1.itemIndex;
    RegexData.mode2 := form13.RadioGroup2.itemIndex;
    RegexData.caseInsensitive := not form13.CheckBox2.checked;
    RegexData.allList := false;
    RegexData.invalidate := form13.CheckBox3.checked;
    RegexTranslate(RegexData);
  end;
  regexwWidth := form13.Width;
  regexwHeight := form13.Height;
  regexwtop := form13.top;
  regexwleft := form13.left;
  form13.free;
end;

procedure TForm1.RegexTranslate(rData: rRegexData);
var
  i, j, l, a, b, t: integer;
  sk: tskystr;
  r: TPerlRegEx;
  strans, sTransOut: string;
  fProc: tcompareproc;
begin
  if not assigned(MainLoader) then
    exit;

  GetTreeRange(MainLoader, a, b, rData.allList);
  startStuff(getRes('Fbk_RegexTrans'));
  ProgressBar.max := MainLoader.listArray[a].count;
  pbar := 0;

  r := TPerlRegEx.create;
  r.Options := [preMultiLine, preSingleLine];
  if rData.caseInsensitive then
    r.Options := r.Options + [preCaseLess];

  fProc := getfProcCompareOpt(rData.bILocked, rData.mode1);

  try
    try
      r.regEx := rData.s1;
      r.Compile;
      for j := a to b do
      begin
        for i := 0 to MainLoader.listArray[j].count - 1 do
        begin
          updatepBar(pBarFrequencies);
          sk := MainLoader.listArray[j][i];
          if sk.lockedStatus then
            continue;

          if rData.noAlias and (bHasAliasStrict in sk.sinternalparams) then
            continue;

          if not fProc(sk) then
            continue;

          if rData.mode2 in [0, 2] then
            r.Subject := sk.s
          else
            r.Subject := sk.strans;

          if r.match then
          begin
            MainLoader.addUndo(sk, timedebut, false);
            sk.resetStatus([incompleteTrans]);
            sTransOut := rData.s2;
            for l := r.GroupCount downto 1 do
            begin
              t := 0;
              if (rData.mode2 = 1) then
                strans := r.Groups[l]
              else
              begin
                if pos('#' + IntToStr(l), sTransOut) > 0 then
                  strans := r.Groups[l]
                else if pos('%' + IntToStr(l), sTransOut) > 0 then
                  t := findregexTrans(rData, false, j, r.Groups[l], strans)
                else if pos('$' + IntToStr(l), sTransOut) > 0 then
                  t := findregexTrans(rData, true, j, r.Groups[l], strans);
              end;

              case t of
                1: include(sk.sinternalparams, nTrans);
                2: include(sk.sinternalparams, Warning);
                3: include(sk.sinternalparams, bigWarning);
              end;

              sTransOut := stringreplace(sTransOut, '%' + IntToStr(l), strans, [rfReplaceAll]);
              sTransOut := stringreplace(sTransOut, '$' + IntToStr(l), strans, [rfReplaceAll]);
              sTransOut := stringreplace(sTransOut, '#' + IntToStr(l), strans, [rfReplaceAll]);
              if (rData.mode2 = 2) then
                sTransOut := stringreplace(sTransOut, '%d', sk.strans, [rfReplaceAll]);
              sTransOut := stringreplace(sTransOut, '\n', sstLineBreak, [rfReplaceAll]); // 1.4.10 linebreaksupport
            end;

            if sk.sinternalparams * [Warning, bigWarning, nTrans] = [] then
            begin
              sk.strans := sTransOut;
              sk.resetStatus([validated]);
              setuserCacheUpdated(MainLoader, cacheLoaded);
            end
            else
            begin
              if rData.invalidate and (bigWarning in sk.sinternalparams) then
                sk.resetTrans
              else
              begin
                sk.strans := sTransOut;
                setuserCacheUpdated(MainLoader, cacheLoaded);
              end;
            end;
          end;

        end;
      end;
    except
    end;
  finally
    r.free;
    stopStuff;
  end;
end;

function TForm1.findregexTrans(rData: rRegexData; bLd: boolean; l: integer; s: string; var strans: string): integer;
var
  sk2: tskystr;
  i, j: integer;
  value: integer;
  limitLD: single;
  bBreak: boolean;
begin
  Result := 3;
  strans := s;
  if TryStrToInt(s, value) then
    exit(0);
  // if this is a number then exit directly

  dummySk.s := s;
  if FastListSearch(vocabBaselist, compareHashAndSource, dummySk, j, true) then
  begin
    sk2 := vocabBaselist[j];
    strans := sk2.strans;
    if nTrans in sk2.sinternalparams then
      exit(1)
    else
      exit(0);
  end;

  if (Result = 3) and (bLd) then
  begin
    generateHeuristicList;
    // 0 words:
    if dummySk.aWords.count > 0 then
      if FastListSearch(HeuristicList, compareLowerWordCount, dummySk, i, true) then
        for j := i to HeuristicList.count - 1 do
        begin
          sk2 := HeuristicList.items[j];
          if getWordsMatchHash(dummySk, sk2, limitLD, bBreak) then
          begin
            if limitLD < rData.LDLevel then
            begin
              strans := sk2.strans;
              Result := 2;
              if floor(limitLD) = 0 then
                exit;
            end;
            if bBreak then
              break;
          end;
        end;
  end;
end;

procedure TForm1.spCheckOpt1Click(Sender: TObject);
begin
  startStuff('');
  if assigned(form2) then
    form2.ToolButton12Click(nil);
  stopStuff(false, false);
end;

procedure TForm1.sstExport1Click(Sender: TObject);
var
  filename: string;
  tmpAddon: string;
  fProc: tcompareproc;
  recs1, recs2, recs3: string;
  bColabSplit, b: boolean;
  i: integer;
begin
  if not assigned(MainLoader) then
    exit;

  tmpAddon := MainLoader.getCleanAddonName(false);
  bColabSplit := false;

  form2.close; // security
  formXMLOpt := tformXMLOpt.create(self);
  formXMLOpt.RadioGroup1.itemIndex := iXMLExportOpt;
  formXMLOpt.caption := getRes('SSTexportoptions');
  formXMLOpt.CheckBox1.visible := MainLoader.isColab;
  formXMLOpt.CheckBox2.visible := false;
  formXMLOpt.showmodal;
  fProc := nil;
  if formXMLOpt.ModalResult = mrOK then
  begin
    iXMLExportOpt := formXMLOpt.RadioGroup1.itemIndex;
    bColabSplit := formXMLOpt.CheckBox1.checked;
    case iXMLExportOpt of
      1: fProc := compareOptTranslatedAndValidated;
      2: fProc := compareOptSelection;
      3: fProc := compareSourceDestDiffandColab;
    else fProc := compareOptEverything;
    end;

  end;
  formXMLOpt.free;

  if not assigned(fProc) then
    exit;

  filename := SaveFileDialog(getRes('ExportCurrentSST'), Game_SSTFolder, getSSTFileName(tmpAddon, 'sst'), getRes('FilterSST|*.SST'));
  if (filename = '') then
    exit;

  Game_SSTFolder := ExtractFilePath(filename);
  getLangSST(removefileext(filename), recs1, recs2, recs3);

  startStuff(formatres('ExportSST', [tmpAddon]));
  MainLoader.prepareColabExport;
  if bColabSplit then
  begin
    for i := 1 to MAXCOLAB_ID do
    begin
      filename := getSSTFileName(format('%s_%.2x', [recs3, i]), 'sst');
      b := SaveSSTFile(filename, MainLoader.listArray, fProc, i, nil, MainLoader.lColabLabel, MainLoader.getmasterList);
    end;
  end
  else
  begin
    filename := getSSTFileName(recs3, 'sst');
    b := SaveSSTFile(filename, MainLoader.listArray, fProc, 0, nil, MainLoader.lColabLabel, MainLoader.getmasterList);
  end;
  stopStuff;
  if b then
    dofeedback(formatres('Fbk_Saved', [tmpAddon]), true, [askPanel])
  else
    dofeedback(formatres('Fbk_SavedError', [tmpAddon]), TESVTmodLoaded);
end;

// -----------LOAD ESP------------------------------

procedure TForm1.LoadEsp1Click(Sender: TObject);
var
  filenames: tstringlist;
begin
  filenames := tstringlist.create;
  try
    if OpenFileDialogMulti('', Game_EspFolder, '', espFilter, filenames) then
      startLoadsMultiEsp(filenames, true);
  finally
    filenames.free;
  end;
end;

procedure TForm1.startLoadsMultiEsp(filenames: tstringlist; savefolder: boolean);
var
  i: integer;
  Index: integer;
begin
  index := -1;
  globalUIlockON(10, getRes('Fbk_Loadesp'));
  UpdateLoaderSetting(MainLoader);
  ResetFocusedData;
  for i := 0 to pred(filenames.count) do
    if FileExists(filenames[i]) then
      index := doloadEsp(filenames[i], true, true);
  stopStuff;

  if (filenames.count > 1) or (index = -1) then
    index := loaderList.items.count - 1;
  loaderList.itemIndex := index;
  loaderList.OnChange(loaderList);
  bAutocloseWithWizard := false;
  globalUIlockOFF(10);
end;

function TForm1.getQuickLoadCP(filename: string): string;
var
  codepage: rcodepage;
  defaultCp: string;
begin
  form2.close; // security
  codepage := getcodepage('_' + Sourcelanguage, codepageFiles, '', '');
  defaultCp := ansilowercase(codepage.s);
  form15 := tform15.create(self);
  form15.caption := extractFileName(filename);
  // select cp
  SelectCodepage(form15.ComboBox1, defaultCp);
  form15.showmodal;
  if form15.ModalResult = mrOK then
    Result := form15.ComboBox1.items[form15.ComboBox1.itemIndex];
  form15.free;
end;

procedure TForm1.loadSingleEsp(filename: string; savefolder, saveRecent: boolean);
var
  Index: integer;
begin
  globalUIlockON(10, getRes('Fbk_Loadesp'));
  UpdateLoaderSetting(MainLoader);
  ResetFocusedData;
  index := doloadEsp(filename, savefolder, saveRecent);
  stopStuff;

  if index = -1 then
    index := loaderList.items.count - 1;
  loaderList.itemIndex := index;
  loaderList.OnChange(loaderList);
  globalUIlockOFF(10);
end;

function TForm1.doloadEsp(filename: string; savefolder, saveRecent: boolean): integer;
var
  iVersion, iLocalized, modVersion: integer;
  dResult: cardinal;
begin
  Result := -1;
  forcedCodepage := '';

  if isAlreadyLoaded(filename, Result) then
    exit;
  FormKeyWord.close;
  ValidateEsp(filename, iLocalized, iVersion);
  if (iVersion = -1) or (iLocalized = -1) then
  begin
    dofeedback(getRes('Fbk_TES4Error'), true);
    exit;
  end;

  modVersion := getGameByFormVersion(iVersion, true);
  if modVersion <> CURRENT_GAME_ID then
  begin
    if not isGameHandled(modVersion) then
    begin
      if askDialog(formatres('Fbk_UnknownGame%s', [extractFileName(filename)]), self, [askNo, askYes]) = mrNo then
        exit;
    end
    else
    begin
      if loaderList.items.count = 0 then
      begin
        dResult := askDialog(formatres('Fbk_WrongGame4%s%s%s%s', [extractFileName(filename), STARTUP_INI_VALUES[STARTUP_INI_VALUES_BYGAME[modVersion]],
          STARTUP_INI_VALUES[STARTUP_INI_VALUES_BYGAME[modVersion]], STARTUP_INI_VALUES[STARTUP_INI_VALUES_BYGAME[CURRENT_GAME_ID]]]), self, -1, true, [askNo, askYes, askCancel]);
        if dResult = mrNo then
        begin
          stopStuff;
          restartApplication(modVersion, filename);
          exit(-1);
        end
        else if dResult = mrCancel then
          exit
        else if bAskQuickLoad then
          forcedCodepage := getQuickLoadCP(filename);
      end
      else
      begin
        dResult := askDialog(formatres('Fbk_WrongGame3%s%s%s', [extractFileName(filename), STARTUP_INI_VALUES[STARTUP_INI_VALUES_BYGAME[modVersion]],
          STARTUP_INI_VALUES[STARTUP_INI_VALUES_BYGAME[CURRENT_GAME_ID]]]), self, -1, true, [askNo, askYes]);
        if dResult = mrNo then
          exit
        else if bAskQuickLoad then
          forcedCodepage := getQuickLoadCP(filename);
      end;
    end;
  end;

  // -------------------
  if iLocalized = 0 then
    Result := loadDeLocalizedEsp(filename, savefolder, saveRecent)
  else
    Result := loadLocalizedEsp(filename, savefolder, saveRecent);

  forcedCodepage := '';
end;

function TForm1.launchLocOpt(filename: string): integer;
begin
  FormLocOpt := tFormLocOpt.create(self);
  FormLocOpt.caption := formatres('LocalizedOpts', [filename]);
  FormLocOpt.showmodal;
  if FormLocOpt.ModalResult = mrOK then
    Result := FormLocOpt.RadioGroup1.itemIndex
  else
    Result := 0;
end;

function TForm1.loadLocalizedEsp(filename: string; savefolder, saveRecent: boolean): integer;
var
  currentloader: tTranslatorLoader;
  espstats: rEspStats;
  b, bLoadedFromCache: boolean;
  lookupfailed, sharedIdMaster, sharedIdTarget: integer;
  sFileToLoad: string;
begin
  if isAlreadyLoaded(filename, Result) then
    exit;

  b := false;
  currentloader := tTranslatorLoader.create(filename, espTree, false);
  try
    currentloader.loaderType := sLoaderTypeEsp;
    lookupfailed := 0;
    sharedIdMaster := 0;
    currentloader.addon_Fullpath := filename;
    currentloader.addon_folder := ExtractFilePath(currentloader.addon_Fullpath);
    if savefolder then
      Game_EspFolder := currentloader.addon_folder;
    currentloader.addon_name := extractFileName(currentloader.addon_Fullpath);
    currentloader.addon_Lang := Sourcelanguage;
    updateStatus(currentloader.addon_name);
    // cache
    sFileToLoad := currentloader.OpenCacheProcess(bLoadedFromCache);
    // -----------
    bLocalizedLoadingWarning := false;
    b := currentloader.espLoader.openesp(sFileToLoad, currentloader.addon_Fullpath, 1, bLocalizedLoadAll, bGetVMADStringsFromLocalized, false);

    if b then
    begin
      espstats := currentloader.GetLocalizedEspStrings;
      currentloader.espLoader.ValidGrupString(not bForceKeepAllRecAndField);
      currentloader.espLoader.GetMastersData(currentloader.addon_name);
      dofeedback(currentloader.addon_name);
      dofeedback(formatres('Fbk_LoadEspResult', [espstats.nbRec, espstats.nbField]));
      dofeedback(strSeparator);
      // sort tree o handle stringID fast association
      sortListArray(currentloader.listArray, compareStrIdLow);
      // update addonname related to strings
      currentloader.addon_Fullpath := currentloader.addon_folder + GAME_STRINGS_SUBFOLDER;
      currentloader.addon_folder := currentloader.addon_folder + GAME_STRINGS_SUBFOLDER;
      currentloader.addon_name := removefileext(currentloader.addon_name);
    end;
    if b then
      loadStringInLocalEsp(currentloader);

  finally
    if not b then
    begin
      currentloader.free;
      dofeedback(getRes('Fbk_Failesp'), true);
    end
    else
    begin
      loaderList.items.AddObject(currentloader.getcaption, currentloader);
      currentloader.cleanUplocalizedUnused(lookupfailed, sharedIdMaster, sharedIdTarget, bLocalizedVerboseWarning);
      currentloader.fLoaderMode := sTESVEspStrings;
      if (lookupfailed > 0) then
        dofeedback(formatres('Fbk_LoadEspOrpheanFix', [lookupfailed]), true, [askPanel]);

      if (sharedIdMaster > 0) then
      begin
        bLocalizedLoadingWarning := true;
        dofeedback(formatres('Fbk_LoadEspShareID', [sharedIdMaster, sharedIdTarget]))
      end;

      if not bLocalizedVerboseWarning and bLocalizedLoadingWarning then
        dofeedback(getRes('Fbk_LocalizedloadingWarning'), false);
      // ----------------

      if saveRecent then
        recentMenuUpdate(filename, 3);

      // ----------------
      saveCacheLocalizedEsp(currentloader, bLoadedFromCache);
    end;
  end;
end;

procedure TForm1.saveCacheLocalizedEsp(currentloader: tTranslatorLoader; bLoadedFromCache: boolean);
begin
  case currentloader.CloseCacheProcess(bLoadedFromCache) of
    1: dofeedback(formatres('Fbk_CacheSavedError', [datacache + currentloader.addon_name]), false);
    2: dofeedback(formatres('Fbk_CacheSaved', [datacache + currentloader.addon_name]), false, [askPanel]);
  end;
end;

procedure TForm1.updateAllLoadersForCacheUpdate(forceCp: string = '');
var
  i: integer;
begin
  clearTrees;
  forcedCodepage := forceCp;
  for i := 0 to pred(loaderList.items.count) do
    updateLoaderForCacheUpdateEx(tTranslatorLoader(loaderList.items.Objects[i]));
  forcedCodepage := '';
end;

procedure TForm1.updateLoaderForCacheUpdate(loader: tTranslatorLoader; forceCp: string = '');
begin
  clearTrees;
  forcedCodepage := forceCp;
  updateLoaderForCacheUpdateEx(loader);
  forcedCodepage := '';
end;

procedure TForm1.updateLoaderForCacheUpdateEx(loader: tTranslatorLoader);
var
  lookupfailed, b, c: integer;
begin
  if loader.fLoaderMode = sTESVEspStrings then
  begin
    loader.resetForCacheUpdate(true);
    loadStringInLocalEsp(loader);

    // (var lookupfailed, sharedIdMaster, sharedIdTarget: integer; bVerbose: boolean = true);
    loader.cleanUplocalizedUnused(lookupfailed, b, c);
  end
  else if loader.fLoaderMode = sTESVEsp then
  begin
    ClearArrayList(loader.listArray, true, false);
    loader.resetForCacheUpdate(true);
    loader.GetEspStrings(forcedCodepage);
  end
  else if loader.fLoaderMode = sTESVMcM then
  begin
    ClearArrayList(loader.listArray, true, false);
    loader.resetForCacheUpdate(false);
    loader.lastestUsedCodepage := loader.McMData.parseMCM(loader.listArray[0], false, forcedCodepage);
  end
  else
    loader.resetForCacheUpdate(false);
end;

procedure TForm1.loadStringInLocalEsp(loader: tTranslatorLoader);
var
  bs: boolean;
  languageTmp, strfilename: string;
  r: rFileData;
  bOpt: integer;
begin
  bs := true;
  languageTmp := Sourcelanguage;
  if loader.bOptsForLocalString > -1 then
    bOpt := loader.bOptsForLocalString
  else
  begin
    if bUseLocOptions then
      bOpt := launchLocOpt(loader.addon_name)
    else
      bOpt := iDefaultLocOptions[CURRENT_GAME_ID];
  end;
  if bOpt = 2 then
  begin
    strfilename := OpenFileDialog(formatres('OpenLocString', [loader.addon_name]), Game_StringFolder, '', getRes('FilterStr|*.STRINGS'));
    if (strfilename = '') then
      bs := false;
    if bs and (not FileExists(strfilename)) then
    begin
      dofeedback(getRes('FileNotFound'), true);
      bs := false;
    end;
    if bs then
    begin
      r := parseFileNameData(strfilename);
      loader.addon_folder := r.fPathSlash;;
      languageTmp := r.fLang;
    end;
  end;
  loader.bOptsForLocalString := bOpt;

  // can load partial strings set (with missing file):
  bs := loadAddonStrings(loader, loader.addon_folder, ansilowercase(loader.addon_name), languageTmp, idMatchSource, bforceCpOnLoad, bOpt, true, nil, false, false);
  if not bs then
    loader.setPlaceHolderForStringNotFound;
end;

function TForm1.loadDeLocalizedEsp(filename: string; savefolder, saveRecent: boolean): integer;
var
  currentloader: tTranslatorLoader;
  espstats: rEspStats;
  b: boolean;
begin
  // -check for existing
  if isAlreadyLoaded(filename, Result) then
    exit;

  // --if no create a loader
  currentloader := tTranslatorLoader.create(filename, espTree, bLoadEspSingleListA);
  currentloader.loaderType := sLoaderTypeEsp;

  currentloader.addon_Fullpath := filename;
  currentloader.addon_folder := ExtractFilePath(currentloader.addon_Fullpath);
  currentloader.addon_name := extractFileName(currentloader.addon_Fullpath);
  currentloader.addon_Lang := Sourcelanguage;
  updateStatus(currentloader.addon_name);
  b := currentloader.espLoader.openesp(currentloader.addon_Fullpath, currentloader.addon_Fullpath, 0, true, true, false);
  if b then
  begin
    loaderList.items.AddObject(currentloader.getcaption, currentloader);
    currentloader.espLoader.ValidGrupString(false);
    currentloader.espLoader.GetMastersData(currentloader.addon_name);
    currentloader.fLoaderMode := sTESVEsp;

    espstats := currentloader.GetEspStrings(forcedCodepage);
    if espstats.forceReloadUtf8 then
      espstats := currentloader.GetEspStrings('utf8');

    dofeedback(currentloader.addon_name);
    dofeedback(formatres('Fbk_LoadEspResult', [espstats.nbRec, espstats.nbField]));

    if saveRecent then
      recentMenuUpdate(filename, 4);
    if savefolder then
      Game_EspFolder := currentloader.addon_folder;
  end
  else
  begin
    currentloader.free;
    dofeedback(getRes('Fbk_Failesp'), true);
  end;
end;

// -----------ESP COMPARE----------------
procedure TForm1.EspCompare1Click(Sender: TObject);
var
  filename: string;
begin
  if TESVTmodEspLoaded then
  begin
    filename := OpenFileDialog('', Game_EspCompareFolder, '', espFilter);
    if (filename = '') then
      exit;
    if not FileExists(filename) then
    begin
      dofeedback(getRes('FileNotFound'), true);
      exit;
    end;
    loadEspCompare(filename);
  end;
end;

procedure TForm1.loadEspCompare(filename: string);
var
  b: boolean;
  fProc: tcompareproc;
  iLocalized, iVersion: integer;
begin
  ValidateEsp(filename, iLocalized, iVersion);

  if (iLocalized <> 0) then
  begin
    dofeedback(getRes('Fbk_MustDeloc2'), true);
    exit;
  end;

  Game_EspCompareFolder := ExtractFilePath(filename);

  if not openCompareOpt2(forcedCodepage, fProc, 0) then
    exit;
  if not(currentTesvMode in [sTESVEsp, sTESVEspStrings]) then
    exit;

  MainLoader.espLoader.clearrecordList;
  startStuff(getRes('Fbk_EspCompare'));
  b := MainLoader.espLoader.openesp(filename, filename, 0, false, false, true);
  if b and (MainLoader.espLoader.recordCompareList.count > 0) then
  begin
    MainLoader.doCompareEsp(fProc);
    searchIntree;
  end;
  forcedCodepage := '';
  stopStuff;
  if not b then
    dofeedback(getRes('Fbk_Failesp'), true);
end;


// ------SSTstring----------------------

procedure TForm1.loadSstString(loader: tTranslatorLoader; folder: string);
var
  c, j: integer;
  filename: string;
  Node: PVirtualNode;
  b, sstfound: boolean;
  version: integer;
  focusedRessource: string;
  addon: string;
  transParams: sStrParams;
begin
  if not assigned(loader) then
    exit;
  loader.getaddonHash;
  addon := loader.getCleanAddonName(true);
  // --------------------------
  focusedRessource := addon + loader.getAddonHashStr;
  // --------------
  filename := folder + getSSTFileName(focusedRessource, 'sst');

  // --recursive serach for hash and normal sst
  sstfound := FileExists(filename);
  if not sstfound then
  begin
    filename := folder + getSSTFileName(addon, 'sst');
    focusedRessource := addon;
    if not FileExists(filename) then
    begin
      dofeedback(formatres('Fbk_NOSSTfound', [loader.addon_name]));
      exit;
    end;
  end;

  Node := getSstNode(focusedRessource);
  if not assigned(Node) or (not(VocabTree.CheckState[Node] = csCheckedNormal) and not ToolButtonForceSST.down) then
    exit;

  // ----------------------------------
  dofeedback(getRes('Fbk_applySST') + ' [' + loader.addon_name + ']');
  clearSkList(LocalVocabBaseList, true);
  clearInternalRefList(LocalVocabEdidList);

  try
    updateStatus(formatres('Fbk_LoadSST%s', [loader.addon_name]));
    b := loadVocabUserCache(LocalVocabEdidList, LocalVocabBaseList, filename, nil, 0, c, [], [], false, false, loader.lColabLabel, nil, version, true);

    if b then
    begin
      /// new loading system 1.4.4---------->
      sortVocabEdidList(LocalVocabEdidList, compareEspStr_V4Strict, false);
      // <-----------new loading system 1.4.4

      loader.readColabExport;
      updateStatus(formatres('Fbk_ApplySST%s', [loader.addon_name]));

      // transParams: sStrParams;
      if TESVTSameLanguage then
        transParams := [validated]
      else
        transParams := [translated];

      // pbar
      ProgressBar.max := getTotalVocabCount(loader.listArray);
      pbar := 0;
      for j := 0 to 2 do
      begin
        if LocalVocabEdidList.count = 0 then
          findStrMatchEx(LocalVocabBaseList, loader.listArray[j], compareOptEverythingLockedStatus, [validated], false, true, false, false, false)
        else
        begin
          findEdidMatchEx(LocalVocabEdidList, loader.listArray[j], compareOptEverythingLockedStatus, compareEspStr_V4Strict, false, transParams, [translated], true, false, false, false);
          findEdidMatchEx(LocalVocabEdidList, loader.listArray[j], compareOptNoTransLockedStatus, compareEspStr_V4Relax, false, transParams, [translated], true, false, false, false);
          // findEdidMatchEx(LocalVocabEdidList, loader.listArray[j], compareOptNoTransLockedStatus, compareEspStr_V4Edid, false, transParams, [translated],
          // true, false, false, false);
        end;
      end;
      // VMAD
      if bApplyVMAD and isLoaderHasVMAD(loader) then
        findEdidMatchEx(LocalVocabEdidList, loader.listArray[0], compareOptVMAD, compareEspStr_V4Strict, false, [validated], [translated], true, false, true, false);
      // sort treeview
      setTreeSortAndSort(3);
      // finalize
      if bKeepOldData then
        loader.keepOldData(LocalVocabEdidList, LocalVocabBaseList);
      if loader.unusedSSTList.count > 0 then
        dofeedback('oldDataFound: ' + IntToStr(loader.unusedSSTList.count));

    end
    else
      dofeedback(getRes('FbK_SSTLoadError'), true);
    updateStatus(getRes('Fbk_Finalyze'));
  finally
    clearSkList(LocalVocabBaseList, true);
    clearInternalRefList(LocalVocabEdidList);
  end;
end;

procedure TForm1.LoadStringAsDest1Click(Sender: TObject);
var
  filename: string;
  tmpExt: string;
  b: integer;
begin
  if (currentTesvMode = sTESVEspStrings) or (currentTesvMode = sTESVStrings) then
  begin
    form2.close; // security

    if Game_StringCompareFolder = '' then
      Game_StringCompareFolder := Game_StringFolder;

    filename := OpenFileDialog('', Game_StringCompareFolder, '', getRes('FilterStr2|*.STRINGS; *.BSA; *.BA2'));
    if (filename = '') then
      exit;
    if not FileExists(filename) then
    begin
      dofeedback(getRes('FileNotFound'), true);
      exit;
    end;

    b := 0;
    filename := ansilowercase(filename);
    tmpExt := extractFileExt(filename);

    Game_StringCompareFolder := ExtractFilePath(filename);

    startStuff(getRes('Fbk_LoadStringAsDest'));
    if (tmpExt = '.bsa') or (tmpExt = '.ba2') then
      b := loadStringAsDestBsa(MainLoader, filename)
    else if tmpExt = '.strings' then
      b := loadStringAsDest(MainLoader, filename);

    if b = 1 then
    begin
      setuserCacheUpdated(MainLoader, cacheLoaded);
      updateStatus(getRes('Fbk_ComputeData'));
      searchIntree;
    end;

    forcedCodepage := '';
    stopStuff;
    if b = 0 then
      dofeedback(getRes('Fbk_LoadStringAsDestFailed'), true);

  end;
end;

function TForm1.loadStringAsDestBsa(loader: tTranslatorLoader; bsa: string): integer;
var
  fProc: tcompareproc;
  fs: tmemoryStream;
  buffer: tbytes;
  bStream: TObject;
  filesToLoad: tstringlist;
  fData: rFileData;
  discardPex: boolean;
begin
  Result := 0;
  fs := tmemoryStream.create;
  bStream := nil;
  buffer := nil;
  try
    try
      filesToLoad := tstringlist.create;
      if browseArchive(bStream, bsa, '.strings', ['strings'], ['.strings'], filesToLoad, discardPex, false) then
      begin
        Application.ProcessMessages;
        fData := parseFileNameData(filesToLoad[0]);
        if openCompareOpt2(forcedCodepage, fProc, 0, 'LoadStringAsDest') then
          Result := ord(loadAddonStringsDirect(loader, bStream, bsa, fData.fPath, fData.fNameStrict, fData.fLang, idMatchTransTool, '', true, fProc, false))
        else
          Result := 2;
      end;
    except
      On E: Exception do
        dofeedback(E.Message, true);
    end;
  finally
    freeStreamArchive(bStream);
    fs.free;
    filesToLoad.free;
  end;
end;

function TForm1.loadStringAsDest(loader: tTranslatorLoader; filename: string): integer;
var
  r: rFileData;
  fProc: tcompareproc;
begin
  r := parseFileNameData(filename);
  if openCompareOpt2(forcedCodepage, fProc, 0, 'LoadStringAsDest') then
    Result := ord(loadAddonStrings(loader, r.fPathSlash, ansilowercase(r.fNameStrict), r.fLang, idMatchTransTool, '', 0, false, fProc, false, false))
  else
    Result := 2;
end;


// ------Save SST file

function backupSst(filename: string): boolean;
var
  basename: string;
begin
  Result := false;
  try
    basename := appendDatetoName(filename);
    Result := FileOperation(SSTUserFolder + filename, SSTUserFolderBackup + basename);
    if not Result then
      dofeedback(getRes('Fbk_RenameError'), true);
  except
    on E: Exception do
      dofeedback(getRes('Fbk_RenameError'), true);
  end;
end;

procedure cleanBackupSst(count: integer; folder, filename: string);
var
  searchResult: TSearchRec;
  t: tstringlist;
begin
  t := tstringlist.create;
  t.duplicates := dupIgnore;
  t.sorted := true;
  try
    try
      // -SST first
      if FindFirst(folder + filename + '.*', faAnyFile, searchResult) = 0 then
      begin
        repeat
          t.add(searchResult.name);
        until FindNext(searchResult) <> 0;
        FindClose(searchResult);
      end;

      while t.count > count do
      begin
        DeleteFile(folder + t[0]);
        t.delete(0);
      end;
    except
    end;
  finally
    t.free;
  end;
end;

// --UPDATECACHE------------------
procedure TForm1.vocabTreeFilter(s: string);
var
  Node: PVirtualNode;
  Data: ptreedatafdr;
begin
  s := trim(s);

  if bHideDicOnSearch then
  begin
    VocabTree.beginupdate;
    Node := VocabTree.GetFirst;
    while assigned(Node) do
    begin
      Data := VocabTree.GetNodeData(Node);
      if not(fdrIsFolder in Data.BasicND.s.fparams) then
        VocabTree.IsVisible[Node] := (s = '') or (pos(ansilowercase(s), (ansilowercase(Data.BasicND.s.name))) > 0);
      Node := VocabTree.GetNext(Node);
    end;
    VocabTree.endupdate;
  end
  else
    VocabTree.Repaint;
end;

function TForm1.getSstNode(s: string): PVirtualNode;
var
  Node: PVirtualNode;
  Data: ptreedatafdr;
begin
  Result := nil;
  Node := VocabTree.GetFirst;
  while assigned(Node) do
  begin
    Data := VocabTree.GetNodeData(Node);
    if (fdrUser in Data.BasicND.s.fparams) and (Data.BasicND.s.name = s) then
      Result := Node;
    Node := VocabTree.GetNext(Node)
  end;
end;

procedure TForm1.updateDerivedStrings;
var
  i: integer;
  sk: tskystr;
begin
  form2.close;
  ClearHeuristicData;

  for i := vocabBaselist.count - 1 downto 0 do
  begin
    sk := vocabBaselist[i];
    exclude(sk.sinternalparams, derivedComputed);
    if (sk.pnode = nil) then
    begin
      vocabBaselist.delete(i);
      sk.free;
    end;
  end;
  vocabBaselist.Sort(compareallHashesAndSources);
  generateDerivedStringData(true);
  vocabBaselist.Sort(compareSourcesAndProxy);
  generateOneWordList;
end;

// ----replaceAll similarStrings
procedure TForm1.ReplaceAllStrings(sourceSk: tskystr; v1: sStrParams; autoAccept: boolean; fixNum: boolean = false);
var
  i, j: integer;
  sk: tskystr;
  doReplace: boolean;
  Node: PVirtualNode;
  vTree: TBaseVirtualTree;
  Data: ptreedata;
begin
  if not assigned(MainLoader) then
    exit;
  // option
  If tesvtnoReplace then
    exit;
  // checking multiple string first
  doReplace := false;
  timeUndo;
  for j := 0 to 2 do
    for i := 0 to MainLoader.listArray[j].count - 1 do
    begin
      sk := MainLoader.listArray[j][i];
      if sk.s = '' then
        continue;
      if sk = sourceSk then
        continue;
      if sk.lockedStatus then
        continue;
      if (sk.hash = sourceSk.hash) and ((sk.hashtrans <> sourceSk.hashtrans) or (sk.sparams * v1 = [])) then
      begin
        if autoAccept then
        begin
          MainLoader.addUndo(sk, tTimeUndo, false);
          sk.strans := sourceSk.strans;
          sk.resetStatus(v1);
          setuserCacheUpdated(MainLoader, cacheLoaded);
          if fixNum then
            FixValueEx(MainLoader, 1, sk, false);
        end
        else
          doReplace := true;
      end;
    end;
  if not doReplace then
    exit();
  // --------
  form5 := tform5.create(Form1);
  vTree := form5.replaceTree;

  for j := 0 to 2 do
    for i := 0 to MainLoader.listArray[j].count - 1 do
    begin
      sk := MainLoader.listArray[j][i];
      if sk = sourceSk then
        continue;
      if sk.lockedStatus then
        continue;
      if (sk.hash = sourceSk.hash) and ((sk.hashtrans <> sourceSk.hashtrans) or (sk.sparams * v1 = [])) then
        vTree.AddChild(nil, TNodeData.create(sk));
    end;
  vTree.selectall(false);
  form5.caption := ReplaceALLCaption + sourceSk.strans;

  form5.showmodal;
  if form5.ModalResult = mrOK then
  begin
    Node := vTree.GetFirst;
    while assigned(Node) do
    begin
      if vTree.Selected[Node] then
      begin
        Data := vTree.GetNodeData(Node);
        MainLoader.addUndo(Data.BasicND.s, tTimeUndo, false);
        Data.BasicND.s.strans := sourceSk.strans;
        Data.BasicND.s.resetStatus(v1);
        setuserCacheUpdated(MainLoader, cacheLoaded);
      end;
      Node := vTree.GetNext(Node);
    end;
  end;
  form5.free;
  repaintTrees;
end;

procedure TForm1.ValidateallTranslations1Click(Sender: TObject);
begin
  if askDialog(getRes('ValidateALL'), self, [askNo, askYes]) = mrYes then
  begin
    MainLoader.ValidateallTrans;
    MainLoader.lockTES4;
    searchIntree;
  end;
end;

procedure TForm1.ResetallTranslations1Click(Sender: TObject);
begin
  if askDialog(getRes('ResetALL'), self, [askNo, askYes]) = mrYes then
  begin
    MainLoader.ResetallTrans;
    MainLoader.lockTES4;
    searchIntree;
  end;
end;

// -------------html

procedure TForm1.HtmlViewer1HotSpotClick(Sender: TObject; const SRC: string; var Handled: boolean);
var
  ext: string;
  i, j, k: integer;
begin
  Handled := false;
  // reset filter
  if SRC = '#MAINREADME' then
  begin
    CommonReadmeLoad;
    Handled := true;
    exit;
  end;

  i := pos(':', SRC);
  j := pos('FILE:', UpperCase(SRC));
  if (i <= 2) or (j > 0) then
  begin
    ext := UpperCase(extractFileExt(SRC));
    if ext = '.HTM' then
    begin
      Handled := true;
      openHtmFile(SRC, HtmlViewer1, HTMLType);
    end
    else if ext = '.TXT' then
    begin
      Handled := true;
      HtmlViewer1.loadfromfile(SRC, TextType);
    end;
    exit;
  end;
  i := pos('MAILTO:', UpperCase(SRC));
  j := pos('HTTP:', UpperCase(SRC));
  k := pos('HTTPS:', UpperCase(SRC));
  if (i > 0) or (j > 0) or (k > 0) then
  begin
    ShellExecute(0, nil, @SRC[1], nil, nil, SW_SHOWNORMAL);
    Handled := true;
  end;
end;

// --------------SST---------------------------

procedure TForm1.SaveSSTcustomClick(Sender: TObject);
begin
  doSaveSSTCustomDictionary(MainLoader);
end;

procedure TForm1.AutoSaveOn;
begin
  Timer_AutoSave.Interval := iUseAutosaveDelay;
  Timer_AutoSave.Enabled := false;
  Timer_AutoSave.Enabled := iUseAutosaveDelay > 0;
  bIdleAutosave := false;
  bBlockAutoSave := false;
end;

procedure TForm1.AutoSaveOff;
begin
  Timer_AutoSave.Enabled := false;
  bIdleAutosave := false;
  bBlockAutoSave := true;
end;

procedure TForm1.AutoSave;
var
  focusForm: TForm;
begin
  focusForm := screen.ActiveForm;
  globalUIlockON(10, '', false);
  try
    if currentTesvMode <> sTESVTsstCustom then
      if doAutoSaveSSTDictionary(MainLoader, false) = -1 then
        iUseAutosaveDelay := 0;

  finally
    globalUIlockOFF(10);
    AutoSaveOn;

    if assigned(focusForm) then
      focusForm.setFocus;
  end;
end;

function TForm1.doAutoSaveSSTDictionary(loader: tTranslatorLoader; bSaveAs: boolean): integer;
var
  basename, tmpName: string;
  tmpRessource: string;
  fProc: tcompareproc;
begin
  Result := 0;
  if not assigned(loader) then
    exit;
  if BlockSameLanguageEditing then
    exit;
  if not((loader.fLoaderMode = sTESVTsstEdit) or (loader.fLoaderMode = sTESVEsp) or (loader.fLoaderMode = sTESVEspStrings) or (loader.fLoaderMode = sTESVMcM) or (loader.fLoaderMode = sTESVPex)) then
    exit;

  if loader.fLoaderMode = sTESVTsstEdit then
    tmpRessource := loader.addon_name
  else
    tmpRessource := loader.getCleanAddonName(true) + loader.getAddonHashStr;

  updateStatus(getRes('Fbk_AutoSaveSST'));
  basename := getSSTFileName(tmpRessource, 'sst');
  tmpName := appendDatetoName(basename);

  // -------------------------
  loader.prepareColabExport;

  if TESVTSameLanguage then
    fProc := compareSourceDestDiffandColab
  else
    fProc := compareOptEverything;

  if SaveSSTFile(SSTUserFolderAutoBackup + tmpName, loader.listArray, fProc, 0, loader.unusedSSTList, loader.lColabLabel, loader.getmasterList) then
  begin
    Result := 1;
    dofeedback(formatres('Fbk_AutoSaved%s', [tmpName]), false);
  end
  else
  begin
    Result := -1;
    dofeedback(formatres('Fbk_AutoSavedError%s', [tmpName]), TESVTmodLoaded);
  end;

  cleanBackupSst(3, SSTUserFolderAutoBackup, basename);
end;

procedure TForm1.SaveSSTFiles(bUpdateCacheList: boolean = false);
var
  focusForm: TForm;
  tmpSSTname: string;
begin
  if not bCanSave then
  begin
    MessageBeep(MB_ICONSTOP);
    exit;
  end;
  // closing editWindows
  form2.valideStringChange(false, true, true, [validated]);
  form2.close;

  focusForm := screen.ActiveForm;

  globalUIlockON(10, getRes('Fbk_SaveSST'), false);
  if currentTesvMode = sTESVTsstCustom then
    tmpSSTname := doSaveSSTCustomDictionary(MainLoader)
  else
    tmpSSTname := doSaveSSTDictionary(MainLoader, false);

  if bUpdateCacheList and (tmpSSTname <> '') then
    updateCacheList(tmpSSTname);

  globalUIlockOFF(10);

  if assigned(focusForm) then
    focusForm.setFocus;
end;

procedure TForm1.SaveSSTStringsClick(Sender: TObject);
begin
  SaveSSTFiles(true);
end;

function TForm1.doSaveSSTDictionary(loader: tTranslatorLoader; bSaveAs: boolean): string;
var
  tmpName: string;
  tmpRessource: string;
  fProc: tcompareproc;
begin
  Result := '';
  if not bCanSave then
  begin
    MessageBeep(MB_ICONSTOP);
    exit;
  end;
  if not assigned(loader) then
  begin
    MessageBeep(MB_ICONSTOP);
    exit;
  end;

  if BlockSameLanguageEditing then
  begin
    MessageBeep(MB_ICONSTOP);
    exit;
  end;

  if not((loader.fLoaderMode = sTESVTsstEdit) or (loader.fLoaderMode = sTESVEsp) or (loader.fLoaderMode = sTESVEspStrings) or (loader.fLoaderMode = sTESVMcM) or (loader.fLoaderMode = sTESVPex)) then
  begin
    MessageBeep(MB_ICONSTOP);
    exit;
  end;

  if loader.fLoaderMode = sTESVTsstEdit then
    tmpRessource := loader.addon_name
  else
    tmpRessource := loader.getCleanAddonName(true) + loader.getAddonHashStr;

  if bSaveAs then
  begin
    if loader.customSSTName <> '' then
      tmpRessource := loader.customSSTName;
    if InputQuery(ProgName, getRes('customSSTName'), tmpRessource) then
    begin
      tmpRessource := cleanForbiddenChar(tmpRessource);
      loader.customSSTName := cleanForbiddenChar(tmpRessource);
    end
    else
      exit;
  end;

  tmpName := getSSTFileName(tmpRessource, 'sst');

  if (sstBackupCount > 0) and (FileExists(SSTUserFolder + tmpName)) then
    backupSst(tmpName);
  cleanBackupSst(sstBackupCount, SSTUserFolderBackup, tmpName);
  // -------------------------
  loader.prepareColabExport;

  if TESVTSameLanguage then
    fProc := compareSourceDestDiffandColab
  else
    fProc := compareOptEverything;

  if SaveSSTFile(SSTUserFolder + tmpName, loader.listArray, fProc, 0, loader.unusedSSTList, loader.lColabLabel, loader.getmasterList) then
  begin
    setuserCacheUpdated(loader, false);
    dofeedback(formatres('Fbk_Saved', [tmpName]), true, [askPanel]);
  end
  else
    dofeedback(formatres('Fbk_SavedError', [tmpName]), TESVTmodLoaded);
  Result := tmpRessource;
end;

function TForm1.doSaveSSTCustomDictionary(loader: tTranslatorLoader): string;
var
  tmpName: string;
begin
  Result := '';
  if not bCanSave then
  begin
    MessageBeep(MB_ICONSTOP);
    exit;
  end;
  if loader.fLoaderMode <> sTESVTsstCustom then
  begin
    MessageBeep(MB_ICONSTOP);
    exit;
  end;
  // closing editWindows
  form2.valideStringChange(false, true, true, [validated]);
  form2.close;
  tmpName := getSSTFileName(SSTCustomfilename, 'sst');

  if (sstBackupCount > 0) and (FileExists(SSTUserFolder + tmpName)) then
    backupSst(tmpName);
  cleanBackupSst(sstBackupCount, SSTUserFolderBackup, tmpName);
  loader.prepareColabExport;
  if SaveSSTFile(SSTUserFolder + tmpName, loader.listArray, compareOptEverything, 0, nil, loader.lColabLabel, nil) then
  begin
    setuserCacheUpdated(loader, false);
    dofeedback(formatres('Fbk_Saved', [tmpName]), true, [askPanel]);
  end
  else
    dofeedback(formatres('Fbk_SavedError', [tmpName]), true);
  Result := SSTCustomfilename;
end;

// sst custom

procedure TForm1.OpenSSTcustomClick(Sender: TObject);
begin
  loadCacheSSTStrings(SSTCustomfilename, sTESVTsstCustom);
  bAutocloseWithWizard := false;
end;

procedure TForm1.loadCacheSSTStrings(filename: string; tm: sTESVTMode);
var
  Index: integer;
begin
  globalUIlockON(10, getRes('Fbk_LoadCustom'));
  UpdateLoaderSetting(MainLoader);
  ResetFocusedData;
  index := loadCacheSSTStringsEx(filename, tm);
  stopStuff;

  if index = -1 then
    index := loaderList.items.count - 1;
  loaderList.itemIndex := index;
  loaderList.OnChange(loaderList);
  globalUIlockOFF(10);
end;

function TForm1.loadCacheSSTStringsEx(filename: string; tm: sTESVTMode): integer;
var
  c: integer;
  currentloader: tTranslatorLoader;
  b: boolean;
  fullPath, tmpPath: string;
begin
  tmpPath := IncludeTrailingPathDelimiter(ExtractFilePath(filename));
  if (ansilowercase(tmpPath) = SSTUserFolder) or (ansilowercase(tmpPath) = '\') then
    fullPath := SSTUserFolder + getSSTFileName(filename, 'sst')
  else
    fullPath := filename;

  if isAlreadyLoaded(fullPath, Result) then
    exit;
  b := false;

  currentloader := tTranslatorLoader.create(fullPath, espTree, true);
  currentloader.addon_name := filename;
  currentloader.addon_Fullpath := fullPath;

  currentloader.loaderType := sLoaderTypeSST;
  updateStatus(currentloader.addon_name);
  currentloader.fLoaderMode := tm; // change silent
  // -----------------
  if FileExists(fullPath) then
    b := loadSstEdit(currentloader.listArray, fullPath, c, [lockedTrans, incompleteTrans], [translated], false, currentloader.lColabLabel, nil);

  if b then
    currentloader.readColabExport;

  if tm = sTESVTsstCustom then
    loaderList.items.AddObject(currentloader.getcaption, currentloader)
    // if userDic then open it even if it's empty
  else
  begin
    if b then
      loaderList.items.AddObject(currentloader.getcaption, currentloader)
    else
    begin
      currentloader.free;
      dofeedback(getRes('Fbk_SSTLoadError'), true);
    end;
  end;
end;

procedure TForm1.menuCustomDic1Click(Sender: TObject);
var
  sk: tskystr;
begin
  form2.close;
  sk := getFocusedString(currentEditedTree);
  if assigned(sk) then
  begin
    loadCacheSSTStrings(SSTCustomfilename, sTESVTsstCustom);
    CreateCustomDicEntry(sk.s, sk.strans);
  end;
end;

procedure TForm1.AddFieldCustom1Click(Sender: TObject);
begin
  form2.close;
  CreateCustomDicEntry('', '');
end;

procedure TForm1.CreateCustomDicEntry(s, strans: string);
var
  sk: tskystr;
  j: integer;
  Node: PVirtualNode;
begin
  if not(assigned(MainLoader) and TESVTsstCustom) then
    exit;
  j := mainPageControl.ActivePageIndex;
  sk := tskystr.init(0, 0, s, strans, j, 0, [incompleteTrans], [], nil, true);
  MainLoader.listArray[j].add(sk);
  Node := treearray[j].AddChild(nil, TNodeData.create(sk));
  sk.pnode := Node;
  treearray[j].focusedNode := Node;
  treearray[j].topNode := Node;
  getStringText(true);
end;

procedure TForm1.Darker1Click(Sender: TObject);
begin
  darkPercent := getDarkPercent(TMenuItem(Sender).tag);
  updateCompoColor;
end;

procedure TForm1.updateCompoColor;
begin
  InitCompoColor(self);
  InitCompoColor(form2);
  InitCompoColor(AdvSearchForm);
  InitCompoColor(FormKeyWord);
end;
// --------reloadcache

procedure TForm1.TabSheet10Show(Sender: TObject);
begin
  pexLogCursorLine := 0;
end;

procedure TForm1.TimerFeedbackTimer(Sender: TObject);
begin
  TimerFeedback.Enabled := false;
  PanelFeedBack.visible := false;
end;

procedure TForm1.TimerLDTimer(Sender: TObject);
begin
  findHeuristicFocus;
end;

procedure TForm1.TimerPageControl2Timer(Sender: TObject);
var
  b1, b2: boolean;
begin
  TimerPageControl2.Enabled := false;
  case pagecontrol2.ActivePageIndex of
    PageControl_Heuristic: findHeuristicFocus;
    PageControl_Quest:
      if assigned(MainLoader) then
        MainLoader.drawQuestsList(ButtonedEdit4.Text, ListBox2);
    PageControl_Fuz:
      begin
        startStuff('', false);
        b1 := generateFuzMap;
        b2 := generateNpcMap(false);
        stopStuff(false, false);;
        if not b1 and isFuzLoaded(MainLoader, fuz.current) then
          fuz.drawVoiceList(ListBox3.items, ButtonedEdit6.Text);
        if not b2 and isNpcLoaded(MainLoader) then
          mainDialdata.fillList(ListBox4.items, ButtonedEdit6.Text);
        if b1 or b2 then
          repaintTrees;
        SkyTreeFocusChanged(ilSkyTree, ilSkyTree.focusedNode, 0);
      end;
    PageControl_Log: MemoLog.Repaint;
  end;
end;

procedure TForm1.TimerSearchPexTimer(Sender: TObject);
begin
  dosearchinPexText([ssoEntireScope]);
end;

procedure TForm1.TimerThemeTimer(Sender: TObject);
begin
  TimerTheme.Enabled := false;
  try
    setTheme(true, true);
  finally
    stopStuff(false, false);
  end;
end;

procedure TForm1.TimerVocabSearchTimer(Sender: TObject);
begin
  TimerVocabSearch.Enabled := false;
  VocabTree.FullExpand;
  vocabTreeFilter(ButtonedEdit2.Text)
end;

procedure TForm1.Timer_AutoSaveTimer(Sender: TObject);
begin
  Timer_AutoSave.Enabled := false;
  bIdleAutosave := true;
end;

procedure TForm1.LocalTimerSearchTimer(Sender: TObject);
begin
  searchIntree;
end;

procedure TForm1.ToolButton10Click(Sender: TObject);
begin
  checkAllSearchOpt(true);
  if assigned(MainLoader) then
  begin
    MainLoader.FilteredRecord := 0;
    ToolButton56.Enabled := false;
  end;
  ToolButton26.down := false;
  ToolButton48.down := false;
  ToolButton2.down := false;
  ToolButton42.down := false;
  ToolButton57.down := false;
  ToolButton12.down := false;
  ButtonedEdit1.Text := '';
  launchSearchTimer;
end;

procedure TForm1.ToolButton12MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
begin
  if Button = mbLeft then
    launchSearchTimer;
end;

procedure TForm1.ToolButton16Click(Sender: TObject);
begin
  checkVocabTree(csCheckedNormal);
end;

procedure TForm1.ToolButton17Click(Sender: TObject);
begin
  checkVocabTree(csUnCheckedNormal);
end;

procedure TForm1.checkVocabTree(cs: TCheckState);
var
  Node: PVirtualNode;
begin
  vtChecking := true;
  Node := VocabTree.GetFirst;
  while assigned(Node) do
  begin
    VocabTree.CheckState[Node] := cs;
    Node := VocabTree.GetNext(Node);
  end;
  vtChecking := false;
end;

procedure TForm1.ToolButton18Click(Sender: TObject);
begin
  globalUIlockON(1);
  AutoSaveOff;
  LaunchLoadCache;
  AutoSaveOn;
  globalUIlockOFF(1);
end;

procedure TForm1.ToolButton19Click(Sender: TObject);
begin
  toggleOneList(ToolButton19.down);
end;

procedure TForm1.ToolButton1Click(Sender: TObject);
begin
  inc(searchInMode);
  if searchInMode > 3 then
    searchInMode := 0;
  ToolButton1.ImageIndex := searchImageID[searchInMode];
  ToolButton1.Hint := getRes(searchImageHINT[searchInMode]);
  launchSearchTimer;
end;

function TForm1.enableEditSST(f: sFdrParam; bTestDeleteFolder: boolean = false): boolean;
var
  Data: ptreedatafdr;
begin
  Result := false;
  if assigned(VocabTree.focusedNode) then
  begin
    Data := VocabTree.GetNodeData(VocabTree.focusedNode);
    Result := f in Data.BasicND.s.fparams;
    if bTestDeleteFolder then
      Result := Result and (VocabTree.focusedNode.ChildCount = 0) and not(fdrIsDefaultFolder in Data.BasicND.s.fparams);
  end;
end;

procedure TForm1.VocabTreeCompareNodes(Sender: TBaseVirtualTree; Node1, Node2: PVirtualNode; Column: TColumnIndex; var Result: integer);
var
  Data1, Data2: ptreedatafdr;
begin
  Data1 := Sender.GetNodeData(Node1);
  Data2 := Sender.GetNodeData(Node2);

  if Column = 0 then
    Result := AnsiCompareText(Data1.BasicND.s.name, Data2.BasicND.s.name)
  else
    Result := Data1.BasicND.s.id - Data2.BasicND.s.id;

end;

procedure TForm1.VocabTreeDragAllowed(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; var Allowed: boolean);
begin
  Allowed := true;
end;

procedure TForm1.VocabTreeDragDrop(Sender: TBaseVirtualTree; source: TObject; DataObject: IDataObject; Formats: TFormatArray; Shift: TShiftState; Pt: TPoint; var Effect: integer; Mode: TDropMode);
var
  pSource, pTarget: PVirtualNode;
  attMode: TVTNodeAttachMode;
  i: integer;
  nodeList: TNodeArray;
  DataSource, DataTarget: ptreedatafdr;
  bSourceIsFolder, bReverse: boolean;

begin
  pTarget := Sender.DropTargetNode;

  nodeList := Sender.Getsortedselection(true);
  DataTarget := Sender.GetNodeData(pTarget);
  bSourceIsFolder := false;
  bReverse := false;
  // look if source isfolder
  if (length(nodeList) = 1) then
  begin
    DataSource := Sender.GetNodeData(nodeList[0]);
    bSourceIsFolder := (fdrIsFolder in DataSource.BasicND.s.fparams);
  end;

  if (fdrIsFolder in DataTarget.BasicND.s.fparams) then
  begin
    if bSourceIsFolder then
    begin
      case Mode of
        dmAbove: attMode := amInsertBefore;
        dmOnNode: attMode := amInsertAfter;
      else attMode := amInsertAfter;
      end;
    end
    else
    begin
      case Mode of
        dmAbove: attMode := amAddChildFirst;
        dmOnNode: attMode := amAddChildLast;
      else attMode := amAddChildFirst;
      end;
    end;
  end
  else
  begin
    if Mode = dmAbove then
      attMode := amInsertBefore
    else
    begin
      attMode := amInsertAfter;
      bReverse := true;
    end;
  end;

  if bReverse then
  begin
    for i := length(nodeList) - 1 downto 0 do
    begin
      pSource := nodeList[i];
      Sender.moveto(pSource, pTarget, attMode, false);
    end;
  end
  else
  begin
    for i := 0 to length(nodeList) - 1 do
    begin
      pSource := nodeList[i];
      Sender.moveto(pSource, pTarget, attMode, false);
    end;
  end;

  RefreshCheckStates;
end;

procedure TForm1.RefreshCheckStates;
var
  Node: PVirtualNode;
  Run: PVirtualNode;
  CheckedCount: cardinal;
begin
  Node := VocabTree.GetFirst;
  while assigned(Node) do
  begin
    if Node.ChildCount > 0 then
    begin
      Run := Node.FirstChild;
      CheckedCount := 0;
      while assigned(Run) do
      begin
        if Run.CheckState = csCheckedNormal then
          inc(CheckedCount);
        Run := Run.NextSibling;
      end;
      if CheckedCount = Node.ChildCount then
        Node.CheckState := csCheckedNormal
      else if CheckedCount = 0 then
        Node.CheckState := csUnCheckedNormal
      else
        Node.CheckState := csMixedNormal;
    end
    else
      Node.CheckState := csUnCheckedNormal;
    Node := VocabTree.GetNextSibling(Node);
  end;
end;

procedure TForm1.VocabTreeDragOver(Sender: TBaseVirtualTree; source: TObject; Shift: TShiftState; State: TDragState; Pt: TPoint; Mode: TDropMode; var Effect: integer; var Accept: boolean);
var
  pSource, pTarget: PVirtualNode;
  DataSource, DataTarget: ptreedatafdr;
  nodeList: TNodeArray;
  i: integer;
begin
  Accept := source = Sender;
  pTarget := Sender.DropTargetNode;
  Accept := Accept and assigned(pTarget);
  if Accept then
  begin
    DataTarget := Sender.GetNodeData(pTarget);
    nodeList := Sender.Getsortedselection(true);
    // check selection content
    for i := 0 to length(nodeList) - 1 do
    begin
      pSource := nodeList[i];
      DataSource := Sender.GetNodeData(pSource);
      if (fdrIsFolder in DataSource.BasicND.s.fparams) then
      begin
        Accept := (length(nodeList) = 1) and (fdrIsFolder in DataTarget.BasicND.s.fparams);
        break;
      end;
    end;
  end;
end;

// ----------langPreset
procedure TForm1.addPreset1Click(Sender: TObject);
begin
  presetlang.add(format('preset_%s_%s', [Sourcelanguage, Destlanguage]));
  buildPresetmenu;
end;

procedure TForm1.startupMenu1Click(Sender: TObject);
var
  i: integer;
begin
  TMenuItem(Sender).checked := true;
  for i := 0 to high(STARTUP_INI_VALUES) do
    if ((Sender as TMenuItem).tag = i) and (Sender as TMenuItem).checked then
      LOADING_PREFS_ID := i;
end;

procedure TForm1.buildPresetmenuEx(mParent: TMenuItem; presetBaseName: string);
var
  mItem: TMenuItem;
  i: integer;
  s1, s2, s3: string;
begin
  for i := presetlang.count - 1 downto 0 do
  begin
    getLangSST(presetlang[i], s1, s2, s3);
    mItem := TMenuItem.create(mParent);
    mItem.caption := formatres('Menu_preset', [s1, s2]);
    mItem.name := presetBaseName + IntToStr(i);
    mItem.ImageIndex := 33;
    mItem.OnClick := PresetOnClick;
    mItem.tag := i;
    mParent.Insert(0, mItem);
  end;
end;

procedure TForm1.buildPresetmenu;
begin
  clearPresetMenu(langpresetsmenu1);
  clearPresetMenu(PopupMenu5.items);
  buildPresetmenuEx(langpresetsmenu1, 'mPreset1_');
  buildPresetmenuEx(PopupMenu5.items, 'mPreset2_');
end;

procedure TForm1.clearPreset1Click(Sender: TObject);
begin
  presetlang.clear;
  clearPresetMenu(langpresetsmenu1);
  clearPresetMenu(PopupMenu5.items);
end;

procedure TForm1.clearPresetMenu(m: TMenuItem);
var
  i: integer;
begin
  for i := m.count - 1 downto 0 do
    if TMenuItem(m.items[i]).tag >= 0 then
      TMenuItem(m.items[i]).free;
end;

procedure TForm1.PresetOnClick(Sender: TObject);
var
  s1, s2, s3: string;
begin
  if inrange(TMenuItem(Sender).tag, 0, presetlang.count - 1) then
  begin
    if AuthOnCheckAllUserCacheUpdated then
    begin
      form2.close;
      getLangSST(presetlang[TMenuItem(Sender).tag], s1, s2, s3);
      SetLanguagePair(s1, s2);
    end;
  end;
end;

function TForm1.SetLanguagePair(s1, s2: string): boolean;
  function authLanguage(s: string): boolean;
  var
    i: integer;
  begin
    for i := 0 to codepageFiles.count - 1 do
      if codepageFiles.names[i] = ansilowercase(s) then
        exit(true);
    Result := false;
  end;

begin
  Result := true;
  if not authLanguage(s1) or not authLanguage(s2) then
    exit(false);
  // false if the new lang is invalid, otherwise, silently skip the change

  if (Sourcelanguage <> s1) or (Destlanguage <> s2) then
  begin
    globalUIlockON(10);
    ClearSSTLoaderList(MainLoader);
    unloadCache;
    Sourcelanguage := s1;
    Destlanguage := s2;
    updateAddonFeedback;
    updateAllLoadersForCacheUpdate;
    prepareCacheList;
    loaderList.OnChange(loaderList);
    apiData.enabledAPIs;
    globalUIlockOFF(10);
  end;
end;



// --------------------------ImportOpts---------------------

function TForm1.openCompareOpt(var proc: tListSortCompare; var fProc, fProcVmad, fprocVmadTrans: tcompareproc; fallBack: boolean; Mode: integer; sTitle: string = ''): boolean;
begin
  form2.close;
  // security
  form12 := tform12.create(self);
  if sTitle <> '' then
    form12.caption := getRes(sTitle);
  form12.RadioGroup1.itemIndex := iCompareEspOpt[Mode];
  // mode 0= autotranslate ; mode=1 import
  form12.RadioGroup2.itemIndex := iApplySSTModeOpt;
  form12.CheckBox1.checked := bResetStateOpt;
  form12.CheckBox2.checked := bDontUseFilter;
  form12.CheckBox3.checked := bApplyTagOnly;
  // hack todo; fix this:
  if sTitle <> '' then
    form12.CheckBox3.visible := false;

  form12.showmodal;

  fProc := nil;
  fProcVmad := nil;
  proc := nil;
  if form12.ModalResult = mrOK then
  begin
    iCompareEspOpt[Mode] := form12.RadioGroup1.itemIndex;
    bDontUseFilter := form12.CheckBox2.checked;
    bApplyTagOnly := form12.CheckBox3.checked;
    iApplySSTModeOpt := form12.RadioGroup2.itemIndex;
    bResetStateOpt := form12.CheckBox1.checked;
    fProc := getfProcCompareOpt(bDontUseFilter, iCompareEspOpt[Mode]);
    fProcVmad := getfProcCompareOptVMAD(bDontUseFilter, iCompareEspOpt[Mode]);
    fprocVmadTrans := getfProcCompareOptVMADString(bDontUseFilter, iCompareEspOpt[Mode]);
    proc := getProcSortCompare(iApplySSTModeOpt, fallBack);
  end;
  form12.free;
  Result := assigned(fProc);
end;

function TForm1.openCompareOpt2(var fProc, fProcVmad, fprocVmadTrans: tcompareproc; Mode: integer; sTitle: string = ''): boolean;
begin
  form2.close;
  // security
  form6 := tform6.create(self);
  form6.RadioGroup1.itemIndex := iCompareEspOpt[Mode];
  form6.CheckBox1.checked := bDontUseFilter;
  form6.label1.visible := false;
  form6.ComboBox1.visible := false;

  if sTitle <> '' then
    form6.caption := getRes(sTitle);
  form6.showmodal;
  fProc := nil;
  if form6.ModalResult = mrOK then
  begin
    bDontUseFilter := form6.CheckBox1.checked;
    iCompareEspOpt[Mode] := form6.RadioGroup1.itemIndex;
    fProc := getfProcCompareOpt(bDontUseFilter, iCompareEspOpt[Mode]);
    fProcVmad := getfProcCompareOptVMAD(bDontUseFilter, iCompareEspOpt[Mode]);
    fprocVmadTrans := getfProcCompareOptVMADString(bDontUseFilter, iCompareEspOpt[Mode]);
  end;
  form6.free;
  Result := assigned(fProc);
  if not Result then
    forcedCodepage := '';
end;

function TForm1.openCompareOpt2(var forceCp: string; var fProc: tcompareproc; Mode: integer; sTitle: string = ''): boolean;
var
  codepage: rcodepage;
  defaultCp: string;
begin
  form2.close;
  // security
  codepage := getcodepage('_' + Destlanguage, codepageFiles, '', '');
  defaultCp := ansilowercase(codepage.s);

  form6 := tform6.create(self);
  form6.RadioGroup1.itemIndex := iCompareEspOpt[Mode];
  form6.CheckBox1.checked := bDontUseFilter;
  if sTitle <> '' then
    form6.caption := getRes(sTitle);
  // select cp
  SelectCodepage(form6.ComboBox1, defaultCp);
  form6.showmodal;
  fProc := nil;
  if form6.ModalResult = mrOK then
  begin
    bDontUseFilter := form6.CheckBox1.checked;
    iCompareEspOpt[Mode] := form6.RadioGroup1.itemIndex;
    fProc := getfProcCompareOpt(bDontUseFilter, iCompareEspOpt[Mode]);
    forceCp := form6.ComboBox1.items[form6.ComboBox1.itemIndex];
  end;
  form6.free;
  Result := assigned(fProc);
end;
// --------------XML-------------------------------

procedure TForm1.xmlSave1Click(Sender: TObject);
var
  filename: string;
  tmpAddon: string;
  fProc: tcompareproc;
  bExportFuz: boolean;
begin
  if not assigned(MainLoader) then
    exit;
  tmpAddon := MainLoader.getCleanAddonName(false);

  form2.close; // security
  formXMLOpt := tformXMLOpt.create(self);
  formXMLOpt.RadioGroup1.itemIndex := iXMLExportOpt;
  formXMLOpt.CheckBox1.visible := false;
  formXMLOpt.CheckBox2.visible := true;
  formXMLOpt.CheckBox2.checked := false;
  formXMLOpt.CheckBox2.Enabled := isFuzLoaded(MainLoader, fuz.current);
  bExportFuz := false;
  formXMLOpt.showmodal;
  fProc := nil;
  if formXMLOpt.ModalResult = mrOK then
  begin
    bExportFuz := formXMLOpt.CheckBox2.checked;
    iXMLExportOpt := formXMLOpt.RadioGroup1.itemIndex;
    case iXMLExportOpt of
      1: fProc := compareOptTranslatedAndValidated;
      2: fProc := compareOptSelection;
      3: fProc := compareSourceDestDiffandColab;
    else fProc := compareOptEverything;
    end;
  end;
  formXMLOpt.free;
  if not assigned(fProc) then
    exit;

  filename := SaveFileDialog(getRes('SaveCurrentXML'), Game_XMLFolder, format('%s_%s_%s', [tmpAddon, Sourcelanguage, Destlanguage]), getRes('FilterXML|*.XML'));
  if (filename = '') then
    exit;

  Game_XMLFolder := ExtractFilePath(filename);
  startStuff(formatres('ExportXMLRes', [tmpAddon]));
  XMLExportbase(format('%s.xml', [removefileext(filename, '.xml')]), MainLoader.addon_name, MainLoader.listArray, fProc, bExportFuz);
  stopStuff;
  dofeedback(getRes('XMLExported'), true, [askPanel]);
end;

procedure TForm1.zoom1Click(Sender: TObject);
var
  i, tag: integer;
begin
  TimerFontResize.Enabled := false;
  tag := TMenuItem(Sender).tag;
  if tag = 0 then
    virtualTreeFontsize[0] := defaultvirtualTreeFontSize
  else
    virtualTreeFontsize[0] := virtualTreeFontsize[0] + tag;
  for i := 0 to pred(VTtreeList.count) do
    InitFontTreeOpts(TBaseVirtualTree(VTtreeList[i]));
  TimerFontResize.Enabled := true;
end;

procedure TForm1.TimerFontResizeTimer(Sender: TObject);
begin
  TimerFontResize.Enabled := false;
  ComboBox1Change(nil);
end;

procedure TForm1.LoadCurrentXML1Click(Sender: TObject);
var
  filename: string;
  tmpAddon: string;
  fProc, fProcVmad, fprocVmadTrans: tcompareproc;
  proc: tListSortCompare;
begin
  if not assigned(MainLoader) then
    exit;
  form2.close;
  tmpAddon := MainLoader.getCleanAddonName(false);
  filename := OpenFileDialog(getRes('LoadCurrentXML'), Game_XMLFolder, format('%s_%s_%s.xml', [tmpAddon, Sourcelanguage, Destlanguage]), getRes('FilterXML|*.XML'));
  if (filename = '') then
    exit;
  if not FileExists(filename) then
  begin
    dofeedback(getRes('FileNotFound'), true);
    exit;
  end;
  Game_XMLFolder := ExtractFilePath(filename);

  if not openCompareOpt(proc, fProc, fProcVmad, fprocVmadTrans, false, 1, 'AskXMLImport') then
    exit;

  startStuff(formatres('ImportXMLRes', [tmpAddon]));
  XMLImportbase(filename, MainLoader.listArray, iApplySSTModeOpt, fProc, fProcVmad, fprocVmadTrans, bResetStateOpt);
  setTreeSortAndSort(0, 3);
  stopStuff;
end;

procedure TForm1.LoadCurrentXML2Click(Sender: TObject);
var
  filename: string;
  tmpAddon: string;
  fProc, fProcVmad, fprocVmadTrans: tcompareproc;
  proc: tListSortCompare;
begin

  if not assigned(MainLoader) then
    exit;
  form2.close;
  tmpAddon := MainLoader.getCleanAddonName(false);
  filename := OpenFileDialog(getRes('LoadCurrentXML'), Game_XMLFolder, format('%s.xml', [tmpAddon]), getRes('FilterXML|*.XML'));
  if (filename = '') then
    exit;
  if not FileExists(filename) then
  begin
    dofeedback(getRes('FileNotFound'), true);
    exit;
  end;
  Game_XMLFolder := ExtractFilePath(filename);
  iApplySSTModeOpt := 0;
  if not openCompareOpt(proc, fProc, fProcVmad, fprocVmadTrans, false, 1, 'AskXMLImport') then
    exit;

  startStuff(formatres('ImportXMLRes', [tmpAddon]));
  XMLImportbase_EspTranslator(filename, MainLoader.listArray, iApplySSTModeOpt, fProc, bResetStateOpt);
  setTreeSortAndSort(0, 3);
  stopStuff;
end;

// ----------------Mini Archive Browser ----------------------

function setBrowserFilter(const aString: array of string; var afilter: TStringArray): boolean;
var
  i: integer;
begin
  Result := false;
  if high(aString) >= 0 then
    SetLength(afilter, high(aString) + 1);
  for i := low(aString) to high(aString) do
    afilter[i] := aString[i];
end;

function TForm1.browseArchive(var bStream: TObject; const bsafile, fLabelParam: string; const aFolder, aExt: array of string; var filesToLoad: tstringlist; var discardPex: boolean;
  bAllowMulti: boolean = true): boolean;
Var
  Node: PVirtualNode;
  Data: ptreedataBrw;
begin
  Result := false;
  form2.close;
  // security
  createArchiveStream(bStream, bsafile);
  formBrowser := tformBrowser.create(self);
  try
    formBrowser.caption := formatres('Form_Browser', [fLabelParam]);
    formBrowser.bStream := bStream;
    formBrowser.bsafile := bsafile;
    if bAllowMulti then
      formBrowser.BrowserTree.TreeOptions.SelectionOptions := formBrowser.BrowserTree.TreeOptions.SelectionOptions + [toMultiSelect];
    setBrowserFilter(aFolder, formBrowser.aFolder);
    setBrowserFilter(aExt, formBrowser.aExt);
    formBrowser.showmodal;
    if formBrowser.bFilesFound and (formBrowser.ModalResult = mrOK) then
    begin
      discardPex := formBrowser.CheckBox1.checked;
      with formBrowser.BrowserTree do
      begin
        Node := GetFirst;
        while assigned(Node) do
        begin
          if Selected[Node] then
          begin
            Data := GetNodeData(Node);
            filesToLoad.add(Data.BasicND.filename); // items[i]
          end;
          Node := GetNext(Node);
        end;
      end;
      Result := filesToLoad.count > 0;
    end;
  finally
    formBrowser.free;
  end;
end;

// ------loadMCM   ------------------------------
procedure TForm1.loadMCMmenu1Click(Sender: TObject);
var
  filename: string;
begin
  filename := OpenFileDialog('', Game_TXTFolder, '', formatres('FilterTXT2%s|%s', [CustomTxtParams.sCustomExtList, CustomTxtParams.sCustomExtList]));
  if (filename = '') then
    exit;
  if not FileExists(filename) then
  begin
    dofeedback(getRes('FileNotFound'), true);
    exit;
  end;
  loadMCM(filename, false);
end;

procedure TForm1.loadMCM(filename: string; savefolder: boolean);
var
  Index: integer;
begin
  globalUIlockON(10, formatres('FbK_LoadingAddonMCM', [extractFileName(filename)]));
  UpdateLoaderSetting(MainLoader);
  ResetFocusedData;

  index := doloadMCM(filename, true);
  stopStuff;
  if index = -1 then
    index := loaderList.items.count - 1;
  loaderList.itemIndex := index;
  loaderList.OnChange(loaderList);
  bAutocloseWithWizard := false;
  globalUIlockOFF(10);
end;

function TForm1.doloadMCM(filename: string; savefolder: boolean): integer;
var
  currentloader: tTranslatorLoader;
  b: boolean;
  r: rFileData;
begin
  if isAlreadyLoaded(filename, Result) then
    exit;
  currentloader := tTranslatorLoader.create(filename, espTree);
  currentloader.loaderType := sLoaderTypeMcM;
  b := false;
  try
    try
      r := parseFileNameData(filename);
      currentloader.addon_folder := r.fPathSlash;
      currentloader.addon_Lang := r.fLang;
      currentloader.addon_Ext := r.fExt;
      currentloader.addon_name := r.fNameStrict;
      currentloader.addon_Fullpath := filename;
      updateStatus(currentloader.addon_name);
      b := loadAddonMCM(currentloader, currentloader.addon_folder, ansilowercase(currentloader.addon_name), currentloader.addon_Lang, currentloader.addon_Ext, currentloader.listArray[0], false);

    except
      On E: Exception do
        dofeedback(E.Message, true);
    end;

  finally
    if b then
    begin
      loaderList.items.AddObject(currentloader.getcaption, currentloader);
      currentloader.fLoaderMode := sTESVMcM;
      recentMenuUpdate(filename, 1);
      if savefolder then
        Game_TXTFolder := currentloader.addon_folder;
      dofeedback(currentloader.addon_name);
    end
    else
      currentloader.free;
  end;
end;

function TForm1.loadAddonMCMbsa(loader: tTranslatorLoader; bsa: string; baselist: tlist; bIsOnCompare, bGetAddondata: boolean): boolean;
var
  fs: tmemoryStream;
  buffer: tbytes;
  bStream: TObject;
  filesToLoad: tstringlist;
  fData: rFileData;
  discardPex: boolean;
begin
  Result := false;
  fs := tmemoryStream.create;
  bStream := nil;
  buffer := nil;
  try
    try
      filesToLoad := tstringlist.create;
      if browseArchive(bStream, bsa, 'Interface\*.TXT data', ['interface'], ['.txt'], filesToLoad, discardPex, false) then
      begin
        Application.ProcessMessages;

        fData := parseFileNameData(filesToLoad[0]);
        if bGetAddondata then
        begin
          loader.addon_folder := loader.addon_folder + fData.fPathSlash;
          loader.addon_name := fData.fNameStrict;
        end;
        getStringfromArchive(bStream, buffer, bsa, fData.fPath, fData.fName, fData.fExt, true);

        if length(buffer) > 0 then
        begin
          fs.WriteBuffer(buffer[0], length(buffer));
          fs.Position := 0;
          loader.lastestUsedCodepage := loader.McMData.parseMCM(fs, baselist, bIsOnCompare);
          Result := true;
        end
        else
          dofeedback(formatres('MCMnotFoundinBSA', [fData.fName]), true);
      end;
    except
      On E: Exception do
        dofeedback(E.Message, true);
    end
  finally
    freeStreamArchive(bStream);
    fs.free;
    filesToLoad.free;
  end;
end;

function TForm1.loadAddonMCM(loader: tTranslatorLoader; folder, filename, lang, ext: string; baselist: tlist; bIsOnCompare: boolean): boolean;
var
  // f: tstringlist;
  f: tmemoryStream;
begin
  Result := false;
  f := tmemoryStream.create;
  try
    try
      if lang <> '' then
        f.loadfromfile(format('%s%s_%s%s', [folder, filename, lang, ext]))
      else
        f.loadfromfile(format('%s%s%s', [folder, filename, ext]));
      loader.lastestUsedCodepage := loader.McMData.parseMCM(f, baselist, bIsOnCompare);
      Result := true;
    except
      On E: Exception do
        dofeedback(E.Message, true);
    end
  finally
    f.free;
  end;

end;

// mcmcompare
procedure TForm1.loadMCMCompare(filename: string);
var
  b: boolean;
  tmpExt: string;
  fProc, fProcVmad, fprocVmadTrans: tcompareproc;
  timeStop: dword;
  r: rFileData;
begin
  b := false;
  startStuff(formatres('FbK_LoadingAddonMCMCompare', [filename]));
  try
    try
      filename := ansilowercase(filename);
      tmpExt := extractFileExt(filename);
      if (tmpExt = '.bsa') or (tmpExt = '.ba2') then
      begin
        b := loadAddonMCMbsa(MainLoader, filename, LocalVocabBaseList, true, false);
      end
      else if CustomTxtParams.isValidTxtExt(tmpExt) then
      begin
        r := parseFileNameData(filename);
        b := loadAddonMCM(MainLoader, r.fPathSlash, r.fNameStrict, r.fLang, r.fExt, LocalVocabBaseList, true);
      end;

      if b then
      begin
        timeStop := GetTickCount;
        form2.close; // security
        Game_EspCompareFolder := ExtractFilePath(filename);
        if openCompareOpt2(fProc, fProcVmad, fprocVmadTrans, 1) then
          MainLoader.McMData.doCompareMCM(MainLoader.listArray[0], fProc);
        timedebut := timedebut + (GetTickCount - timeStop);
      end;
    except
      On E: Exception do
        dofeedback(E.Message, true);
    end;
  finally
    clearSkList(LocalVocabBaseList, true);
    stopStuff;
  end;
end;

// -----------------------ApplySST-----------------
procedure TForm1.applySst(loader: tTranslatorLoader);
var
  Data: ptreedatafdr;
  Node: PVirtualNode;
  t: tstringlist;
  fProc, fProcVmad, fprocVmadTrans: tcompareproc;
  proc: tListSortCompare;
var
  i: integer;
begin
  if not assigned(loader) then
    exit;
  t := tstringlist.create;
  try
    Node := VocabTree.GetFirst;
    while assigned(Node) do
    begin
      if (VocabTree.Selected[Node]) then
      begin
        Data := VocabTree.GetNodeData(Node);
        t.add(SSTUserFolder + getSSTFileName(Data.BasicND.s.name, 'sst'));
      end;
      Node := VocabTree.GetNext(Node);
    end;
    if (t.count > 0) and openCompareOpt(proc, fProc, fProcVmad, fprocVmadTrans, true, 1) then
    begin
      startStuff(getRes('Fbk_applySST'));
      for i := 0 to pred(t.count) do
        loader.doApplySst(t[i], proc, fProc, fProcVmad, fprocVmadTrans, bResetStateOpt, bApplyTagOnly, false);
      setTreeSortAndSort(3);
      VocabTree.Repaint;
      stopStuff;
    end;
  finally
    t.free;
  end;
end;

// --------Load BSA--------------------

procedure TForm1.LoadBSAClick(Sender: TObject);
var
  filename: string;
begin
  filename := OpenFileDialog('', Game_BSAFolder, '', getRes('FilterBSA|*.BSA; *.BA2'));
  if (filename = '') then
    exit;
  if not FileExists(filename) then
  begin
    dofeedback(getRes('FileNotFound'), true);
    exit;
  end;
  OpenBSA(filename, true);
end;

procedure TForm1.OpenBSA(filename: string; savefolder: boolean);
var
  bStream: TObject;
  filesToLoad: tstringlist;
  i, LoadedFiles, TotalFiles, Index: integer;
  discardPex: boolean;
  currentItemIndex: integer;
begin
  globalUIlockON(10, formatres('opening_BSA', [extractFileName(filename)]));
  UpdateLoaderSetting(MainLoader);
  ResetFocusedData;
  currentItemIndex := loaderList.itemIndex;
  loaderList.items.beginupdate;
  LoadedFiles := 0;
  TotalFiles := 0;
  filesToLoad := tstringlist.create;
  bStream := nil;
  try
    if browseArchive(bStream, filename, getRes('Archive_Content'), sFolderInArchiveAll, sExtInArchiveAll, filesToLoad, discardPex) then
    begin
      TotalFiles := filesToLoad.count;
      for i := 0 to pred(TotalFiles) do
      begin
        updateStatus(formatres('Fbk_loading_Multi', [(divide(i, filesToLoad.count) * 100)]));
        if OpenFileFromBSA(filename, filesToLoad[i], bStream, discardPex, index) then
          inc(LoadedFiles)
      end;
      if savefolder then
        Game_BSAFolder := ExtractFilePath(filename);
    end;
    recentMenuUpdate(filename, 5);

  finally
    freeStreamArchive(bStream);
    filesToLoad.free;
    loaderList.items.endupdate;
    stopStuff;
    if LoadedFiles > 0 then
    begin
      loaderList.itemIndex := loaderList.items.count - 1;
      bAutocloseWithWizard := false;
    end
    else
      loaderList.itemIndex := currentItemIndex;
    loaderList.OnChange(loaderList);

    globalUIlockOFF(10);
    if (LoadedFiles <> TotalFiles) and (TotalFiles > 0) then
      askDialog(formatres('noFileFromBSA', [TotalFiles - LoadedFiles, TotalFiles]), Form1, 2, true, [askOK])
  end;
end;

function TForm1.OpenFileFromBSA(filename, filetoload: string; var bStream: TObject; discardPex: boolean; var Index: integer): boolean;
var
  currentloader: tTranslatorLoader;
  fstream: tmemoryStream;
  fData: rFileData;
  tmpFilename: string;
  buffer: tbytes;
  b: boolean;
  languageTmp: string;
begin
  fData := parseFileNameData(filetoload);
  tmpFilename := fData.fPathSlash + fData.fName + fData.fExt;
  if isAlreadyLoadedBSA(filename, tmpFilename, index) then
    exit(true);

  Result := false;
  currentloader := nil;
  buffer := nil;
  if not getStringfromArchive(bStream, buffer, filename, fData.fPath, fData.fName, fData.fExt, true) or (length(buffer) = 0) then
    exit;

  Application.ProcessMessages;
  fstream := tmemoryStream.create;
  try
    fstream.WriteBuffer(buffer[0], length(buffer));

    currentloader := tTranslatorLoader.create(tmpFilename, espTree);
    currentloader.addon_BSApath := filename;
    currentloader.addon_Fullpath := filename;

    currentloader.addon_folder := ExtractFilePath(currentloader.addon_Fullpath) + fData.fPathSlash;
    currentloader.addon_name := fData.fName + fData.fExt;
    currentloader.addon_nameinBSA := fData.fPathSlash + currentloader.addon_name;

    if fData.fExt = '.pex' then
    begin
      currentloader.loaderType := sloaderTypePex;
      b := currentloader.PexDecompiler.readPex(fstream, discardPex);
      // set true to discard noAuthString Pex
      if b then
      begin
        currentloader.getPexString(ToolButton40.down);
        currentloader.fLoaderMode := sTESVPex;
        loaderList.items.AddObject(currentloader.getcaption, currentloader);
        SavePexFiletoTmp(fstream, bUseExternalDecompiler, extractFileName(currentloader.addon_name));
        Result := true;
      end;
    end
    else if fData.fExt = '.txt' then
    begin
      currentloader.addon_name := fData.fNameStrict;
      currentloader.loaderType := sLoaderTypeMcM;
      currentloader.addon_Lang := fData.fLang;
      currentloader.lastestUsedCodepage := currentloader.McMData.parseMCM(fstream, currentloader.listArray[0], false);
      if currentloader.listArray[0].count > 0 then
      begin
        currentloader.fLoaderMode := sTESVMcM;
        loaderList.items.AddObject(currentloader.getcaption, currentloader);
        Result := true;
      end;
    end
    else if fData.fExt = '.strings' then
    begin
      currentloader.addon_name := fData.fNameStrict;
      currentloader.loaderType := sLoaderTypeStr;
      languageTmp := fData.fLang;
      b := loadAddonStringsDirect(currentloader, bStream, currentloader.addon_BSApath, fData.fPath, currentloader.addon_name, languageTmp, CreateNodeAddon, bforceCpOnLoad, false, nil, false);
      if b then
      begin
        currentloader.fLoaderMode := sTESVStrings;
        loaderList.items.AddObject(currentloader.getcaption, currentloader);
        Result := true;
      end;
    end;

  finally
    if not Result and assigned(currentloader) then
      currentloader.free;
    fstream.free;
  end;
end;

// ---LOAD PEX----------------------------
procedure TForm1.LoadScriptPex1Click(Sender: TObject);
var
  filenames: tstringlist;
begin
  filenames := tstringlist.create;
  try
    if OpenFileDialogMulti('', Game_PexFolder, '', pexFilter, filenames) then
      startLoadsMultiPex(filenames);
  finally
    filenames.free;
  end;
end;

procedure TForm1.startLoadsMultiPex(filenames: tstringlist);
var
  i, Index: integer;
begin
  if (askDialog(getRes('Ask_pexDisclaimerb'), Form1, 1, true, [askYes, askNo]) = mrNo) then
    exit;
  globalUIlockON(10, getRes('Fbk_LoadPex'));
  UpdateLoaderSetting(MainLoader);
  ResetFocusedData;
  for i := 0 to pred(filenames.count) do
    if FileExists(filenames[i]) then
      doloadpex(filenames[i], true, index);
  stopStuff;

  loaderList.itemIndex := loaderList.items.count - 1;
  loaderList.OnChange(loaderList);
  bAutocloseWithWizard := false;
  globalUIlockOFF(10);
end;

procedure TForm1.loadpex(filename: string; savefolder: boolean);
var
  Index: integer;
begin
  if (askDialog(getRes('Ask_pexDisclaimerb'), Form1, 1, true, [askYes, askNo]) = mrNo) then
    exit;
  globalUIlockON(10, getRes('Fbk_LoadPex'));
  UpdateLoaderSetting(MainLoader);
  ResetFocusedData;

  doloadpex(filename, true, index);
  stopStuff;
  if index = -1 then
    index := loaderList.items.count - 1;
  loaderList.itemIndex := index;
  loaderList.OnChange(loaderList);
  globalUIlockOFF(10);
end;

function TForm1.doloadpex(filename: string; savefolder: boolean; var Index: integer): boolean;
var
  currentloader: tTranslatorLoader;
  r: rFileData;
begin
  Result := false;
  if isAlreadyLoaded(filename, index) then
    exit;
  currentloader := tTranslatorLoader.create(filename, espTree);
  currentloader.loaderType := sloaderTypePex;

  r := parseFileNameData(filename);
  currentloader.addon_folder := r.fPathSlash;
  currentloader.addon_Lang := Sourcelanguage;
  currentloader.addon_name := r.fName + r.fExt;
  currentloader.addon_Fullpath := filename;
  updateStatus(currentloader.addon_name);
  Result := currentloader.openPex;
  if Result then
  begin
    currentloader.getPexString(ToolButton40.down);
    loaderList.items.AddObject(currentloader.getcaption, currentloader);
    currentloader.fLoaderMode := sTESVPex;
    // change silent
    recentMenuUpdate(filename, 2);
    if savefolder then
      Game_PexFolder := currentloader.addon_folder;
  end
  else
    currentloader.free;
end;

// --------BSA--/Savepex------------------

function TForm1.generateBsaExportAskMulti(bsaPath: string; var output: string): integer;
var
  i: integer;
  l: tTranslatorLoader;
begin
  Result := 0;
  output := '';
  for i := 0 to pred(loaderList.items.count) do
  begin
    l := tTranslatorLoader(loaderList.items.Objects[i]);
    if l.testForValidBSAExport(bsaPath) then
    begin
      inc(Result);
      output := output + (l.addon_name) + '<br>';
      if Result > BSAExportFdbLineLimit then
      begin
        output := output + '[...]<br>';
        exit;
      end;
    end;
  end;
end;

procedure TForm1.InjectInBSA(loader: tTranslatorLoader; multi: boolean);
var
  tlistInject: tstringlist;
  i: integer;
begin
  tlistInject := tstringlist.create;
  tlistInject.sorted := true;
  try
    if multi then
      InjectInBSAMulti(loader, tlistInject)
    else
      loader.savePex(loader.addon_nameinBSA, tlistInject);
    // -----------finalyze
    if tlistInject.count > 0 then
      doPrepareInjectInBSA(loader, tlistInject)
    else
      dofeedback(formatres('Error_Dup_Bsa2:%s', [loader.addon_BSApath]), true, [askOK]);
  finally
    for i := 0 to pred(tlistInject.count) do
      tmemoryStream(tlistInject.Objects[i]).clear;
    tlistInject.free;
  end;
end;

procedure TForm1.InjectInBSAMulti(loader: tTranslatorLoader; tlistInject: tstringlist);
var
  i: integer;
  l: tTranslatorLoader;
begin
  for i := 0 to pred(loaderList.items.count) do
  begin
    l := tTranslatorLoader(loaderList.items.Objects[i]);
    if l.testForValidBSAExport(loader.addon_BSApath) then
      InjectInBSAMultiEx(l, tlistInject);
  end;
end;

procedure TForm1.InjectInBSAMultiEx(loader: tTranslatorLoader; tlistInject: tstringlist);
var
  Index: integer;
begin
  // -----security, should not happen.----->
  if tlistInject.find(loader.addon_nameinBSA, index) then
  begin
    dofeedback(formatres('Error_Dup_Bsa1:%s', [loader.addon_nameinBSA]), true, [askOK]);
    exit;
  end;
  // <--------------------------------------
  loader.savePex(loader.addon_nameinBSA, tlistInject);
end;

function TForm1.generateBsaExportFeedback(tlistInject: tstringlist): string;
var
  i: integer;
begin
  Result := '';
  for i := 0 to pred(tlistInject.count) do
  begin
    Result := Result + extractFileName(tlistInject[i]) + '<br>';
    if i > BSAExportFdbLineLimit then
    begin
      Result := Result + '[...]<br>';
      exit;
    end;
  end;
end;

procedure TForm1.doPrepareInjectInBSA(loader: tTranslatorLoader; tlistInject: tstringlist);
var
  tmpBsaName: string;
  bInject: boolean;
begin
  tmpBsaName := appendDatetoName(loader.addon_BSApath, 'tmp_');

  bInject := doInjectInBSA(loader.addon_BSApath, tmpBsaName, tlistInject);

  if bInject then
  begin
    Application.ProcessMessages;
    // NameReplace
    if RenameFile(loader.addon_BSApath, appendDatetoName(loader.addon_BSApath, 'bak_')) and RenameFile(tmpBsaName, loader.addon_BSApath) then
      dofeedback(formatres('fbk_ExportInBsa', [generateBsaExportFeedback(tlistInject), extractFileName(loader.addon_BSApath)]), true, [askOK])
    else
      dofeedback(formatres('fbk_ExportInBsaRenameError', [generateBsaExportFeedback(tlistInject), extractFileName(loader.addon_BSApath)]), true, [askOK])
  end
  else
    dofeedback(formatres('fbk_ExportInBsaError', [generateBsaExportFeedback(tlistInject), extractFileName(loader.addon_BSApath)]), true, [askOK]);
end;

function TForm1.doInjectInBSA(bsafile, bsaFileTmp: string; tlistInject: tstringlist): boolean;
var
  bStream: TObject;
begin
  bStream := nil;
  try
    if lowercase(extractFileExt(bsafile)) = '.ba2' then
      Result := injectFileInBa2(TwbBA2File(bStream), bsafile, bsaFileTmp, tlistInject)
    else
      Result := injectFileInBSA(TwbBSAFile(bStream), bsafile, bsaFileTmp, tlistInject);
  finally
    freeStreamArchive(bStream);
  end;
end;

/// ----search in pex
procedure TForm1.dosearchinPexText(opt: TSynSearchOptions);
var
  syn: TSynEdit;
begin
  TimerSearchPex.Enabled := false;
  if trim(ButtonedEdit3.Text) = '' then
    exit;
  if PageControlPex.ActivePageIndex = 0 then
    syn := SynEditPex
  else
    syn := SynEditScript;

  if syn.searchReplace(ButtonedEdit3.Text, '', opt) = 0 then
  begin
    if ssoBackwards in opt then
      syn.BlockEnd := syn.BlockBegin
    else
      syn.BlockBegin := syn.BlockEnd;
    syn.CaretXY := syn.BlockBegin;
    ButtonedEdit3.Color := $00CCCCFF;
  end
  else
    ButtonedEdit3.Color := gradient(clWhite);
end;

// --------------------Tools OLDDIALSTYLE ----------------------------
function TForm1.getDnamInfoData(loader: tTranslatorLoader; dnamref: cardinal; var n: string; var bNeedMaster: boolean): boolean;
var
  r: trecord;
  i: integer;
  f: tfield;
begin
  Result := false;
  if (dnamref = 0) then
    exit;

  r := loader.espLoader.getFastRecord(dnamref, headerINFO, bNeedMaster);
  if assigned(r) then
  begin
    for i := 0 to r.fList.count - 1 do
    begin
      f := r.fList[i];
      if f.Header.name = headerNAM1 then
      begin
        if assigned(f.sk) then
        begin
          n := tskystr(f.sk).s;
          exit(true);
        end;
      end;
    end;
  end
end;

function TForm1.assignDialogNAM(loader: tTranslatorLoader; r: trecord; fProc: tcompareproc; sl: tstringlist; fstring: string; skipmax, adjust: integer; doAll, keepChange, aliasCopy, copyall: boolean;
  var bNeedMaster: boolean): integer;
var
  f: tfield;
  i, j: integer;
  nam1string: string;
  doReplace, checkAlias: boolean;
  jumpDnam: cardinal;
  tmpwarn: sStrInternalParams;
  sName, sValue: string;
begin
  if copyall then
    aliasCopy := false;
  Result := 0;
  nam1string := '';
  tmpwarn := [];
  jumpDnam := 0;

  for i := 0 to r.fList.count - 1 do
  begin
    f := r.fList[i];
    if f.Header.name = headerNAM1 then
    begin
      if assigned(f.sk) then
        nam1string := tskystr(f.sk).s
      else
        nam1string := '';
      continue;
    end;

    if f.Header.name = headerDNAM then
    begin
      move(f.buffer[0], jumpDnam, SizeOf(cardinal));
      jumpDnam := loader.espLoader.setFormIdMapping(r, jumpDnam);
    end;

    if f.Header.name = headerRNAM then
    begin
      doReplace := true;

      if (nam1string = '') then
        if getDnamInfoData(loader, jumpDnam, nam1string, bNeedMaster) then
          tmpwarn := [Warning]; // get DNAM dialogs

      if assigned(f.sk) then
      Begin
        if not fProc(f.sk) then
          doReplace := false;
        if (nam1string = '') then
          doReplace := false;

        checkAlias := bHasAliasStrict in tskystr(f.sk).sinternalparams;
        if not doAll and checkAlias then
          doReplace := false;

        if (toLocalizedSharedID in tskystr(f.sk).sinternalparams) then
          doReplace := false;

        if doReplace then
        begin
          for j := 0 to sl.count - 1 do
          begin
            sName := trim(sl.names[j]);
            sValue := trim(sl.ValueFromIndex[j]);
            if sName = '' then
              sName := sl[j];
            if sValue = '' then
              sValue := sName;

            if sName = trim(tskystr(f.sk).s) then
            begin
              nam1string := replaceDIALPattern(fstring, sValue, nam1string, '%PREFIXE%', '%DIAL%');
              break;
            end;
          end;

          if copyall or (checkAlias and aliasCopy) then
            nam1string := replaceDIALPattern(fstring, tskystr(f.sk).s, nam1string, '%PREFIXE%', '%DIAL%');

          if (adjust = 1) then
            if (length(nam1string) > skipmax) then
              doReplace := false;;
          if (adjust = 2) and (not checkAlias) then
            nam1string := shortenStringInternal(nam1string, skipmax);
        end;

        // assign string;
        if doReplace then
        begin
          tskystr(f.sk).strans := nam1string;
          tskystr(f.sk).resetStatus([validated]);
          tskystr(f.sk).sinternalparams := tskystr(f.sk).sinternalparams + tmpwarn;
          inc(Result);
        end
        else if not keepChange then
          tskystr(f.sk).strans := tskystr(f.sk).s; // restaure original string
      end;
      nam1string := '';
    end;
  end;
  if Result > 1 then
    dofeedback(getRes('OldDial_Multi'));
end;

procedure TForm1.OldDialogStyle1Click(Sender: TObject);
begin
  doOldDialogStyle(MainLoader);
end;

procedure TForm1.doOldDialogStyle(loader: tTranslatorLoader);
var
  Node: PVirtualNode;
  gruplvl: cardinal;
  DataEsp: pespdata;
  totalCount, skipmax, adjust, i, idOpt: integer;
  sl: tstringlist;
  strtmp, tmpFile: string;
  fProc: tcompareproc;
  bNeedMaster: boolean;
begin
  if not assigned(MainLoader) then
    exit;
  totalCount := 0;
  bNeedMaster := false;
  sl := tstringlist.create;
  form2.close;
  FormKeyWord.close;
  // security
  form9 := tform9.create(self);
  try
    // misc prefixe
    ForceDirectories(mainpath + miscPath);
    tmpFile := mainpath + miscPath + oldDialogStyle_ + Destlanguage + sTxtExt;
    if authFileAccess(tmpFile) then
      form9.memo1.lines.loadfromfile(tmpFile);

    form9.Edit2.Text := oldDial_Format;
    form9.Button1.Enabled := TESVTSameLanguage;
    form9.showmodal;
    if form9.ModalResult = mrOK then
    begin
      oldDial_Format := form9.Edit2.Text;
      if form9.CheckBox3.checked then
        for i := 0 to form9.memo1.lines.count - 1 do
        begin
          strtmp := trim(form9.memo1.lines[i]);
          if strtmp <> '' then
            sl.add(strtmp);
        end;
      skipmax := form9.UpDown1.Position;
      adjust := form9.RadioGroup2.itemIndex;

      idOpt := form9.RadioGroup1.itemIndex;
      case idOpt of
        1: fProc := compareOptPartialOnly;
        2: fProc := compareOptSelection;
      else fProc := compareOptEverything;
      end;

      // get top node for all master
      loader.buildEspInheritedData;
      // process
      startStuff('OldDial_Replacing');
      if assigned(loader.espLoader.masterNode) then
      begin
        gruplvl := espTree.GetNodeLevel(loader.espLoader.masterNode);
        Node := loader.espLoader.getFirstNode;
        pbar := 0;
        // get DIAL Count
        while assigned(Node) and (espTree.GetNodeLevel(Node) > gruplvl) do
        begin
          Node := espTree.GetNext(Node);
          inc(pbar);
        end;
        ProgressBar.max := pbar;
        pbar := 0;

        Node := loader.espLoader.getFirstNode;
        while assigned(Node) and (espTree.GetNodeLevel(Node) > gruplvl) do
        begin
          DataEsp := espTree.GetNodeData(Node);
          if (DataEsp.BasicND.p.sType = sRecord) and (DataEsp.BasicND.p.Header.name = headerINFO) then
            totalCount := totalCount + assignDialogNAM(loader, trecord(DataEsp.BasicND.p), fProc, sl, oldDial_Format, skipmax, adjust, form9.CheckBox1.checked, form9.CheckBox2.checked,
              form9.CheckBox4.checked, form9.CheckBox5.checked, bNeedMaster);
          Node := espTree.GetNext(Node);
          updatepBar(500);
        end;
        searchIntree;
        form9.memo1.lines.SaveToFile(tmpFile, TEncoding.UTF8);
      end;
      stopStuff;
      dofeedback(formatres('OldDial_Replaced', [totalCount]), true);
      if bNeedMaster then
        dofeedback(formatres('OldDial_NeedMaster%s', [loader.getFormattedMasterList]), true);
    end;
  finally
    form9.free;
    sl.free;
  end;
end;

// ----------RecStruct----
procedure TForm1.ShowRecStruct(r: trecord);
var
  i, j: integer;
  memo: tstrings;
  f: tfield;
  strtmp: string;
begin
  if not assigned(r) then
    exit;
  form10 := tform10.create(self);
  memo := form10.memo1.lines;
  memo.add(r.getStringName);

  memo.add('flags : ' + inttohex(r.headerData.flags, 8));
  memo.add('FormId: ' + inttohex(r.headerData.formID, 8));
  memo.add('Vers  : ' + inttohex(r.headerData.version, 8));
  for i := 0 to r.fList.count - 1 do
  begin
    f := r.fList[i];
    memo.add(format('%s (%d)', [string(f.Header.name), f.Header.dsize]));
    strtmp := '';

    for j := 0 to min(length(f.buffer) - 1, 1024) do
      strtmp := strtmp + format('%.2x:', [f.buffer[j]]);
    if strtmp <> '' then
      memo.add(strtmp);
  end;
  form10.showmodal;
  form10.free;
end;

procedure TForm1.ShowRecStruct1Click(Sender: TObject);
var
  Data: pespdata;
  Node: PVirtualNode;
begin
  Node := espTree.focusedNode;
  if not assigned(Node) then
    exit;
  Data := espTree.GetNodeData(Node);
  if Data.BasicND.p.sType = sRecord then
    ShowRecStruct(trecord(Data.BasicND.p));
end;

procedure TForm1.ShowRecStruct2Click(Sender: TObject);
var
  sk: tskystr;
begin
  sk := getFocusedString(currentEditedTree);
  if assigned(sk) then
    ShowRecStruct(trecord(sk.esp.rec));
end;

// ------------TCSC------
procedure TForm1.ConvertTCSC1Click(Sender: TObject);
begin
  ConvertTCSC(MainLoader, true);
end;

procedure TForm1.ConvertSCTC1Click(Sender: TObject);
begin
  ConvertTCSC(MainLoader, false);
end;

procedure TForm1.ConvertTCSC(loader: tTranslatorLoader; Mode: boolean);
var
  sl: tstringlist;
begin
  startStuff(getRes('Converting...'));
  ProgressBar.max := getTotalVocabCount(loader.listArray);
  sl := loadStringList(mainpath + miscPath + 'Charset_SCTC.txt', false);
  if sl.count > 1 then
  begin
    TCSCList := tlist.create;
    if buildTCSCList(TCSCList, sl[0], sl[1]) then
      doConvertTCSC(loader.listArray, Mode, TCSCList);
    clearTCSCList(TCSCList);
    TCSCList.free
  end;
  sl.free;
  stopStuff;
end;

procedure TForm1.ConvertRTL(loader: tTranslatorLoader; Index, linesize: integer; bResize, bRemovetag: boolean);
var
  i, k: integer;
  tmpStr: string;
  sk: tskystr;
begin
  startStuff(getRes('Converting...'));
  ProgressBar.max := getTotalVocabCount(loader.listArray);

  for k := 0 to 2 do
    for i := 0 to loader.listArray[k].count - 1 do
    begin

      sk := loader.listArray[k][i];
      if sk.lockedStatus then
        continue;

      tmpStr := sk.strans;

      tmpStr := ReverseRTLString(tmpStr, Index, linesize, bResize, bRemovetag);
      // tmpStr := addRTLTag(tmpStr);
      if tmpStr <> sk.strans then
        sk.resetStatus([incompleteTrans]);
      sk.strans := tmpStr;

      updatepBar(1000);
    end;

  stopStuff;
end;

// compareStrings Tool

procedure TForm1.TagDiff1Click(Sender: TObject);
begin
  CompareStringsSD(MainLoader, compareSourceDestDiff);
end;

procedure TForm1.TagNoTrans1Click(Sender: TObject);
begin
  if not assigned(MainLoader) then
    exit;
  startStuff(getRes('TagNoTrans'));
  tagNoTranslationStrings(MainLoader, false);
  setTreeSortAndSort(3);
  searchIntree;
  stopStuff;
end;

procedure TForm1.TagSame1Click(Sender: TObject);
begin
  CompareStringsSD(MainLoader, compareSourceDestEqual);
end;

procedure TForm1.CompareStringsSD(loader: tTranslatorLoader; fProc: tcompareproc);
var
  j: integer;
begin
  startStuff(getRes('ComparingStrings'));
  for j := 0 to 2 do
  begin
    CompareStringsSDEx(loader.listArray[j], fProc);
    setTreeSortAndSort(j, 3);
  end;
  stopStuff;
end;

procedure TForm1.CompareStringsSDEx(dlist: tlist; fProc: tcompareproc);
var
  i: integer;
  sk1: tskystr;
begin
  for i := 0 to dlist.count - 1 do
  begin
    sk1 := dlist.items[i];
    if (sk1.sparams * [translated, validated] <> []) and fProc(sk1) then
      sk1.resetStatus([incompleteTrans]);
  end;
end;
// ----------------------------

procedure TForm1.Experimental1Click(Sender: TObject);
var
  j: integer;
begin
  form2.close;
  ClearHeuristicData(true);
  if bBiDiBase = bdLeftToRight then
    bBiDiBase := bdRightToLeft
  else
    bBiDiBase := bdLeftToRight;
  InitBIDITreeOpts(form2.searchTree, bBiDiBase);
  InitBIDITreeOpts(form2.espRecordtree, bBiDiBase);
  InitBIDITreeOpts(form2.DialogTree, bBiDiBase);
  InitBIDITreeOpts(LDtree, bBiDiBase);
  for j := 0 to 2 do
    InitBIDITreeOpts(treearray[j], bBiDiBase);
  repaintTrees;
end;

/// -------------------------

procedure TForm1.SetOptions11Click(Sender: TObject);
begin
  OpenOptions(1);
end;

procedure TForm1.SetOptions12Click(Sender: TObject);
begin
  OpenOptions(0);
end;

procedure TForm1.SetOptions31Click(Sender: TObject);
begin
  OpenOptions(2);
end;

procedure TForm1.setoption32Click(Sender: TObject);
begin
  OpenOptions(3);
end;

procedure TForm1.SelectionFixNumberMatch1Click(Sender: TObject);
begin
  FixValue(MainLoader, currentEditedTree, 1);
end;

// ------Copy Paste-----------------

procedure TForm1.SelectionCopierClick(Sender: TObject);
begin
  CopyStringFocus(currentEditedTree)
end;

procedure TForm1.SelectionCollerClick(Sender: TObject);
begin
  PasteStringSelection(MainLoader, currentEditedTree);
end;

// ------------global spellcheck------------------

procedure TForm1.gbSpellCheck1Click(Sender: TObject);
begin
  if (Spcheck.spellCheckType = 1) or (askDialog(getRes('WarningMSApi'), Form1, [askOK, askNo]) = mrOK) then
    globalSpellCheck(MainLoader);
end;

procedure TForm1.globalSpellCheck(loader: tTranslatorLoader);
var
  j: integer;
begin
  if not bUseSpellCheck or not Spcheck.Active then
    exit;
  startStuff(getRes('gbSpellCheck'));
  ProgressBar.max := getTotalVocabCount(loader.listArray);
  pbar := 0;
  for j := 0 to 2 do
  begin
    if CancelStuff then
      break;;
    globalSpellCheckEx(loader.listArray[j]);
    setTreeSortAndSort(j, 3);
  end;
  stopStuff;
end;

procedure TForm1.globalSpellCheckEx(dlist: tlist);
var
  i: integer;
  sk1: tskystr;
begin
  for i := 0 to dlist.count - 1 do
  begin
    updatepBar(pBarFrequencies);
    if CancelStuff then
      exit;
    sk1 := dlist.items[i];
    if sk1.lockedStatus then
      continue;
    if Spcheck.analyzeText(sk1.strans, false) then
      include(sk1.sinternalparams, asSpellCheckFault)
    else
      exclude(sk1.sinternalparams, asSpellCheckFault);
  end;
end;

// ==================BuildCache V2==============================
procedure TForm1.LaunchBuildAdvancedCache(cacheList: tstringlist; bAuthBsa: boolean);
var
  i: integer;
  filename, filenameFinal: string;
begin
  startStuff('');

  updateStatus(getRes('Fbk_BuildingCache'));
  for i := 0 to cacheList.count - 1 do
  begin
    filenameFinal := '';
    filename := Game_CacheDataFolder + cacheList[i] + '.esm';
    if authFileAccess(filename) then
      filenameFinal := filename;
    filename := Game_CacheDataFolder + cacheList[i] + '.esl';
    if (filenameFinal = '') and authFileAccess(filename) then
      filenameFinal := filename;
    filename := Game_CacheDataFolder + cacheList[i] + '.esp';
    if (filenameFinal = '') and authFileAccess(filename) then
      filenameFinal := filename;

    if filenameFinal <> '' then
      buildCacheFromEsp(filenameFinal, bAuthBsa)
    else
      dofeedback(formatres('fbk_FileAccessError%s', [Game_CacheDataFolder + cacheList[i]]), true)
  end;
  stopStuff;
end;

procedure TForm1.buildCacheFromEsp(filename: string; bAuthBsa: boolean);
var
  loader: tTranslatorLoader;
  tmpName: string;
  tmpRessource: string;
begin
  loader := nil;
  try
    loader := loadLocalizedEspCache(filename, bAuthBsa);
    if not assigned(loader) then
      exit;
    tmpRessource := loader.getCleanAddonName(true);
    tmpName := getSSTFileName(tmpRessource, 'sst');
    if SaveSSTFile(SSTUserFolder + tmpName, loader.listArray, compareOptEverything, 0, nil, nil, loader.getmasterList) then
      dofeedback(formatres('Fbk_Saved', [tmpName]));
  finally
    loader.free;
  end;
end;

function TForm1.loadLocalizedEspCache(filename: string; bAuthBsa: boolean): tTranslatorLoader;
var
  currentloader: tTranslatorLoader;
  espstats: rEspStats;
  b, bLoadedFromCache: boolean;
  lookupfailed, sharedIdMaster, sharedIdTarget: integer;
  addon_nametmp, sFileToLoad: string;
  bOpt: integer;
begin
  b := false;
  currentloader := tTranslatorLoader.create(filename, espTree, false);
  try
    currentloader.loaderType := sLoaderTypeEsp;
    lookupfailed := 0;
    sharedIdMaster := 0;
    currentloader.addon_Fullpath := filename;
    currentloader.addon_folder := ExtractFilePath(currentloader.addon_Fullpath);
    currentloader.addon_name := extractFileName(currentloader.addon_Fullpath);
    currentloader.addon_Lang := Sourcelanguage;
    updateStatus(currentloader.addon_name);

    bOpt := 1;

    // cache
    sFileToLoad := currentloader.OpenCacheProcess(bLoadedFromCache);

    b := currentloader.espLoader.openesp(sFileToLoad, currentloader.addon_Fullpath, 1, false, false, false);
    if b then
    begin
      espstats := currentloader.GetLocalizedEspStrings;
      currentloader.espLoader.GetMastersData(currentloader.addon_name);
      currentloader.espLoader.ValidGrupString(not bForceKeepAllRecAndField);
      // sort tree o handle stringID fast association
      sortListArray(currentloader.listArray, compareStrIdLow);
      // update addonname related to strings
      currentloader.addon_Fullpath := currentloader.addon_Fullpath + GAME_STRINGS_SUBFOLDER;
      currentloader.addon_folder := currentloader.addon_folder + GAME_STRINGS_SUBFOLDER;
      currentloader.addon_name := removefileext(currentloader.addon_name);
      addon_nametmp := currentloader.addon_name;
    end;
    if b then
    begin
      b := loadAddonStrings(currentloader, currentloader.addon_folder, ansilowercase(addon_nametmp), Sourcelanguage, idMatchSourceBuildVocab, bforceCpOnLoad, bOpt, bAuthBsa, nil, true);
      b := b and loadAddonStrings(currentloader, currentloader.addon_folder, ansilowercase(addon_nametmp), Destlanguage, idMatchTransVocab, bforceCpOnSave, bOpt, bAuthBsa, compareOptEverything, true);
    end;
  finally
    if not b then
    begin
      dofeedback(formatres('Fbk_FailCache%s', [currentloader.addon_name]), true);
      freeandNil(currentloader);
    end
    else
    begin
      currentloader.cleanUplocalizedUnused(lookupfailed, sharedIdMaster, sharedIdTarget, bLocalizedVerboseWarning);
      currentloader.fLoaderMode := sTESVEspStrings;

      // ----------------
      saveCacheLocalizedEsp(currentloader, bLoadedFromCache);
    end;
    Result := currentloader;
  end;
end;

// ----------GetFUZ-----------------------------------

procedure TForm1.ListBox1DblClick(Sender: TObject);
begin
  ToolButton30Click(nil);
end;

procedure TForm1.ListBox1DrawItem(Control: TWinControl; Index: integer; Rect: TRect; State: TOwnerDrawState);
begin
  if assigned(TListBox(Control).items.Objects[index]) then
  begin
    if TListBox(Control).items.Objects[index] = TListBox(Control).items then
      ListBoxDrawItem(Control, Index, Rect, State, ListBox1.Color, ImageList1, 67)
    else
      ListBoxDrawItem(Control, Index, Rect, State, ListBox1.Color, ImageList1, 62)
  end
  else
    ListBoxDrawItem(Control, Index, Rect, State, ListBox1.Color, ImageList1, 72);
end;

procedure TForm1.ListBox2DblClick(Sender: TObject);
begin
  if (ListBox2.itemIndex >= 0) and assigned(trecord(ListBox2.items.Objects[ListBox2.itemIndex])) then
    form2.updateStringFromQuest(nil, cardinal(ListBox2.items.Objects[ListBox2.itemIndex]));
end;

procedure TForm1.ListBox2DrawItem(Control: TWinControl; Index: integer; Rect: TRect; State: TOwnerDrawState);
begin
  ListBoxDrawItem(Control, Index, Rect, State, ListBox2.Color, ImageList1, 75)
end;

procedure TForm1.ListBox3DrawItem(Control: TWinControl; Index: integer; Rect: TRect; State: TOwnerDrawState);
begin
  ListBoxDrawItem(Control, Index, Rect, State, ListBox3.Color, ImageList1, 59);
end;

procedure TForm1.ListBox3KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key in [VK_DOWN, VK_UP] then
    if ToolButton26.down then
      launchSearchTimer;
end;

procedure TForm1.ListBox3MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
var
  Pt: TPoint;
begin
  Pt.X := X;
  Pt.Y := Y;
  if (Button = mbRight) or (TListBox(Sender).ItemAtPos(Pt, true) = -1) then
    TListBox(Sender).ClearSelection;
  if ToolButton26.down then
    launchSearchTimer;
end;

procedure TForm1.ListBox4DrawItem(Control: TWinControl; Index: integer; Rect: TRect; State: TOwnerDrawState);
begin
  ListBoxDrawItem(Control, Index, Rect, State, ListBox4.Color, ImageList1, 72);
end;

procedure TForm1.ListBox4MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
var
  Pt: TPoint;
begin
  Pt.X := X;
  Pt.Y := Y;
  if (Button = mbRight) or (TListBox(Sender).ItemAtPos(Pt, true) = -1) then
    TListBox(Sender).ClearSelection;
  if ToolButton48.down then
    launchSearchTimer;
end;

procedure TForm1.Load1Click(Sender: TObject);
var
  filename: string;
begin
  if (askDialog(getRes('Ask_WarningStringsDeprecated'), Form1, [askYes, askNo]) = mrNo) then
    exit;

  filename := OpenFileDialog('', Game_StringFolder, '', getRes('FilterStr|*.STRINGS'));
  if (filename = '') then
    exit;
  if not FileExists(filename) then
  begin
    dofeedback(getRes('FileNotFound'), true);
    exit;
  end;
  loadStrings(filename, true);
end;

procedure TForm1.ToolButton34Click(Sender: TObject);
begin
  if (ListBox1.items.count > 0) then
    copyFuztoClipBoard(ilSkyTree, ilSkyTree.focusedNode, ListBox1.items);
end;

procedure TForm1.ToolButton30Click(Sender: TObject);
var
  i: integer;
  tmpIndex: integer;
begin
  cleanFuzTmpFile;
  if ListBox1.items.count = 0 then
    exit;

  if (ListBox1.itemIndex < 0) then
    tmpIndex := 0
  else
    tmpIndex := ListBox1.itemIndex;

  if not assigned(ListBox1.items.Objects[tmpIndex]) then
  begin
    tmpIndex := -1;
    for i := 0 to pred(ListBox1.items.count) do
      if assigned(ListBox1.items.Objects[i]) then
      begin
        tmpIndex := i;
        break;
      end;
  end;

  ListBox1.itemIndex := tmpIndex;
  if ListBox1.itemIndex = -1 then
    exit
  else
  begin
    if isFuzLoaded(MainLoader, fuz.current) then
      loadFuzSound(tfuzExport(ListBox1.items.Objects[ListBox1.itemIndex]));
  end;
end;

function TForm1.loadFuzSound(tf: tfuzExport): boolean;
var
  bStream: TObject;
  buffer: tbytes;
  process: cardinal;
begin
  Result := false;
  if pos(tf.inExt, aFUZEXT[0]) = 0 then
    exit;
  buffer := nil;
  bStream := nil;
  startStuff('', false);
  try
    try
      ForceDirectories(tmpFuzPath);
      if (tf.inExt = aFUZEXTPLAY) then
      begin
        if tf.bsaId < 0 then
          getFuzFromFile(IncludeTrailingPathDelimiter(Game_FuzDataFolder + tf.inFolder), tf.inFilename + tf.inExt)
        else
        begin
          getfastFilefromArchive(bStream, buffer, Game_FuzDataFolder + fuz.BsaList[tf.bsaId], tf.Index, tf.indexfd);
          getFuzFromBuffer(buffer);
        end;
        Application.ProcessMessages;

        if RunExecutable(toolPath + fuzConvert1, [tmpFuzPath + fuzTMPXMW, tmpFuzPath + fuzTMPWAV], tmpFuzPath, true, process) and authFileAccessRW(tmpFuzPath + fuzTMPWAV) then
        begin
          Result := true;
          PlaySound(PChar(tmpFuzPath + fuzTMPWAV), 0, SND_ASYNC);
        end;
      end
      else if (tf.inExt = aXMWEXTPLAY) then
      begin
        if tf.bsaId < 0 then
          getXmwFromFile(IncludeTrailingPathDelimiter(Game_FuzDataFolder + tf.inFolder), tf.inFilename + tf.inExt)
        else
        begin
          getfastFilefromArchive(bStream, buffer, Game_FuzDataFolder + fuz.BsaList[tf.bsaId], tf.Index, tf.indexfd);
          getXmvFromBuffer(buffer);
        end;
        Application.ProcessMessages;

        // need to cut this in debugmode, because the external call crashes the debugger
        if RunExecutable(toolPath + fuzConvert1, [tmpFuzPath + fuzTMPXMW, tmpFuzPath + fuzTMPWAV], tmpFuzPath, true, process) and authFileAccessRW(tmpFuzPath + fuzTMPWAV) then
        begin
          Result := true;
          PlaySound(PChar(tmpFuzPath + fuzTMPWAV), 0, SND_ASYNC);
        end;

      end

      else if (tf.inExt = aWEMEXTPLAY) then
      begin
        if tf.bsaId < 0 then
          getWemFromFile(IncludeTrailingPathDelimiter(Game_FuzDataFolder + tf.inFolder), tf.inFilename + tf.inExt)
        else
        begin
          getfastFilefromArchive(bStream, buffer, Game_FuzDataFolder + fuz.BsaList[tf.bsaId], tf.Index, tf.indexfd);
          getWemFromBuffer(buffer);
        end;
        Application.ProcessMessages;

        // need to cut this in debugmode, because the external call crashes the debugger
        if RunExecutable(toolPath + fuzConvert2, ['-o', tmpFuzPath + fuzTMPWAV, tmpFuzPath + fuzTMPWEM], tmpFuzPath, true, process) and authFileAccessRW(tmpFuzPath + fuzTMPWAV) then
        begin
          Result := true;
          PlaySound(PChar(tmpFuzPath + fuzTMPWAV), 0, SND_ASYNC);
        end;
      end

      else if tf.inExt = aWAVEXTPLAY then
      begin
        if tf.bsaId < 0 then
          PlaySound(PChar(IncludeTrailingPathDelimiter(Game_FuzDataFolder + tf.inFolder) + tf.inFilename + tf.inExt), 0, SND_ASYNC)
        else
        begin
          getfastFilefromArchive(bStream, buffer, Game_FuzDataFolder + fuz.BsaList[tf.bsaId], tf.Index, tf.indexfd);
          sndPlaySound(PChar(buffer), (SND_ASYNC or SND_MEMORY));
        end;
      end;
    except
      On E: Exception do
        dofeedback(E.Message, true);
    end;
  finally
    freeStreamArchive(bStream);
    stopStuff(true, false);
  end;
end;

procedure QuickfuzAudit;
var
  i: integer;
  sk: tskystr;
  rInfo: rDialInfo;
begin
  if isFuzLoaded(MainLoader, fuz.current) then
    for i := 0 to pred(MainLoader.listArray[2].count) do
    begin
      sk := MainLoader.listArray[2][i];
      exclude(sk.sinternalparams, fuzWarning);
      rInfo := sk.GetResponseInfo;
      if not fuz.getFromRec(rInfo) then
        include(sk.sinternalparams, fuzWarning);
      finalize(rInfo);
    end;
end;

procedure prepareFuzList(bsafile: string; bsaIndex: integer);
var
  bStream: TObject;
begin
  bStream := nil;
  try
    createArchiveStream(bStream, bsafile);
    getFuzListfromArchive(bStream, bsafile, fuz.List, fuzLooseFolder, bsaIndex);
  finally
    freeStreamArchive(bStream);
  end;
end;

procedure TForm1.clearFuzUI(resetSearchBut: boolean = true);
begin
  // clear UI stuff
  Edit1.Text := '';
  ListBox1.clear;
  ListBox3.clear;
  // if resetSearchBut then
  // ToolButton26.Down:= false;   //need investigation
  form2.ComboBox1.clear;
  form2.Edit4.Text := '';
  form2.ComboBox1.Color := gradient(clWhite);
end;

procedure TForm1.clearNPCUI(resetSearchBut: boolean = true);
begin
  // clear UI stuff
  Edit1.Text := '';
  ListBox1.clear;
  ListBox4.clear;
  // if resetSearchBut then
  // ToolButton48.Down:= false; //need investigation
  form2.ListBox3.clear;
end;

function TForm1.generateFuzMap: boolean;
var
  i: integer;
begin
  if not isFuzCompatible(MainLoader) or not isFuzRequired(MainLoader, fuz.current) then
    exit(false);
  clearFuzUI(false);
  fuz.clear;
  fuz.current := MainLoader.uGuid;
  updateStatus(formatres('fbk_fuzmap2%s', [MainLoader.addon_name]));
  getFuzFromLooseFiles(fuz.List);
  FindVoiceBSAEx(MainLoader.espLoader.mastersData, Game_FuzDataFolder, fuz.BsaList);
  for i := 0 to pred(fuz.BsaList.count) do
  begin
    prepareFuzList(Game_FuzDataFolder + fuz.BsaList[i], i);
    dofeedback('fuz Master: ' + fuz.BsaList[i]);
  end;
  fuz.sanitize(MainLoader.espLoader.mastersData);
  fuz.cleanUnused(MainLoader.listArray);
  fuz.buildVoiceType;
  fuz.drawVoiceList(ListBox3.items, ButtonedEdit6.Text);
  QuickfuzAudit;
  Result := true;
end;

procedure TForm1.copyFuztoClipBoard(tree: TVirtualStringTree; Node: PVirtualNode; t: tstrings);
var
  Data: ptreedata;
begin
  if assigned(Node) then
  begin
    Data := tree.GetNodeData(Node);
    if Data.BasicND.s.esp.fName = headerNAM1 then
      Clipboard.AsText := strSeparatorCRLF + Data.BasicND.s.getEspRef + sstLineBreak + strSeparatorCRLF + Data.BasicND.s.s + sstLineBreak + strSeparatorCRLF + Data.BasicND.s.strans + sstLineBreak +
        strSeparatorCRLF + t.Text + strSeparatorCRLF;
  end;
end;

// ==========================   API array Translation ================

procedure TForm1.StartApiTranslationArray(btransOnSel, bAutoNoTransTag, bForceshowUI: boolean; iAutoApiNumber: integer = -1);
var
  sk: tskystr;
  chrCount, strCount, i, j: integer;
  ApiId: integer;
  bApplyNoTrans, bNormalize: boolean;
  fProc: tcompareproc;
begin
  if (not assigned(MainLoader)) then
    exit;

  MainLoader.excludeInternalParam([OnTranslationApiArray .. OnTranslationApiArray_block2]);
  MainLoader.resetNormalizedHash;

  // countchar total firstpass
  if btransOnSel then
    fProc := compareOptSelectionExLocked
  else
    fProc := compareOptNoTransAndPartialsExLocked;

  chrCount := 0;
  strCount := 0;
  for j := 0 to 2 do
    for i := 0 to pred(MainLoader.listArray[j].count) do
    begin
      sk := MainLoader.listArray[j][i];
      if fProc(sk) then
      begin
        include(sk.sinternalparams, OnTranslationApiArray_PreSelection);
        chrCount := chrCount + apiData.getCharCountForApi(sk.s);
        inc(strCount);
      end;
    end;
  // end;

  if (chrCount = 0) and not bForceshowUI then
    exit;

  bApplyNoTrans := bAutoNoTransTag;
  ApiId := iAutoApiNumber;
  bNormalize := true;
  if iAutoApiNumber = -1 then
  begin
    Form25 := tform25.create(self);
    try
      Form25.label1.caption := format(getRes('Lbl_TranslationArray%d%d'), [strCount, chrCount]);
      if Form25.showmodal = mrOK then
        if (Form25.ComboBox1.itemIndex >= 0) then
        begin
          ApiId := integer(Form25.ComboBox1.items.Objects[Form25.ComboBox1.itemIndex]);
          bApplyNoTrans := bApplyNoTrans or Form25.CheckBox1.checked;
          bNormalize := Form25.CheckBox2.checked;
        end;
    finally
      Form25.free;
    end;
  end;

  if (inrange(ApiId, low(aApiBaseArrayFunc), high(aApiBaseArrayFunc))) and (chrCount > 0) then
  begin
    if bApplyNoTrans then
      tagNoTranslationStrings(MainLoader, true);
    StartApiTranslationArrayEx(ApiId, aApiBaseArrayFunc[ApiId], bNormalize);
  end
end;

procedure TForm1.StartApiTranslationArrayEx(iApiNumber: integer; proc: tapiBaseTranslationArray; bNormalize: boolean);
var
  sk, sk2: tskystr;
  l: tstringlist;
  apiCharmax, apiArraymax, chrCount, chrCountTmp, chrcountQuota, i, j, k: integer;
  iTranslated: integer;
  lToTranslate: tlist;
  sourceCharCount, totalCharCount: integer;
  iNotTranslatedCount: integer;
  charCountQuotaPerMinute: integer;
  bStringTooLong: boolean;
  fProc: tListSortCompare;
  apiTimeQuota, apiTimeLoop, iWaitTime: cardinal;
  iNormalizeError, iAuthBlock: integer;
  errorArray, errorRetry, errorTime: integer;

  function authCheckNextBlock: integer;
  var
    j: integer;
  begin
    Result := 0;
    for j := 0 to lToTranslate.count - 1 do
      if (OnTranslationApiArray in tskystr(lToTranslate[j]).sinternalparams) then
        inc(Result);
  end;

  function getNormalizedSource(tmpsk: tskystr): string;
  begin
    if bNormalize then
      Result := tmpsk.sNormalized
    else
      Result := tmpsk.s;
  end;

const
  timeMinute = 60000;
begin
  if not assigned(proc) then
    exit;
  apiData.enabledAPIs;
  if not apiData.apiEnabled[iApiNumber] then
    exit;

  ilastUsedApiArray := iApiNumber;
  openlog;
  startStuff(apiData.Urldata.Values[aApiBaseName[iApiNumber] + 'Label']);
  chrCount := 0;
  bStringTooLong := false;

  charCountQuotaPerMinute := apiData.aApiBaseNameMaxCharPerMin[iApiNumber];
  apiCharmax := apiData.aApiMaxCharsLimit[iApiNumber];
  apiArraymax := apiData.aApiMaxArraysLimit[iApiNumber];
  l := tstringlist.create;
  l.duplicates := dupIgnore;
  lToTranslate := tlist.create;

  if bNormalize then
    fProc := compareHashAndSourceNormalized
  else
    fProc := compareHashAndSource;

  for j := 0 to 2 do
    for i := 0 to pred(MainLoader.listArray[j].count) do
    begin
      sk := MainLoader.listArray[j][i];
      if sk.sinternalparams * [OnTranslationApiArray_PreSelection, OnTranslationSoftLock] = [OnTranslationApiArray_PreSelection] then
      begin
        sourceCharCount := apiData.getCharCountForApi(getNormalizedSource(sk));
        if (sourceCharCount < apiCharmax) then
        begin
          chrCount := chrCount + sourceCharCount;
          lToTranslate.add(sk);
          include(sk.sinternalparams, OnTranslationApiArray);

          if isApiFakeArray(iApiNumber) then
          begin
            if isStringMultiLines(getNormalizedSource(sk)) then
            begin
              if isAuthForArray(getNormalizedSource(sk)) then
                include(sk.sinternalparams, OnTranslationCRLFArray)
              else
                include(sk.sinternalparams, OnTranslationApiArray_block2);
            end;
          end;

        end
        else
          bStringTooLong := true;
      end;
    end;

  if bStringTooLong then
    dofeedback(getRes('Fbk_ApiStringTooLong'), true, [askPanel]);

  ProgressBar.max := lToTranslate.count;
  ProgressBar.Position := 0;
  ProgressBar.Repaint;

  lToTranslate.Sort(fProc);
  apiTimeQuota := 0;
  totalCharCount := 0;

  errorArray := 0;
  errorRetry := 0;
  errorTime := 0;

  chrcountQuota := 0;
  if (chrCount > 0) then
    repeat
    begin
      apiTimeLoop := GetTickCount;
      l.clear;
      l.sorted := true;
      iTranslated := 0;
      chrCount := 0;
      // handle regulararray
      for i := 0 to lToTranslate.count - 1 do
      begin
        sk := lToTranslate[i];
        if sk.sinternalparams * [OnTranslationApiArray, OnTranslationApiArray_block2] = [OnTranslationApiArray] then
        begin
          chrCountTmp := apiData.getCharCountForApi(getNormalizedSource(sk));
          if (chrcountQuota >= charCountQuotaPerMinute) then
            break;
          if (chrCountTmp + chrCount > apiCharmax) then
            continue
          else
          begin
            chrCount := chrCount + chrCountTmp;
            chrcountQuota := chrcountQuota + chrCountTmp;
            l.AddObject(clearCRLF(getNormalizedSource(sk), OnTranslationCRLFArray in sk.sinternalparams), TObject(sk));
            if (l.count >= apiArraymax) then
              break;
          end;
        end;
      end;

      // handle virtualarray 1 string only
      if l.count = 0 then
        for i := 0 to lToTranslate.count - 1 do
        begin
          sk := lToTranslate[i];
          if (OnTranslationApiArray_block2 in sk.sinternalparams) then
          begin
            chrCount := apiData.getCharCountForApi(getNormalizedSource(sk));
            chrcountQuota := chrcountQuota + chrCount;
            l.AddObject(getNormalizedSource(sk), TObject(sk));
            break;
          end
        end;

      totalCharCount := totalCharCount + chrCount;
      l.sorted := false;
      iNormalizeError := 0;
      RandomizeListOrder(l);
      dofeedback(format('%sAPI call strings:%d charCount:%d', [aApiBaseName[iApiNumber], l.count, chrCount]));
      if l.count > 0 then
        iTranslated := proc(l);
      if iTranslated = 1 then
      begin
        for i := 0 to pred(l.count) do
        begin
          sk := tskystr(l.Objects[i]);
          if not sk.restoreNormalized(restoreCRLF(l[i]), not bNormalize) then
          begin
            if bApiTranslationVerbose then
              dofeedback(formatres('fbk_ApiReturnError%s%s', [sk.s, l[i]]));
            inc(iNormalizeError);
            inc(errorRetry);
            sk.updateNormalizedSourceForRetry;
            if not(OnTranslationRetry in sk.sinternalparams) then
              include(sk.sinternalparams, OnTranslationRetry)
            else
              sk.sinternalparams := sk.sinternalparams - [OnTranslationApiArray .. OnTranslationApiArray_block2] + [OnTranslationRetry];
            continue;
          end;

          sk.sinternalparams := sk.sinternalparams - [OnTranslationApiArray .. OnTranslationApiArray_block2];
          if sk.resetStatus([incompleteTrans]) then
            setuserCacheUpdated(MainLoader, cacheLoaded);
          // update all similarstrings in translate list
          if (not(OnTranslationRetry in sk.sinternalparams)) and FastListSearch(lToTranslate, fProc, sk, k, true) then
            for j := k to lToTranslate.count - 1 do
            begin
              sk2 := tskystr(lToTranslate[j]);
              if (fProc(sk, sk2) = 0) then
              begin
                if (OnTranslationApiArray in sk2.sinternalparams) then
                begin
                  sk2.restoreNormalized(restoreCRLF(l[i]), not bNormalize);
                  sk2.sinternalparams := sk2.sinternalparams - [OnTranslationApiArray .. OnTranslationApiArray_block2];
                  sk2.resetStatus([incompleteTrans]);
                end;
              end
              else
                break;
            end;
        end;
      end
      else if iTranslated = -1 then // google fakeArray nomatch
      begin
        inc(errorArray);
        for i := 0 to pred(l.count) do
        begin
          sk := tskystr(l.Objects[i]);
          if OnTranslationApiArray_block1 in sk.sinternalparams then
            include(sk.sinternalparams, OnTranslationApiArray_block2)
          else
            include(sk.sinternalparams, OnTranslationApiArray_block1);
        end;
      end;

      if iNormalizeError > 0 then
        dofeedback(formatres('fbk_ApiReturnErrorGlobal%d', [iNormalizeError]));
      iNotTranslatedCount := 0;
      // statistiques
      for i := 0 to lToTranslate.count - 1 do
        if (tskystr(lToTranslate[i]).sinternalparams * [OnTranslationApiArray, OnTranslationSoftLock] = [OnTranslationApiArray]) or (OnTranslationRetry in tskystr(lToTranslate[i]).sinternalparams)
        then
          inc(iNotTranslatedCount);
      dofeedback(formatres('fbk_apiStats2%d%d%d%%%d', [iNotTranslatedCount, lToTranslate.count, round((iNotTranslatedCount / lToTranslate.count) * 100), totalCharCount]));

      translatorMeter;
      repaintTrees;

      apiTimeLoop := (GetTickCount - apiTimeLoop) + cardinal(apiData.aApiBaseNameArraySleep[iApiNumber]);
      apiTimeQuota := apiTimeQuota + apiTimeLoop;

      iAuthBlock := authCheckNextBlock;

      if iAuthBlock > 0 then
      begin
        if (chrcountQuota >= charCountQuotaPerMinute) or (apiTimeQuota > timeMinute) then
        begin
          iWaitTime := max(timeMinute - apiTimeQuota, apiData.aApiBaseNameArraySleep[iApiNumber]);
          apiTimeQuota := 0;
          chrcountQuota := 0;
        end
        else
          iWaitTime := apiData.aApiBaseNameArraySleep[iApiNumber];

        // secure iWaitTime can't exceed 60s
        if iWaitTime > timeMinute then
        begin
          iWaitTime := timeMinute;
          inc(errorTime);
        end;

        dofeedback(formatres('fbk_WaitForNextCall%ds', [iWaitTime div 1000]));
        dofeedback(strSeparator);

        updatepBar(1, ProgressBar.max - iAuthBlock, false);

        for i := 0 to (iWaitTime div 1000) - 1 do
        begin
          updateStatus(IntToStr(integer(iWaitTime div 1000) - i) + 's');
          sleep(1000);
          Application.ProcessMessages;
          if CancelStuff then
            break;
        end;
      end
      else
        break;

      if CancelStuff then
      begin
        dofeedback(getRes('fbk_operationStopped'), true, [askPanel]);
        break;
      end;

    end;
    until iTranslated = 0;

  // -----------------------
  dofeedback(strSeparator);
  dofeedback(formatres('Fbk_ApiTranslationCompleted%s%d', [aApiBaseName[iApiNumber], totalCharCount]), true, [askPanel]);
  if errorArray > 0 then
    dofeedback('-- Array errors: ' + IntToStr(errorArray));
  if errorRetry > 0 then
    dofeedback('-- Translation match errors: ' + IntToStr(errorRetry));
  if errorTime > 0 then
    dofeedback('-- Timer error: ' + IntToStr(errorTime));

  MainLoader.excludeInternalParam([OnTranslationApiArray .. OnTranslationApiArray_block2]);
  l.free;
  lToTranslate.free;
  stopStuff;
  if currentEditedTree.canfocus then
    currentEditedTree.setFocus;
end;

procedure TForm1.ApiTransMenuClick(Sender: TObject);
begin
  StartApiTranslationArray(false, false, true, -1);
end;

procedure TForm1.ArrayTranslatorApi_2Click(Sender: TObject);
begin
  StartApiTranslationArray(true, false, false, -1);
end;

// -ImportDialData
procedure QuickNpcAudit;
var
  i: integer;
  sk: tskystr;
  rInfo: rDialInfo;
begin
  if assigned(mainDialdata) then
    for i := 0 to pred(MainLoader.listArray[2].count) do
    begin
      sk := MainLoader.listArray[2][i];
      exclude(sk.sinternalparams, npcWarning);
      rInfo := sk.GetResponseInfo;
      if not mainDialdata.getNpcForDial(rInfo) then
        include(sk.sinternalparams, npcWarning);
      finalize(rInfo);
    end;
end;

procedure TForm1.ListBox4KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key in [VK_DOWN, VK_UP] then
    if ToolButton48.down then
      launchSearchTimer;
end;

procedure TForm1.ToolButton50Click(Sender: TObject);
begin
  startStuff('');
  generateNpcMap(true);
  stopStuff;
end;

function TForm1.generateNpcMap(forced: boolean): boolean;
begin
  if forced or isNPCRequired(MainLoader) then
  begin
    freeandNil(mainDialdata);
    clearNPCUI(false);
  end
  else
    exit(false);
  if not assigned(MainLoader) or (MainLoader.loaderType <> sLoaderTypeEsp) then
    exit(false);
  updateStatus(formatres('fbk_NPCmap%s', [MainLoader.addon_name]));
  mainDialdata := TImportDial.create;
  mainDialdata.current := MainLoader.uGuid;
  mainDialdata.generateNpcMap(MainLoader);
  mainDialdata.fillList(ListBox4.items, ButtonedEdit6.Text);
  QuickNpcAudit;
  Result := true;
end;

procedure TForm1.ToolButton54Click(Sender: TObject);
begin
  if assigned(MainLoader) then
  begin
    MainLoader.bQuestListbuilt := false;
    MainLoader.drawQuestsList(ButtonedEdit4.Text, ListBox2, true);
  end;
end;

procedure TForm1.ToolButton55MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
begin
  if assigned(MainLoader) and assigned(MainLoader.espLoader) then
    MainLoader.espLoader.buildInheritedData(false);
  showAdvSearch;
end;

procedure TForm1.ToolButton56Click(Sender: TObject);
begin
  if assigned(MainLoader) then
  begin
    MainLoader.FilteredRecord := 0;
    ToolButton56.Enabled := false;
    searchIntree;
  end;
end;

procedure TForm1.ToolButton58Click(Sender: TObject);
begin
  searchIntree;
end;

procedure TForm1.ToolButton59bClick(Sender: TObject);
begin
  if assigned(MainLoader) then
  begin
    MainLoader.bUseVMAD := ToolButton59.down;
    searchIntree;
  end;
end;

procedure TForm1.showAdvSearch;
begin
  if ToolButton55.down then
  begin
    AdvSearchForm.show;
    ButtonedEdit1.Enabled := false;
  end
  else
    AdvSearchForm.close;
  launchSearchTimer;
end;

procedure TForm1.ToolButton47Click(Sender: TObject);
begin
  if assigned(mainDialdata) then
  begin
    freeandNil(mainDialdata);
    clearNPCUI;
    launchSearchTimer;
  end;
end;

procedure TForm1.ToolButton48MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
begin
  launchSearchTimer;
end;

procedure TForm1.ToolButton49Click(Sender: TObject);
begin
  StartApiTranslationArray(false, false, true, -1);
end;

// Reverse SST--------------------
procedure TForm1.menueditsst1Click(Sender: TObject);
var
  Node: PVirtualNode;
  Data: ptreedatafdr;
  Index: integer;
begin
  index := -1;
  globalUIlockON(10, getRes('Fbk_LoadCustom'));
  UpdateLoaderSetting(MainLoader);
  ResetFocusedData;
  Node := VocabTree.GetFirst;
  while assigned(Node) do
  begin
    if VocabTree.Selected[Node] then
    begin
      Data := VocabTree.GetNodeData(Node);
      if (fdrUser in Data.BasicND.s.fparams) then
        index := loadCacheSSTStringsEx(Data.BasicND.s.name, sTESVTsstEdit);
    end;
    Node := VocabTree.GetNext(Node);
  end;
  stopStuff;

  if index = -1 then
    index := loaderList.items.count - 1;
  loaderList.itemIndex := index;
  loaderList.OnChange(loaderList);
  globalUIlockOFF(10);
end;

procedure TForm1.menuReverseSST1Click(Sender: TObject);
var
  Node: PVirtualNode;
  Data: ptreedatafdr;
begin
  startStuff(getRes('Fbk_LoadCustom'));
  Node := VocabTree.GetFirst;
  while assigned(Node) do
  begin
    if VocabTree.Selected[Node] then
    begin
      Data := VocabTree.GetNodeData(Node);
      if (fdrUser in Data.BasicND.s.fparams) then
        ReverseSST(Data.BasicND.s.name);
    end;
    Node := VocabTree.GetNext(Node);
  end;
  stopStuff;
end;

procedure TForm1.ReverseSST(filename: string);
var
  c: integer;
  fullPath: string;
  tmpName: string;
  i, j: integer;
  sk: tskystr;
  tmpAlist: tAlist;
  tmpSource: string;
  masterList: tstringlist;
begin
  for i := 0 to 2 do
    tmpAlist[i] := tlist.create;
  masterList := tstringlist.create;
  fullPath := SSTUserFolder + getSSTFileName(filename, 'sst');
  try
    // -----------------
    if FileExists(fullPath) and loadSstEdit(tmpAlist, fullPath, c, [lockedTrans, incompleteTrans], [translated], false, nil, masterList) then
    begin
      // reverse data
      for i := 0 to 2 do
        for j := 0 to pred(tmpAlist[i].count) do
        begin
          sk := tmpAlist[i][j];
          tmpSource := sk.s;
          sk.s := sk.strans;
          sk.strans := tmpSource;
          sk.colabID := 0;
        end;

      tmpName := getReverseSSTFileName(filename, 'sst');
      if (sstBackupCount > 0) and (FileExists(SSTUserFolder + tmpName)) then
        backupSst(tmpName);
      cleanBackupSst(sstBackupCount, SSTUserFolderBackup, tmpName);
      if SaveSSTFile(SSTUserFolder + tmpName, tmpAlist, compareOptTranslatedAndValidated, 0, nil, nil, masterList) then
        dofeedback(formatres('Fbk_Saved', [tmpName]), true, [askPanel])
      else
        dofeedback(formatres('Fbk_SavedError', [tmpName]), true);
    end;
  finally
    ClearArrayList(tmpAlist, true, true);
    masterList.free;
  end;
end;

procedure TForm1.RtlToLtr1Click(Sender: TObject);
var
  sk: tskystr;
  modalR: integer;
begin
  form2.close; // security
  FormRtl := tFormRtl.create(self);
  try
    sk := getFocusedString(currentEditedTree);
    if assigned(sk) then
      FormRtl.memo1.lines.Text := sk.strans;
    FormRtl.CheckBox2.checked := bRtlRemoveControl;
    FormRtl.RadioGroup1.itemIndex := iRtlMethod;
    FormRtl.TrackBar1.Position := iRtlLineSize;
    modalR := FormRtl.showmodal;
    bRtlRemoveControl := FormRtl.CheckBox2.checked;
    iRtlMethod := FormRtl.RadioGroup1.itemIndex;
    bUseLineSize := FormRtl.TrackBar1.Position < FormRtl.TrackBar1.max;
    iRtlLineSize := FormRtl.TrackBar1.Position;
    if modalR = mrOK then
      ConvertRTL(MainLoader, iRtlMethod, iRtlLineSize, bUseLineSize, bRtlRemoveControl);
  finally
    FormRtl.free;
  end;
end;

// -------UsageAuditdebug------------

procedure TForm1.derived1Click(Sender: TObject);
begin
  startStuff(getRes('DerivedStringsGen'));
  updateDerivedStrings;
  stopStuff;
end;

function CurrentMemoryUsage: cardinal;
var
  pmc: TProcessMemoryCounters;
begin
  pmc.cb := SizeOf(pmc);
  if GetProcessMemoryInfo(GetCurrentProcess, @pmc, SizeOf(pmc)) then
    Result := pmc.WorkingSetSize
  else
    Result := 0;
end;

procedure TForm1.UsageAudit;
var
  Data: pespdata;
  i, j, k: integer;
  m: tTranslatorLoader;
  loaderStringsCount: cardinal;
  loaderStringsSize: cardinal;
  vocabStringsSize: cardinal;
  undototal: cardinal;
  undototalSize: cardinal;
  sk: tskystr;
  u: tUndoData;
  tmpMemory, totalMemory, espMemory: cardinal;
  Node: PVirtualNode;
begin
  startStuff('');
  loaderStringsCount := 0;
  undototal := 0;
  loaderStringsSize := 0;
  vocabStringsSize := 0;
  undototalSize := 0;
  totalMemory := 0;
  espMemory := 0;
  for i := 0 to pred(loaderList.items.count) do
  begin
    m := tTranslatorLoader(loaderList.items.Objects[i]);
    undototal := undototal + retCardinal(m.undolist.count);

    if m.loaderType = sLoaderTypeEsp then
    begin
      espMemory := espMemory + retCardinal(m.espLoader.FastRecList.count) * 4;
      espMemory := espMemory + m.espLoader.SizeOfrefrList;
    end;

    for k := 0 to pred(m.undolist.count) do
    begin
      u := m.undolist[k];
      undototalSize := undototalSize + retCardinal(length(u.strans) * 2 + tUndoData.InstanceSize + 4);
    end;

    for j := 0 to 2 do
    begin
      loaderStringsCount := loaderStringsCount + retCardinal(m.listArray[j].count);
      for k := 0 to pred(m.listArray[j].count) do
      begin
        sk := m.listArray[j][k];
        loaderStringsSize := loaderStringsSize + sk.getsize + 4;
        if MainLoader = m then
          loaderStringsSize := loaderStringsSize + 48 + 8; // treeArray
      end;
    end;
  end;

  ProgressBar.max := vocabEdidList.count;
  pbar := 0;

  for i := 0 to pred(vocabBaselist.count) do
  begin
    sk := vocabBaselist[i];
    vocabStringsSize := vocabStringsSize + sk.getsize + 4;
    updatepBar(1000);
  end;

  tmpMemory := espMemory;
  Node := espTree.GetFirst;
  while assigned(Node) do
  begin
    Data := espTree.GetNodeData(Node);
    case Data.BasicND.p.sType of
      sRecord: tmpMemory := tmpMemory + trecord(Data.BasicND.p).getsize + 4;
      sGrup: tmpMemory := tmpMemory + tgrup(Data.BasicND.p).getsize + 4;
    end;
    tmpMemory := tmpMemory + 48 + 8;
    // size of pnode in tree + adress in tree (tespData + @p);
    Node := espTree.GetNext(Node);
  end;
  totalMemory := totalMemory + tmpMemory;

  dofeedback(strSeparator);
  dofeedback('Memory Data Usage (note: This only takes in account the classes content)');
  dofeedback(strSeparator);
  dofeedback('Total computed esp Data: ' + inttostrShort(tmpMemory));
  dofeedback(strSeparator);
  tmpMemory := loaderStringsSize;
  totalMemory := totalMemory + tmpMemory;
  dofeedback('Total Strings (All mods): ' + IntToStr(loaderStringsCount) + ' - Memory: ' + inttostrShort(tmpMemory));
  tmpMemory := undototalSize;
  totalMemory := totalMemory + tmpMemory;
  dofeedback('Total Undo (All mods): ' + IntToStr(undototal) + ' - Memory: ' + inttostrShort(tmpMemory));
  tmpMemory := vocabStringsSize;
  totalMemory := totalMemory + tmpMemory;
  dofeedback('Total VocabStrings: ' + IntToStr(vocabBaselist.count) + ' - Memory: ' + inttostrShort(tmpMemory));
  tmpMemory := vocabEdidList.count * (tEspStrRef.InstanceSize + 4);
  totalMemory := totalMemory + tmpMemory;
  dofeedback('Total VocabStrings (Edid List): ' + IntToStr(vocabEdidList.count) + ' - Memory: ' + inttostrShort(tmpMemory));
  tmpMemory := HeuristicList.count * 4;
  totalMemory := totalMemory + tmpMemory;
  dofeedback('Total HeuristicList: ' + IntToStr(HeuristicList.count) + ' - Memory: ' + inttostrShort(tmpMemory));
  tmpMemory := onewordList.count * 4;
  totalMemory := totalMemory + tmpMemory;
  dofeedback('Total OneWordList: ' + IntToStr(onewordList.count) + ' - Memory: ' + inttostrShort(tmpMemory));

  if assigned(fuz) then
  begin
    tmpMemory := 0;
    for i := 0 to pred(fuz.List.count) do
      tmpMemory := tmpMemory + tfuzExport(fuz.List[i]).getsize + 4;
    totalMemory := totalMemory + tmpMemory;
    dofeedback('FuzMap:');
    dofeedback('Total FuzData: ' + IntToStr(fuz.List.count) + ' - Memory: ' + inttostrShort(tmpMemory));
  end;

  if assigned(mainDialdata) then
  begin
    dofeedback('NPCMap:');
    tmpMemory := mainDialdata.lDialListByInfo.count * tDialData.InstanceSize + 4;
    totalMemory := totalMemory + tmpMemory;
    dofeedback('Total InfoDispatch: ' + IntToStr(mainDialdata.lDialListByInfo.count) + ' - Memory: ' + inttostrShort(tmpMemory));
  end;
  dofeedback(strSeparator);
  dofeedback('Total Data Memory: ' + inttostrShort(totalMemory));
  dofeedback(strSeparator);
  dofeedback('Total Process Memory: ' + inttostrShort(CurrentMemoryUsage));
  dofeedback(strSeparator);
  stopStuff(false, false);
end;

procedure TForm1.UsageAudit1Click(Sender: TObject);
begin
  UsageAudit;
end;

/// toolBox
procedure TForm1.MenuToolbox1Click(Sender: TObject);
begin
  form2.close; // security
  FormKeyWord.close;

  form16 := tform16.create(self);
  form16.showmodal;
  if form16.ModalResult = mrOK then
    applytoolBox(MainLoader, currentEditedTree, form16.toolID);
  form16.free;
end;

procedure TForm1.MenuWarningCheck(bCheck: boolean);
var
  i: integer;
begin
  for i := 0 to PopupWarning.items.count - 1 do
  begin
    if TMenuItem(PopupWarning.items[i]).tag > 0 then
      TMenuItem(PopupWarning.items[i]).checked := bCheck;
  end;
  launchSearchTimer;
end;

procedure TForm1.MenuWarnUnCheckClick(Sender: TObject);
begin
  MenuWarningCheck(false);
end;

procedure TForm1.MenuWarn1Click(Sender: TObject);
begin
  (Sender as TMenuItem).checked := not(Sender as TMenuItem).checked;
  launchSearchTimer;
end;

procedure TForm1.MenuWarnCheckClick(Sender: TObject);
begin
  MenuWarningCheck(true);
end;

// ==Open VMAD Script===========

procedure TForm1.OpenScript1Click(Sender: TObject);
var
  sk: tskystr;
begin
  if not assigned(MainLoader) then
    exit;
  sk := getFocusedString(currentEditedTree);
  if assigned(sk) and (isVMADString in sk.sinternalparams) then
    openVMADScript(sk);
end;

procedure TForm1.openVMADScript(sk: tskystr);
var
  scriptname, scriptpath, propName: string;
  b: boolean;
begin
  scriptname := lowercase('scripts\' + stringreplace(sk.VMAD.VMAD.scriptList[sk.VMAD.ScriptIndex], ':', '\', [rfReplaceAll]) + '.pex');
  propName := sk.VMAD.VMAD.propList[sk.VMAD.propIndex];
  scriptpath := ExcludeTrailingPathDelimiter(Game_CacheDataFolder) + '\' + scriptname;
  if authFileAccess(scriptpath) then
    b := openVMADScriptDispatch(MainLoader, scriptpath, false)
  else
    b := openVMADScriptDispatch(MainLoader, scriptname, true);

  if b then
  begin
    ButtonedEdit3.Text := propName;
    if (pagecontrol2.ActivePageIndex = PageControl_Pex) then
      dosearchinPexText([ssoEntireScope])
    else
    begin
      pagecontrol2.ActivePageIndex := PageControl_Pex;
      TimerSearchPex.Enabled := false;
      TimerSearchPex.Enabled := true;
    end;
  end;
end;

function TForm1.openVMADScriptDispatch(loader: tTranslatorLoader; scriptname: string; bBsa: boolean): boolean;
var
  Index: integer;
begin
  startStuff('');
  UpdateLoaderSetting(MainLoader);
  ResetFocusedData;
  loaderList.items.beginupdate;
  if bBsa then
    Result := getVMADScriptFromMaster(loader, scriptname, index)
  else
    Result := doloadpex(scriptname, false, index);
  Result := Result or (index <> -1);
  if index = -1 then
    index := loaderList.items.count - 1;
  loaderList.items.endupdate;
  stopStuff;
  if Result then
  begin
    loaderList.itemIndex := index;
    loaderList.OnChange(loaderList);
  end;
end;

function TForm1.getVMADScriptFromMaster(loader: tTranslatorLoader; scriptname: string; var Index: integer): boolean;
var
  i: integer;
  bsafilename: string;
begin
  Result := false;
  for i := pred(loader.espLoader.mastersData.count) downto 0 do
  begin
    if getBSAFileName(lScriptdef, nil, bsafilename, Game_CacheDataFolder, removefileext(loader.espLoader.mastersData[i])) then
    begin
      dofeedback(formatres('opening_BSA', [bsafilename]));
      if openVMADScriptEx(bsafilename, scriptname, index) then
        exit(true)
    end;
  end;
end;

function TForm1.openVMADScriptEx(bsaName, scriptname: string; var Index: integer): boolean;
var
  bStream: TObject;
begin
  bStream := nil;
  try
    Result := OpenFileFromBSA(bsaName, scriptname, bStream, false, index);
  finally
    freeStreamArchive(bStream);
  end;
end;

// ==================Get Script from external decompiler==================
function TForm1.loadPscScript(filenamePsc: string; var activepage: integer): boolean;
begin
  Result := false;
  if authFileAccess(filenamePsc) then
  begin
    SynEditScript.lines.loadfromfile(filenamePsc);
    activepage := 1;
    Result := true;
  end
end;

procedure TForm1.openScriptFromExternal(filenamePex, filenamePsc: string);
var
  process: cardinal;
  activepage: integer;
begin
  activepage := 0;
  if bUseExternalDecompiler then
  begin
    if not loadPscScript(tmpFuzPath + filenamePsc, activepage) then
    begin
      ForceDirectories(tmpFuzPath);
      if authFileAccess(tmpFuzPath + filenamePex) then
        if RunExecutable(sUseExternalDecompilerPath, [tmpFuzPath + filenamePex], tmpFuzPath, true, process) then
          loadPscScript(tmpFuzPath + filenamePsc, activepage)
    end;
  end;
  PageControlPex.ActivePageIndex := activepage;

end;

// ---------------------Data Analysis-----
function prepareRegex(r: TPerlRegEx; s: string): boolean;
begin
  Result := true;
  r.regEx := s;
  try
    r.study;
  except
    Result := false;
  end;
end;

// ----Components generator------------

procedure TForm1.DEFUIComponent1Click(Sender: TObject);
begin
  doComponentGenerator(MainLoader);
end;

type
  rDefuiOptions = record
    bUseRegex1, bUseRegex2: boolean;
    bUseSource, bAddQuantity, bUseFirstChar, bUseSourceCompo, bdoAutoHeader: boolean;
    sTemplate: string;
    sQuantityIndicator1: string;
    sQuantityIndicator2: string;
    sComponentSeparator: string;
  end;

function assignComponent(loader: tTranslatorLoader; bFromDefUI: boolean; r: trecord; baseString: string; kwList: aCardinal; regEx1, regEx2: TPerlRegEx; rOpts: rDefuiOptions; var bNeedMaster: boolean;
  var sAutoHeader: string): string;
var
  aaMisc: aaCardinal;
  i, j: integer;
  compo, compoString, tagString, tagQuantity, weightString: string;
  rComp: trecord;
  aKwd: aCardinal;
  w: single;
const
  K1: cardinal = $0011C725; // medium
  K2: cardinal = $0011C729; // high
begin
  sAutoHeader := '';
  // ---------------

  // check ignored
  for i := 0 to pred(length(kwList)) do
  begin
    aKwd := r.getKeywords;
    for j := 0 to pred(length(aKwd)) do
      if kwList[i] = aKwd[j] then
        exit(baseString)
  end;

  // clean up base regex
  if rOpts.bUseRegex1 then
  begin
    regEx1.Subject := baseString;
    if regEx1.match and (regEx1.GroupCount >= 1) then
      baseString := trim(regEx1.Groups[1]);
  end;

  aaMisc := r.GetMiscComponentAdv;
  // if no component then cleanup
  if length(aaMisc[0]) = 0 then
  begin
    weightString := '';
    compoString := '';
    if bFromDefUI then
      exit(baseString);
    // exit if the fucntion is called from compoGenerator
  end
  else
  // else addcomponent
  begin
    // ---------------------------
    compoString := '';
    tagQuantity := '';
    for i := 1 to length(aaMisc[0]) do
      if aaMisc[0][i - 1] <> 0 then
      begin
        rComp := loader.espLoader.getFastRecord(aaMisc[0][i - 1], gamesParams.sHEADERCMPOREF);
        compo := getStringFromRecRef(rComp, aaMisc[0][i - 1], rOpts.bUseSourceCompo, headerFULL, loader.espLoader.mastersData, bNeedMaster);
        if rOpts.bUseRegex2 then
        begin
          regEx2.Subject := compo;
          if regEx2.match and (regEx2.GroupCount >= 1) then
            compo := trim(regEx2.Groups[1]);
        end;
        if rOpts.bUseFirstChar then
          compo := copy(compo, 1, 1);
        if rOpts.bAddQuantity then
        begin
          if CURRENT_GAME_ID = 4 then
          begin
            if (aaMisc[1][i - 1] = K1) then
              tagQuantity := rOpts.sQuantityIndicator1
            else if (aaMisc[1][i - 1] = K2) then
              tagQuantity := rOpts.sQuantityIndicator2;
          end
          else if CURRENT_GAME_ID = 0 then
          begin
            if aaMisc[1][i - 1] > 5 then
              tagQuantity := rOpts.sQuantityIndicator2
            else if aaMisc[1][i - 1] > 2 then
              tagQuantity := rOpts.sQuantityIndicator1;
          end;
        end;

        if i < length(aaMisc[0]) then
          tagString := rOpts.sComponentSeparator
        else
          tagString := '';
        compoString := compoString + compo + tagQuantity + tagString;

        if rOpts.bdoAutoHeader and (length(aaMisc[0]) = 1) then
          sAutoHeader := compo;

      end;

    // weight
    w := r.getFloatfromDataRef('DATA', 4);
    // if w <> 0.0 then
    weightString := format('%.1f', [w]);
    if (length(weightString) > 0) and (weightString[length(weightString)] = '0') then
      weightString := format('%.0f', [w]);
  end;

  Result := rOpts.sTemplate;
  Result := stringreplace(Result, '%BASE%', baseString, [rfReplaceAll]);
  Result := stringreplace(Result, '%WEIGHT%', weightString, [rfReplaceAll]);
  Result := stringreplace(Result, '%COMPOS%', compoString, [rfReplaceAll]);
end;

procedure TForm1.doComponentGenerator(loader: tTranslatorLoader; bAuto: boolean = false; bForceDoNotClean: boolean = false);
var
  sk: tskystr;
  totalCount, idOpt: integer;
  fProc: tcompareproc;
  bNeedMaster: boolean;
  regEx1, regEx2: TPerlRegEx;
  i: integer;
  Key: cardinal;
  kwList: aCardinal;
  rOpts: rDefuiOptions;
  outString, autoHeader, baseString: string;
begin
  if not assigned(loader) then
    exit;
  totalCount := 0;
  bNeedMaster := false;
  form2.close;
  startStuff('');
  loader.buildEspInheritedData;
  stopStuff;

  // security
  form18 := tform18.create(self);
  regEx1 := TPerlRegEx.create;
  regEx2 := TPerlRegEx.create;
  try
    form18.ComboBox1.Text := sCurrentDEFUIOut;
    form18.ComboBox1.items.add(sDEFUIOut[CURRENT_GAME_ID]);
    form18.ComboBox1.items.add(sDEFUIwOut[CURRENT_GAME_ID]);
    form18.memo1.lines.Text := lDEFUIIgnore.Text;
    form18.eLoader := loader.espLoader;
    form18.ValueListEditor1.strings.Text := defUIoptions.Text;
    form18.UpdateKeyInfo;
    form18.Button1.Enabled := TESVTSameLanguage;
    if bAuto then
      form18.ModalResult := mrOK
    else
      form18.showmodal;
    if form18.ModalResult = mrOK then
    begin
      sCurrentDEFUIOut := form18.ComboBox1.Text;
      defUIoptions.Text := form18.ValueListEditor1.strings.Text;
      // ---------
      idOpt := form18.RadioGroup1.itemIndex;
      case idOpt of
        1: fProc := compareOptPartialOnly;
        2: fProc := compareOptSelection;
      else fProc := compareOptEverything;
      end;
      // ----
      timeUndo;
      SetLength(kwList, 0);
      cleanFillStringList(form18.memo1, lDEFUIIgnore);

      // get keyword ignoredlist
      if form18.CheckBox3.checked then
        for i := 0 to pred(lDEFUIIgnore.count) do
        begin
          Key := strtointdef('$' + lDEFUIIgnore.strings[i], 0);
          if Key <> 0 then
          begin
            SetLength(kwList, length(kwList) + 1);
            kwList[i] := Key;
          end;
        end;
      // init RegEx;

      rOpts.bUseRegex1 := strtobooldef(form18.ValueListEditor1.Values['bCleanBase'], false) and prepareRegex(regEx1, form18.ValueListEditor1.Values['sCleanBaseRegEx']);
      rOpts.bUseRegex2 := strtobooldef(form18.ValueListEditor1.Values['bCleanCompo'], false) and prepareRegex(regEx2, form18.ValueListEditor1.Values['sCleanCompoRegEx']);
      rOpts.bUseSource := strtobooldef(form18.ValueListEditor1.Values['bUseSourceForString'], false);
      rOpts.bUseSourceCompo := strtobooldef(form18.ValueListEditor1.Values['bUseSourceForComponents'], false);
      rOpts.bdoAutoHeader := false;
      rOpts.bAddQuantity := strtobooldef(form18.ValueListEditor1.Values['bQuantityIndicator'], false);
      rOpts.bUseFirstChar := strtobooldef(form18.ValueListEditor1.Values['bUseComponentFirstChar'], false);
      rOpts.sQuantityIndicator1 := form18.ValueListEditor1.Values['sQuantityIndicator1'];
      rOpts.sQuantityIndicator2 := form18.ValueListEditor1.Values['sQuantityIndicator2'];
      rOpts.sComponentSeparator := form18.ValueListEditor1.Values['sComponentSeparator'];
      rOpts.sTemplate := sCurrentDEFUIOut;
      // auto
      if bForceDoNotClean then
        rOpts.bUseRegex1 := false;
      // process

      startStuff(getRes('DEFUIComponentGen'));

      ProgressBar.max := loader.listArray[0].count;
      pbar := 0;
      // ------
      for i := 0 to pred(loader.listArray[0].count) do
      begin
        sk := loader.listArray[0][i];
        updatepBar(500);
        if (sk.esp.rName = 'MISC') and fProc(sk) then
        begin
          if rOpts.bUseSource then
            baseString := sk.s
          else
            baseString := sk.strans;
          outString := assignComponent(loader, true, sk.esp.rec, baseString, kwList, regEx1, regEx2, rOpts, bNeedMaster, autoHeader);
          // finalizing
          if (sk.strans <> outString) then
          begin
            loader.addUndo(sk, tTimeUndo, false, false);
            inc(totalCount);
            sk.strans := outString;
            sk.resetStatus([incompleteTrans])
            // if sk.resetStatus([incompleteTrans]) then
            // setuserCacheUpdated(loader, cacheLoaded);
          end;
        end;
      end;

      searchIntree;

      stopStuff;
      if not bAuto then
        dofeedback(formatres('Component_generated%d', [totalCount]), true);
      if bNeedMaster then
        dofeedback(formatres('Component_gNeedMaster%s', [loader.getFormattedMasterList]), true);

    end;
  finally
    form18.free;
    regEx1.free;
    regEx2.free;
  end;
end;

// --------------------- HeaderProcessor---------------
procedure TForm1.AltDisplay1Click(Sender: TObject);
var
  i: integer;
begin
  bForceAltHeaderDisplay := not bForceAltHeaderDisplay;
  for i := 0 to pred(VTtreeList.count) do
    InitFontTreeOpts(TBaseVirtualTree(VTtreeList[i]));
  ComboBox1Change(nil);
end;

procedure TForm1.getKeyWordForString(s: tskystr);
var
  aKwd, fbKwd: aCardinal;
  Art: cardinal;
  aaMisc: aaCardinal;
  r: trecord;
  f: tfield;
  i: integer;
  rComp: trecord;
begin
  // security
  if not assigned(MainLoader) then
    exit;
  if not FormKeyWord.visible or not assigned(s) then
    exit;

  FormKeyWord.ListBox1.items.beginupdate;
  FormKeyWord.ListBox1.clear;
  if currentTesvMode = sTESVMcM then
  begin

    FormKeyWord.rName := mcmRecName;
    FormKeyWord.fName := mcmRecName;
    FormKeyWord.EditRname.Text := mcmRecName;
    FormKeyWord.EditFname.Text := mcmRecName;
    FormKeyWord.Edit2.Text := '#^\' + (getSkIDName(s)) + '$';
  end
  else if TESVTmodEspLoaded then
  begin

    r := trecord(s.esp.rec);
    f := tfield(s.esp.field);

    FormKeyWord.ListBox1.clear;
    if assigned(r) then
    begin
      FormKeyWord.rName := s.esp.rName;
      FormKeyWord.fName := s.esp.fName;

      FormKeyWord.EditRname.Text := string(s.esp.rName);
      FormKeyWord.EditFname.Text := string(s.esp.fName);

      FormKeyWord.ListBox1.items.add(format('form|%s|%.8x', [r.EdidNameEx, r.headerData.formID]));

      aKwd := MainLoader.espLoader.getKwd(r, f);

      for i := 0 to pred(length(aKwd)) do
      begin
        if aKwd[i] <> 0 then
          FormKeyWord.ListBox1.items.add(format('kwd_|%s|%.8x', [MainLoader.espLoader.findKeyWord(aKwd[i], r), aKwd[i]]));
      end;

      if FormKeyWord.rName = headerBOOK then
      begin
        Art := r.getCardinalfromDataRef(headerINAM, 0);
        if Art <> 0 then
          FormKeyWord.ListBox1.items.add(format('art_|%s|%.8x', [MainLoader.espLoader.findRecEdid(Art, headerSTAT), Art]));
      end;

      if (FormKeyWord.rName = headerMISC) or (FormKeyWord.rName = headerALCH) then
      begin
        aaMisc := s.GetMiscComponentAdv;
        for i := 1 to length(aaMisc[0]) do
          if aaMisc[0][i - 1] <> 0 then
          begin
            rComp := MainLoader.espLoader.getFastRecord(aaMisc[0][i - 1], gamesParams.sHEADERCMPOREF);
            if assigned(rComp) then
              FormKeyWord.ListBox1.items.add(format('c___|%s|%.8x', [rComp.EdidNameEx, aaMisc[0][i - 1]]));
          end;
      end;

      if bHeaderAdvanced then
      begin
        rComp := MainLoader.espLoader.getOMODFallBack(r);
        if not assigned(rComp) then
          rComp := r;
        if (rComp <> r) then
          fbKwd := MainLoader.espLoader.getKwd(rComp)
        else
          fbKwd := aKwd;

        if assigned(rComp) then
          FormKeyWord.ListBox1.items.add(format('for+|%s|%.8x', [rComp.EdidNameEx, rComp.headerData.formID]));

        for i := 0 to pred(length(fbKwd)) do
        begin
          if fbKwd[i] <> 0 then
            FormKeyWord.ListBox1.items.add(format('kwd+|%s|%.8x', [MainLoader.espLoader.findKeyWord(fbKwd[i], rComp), fbKwd[i]]));
        end;
      end;

    end;
  end;
  FormKeyWord.ListBox1.items.endupdate;
end;

function testTbRegex(Tb: tBatcherRules; s: string): boolean;
var
  r: TPerlRegEx;
begin
  Result := false;
  r := TPerlRegEx.create;
  try
    try
      r.Subject := s;
      r.regEx := Tb.regexString;
      Result := r.match;
    except
    end;
  finally
    r.free;
  end;
end;

function getTbRegex(Tb: tBatcherRules; matchId: integer; s: string): string;
var
  r: TPerlRegEx;
begin
  Result := '';
  r := TPerlRegEx.create;
  try
    try
      r.Subject := s;
      r.regEx := Tb.regexString;
      if r.match then
      begin
        if r.GroupCount >= matchId then
          Result := r.Groups[matchId];
      end;
    except
    end;
  finally
    r.free;
  end;
end;

function addLocalHeader(Tb: tBatcherRules; sHeader: string; inString: string): string;
const
  inTag = '%s';
  inTagRegex: array [1 .. 9] of string = ('%1', '%2', '%3', '%4', '%5', '%6', '%7', '%8', '%9');
var
  i: integer;
  bTagFound: boolean;
begin
  inString := trim(inString);
  bTagFound := false;
  if sHeader = '' then
    Result := inString
  else
  begin
    Result := sHeader;
    for i := 1 to 9 do
      if pos(inTagRegex[i], sHeader) > 0 then
      begin
        Result := stringreplace(Result, inTagRegex[i], getTbRegex(Tb, i, inString), [rfIgnoreCase]);
        bTagFound := true;
      end;
    if pos(inTag, sHeader) > 0 then
    begin
      Result := stringreplace(Result, inTag, inString, [rfIgnoreCase]);
      bTagFound := true;
    end;

    if not bTagFound then
      Result := sHeader + ' ' + inString;

    Result := trim(Result);

  end;
end;

function regexSearchInString(pattern, s: string): boolean; // true if found;
var
  r: TPerlRegEx;
begin
  r := TPerlRegEx.create;
  try
    try
      r.regEx := pattern;
      r.study;
      r.Subject := s;
      Result := r.match;
    except
      Result := false;
    end;
  finally
    r.free;
  end;
end;

function advSearchInString(pattern, s: string): boolean; // true if found;
begin
  if (length(pattern) > 1) and (pos('#', pattern) = 1) then
  begin
    pattern := copy(pattern, 2, length(pattern));
    if (length(pattern) > 1) then
      Result := regexSearchInString(pattern, s)
    else
      Result := false;
  end
  else
    Result := pos(pattern, s) > 0;
end;

function TForm1.ApplyRulesEx(loader: tTranslatorLoader; r: trecord; hf: sHeaderSig; s, strans: string; aKwd: aCardinal; oldTb: tBatcherRules; bIsFbStrict: boolean; var bNeedMaster: boolean;
  iFallBack: integer = -1): string;
// iFallback = -1  nofallback
// iFallback = 0  global fallback.   if bIsFbStrict then rname must match tb.rname
// iFallback = 1-F  get in specific bank
var
  i, j: integer;
  Tb: tBatcherRules;
  iCount: integer;
  Art: cardinal;
  Data: pTreeHeaderData;
  Node, nextNode: PVirtualNode;
  baseString, autoHeader: string;
  rOpts: rDefuiOptions;
  regEx1, regEx2: TPerlRegEx;
  kwList: aCardinal;
  aaMisc: aaCardinal;
  UsedHeader: string;
  tmpEdid: string;
  bAuthAnalyze: boolean;
  posFbKey, oldFbKey: integer;
  fbTag, kwEdid: string;
  bTmp: boolean;
begin
  if FormKeyWord.RadioGroup2.itemIndex = 0 then
    baseString := s
  else
    baseString := strans;
  Result := baseString;
  // ------------------
  SetLength(kwList, 0); // dummy for preprocess
  // ------------------
  if not assigned(r) then
    exit;
  // INNR exception.
  if (iFallBack = -1) and (r.Header.name = headerINNR) then
    if (s = '*') or (trim(s) = '') then
      exit(s);
  // ------------------
  autoHeader := '';
  // -------------LOOP---------------------------->
  nextNode := nil;
  Node := FormKeyWord.headerTree.GetFirst;
  While assigned(Node) do
  begin
    // force the loop----------->
    if nextNode = Node then
    begin
      Node := FormKeyWord.headerTree.GetNext(Node);
      if not assigned(Node) then
        exit;
    end;
    nextNode := Node;
    // <-------------------------
    if (iFallBack = -1) and FormKeyWord.CheckBox4.checked and not FormKeyWord.headerTree.Selected[Node] then
      continue;
    // -------------------------
    Data := FormKeyWord.headerTree.GetNodeData(Node);
    Tb := Data.BasicND;
    // -------------------------
    if (iFallBack >= 0) and assigned(oldTb) and oldTb.seekAppliedRule(Tb) then
      continue;
    // do not apply the same header if more than one fallback is found in rule
    if (iFallBack >= 0) and Tb.bContainfbTag then
      continue; // no retro
    if (iFallBack = -1) and Tb.isFallBack then
      continue; // must be Fallback
    if Tb.bDynamicDisable then
      continue;
    // -------------------------
    if (FormKeyWord.headerTree.CheckState[Node] = csUnCheckedNormal) or not Tb.bAuth then
      continue;
    // -------------------------
    if iFallBack = 0 then
    begin
      bAuthAnalyze := (r.Header.name = Tb.rName);
      if (Tb.bFallBack or Tb.bAutoFallback) then
        bAuthAnalyze := true;
      if Tb.fallbackBank <> 0 then
        bAuthAnalyze := false;
      if bIsFbStrict and (r.Header.name <> Tb.rName) then
        bAuthAnalyze := false;
    end
    else if iFallBack > 0 then
      bAuthAnalyze := Tb.bFallBack and (Tb.fallbackBank = iFallBack)
    else
      bAuthAnalyze := (r.Header.name = Tb.rName) and (hf = Tb.fName);

    if not bAuthAnalyze then
      continue;

    // regex
    if Tb.bIsRegex and (not testTbRegex(Tb, baseString)) then
      continue;

    // component
    if (r.Header.name = headerMISC) or (r.Header.name = headerALCH) then
    begin
      if Tb.bhasComponent then
        if not r.hasComponent then
          continue;

      aaMisc := r.GetMiscComponentAdv;
      // check ignored compo
      if Tb.aCompo[1].count > 0 then
      begin
        iCount := 0;
        for i := 0 to pred(Tb.aCompo[1].count) do
        begin
          for j := 1 to length(aaMisc[0]) do
            if Tb.aCompo[1][i] = aaMisc[0][j - 1] then
              inc(iCount);
        end;
        if (iCount > 0) then // OR
          continue;
      end;

      if Tb.aCompo[0].count > 0 then
      begin
        iCount := 0;
        // check needed compo
        for i := 0 to pred(Tb.aCompo[0].count) do
        begin
          for j := 1 to length(aaMisc[0]) do
            if Tb.aCompo[0][i] = aaMisc[0][j - 1] then
              inc(iCount);
        end;
        if Tb.bIncludeOR then
        begin
          if (iCount = 0) then
            // OR
            continue;
        end
        else
        begin
          if (iCount <> Tb.aCompo[0].count) then // AND
            continue;
        end;
      end;

    end;

    if not((iFallBack = 0) and Tb.bAutoFallback) then
    begin
      // formID
      if (Tb.aForm[0].count > 0) then
      begin
        iCount := 0;
        for i := 0 to pred(Tb.aForm[0].count) do
        begin
          if Tb.aForm[0][i] = r.headerData.formID then
          begin
            inc(iCount);
            break;
          end;
        end;
        if iCount = 0 then
          continue;
      end;
      if (Tb.aForm[1].count > 0) then
      begin
        iCount := 0;
        for i := 0 to pred(Tb.aForm[1].count) do
          if Tb.aForm[1][i] = r.headerData.formID then
          begin
            iCount := 1;
            break;
          end;
        if iCount <> 0 then
          continue;
      end;

      // edid
      tmpEdid := ansilowercase(r.EdidNameEx);
      // check ignored edid
      if Tb.lEdid[1].count > 0 then
      begin
        iCount := 0;
        for i := 0 to pred(Tb.lEdid[1].count) do
        begin
          if advSearchInString(Tb.lEdid[1][i], tmpEdid) then
          begin
            inc(iCount);
            break;
          end;
        end;
        if (iCount > 0) then // OR
          continue;
      end;
      // include
      if Tb.lEdid[0].count > 0 then
      begin
        iCount := 0;
        // check needed edid
        for i := 0 to pred(Tb.lEdid[0].count) do
        begin
          if advSearchInString(Tb.lEdid[0][i], tmpEdid) then
            inc(iCount);
        end;

        if Tb.bIncludeOR then
        begin
          if (iCount = 0) then // OR
            continue;
        end
        else
        begin
          if (iCount <> Tb.lEdid[0].count) then // AND
            continue;
        end
      end;
    end;

    // art
    if (r.Header.name = headerBOOK) then
    begin
      Art := r.getCardinalfromDataRef(headerINAM, 0);
      if (Tb.aArt[0].count > 0) then
      begin
        if Art = 0 then
          continue;
        iCount := 0;
        for i := 0 to pred(Tb.aArt[0].count) do
        begin
          if Tb.aArt[0][i] = Art then
          begin
            inc(iCount);
            break;
          end;
        end;
        if iCount = 0 then
          continue;
      end;
      if (Tb.aArt[1].count > 0) and (Art <> 0) then
      begin
        iCount := 0;
        for i := 0 to pred(Tb.aArt[1].count) do
          if Tb.aArt[1][i] = Art then
          begin
            iCount := 1;
            break;
          end;
        if iCount <> 0 then
          continue;
      end;
    end;

    // if nokeyword  needed
    if Tb.bNoKw and (length(aKwd) > 0) then
      continue;
    if Tb.banyKw and (length(aKwd) = 0) then
      continue;
    // if anykeyword
    if not Tb.banyKw then
    begin

      // direct KWD  --->
      // check ignored kwd
      if Tb.akw[1].count > 0 then
      begin
        iCount := 0;
        for i := 0 to pred(Tb.akw[1].count) do
        begin
          for j := pred(length(aKwd)) downto 0 do
            if Tb.akw[1][i] = aKwd[j] then
              inc(iCount);
        end;
        if (iCount > 0) then // OR
          continue;
      end;

      // include
      if Tb.akw[0].count > 0 then
      begin
        iCount := 0;
        // check needed kwd
        for i := 0 to pred(Tb.akw[0].count) do
        begin
          for j := pred(length(aKwd)) downto 0 do
            if Tb.akw[0][i] = aKwd[j] then
              inc(iCount);
        end;

        if Tb.bIncludeOR then
        begin
          if (iCount = 0) then // OR
            continue;
        end
        else
        begin
          if (iCount <> Tb.akw[0].count) then // AND
            continue;
        end
      end;

      // searchTextKWD  --->
      // check ignored kwd
      if Tb.lKwd[1].count > 0 then
      begin
        iCount := 0;
        for i := 0 to pred(Tb.lKwd[1].count) do
        begin
          for j := pred(length(aKwd)) downto 0 do
          begin
            kwEdid := ansilowercase(loader.espLoader.findKeyWord(aKwd[j], r));
            if advSearchInString(Tb.lKwd[1][i], kwEdid) then
              inc(iCount);
          end;
        end;
        if (iCount > 0) then
          // OR
          continue;
      end;

      // include
      if Tb.lKwd[0].count > 0 then
      begin
        iCount := 0;
        // check needed kwd
        for i := 0 to pred(Tb.lKwd[0].count) do
        begin
          bTmp := false;
          for j := pred(length(aKwd)) downto 0 do
          begin
            kwEdid := ansilowercase(loader.espLoader.findKeyWord(aKwd[j], r));
            if advSearchInString(Tb.lKwd[0][i], kwEdid) then
            begin
              bTmp := true;
              inc(iCount);
            end;
            if bTmp then
              break;
          end;
        end;

        if Tb.bIncludeOR then
        begin
          if (iCount = 0) then // OR
            continue;
        end
        else
        begin
          if (iCount <> Tb.lKwd[0].count) then // AND
            continue;
        end
      end;
    end;

    // preprocessing
    if (iFallBack = -1) and Tb.bPreProcess then
    begin
      regEx1 := TPerlRegEx.create;
      regEx2 := TPerlRegEx.create;
      rOpts.bUseRegex1 := strtobooldef(Tb.suffixeOpts.Values['bCleanBase'], false) and prepareRegex(regEx1, Tb.suffixeOpts.Values['sCleanBaseRegEx']);
      rOpts.bUseRegex2 := strtobooldef(Tb.suffixeOpts.Values['bCleanCompo'], false) and prepareRegex(regEx2, Tb.suffixeOpts.Values['sCleanCompoRegEx']);
      rOpts.bUseSource := FormKeyWord.RadioGroup2.itemIndex = 0;
      rOpts.bUseSourceCompo := strtobooldef(Tb.suffixeOpts.Values['bUseSourceForComponents'], false);
      rOpts.bAddQuantity := strtobooldef(Tb.suffixeOpts.Values['bQuantityIndicator'], false);
      rOpts.bUseFirstChar := strtobooldef(Tb.suffixeOpts.Values['bUseComponentFirstChar'], false);
      rOpts.sQuantityIndicator1 := Tb.suffixeOpts.Values['sQuantityIndicator1'];
      rOpts.sQuantityIndicator2 := Tb.suffixeOpts.Values['sQuantityIndicator2'];
      rOpts.sComponentSeparator := Tb.suffixeOpts.Values['sComponentSeparator'];
      rOpts.sTemplate := Tb.suffixeOpts.Values['sTemplate'];
      rOpts.bdoAutoHeader := strtobooldef(Tb.suffixeOpts.Values['bOverrideHeaderWithCompo'], false);;
      try
        if rOpts.bUseSource then
          baseString := s
        else
          baseString := strans;
        baseString := assignComponent(loader, false, r, baseString, kwList, regEx1, regEx2, rOpts, bNeedMaster, autoHeader);
      finally
        regEx1.free;
        regEx2.free;
      end;
    end;

    if (iFallBack >= 0) then
    begin
      if assigned(oldTb) then
        oldTb.usedList.add(Tb);
{$IFDEF DEBUG}
      if debug_getBatcher then
        dofeedback('Fallback_' + IntToStr(iFallBack) + ' !id:' + inttohex(Tb.id, 8));
{$ENDIF}
      // exit(trimleft(tb.Header))
      exit(Tb.Header)
    end
    else
    begin
      UsedHeader := Tb.Header;
      // recursive fallback-------->
      oldFbKey := -1;
      posFbKey := pos(FallbackKey, UsedHeader);
      while (posFbKey > 0) and (oldFbKey <> posFbKey) do
      begin
        oldFbKey := posFbKey;
        fbTag := copy(UsedHeader, posFbKey, 2);
        for i := 0 to high(FallbackTags) do
          if fbTag = FallbackTags[i] then
          begin
            UsedHeader := TrimRight(stringreplace(UsedHeader, FallbackTags[i], getFallbackReplacement(loader, r, aKwd, i, Tb, bNeedMaster), []));
            oldFbKey := -1;
            break;
          end;
        posFbKey := pos(FallbackKey, UsedHeader);
      end;
      Tb.usedList.clear;
      // <----------------------
      if (Tb.Header <> ' ') and (trim(UsedHeader) = '') then
        UsedHeader := '';

      // header
      if Tb.bFullReplace then
      begin
        if autoHeader <> '' then
          Result := autoHeader
        else
          Result := UsedHeader;
      end
      else
      begin
        if autoHeader <> '' then
          Result := addLocalHeader(Tb, autoHeader, baseString)
        else
          Result := addLocalHeader(Tb, UsedHeader, baseString);
      end;
{$IFDEF DEBUG}
      if debug_getBatcher then
        dofeedback('Main_ !id:' + inttohex(Tb.id, 8));
{$ENDIF}
      exit;
    end;
    Node := FormKeyWord.headerTree.GetNext(Node);
  end;
end;

function TForm1.getFallbackReplacement(loader: tTranslatorLoader; r: trecord; aKwd: aCardinal; iFallBack: integer; oldTb: tBatcherRules; var bNeedMaster: boolean): string;
var
  rFb: trecord;
  bIsFbStrict: boolean;
  sk: tskystr;
begin
  bIsFbStrict := false;
  if iFallBack > 2 then
    iFallBack := iFallBack - 2 // bank 1-15
  else if iFallBack = 1 then
  begin
    iFallBack := 0;
    bIsFbStrict := true; // @s bank = 0
  end
  else if iFallBack = 2 then // @n = copy FULL field on dest
  begin
    if assigned(r) then
    begin
      sk := tskystr(r.getSkfromDataRef(headerFULL));
      if assigned(sk) then
        exit(sk.strans);
    end;
    exit('');
  end;

  rFb := loader.espLoader.getOMODFallBack(r);
  if not assigned(rFb) then
    rFb := r;
  if rFb <> r then
    aKwd := loader.espLoader.getKwd(rFb);
  Result := ApplyRulesEx(loader, rFb, headerFULL, '', '', aKwd, oldTb, bIsFbStrict, bNeedMaster, iFallBack);
end;

procedure TForm1.ApplyRules(loader: tTranslatorLoader; sk: tskystr; var bNeedMaster: boolean; var totalCount: integer);
var
  outString: string;
  aKwd: aCardinal;
begin
  if not assigned(sk.esp.rec) then
    exit;

  aKwd := loader.espLoader.getKwd(sk.esp.rec, sk.esp.field);
  outString := ApplyRulesEx(loader, sk.esp.rec, sk.esp.fName, sk.s, sk.strans, aKwd, nil, false, bNeedMaster);
  // finalizing
  if (outString <> '') and (sk.strans <> outString) then
  begin
    loader.addUndo(sk, tTimeUndo, false, false);
    loader.savePending := true;
    inc(totalCount);
    sk.strans := outString;
    sk.resetStatus([incompleteTrans]);
    // if sk.resetStatus([incompleteTrans]) then
    // setuserCacheUpdated(loader, cacheLoaded);
  end;
end;

function TForm1.ApplyBatcher(id: integer; bSilent: boolean = false): boolean;
begin
  Result := false;
  if TESVTSameLanguage then
  begin
    if (currentTesvMode = sTESVMcM) then
      Result := ApplyBatcherExMCM(MainLoader, id, bSilent)
    else if TESVTmodEspLoaded then
      Result := ApplyBatcherExEsp(MainLoader, id, bSilent);
  end;
end;

function TForm1.ApplyRulesExMCM(loader: tTranslatorLoader; s, strans: string; tmpEdid: string): string;
var
  i: integer;
  Tb: tBatcherRules;
  iCount: integer;
  Data: pTreeHeaderData;
  Node, nextNode: PVirtualNode;
  baseString: string;
  regEx1: TPerlRegEx;
begin
  if FormKeyWord.RadioGroup2.itemIndex = 0 then
    baseString := s
  else
    baseString := strans;
  Result := baseString;

  // -------------LOOP---------------------------->
  nextNode := nil;
  Node := FormKeyWord.headerTree.GetFirst;
  While assigned(Node) do
  begin
    // force the loop----------->
    if nextNode = Node then
    begin
      Node := FormKeyWord.headerTree.GetNext(Node);
      if not assigned(Node) then
        exit;
    end;
    nextNode := Node;
    Data := FormKeyWord.headerTree.GetNodeData(Node);
    Tb := Data.BasicND;
    if not((Tb.rName = mcmRecName) and (Tb.fName = mcmRecName)) then
      continue;
    loader.savePending := true;
    // Edid
    if Tb.lEdid[1].count > 0 then
    begin
      iCount := 0;
      for i := 0 to pred(Tb.lEdid[1].count) do
      begin
        if advSearchInString(Tb.lEdid[1][i], tmpEdid) then
        begin
          inc(iCount);
          break;
        end;
      end;
      if (iCount > 0) then // OR
        continue;
    end;
    // include
    if Tb.lEdid[0].count > 0 then
    begin
      iCount := 0;
      // check needed edid
      for i := 0 to pred(Tb.lEdid[0].count) do
      begin
        if advSearchInString(Tb.lEdid[0][i], tmpEdid) then
          inc(iCount);
      end;

      if Tb.bIncludeOR then
      begin
        if (iCount = 0) then // OR
          continue;
      end
      else
      begin
        if (iCount <> Tb.lEdid[0].count) then // AND
          continue;
      end
    end;

    // preprocessing -- clean base only
    if Tb.bPreProcess and strtobooldef(Tb.suffixeOpts.Values['bCleanBase'], false) then
    begin
      regEx1 := TPerlRegEx.create;
      try
        if FormKeyWord.RadioGroup2.itemIndex = 0 then
          baseString := s
        else
          baseString := strans;
        // clean up base regex
        if prepareRegex(regEx1, Tb.suffixeOpts.Values['sCleanBaseRegEx']) then
        begin
          regEx1.Subject := baseString;
          if regEx1.match and (regEx1.GroupCount >= 1) then
            baseString := trim(regEx1.Groups[1]);
        end;
      finally
        regEx1.free;
      end;
    end;

    // header
    if Tb.bFullReplace then
      Result := Tb.Header
    else
      Result := addLocalHeader(Tb, Tb.Header, baseString);
    exit;
  end;
end;

function TForm1.ApplyBatcherExMCM(loader: tTranslatorLoader; id: integer; bSilent: boolean = false): boolean;
var
  totalCount: integer;
  fProc: tcompareproc;
  i, o: integer;
  sk: tskystr;
  outString: string;
begin
  Result := false;
  if not assigned(loader) then
    exit;

  FormKeyWord.setTemplate(id);
  debug_getBatcher := false;
  totalCount := 0;

  o := FormKeyWord.RadioGroup1.itemIndex;
  if FormKeyWord.CheckBox5.checked then
  begin
    case o of
      1: fProc := compareOptPartialOnlyExFilter;
      2:
        begin
          fProc := compareOptSelectionExFilter;
          debug_getBatcher := true;
        end
    else fProc := compareOptEverythingExFilter;
    end;
  end
  else
  begin
    case o of
      1: fProc := compareOptPartialOnlyExLocked;
      2:
        begin
          fProc := compareOptSelectionExLocked;
          debug_getBatcher := true;
        end
    else fProc := compareOptEverythingExLocked;
    end;
  end;
  // process
  startStuff(getRes('ApplyinghProcessorRules'));
  try

    ProgressBar.max := loader.listArray[0].count * 2;
    pbar := 0;
    // ------
    timeUndo;
    // First Pass
    for i := 0 to pred(loader.listArray[0].count) do
    begin
      sk := loader.listArray[0][i];
      updatepBar(500);
      if fProc(sk) then
        outString := ApplyRulesExMCM(loader, sk.s, sk.strans, ansilowercase(getSkIDName(sk)));
      // finalizing
      if (outString <> '') and (sk.strans <> outString) then
      begin
        loader.addUndo(sk, tTimeUndo, false, false);
        inc(totalCount);
        sk.strans := outString;
        sk.resetStatus([incompleteTrans]);
        // if sk.resetStatus([incompleteTrans]) then
        // setuserCacheUpdated(loader, cacheLoaded);
      end;
    end;

  finally
    stopStuff;
    Result := totalCount > 0;
    if not bSilent then
      dofeedback(formatres('hProcessor_generated%d', [totalCount]), true);
  end;
end;

function TForm1.ApplyBatcherExEsp(loader: tTranslatorLoader; id: integer; bSilent: boolean = false): boolean;
var
  totalCount: integer;
  fProc: tcompareproc;
  bNeedMaster: boolean;
  i, o, tmp: integer;
  sk: tskystr;
  fl, f2: tstringlist;
  Tb: tBatcherRules;
  Data: pTreeHeaderData;
  Node: PVirtualNode;
begin
  Result := false;
  if not assigned(loader) then
    exit;

  FormKeyWord.setTemplate(id);
  debug_getBatcher := false;
  bNeedMaster := false;
  totalCount := 0;

  o := FormKeyWord.RadioGroup1.itemIndex;
  if FormKeyWord.CheckBox5.checked then
  begin
    case o of
      1: fProc := compareOptPartialOnlyExFilter;
      2:
        begin
          fProc := compareOptSelectionExFilter;
          debug_getBatcher := true;
        end
    else fProc := compareOptEverythingExFilter;
    end;
  end
  else
  begin
    case o of
      1: fProc := compareOptPartialOnlyExLocked;
      2:
        begin
          fProc := compareOptSelectionExLocked;
          debug_getBatcher := true;
        end
    else fProc := compareOptEverythingExLocked;
    end;
  end;

  startStuff(getRes('ApplyinghProcessorRules'));
  loader.buildEspInheritedData;

  // optimization
  fl := tstringlist.create;
  fl.sorted := true;
  fl.duplicates := dupIgnore;
  f2 := tstringlist.create;
  f2.sorted := true;
  f2.duplicates := dupIgnore;
  Node := FormKeyWord.headerTree.GetFirst;
  While assigned(Node) do
  begin
    Data := FormKeyWord.headerTree.GetNodeData(Node);
    Tb := Data.BasicND;
    Tb.usedList.clear;
    if Tb.bFirstPass then
      fl.add(string(Tb.rName) + string(Tb.fName))
    else
      f2.add(string(Tb.rName) + string(Tb.fName));
    Node := FormKeyWord.headerTree.GetNext(Node);
  end;

  // process

  try
    if assigned(loader.espLoader.masterNode) then
    begin
      ProgressBar.max := loader.listArray[0].count * 2;
      pbar := 0;
      // ------
      timeUndo;
      // First Pass
      for i := 0 to pred(loader.listArray[0].count) do
      begin
        sk := loader.listArray[0][i];
        updatepBar(500);
        if fl.find(string(sk.esp.rName) + string(sk.esp.fName), tmp) and fProc(sk) then
          ApplyRules(loader, sk, bNeedMaster, totalCount);
      end;
      // Second pass
      for i := 0 to pred(loader.listArray[0].count) do
      begin
        sk := loader.listArray[0][i];
        updatepBar(500);
        if f2.find(string(sk.esp.rName) + string(sk.esp.fName), tmp) and fProc(sk) then
          ApplyRules(loader, sk, bNeedMaster, totalCount);
      end;
      // third pass Array[1]
      for i := 0 to pred(loader.listArray[1].count) do
      begin
        sk := loader.listArray[1][i];
        updatepBar(500);
        if f2.find(string(sk.esp.rName) + string(sk.esp.fName), tmp) and fProc(sk) then
          ApplyRules(loader, sk, bNeedMaster, totalCount);
      end;
      // ------------
      sortAllTree;
      searchIntree;
    end;
  finally
    stopStuff;
    Result := totalCount > 0;
    if not bSilent then
      dofeedback(formatres('hProcessor_generated%d', [totalCount]), true);
    fl.free;
    f2.free;
  end;
end;

// ----------------- HeaderWIZARD------------------------

procedure TForm1.launchHeaderWizard;
var
  i: integer;
begin
  form23 := tform23.create(self);

  for i := 0 to pred(Supportedlangs.count) do
  begin
    form23.ComboBox2.items.add(Supportedlangs[i]);
    if ansilowercase(Sourcelanguage) = Supportedlangs[i] then
      form23.ComboBox2.itemIndex := i;
  end;
  if HeaderProcEsm <> '' then
    form23.ListBox1.items.add(HeaderProcEsm);

  if FileExists(Game_CacheDataFolder + HeaderProcEsm) then
    form23.Edit1.Text := Game_CacheDataFolder
  else
    form23.Edit1.Text := getRes('FileNotFound') + '\';

  ValidateLoadedRules;

  form23.showmodal;
  freeandNil(form23);
  if bAutocloseWithWizard then
    close;
end;

procedure TForm1.ValidateLoadedRules;
begin
  form23.ruleListLoaded := FormKeyWord.ruleListLoaded;
  form23.doMcM := FormKeyWord.doMcM;
  form23.memo1.clear;

  if FormKeyWord.ruleListLoaded then
  begin
    form23.memo1.lines.add(formatres('Fbk_LoadedRules%s', [FormKeyWord.currentFile]) + sModChanged[ord(form23.doMcM)]);
    FormKeyWord.generateTemplate(form23.ComboBox1);
  end
  else
    form23.ComboBox1.clear;
end;

procedure TForm1.loadListRulesWizard(filename: string = '');
begin
  form23.Button1.Enabled := false;
  if filename = '' then
    FormKeyWord.loadCustomRules(true)
  else
    FormKeyWord.LoadRules(filename, true);
  ValidateLoadedRules;
end;

function TForm1.executeWizardMCM(bsaName, filename, lang, ext: string; bTemplateFolder: boolean = false): boolean;
var
  fileInBsa: string;
begin
  Result := false;
  SetLanguagePair(lang, lang);
  fileInBsa := filename + lang + ext;
  form23.addinfoLine(formatres('Fbk_Loading%s', [extractFileName(fileInBsa)]));
  if (filename <> '') and FileExists(bsaName) then
    openArchivedFile(bsaName, fileInBsa);

  if assigned(MainLoader) and (lowercase(MainLoader.addon_Filename) = lowercase(fileInBsa)) then
  begin
    form23.addinfoLine(getRes('Fbk_ComputeData'));
    Result := executeWizardEX(lang, bTemplateFolder);
    if Result then
      form23.addinfoLine(getRes('Fbk_File_Success'), 2)
    else
      form23.addinfoLine(getRes('Fbk_File_Fail'), 1)
  end
  else
  begin
    form23.addinfoLine(formatres('Fbk_Unabletoload%s', [extractFileName(fileInBsa)]), 1);
    form23.addinfoLine(getRes('Fbk_File_aborted'), 1);
  end;
end;

function TForm1.executeWizard(filename, lang: string; bResetString, bTemplateFolder: boolean): boolean;
begin
  Result := false;
  SetLanguagePair(lang, lang);
  form23.addinfoLine(formatres('Fbk_Loading%s', [extractFileName(filename)]));
  if (filename <> '') and FileExists(filename) then
    loadSingleEsp(filename, false, false);
  if assigned(MainLoader) and (lowercase(MainLoader.addon_Filename) = lowercase(filename)) then
  begin
    if MainLoader.isTaggedTES4_SNAM then
    begin
      form23.addinfoLine(formatres('Fbk_FileAlreadyPatched%s', [extractFileName(filename)]), 1);
      exit;
    end;

    form23.addinfoLine(getRes('Fbk_ComputeData'));
    LoadAllMasters;

    if bResetString then
    begin
      MainLoader.ResetallTrans(false);
      MainLoader.lockTES4;
    end;
    Result := executeWizardEX(lang, bTemplateFolder);
    if Result then
      form23.addinfoLine(getRes('Fbk_File_Success'), 2)
    else
      form23.addinfoLine(getRes('Fbk_File_Fail'), 1);
  end
  else
  begin
    form23.addinfoLine(formatres('Fbk_Unabletoload%s', [extractFileName(filename)]), 1);
    form23.addinfoLine(getRes('Fbk_File_aborted'), 1);
  end;
end;

function TForm1.executeWizardEX(lang: string; bTemplateFolder: boolean): boolean;
begin
  SetLanguagePair(lang, lang);
  form23.addinfoLine(formatres('Fbk_ApplyingHeadersfor%s', [lang]));
  if not ApplyBatcher(form23.ComboBox1.itemIndex, true) then
  begin
    form23.addinfoLine(formatres('Fbk_NoBatchNoSave%s', [lang]), 1);
    exit(true);
  end;

  if bTagBatchedFiles then
    MainLoader.tagTES4_SNAM;

  bSuspendstringwarning := true;
  if MainLoader.savePending then
  begin
    form23.addinfoLine(formatres('Fbk_SavingStrings%s', [lang]), 2);
    MainLoader.savePending := false;
    if bTemplateFolder then
      SaveFile(cleanForbiddenChar(form23.ComboBox1.items[form23.ComboBox1.itemIndex]) + '\', 4)
    else
      SaveFile;
  end;
  Result := iGlobalLastError = 0;
  if not Result then
    form23.addinfoLine(formatres('Fbk_SavingStringsError%s', [lang]), 1);
  bSuspendstringwarning := false;
end;

// ==================Open  Archived File============

function TForm1.openArchivedFile(bsaName, filename: string): boolean;
var
  Index: integer;
begin
  startStuff('');
  UpdateLoaderSetting(MainLoader);
  ResetFocusedData;
  loaderList.items.beginupdate;
  Result := openArchivedFileEx(bsaName, filename, index);
  Result := Result or (index <> -1);
  if index = -1 then
    index := loaderList.items.count - 1;
  loaderList.items.endupdate;
  stopStuff;
  if Result then
  begin
    loaderList.itemIndex := index;
    loaderList.OnChange(loaderList);
  end;
end;

function TForm1.openArchivedFileEx(bsaName, filename: string; var Index: integer): boolean;
var
  bStream: TObject;
begin
  bStream := nil;
  try
    Result := OpenFileFromBSA(bsaName, filename, bStream, false, index);
  finally
    freeStreamArchive(bStream);
  end;
end;

// ==================F76 inject Interface/Local============

procedure TForm1.f76_PatchFileWizard(dataPath, lang: string);
var
  i: integer;
  tInj: tinjector;
begin
  startStuff('');
  try
    for i := 0 to pred(WizardBsaList.count) do
    begin
      tInj := WizardBsaList[i];
      if tInj.langAuth(lang) then
        F76_InjectInBSA(dataPath, dataPath + tInj.bsaName, tInj.filesName);
    end;
  finally
    stopStuff;
  end;
end;

procedure TForm1.F76_InjectInBSA(dataPath, bsaName: string; filelist: tstringlist);
begin
  form23.addinfoLine(formatres('F76Patching%s', [extractFileName(bsaName)]));
  if not FileExists(bsaName) then
  begin
    form23.addinfoLine(getRes('Fbk_BsaMissing'), 1);
    exit;
  end;
  if not authFileAccessRW(bsaName) then
  begin
    form23.addinfoLine(getRes('Fbk_BsaLocked'), 1);
    exit;
  end;
  F76_InjectInBSAEx(dataPath, bsaName, filelist);
end;

procedure TForm1.F76_InjectInBSAEx(dataPath, bsaName: string; filelist: tstringlist);
var
  tlistInject: tstringlist;
  i: integer;
begin
  tlistInject := tstringlist.create;
  tlistInject.sorted := true;
  try
    F76_InjectInBSAMulti(dataPath, tlistInject, filelist);
    if tlistInject.count > 0 then
      F76_doPrepareInjectInBSA(bsaName, tlistInject)
    else
      form23.addinfoLine(formatres('Error_Dup_Bsa2:%s', [bsaName]), 1);
    // emptyfilelist
  finally
    for i := 0 to pred(tlistInject.count) do
      tmemoryStream(tlistInject.Objects[i]).free;
    tlistInject.free;
  end;
end;

procedure TForm1.F76_InjectInBSAMulti(dataPath: string; tlistInject, filelist: tstringlist);
var
  i: integer;
begin
  for i := 0 to pred(filelist.count) do
  begin
    if FileExists(dataPath + filelist[i]) and authFileAccess(dataPath + filelist[i]) then
      F76_InjectInBSAMultiEx(dataPath, filelist[i], tlistInject);
  end;
end;

procedure TForm1.F76_InjectInBSAMultiEx(dataPath, filename: string; tlistInject: tstringlist);
var
  Index: integer;
  fExportStream: tmemoryStream;
begin
  // -----security, should not happen.----->
  if tlistInject.find(filename, Index) then
  begin
    form23.addinfoLine(formatres('Error_Dup_Bsa1:%s', [filename]), 1);
    exit;
  end;
  // <--------------------------------------
  fExportStream := tmemoryStream.create;
  try
    fExportStream.loadfromfile(dataPath + filename);
    tlistInject.AddObject(filename, TObject(fExportStream));
  except
    On E: Exception do
      dofeedback(E.Message, true);
  end;
end;

procedure cleanBackupBa2(gamePath, filename: string);
var
  searchResult: TSearchRec;
  t: tstringlist;
begin
  t := tstringlist.create;
  t.duplicates := dupIgnore;
  t.sorted := true;
  try
    try
      // -SST first
      if FindFirst(gamePath + filename + '.bak*', faAnyFile, searchResult) = 0 then
      begin
        repeat
          t.add(searchResult.name);
        until FindNext(searchResult) <> 0;
        FindClose(searchResult);
      end;

      while t.count > 2 do
      begin
        DeleteFile(gamePath + t[0]);
        t.delete(0);
      end;
    except
    end;
  finally
    t.free;
  end;
end;

procedure TForm1.F76_doPrepareInjectInBSA(bsaName: string; tlistInject: tstringlist);
var
  tmpBsaName: string;
  bInject: boolean;
begin
  tmpBsaName := appendDatetoName(bsaName, 'tmp_');
  form23.addinfoLine(formatres('F76PatchingInjecting%d', [tlistInject.count]));
  bInject := F76_doInjectInBSA(bsaName, tmpBsaName, tlistInject);

  if bInject then
  begin
    Application.ProcessMessages;
    // NameReplace
    if RenameFile(bsaName, appendDatetoName(bsaName, 'bak_')) and RenameFile(tmpBsaName, bsaName) then
    begin
      form23.addinfoLine(getRes('F76PatchingSuccess'), 2);
      cleanBackupBa2(ExtractFilePath(bsaName), extractFileName(bsaName));
    end
    else
      form23.addinfoLine(formatres('F76RenamingErrors%s', [extractFileName(bsaName)]), 1);
  end
  else
    form23.addinfoLine(getRes('F76PatchingError'), 1);
end;

function TForm1.F76_doInjectInBSA(bsafile, bsaFileTmp: string; tlistInject: tstringlist): boolean;
var
  bStream: TObject;
begin
  bStream := nil;
  try
    if lowercase(extractFileExt(bsafile)) = '.ba2' then
      Result := injectFileInBa2(TwbBA2File(bStream), bsafile, bsaFileTmp, tlistInject)
    else
      Result := injectFileInBSA(TwbBSAFile(bStream), bsafile, bsaFileTmp, tlistInject);
  finally
    freeStreamArchive(bStream);
  end;
end;

// ---------

procedure TForm1.f76_doBackup(gamePath: string);
var
  i: integer;
begin
  if (gamePath = '') or not directoryexists(gamePath) then
    exit;
  ForceDirectories(gamePath + HeaderProcBackupDir);
  if f76_doBackupVerif(gamePath, 'F76Ask_NewBackup') then
    for i := 0 to pred(WizardBsaList.count) do
      f76_doBackupEx(gamePath, tinjector(WizardBsaList[i]).bsaName);
end;

function TForm1.f76_doBackupVerif(gamePath: string; Text: string): boolean;
var
  i: integer;
  b: boolean;
  bsaName: string;
begin
  Result := true;
  b := false;
  for i := 0 to pred(WizardBsaList.count) do
  begin
    bsaName := tinjector(WizardBsaList[i]).bsaName;
    if FileExists(gamePath + HeaderProcBackupDir + bsaName) then
    begin
      b := true;
      break;
    end;
  end;

  if b then
    Result := askDialog(getRes(Text), Form1, [askYes, askNo]) = mrYes;
end;

procedure TForm1.f76_doBackupEx(gamePath, bsaName: string);
begin
  if not FileExists(gamePath + bsaName) then
    exit;

  if CopyFile(PChar(gamePath + bsaName), PChar(gamePath + HeaderProcBackupDir + bsaName), false) then
    form23.addinfoLine(formatres('F76CreatingBackupFor%s', [bsaName]), 2)
  else
    form23.addinfoLine(formatres('F76CreatingBackupErrorFor%s', [bsaName]), 1);
end;

procedure TForm1.f76_doRestoreBackup(gamePath: string);
var
  i: integer;
begin
  if (gamePath = '') or not directoryexists(gamePath) then
    exit;
  ForceDirectories(gamePath + HeaderProcBackupDir);
  if f76_doBackupVerif(gamePath, 'F76Ask_restoreBackup') then
    for i := 0 to pred(WizardBsaList.count) do
      f76_doRestoreBackupEx(gamePath, tinjector(WizardBsaList[i]).bsaName);
end;

procedure TForm1.f76_doRestoreBackupEx(gamePath, bsaName: string);
begin
  if not FileExists(gamePath + HeaderProcBackupDir + bsaName) then
    exit;

  if CopyFile(PChar(gamePath + HeaderProcBackupDir + bsaName), PChar(gamePath + bsaName), false) then
    form23.addinfoLine(formatres('F76RestoredBackupFor%s', [bsaName]), 2)
  else
    form23.addinfoLine(formatres('F76RestoredErrorFor%s', [bsaName]), 1)
end;

procedure TForm1.SaveLocalizedClick(Sender: TObject);
begin
  if assigned(MainLoader) and assigned(MainLoader.espLoader) then
  begin
    MainLoader.doApplySst(SSTUserFolder + getSSTFileName(MainLoader.addon_name, 'sst'), compareEspStr_V4Strict, compareOptEverythingExLocked, nil, nil, bResetStateOpt, bApplyTagOnly, true);
    MainLoader.doApplySst(SSTUserFolder + getSSTFileName(MainLoader.addon_name, 'sst'), compareEspStr_V4Relax, compareOptNoTransExLocked, nil, nil, bResetStateOpt, bApplyTagOnly, true);
    MainLoader.updateAllRecordsForStringIDRestoration(false);
    MainLoader.espLoader.saveEsp(MainLoader.addon_folder + ChangeFileExt(MainLoader.addon_name, '.esp'));
    FinalizeStrings(MainLoader.addon_folder, MainLoader.addon_name);
    MainLoader.excludeInternalParam([StringIdChanged]);
  end;
end;

procedure TForm1.SaveLocalizedRandomClick(Sender: TObject);
begin
  if assigned(MainLoader) and assigned(MainLoader.espLoader) then
  begin
    MainLoader.updateAllRecordsForStringIDRestoration(true);
    MainLoader.espLoader.saveEsp(MainLoader.addon_folder + ChangeFileExt(MainLoader.addon_name, '.esp'));
    FinalizeStrings(MainLoader.addon_folder, MainLoader.addon_name);
    MainLoader.excludeInternalParam([StringIdChanged]);
  end;
end;

// ================BatchProcessor================================

procedure getTrimLowerStrValue(tVal: string; var sOut: string);
begin
  if tVal <> '' then
    sOut := lowercase(trim(tVal));
end;

function authNameForProc(folder: string): string;
begin
  Result := '';
  if folder <> '' then
  begin
    folder := cleanForbiddenChar(folder) + '\';
    if folder <> '' then
      Result := IncludeTrailingPathDelimiter(folder);
  end
end;

function authFolderForProc(folder: string): string;
begin
  Result := '';
  if folder <> '' then
    if directoryexists(folder) then
      Result := IncludeTrailingPathDelimiter(folder);
end;

procedure TForm1.BatchCommandClick(Sender: TObject);
begin

  batchCommands;
end;

procedure TForm1.batchCommands;
var
  sl, slRules, slcommand: tstringlist;
  i, j, nbRules: integer;
  openrule: boolean;
  filename: string;
  rCom: rCommandData;
begin
  form2.close;

  form24 := tform24.create(self);
  if FileExists(filename) then
  begin
    form24.filenamefull := filename;
    form24.synmemo.lines.loadfromfile(filename);
  end;

  form24.showmodal;
  nbRules := 0;

  openlog;
  sl := tstringlist.create;
  slRules := tstringlist.create;
  slcommand := tstringlist.create;
  try
    if form24.ModalResult = mrOK then
    begin

      sl.Text := form24.synmemo.Text;
      removeCommentLine(sl);

      // global
      rCom.GlobalVocab := '';
      rCom.GlobalImport := '';
      rCom.GlobalExport := '';
      getTrimLowerStrValue(sl.Values['global_vocabfolder'], rCom.GlobalVocab);
      rCom.GlobalVocab := authFolderForProc(rCom.GlobalVocab);
      getTrimLowerStrValue(sl.Values['global_importfolder'], rCom.GlobalImport);
      rCom.GlobalImport := authFolderForProc(rCom.GlobalImport);
      getTrimLowerStrValue(sl.Values['global_exportfolder'], rCom.GlobalExport);
      rCom.GlobalExport := authFolderForProc(rCom.GlobalExport);

      openrule := false;
      for i := 0 to sl.count - 1 do
      begin

        if lowercase(trim(sl[i])) = 'startrule' then
          openrule := true;
        if lowercase(trim(sl[i])) = 'endrule' then
        begin
          openrule := false;
          inc(nbRules);
          rCom.source := '';
          rCom.dest := '';
          rCom.usedatadir := true;
          rCom.customExport := '';

          // ---------------
          getTrimLowerStrValue(slRules.Values['exportsubfolder'], rCom.customExport);
          rCom.customExport := authNameForProc(rCom.customExport);

          getTrimLowerStrValue(slRules.Values['langsource'], rCom.source);
          getTrimLowerStrValue(slRules.Values['langdest'], rCom.dest);

          rCom.usedatadir := strtobooldef(lowercase(trim(slRules.Values['usedatadir'])), true);

          for j := 0 to slRules.count - 1 do
            if pos('command=', lowercase(trim(slRules[j]))) = 1 then
              slcommand.add(lowercase(copy(slRules[j], 9, maxInt)));

          dofeedback(strSeparator, false);
          dofeedback(formatres('batcherFbk_startRule%d', [nbRules]), false);
          runCommands(rCom, slcommand);
          dofeedback(formatres('batcherFbk_endRule%d', [nbRules]), false);
          dofeedback(strSeparator, false);

          slRules.clear;
          slcommand.clear;
        end;
        if openrule then
          slRules.add(trim(lowercase(sl[i])));
      end;

    end;

  finally
    slRules.free;
    sl.free;
    slcommand.free;
    form24.free;
    repaintTrees;
  end;

end;

procedure TForm1.batcherImportFile(rCom: rCommandData; param1, param2, filename: string; Mode: integer);
var
  fProc, fProcVmad, fprocVmadTrans: tcompareproc;
  proc: tListSortCompare;
begin
  {
    mode 0: apply form vocab
    mode 1: importsst
    mode 2: importxml
  }
  iCompareEspOpt[1] := strtointdef(param1, 0);
  if not inrange(iApplySSTModeOpt, 0, 4) then
    iApplySSTModeOpt := 0;
  iApplySSTModeOpt := strtointdef(param2, 0);
  if not inrange(iApplySSTModeOpt, 0, 3) then
    iApplySSTModeOpt := 1;
  bDontUseFilter := false;
  bApplyTagOnly := false;
  bResetStateOpt := false;
  fProc := getfProcCompareOpt(bDontUseFilter, iCompareEspOpt[1]);
  fProcVmad := getfProcCompareOptVMAD(bDontUseFilter, iCompareEspOpt[1]);
  fprocVmadTrans := getfProcCompareOptVMADString(bDontUseFilter, iCompareEspOpt[1]);
  proc := getProcSortCompare(iApplySSTModeOpt, true);
  if Mode = 0 then
  begin
    if rCom.GlobalVocab <> '' then
      filename := rCom.GlobalVocab + getSSTFileName(filename, 'sst')
    else
      filename := SSTUserFolder + getSSTFileName(filename, 'sst');
  end
  else if rCom.GlobalImport <> '' then
    filename := rCom.GlobalImport + extractFileName(filename);

  if assigned(MainLoader) and FileExists(filename) then
  begin
    case Mode of
      0 .. 1: MainLoader.doApplySst(filename, proc, fProc, fProcVmad, fprocVmadTrans, bResetStateOpt, bApplyTagOnly, false);
      2: XMLImportbase(filename, MainLoader.listArray, iApplySSTModeOpt, fProc, fProcVmad, fprocVmadTrans, bResetStateOpt);
    end;
    dofeedback(formatres('batcherFbk_importLang%s', [filename]), false);
  end
  else
    dofeedback(formatres('batcherFbk_importErrorLang%s', [filename]), false);
end;

procedure TForm1.runCommands(rCom: rCommandData; slcommand: tstringlist);
var
  filename: string;
  cacheResult: tstringlist;
  tmpStr: string;
  s: TStringArray;
  i, j, ApiId: integer;
  bApiNoTrans: boolean;
begin
  // language
  if (rCom.source <> '') and (rCom.dest <> '') then
    if SetLanguagePair(rCom.source, rCom.dest) then
      dofeedback(formatres('batcherFbk_changeLang%s%s', [rCom.source, rCom.dest]), false)
    else
      dofeedback(formatres('batcherFbk_changeErrorLang%s%s', [rCom.source, rCom.dest]), false);

  // command
  for i := 0 to slcommand.count - 1 do
  begin
    // file
    if pos('loadfile', slcommand[i]) = 1 then
    begin
      filename := copy(slcommand[i], 10, maxInt);
      if rCom.usedatadir and directoryexists(Game_EspFolder) then
        filename := Game_EspFolder + extractFileName(filename);
      if FileExists(filename) then
        openAddonCommandLine(filename)
      else
        dofeedback(formatres('batcherFbk_loadfileErrorLang%s', [filename]), false);
    end
    else if pos('apitranslation', slcommand[i]) = 1 then
    begin
      ApiId := strtointdef(copy(slcommand[i], 16, 1), 5);
      bApiNoTrans := strtobooldef(copy(slcommand[i], 18, 1), true);
      StartApiTranslationArray(false, bApiNoTrans, false, ApiId);
    end
    else if slcommand[i] = 'loadmasters' then
      LoadAllMasters
    else if slcommand[i] = 'finalize' then
    begin
      if assigned(MainLoader) then
      begin
        if rCom.customExport <> '' then
          SaveFile(rCom.customExport, 4)
        else
          SaveFile('');
      end
      else
        dofeedback(formatres('batcherFbk_savefileErrorLang%s', [filename]), false);
    end
    else if slcommand[i] = 'closefile' then
    begin
      closeCurrentLoader(true);
      dofeedback(getRes('batcherFbk_ClosingFile'), false);
    end
    else if slcommand[i] = 'closeall' then
    begin
      closeAllLoaders(true);
      dofeedback(getRes('batcherFbk_ClosingAllFile'), false);
    end
    else if slcommand[i] = 'savedictionary' then
    begin
      SaveSSTFiles(true);
    end
    else if slcommand[i] = 'generatedictionaries' then
    begin
      cacheResult := tstringlist.create;
      try
        for j := 0 to vocabFiles.count - 1 do
        begin
          tmpStr := ansilowercase(trim(vocabFiles.strings[j]));
          tmpStr := copy(tmpStr, 9, maxInt);
          s := Split(tmpStr, '.', 2);
          cacheResult.add(s[0]);
        end;
        LaunchBuildAdvancedCache(cacheResult, true);
      finally
        cacheResult.free;
      end;
    end
    else if pos('applysst', slcommand[i]) = 1 then
      batcherImportFile(rCom, copy(slcommand[i], 10, 1), copy(slcommand[i], 12, 1), copy(slcommand[i], 14, maxInt), 0)
    else if pos('importsst', slcommand[i]) = 1 then
      batcherImportFile(rCom, copy(slcommand[i], 11, 1), copy(slcommand[i], 13, 1), copy(slcommand[i], 15, maxInt), 1)
    else if pos('importxml', slcommand[i]) = 1 then
      batcherImportFile(rCom, copy(slcommand[i], 11, 1), copy(slcommand[i], 13, 1), copy(slcommand[i], 15, maxInt), 2);
  end;
  setTreeSortAndSort(3);
  VocabTree.Repaint;
end;

end.
