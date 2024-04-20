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

unit TESVT_LangPref;

interface

uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, StdCtrls, Menus, TESVT_const, TESVT_fstreamSave, TESVT_bsa, SynEdit, TESVT_Ressources,
  ExtCtrls, ComCtrls, Buttons, Grids, ValEdit, HTMLUn2, HtmlView, ShellAPI;

type
  TForm3 = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    CheckBoxOptSound: TCheckBox;
    GroupBox1: TGroupBox;
    CheckBoxOptBackup: TCheckBox;
    CheckBoxOptFolder: TCheckBox;
    Edit2: TEdit;
    CheckBox5: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckCacheTimer: TTimer;
    Button6: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    GroupBox3: TGroupBox;
    Label11: TLabel;
    Edit6: TEdit;
    Label3: TLabel;
    Edit1: TEdit;
    Button3: TButton;
    SpeedButton1: TSpeedButton;
    Button2: TButton;
    TabSheet3: TTabSheet;
    Panel3: TPanel;
    Label7: TLabel;
    ComboBox3: TComboBox;
    Label8: TLabel;
    CheckBox9: TCheckBox;
    Button8: TButton;
    PageControl2: TPageControl;
    TabSheet4: TTabSheet;
    memo1: TSynEdit;
    TabSheet5: TTabSheet;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    Memo3: TMemo;
    Memo4: TMemo;
    Button9: TButton;
    Button10: TButton;
    TabSheet6: TTabSheet;
    ValueListEditor1: TValueListEditor;
    ValueListEditor2: TValueListEditor;
    Panel5: TPanel;
    HtmlViewer1: THtmlViewer;
    Label14: TLabel;
    Label15: TLabel;
    Edit8: TEdit;
    UpDown2: TUpDown;
    Label16: TLabel;
    PageControl3: TPageControl;
    TabSheet7: TTabSheet;
    GroupBox4: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    Memo2: TMemo;
    Button7: TButton;
    Edit7: TEdit;
    TabSheet8: TTabSheet;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    Label10: TLabel;
    edit4: TEdit;
    Button4: TButton;
    Button5: TButton;
    edit5: TEdit;
    GroupBox7: TGroupBox;
    Label17: TLabel;
    Memo5: TMemo;
    Button11: TButton;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    GroupBox8: TGroupBox;
    CheckBox12: TCheckBox;
    Edit9: TEdit;
    TabSheet9: TTabSheet;
    GroupBox9: TGroupBox;
    CheckBox6: TCheckBox;
    Memo6: TMemo;
    Label18: TLabel;
    GroupBox10: TGroupBox;
    Edit10: TEdit;
    CheckBox13: TCheckBox;
    Button12: TButton;
    Label19: TLabel;
    CheckBoxLockGlobal: TCheckBox;
    Button13: TButton;
    PopupData: TPopupMenu;
    pathType1: TMenuItem;
    pathType2: TMenuItem;
    pathType3: TMenuItem;
    CheckBox14: TCheckBox;
    Button14: TButton;
    GroupBox11: TGroupBox;
    CheckBox15: TCheckBox;
    Button15: TButton;
    CheckBox3: TCheckBox;
    TabSheet10: TTabSheet;
    GroupBox12: TGroupBox;
    Label21: TLabel;
    Memo7: TMemo;
    Button16: TButton;
    Memo8: TMemo;
    Button17: TButton;
    CheckBox4: TCheckBox;
    CheckBox16: TCheckBox;
    GroupBox13: TGroupBox;
    Edit3: TEdit;
    UpDown1: TUpDown;
    Label9: TLabel;
    Edit11: TEdit;
    UpDown3: TUpDown;
    Label20: TLabel;
    SpeedButton2: TSpeedButton;
    Label22: TLabel;
    Edit12: TEdit;
    Button18: TButton;
    Label23: TLabel;
    Edit13: TEdit;
    Button19: TButton;
    procedure Edit1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure memo1SpecialLineColors(Sender: TObject; Line: Integer; var Special: Boolean; var FG, BG: TColor);
    procedure CheckBoxOptBackupClick(Sender: TObject);
    procedure Edit2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure CheckCacheTimerTimer(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Edit6Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure CheckBox9Click(Sender: TObject);
    procedure Edit7Click(Sender: TObject);
    procedure PageControl2Change(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Memo3Change(Sender: TObject);
    procedure ValueListEditor1SelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
    procedure ValueListEditor2GetPickList(Sender: TObject; const KeyName: string; Values: TStrings);
    procedure HtmlViewer1HotSpotClick(Sender: TObject; const SRC: string; var Handled: Boolean);
    procedure Button11Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit9Click(Sender: TObject);
    procedure Edit10Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure pathType1Click(Sender: TObject);
    procedure pathType2Click(Sender: TObject);
    procedure pathType3Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
  private
    updatePreview: Boolean;
    archiveNotChecked: Boolean;
    function checkLang: Boolean;
    procedure checkCacheStringIntegrity;
    function checkCacheFileStringIntegrity(slang, dlang, tmpstr, archive: string): Boolean;
    procedure addinfoLine(s: string; c: Integer = 0);
    procedure resetTimer;
    procedure updateGamePath;
    procedure resetRecent;
  public
    doReload: Boolean;
    bRestartNoprefs: Boolean;
    doCache: Integer;
    cacheResult: tstringList;
    RecentMenu: TMenuItem;
    procedure validEspBackupFolder(b: Boolean);
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

uses TESVT_main;

procedure TForm3.validEspBackupFolder(b: Boolean);
begin
  CheckBoxOptFolder.enabled := b;
  Edit2.enabled := b and CheckBoxOptFolder.checked;
  if not b then
    CheckBoxOptFolder.checked := false;
end;

procedure TForm3.ValueListEditor1SelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
begin
  CanSelect := ValueListEditor1.Cells[ARow, 0] <> '*=';
end;

procedure TForm3.ValueListEditor2GetPickList(Sender: TObject; const KeyName: string; Values: TStrings);
begin
  Values.Clear;
  Values.Add('0');
end;

function TForm3.checkLang: Boolean;
begin
  result := (ansilowercase(ComboBox1.Items[ComboBox1.ItemIndex]) <> ansilowercase(sourcelanguage)) or (ansilowercase(ComboBox2.Items[ComboBox2.ItemIndex]) <> ansilowercase(destlanguage));
end;

procedure TForm3.resetTimer;
begin
  CheckCacheTimer.enabled := false;
  CheckCacheTimer.enabled := true;
end;

procedure TForm3.SpeedButton1Click(Sender: TObject);
begin
  openQuickHtmlViewer(self, getRes('DictionariesInfo'), 320);
end;

procedure TForm3.SpeedButton2Click(Sender: TObject);
begin
  ShellExecute(Application.Handle, nil, 'explorer.exe', PChar(SSTUserFolder), nil, SW_NORMAL);
end;

procedure TForm3.ComboBox1Change(Sender: TObject);
var
  c: rCodepage;
begin
  c := getcodepage('_' + ComboBox1.Items[ComboBox1.ItemIndex], codepageFiles, '', '');

  Label4.Caption := format('[%s]', [c.s]);
  if c.s <> c.sFallback then
    Label4.Caption := Label4.Caption + format('>[%s]', [c.sFallback]);
  Button3.enabled := ComboBox1.ItemIndex <> ComboBox2.ItemIndex;
  resetTimer;
end;

procedure TForm3.ComboBox2Change(Sender: TObject);
begin
  Label5.Caption := format('[%s]', [getcodepage('_' + ComboBox2.Items[ComboBox2.ItemIndex], codepageFiles, '', '').s]);
  Button3.enabled := ComboBox1.ItemIndex <> ComboBox2.ItemIndex;
  resetTimer;
end;

procedure TForm3.Edit10Click(Sender: TObject);
var
  fPath: string;
begin
  fPath := OpenFileDialog(getRes('Dia_chooseExternaldeCompiler'), extractfilepath(Edit10.Text), extractfilename(Edit10.Text), '.exe');
  if fPath <> '' then
    Edit10.Text := fPath;
end;

procedure TForm3.Edit1Click(Sender: TObject);
begin
  Edit1.Text := GetDirectory(getRes('Dia_chooseStringDir'), Edit1.Text);
  resetTimer;
end;

procedure TForm3.Edit2Click(Sender: TObject);
begin
  Edit2.Text := GetDirectory(getRes('Dia_chooseBackupDir'), Edit2.Text);
end;

procedure TForm3.Edit6Click(Sender: TObject);
begin
  Edit6.Text := GetDirectory(getRes('Dia_chooseDataDir'), Edit6.Text);
  setallpath(Edit6.Text);
  updateGamePath;
end;

procedure TForm3.Edit7Click(Sender: TObject);
begin
  Edit7.Text := GetDirectory(getRes('Dia_chooseDataDir'), Edit7.Text);
end;

procedure TForm3.Edit9Click(Sender: TObject);
begin
  Edit9.Text := GetDirectory(getRes('Dia_chooseFixedDir'), Edit9.Text);
end;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  doReload := checkLang or (doCache > 0);
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
  updatePreview := true;
  bRestartNoprefs := false;
  cacheResult := tstringList.create;
  getressourcedir(mainpath + sstResPath + '*.*', lang_res, ComboBox3);
  init_caption(self);
  HtmlViewer1.LoadFromString(getRes('TranslatorAPIInfo2'));
  doCache := 0;
  archiveNotChecked := true;
  pathType1.visible := aGameSteam[CURRENT_GAME_ID];
  pathType2.visible := aGameBnet[CURRENT_GAME_ID];
  pathType3.visible := aGamePTS[CURRENT_GAME_ID];
end;

procedure TForm3.FormDestroy(Sender: TObject);
begin
  cacheResult.free;
end;

procedure TForm3.FormShow(Sender: TObject);
begin
  PageControl1Change(nil);
end;

procedure TForm3.HtmlViewer1HotSpotClick(Sender: TObject; const SRC: string; var Handled: Boolean);
var
  i, j, k: Integer;
begin
  Handled := false;
  i := pos('FTP:', UpperCase(SRC));
  j := pos('HTTP:', UpperCase(SRC));
  k := pos('HTTPS:', UpperCase(SRC));
  if (i > 0) or (j > 0) or (k > 0) then
  begin
    ShellExecute(0, nil, @SRC[1], nil, nil, SW_SHOWNORMAL);
    Handled := true;
  end;
end;

procedure TForm3.memo1SpecialLineColors(Sender: TObject; Line: Integer; var Special: Boolean; var FG, BG: TColor);
var
  c: Integer;
begin
  BG := gradient(clWhite);
  if assigned(memo1.Lines.Objects[Line - 1]) then
  begin
    c := Integer(memo1.Lines.Objects[Line - 1]);
    case c of
      1: BG := TColor($CCCCFF);
      2: BG := TColor($CCFFCC);
    end;
  end;
end;

procedure TForm3.Memo3Change(Sender: TObject);
begin
  updatePreview := true;
end;

procedure TForm3.PageControl1Change(Sender: TObject);
begin
  if (PageControl1.ActivePageIndex = 0) and archiveNotChecked then
  begin
    ComboBox1Change(nil);
    ComboBox2Change(nil);
    addinfoLine(getRes('fbk_CacheCompute'));
    archiveNotChecked := false;
  end;
end;

procedure TForm3.PageControl2Change(Sender: TObject);
begin
  if PageControl2.ActivePageIndex = 0 then
    if updatePreview then
      resetTimer;
end;

procedure TForm3.pathType1Click(Sender: TObject);
begin
  getAllGamePath(1);
  updateGamePath;
end;

procedure TForm3.pathType2Click(Sender: TObject);
begin
  getAllGamePath(2);
  updateGamePath;
end;

procedure TForm3.pathType3Click(Sender: TObject);
begin
  getAllGamePath(3);
  updateGamePath;
end;

procedure TForm3.checkCacheStringIntegrity;
var
  i: Integer;
  tmpstr: string;
  slang, dlang: string;
  s: TStringArray;
begin
  // --------
  updatePreview := false;
  cacheResult.Clear;
  self.enabled := false;
  screen.Cursor := crHourGlass;
  memo1.Clear;
  addinfoLine(getRes('fbk_CacheCompute'));
  memo1.repaint;
  memo1.Lines.BeginUpdate;
  memo1.Clear;

  // ----------
  addinfoLine(fbk_Cacheinfo);
  slang := ansilowercase(ComboBox1.Items[ComboBox1.ItemIndex]);
  dlang := ansilowercase(ComboBox2.Items[ComboBox2.ItemIndex]);
  for i := 0 to vocabFiles.count - 1 do
  begin
    // load
    tmpstr := ansilowercase(trim(vocabFiles.strings[i]));
    tmpstr := copy(tmpstr, 9, maxint);
    s := Split(tmpstr, '.', 2);
    if checkCacheFileStringIntegrity(slang, dlang, s[0], s[1]) then
      cacheResult.Add(s[0]);
  end;
  memo1.Lines.EndUpdate;
  screen.Cursor := crDefault;
  self.enabled := true;
  // clean progress
  ProgressBar.max := 100;
  ProgressBar.Position := ProgressBar.max;
  ProgressBar.repaint;
end;

procedure TForm3.CheckCacheTimerTimer(Sender: TObject);
begin
  CheckCacheTimer.enabled := false;
  checkCacheStringIntegrity;
end;

procedure TForm3.Button10Click(Sender: TObject);
begin
  Memo4.Text := defaultBSAAlias[CURRENT_GAME_ID];
end;

procedure TForm3.Button11Click(Sender: TObject);
begin
  Memo5.Text := defaultDerivedRegex;
end;

procedure TForm3.Button12Click(Sender: TObject);
begin
  Memo6.Text := defaultscriptdef[CURRENT_GAME_ID];
end;

procedure TForm3.Button3Click(Sender: TObject);
begin
  if warnForcedCodepage then
  begin
    doCache := 1;
    modalResult := mrOk;
  end;
end;

procedure TForm3.Button4Click(Sender: TObject);
begin
  edit4.Text := rxPatternNumber;
end;

procedure TForm3.Button5Click(Sender: TObject);
begin
  edit5.Text := rxPatternAlias;
end;

procedure TForm3.Button18Click(Sender: TObject);
begin
  Edit12.Text := rxPatternAliasStrict;
end;

procedure TForm3.Button19Click(Sender: TObject);
begin
  Edit13.Text := rxPatternWord;
end;

procedure TForm3.Button6Click(Sender: TObject);
begin
  fillchar(askPrefsArray, SizeOf(askPrefsArray), 0);
  doFeedback(getRes('fbk_resetDialogs'), true);
end;

procedure TForm3.Button7Click(Sender: TObject);
begin
  Memo2.Text := defaultFUZBSA;
end;

procedure TForm3.Button8Click(Sender: TObject);
begin
  resetRecent;
  doFeedback(getRes('fbk_resetRecent'), true);
end;

procedure TForm3.Button9Click(Sender: TObject);
begin
  Memo3.Text := defaultBSAdef[CURRENT_GAME_ID];
end;

procedure TForm3.CheckBox9Click(Sender: TObject);
begin
  resetTimer;
end;

procedure TForm3.CheckBoxOptBackupClick(Sender: TObject);
begin
  validEspBackupFolder(CheckBoxOptBackup.checked);
end;

function TForm3.checkCacheFileStringIntegrity(slang, dlang, tmpstr, archive: string): Boolean;
var
  j: Integer;
  tmpfilename1, tmpfilename2, bsafilename: string;
  b: Boolean;
  bStream: TObject;
  authbsa: Boolean;
  buffer: tbytes;
  bfile: array [0 .. 2, 0 .. 1] of byte;
begin
  b := true;
  result := false;
  bStream := nil;
  authbsa := (not CheckBox9.checked) and getBSAFileName(Memo3.Lines, Memo4.Lines, bsafilename, Edit6.Text, tmpstr);

  tmpfilename1 := format('%s%s_%s', [Edit1.Text, tmpstr, slang]);
  tmpfilename2 := format('%s%s_%s', [Edit1.Text, tmpstr, dlang]);

  try
    // checking integrity
    for j := 0 to 2 do
    begin
      if (authbsa and getStringfromArchive(bStream, buffer, bsafilename, strBSAfolder, tmpstr + '_' + slang, strList[j], false)) then
        bfile[j, 0] := 2
      else if authFileAccess(tmpfilename1 + strList[j]) then
        bfile[j, 0] := 1
      else
        bfile[j, 0] := 0;
      // ----------
      if (authbsa and getStringfromArchive(bStream, buffer, bsafilename, strBSAfolder, tmpstr + '_' + dlang, strList[j], false)) then
        bfile[j, 1] := 2
      else if authFileAccess(tmpfilename2 + strList[j]) then
        bfile[j, 1] := 1
      else
        bfile[j, 1] := 0;
      b := b and (bfile[j, 0] > 0) and (bfile[j, 1] > 0);
    end;
    if b then
    begin
      result := true;
      addinfoLine(format(fbk_FileGen, [tmpstr]), ord(b) + 1);
    end
    else
      addinfoLine(format(fbk_NoFileGen, [tmpstr]), ord(b) + 1);

    addinfoLine(fbk_Details);
    for j := 0 to 2 do
      addinfoLine(format('  %s: %s [%s] %s [%s] : %s', [tmpstr, slang, resfoundTag[bfile[j, 0]], dlang, resfoundTag[bfile[j, 1]], resgenTag[ord(b)]]), ord(b) + 1);
    addinfoLine('');
  finally
    freeStreamArchive(bStream);
  end;
end;

procedure TForm3.addinfoLine(s: string; c: Integer = 0);
begin
  memo1.Lines.AddObject(s, TObject(c));
end;

procedure TForm3.resetRecent;
begin
  RecentMenu.Clear;
  RecentMenu.enabled := false;
  recentAddon.Clear;
end;

procedure TForm3.updateGamePath;
begin
  Edit1.Text := Game_CacheStringFolder;
  Edit6.Text := Game_CacheDataFolder;
  Edit7.Text := Game_FuzDataFolder;
  Edit2.Text := EspBackup_Folder;
  Edit9.Text := Game_EspFolderFixedExport;
  resetRecent;
  resetTimer;
end;

procedure TForm3.Button13Click(Sender: TObject);
begin
  getAllGamePath(0);
  updateGamePath;
end;

procedure TForm3.Button14Click(Sender: TObject);
begin
  bRestartNoprefs := true;
end;

procedure TForm3.Button15Click(Sender: TObject);
begin
  deleteDataCachefileFolder(datacache, DATACACHE_EXT);
  doFeedback(getRes('fbk_resetDataCache'), true);
end;

procedure TForm3.Button16Click(Sender: TObject);
begin
  Memo7.Text := lRulesNoTransListInDefault;
end;

procedure TForm3.Button17Click(Sender: TObject);
begin
  Memo8.Text := lRulesNoTransListOutDefault;
end;


end.
