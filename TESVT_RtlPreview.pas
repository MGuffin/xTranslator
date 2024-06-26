unit TESVT_RtlPreview;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, TESVT_TranslateFunc, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TFormRtl = class(TForm)
    Panel1: TPanel;
    Memo1: TMemo;
    Memo2: TMemo;
    RadioGroup1: TRadioGroup;
    Button1: TButton;
    Button2: TButton;
    AdjustLineSize: TGroupBox;
    TrackBar1: TTrackBar;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    procedure RadioGroup1Click(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    procedure updateRtl;
  public
    { Déclarations publiques }
  end;

var
  FormRtl: TFormRtl;

implementation

{$R *.dfm}

procedure TFormRtl.updateRtl;
begin
  Memo2.Lines.Text := ReverseRTLString(Memo1.Lines.Text, RadioGroup1.itemIndex, TrackBar1.position, TrackBar1.position<TrackBar1.max,CheckBox2.checked );
end;

procedure TFormRtl.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
  begin
    Memo1.BiDiMode := bdRightToLeft;
    Memo2.BiDiMode := bdRightToLeft;;
  end
  else
  begin
    Memo1.BiDiMode := bdLeftToRight;
    Memo2.BiDiMode := bdLeftToRight;
  end;

end;

procedure TFormRtl.FormShow(Sender: TObject);
begin
  CheckBox1Click(nil);
  updateRtl;
end;

procedure TFormRtl.Memo1Change(Sender: TObject);
begin
  updateRtl;
end;

procedure TFormRtl.RadioGroup1Click(Sender: TObject);
begin
  updateRtl;
end;

procedure TFormRtl.TrackBar1Change(Sender: TObject);
begin
  updateRtl;
end;

end.
