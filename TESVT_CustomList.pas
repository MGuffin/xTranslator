unit TESVT_CustomList;

interface

uses classes, sysutils;

type
  tmcStringList = class(tStringList)
  private
    FObjSorted: Boolean;
    FCachedIndex: integer;
    procedure SetObjSorted(Value: Boolean);
    function IndexOfName_Cache(const Name: string; bInitCache: Boolean): integer;
  public
    function valueStr(s: string; default: string = ''): string;
    function valueTrim(s: string; default: string = ''): string;
    function valueInt(s: string; default: integer = 0): integer;
    function valueBoolean(s: string; default: Boolean = false): Boolean;
    procedure valueIntAdd(s: string; add: integer = 0);
    procedure ObjSort;
    property ObjSorted: Boolean read FObjSorted write SetObjSorted;
    function ObjFind(const Value: integer; var Index: integer): Boolean;
    function GetValue_Cache(const Name: string; bInitCache: Boolean): string;
  end;

  CardinalPairResult = array of cardinal;

  rCardinalPair = record
    a, b: cardinal;
  end;

  pCardinalPair = ^rCardinalPair;

  tmcCardinalPairList = class(Tlist)
  private
    fPairSorted: Boolean;
    procedure SetPairSorted(Value: Boolean);
    function addPointer(p: pointer; var Index: integer): Boolean;
    function FastSearch(Compare: TListSortCompare; p: pointer; var newindex: integer; b: Boolean): Boolean;
  public
    function AddPair(x, y: cardinal): integer;
    procedure sortPair;
    function findPairArray(Value: cardinal): CardinalPairResult;
    function findPair(Value: cardinal; var ValueOut: cardinal): Boolean;

    procedure Clear; override;
    destructor Destroy; override;
    property PairSorted: Boolean read fPairSorted write SetPairSorted;
  end;

  rCardinalPointer = record
    a: cardinal;
    p: pointer;
  end;

  pCardinalPointer = ^rCardinalPointer;

  tmcCardinalPointerList = class(Tlist)
  private
    fPairSorted: Boolean;
    procedure SetPairSorted(Value: Boolean);
    function addPointer(p: pointer; var Index: integer): Boolean;
    function FastSearch(Compare: TListSortCompare; p: pointer; var newindex: integer): Boolean;
  public
    function AddPair(x: cardinal; y: pointer): integer;
    procedure sortPair;
    function findPair(Value: cardinal): pointer;
    procedure Clear; override;
    destructor Destroy; override;
    property PairSorted: Boolean read fPairSorted write SetPairSorted;
  end;


  rCardinalString = record
    a: cardinal;
    s: string;
  end;

  pCardinalString = ^rCardinalString;

  tmcCardinalStringList = class(Tlist)
  private
    fPairSorted: Boolean;
    procedure SetPairSorted(Value: Boolean);
    function addPointer(p: pointer; var Index: integer): Boolean;
    function FastSearch(Compare: TListSortCompare; p: pointer; var newindex: integer): Boolean;
  public
    function AddPair(x: cardinal; s: string): integer;
    procedure sortPair;
    function findPair(Value: cardinal): string;
    procedure Clear; override;
    destructor Destroy; override;
    property PairSorted: Boolean read fPairSorted write SetPairSorted;
  end;




implementation

function compareCardinal(a, b: cardinal): integer;
begin
  if a < b then
    exit(-1)
  else if a > b then
    exit(1);
  result:= 0;
end;

function CardinalPairListCompareX(p1, p2: pointer): integer;
begin
  result:= compareCardinal(pCardinalPair(p1).a, pCardinalPair(p2).a);
end;

function CardinalPairListCompare(p1, p2: pointer): integer;
begin
  result:= CardinalPairListCompareX(p1, p2);
  if result = 0 then
    result:= compareCardinal(pCardinalPair(p1).b, pCardinalPair(p2).b);
end;

function tmcCardinalPairList.AddPair(x, y: cardinal): integer;
var
  pC: pCardinalPair;
  Index: integer;
begin
  result:= -1;
  new(pC);
  pC^.a:= x;
  pC^.b:= y;
  if fPairSorted then
  begin
    if addPointer(pC, index) then
      result:= index
    else
      dispose(pC);
  end
  else
  begin
    add(pC);
    result:= count - 1;
  end;
end;

procedure tmcCardinalPairList.sortPair;
begin
  sort(CardinalPairListCompare);
end;

function tmcCardinalPairList.findPairArray(Value: cardinal): CardinalPairResult;
var
  Index, i: integer;
  dummy, pC: pCardinalPair;
begin
  setlength(result, 0);
  new(dummy);
  dummy.a:= Value;
  if FastSearch(CardinalPairListCompareX, dummy, index, true) then
  begin
    for i:= index to pred(count) do
    begin
      pC:= List[i];
      if pC^.a <> Value then
        break;
      setlength(result, length(result) + 1);
      result[length(result) - 1]:= pC^.b;
    end;
  end;
  dispose(dummy);
