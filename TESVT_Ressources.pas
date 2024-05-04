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
unit TESVT_Ressources;

interface

uses Forms, Windows, sysutils, Graphics, Classes, ValEdit, Controls, ExtCtrls, ComCtrls, StdCtrls, menus, VirtualTrees,
  Buttons, TESVT_DialHTML, synEdit, Winapi.Messages;

var
  SSTRessources: TStringList;

procedure Init_caption(form: tform);
function formatRes(baseStr: string; const Args: array of const): string;
function getRes(baseStr: string): string; overload;
function getRes(baseStr: string; l: TStringList): string; overload;
procedure initResVar;
procedure getressourcedir(respath, default: string; c: tcombobox);
function getResFallback(sFallback: TStringList): TStringList;
Function replaceDIALPattern(fstring, sourcestr, deststr, s1, s2: string): string;
procedure updateStatus(s: string);
procedure updateStatusFile(current, total: integer);
Procedure openQuickHtmlViewer(form: tform; Text: string; h: integer);
// procedure lockForm(form: tform; bLock: Boolean);
procedure lockForm(Parent: TWinControl; Enabled: Boolean);
function Gradient(Color: TColor): TColor; overload;
function Gradient(Color: TColor; Percent: Byte): TColor; overload;
function BlendColor(Color1: TColor): TColor; overload;
function BlendColor(Color1, Color2: TColor; a: Byte): TColor; overload;
procedure InitCompoColor(form: tform);
function getDarkPercent(offset: integer): Byte;

procedure ApplyCompositedStyleToForm(form: tform);
procedure RemoveCompositedStyleFromForm(form: tform);

const
  resExportLabel1: string = 'Menu_FinalizeStr';
  resExportLabel2: string = 'Menu_FinalizeEsp';
  resExportLabel3: string = 'Menu_FinalizeMCM';
  resExportLabel4: string = 'Menu_FinalizePex';
  resExportAsLabel1: string = 'Menu_FinalizeStrAs';
  resExportAsLabel2: string = 'Menu_FinalizeEspAs';
  resExportAsLabel3: string = 'Menu_FinalizeMCMAs';
  resExportAsLabel4: string = 'Menu_FinalizePexAs';

var
  espFilter: string = '*.esp, *.esm, *.esl|*.ESP; *.ESM; *.ESL';
  //txtFilter: string = 'FilterTXT|*.TXT';
  pexFilter: string = 'FilterPex|*.PEX';
  stringsFilter: string = 'FilterStr|*.STRINGS';
  sstDocmissing: string = 'DocsMissing';
  ReplaceALLCaption: string = 'Update_Similar_Strings';
  READDATAERROR: string = 'Fbk_ReadError';
  DELOCERROR2: string = 'Fbk_TESLocalized2';
  ResTotal: string = 'FbK_Total';
  ResLogCount: string = 'Log_Count';
  ResLogSize: string = 'Log_Size';
  ResLogcodepage: string = 'Log_codepage';
  FbK_StringEspOrphean2: string = 'FbK_StringEspOrphean2';
  fbk_FileGen: string = 'fbk_FileGen';
  fbk_NoFileGen: string = 'fbk_NoFileGen';
  fbk_Details: string = 'fbk_Details';
  fbk_CacheInfo: string = 'fbk_CacheInfo';
  ExportModCaption: array [0 .. 3] of string;
  ExportModCaption2: array [0 .. 3] of string;
  DiscardTag: array [0 .. 1] of string = (
    'Discard',
    ''
  );
  ResNullTag: array [0 .. 1] of string = (
    '',
    'bNullTag'
  );

  ResfileInfo: array [0 .. 1] of string = (
    'Fdb_DiffStr1',
    'Fdb_DiffStr2'
  );

  resFoundTag: array [0 .. 2] of string = (
    'notFOUND',
    'FOUND',
    'BSA/BA2'
  );
  resGenTag: array [0 .. 1] of string = (
    'GenNO',
    'GenYES'
  );

  StatusBar: tStatusBar;
  sOldStatus: string = '';

  iDarkPercent: integer = 0;
  darkPercent: Byte = 0;
  bCurrentWrongWorkspace: Boolean = false;

const
  resCommon = 'common';
  sstResPath = 'res\';

implementation

uses TESVT_Const;

procedure ApplyCompositedStyleToForm(form: tform);
var
  currentStyle: DWORD_PTR;
