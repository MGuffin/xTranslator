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
unit TESVT_ColabFilter;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, math, ButtonGroup, StdCtrls, TESVT_MainLoader, TESVT_Const, TESVT_Ressources,
  Vcl.ExtCtrls;

type
  TFormColabFilter = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button1: TButton;
    Button2: TButton;
    ButtonGroup1: TButtonGroup;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ButtonGroup1HotButton(Sender: TObject; Index: Integer);
    procedure ButtonGroup1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    iHotButton: Integer;
    bAdd: boolean;
    procedure updateButton(index: Integer);
  public
    aColab: array [1 .. MAXCOLAB_ID] of boolean;
    aColabFilter: array [1 .. MAXCOLAB_ID] of byte;
    loader: tTranslatorLoader;
  end;

var
  FormColabFilter: TFormColabFilter;

implementation

{$R *.dfm}

procedure TFormColabFilter.updateButton(index: Integer);
var
  ti: TGrpButtonItem;
begin
  ti := ButtonGroup1.Items[index];
  if aColab[index + 1] then
    ti.ImageIndex := 70;
  if aColabFilter[index + 1] = 1 then
    ti.ImageIndex := 79;
  if aColabFilter[index + 1] = 2 then
    ti.ImageIndex := 80;
  if (not aColab[index + 1]) and (aColabFilter[index + 1] = 0) then
    ti.ImageIndex := 67;
end;

procedure TFormColabFilter.Button3Click(Sender: TObject);
var
  i: Integer;
begin
  for i := 1 to MAXCOLAB_ID do
  begin
    aColabFilter[i] := 0;
    updateButton(i - 1)
  end;
end;

procedure TFormColabFilter.Button4Click(Sender: TObject);
var
  i: Integer;
begin
  Button3Click(nil);
  for i := 1 to MAXCOLAB_ID do
    if aColab[i] then
    begin
      aColabFilter[i] := 1;
      updateButton(i - 1)
    end;
end;

procedure TFormColabFilter.Button5Click(Sender: TObject);
var
  i: Integer;
begin
  Button3Click(nil);
  for i := 1 to MAXCOLAB_ID do
    if aColab[i] then
    begin
      aColabFilter[i] := 2;
      updateButton(i - 1)
    end;
end;

procedure TFormColabFilter.ButtonGroup1HotButton(Sender: TObject; Index: Integer);
begin
  iHotButton := Index;
  if inrange(iHotButton, 0, MAXCOLAB_ID - 1) and assigned(loader) then
    Label1.caption := loader.aColabLabel[iHotButton + 1];
end;

procedure TFormColabFilter.ButtonGroup1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  currentHot: Integer;
begin
  if not inrange(iHotButton, 0, MAXCOLAB_ID - 1) then
    exit;
  bAdd := true;
  currentHot := iHotButton;
  if ssLeft in Shift then
  begin
    if (ssShift in Shift) and assigned(loader) then
    begin
      loader.aColabLabel[currentHot + 1] := trim(copy(localInput(getres('lbl_Input_comment'), format('[%.2x]', [currentHot + 1]), loader.aColabLabel[currentHot + 1]), 1, 255));
    end
    else
    begin
      inc(aColabFilter[currentHot + 1]);
      if aColabFilter[currentHot + 1] > 2 then
        aColabFilter[currentHot + 1] := 0;
      updateButton(currentHot);
    end;
  end;
end;

procedure TFormColabFilter.FormCreate(Sender: TObject);
begin
  Init_caption(self);
  fillchar(aColab, sizeof(aColab), false);
  fillchar(aColabFilter, sizeof(aColabFilter), 0);
  Init_caption(self);
  bAdd := true;
end;

end.
