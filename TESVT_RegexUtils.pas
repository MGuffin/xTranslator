unit TESVT_RegexUtils;

interface

uses Windows, Messages, SysUtils, Classes, StrUtils, Controls, Forms, Graphics, math, Dialogs, StdCtrls,
  TESVT_Const, TESVT_Utils, regularexpressions, regularexpressionscore, RegularExpressionsConsts, TESVT_Ressources;

type

  tregExUtil = class
  private
    function regExExtractValueEx(RegEx: tperlRegex; const s: string): TArray<string>;
    function regExReplaceValuesEx(RegEx: tperlRegex; var s: string; sReplace: TArray<string>): boolean; overload;
    function regExReplaceValuesEx(RegEx: tperlRegex; var s: string; sNormalized: string): boolean; overload;
    function regExInitPatternEx(r: tperlRegex; pUser, pDefault: string): string;

  public
    regExNumber, regExAliasStrict, regExAlias, regExWord, regExNoWhiteChar: tperlRegex;
    constructor Create;
    destructor Destroy; override;
    function regExExtractAliasStrict(const s: string): TArray<string>;
    function regExExtractAlias(const s: string): TArray<string>; overload;
    function regExExtractNumber(const s: string): TArray<string>;
    function regExExtractWords(const s: string): TArray<string>;
    function regExExtractValues(const rEx: string; const s: string): TArray<string>; overload;
    function regExExtractValues(const id: integer; const s: string): TArray<string>; overload;
    function regExReplaceAlias(var s: string; sReplace: TArray<string>): boolean;
    function regExReplaceAliasStrict(var s: string; sReplace: TArray<string>): boolean;
    function regExReplaceNumber(var s: string; sReplace: TArray<string>): boolean;
    function regExReplaceValues(const id: integer; var s: string; sReplace: TArray<string>): boolean; overload;
    function regExReplaceValues(const pattern: string; var s: string; a: TArray<string>): boolean; overload;
    function regExNormalizeAlias(var s: string): boolean; overload;
    procedure regExNormalizeAlias(a: TArray<string>; var s: string); overload;
    function regExNormalizeNumber(var s: string): boolean;
    function noWhiteChar(const s: string): boolean;
    procedure regExInitPattern;
  end;

function ExtractArrayStrings(const input, pattern: string; var l: tstringlist): boolean;
function defineHeuristicThreshold(iWord: integer): integer;
function adjustHeuristicResult(iWord: integer; ldOut: single): single;

const
  iWordThreshold: integer = 1000;
  iLDWordSearchThresholdMax: integer = 10;
  iLDMaxBreak: integer = 25;

var
  regExUtil: tregExUtil;

implementation

function defineHeuristicThreshold(iWord: integer): integer;
begin
  case iWord of
    0: Result := 0;
    1: Result := 1;
  else
    begin
      Result := ceil(iWord / 3) + 1;
      if Result > iLDMaxBreak then
        Result := iLDMaxBreak;
    end;
  end;
end;

function adjustHeuristicResult(iWord: integer; ldOut: single): single;
var
  tmp: integer;
begin
  if ldOut = 0 then
    exit(0);
  tmp := floor(iWord / 15);
  if ldOut <= tmp then
    Result := 0.55 + (ldOut / 10.0)
  else
    Result := ldOut;
end;

function ExtractArrayStrings(const input, pattern: string; var l: tstringlist): boolean;
var
  i: integer;
  RegEx: TRegEx;
  a: TArray<string>;
begin
  Result := false;
  RegEx := TRegEx.Create(pattern);
  a := RegEx.Split(input);
  if length(a) = l.count then
  begin
    for i := 0 to length(a) - 1 do
      l[i] := a[i];
    Result := true;
  end;
end;

constructor tregExUtil.Create;
begin
  regExNumber := tperlRegex.Create;
  regExAliasStrict := tperlRegex.Create;
  regExAlias := tperlRegex.Create;
  regExWord := tperlRegex.Create;
  regExNoWhiteChar := tperlRegex.Create;

  regExAliasStrict.Options := regExNumber.Options + [preCaseLess, preUnGreedy];
  regExAlias.Options := regExNumber.Options + [preCaseLess, preUnGreedy];
  regExWord.Options := regExNumber.Options + [preSingleLine];

  regExInitPattern;
end;

destructor tregExUtil.Destroy;
begin
  regExNumber.free;
  regExAliasStrict.free;
  regExAlias.free;
  regExWord.free;
  regExNoWhiteChar.free;
end;

function tregExUtil.regExInitPatternEx(r: tperlRegex; pUser, pDefault: string): string;
begin
  Result := pUser;
  if Result = '' then
    Result := pDefault;
  try
    r.RegEx := Result;
    r.study;
  except
    Result := regExInitPatternEx(r, pDefault, pDefault);
  end;
end;

procedure tregExUtil.regExInitPattern;
begin
  sPref_rxPatternNumber := regExInitPatternEx(regExNumber, sPref_rxPatternNumber, rxPatternNumber);
  sPref_rxPatternAlias := regExInitPatternEx(regExAlias, sPref_rxPatternAlias, rxPatternAlias);
  sPref_rxPatternAliasStrict := regExInitPatternEx(regExAliasStrict, sPref_rxPatternAliasStrict, rxPatternAliasStrict);
  sPref_rxPatternWord := regExInitPatternEx(regExWord, sPref_rxPatternWord, rxPatternWord);
  regExInitPatternEx(regExNoWhiteChar, rxPatternNoWhite, rxPatternNoWhite);
end;