end;

function tmcCardinalPairList.findPair(Value: cardinal; var ValueOut: cardinal): Boolean;
var
  Index: integer;
  dummy: pCardinalPair;
begin
  result:= false;
  new(dummy);
  dummy.a:= Value;
  if FastSearch(CardinalPairListCompareX, dummy, index, true) then
  begin
    ValueOut:= pCardinalPair(List[index])^.b;
    result:= true;
  end;
  dispose(dummy);
end;

procedure tmcCardinalPairList.Clear;
var
  i: integer;
begin
  for i:= 0 to pred(count) do
    dispose(pCardinalPair(List[i]));

  SetCount(0);
  SetCapacity(0);
end;

function tmcCardinalPairList.addPointer(p: pointer; var Index: integer): Boolean;
begin
  result:= false;
  if not FastSearch(CardinalPairListCompare, p, index, false) then
  begin
    Insert(index, p);
    result:= true
  end;
end;

function tmcCardinalPairList.FastSearch(Compare: TListSortCompare; p: pointer; var newindex: integer; b: Boolean): Boolean;
var
  i, L, H: integer;
  c: integer;
  function getlowest(p: pointer; startID: integer): integer;
  begin
    result:= startID;
    dec(startID);
    while (startID >= 0) do
    begin
      if (Compare(List[startID], p) = 0) then
        result:= startID
      else
        exit;
      dec(startID);
    end;
  end;

begin
  result:= false;
  L:= 0;
  H:= count - 1;
  while (L <= H) do
  begin
    i:= (L + H) shr 1;
    c:= Compare(List[i], p);
    if c < 0 then
      L:= i + 1
    else
    begin
      H:= i - 1;
      if c = 0 then
      begin
        L:= i;
        if b then
          L:= getlowest(p, L);
        result:= true;
        break;
      end;
    end;
  end;
  newindex:= L;
end;

procedure tmcCardinalPairList.SetPairSorted(Value: Boolean);
begin
  if fPairSorted <> Value then
  begin
    if Value then
      sortPair;
    fPairSorted:= Value;
  end;
end;

destructor tmcCardinalPairList.Destroy;
begin
  Clear;
end;

// =====================================

function tmcStringList.valueInt(s: string; default: integer = 0): integer;
begin
  result:= strtoIntdef(trim(values[s]), default);
end;

procedure tmcStringList.valueIntAdd(s: string; add: integer = 0);
begin
  values[s]:= inttostr(valueInt(s) + add);
end;

function tmcStringList.valueBoolean(s: string; default: Boolean = false): Boolean;
begin
  result:= strtoBooldef(trim(values[s]), default);
end;

function tmcStringList.valueStr(s: string; default: string = ''): string;
begin
  result:= values[s];
  if result = '' then
    result:= default;
end;

function tmcStringList.valueTrim(s: string; default: string = ''): string;
begin
  result:= trim(values[s]);
  if result = '' then
    result:= default;
end;

procedure tmcStringList.SetObjSorted(Value: Boolean);
begin
  if FObjSorted <> Value then
  begin
    if Value then
      ObjSort;
    FObjSorted:= Value;
  end;
end;

function tmcStringList.ObjFind(const Value: integer; var Index: integer): Boolean;
var
  L, H, i, c: integer;
begin
  result:= false;
  L:= 0;
  H:= count - 1;
  while L <= H do
  begin
    i:= (L + H) shr 1;
    c:= integer(Objects[i]) - Value;
    if c < 0 then
      L:= i + 1
    else
    begin
      H:= i - 1;
      if c = 0 then
      begin
        result:= true;
        if Duplicates <> dupAccept then
          L:= i;
      end;
    end;
  end;
  Index:= L;
end;

function StringListCompareObjAsInt(List: tStringList; Index1, Index2: integer): integer;
begin
  result:= integer(List.Objects[Index1]) - integer(List.Objects[Index2])
end;

procedure tmcStringList.ObjSort;
begin
  CustomSort(StringListCompareObjAsInt);
end;

function tmcStringList.IndexOfName_Cache(const Name: string; bInitCache: Boolean): integer;
var
  p: integer;
  s: string;
begin
  if bInitCache then
    FCachedIndex:= 0;

  for result:= FCachedIndex to GetCount - 1 do
  begin
    s:= Get(result);
    p:= AnsiPos(NameValueSeparator, s);
    if (p <> 0) and (CompareStrings(Copy(s, 1, p - 1), Name) = 0) then
    begin
      FCachedIndex:= result;
      exit;
    end;
  end;
  result:= -1;
end;

function tmcStringList.GetValue_Cache(const Name: string; bInitCache: Boolean): string;
var
  i: integer;
begin
  i:= IndexOfName_Cache(Name, bInitCache);
  if i >= 0 then
    result:= Copy(Get(i), length(Name) + 2, MaxInt)
  else
    result:= '';
end;

// =================