begin
  currentStyle := GetWindowLongPtr(form.Handle, GWL_EXSTYLE);
  currentStyle := currentStyle or WS_EX_COMPOSITED;
  SetWindowLongPtr(form.Handle, GWL_EXSTYLE, currentStyle);
end;

procedure RemoveCompositedStyleFromForm(form: tform);
var
  currentStyle: DWORD_PTR;
begin
  currentStyle := GetWindowLongPtr(form.Handle, GWL_EXSTYLE);
  currentStyle := currentStyle and (not WS_EX_COMPOSITED);
  SetWindowLongPtr(form.Handle, GWL_EXSTYLE, currentStyle);
end;

function getDarkPercent(offset: integer): Byte;
begin
  iDarkPercent := iDarkPercent + offset;
  if iDarkPercent < 0 then
    iDarkPercent := 0
  else if iDarkPercent > 50 then
    iDarkPercent := 50;
  result := Byte(iDarkPercent);
end;

function BlendColor(Color1: TColor): TColor;
begin
  result := BlendColor(Color1, Gradient(clWhite), 100 - (darkPercent div 2));
end;

function BlendColor(Color1, Color2: TColor; a: Byte): TColor;
var
  c1, c2: uInt64;
  r, g, b, v1, v2: Byte;
begin
  a := Round(2.55 * a);
  c1 := ColorToRGB(Color1);
  c2 := ColorToRGB(Color2);
  v1 := Byte(c1);
  v2 := Byte(c2);
  r := a * (v1 - v2) shr 8 + v2;
  v1 := Byte(c1 shr 8);
  v2 := Byte(c2 shr 8);
  g := a * (v1 - v2) shr 8 + v2;
  v1 := Byte(c1 shr 16);
  v2 := Byte(c2 shr 16);
  b := a * (v1 - v2) shr 8 + v2;
  result := (b shl 16) + (g shl 8) + r;
end;

function Gradient(Color: TColor): TColor;
begin
  result := Gradient(Color, darkPercent);
end;

function Gradient(Color: TColor; Percent: Byte): TColor;
var
  r, g, b: Byte;
begin
  if Percent = 0 then
    exit(Color);

  // Récupération des valeurs RGB de la couleur
  r := GetRValue(Color);
  g := GetGValue(Color);
  b := GetBValue(Color);

  // Assombrissement des valeurs RGB
  r := Round(r * (100 - Percent) / 100);
  g := Round(g * (100 - Percent) / 100);
  b := Round(b * (100 - Percent) / 100);

  // Création de la nouvelle couleur
  result := RGB(r, g, b);
end;

procedure lockFormEx(Parent: TWinControl; Enabled: Boolean);
var
  i: integer;
  Ctl: TControl;
begin
  for i := 0 to Pred(Parent.ControlCount) do
  begin
    Ctl := Parent.Controls[i];
    Ctl.Enabled := Enabled;
    if Ctl is TWinControl then
      lockFormEx(TWinControl(Ctl), Enabled);
  end;
end;

procedure lockForm(Parent: TWinControl; Enabled: Boolean);

begin
  if not assigned(Parent) then // or not Parent.Visible
    exit;

  Parent.LockDrawing;
  lockFormEx(Parent, Enabled);
  Parent.UnLockDrawing;
end;

procedure updateStatus(s: string);
begin
  sOldStatus := StatusBar.Panels[3].Text;
  StatusBar.Panels[3].Text := s;
  StatusBar.Repaint;
end;

procedure updateStatusFile(current, total: integer);
begin
  StatusBar.Panels[2].Text := format('%d/%d', [current + 1, total]);
  StatusBar.Repaint;
end;

function getResFallback(sFallback: TStringList): TStringList;
var
  i: integer;
begin
  result := TStringList.Create;
  for i := 0 to sFallback.Count - 1 do
    if SSTRessources.Values[sFallback.Names[i]] = '' then
    begin
      SSTRessources.add(sFallback[i]);
      result.add(sFallback.Names[i]);
    end;
end;

procedure getressourcedir(respath, default: string; c: tcombobox);
var
  sr: TSearchRec;
  found, i: integer;
  ok: Boolean;
