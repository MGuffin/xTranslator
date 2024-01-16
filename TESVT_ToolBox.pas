unit TESVT_ToolBox;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ButtonGroup, StdCtrls, TESVT_Ressources, TESVT_StringsStatus;

type
  TForm16 = class(TForm)
    ButtonGroup1: TButtonGroup;
    Button1: TButton;
    Button2: TButton;
    procedure ButtonGroup1ButtonClicked(Sender: TObject; Index: Integer);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    toolID: Integer;
  end;

var
  Form16: TForm16;

implementation

uses TESVT_ToolboxOptions;
{$R *.dfm}

procedure TForm16.Button2Click(Sender: TObject);
begin
  form17 := tform17.create(self);
  form17.label1.Caption:= getres('WordExceptionInfo');
  form17.Memo1.lines.Text := lWordExceptionList.Text;
  form17.showmodal;
  if form17.modalResult = mrOk then
    lWordExceptionList.Text := form17.Memo1.lines.Text;
  form17.free;
end;

procedure TForm16.ButtonGroup1ButtonClicked(Sender: TObject; Index: Integer);
begin
  modalResult := mrOk;
  toolID := index;
end;

procedure TForm16.FormCreate(Sender: TObject);
begin
  toolID := -1;
  Init_caption(self);
  ButtonGroup1.Items[0].Caption := getRes('UppercaseAll');
  ButtonGroup1.Items[1].Caption := getRes('LowerCaseAll');
  ButtonGroup1.Items[2].Caption := getRes('UpperCaseFirstWord');
  ButtonGroup1.Items[3].Caption := getRes('UpperCaseFirstCharEachWord');
  ButtonGroup1.Items[4].Caption := getRes('FixAlias3');
  ButtonGroup1.Items[5].Caption := getRes('AddHeader');
  ButtonGroup1.Items[6].Caption := getRes('TrimString');
end;

end.
