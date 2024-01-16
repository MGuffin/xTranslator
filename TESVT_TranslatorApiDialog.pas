unit TESVT_TranslatorApiDialog;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, TESVT_TranslatorApi, TESVT_Const, TESVT_Ressources;

type
  TForm25 = class(TForm)
    ComboBox1: TComboBox;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    procedure FormCreate(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form25: TForm25;

implementation

{$R *.dfm}

procedure TForm25.FormCreate(Sender: TObject);
var
  i: integer;
begin
  init_caption(self);

  for i := 0 to MaxApiCount do
    if apidata.apiEnabled[i] and (assigned(aApiBaseArrayFunc[i])) then
      ComboBox1.AddItem(apidata.urlData.values[aApiBaseName[i] + 'Label'], TObject(i));
  for i := 0 to pred(ComboBox1.Items.count) do
    if integer(ComboBox1.Items.Objects[i]) = ilastUsedApiArray then
      ComboBox1.itemindex := i;
  if (ComboBox1.itemindex = -1) and (ComboBox1.Items.count > 0) then
    ComboBox1.itemindex := 0;
end;

end.
