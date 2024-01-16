unit TESVT_AdvSearch;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls, TESVT_Const, TESVT_Ressources, Menus,
  TESVT_sharedVTProc;

type
  TAdvSearchForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    ListBox1: TListBox;
    Panel4: TPanel;
    Panel5: TPanel;
    Button3: TButton;
    Button2: TButton;
    Button1: TButton;
    Panel6: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel7: TPanel;
    Panel8: TPanel;
    ButtonedEdit1: TButtonedEdit;
    Panel9: TPanel;
    ButtonedEdit2: TButtonedEdit;
    Panel10: TPanel;
    ButtonedEdit3: TButtonedEdit;
    Panel11: TPanel;
    ButtonedEdit4: TButtonedEdit;
    ButtonedEdit5: TButtonedEdit;
    Panel12: TPanel;
    Label5: TLabel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Panel13: TPanel;
    ButtonedEdit6: TButtonedEdit;
    Label6: TLabel;
    Label7: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ButtonedEdit1RightButtonClick(Sender: TObject);
    procedure ButtonedEdit1LeftButtonClick(Sender: TObject);
    procedure updateSearchIcon(b: TButtonedEdit; icon: integer);
    procedure ButtonedEdit1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ListBox1DrawItem(Control: TWinControl; Index: integer; Rect: TRect; State: TOwnerDrawState);
    procedure Button1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure getWinSize;
    procedure FormShow(Sender: TObject);
  private
    procedure switchRegex(b: TButtonedEdit); overload;
    procedure switchRegex(b: TButtonedEdit; bForced: boolean); overload;
    procedure setWinSize;
  end;

var
  AdvSearchForm: TAdvSearchForm;
  sSearchUseRegex: array [1 .. 4] of boolean = (
    false,
    false,
    false,
    false
  );

implementation

uses TESVT_main;
{$R *.dfm}

procedure TAdvSearchForm.updateSearchIcon(b: TButtonedEdit; icon: integer);
begin
  with b.leftbutton do
  begin
    DisabledImageIndex := icon;
    HotImageIndex := icon;
    ImageIndex := icon;
    PressedImageIndex := icon;
  end;
end;

procedure TAdvSearchForm.Button1Click(Sender: TObject);
begin
  close;
end;

procedure TAdvSearchForm.Button2Click(Sender: TObject);
var
  l: tstringlist;
begin
  l := tstringlist.create;
  l.add(ButtonedEdit1.text);
  l.add(ButtonedEdit2.text);
  l.add(ButtonedEdit3.text);
  l.add(ButtonedEdit4.text);
  l.add(ButtonedEdit5.text);
  l.add(booltostr(sSearchUseRegex[1]));
  l.add(booltostr(sSearchUseRegex[2]));
  l.add(booltostr(sSearchUseRegex[3]));
  // keyword     sSearchUseRegex 5 & 6   are not used (REC FIELD)
  l.add(ButtonedEdit6.text);
  l.add(booltostr(sSearchUseRegex[4]));
  l.Delimiter := '|';
  l.QuoteChar := '"';
  ListBox1.items.add(l.DelimitedText);
  l.free;
end;

procedure TAdvSearchForm.Button3Click(Sender: TObject);
var
  i, last: integer;
begin
  last := -1;
  for i := pred(ListBox1.items.count) downto 0 do
    if ListBox1.Selected[i] then
    begin
      ListBox1.items.delete(i);
      last := i;
    end;
  if (ListBox1.count > 0) and (last <> -1) then
  begin
    if (last >= 0) and (last < ListBox1.items.count) then
      ListBox1.Selected[last] := true
    else
      ListBox1.Selected[pred(ListBox1.items.count)] := true;
  end;
end;

procedure TAdvSearchForm.ButtonedEdit1Change(Sender: TObject);
begin
  launchSearchTimer;
end;

procedure TAdvSearchForm.switchRegex(b: TButtonedEdit);
begin
  sSearchUseRegex[b.tag] := not sSearchUseRegex[b.tag];
  if sSearchUseRegex[b.tag] then
    updateSearchIcon(b, 57)
  else
    updateSearchIcon(b, 13);
end;

procedure TAdvSearchForm.switchRegex(b: TButtonedEdit; bForced: boolean);
begin
  sSearchUseRegex[b.tag] := bForced;
  if sSearchUseRegex[b.tag] then
    updateSearchIcon(b, 57)
  else
    updateSearchIcon(b, 13);
end;

