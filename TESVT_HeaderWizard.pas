unit TESVT_HeaderWizard;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.WinXCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, TESVT_Const, TESVT_Ressources, ShellAPI, SynEdit,
  Vcl.Buttons, TESVT_CustomList;

type
  tinjector = class
    bsaName: string;
    filesName, restricted: tstringlist;
    constructor create(bsa: string);
    Destructor Destroy; override;
    Function langAuth(lang: string): boolean;
  end;

  TForm23 = class(TForm)
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    ActivityIndicator1: TActivityIndicator;
    ComboBox2: TComboBox;
    ButtonLoadRules: TButton;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    CheckBox1: TCheckBox;
    Button7: TButton;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    ListBox1: TListBox;
    Label8: TLabel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Panel2: TPanel;
    Panel3: TPanel;
    Label7: TLabel;
    SpeedButton1: TSpeedButton;
    Button5: TButton;
    Button6: TButton;
    Button4: TButton;
    Memo1: TSynEdit;
    procedure Button1Click(Sender: TObject);
    procedure ButtonLoadRulesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure loadList(filename: string = '');
    procedure FormShow(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Memo1SpecialLineColors(Sender: TObject; Line: Integer; var Special: boolean; var FG, BG: TColor);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  protected
    bCancloseW: boolean;
    procedure WMDropFiles(var Msg: TMessage); message WM_DROPFILES;
    procedure createInjectorList;
  private
  var
    bFirstTime: boolean;
    procedure addToListBox(filename: string);
    function AuthFileList: boolean;
  public
    rulelistloaded: boolean;
    doMcM: boolean;
    procedure cancloseW(b: boolean);
    procedure authProcess;
    procedure addinfoLine(s: string; c: Integer = 0);
    procedure AutoloadList;
  end;

var
  Form23: TForm23;
  WizardBsaList: tlist;
  HeaderProcEsm: string;
  HeaderProcBackupDir: string;
  HeaderProctranslateBaseFile: string;
  HeaderProctranslateBaseExt: string;
  HeaderProcMcMLoadFrom: string;
  HeaderProcsAuthInjection: boolean = false;
  Supportedlangs: tstringlist;

const
  defautHeaderRules = '_HeaderRules\HeaderRules.txt';

  // Const
  // Fallout76BackupDir = '_Ba2Backup\';
  // Fallout76translateBaseFile = 'interface\translate_';
  // Fallout76translateBaseExt = '.txt';
  {
    Fallout76InterfaceBSA = 'SeventySix - Interface.ba2';
    Fallout76LocalBSA = 'SeventySix - Localization.ba2';
    Fallout76InterfaceInject: array [0 .. 18] of string = ( //
    'interface\fontconfig_de.txt', //
    'interface\fontconfig_en.txt', //
    'interface\fontconfig_es.txt', //
    'interface\fontconfig_esmx.txt', //
    'interface\fontconfig_fr.txt', //
    'interface\fontconfig_it.txt', //
    'interface\fontconfig_ja.txt', //
    'interface\fontconfig_ko.txt', //
    'interface\fontconfig_pl.txt', //
    'interface\fontconfig_ptbr.txt', //
    'interface\fontconfig_ru.txt', //
    'interface\fontconfig_zhhans.txt', //
    'interface\fontconfig_zhhant.txt', //
    'interface\fonts_en.swf', //
    'interface\fonts_ru.swf', //
    'interface\fonts_ja.swf', //
    'interface\fonts_ko.swf', //
    'interface\fonts_zhhans.swf', //
    'interface\fonts_zhhant.swf' //
    );

    Fallout76LocalInject: array [0 .. 12] of string = ( //
    'interface\translate_de.txt', //
    'interface\translate_en.txt', //
    'interface\translate_es.txt', //
    'interface\translate_esmx.txt', //
    'interface\translate_fr.txt', //
    'interface\translate_it.txt', //
    'interface\translate_ja.txt', //
    'interface\translate_ko.txt', //
    'interface\translate_pl.txt', //
    'interface\translate_ptbr.txt', //
    'interface\translate_ru.txt', //
    'interface\translate_zhhans.txt', //
    'interface\translate_zhhant.txt' //
    ); //
  }
implementation

uses tesvt_main;

{$R *.dfm}

constructor tinjector.create(bsa: string);
begin
  bsaName := bsa;
  filesName := tstringlist.create;
  restricted := tstringlist.create;
  restricted.Delimiter := ',';
  restricted.StrictDelimiter := true;
end;

destructor tinjector.Destroy;
begin
  filesName.free;
  restricted.free;
  inherited;
end;

Function tinjector.langAuth(lang: string): boolean;
begin
  result := (restricted.count = 0) or (restricted.indexof(lang) >= 0);
end;

procedure TForm23.addinfoLine(s: string; c: Integer = 0);
begin
  Memo1.Lines.AddObject(s, TObject(c));
  Memo1.SelStart := Memo1.GetTextLen;
  Memo1.Perform(EM_SCROLLCARET, 0, 0);
end;

function TForm23.AuthFileList: boolean;
var
  i: Integer;
begin
  if ListBox1.items.count = 0 then
    exit(false);
  for i := 0 to ListBox1.items.count - 1 do
    if fileexists(Game_CacheDataFolder + ListBox1.items[i]) then
      exit(true);
  result := false;
end;

procedure TForm23.authProcess;
begin
  Button1.enabled := rulelistloaded and AuthFileList;
end;

procedure TForm23.cancloseW(b: boolean);
begin
  bCancloseW := b;
  self.enabled := b;
  { lockForm(self, b);
    Button1.enabled := b
    Button4.enabled := b;
    Button5.enabled := b;
    Button6.enabled := b; }
  update;
end;

procedure TForm23.ComboBox1Change(Sender: TObject);
begin
  authProcess;
end;

procedure TForm23.ComboBox2Change(Sender: TObject);
begin
  authProcess;
end;

procedure TForm23.Button1Click(Sender: TObject);
var
  i, j, k: Integer;
begin
  cancloseW(false);
  CancelStuff := false;
  if ComboBox2.itemIndex < 0 then
    exit;
  ActivityIndicator1.startAnimation;
  if CheckBox2.checked then
  begin
    // lang
    for i := 0 to ComboBox2.items.count - 1 do
    begin
      // template
      for j := 0 to ComboBox1.items.count - 1 do
      begin
        if CheckBox3.checked then
          ComboBox1.itemIndex := j;

        if doMcM then
          form1.executeWizardMCM(Edit1.text + HeaderProcMcMLoadFrom, HeaderProctranslateBaseFile, ComboBox2.items[i], HeaderProctranslateBaseExt, true);

        for k := 0 to ListBox1.items.count - 1 do
          form1.executeWizard(Edit1.text + ListBox1.items[k], ComboBox2.items[i], true);
        if not CheckBox3.checked then
          break;
        application.ProcessMessages;
        if CancelStuff then
          break;
      end;
      if CancelStuff then
        break;
    end
  end
  else
  begin
    if doMcM then
      form1.executeWizardMCM(Edit1.text + HeaderProcMcMLoadFrom, HeaderProctranslateBaseFile, ComboBox2.items[ComboBox2.itemIndex], HeaderProctranslateBaseExt);
    for k := 0 to ListBox1.items.count - 1 do
      form1.executeWizard(Edit1.text + ListBox1.items[k], ComboBox2.items[ComboBox2.itemIndex]);
  end;
  addinfoLine(strSeparator, 2);
  addinfoLine(getRes('Fbk_WizardCompleted'), 2);
  ActivityIndicator1.stopAnimation;
  cancloseW(true);
end;

procedure TForm23.Button2Click(Sender: TObject);
begin
  bAutocloseWithWizard := CheckBox1.checked;
end;

procedure TForm23.AutoloadList;
begin
  if not rulelistloaded then
    if fileexists(Game_CacheDataFolder + defautHeaderRules) then
      loadList(Game_CacheDataFolder + defautHeaderRules);
end;

procedure TForm23.loadList(filename: string = '');
begin
  cancloseW(false);
  ActivityIndicator1.startAnimation;
  form1.loadListRulesWizard(filename);
  ActivityIndicator1.stopAnimation;
  authProcess;
  cancloseW(true);
end;

procedure TForm23.Memo1SpecialLineColors(Sender: TObject; Line: Integer; var Special: boolean; var FG, BG: TColor);
var
  c: Integer;
begin
  BG := gradient(clWhite);
  if assigned(Memo1.Lines.Objects[Line - 1]) then
  begin
    c := Integer(Memo1.Lines.Objects[Line - 1]);
    case c of
      1: BG := TColor($AAAAFF);
      2: BG := TColor($AAFFAA);
    end;
  end;
end;

procedure TForm23.SpeedButton1Click(Sender: TObject);
begin
  if fileexists(Game_CacheDataFolder + HeaderProcEsm) then
  begin
    ForceDirectories(Game_CacheDataFolder + 'Interface');
    ShellExecute(application.Handle, nil, 'explorer.exe', PChar(Game_CacheDataFolder), nil, SW_NORMAL);
  end;
end;

procedure TForm23.SpeedButton2Click(Sender: TObject);
var
  filenames: tstringlist;
  i: Integer;
begin
  filenames := tstringlist.create;
  try
    if OpenFileDialogMulti('', Game_CacheDataFolder, '', espFilter, filenames) then
      for i := 0 to filenames.count - 1 do
        addToListBox(filenames[i]);
  finally
    filenames.free;
    authProcess;
  end;
end;

procedure TForm23.SpeedButton3Click(Sender: TObject);
begin
  deleteListEntry(ListBox1);
  authProcess;
end;

procedure TForm23.addToListBox(filename: string);
var
  tmpStr: string;
begin
  tmpStr := extractfilename(filename);
  if ListBox1.items.indexof(tmpStr) = -1 then
    ListBox1.items.Add(extractfilename(tmpStr));
end;

procedure TForm23.ButtonLoadRulesClick(Sender: TObject);
begin
  loadList;
end;

procedure TForm23.Button4Click(Sender: TObject);
begin
  cancloseW(false);
  ActivityIndicator1.startAnimation;
  form1.f76_PatchFileWizard(Edit1.text, ComboBox2.items[ComboBox2.itemIndex]);
  ActivityIndicator1.stopAnimation;
  cancloseW(true);
end;

procedure TForm23.Button5Click(Sender: TObject);
begin
  cancloseW(false);
  ActivityIndicator1.startAnimation;
  form1.f76_doBackup(Edit1.text);
  ActivityIndicator1.stopAnimation;
  cancloseW(true);
end;

procedure TForm23.Button6Click(Sender: TObject);
begin
  cancloseW(false);
  ActivityIndicator1.startAnimation;
  form1.f76_dorestoreBackup(Edit1.text);
  ActivityIndicator1.stopAnimation;
  cancloseW(true);
end;

procedure TForm23.Button7Click(Sender: TObject);
var
  i: Integer;
begin
  cancloseW(false);
  form1.OpenOptions(0);
  if fileexists(Game_CacheDataFolder + HeaderProcEsm) then
    Edit1.text := Game_CacheDataFolder
  else
    Edit1.text := getRes('FileNotFound') + '\';

  for i := 0 to pred(Supportedlangs.count) do
  begin
    if ansilowercase(Sourcelanguage) = Supportedlangs[i] then
      Form23.ComboBox2.itemIndex := i;
  end;

  cancloseW(true);
end;

procedure TForm23.FormActivate(Sender: TObject);
begin
  if bFirstTime then
  begin
    AutoloadList;
    bFirstTime := false;
  end;

end;

procedure TForm23.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  CanClose := bCancloseW;
end;

procedure TForm23.FormCreate(Sender: TObject);
begin
  bFirstTime := true;
  DragAcceptFiles(self.Handle, true);
  init_caption(self);
  rulelistloaded := false;
  doMcM := false;
  CheckBox1.checked := bAutocloseWithWizard;
  createInjectorList;
{$IFDEF DEBUG}
  CheckBox2.Visible := true;
  CheckBox3.Visible := true;
{$ENDIF}
end;

procedure TForm23.FormDestroy(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to pred(WizardBsaList.count) do
    tinjector(WizardBsaList[i]).free;
  Supportedlangs.free;

  DragAcceptFiles(self.Handle, false);
end;

procedure TForm23.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    CancelStuff := true;
end;

procedure TForm23.FormShow(Sender: TObject);
begin
  cancloseW(true);

    authProcess;
end;

procedure TForm23.WMDropFiles(var Msg: TMessage);
var
  DropH: THandle;
  DroppedFileCount: Integer;
  FileNameLength: Integer;
  filename, ext: string;
  i: Integer;
begin
  inherited;
  DropH := Msg.wParam;
  try
    DroppedFileCount := DragQueryFile(DropH, $FFFFFFFF, nil, 0);

    for i := 0 to pred(DroppedFileCount) do
    begin
      FileNameLength := DragQueryFile(DropH, i, nil, 0);
      SetLength(filename, FileNameLength);
      DragQueryFile(DropH, i, PChar(filename), FileNameLength + 1);
      ext := ansilowercase(extractFileExt(filename));

      if (ext = '.txt') then
        loadList(filename)
      else if (ext = '.esp') or (ext = '.esm') or (ext = '.esl') then
        addToListBox(filename);
    end;

  finally
    DragFinish(DropH);

  end;
  Msg.result := 0;
end;

procedure TForm23.createInjectorList;
var
  iSetting: tmcStringList;
  bsaCount, bsaFilesCount, i, j: Integer;
  bsaName, bsaFileName: string;
  tInj: tinjector;
begin
  iSetting := tmcStringList.create;
  try
    if authFileAccess(mainpath + CURRENT_GAME_SUBFOLDER + HeaderWizardIni) then
      iSetting.loadfromfile(mainpath + CURRENT_GAME_SUBFOLDER + HeaderWizardIni);
  except
  end;

  // getparams
  Supportedlangs := tstringlist.create;
  Supportedlangs.Delimiter := ',';
  Supportedlangs.StrictDelimiter := true;
  Supportedlangs.DelimitedText := ansilowercase(iSetting.valueTrim('WizardProcessSupportedLang'));
  HeaderProcEsm := iSetting.valueTrim('WizardProcessEsp');

  if (HeaderProcEsm = '') or (Supportedlangs.count = 0) then
    exit;

  HeaderProcBackupDir := iSetting.valueTrim('WizardProcessBackupDir');
  HeaderProctranslateBaseFile := iSetting.valueTrim('WizardProcessEspMcMBaseFile');
  HeaderProctranslateBaseExt := iSetting.valueTrim('WizardProcessEspMcMBaseExt');
  HeaderProcMcMLoadFrom := iSetting.valueTrim('WizardProcessEspMcMLoadFrom');
  HeaderProcsAuthInjection := strtobooldef(iSetting.valueTrim('WizardProcessAuthInjection'), false);

  Panel3.Visible := HeaderProcsAuthInjection;

  WizardBsaList := tlist.create;
  bsaCount := iSetting.ValueInt('InjectBsaCount');
  for i := 1 to bsaCount do
  begin
    HeaderProcMcMLoadFrom := iSetting.valueTrim('WizardProcessEspMcMLoadFrom');
    bsaName := iSetting.valueTrim('InjectBsa_' + inttostr(i));
    bsaFilesCount := iSetting.ValueInt('InjectBsaFile_' + inttostr(i) + '_Count');
    if (bsaName <> '') and (bsaFilesCount > 0) then
    begin
      tInj := tinjector.create(bsaName);
      tInj.restricted.DelimitedText := ansilowercase(iSetting.valueTrim('InjectBsaFileRestrictedLang_' + inttostr(i)));
      for j := 1 to bsaFilesCount do
      begin
        bsaFileName := iSetting.valueTrim('InjectBsaFile_' + inttostr(i) + '_' + inttostr(j));
        if bsaFileName <> '' then
          tInj.filesName.Add(bsaFileName);
      end;
      if tInj.filesName.count = 0 then
        tInj.free
      else
        WizardBsaList.Add(tInj);
    end;

  end;

end;

end.
