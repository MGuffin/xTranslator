unit TESVT_Templates;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, System.Types,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, TESVT_const, TESVT_ressources, math;

type
  TForm22 = class(TForm)
    ListBox1: TListBox;
    ListBox2: TListBox;
    ListBox3: TListBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Edit1: TEdit;
    ListBox4: TListBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ListBox1DragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure ListBox1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure ListBox4DragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure ListBox4DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure ListBox4DblClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    editedTemplate: Integer;
    doNotUpdate: Boolean;
    procedure generateTemplate(t: tstrings);
    procedure deleteTemplateItem(i: Integer);
    function assignTemplateRule(td: string): tstringlist;
    procedure setTemplateRules(i: Integer);
    procedure updateRules(i: Integer);
    procedure addTemplateItem;
    procedure clearRules;
    procedure updateMainTemplateList;
  public
    templateList: tstringlist; // point on formdata list
    tagList: tstringlist;

  end;

var
  Form22: TForm22;

Const
  nullTitle = 'NULL';

implementation

{$R *.dfm}

procedure TForm22.Button1Click(Sender: TObject);
begin
  updateMainTemplateList;
end;

procedure TForm22.Button3Click(Sender: TObject);
begin
  addTemplateItem;
end;

procedure TForm22.Button4Click(Sender: TObject);
begin
  deleteTemplateItem(editedTemplate);
  editedTemplate:= -1;
  clearRules;
end;

procedure TForm22.FormCreate(Sender: TObject);
begin
  init_caption(self);
  doNotUpdate:= false;
  editedTemplate:= -1;
  tagList:= tstringlist.create;
end;

procedure TForm22.FormDestroy(Sender: TObject);
var
  i: Integer;
begin
  for i:= ListBox4.items.count - 1 downto 0 do
    deleteTemplateItem(i);
  tagList.free;
end;

procedure TForm22.FormShow(Sender: TObject);
begin
  generateTemplate(ListBox4.items);
end;

procedure TForm22.ListBox1DragDrop(Sender, Source: TObject; X, Y: Integer);
var
  i: Integer;
  CursorPos: TPoint;
  Index: Integer;
  List: tstringlist;
begin
  List:= tstringlist.create;
  try
    with TListBox(Source) do
    begin
      for i:= 0 to items.count - 1 do
        if selected[i] then
          List.add(items[i]);

      for i:= items.count - 1 downto 0 do
        if selected[i] then
          items.delete(i);
    end;
    CursorPos:= Point(X, Y);
    with TListBox(Sender) do
    begin
      Index:= ItemAtPos(CursorPos, true);
      for i:= List.count - 1 downto 0 do
        if Index > -1 then
          items.Insert(Index, List[i])
        else
          items.add(List[List.count - 1 - i]);
    end;
  finally
    List.free;
    updateRules(editedTemplate);
  end;
end;

procedure TForm22.ListBox1DragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept:= (Source is TListBox) and (Source <> Sender) and (Source <> ListBox4);
end;

procedure TForm22.ListBox4DblClick(Sender: TObject);
begin
  editedTemplate:= ListBox4.itemIndex;
  setTemplateRules(editedTemplate);
end;

procedure TForm22.ListBox4DragDrop(Sender, Source: TObject; X, Y: Integer);
var
  DropIndex: Integer;
begin
  DropIndex:= TListBox(Sender).ItemAtPos(Point(X, Y), false);
  with TListBox(Source) do
  begin
    TListBox(Sender).items.InsertObject(DropIndex, items[itemIndex], tstringlist(items.objects[itemIndex]));
    items.delete(itemIndex);
  end;
  editedTemplate:= -1;
  clearRules;
end;

procedure TForm22.ListBox4DragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept:= (Source = Sender);
end;

function TForm22.assignTemplateRule(td: string): tstringlist;
begin
  result:= tstringlist.create;
  result.sorted:= true;
  result.Duplicates:= dupIgnore;
  result.Delimiter:= ',';
  result.DelimitedText:= ansilowercase(td);
end;

procedure TForm22.deleteTemplateItem(i: Integer);
begin
  if inrange(i, 0, ListBox4.items.count - 1) then
  begin
    tstringlist(ListBox4.items.objects[i]).free;
    ListBox4.items.delete(i);
  end;
end;

procedure TForm22.Edit1Change(Sender: TObject);
begin
  updateRules(editedTemplate);
end;

procedure TForm22.generateTemplate(t: tstrings);
var
  i, Index: Integer;
  title, rules, template: string;
begin
  t.clear;
  for i:= 0 to pred(templateList.count) do
  begin
    template:= templateList[i];
    index:= pos(',', template);
    if (index > 1) then
      title:= copy(template, 1, index - 1)
    else
      title:= nullTitle;
    if (length(template) > index) then
      rules:= copy(template, index + 1, maxint)
    else
      rules:= '*';
    t.addObject(title, assignTemplateRule(rules));
  end;
end;

procedure TForm22.setTemplateRules(i: Integer);
var
  t: tstringlist;
  j, Index: Integer;
begin
  clearRules;
  if i < 0 then
    exit;
  doNotUpdate:= true;
  Edit1.text:= ListBox4.items[i];
  t:= tstringlist(ListBox4.items.objects[i]);
  if (t.count > 0) and (t[0] = '*') then
  begin
    for j:= 0 to tagList.count - 1 do
      ListBox1.items.add(tagList[j])
  end
  else
    for j:= 0 to tagList.count - 1 do
    begin
      if t.find('!' + ansilowercase(tagList[j]), index) then // fallback
        ListBox3.items.add(tagList[j])
      else if t.find(ansilowercase(tagList[j]), index) then // enabled
        ListBox1.items.add(tagList[j])
      else
        ListBox2.items.add(tagList[j]); // disabled
    end;
  doNotUpdate:= false;
end;

procedure TForm22.updateRules(i: Integer);
var
  t: tstringlist;
  j: Integer;
begin
  if doNotUpdate or (i < 0) or (i > ListBox4.items.count - 1) then
    exit;
  if trim(Edit1.text) = '' then
    ListBox4.items[i]:= nullTitle
  else
    ListBox4.items[i]:= stringreplace(trim(Edit1.text), ',', '-', [rfReplaceAll]);

  t:= tstringlist(ListBox4.items.objects[i]);
  t.clear;
  for j:= 0 to ListBox1.count - 1 do
    t.add(ListBox1.items[j]);
  for j:= 0 to ListBox3.count - 1 do
    t.add('!' + ListBox3.items[j]);
end;

procedure TForm22.addTemplateItem;
begin
  ListBox4.items.addObject(nullTitle, assignTemplateRule('*'));
end;

procedure TForm22.clearRules;
begin
  doNotUpdate:= true;
  Edit1.text:= '';
  ListBox1.clear;
  ListBox2.clear;
  ListBox3.clear;
  doNotUpdate:= false;
end;

procedure TForm22.updateMainTemplateList;
var
  t: tstringlist;
  i: Integer;
begin
  templateList.clear;
  for i:= 0 to ListBox4.items.count - 1 do
  begin
    t:= tstringlist(ListBox4.items.objects[i]);
    templateList.add(ListBox4.items[i] + ',' + t.DelimitedText);
  end;
end;

end.
