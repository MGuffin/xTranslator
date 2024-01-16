unit TESVT_Input;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TESVT_Ressources;

type
  TFormInput = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FormInput: TFormInput;

implementation

{$R *.dfm}

procedure TFormInput.FormCreate(Sender: TObject);
begin
  Init_caption(self);
end;

end.
