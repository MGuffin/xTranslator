unit TESVT_HeaderList;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, TESVT_Ressources, TESVT_Const, Grids;

type
  TFormHList = class(TForm)
    Button1: TButton;
    Button2: TButton;
    StringGrid1: TStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FormHList: TFormHList;

implementation

{$R *.dfm}

procedure TFormHList.FormCreate(Sender: TObject);
begin
  Init_caption(self);
  StringGrid1.font.name:= HeaderComponentFont;
end;

procedure TFormHList.StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
begin
  CanSelect := (ACol = 1);
  if (ACol = 0) and ((Sender as TStringGrid).cells[1, ARow] = '') then
  (Sender as TStringGrid).cells[1, ARow]:= (Sender as TStringGrid).cells[0, ARow];
end;

end.
