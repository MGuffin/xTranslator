unit TESVT_TagID;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm21 = class(TForm)
    ComboBox1: TComboBox;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    newTag: string;
  end;

var
  Form21: TForm21;

implementation

{$R *.dfm}

procedure TForm21.Button1Click(Sender: TObject);
begin
  newTag:= trim(Combobox1.text);
  close;
end;

procedure TForm21.FormCreate(Sender: TObject);
begin
  newTag:= '';
end;

end.
