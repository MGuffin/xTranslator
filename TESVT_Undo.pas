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
unit TESVT_Undo;

interface

uses Windows, Menus, Classes, TESVT_Typedef;

const
  iUndoAntiFlood = 5000;

var
  iUndoListMax: integer = 200000;

Type
  tUndoData = class
    sk: tSkyStr;
    sTrans: string;
    sparams: sStrParams;
    sInternalparams: sStrInternalParams;
    ldResult: single;
    LDFound: integer;
    tUndo: dword;

    constructor init(skUndo: tSkyStr; t: dword = 0);
    procedure restoreAndFree;
  end;

var
  undoMenu: tMenuItem;
  ttimeUndo: dword;
  tAntiFlood: integer;

procedure timeUndo;

implementation

procedure timeUndo;
begin
  ttimeUndo := getTickCount;
  tAntiFlood := 0;
end;

constructor tUndoData.init(skUndo: tSkyStr; t: dword = 0);
begin
  sk := skUndo;
  sTrans := sk.sTrans;
  sparams := sk.sparams;
  sInternalparams := sk.sInternalparams;
  ldResult := sk.ldResult;
  if ldResult = 99 then
    LDFound := 0
  else
    LDFound := sk.LDFound;
  if t = 0 then
    tUndo := getTickCount div 100
  else
    tUndo := t div 100;
end;

Procedure tUndoData.restoreAndFree;
begin
  sk.sparams := sparams;
  sk.sInternalparams := sInternalparams;
  sk.sTrans := sTrans;
  sk.ldResult := ldResult;
  sk.LDFound := LDFound;
  self.free;
end;

end.
