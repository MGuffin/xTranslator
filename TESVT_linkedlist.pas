unit TESVT_LinkedList;

interface

uses
  SysUtils, classes;

type

  PNode = ^TNode;

  TNode = record
    Data: Pointer;
    Next: PNode;
    Previous: PNode;
  end;

  TLinkedList = class
  private
    FHead: PNode;
    FTail: PNode;
    FCount: Integer;

    function BinarySearch(const Data: Pointer; Compare: TListSortCompare; var node: PNode): boolean;
  public
    constructor Create;
    destructor Destroy; override;
    function IsEmpty: boolean;
    function Add(const Data: Pointer): PNode;
    function Delete(node: PNode): boolean;
    function GetFirst: PNode;
    function GetLast: PNode;
    function GetNext(node: PNode): PNode;
    function GetPrevious(node: PNode): PNode;
    function GetAt(const Position: Integer): PNode;
    function GetCount: Integer;
    function InsertPrevious(const Data: Pointer; node: PNode): PNode;
    function InsertNext(const Data: Pointer; node: PNode): PNode;
    function FindAndInsert(const Data: Pointer; Compare: TListSortCompare): PNode;
  end;

implementation

constructor TLinkedList.Create;
begin
  FHead:= nil;
  FTail:= nil;
  FCount:= 0;
end;

destructor TLinkedList.Destroy;
var
  node: PNode;
begin
  node:= FHead;
  while node <> nil do
  begin
    FHead:= node.Next;
    Dispose(node);
    node:= FHead;
  end;
end;

function TLinkedList.IsEmpty: boolean;
begin
  Result:= FCount = 0;
end;

function TLinkedList.Add(const Data: Pointer): PNode;
begin
  Result:= New(PNode);
  Result.Data:= Data;
  Result.Next:= nil;
  Result.Previous:= FTail;

  if FTail <> nil then
    FTail.Next:= Result
  else
    FHead:= Result;

  FTail:= Result;
  Inc(FCount);
end;

function TLinkedList.Delete(node: PNode): boolean;
begin
  if node = FHead then
  begin
    FHead:= node.Next;
    if FHead <> nil then
      FHead.Previous:= nil;
  end
  else if node = FTail then
  begin
    FTail:= node.Previous;
    FTail.Next:= nil;
  end
  else
  begin
    node.Previous.Next:= node.Next;
    node.Next.Previous:= node.Previous;
  end;

  Dispose(node);
  Dec(FCount);

  Result:= True;
end;

function TLinkedList.GetFirst: PNode;
begin
  Result:= FHead;
end;

function TLinkedList.GetLast: PNode;
begin
  Result:= FTail;
end;

function TLinkedList.GetNext(node: PNode): PNode;
begin
  if node = nil then
    Exit(nil);

  Result:= node.Next;
end;

function TLinkedList.GetPrevious(node: PNode): PNode;
begin
  if node = nil then
    Exit(nil);

  Result:= node.Previous;
end;

function TLinkedList.GetAt(const Position: Integer): PNode;
var
  node: PNode;
  i: Integer;
begin
  if Position < 0 then
    Exit(nil);

  if Position >= FCount then
    Exit(nil);

  node:= FHead;
  for i:= 0 to Position - 1 do
  begin
    node:= node.Next;
  end;

  Result:= node;
end;

function TLinkedList.GetCount: Integer;
begin
  Result:= FCount;
end;

function TLinkedList.BinarySearch(const Data: Pointer; Compare: TListSortCompare; var node: PNode): boolean;
var
  Low, High, Mid: Integer;
begin
  node:= FHead;
  Low:= 0;
  High:= FCount - 1;

  while Low <= High do
  begin
    Mid:= (Low + High) div 2;

    if Compare(node.Data, Data) = 0 then
      Exit(True);

    if Compare(node.Data, Data) < 0 then
    begin
      node:= node.Next;
      Low:= Mid + 1;
    end
    else
    begin
      node:= node.Previous;
      High:= Mid - 1;
    end;
  end;
  Result:= False;
end;

function TLinkedList.FindAndInsert(const Data: Pointer; Compare: TListSortCompare): PNode;
var
  node: PNode;
begin
  if not BinarySearch(Data, Compare, node) then
    Result:= InsertPrevious(Data, node)
  else
    Result:= nil;
end;

function TLinkedList.InsertNext(const Data: Pointer; node: PNode): PNode;
begin
  if node = nil then
    Result:= Add(Data)
  else
  begin
    Result:= New(PNode);
    Result.Data:= Data;
    Result.Next:= node.Next;
    Result.Previous:= node;
    if node.Next <> nil then
      node.Next.Previous:= Result;
    node.Next:= Result;
    Inc(FCount);
  end;
end;

function TLinkedList.InsertPrevious(const Data: Pointer; node: PNode): PNode;
begin
  if node = nil then
    Result:= Add(Data)
  else
  begin
    Result:= New(PNode);
    Result.Data:= Data;
    Result.Next:= node;
    Result.Previous:= node.Previous;
    if node.Previous <> nil then
      node.Previous.Next:= Result;
    node.Previous:= Result;
    Inc(FCount);
  end;
end;

end.