procedure TAdvSearchForm.ButtonedEdit1LeftButtonClick(Sender: TObject);
begin
  switchRegex(TButtonedEdit(Sender));
  launchSearchTimer;
end;

procedure TAdvSearchForm.ButtonedEdit1RightButtonClick(Sender: TObject);
begin
  TButtonedEdit(Sender).text := '';
  launchSearchTimer;
end;

procedure TAdvSearchForm.getWinSize;
var
  windata: TWindowPlacement;
begin
  windata.length := sizeof(windata);
  GetWindowPlacement(handle, @windata);
  AdvSearchrWindowpos.width := windata.rcNormalPosition.right - windata.rcNormalPosition.left;
  AdvSearchrWindowpos.height := windata.rcNormalPosition.bottom - windata.rcNormalPosition.top;
  AdvSearchrWindowpos.top := windata.rcNormalPosition.top;
  AdvSearchrWindowpos.left := windata.rcNormalPosition.left;
end;

procedure TAdvSearchForm.setWinSize;
begin
  // position:
  if AdvSearchrWindowpos.width > screen.width then
    width := screen.width
  else
    width := AdvSearchrWindowpos.width;
  if AdvSearchrWindowpos.height > screen.height then
    height := screen.height
  else
    height := AdvSearchrWindowpos.height;
  top := AdvSearchrWindowpos.top;
  left := AdvSearchrWindowpos.left;
end;

procedure TAdvSearchForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  getWinSize;
  form1.ButtonedEdit1.enabled := true;
  form1.ToolButton55.down := false;
  launchSearchTimer;
end;

procedure TAdvSearchForm.FormCreate(Sender: TObject);
var
  i: integer;
begin
  init_caption(self);
  // hint
  ButtonedEdit3.hint := getres('hint_SearchFieldInfo') + htmlBR + htmlBR + ButtonedEdit3.hint;

  ButtonedEdit6.hint := getres('hint_SearchFieldInfo') + htmlBR + htmlBR + ButtonedEdit6.hint;

  for i := 0 to pred(lAdvSearchPreset.count) do
    ListBox1.items.add(lAdvSearchPreset[i]);
  setWinSize;
end;

procedure TAdvSearchForm.FormShow(Sender: TObject);
begin
  setWinSize;
end;

procedure TAdvSearchForm.ListBox1DblClick(Sender: TObject);
var
  l: tstringlist;
begin
  if ListBox1.itemIndex >= 0 then
  begin
    l := tstringlist.create;
    try
      try
        // clean
        ButtonedEdit1.text := '';
        ButtonedEdit2.text := '';
        ButtonedEdit3.text := '';
        ButtonedEdit4.text := '';
        ButtonedEdit5.text := '';
        ButtonedEdit6.text := '';
        switchRegex(ButtonedEdit1, false);
        switchRegex(ButtonedEdit2, false);
        switchRegex(ButtonedEdit3, false);
        switchRegex(ButtonedEdit6, false);
        // ------
        l.Delimiter := '|';
        l.QuoteChar := '"';
        l.DelimitedText := ListBox1.items[ListBox1.itemIndex];
        if l.count >= 5 then
        begin
          ButtonedEdit1.text := l[0];
          ButtonedEdit2.text := l[1];
          ButtonedEdit3.text := l[2];
          ButtonedEdit4.text := l[3];
          ButtonedEdit5.text := l[4];
        end;
        if l.count >= 8 then
        begin
          switchRegex(ButtonedEdit1, strtobooldef(l[5], false));
          switchRegex(ButtonedEdit2, strtobooldef(l[6], false));
          switchRegex(ButtonedEdit3, strtobooldef(l[7], false));
        end;
        if l.count >= 10 then
        begin
          ButtonedEdit6.text := l[8];
          switchRegex(ButtonedEdit6, strtobooldef(l[9], false));
        end;
      except
      end;
    finally
      l.free;
    end;
  end;
end;

procedure TAdvSearchForm.ListBox1DrawItem(Control: TWinControl; Index: integer; Rect: TRect; State: TOwnerDrawState);
begin
  ListBoxDrawItem(Control, Index, Rect, State, ListBox1.color, form1.ImageList1, 1)
end;

procedure TAdvSearchForm.N1Click(Sender: TObject);
var
  tmp: boolean;
begin
  tmp := TMenuItem(Sender).Checked;
  TMenuItem(Sender).Checked := true;
  if tmp <> TMenuItem(Sender).Checked then
    launchSearchTimer;
end;

end.
