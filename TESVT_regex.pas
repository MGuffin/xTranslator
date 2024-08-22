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
unit TESVT_regex;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, TESVT_typedef,
  TESVT_Ressources, StdCtrls, ComCtrls, ExtCtrls, regularexpressions, TESVT_Const, Menus,
  TESVT_sharedVTProc;

type
  TForm13 = class(TForm)
    ListBox1: TListBox;
    PopupMenu1: TPopupMenu;
    MenuPresetSave1: TMenuItem;
    MenuPresetDelete1: TMenuItem;
    MenuPresetRename1: TMenuItem;
    Panel1: TPanel;
    Memo1: TMemo;
    ListBox2: TListBox;
    Memo3: TMemo;
    Panel2: TPanel;
    CheckBox4: TCheckBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    Button2: TButton;
    Button1: TButton;
    Panel3: TPanel;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    UpDown1: TUpDown;
    Panel4: TPanel;
    Panel5: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Panel6: TPanel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Panel7: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure MenuPresetSave1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
    procedure ListBox1DrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
    procedure MenuPresetRename1Click(Sender: TObject);
    procedure MenuPresetDelete1Click(Sender: TObject);
    procedure ListBox1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure ListBox1DragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure ListBox1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ListBox2DrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
  private
    subject: string;
    numX, numY: Integer;
    procedure checkRegex;
  public
    skSource: tSkyStr;
  end;

var
  Form13: TForm13;

implementation

{$R *.dfm}

uses TESVT_main;

procedure TForm13.checkRegex;
var
  r: TRegEx;
  i: Integer;
  strtmp, strTransTmp: string;
  b: Boolean;
  m: TMatch;
Const
  ErrorColor: array [0 .. 1] of tcolor = (clWhite, tcolor($AAAAFF));
