unit TESVT_DefUIGen;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ShellAPI, StdCtrls, ExtCtrls, TESVT_espdefinition, TESVT_Ressources, TESVT_Const, Grids, ValEdit, ComCtrls;

type
  TForm18 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Button3: TButton;
    ComboBox1: TComboBox;
    RadioGroup1: TRadioGroup;
    ValueListEditor1: TValueListEditor;
    CheckBox3: TCheckBox;
    Memo1: TMemo;
    Memo2: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
  protected
    procedure WMDropFiles(var Msg: TMessage); message WM_DROPFILES;
  private

    procedure LoadOptions(filename: string);
    procedure formatOptions;
  public
    eLoader: tEspLoader;
    procedure UpdateKeyInfo;
  end;

var
  Form18: TForm18;

implementation

{$R *.dfm}

procedure TForm18.Button3Click(Sender: TObject);
begin
  ValueListEditor1.Strings.text:= DefaultdefUIoptions[CURRENT_GAME_ID];
  formatOptions;
  Memo1.Lines.text:= defaultDefUIIgnoreList[CURRENT_GAME_ID];
end;

procedure TForm18.FormCreate(Sender: TObject);
begin
  ComboBox1.font.name:= defaultSynFont;
  ValueListEditor1.font.name:= defaultSynFont;
  Memo1.font.name:= defaultSynFont;
  Memo2.font.name:= defaultSynFont;

  init_caption(self);
  eLoader:= nil;
  DragAcceptFiles(Handle, true);

end;

procedure TForm18.FormShow(Sender: TObject);
begin
  formatOptions;
end;

procedure TForm18.Memo1Change(Sender: TObject);
begin
  UpdateKeyInfo;
end;

procedure TForm18.UpdateKeyInfo;
var
  i: integer;
  key: cardinal;
begin
  if not assigned(eLoader) then
    exit;
  Memo2.clear;
  for i:= 0 to pred(Memo1.Lines.count) do
  begin
    key:= strtointdef('$' + Memo1.Lines[i], 0);
    if key <> 0 then
      Memo2.Lines.Add(eLoader.findKeyWord(key, nil));
  end;
end;

procedure TForm18.LoadOptions(filename: string);
var
  l: TStringlist;
  i: integer;
  bOpenOpt: boolean;
begin
  bOpenOpt:= false;
  l:= loadStringList(filename, false);
  for i:= 0 to pred(l.count) do
  begin
    if l[i] = '[DefUIOptStart]' then
    begin
      ValueListEditor1.Strings.clear;
      bOpenOpt:= true;
    end
    else if l[i] = '[DefUIOptEnd]' then
      bOpenOpt:= false
    else if bOpenOpt then
      ValueListEditor1.Strings.Add(l[i]);
  end;
  if ValueListEditor1.Strings.count = 0 then
    ValueListEditor1.Strings.text:= DefaultdefUIoptions[CURRENT_GAME_ID];
  formatOptions;
  l.free;
end;

procedure TForm18.formatOptions;
var
  tmp: string;
  i: integer;
begin
  for i:= 0 to ValueListEditor1.Strings.count - 1 do
  begin
    tmp:= ValueListEditor1.Keys[i];
    if (length(tmp) > 1) and (tmp[1] = 'b') then
    begin
      ValueListEditor1.ItemProps[i].EditStyle:= esPickList;
      ValueListEditor1.ItemProps[i].ReadOnly:= true;
      if ValueListEditor1.values[ValueListEditor1.Keys[i]] = 'True' then
      begin
        ValueListEditor1.ItemProps[i].PickList.Add('False');
        ValueListEditor1.ItemProps[i].PickList.Add('True');
      end
      else
      begin
        ValueListEditor1.ItemProps[i].PickList.Add('True');
        ValueListEditor1.ItemProps[i].PickList.Add('False');
      end;
    end;
  end;
end;

procedure TForm18.WMDropFiles(var Msg: TMessage);
var
  DropH: THandle;
  DroppedFileCount: integer;
  FileNameLength: integer;
  filename: string;
begin
  inherited;
  DropH:= Msg.wParam;
  try
    DroppedFileCount:= DragQueryFile(DropH, $FFFFFFFF, nil, 0);

    if DroppedFileCount > 0 then
    begin
      FileNameLength:= DragQueryFile(DropH, 0, nil, 0);
      SetLength(filename, FileNameLength);
      DragQueryFile(DropH, 0, PChar(filename), FileNameLength + 1);
      LoadOptions(filename);
    end;

  finally
    DragFinish(DropH);

  end;
  Msg.Result:= 0;
end;

end.
