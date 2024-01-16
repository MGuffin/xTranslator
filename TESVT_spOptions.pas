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
unit TESVT_spOptions;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, TESVT_Ressources, Buttons, TESVT_Const , ShellAPI;

type
  TFormSpOpts = class(TForm)
    GroupBox1: TGroupBox;
    Label3: TLabel;
    CheckBox1: TCheckBox;
    RadioGroup1: TRadioGroup;
    ComboBox1: TComboBox;
    Button3: TButton;
    Button1: TButton;
    GroupBox2: TGroupBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FormSpOpts: TFormSpOpts;

implementation

{$R *.dfm}

procedure TFormSpOpts.FormCreate(Sender: TObject);
begin
  init_caption(self);
end;

procedure TFormSpOpts.FormShow(Sender: TObject);
begin
  RadioGroup1Click(nil);
end;

procedure TFormSpOpts.RadioGroup1Click(Sender: TObject);
begin
  combobox1.enabled:= RadioGroup1.itemIndex = 1;
end;

procedure TFormSpOpts.SpeedButton1Click(Sender: TObject);
begin
  openQuickHtmlViewer(self,getRes('HunspellDicInfo'), 340);
end;

procedure TFormSpOpts.SpeedButton2Click(Sender: TObject);
begin
  ShellExecute(application.Handle, nil, 'explorer.exe', pchar(mainpath+ SPELL_CHECK_DICPATH), nil, SW_NORMAL);
end;

end.
