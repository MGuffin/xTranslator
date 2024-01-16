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
unit TESVT_batch;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, Forms, Dialogs, TESVT_Ressources, StdCtrls, ExtCtrls, TESVT_Const;

type
  TForm11 = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    Button3: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    filenamefull: string;
  end;

var
  Form11: TForm11;

implementation

{$R *.dfm}

procedure TForm11.Button3Click(Sender: TObject);
var filename, filepath: string;
begin
   filename:=ExtractFileName(filenamefull);
   filepath:=ExtractFilePath(filenamefull);
   filename := SaveFileDialog(getres('Dia_SaveBatch'), filepath, filename, 'TXT|*.TXT');
   if filename <> '' then memo1.Lines.SaveToFile(filename, TEncoding.UTF8);
end;

procedure TForm11.FormCreate(Sender: TObject);
begin
  init_caption(self);
  filenamefull:='';
end;

end.