begin
  c.Clear;
  c.Sorted := false;
  found := FindFirst(respath, faDirectory, sr);
  while found = 0 do
  begin
    if (sr.attr and faDirectory > 0) and (sr.name <> '.') and (sr.name <> '..') and (ansilowercase(sr.name) <> resCommon) then
      c.Items.add(sr.name);
    found := FindNext(sr);
  end;
  FindClose(sr);
  ok := false;
  for i := 0 to c.Items.Count - 1 do
  begin
    if lowercase(c.Items[i]) = lowercase(default) then
    begin
      c.itemindex := i;
      ok := True;
      break;
    end;
  end;
  if not ok and (c.Items.Count > 0) then
    c.itemindex := 0;
end;

procedure initResVar;
var
  i: integer;
begin
  // fill array
  for i := 0 to 1 do
  begin
    ResfileInfo[i] := getRes(ResfileInfo[i]);
    resGenTag[i] := getRes(resGenTag[i]);
  end;
  for i := 0 to 2 do
  begin
    resFoundTag[i] := getRes(resFoundTag[i]);
  end;

  // frequent res
  fbk_FileGen := getRes(fbk_FileGen);
  fbk_NoFileGen := getRes(fbk_NoFileGen);
  fbk_Details := getRes(fbk_Details);
  fbk_CacheInfo := getRes(fbk_CacheInfo);
  ResNullTag[1] := getRes(ResNullTag[1]);
  DiscardTag[0] := getRes(DiscardTag[0]);
  FbK_StringEspOrphean2 := getRes(FbK_StringEspOrphean2);
  ResLogCount := getRes(ResLogCount);
  ResLogSize := getRes(ResLogSize);
  ResLogcodepage := getRes(ResLogcodepage);
  ResTotal := getRes(ResTotal);
  // espFilter := getRes(espFilter);
  //txtFilter := getRes(txtFilter);
  pexFilter := getRes(pexFilter);
  sstDocmissing := getRes(sstDocmissing);
  stringsFilter := getRes(stringsFilter);
  ReplaceALLCaption := getRes(ReplaceALLCaption);
  READDATAERROR := getRes(READDATAERROR);
  DELOCERROR2 := getRes(DELOCERROR2);
  ExportModCaption[0] := getRes(resExportLabel1);
  ExportModCaption[1] := getRes(resExportLabel2);
  ExportModCaption[2] := getRes(resExportLabel3);
  ExportModCaption[3] := getRes(resExportLabel4);
  ExportModCaption2[0] := getRes(resExportAsLabel1);
  ExportModCaption2[1] := getRes(resExportAsLabel2);
  ExportModCaption2[2] := getRes(resExportAsLabel3);
  ExportModCaption2[3] := getRes(resExportAsLabel4);
end;

function getRes(baseStr: string): string;
begin
  result := getRes(baseStr, SSTRessources);
end;

function getRes(baseStr: string; l: TStringList): string;
begin
  result := stringreplace(l.Values[baseStr], '<br>', sLineBreak, [rfReplaceAll]);
  if result = '' then
    result := baseStr;
end;

function formatRes(baseStr: string; const Args: array of const): string;
begin
  try
    result := format(getRes(baseStr), Args);
    result := stringreplace(result, '<br>', sLineBreak, [rfReplaceAll]);
  except
    result := 'Ressources_Args_Error in: ' + baseStr + ':' + #13 + getRes(baseStr);
  end;
end;

procedure Init_caption(form: tform);
var
  i, j: integer;
  t: TVirtualStringTree;
