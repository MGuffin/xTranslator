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
unit TESVT_Colab;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, math, ButtonGroup, StdCtrls, TESVT_Const, TESVT_Ressources, TESVT_MainLoader,
  Vcl.ExtCtrls;

type
  TFormColabId = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Label1: TLabel;
    ButtonGroup1: TButtonGroup;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ButtonGroup1HotButton(Sender: TObject; Index: Integer);
    procedure ButtonGroup1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  private
    iHotButton: Integer;
  public
    colabID: Integer;
    loader: tTranslatorLoader;
  end;

var
  FormColabId: TFormColabId;

implementation

{$R *.dfm}

procedure TFormColabId.ButtonGroup1HotButton(Sender: TObject; Index: Integer);
begin
  iHotButton := Index;
  if inrange(iHotButton, 0, MAXCOLAB_ID - 1) and assigned(loader) then
    Label1.caption := loader.aColabLabel[iHotButton + 1];
end;

procedure TFormColabId.ButtonGroup1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  currentHot: Integer;
begin
  if not inrange(iHotButton, 0, MAXCOLAB_ID - 1) then
    exit;
  currentHot := iHotButton;
  if ssLeft in Shift then
  begin
    colabID := currentHot + 1;
    if (ssShift in Shift) and assigned(loader) then
      loader.aColabLabel[currentHot + 1] := trim(copy(localInput(getres('lbl_Input_comment'), format('[%.2x]',[currentHot+1]), loader.aColabLabel[currentHot + 1]), 1, 255));
    modalResult := mrOK;
  end;
end;

procedure TFormColabId.FormCreate(Sender: TObject);
begin
  loader := nil;
  Init_caption(self);
  iHotButton := -1;
end;

end.
