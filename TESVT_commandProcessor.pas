unit TESVT_commandProcessor;

interface

uses
  Windows, Messages, Math, SysUtils, Classes, Controls, Forms, Dialogs, TESVT_Ressources, StdCtrls, ExtCtrls, TESVT_Const, SynEdit, Vcl.Menus;

type
  TForm24 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    synmemo: TSynEdit;
    but_Run: TButton;
    cancel: TButton;
    MainMenu1: TMainMenu;
    Menu_files: TMenuItem;
    menu_Load: TMenuItem;
    menu_save: TMenuItem;
    ListBox1: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure menu_LoadClick(Sender: TObject);
    procedure menu_saveClick(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
    procedure but_RunClick(Sender: TObject);
  private
  public
    filenamefull: string;
  end;

var
  Form24: TForm24;

const
  tmpprocfile = '~processor.tmp';

implementation

{$R *.dfm}

procedure TForm24.but_RunClick(Sender: TObject);
begin
  try
    synmemo.Lines.SaveToFile(mainpath + CURRENT_PREFS_SUBFOLDER + BatchprocessorPath + tmpprocfile, TEncoding.UTF8);
  finally
  end;
end;

procedure TForm24.FormCreate(Sender: TObject);
begin
  init_caption(self);
  filenamefull := '';
  ForceDirectories(mainpath + CURRENT_PREFS_SUBFOLDER + BatchprocessorPath);
  ListBox1.Font.Name := virtualTreeFixedFont;

  try
    if fileExists(mainpath + CURRENT_PREFS_SUBFOLDER + BatchprocessorPath + tmpprocfile) then
      synmemo.Lines.loadFromFile(mainpath + CURRENT_PREFS_SUBFOLDER + BatchprocessorPath + tmpprocfile);
  finally
  end;

end;

procedure TForm24.ListBox1DblClick(Sender: TObject);
var
  line: string;
  lIndex: integer;
begin
  lIndex := synmemo.CaretY;
  if ListBox1.ItemIndex >= 0 then
    line := ListBox1.Items[ListBox1.ItemIndex];
  if (pos('-', line) <> 1) then
    if synmemo.Lines[lIndex - 1] = '' then
      synmemo.Lines[lIndex - 1] := line
    else
      synmemo.Lines.add(line);
end;

procedure TForm24.menu_LoadClick(Sender: TObject);
var
  filename: string;
begin
  filename := OpenFileDialog(getRes('BatchProcessor'), mainpath + CURRENT_PREFS_SUBFOLDER + BatchprocessorPath, '', 'TXT|*.TXT');
  if not fileExists(filename) then
    exit;
  try
    filenamefull := filename;
    synmemo.Lines.loadFromFile(filename);
  finally
  end;
end;

procedure TForm24.menu_saveClick(Sender: TObject);
var
  filename, filepath: string;
begin
  filename := ExtractFileName(filenamefull);
  filepath := ExtractFilePath(filenamefull);
  filename := SaveFileDialog(getRes('Dia_SaveBatch'), filepath, filename, 'TXT|*.TXT');
  try
    if filename <> '' then
    begin
      filename:= changefileext(filename, sTxtExt);
      synmemo.Lines.SaveToFile(filename, TEncoding.UTF8);
    end;
  finally
  end;
end;

end.
