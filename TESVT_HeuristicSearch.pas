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
unit TESVT_HeuristicSearch;

interface

uses sysutils, Math;

function LevenshteinDistance(const s, t: string): integer;

function getLongestCommonStrInt(s1, s2: string): integer;
function getLongestCommonStrInt_Header(s1, s2: String): integer;

implementation

function LevenshteinDistance(const s, t: string): integer;
var
  d: array of array of integer;
  n, m, i, j: integer;
begin
  n := Length(s);
  m := Length(t);
  if n = 0 then
    Exit(m);
  if m = 0 then
    Exit(n);

  SetLength(d, n + 1, m + 1);
  for i := 0 to n do
    d[i, 0] := i;
  for j := 0 to m do
    d[0, j] := j;

  for i := 1 to n do
    for j := 1 to m do
      d[i, j] := min(min(d[i - 1, j] + 1, d[i, j - 1] + 1), d[i - 1, j - 1] + integer(s[i] <> t[j]));

  result := d[n, m];
end;

function getLongestCommonStrInt(s1, s2: String): integer;
var
  t: array of array of integer;
  l1, l2, i, j: integer;
begin
  l1 := Length(s1);
  l2 := Length(s2);
  result := 0;
  if (l1 = 0) or (l2 = 0) then
    Exit;
  SetLength(t, l1, l2);
  for i := 0 to pred(l1) do
    for j := 0 to pred(l2) do
    begin
      if s1[i + 1] <> s2[j + 1] then
        t[i][j] := 0
      else
      begin
        if (i = 0) or (j = 0) then
          t[i][j] := 1
        else
          t[i][j] := 1 + t[i - 1][j - 1];
        if result < t[i][j] then
          result := t[i][j];
      end;
    end;
end;

function getLongestCommonStrInt_Header(s1, s2: string): integer;
var
  sLen, sLen1, sLen2: integer;
  i: integer;
begin
  result := 0;
  sLen1 := Length(s1);
  sLen2 := Length(s1);
  if (sLen1 = 0) or (sLen2 = 0) then
    Exit;

  sLen := min(sLen1, sLen2);
  result := sLen;
  for i := 1 to sLen do
    if s1[i] <> s2[i] then
    begin
      result := i - 1;
      break;
    end;
end;

function getCommonStr(const s1, s2: string): string;
var
  iEnd: integer;
begin
  iEnd := getLongestCommonStrInt_Header(s1, s2);
  if iEnd > 0 then
    result := copy(s1, 1, iEnd)
  else
    result := '';
end;

end.
