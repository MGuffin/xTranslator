unit TESVT_ToolHeader;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls, ButtonGroup, TESVT_Const, TESVT_Ressources;

type
  TForm19 = class(TForm)
    ButtonGroup1: TButtonGroup;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure ButtonGroup1ButtonClicked(Sender: TObject; Index: Integer);
    procedure Button2Click(Sender: TObject);
  private
    procedure initHeaderButtons;
  public
    HeaderOut: Integer;
  end;

var
  Form19: TForm19;

implementation

uses TESVT_ToolboxOptions;

{$R *.dfm}

procedure TForm19.Button2Click(Sender: TObject);
begin
  form17 := tform17.create(self);
  form17.label1.Caption:= getres('HeaderListInfo');
  form17.Button3.visible:= true;
  form17.Memo1.lines.Text := lDEFUIHeader.Text;
  form17.showmodal;
  if form17.modalResult = mrOk then
    lDEFUIHeader.Text := form17.Memo1.lines.Text;
  form17.free;
  //redraw buttons
  ButtonGroup1.Items.Clear;
  initHeaderButtons;
end;

procedure TForm19.ButtonGroup1ButtonClicked(Sender: TObject; Index: Integer);
begin
  modalResult := mrOK;
  HeaderOut := index;
end;

procedure tForm19.initHeaderButtons;
var
  i: integer;
  ti: TGrpButtonItem;
begin
  // first button = delete header
  ti := ButtonGroup1.Items.add;
  ti.caption := getRes('NoHeader');
  ti.ImageIndex := 12;
  // then list
  for i := 0 to pred(lDEFUIHeader.count) do
  begin
    ti := ButtonGroup1.Items.add;
    ti.caption := lDEFUIHeader[i];
    ti.ImageIndex := 1;
  end;
end;



procedure TForm19.FormCreate(Sender: TObject);
begin
  Init_caption(self);
  initHeaderButtons;
end;

end.
