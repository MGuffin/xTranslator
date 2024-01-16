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
unit TESVT_MergeSst;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TESVT_Ressources, TESVT_Const;

type
  TForm7 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1ContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form7: TForm7;

implementation

{$R *.dfm}

procedure TForm7.Edit1Change(Sender: TObject);
  var i : integer;
      b:boolean;
begin
  b:=true;
  for i := 0 to high(FORBIDDENFILECHAR) do
    if pos(FORBIDDENFILECHAR[i],edit1.Text)>0 then
    begin
      b:=false;
      break;
    end;
    button1.Enabled:=b and (edit1.Text<>getres('inputMergeName')) and (trim(edit1.Text)<>'');
end;

procedure TForm7.Edit1ContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
begin
    Handled := true;
end;

procedure TForm7.Edit1KeyPress(Sender: TObject; var Key: Char);
var i : integer;
begin
  for i := 0 to high(FORBIDDENFILECHAR) do
    if key = FORBIDDENFILECHAR[i] then
    begin
      Key := #0;
      exit;
    end;
end;

procedure TForm7.FormCreate(Sender: TObject);
begin
  init_caption(self);
end;

end.