function tregExUtil.regExReplaceValues(const id: integer; var s: string; sReplace: TArray<string>): boolean;
begin
  case id of
    1: Result := regExReplaceNumber(s, sReplace);
    2: Result := regExReplaceAlias(s, sReplace);
    3: Result := regExReplaceAliasStrict(s, sReplace);
  else
    begin
      setlength(sReplace, 0);
      Result := false;
    end;
  end;
end;

function tregExUtil.regExReplaceAliasStrict(var s: string; sReplace: TArray<string>): boolean;
begin
  Result := regExReplaceValuesEx(regExAliasStrict, s, sReplace);
end;

function tregExUtil.regExReplaceAlias(var s: string; sReplace: TArray<string>): boolean;
begin
  Result := regExReplaceValuesEx(regExAlias, s, sReplace);
end;

function tregExUtil.regExReplaceNumber(var s: string; sReplace: TArray<string>): boolean;
begin
  Result := regExReplaceValuesEx(regExNumber, s, sReplace);
end;

function tregExUtil.regExReplaceValuesEx(RegEx: tperlRegex; var s: string; sNormalized: string): boolean;
begin
  Result := false;
  try
    RegEx.subject := s;
    while RegEx.MatchAgain do
    begin
      RegEx.Replacement := sNormalized;
      RegEx.Replace;
      Result := true;
    end;
    if Result then
      s := RegEx.subject;
  except
  end;
end;

function tregExUtil.noWhiteChar(const s: string): boolean;
begin
  regExNoWhiteChar.subject := s;
  Result := regExNoWhiteChar.match;
end;

function tregExUtil.regExReplaceValuesEx(RegEx: tperlRegex; var s: string; sReplace: TArray<string>): boolean;
var
  i, j: integer;
begin
  Result := false;
  try
    RegEx.subject := s;
    i := -1;
    j := length(sReplace);
    while RegEx.MatchAgain do
    begin
      Inc(i);
      if not(i > j - 1) then
      begin
        RegEx.Replacement := sReplace[i];
        RegEx.Replace;
        Result := true;
      end
      else
        break;
    end;
    if Result and (i = j - 1) then
      s := RegEx.subject;
  except
  end;
end;

function tregExUtil.regExExtractAliasStrict(const s: string): TArray<string>;
begin
  Result := regExExtractValueEx(regExAliasStrict, s);
end;

function tregExUtil.regExExtractAlias(const s: string): TArray<string>;
begin
  Result := regExExtractValueEx(regExAlias, s);
end;

function tregExUtil.regExExtractNumber(const s: string): TArray<string>;
begin
  Result := regExExtractValueEx(regExNumber, s);
end;

function tregExUtil.regExExtractWords(const s: string): TArray<string>;
begin
  Result := regExExtractValueEx(regExWord, s);
end;

function tregExUtil.regExExtractValues(const id: integer; const s: string): TArray<string>;
begin
  case id of
    1: Result := regExExtractNumber(s);
    2: Result := regExExtractAlias(s);
    3: Result := regExExtractAliasStrict(s);
  else
    setlength(Result, 0);
  end;
end;

function tregExUtil.regExExtractValues(const rEx: string; const s: string): TArray<string>;
var
  i: integer;
  m: tmatch;
begin
  Result := nil;
  i := 0;
  if length(s) = 0 then
    exit;
  try
    m := TRegEx.match(s, rEx);
    while m.Success do
    begin
      Inc(i);
      setlength(Result, i);
      Result[i - 1] := m.Value;
      m := m.NextMatch;
    end;
  except
  end;
end;

function tregExUtil.regExExtractValueEx(RegEx: tperlRegex; const s: string): TArray<string>;
var
  i: integer;
begin
  Result := nil;
  i := 0;
  if length(s) = 0 then
    exit;
  try
    RegEx.subject := s;
    while RegEx.MatchAgain do
    begin
      Inc(i);
      setlength(Result, i);
      Result[i - 1] := RegEx.MatchedText;
    end;
  except
  end;
end;

function tregExUtil.regExNormalizeAlias(var s: string): boolean;
var
  a: TArray<string>;
begin
  a := regExExtractAliasStrict(s);
  Result := length(a) > 0;
  if Result then
    regExReplaceValuesEx(regExAliasStrict, s, rxNormalizedAlias);
end;

procedure tregExUtil.regExNormalizeAlias(a: TArray<string>; var s: string);
begin
  if length(a) > 0 then
    regExReplaceValuesEx(regExAliasStrict, s, rxNormalizedAlias);
end;

function tregExUtil.regExNormalizeNumber(var s: string): boolean;
var
  a: TArray<string>;
begin
  a := regExExtractNumber(s);
  Result := length(a) > 0;
  if Result then
    regExReplaceValuesEx(regExNumber, s, rxNormalizedNumber);
end;

function tregExUtil.regExReplaceValues(const pattern: string; var s: string; a: TArray<string>): boolean;
var
  RegEx: tperlRegex;
  i: integer;
begin
  Result := false;
  RegEx := tperlRegex.Create;
  try
    try
      RegEx.Options := [];
      RegEx.RegEx := pattern;
      RegEx.subject := s;
      i := -1;
      while RegEx.MatchAgain do
      begin
        Inc(i);
        if i > (length(a) - 1) then
        begin
          break;
          Result := false;
        end;
        RegEx.Replacement := a[i];
        RegEx.Replace;
        Result := true;
      end;
      if Result then
        s := RegEx.subject;
    except
    end;
  finally
    RegEx.free;
  end;
end;

end.
