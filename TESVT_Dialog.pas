{
  Fallout4translator - TESVTranslator - sseTranslator  by McGuffin  mguffin[arobase]gmail.com
  main distribution here:  http://www.nexusmods.com/skyrimspecialedition/mods/134?

  The contents of this file are subject to the Mozilla Public License
  Version 1.1 (the "License"); you may not use this file except in
  compliance with the License. You may obtain a copy of the License at
  http://www.mozilla.org/MPL/

  Software distributed under the License is distributed on an "AS IS"
  basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See the
  License for the specific language governing rights and limitations
  under the License.


  Note on extra Components used by this Tool: 
  -SynEdit: https://github.com/SynEdit/SynEdit
  -VirtualStringTree: written by Mike Lischke (www.soft-gems.net).
  -Diff: Search Heuristic compare is using the Diff Unit http://www.angusj.com/delphi/textdiff.html credit to Angus Johnson
  -HtmlViewer: https://github.com/BerndGabriel/HtmlViewer
  -ZLibex: 1.2.3 http://www.dellapasqua.com and xEdit https://github.com/TES5Edit
  -LZ4 https://github.com/atelierw/LZ4Delphi and xEdit https://github.com/TES5Edit
  -Part of the code for Bsa/ba2/Stream loading from xEdit  https://github.com/TES5Edit
  -OmniXML: https://github.com/mremec/omnixml
  -PCRE Regex library: http://www.regular-expressions.info/delphi.html (unicode version)
  -Hunspell Module is distributed under the Mozilla Public License Version 1.1 https://github.com/hunspell/hunspell/releases
  -xmw to wav converter: xWMAEncode.exe from directX SDK/microsoft
}
unit TESVT_Dialog;

interface

uses
  Windows, Messages, SysUtils,  Classes, Controls, Forms,  Dialogs, StdCtrls, TESVT_Ressources, ExtCtrls, graphics, vcl.themes;

type
  TFormDialog = class(TForm)
    ButtonNo: TButton;
    ButtonYes: TButton;
    ButtonCancel: TButton;
    ButtonOk: TButton;
    Timer1: TTimer;
    CheckBox1: TCheckBox;
    procedure FormPaint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
  public
    sContent: string;
    bAlwaysYes: boolean;
    sessionOnly: boolean;
    iRememberIndex:integer;
    function getsize:integer;
  end;


var
  FormDialog: TFormDialog;

implementation

{$R *.dfm}
uses TESVT_Const;

function atleast(const value, atleast: integer): integer;
begin
  if value < atleast then
    result := atleast
  else
    result := value;
end;

function tformDialog.getsize:integer;
const minWitdh = 850 ;
      minHeight = 85 ;
var
  r: TRect;
begin
  r := Rect(20, 10, minWitdh -20 , minHeight );
  DrawText(Canvas.Handle,
    PChar(sContent),
    Length(sContent),
    r,
    DT_CENTER or DT_WORDBREAK or DT_CALCRECT);
  formDialog.ClientWidth:= atleast(r.Right - r.Left + 40, minWitdh );
  formDialog.Clientheight := atleast(r.bottom - r.top + 70,minHeight);
  result:=  formDialog.Clientheight - 30;
end;

procedure TFormDialog.Timer1Timer(Sender: TObject);
begin
  if (fsModal in FormState) then
    modalResult := mrOk
  else
    close;
end;

procedure TFormDialog.CheckBox1Click(Sender: TObject);
begin
  if bAlwaysYes then
  begin
    buttonNo.enabled:= not CheckBox1.Checked;
    ButtonCancel.enabled:= not CheckBox1.Checked;
  end;
end;

procedure TFormDialog.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (iRememberIndex>=0) and CheckBox1.Checked then
  begin
    if sessionOnly then
      askPrefsArraySession[iRememberIndex]:=modalResult
    else
      askPrefsArray[iRememberIndex]:=modalResult;
  end;
end;

procedure TFormDialog.FormCreate(Sender: TObject);
begin
  Init_caption(self);
end;

procedure TFormDialog.FormPaint(Sender: TObject);
var
  r: TRect;
  LStyle: TCustomStyleServices;
begin
  LStyle:=StyleServices;
  r := Rect(20, 10, formDialog.ClientWidth - 20 , formDialog.Clientheight);
  Canvas.Brush.Style := bsClear;
  Canvas.Font.color :=LStyle.GetStyleFontColor(sfPanelTextNormal);
  DrawText(Canvas.Handle,
    PChar(sContent),
    Length(sContent),
    r,
    DT_CENTER or DT_WORDBREAK);
end;

procedure TFormDialog.FormShow(Sender: TObject);
begin
   ButtonNo.cancel :=   not ButtonCancel.visible ;
end;

end.