begin
  Button1.enabled:= true;

  b:= false;

  if skSource = nil then
  begin
    subject:= getRes('RegExTestSubject');
    strTransTmp:= '';
  end else begin
    if RadioGroup2.ItemIndex in [0, 2] then
      subject:= skSource.s
    else
      subject:= skSource.strans;
    strTransTmp:= skSource.strans;
  end;

  Memo1.clear;
  Memo3.clear;
  ListBox2.clear;
  Memo1.lines.add(subject);
  // (roNone, roIgnoreCase, roMultiLine, roExplicitCapture,  roCompiled, roSingleLine, roIgnorePatternSpace, roNotEmpty);
  try
    try
      if not CheckBox2.checked then
        r:= TRegEx.create(ComboBox1.text, [roMultiLine, roSingleLine])
      else
        r:= TRegEx.create(ComboBox1.text, [roMultiLine, roSingleLine, roIgnoreCase]);

      m:= r.match(subject);
      if m.success then
      begin
        for i:= 1 to m.groups.count - 1 do
          ListBox2.items.add(format(getRes('BckRef_') + '%d:  %s', [i, m.groups[i].Value]));
        strtmp:= ComboBox2.text;
        for i:= m.groups.count - 1 downto 1 do
        begin
          strtmp:= stringreplace(strtmp, '%' + inttostr(i), m.groups[i].Value, [rfReplaceAll]);
          strtmp:= stringreplace(strtmp, '$' + inttostr(i), m.groups[i].Value, [rfReplaceAll]);
          strtmp:= stringreplace(strtmp, '#' + inttostr(i), m.groups[i].Value, [rfReplaceAll]);
        end;
        strtmp:= stringreplace(strtmp, '%d', strTransTmp, [rfReplaceAll]);
        strtmp:= stringreplace(strtmp, '\r', #13, [rfReplaceAll]);
        strtmp:= stringreplace(strtmp, '\n', #10, [rfReplaceAll]);
        Memo3.text:=strtmp;
      end;
    except
      on E: Exception do
      begin
        b:= true;
        Button1.enabled:= false;
      end;
    end;
  finally
    Memo1.color:= gradient(ErrorColor[ord(b)]);
  end;

end;

procedure TForm13.ComboBox1Change(Sender: TObject);
begin
  checkRegex;
end;

procedure TForm13.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  init_caption(self);
  Memo1.Font.name:= DefaultSynFont;
  ComboBox1.Font.name:= DefaultSynFont;
  ComboBox2.Font.name:= DefaultSynFont;

  for i:= 0 to pred(lRegExPreset_Label.count) do
    ListBox1.items.add(lRegExPreset_Label[i]);
end;

procedure TForm13.FormShow(Sender: TObject);
begin
  checkRegex;
end;

procedure TForm13.ListBox1DblClick(Sender: TObject);
begin
  if ListBox1.ItemIndex >= 0 then
  begin
    ComboBox1.text:= lRegExPreset_RegEx[ListBox1.ItemIndex];
    ComboBox2.text:= lRegExPreset_Replace[ListBox1.ItemIndex];
    checkRegex;
  end;
end;

procedure TForm13.ListBox1DragDrop(Sender, Source: TObject; X, Y: Integer);
var
  num1, num2: Integer;
  point1, point2: TPoint;
begin
  point1.X:= numX;
  point1.Y:= numY;
  point2.X:= X;
  point2.Y:= Y;
  with Source as TListBox do
  begin
    num2:= ListBox1.ItemAtPos(point1, true);
    num1:= ListBox1.ItemAtPos(point2, true);
    if num2 = -1 then
      exit;
    if num1 = -1 then
      num1:= pred(ListBox1.items.count);
    ListBox1.items.Move(num2, num1);
    lRegExPreset_Label.Move(num2, num1);
    lRegExPreset_RegEx.Move(num2, num1);
    lRegExPreset_Replace.Move(num2, num1);
  end;
end;

procedure TForm13.ListBox1DragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  if Source = ListBox1 then
    Accept:= true;
end;

procedure TForm13.ListBox1DrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
  ListBoxDrawItem(Control, Index, Rect, State, ListBox1.color, form1.ImageList1, 1)
end;

procedure TForm13.ListBox1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  numY:= Y;
  numX:= X;
end;

procedure TForm13.ListBox2DrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
  ListBoxDrawItem(Control, Index, Rect, State, ListBox2.color, form1.ImageList1, 33)
end;

procedure TForm13.MenuPresetDelete1Click(Sender: TObject);
begin
  if ListBox1.ItemIndex >= 0 then
  begin
    lRegExPreset_Label.delete(ListBox1.ItemIndex);
    lRegExPreset_RegEx.delete(ListBox1.ItemIndex);
    lRegExPreset_Replace.delete(ListBox1.ItemIndex);
    ListBox1.items.delete(ListBox1.ItemIndex);
  end;
end;

procedure TForm13.MenuPresetRename1Click(Sender: TObject);
var
  Value: string;
begin
  if ListBox1.ItemIndex >= 0 then
  begin
    Value:= lRegExPreset_Label[ListBox1.ItemIndex];
    if InputQuery(ProgName, getRes('RegExPresetName'), Value) then
    begin
      lRegExPreset_Label[ListBox1.ItemIndex]:= Value;
      ListBox1.items[ListBox1.ItemIndex]:= Value;
    end;
  end;
end;

procedure TForm13.MenuPresetSave1Click(Sender: TObject);
var
  Value: string;
begin
  Value:= getRes('PresetDefault');
  if InputQuery(ProgName, getRes('RegExPresetName'), Value) then
  begin
    lRegExPreset_Label.add(Value);
    lRegExPreset_RegEx.add(ComboBox1.text);
    lRegExPreset_Replace.add(ComboBox2.text);
    ListBox1.items.add(Value);
  end;
end;

procedure TForm13.PopupMenu1Popup(Sender: TObject);
begin
  MenuPresetSave1.enabled:= (ComboBox1.text <> '') and (ComboBox2.text <> '');
  MenuPresetDelete1.enabled:= ListBox1.ItemIndex >= 0;
  MenuPresetRename1.enabled:= ListBox1.ItemIndex >= 0;
end;

procedure TForm13.RadioGroup2Click(Sender: TObject);
begin
  checkRegex;
end;

end.