begin
  form.Caption := getRes(form.Caption);
  for i := 0 to form.ComponentCount - 1 do
    if form.components[i] is TButton then
    begin
      with form.components[i] as TButton do
      begin
        Caption := getRes(TButton(form.components[i]).Caption);
        Hint := getRes(TButton(form.components[i]).Hint);
        if Hint <> '' then
        begin
          showhint := True;
          parentshowhint := false;
        end;
      end;
    end
    else if form.components[i] is TSpeedButton then
    begin
      TSpeedButton(form.components[i]).Hint := getRes(TSpeedButton(form.components[i]).Hint);
    end
    else if form.components[i] is TSplitter then
    begin
      TSplitter(form.components[i]).parentcolor := True;
    end
    else if form.components[i] is Ttoolbar then
      Ttoolbar(form.components[i]).doublebuffered := True
    else if form.components[i] is TLabel then
    begin
      TLabel(form.components[i]).Caption := getRes(TLabel(form.components[i]).Caption);
      TLabel(form.components[i]).Hint := getRes(TLabel(form.components[i]).Hint);
      TLabel(form.components[i]).parentcolor := True;
    end
    else if form.components[i] is TStaticText then
    begin
      TStaticText(form.components[i]).Caption := getRes(TStaticText(form.components[i]).Caption);
      TStaticText(form.components[i]).Hint := getRes(TStaticText(form.components[i]).Hint);
      TStaticText(form.components[i]).parentcolor := True;
    end
    else if form.components[i] is TRadioButton then
      TRadioButton(form.components[i]).Caption := getRes(TRadioButton(form.components[i]).Caption)
    else if form.components[i] is TPanel then
    begin
      TPanel(form.components[i]).Caption := getRes(TPanel(form.components[i]).Caption);
      TPanel(form.components[i]).doublebuffered := True;
      TPanel(form.components[i]).parentcolor := false;
      TPanel(form.components[i]).parentbackground := True;
      TPanel(form.components[i]).ControlStyle := TPanel(form.components[i]).ControlStyle + [csOpaque];
    end
    else if form.components[i] is TgroupBox then
    begin
      TgroupBox(form.components[i]).Caption := getRes(TgroupBox(form.components[i]).Caption);
      TgroupBox(form.components[i]).parentcolor := True;
    end
    else if form.components[i] is TCheckBox then
    begin
      TCheckBox(form.components[i]).Caption := getRes(TCheckBox(form.components[i]).Caption);
      TCheckBox(form.components[i]).parentcolor := True;
      TCheckBox(form.components[i]).doublebuffered := True;
    end
    else if form.components[i] is TTabSheet then
    begin
      TTabSheet(form.components[i]).Caption := getRes(TTabSheet(form.components[i]).Caption);
    end
    else if form.components[i] is TMenuItem then
      TMenuItem(form.components[i]).Caption := getRes(stringreplace(TMenuItem(form.components[i]).Caption, '&', '', [rfReplaceAll]))
    else if form.components[i] is TRadioGroup then
    begin
      TRadioGroup(form.components[i]).Caption := getRes(TRadioGroup(form.components[i]).Caption);
      TRadioGroup(form.components[i]).parentcolor := True;
      for j := 0 to TRadioGroup(form.components[i]).Items.Count - 1 do
        TRadioGroup(form.components[i]).Items[j] := getRes(TRadioGroup(form.components[i]).Items[j]);
    end
    else if form.components[i] is TVirtualStringTree then
    begin
      t := TVirtualStringTree(form.components[i]);
      t.ControlStyle := t.ControlStyle + [csOpaque];
      t.SelectionBlendFactor := 35;
      t.doublebuffered := True;
      for j := 0 to t.Header.Columns.Count - 1 do
        t.Header.Columns[j].Text := getRes(t.Header.Columns[j].Text);
    end
    else if form.components[i] is TToolButton then
      with form.components[i] as TToolButton do
      begin
        Hint := getRes(TButton(form.components[i]).Hint);
        if tag > 0 then
          Hint := Hint + getRes('Hint_addFilterInfo');
        if Hint <> '' then
        begin
          showhint := True;
          parentshowhint := false;
        end;
      end
    else if form.components[i] is tcombobox then
    begin
      with form.components[i] as tcombobox do
      begin
        Hint := getRes(tcombobox(form.components[i]).Hint);
        if Hint <> '' then
        begin
          showhint := True;
          parentshowhint := false;
        end;
      end
    end
    else if form.components[i] is TButtonededit then
    begin
      with form.components[i] as TButtonededit do
      begin
        ControlStyle := ControlStyle + [csOpaque];
        doublebuffered := True;
        Hint := getRes(TButtonededit(form.components[i]).Hint);
        if Hint <> '' then
        begin
          showhint := True;
          parentshowhint := false;
        end;
      end
    end
    else if form.components[i] is TEdit then
    begin
      with form.components[i] as TEdit do
      begin
        doublebuffered := True;
        Hint := getRes(TEdit(form.components[i]).Hint);
        if Hint <> '' then
        begin
          showhint := True;
          parentshowhint := false;
        end;
      end;
    end;
  InitCompoColor(form);
end;

Function replaceDIALPattern(fstring, sourcestr, deststr, s1, s2: string): string;
var
  strtmp: string;
begin
  strtmp := stringreplace(fstring, s1, trim(sourcestr), []);
  result := stringreplace(strtmp, s2, deststr, []);
end;

