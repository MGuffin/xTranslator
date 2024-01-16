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
unit TESVT_TCSC;

interface

Uses Classes, TESVT_typedef, TESVT_Const, TESVT_FastSearch;

Type
  rCharMapTCSC = record
    sc: char;
    tc: char;
  end;

  pCharMapTCSC = ^rCharMapTCSC;

function compareCharCodeTC(p1, p2: pointer): integer;
function compareCharCodeSC(p1, p2: pointer): integer;
procedure clearTCSCList(l: tlist);
function buildTCSCList(l: tlist; scstr, tcstr: string): boolean;
procedure doConvertTCSC(listArray: talist; mode: boolean; l: tlist);

var
  TCSCList: tlist;

implementation

function compareCharCodeSC(p1, p2: pointer): integer;
begin
  result := ord(pCharMapTCSC(p1).sc) - ord(pCharMapTCSC(p2).sc);
end;

function compareCharCodeTC(p1, p2: pointer): integer;
begin
  result := ord(pCharMapTCSC(p1).tc) - ord(pCharMapTCSC(p2).tc);
end;

// build list
function buildTCSCList(l: tlist; scstr, tcstr: string): boolean;
var
  i: integer;
  p: pCharMapTCSC;
begin
  if length(scstr) <> length(tcstr) then
    exit(false);
  for i := 0 to length(scstr) do
  begin
    new(p);
    p.sc := scstr[i];
    p.tc := tcstr[i];
    l.add(p);
  end;
  result := true;
  // l.Sort(compareCharCodeSC);
end;

procedure clearTCSCList(l: tlist);
var
  i: integer;
begin
  for i := l.count - 1 downto 0 do
    dispose(pCharMapTCSC(l[i]));
end;

procedure doConvertTCSC(listArray: talist; mode: boolean; l: tlist);
var
  newindex: integer;
  i, j, k: integer;
  tmpstr1: string;
  p: pCharMapTCSC;
begin
  // true= TC->SC
  pbar := 0;
  new(p);
  try
    if mode = true then
    begin
      l.Sort(compareCharCodeTC);
      for k := 0 to 2 do
        for i := 0 to listArray[k].count - 1 do
        begin
          if tskystr(listArray[k][i]).lockedStatus then
            continue;
          tmpstr1 := tskystr(listArray[k][i]).sTrans;
          if length(tmpstr1) > 0 then
            for j := 0 to length(tmpstr1) do
            begin
              p.tc := tmpstr1[j];
              if FastListSearch(l, compareCharCodeTC, p, newindex, false) then
                tmpstr1[j] := pCharMapTCSC(l[newindex]).sc;
            end;
          UpdatePBar(1000);
          tskystr(listArray[k][i]).sTrans := tmpstr1;
        end;
    end
    else
    begin
      l.Sort(compareCharCodeSC);
      for k := 0 to 2 do
        for i := 0 to listArray[k].count - 1 do
        begin
          if tskystr(listArray[k][i]).lockedStatus then
            continue;
          tmpstr1 := tskystr(listArray[k][i]).sTrans;
          if length(tmpstr1) > 0 then
            for j := 0 to length(tmpstr1) do
            begin
              p.sc := tmpstr1[j];
              if FastListSearch(l, compareCharCodeSC, p, newindex, false) then
                tmpstr1[j] := pCharMapTCSC(l[newindex]).tc;
            end;
          UpdatePBar(1000);
          tskystr(listArray[k][i]).sTrans := tmpstr1;
        end;
    end;
  finally
    dispose(p);
  end;
end;

end.
