unit TESVT_ToolboxOptions;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, TESVT_Ressources, TESVT_Const, TESVT_XMLFunc;

type
  TForm17 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Button3: TButton;
    Button4: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form17: TForm17;

implementation

{$R *.dfm}

procedure TForm17.Button3Click(Sender: TObject);
begin
  if authFileAccess(Game_CacheDataFolder + sDefUITagXml) then
    XMLImportTag(Game_CacheDataFolder + sDefUITagXml, lDEFUIHeader);
  Memo1.lines.BeginUpdate;
  Memo1.text:= lDEFUIHeader.text;
  Memo1.lines.endUpdate;
end;

procedure TForm17.Button4Click(Sender: TObject);
var
  sl: tStringList;
begin
  sl:= tStringList.Create;
  try
    Memo1.lines.BeginUpdate;
    try
      sl.Assign(Memo1.lines);
      sl.Sort;
      Memo1.lines.Assign(sl);
    finally
      Memo1.lines.endUpdate;
    end;
  finally
    sl.Free;
  end;
end;

procedure TForm17.FormCreate(Sender: TObject);
begin
  Init_caption(self);
  Button3.enabled:= authFileAccess(Game_CacheDataFolder + sDefUITagXml);
end;

end.