function CardinalPointerListCompare(p1, p2: pointer): integer;
begin
  result:= compareCardinal(pCardinalPointer(p1).a, pCardinalPointer(p2).a);
end;

function tmcCardinalPointerList.AddPair(x: cardinal; y: pointer): integer;
var
  pC: pCardinalPointer;
  Index: integer;
begin
  result:= -1;
  new(pC);
  pC^.a:= x;
  pC^.p:= y;
  if fPairSorted then
  begin
    if addPointer(pC, index) then
      result:= index
    else
      dispose(pC);
  end
  else
  begin
    add(pC);
    result:= count - 1;
  end;
end;

procedure tmcCardinalPointerList.sortPair;
begin
  sort(CardinalPointerListCompare);
end;

function tmcCardinalPointerList.findPair(Value: cardinal): pointer;
var
  Index: integer;
  dummy: pCardinalPointer;
begin
  result:= nil;
  new(dummy);
  dummy.a:= Value;
  if FastSearch(CardinalPointerListCompare, dummy, index) then
    result:= pCardinalPointer(List[index])^.p;
  dispose(dummy);
end;

procedure tmcCardinalPointerList.Clear;
var
  i: integer;
begin
  for i:= 0 to pred(count) do
    dispose(pCardinalPointer(List[i]));

  SetCount(0);
  SetCapacity(0);
end;

function tmcCardinalPointerList.addPointer(p: pointer; var Index: integer): Boolean;
begin
  result:= false;
  if not FastSearch(CardinalPointerListCompare, p, index) then
  begin
    Insert(index, p);
    result:= true
  end;
end;

function tmcCardinalPointerList.FastSearch(Compare: TListSortCompare; p: pointer; var newindex: integer): Boolean;
var
  i, L, H: integer;
  c: integer;
begin
  result:= false;
  L:= 0;
  H:= count - 1;
  while (L <= H) do
  begin
    i:= (L + H) shr 1;
    c:= Compare(List[i], p);
    if c < 0 then
      L:= i + 1
    else
    begin
      H:= i - 1;
      if c = 0 then
      begin
        L:= i;
        result:= true;
        break;
      end;
    end;
  end;
  newindex:= L;
end;

procedure tmcCardinalPointerList.SetPairSorted(Value: Boolean);
begin
  if fPairSorted <> Value then
  begin
    if Value then
      sortPair;
    fPairSorted:= Value;
  end;
end;

destructor tmcCardinalPointerList.Destroy;
begin
  Clear;
end;

// =====================================

function CardinalStringListCompare(p1, p2: pointer): integer;
begin
  result:= compareCardinal(pCardinalString(p1).a, pCardinalString(p2).a);
end;

function tmcCardinalStringList.AddPair(x: cardinal; s: string): integer;
var
  pC: pCardinalString;
  Index: integer;
begin
  result:= -1;
  new(pC);
  pC^.a:= x;
  pC^.s:= s;
  if fPairSorted then
  begin
    if addPointer(pC, index) then
      result:= index
    else
      dispose(pC);
  end
  else
  begin
    add(pC);
    result:= count - 1;
  end;
end;

procedure tmcCardinalStringList.sortPair;
begin
  sort(CardinalStringListCompare);
end;

function tmcCardinalStringList.findPair(Value: cardinal): string;
var
  Index: integer;
  dummy: pCardinalString;
begin
  result:= '';
  new(dummy);
  dummy.a:= Value;
  if FastSearch(CardinalStringListCompare, dummy, index) then
    result:= pCardinalString(List[index])^.s;
  dispose(dummy);
end;

procedure tmcCardinalStringList.Clear;
var
  i: integer;
begin
  for i:= 0 to pred(count) do
    dispose(pCardinalString(List[i]));

  SetCount(0);
  SetCapacity(0);
end;

function tmcCardinalStringList.addPointer(p: pointer; var Index: integer): Boolean;
begin
  result:= false;
  if not FastSearch(CardinalStringListCompare, p, index) then
  begin
    Insert(index, p);
    result:= true
  end;
end;

function tmcCardinalStringList.FastSearch(Compare: TListSortCompare; p: pointer; var newindex: integer): Boolean;
var
  i, L, H: integer;
  c: integer;
begin
  result:= false;
  L:= 0;
  H:= count - 1;
  while (L <= H) do
  begin
    i:= (L + H) shr 1;
    c:= Compare(List[i], p);
    if c < 0 then
      L:= i + 1
    else
    begin
      H:= i - 1;
      if c = 0 then
      begin
        L:= i;
        result:= true;
        break;
      end;
    end;
  end;
  newindex:= L;
end;

procedure tmcCardinalStringList.SetPairSorted(Value: Boolean);
begin
  if fPairSorted <> Value then
  begin
    if Value then
      sortPair;
    fPairSorted:= Value;
  end;
end;

destructor tmcCardinalStringList.Destroy;
begin
  Clear;
end;

// =====================================
end.
