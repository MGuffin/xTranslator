unit TESVT_preProcessingOpts;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Grids,TESVT_Batcher, ValEdit, TESVT_espdefinition, TESVT_Ressources, TESVT_Const, ClipBrd;

type
  TForm20 = class(TForm)
    ValueListEditor1: TValueListEditor;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    procedure formatOptions;
    procedure copyOptions;
  public
    { Déclarations publiques }
  end;

var
  Form20: TForm20;

implementation

{$R *.dfm}

procedure TForm20.FormCreate(Sender: TObject);
begin
  ValueListEditor1.font.name:= defaultSynFont;
  init_caption(self);
  ValueListEditor1.Strings.text:= defUIoptions.text;
end;

procedure TForm20.FormShow(Sender: TObject);
begin
  formatOptions;
end;

procedure TForm20.Button3Click(Sender: TObject);
begin
  copyOptions;
end;

procedure TForm20.Button4Click(Sender: TObject);
begin
  pasteOptions(ValueListEditor1.Strings, Clipboard.AsText);
  formatOptions;
end;

procedure TForm20.Button5Click(Sender: TObject);
begin
  ValueListEditor1.Strings.text:= defaultprocessorSuffixeOptions[CURRENT_GAME_ID];
  formatOptions;
end;

procedure TForm20.formatOptions;
var
  tmp: string;
  i: integer;
begin
  for i:= 0 to ValueListEditor1.Strings.count - 1 do
  begin
    tmp:= ValueListEditor1.Keys[i];
    if (length(tmp) > 1) and (tmp[1] = 'b') then
    begin
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
    end
    else if tmp = 'sTemplate' then
    begin
      ValueListEditor1.ItemProps[i].EditStyle:= esPickList;
      ValueListEditor1.ItemProps[i].PickList.Add(sDEFUIOut[CURRENT_GAME_ID]);
      ValueListEditor1.ItemProps[i].PickList.Add(sDEFUIwOut[CURRENT_GAME_ID]);
    end;
  end;
end;

procedure TForm20.copyOptions;
var
  l: TStringlist;
  i: integer;
begin
  l:= tstringlist.create;
  l.add('[processOptStart]');
  for i:= 0 to pred(ValueListEditor1.Strings.count) do
    l.add(ValueListEditor1.Strings[i]);
  l.add('[processOptEnd]');
  Clipboard.AsText:= l.text;
  l.free;
end;

end.
