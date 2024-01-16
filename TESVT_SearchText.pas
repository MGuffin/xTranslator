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
unit TESVT_SearchText;

interface

uses
 Controls, Forms, StdCtrls, ExtCtrls, TESVT_Ressources, Classes, ComCtrls, TESVT_Const;

type
  TFormsText = class(TForm)
    cbSearchText: TComboBox;
    RadioGroup1: TRadioGroup;
    Button1: TButton;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    function GetSearchTextHistory: string;
    procedure SetSearchTextHistory(Value: string);
  public
    property SearchTextHistory: string read GetSearchTextHistory write SetSearchTextHistory;
  end;

var
  FormsText: TFormsText;

implementation

{$R *.dfm}

procedure TFormsText.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  s: string;
  i: integer;
begin
  s := cbSearchText.Text;
  if s <> '' then
  begin
    i := cbSearchText.Items.IndexOf(s);
    if i > -1 then
    begin
      cbSearchText.Items.Delete(i);
      cbSearchText.Items.Insert(0, s);
      cbSearchText.Text := s;
    end
    else
      cbSearchText.Items.Insert(0, s);
  end;
end;

procedure TFormsText.FormCreate(Sender: TObject);
begin
  init_caption(self);
end;

function TFormsText.GetSearchTextHistory: string;
var
  i: integer;
begin
  Result := '';
  for i := 0 to cbSearchText.Items.Count - 1 do
  begin
    if i >= 10 then
      break;
    if i > 0 then
      Result := Result + sstLinebreak;
    Result := Result + cbSearchText.Items[i];
  end;
end;

procedure TFormsText.SetSearchTextHistory(Value: string);
begin
  cbSearchText.Items.Text := Value;
end;

end.