Procedure openQuickHtmlViewer(form: tform; Text: string; h: integer);
begin
  formHtml := tFormHtml.Create(form);
  formHtml.Caption := getRes('formHtmlView');
  formHtml.Button1.Caption := (getRes('ok'));
  formHtml.HtmlViewer1.LoadFromString(Text);
  formHtml.Clientheight := h;
  formHtml.showModal;
  formHtml.free;
end;

function GetWorkSpaceFeedbackColor(c: TColor): TColor;
begin
  if bCurrentWrongWorkspace then
    result := $00AAAAEA
  else
    result := c;
end;

procedure InitCompoColor(form: tform);
var
  i, j: integer;
  newWhite: TColor;
  tfbs: TFormBorderStyle;
begin
  newWhite := Gradient(clWhite);
  tfbs := bsSingle;
  for i := 0 to form.ComponentCount - 1 do
    if form.components[i] is TButtonededit then
    begin
      TButtonededit(form.components[i]).Color := newWhite;
      TButtonededit(form.components[i]).bevelinner := bvNone;
      TButtonededit(form.components[i]).bevelOuter := bvNone;
      TButtonededit(form.components[i]).StyleElements := [seBorder];
    end
    else if form.components[i] is TVirtualStringTree then
    begin
      for j := 0 to TVirtualStringTree(form.components[i]).Header.Columns.Count - 1 do
        TVirtualStringTree(form.components[i]).Header.Columns[j].Color := GetWorkSpaceFeedbackColor(newWhite);

      TVirtualStringTree(form.components[i]).Color := GetWorkSpaceFeedbackColor(newWhite);
      TVirtualStringTree(form.components[i]).StyleElements := [seBorder];
      TVirtualStringTree(form.components[i]).borderstyle := tfbs;
      TVirtualStringTree(form.components[i]).scrollbaroptions.scrollbars := ssVertical;
      TVirtualStringTree(form.components[i]).scrollbaroptions.AlwaysVisible := True;
      TVirtualStringTree(form.components[i]).treeoptions.PaintOptions := TVirtualStringTree(form.components[i]).treeoptions.PaintOptions + [toThemeAware];
    end
    else if form.components[i] is tcombobox then
    begin
      tcombobox(form.components[i]).Color := newWhite;
      tcombobox(form.components[i]).bevelinner := bvNone;
      tcombobox(form.components[i]).bevelOuter := bvNone;
      tcombobox(form.components[i]).StyleElements := [seBorder];
    end
    else if form.components[i] is TEdit then
    begin
      TEdit(form.components[i]).Color := newWhite;
      TEdit(form.components[i]).StyleElements := [seBorder];
    end
    else if form.components[i] is TListBox then
    begin
      TListBox(form.components[i]).Color := GetWorkSpaceFeedbackColor(newWhite);
      TListBox(form.components[i]).StyleElements := [seBorder];
      TListBox(form.components[i]).borderstyle := tfbs;
    end
    else if form.components[i] is TSynEdit then
    begin
      TSynEdit(form.components[i]).Color := newWhite;
      TSynEdit(form.components[i]).selectedColor.Background := Gradient($999999);
      TSynEdit(form.components[i]).selectedColor.Foreground := $FAFAFA;
      TSynEdit(form.components[i]).gutter.Color := newWhite;
      TSynEdit(form.components[i]).gutter.font.Color := Gradient(clgray);
      TSynEdit(form.components[i]).gutter.BorderColor := Gradient(clWhite, darkPercent + 5);
      TSynEdit(form.components[i]).activelinecolor := BlendColor($F3E2CF, Gradient(clWhite), 100 - (darkPercent) * 2); // cfe2
      TSynEdit(form.components[i]).borderstyle := tfbs;
    end
    else if form.components[i] is TrichEdit then
    begin
      TrichEdit(form.components[i]).Color := newWhite;
      TrichEdit(form.components[i]).StyleElements := [seBorder];
      TrichEdit(form.components[i]).borderstyle := tfbs;
    end
    else if form.components[i] is Tmemo then
    begin
      Tmemo(form.components[i]).Color := newWhite;
      Tmemo(form.components[i]).StyleElements := [seBorder];
      Tmemo(form.components[i]).borderstyle := tfbs;
    end
    else if form.components[i] is TvaluelistEditor then
    begin
      TvaluelistEditor(form.components[i]).Color := newWhite;
    end;

end;

end.
