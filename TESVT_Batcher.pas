unit TESVT_Batcher;

interface

uses types, classes, sysutils, TESVT_Ressources, TESVT_espDefinition, TESVT_Const, TESVT_StringsStatus, Generics.Collections;

type

  rHeaderSearch = record
    header: string;
    rname: string;
    include: string;
    exclude: string;
    special: string;
  end;

  tBatcherRules = class
    id: integer;
    iversion: integer;
    title: string;
    rname: sHeaderSig;
    fName: sHeaderSig;
    header: string;
    tagID: string;
    usedList: tlist;
    fallbackBank: integer;
    bNoKw, bAnyKw, bHasComponent, bAuth, bFirstPass, bPreProcess, bFullReplace, bIncludeOR, bAutoFallback, bFallback, bDynamicFallback, bDynamicDisable,
      bContainfbTag, bIsRegex: boolean;
    regexString: string;
    ruleKeyWord: array [0 .. 1] of tstringlist;
    suffixeOpts: tstringlist;
    lEdid: array [0 .. 1] of tstringlist;
    lKwd: array [0 .. 1] of tstringlist;
    akw: array [0 .. 1] of tlist<Cardinal>;
    aArt: array [0 .. 1] of tlist<Cardinal>;
    aCompo: array [0 .. 1] of tlist<Cardinal>;
    aForm: array [0 .. 1] of tlist<Cardinal>;
    constructor init;
    Destructor Destroy; override;
    procedure UpdateHeader(h: string);
    procedure UpdateRule(r, f: sHeaderSig; ls, l1, l2, h, tag, regex: string; bKw1, bKw2, bC, bpp, bRep, bincOR, bFb: boolean; fbBank: integer);
    procedure UpdateRuleEx;
    procedure validateRule;
    function seekAppliedRule(p: pointer): boolean;
    procedure parseRule(s: string; w: integer);
    procedure enumList(l: tstringlist; w: integer);
    function matchSearch(rs: rHeaderSearch): boolean;
    procedure UpdateSuffixeOpts(ls: string; bpp: boolean);
    function isFallback: boolean;
  end;

  rTreeHeaderData = record
    BasicND: tBatcherRules;
  end;

  pTreeHeaderData = ^rTreeHeaderData;
procedure pasteOptions(ts: tstrings; s: string);
function UpdateOptions(s: string): string;

const
  defaultTagID = 'default';
  FallbackKey = '@';
  FallbackTags: array [0 .. 17] of string = ('@f', '@s', '@n', '@1', '@2', '@3', '@4', '@5', '@6', '@7', '@8', '@9', '@A', '@B', '@C', '@D', '@E', '@F');
  // f (lowercase and s = 0 then 1-F(uppercase)
  defaultComboSpecial: array [0 .. 7] of string = ('PreProcess', 'Replace', 'anyKW', 'noKW', 'hasCompo', 'includeOr', 'isRegex', 'fallback');

implementation

constructor tBatcherRules.init;
var
  i: integer;
  function createlist: tstringlist;
  begin
    result := tstringlist.create;
    result.Sorted := true;
    result.Duplicates := dupIgnore;
  end;

begin
  id := random(maxint);
  rname := header0000;
  fName := rname;
  bNoKw := false;
  bAnyKw := false;
  bAuth := false;
  bFallback := false;
  bDynamicFallback := false;
  bDynamicDisable := false;
  bHasComponent := false;
  bFirstPass := false;
  bPreProcess := false;
  title := '';
  tagID := defaultTagID;
  bFullReplace := false;
  bIncludeOR := false;
  bAutoFallback := false;
  bContainfbTag := false;
  fallbackBank := 0;
  iversion := 0;
  regexString := '';
  bIsRegex := false;
  suffixeOpts := tstringlist.create;
  for i := 0 to 1 do
  begin
    ruleKeyWord[i] := createlist;
    lEdid[i] := createlist;
    lKwd[i] := createlist;
    akw[i] := tlist<Cardinal>.create;
    aArt[i] := tlist<Cardinal>.create;
    aForm[i] := tlist<Cardinal>.create;
    aCompo[i] := tlist<Cardinal>.create;
  end;
  usedList := tlist.create;
end;

Destructor tBatcherRules.Destroy;
var
  i: integer;
begin
  for i := 0 to 1 do
  begin
    ruleKeyWord[i].Free;
    lEdid[i].Free;
    lKwd[i].Free;
    akw[i].Free;
    aArt[i].Free;
    aForm[i].Free;
    aCompo[i].Free;
  end;
  suffixeOpts.Free;
  usedList.Free;
end;

function tBatcherRules.seekAppliedRule(p: pointer): boolean;
var
  i: integer;
begin
  for i := 0 to pred(usedList.count) do
    if usedList[i] = p then
      exit(true);
  result := false;
end;

function tBatcherRules.isFallback: boolean;
begin
  result := bFallback or bDynamicFallback;
end;

procedure tBatcherRules.enumList(l: tstringlist; w: integer);
var
  i: integer;
begin
  for i := 0 to l.count - 1 do
    parseRule(l[i], w);
end;

procedure tBatcherRules.UpdateHeader(h: string);
begin
  header := h;
  UpdateRuleEx;
end;

procedure pasteOptions(ts: tstrings; s: string);
var
  l: tstringlist;
  i: integer;
  bOpenOpt: boolean;
begin
  bOpenOpt := false;
  l := tstringlist.create;
  l.Text := s;
  ts.Text := defaultprocessorSuffixeOptions[CURRENT_GAME_ID];
  for i := 0 to pred(l.count) do
  begin
    if l[i] = '[processOptStart]' then
    begin
      ts.clear;
      bOpenOpt := true;
    end
    else if l[i] = '[processOptEnd]' then
      bOpenOpt := false
    else if bOpenOpt then
      ts.Values[l.Names[i]] := l.ValueFromIndex[i];
  end;
  l.Free;
end;

function UpdateOptions(s: string): string;
var
  i: integer;
  l, ts: tstringlist;
begin
  ts := tstringlist.create;
  l := tstringlist.create;
  l.Text := s;
  ts.Text := defaultprocessorSuffixeOptions[CURRENT_GAME_ID];
  for i := 0 to pred(l.count) do
    ts.Values[l.Names[i]] := l.ValueFromIndex[i];
  result := ts.Text;
  l.Free;
  ts.Free;
end;

procedure tBatcherRules.UpdateSuffixeOpts(ls: string; bpp: boolean);
var
  ts: tstringlist;
begin
  if ls <> '' then
  begin
    ts := tstringlist.create;
    pasteOptions(ts, ls);
    suffixeOpts.Text := ts.Text;
    ts.Free;
  end;
  bPreProcess := bpp;
  UpdateRuleEx;
end;

procedure tBatcherRules.UpdateRule(r, f: sHeaderSig; ls, l1, l2, h, tag, regex: string; bKw1, bKw2, bC, bpp, bRep, bincOR, bFb: boolean; fbBank: integer);
begin
  rname := r;
  fName := f;

  suffixeOpts.Text := ls;
  ruleKeyWord[0].Text := l1;
  ruleKeyWord[1].Text := l2;
  header := h;
  tagID := trim(tag);
  bNoKw := bKw1;
  bAnyKw := bKw2;
  bHasComponent := bC;
  bPreProcess := bpp;
  bFullReplace := bRep;
  bIncludeOR := bincOR;
  fallbackBank := fbBank;
  bFallback := bFb;
  regexString := trim(regex);
  bIsRegex := regexString <> '';

  if not bFallback then
    fallbackBank := 0;
  if fallbackBank < 0 then
    fallbackBank := 0;
  if fallbackBank > $F then
    fallbackBank := $F;
  UpdateRuleEx;
end;

procedure tBatcherRules.validateRule;
var
  i: integer;
begin
  bAuth := false;
  if bNoKw then
    bAuth := true;
  if bAnyKw then
    bAuth := true;
  if bHasComponent then
    bAuth := true;
  for i := 0 to 1 do
  begin
    if lEdid[i].count > 0 then
      bAuth := true;
    if lKwd[i].count > 0 then
      bAuth := true;
    if akw[i].count > 0 then
      bAuth := true;
    if aArt[i].count > 0 then
      bAuth := true;
    if aForm[i].count > 0 then
      bAuth := true;
    if aCompo[i].count > 0 then
      bAuth := true;
  end;

  if iversion = 0 then
    bAutoFallback := (not bFallback) and (rname = headerINNR) and
      (((akw[0].count = 1) or (lKwd[0].count = 1)) or (((akw[0].count > 0) or (lKwd[0].count > 0)) and bIncludeOR));

  bContainfbTag := false;
  for i := 0 to high(FallbackTags) do
  begin
    if (pos(FallbackTags[i], header) > 0) then
      bContainfbTag := true;
  end;
  bIsRegex := trim(regexString) <> '';
end;

function enumSearch(l: tstringlist; s: string): boolean;
var
  i: integer;
begin
  for i := 0 to l.count - 1 do
    if pos(s, ansilowercase(l[i])) > 0 then
      exit(true);
  result := false;
end;

function tBatcherRules.matchSearch(rs: rHeaderSearch): boolean;
var
  SearchId: integer;
begin
  if (length(rs.include) = 12) and (pos('!id:', rs.include) = 1) then
  begin
    SearchId := strtointdef('$' + copy(rs.include, 5, 8), 0);
    exit(id = SearchId);
  end;

  result := (rs.rname = '') or (rs.rname = ansilowercase(string(rname)));
  result := result and ((rs.header = '') or (pos(rs.header, header) > 0));

  result := result and ((rs.exclude = '') or enumSearch(ruleKeyWord[1], rs.exclude));
  result := result and ((rs.include = '') or enumSearch(ruleKeyWord[0], rs.include));

  if rs.special <> '' then
  begin
    if rs.special = 'preprocess' then
      result := result and bPreProcess
    else if rs.special = 'replace' then
      result := result and bFullReplace
    else if rs.special = 'anykw' then
      result := result and bAnyKw
    else if rs.special = 'nokw' then
      result := result and bNoKw
    else if rs.special = 'hascompo' then
      result := result and bHasComponent
    else if rs.special = 'includeor' then
      result := result and bIncludeOR
    else if rs.special = 'isregex' then
      result := result and bIsRegex
    else if rs.special = 'fallback' then
      result := result and bFallback
    else if pos('fallback', rs.special) > 0 then
      result := result and bFallback and (fallbackBank = strtointdef('$' + copy(rs.special, 9, 1), 0))
    else
      result := result and (rs.special = ansilowercase('#' + tagID));
  end;
end;

procedure tBatcherRules.UpdateRuleEx;
var
  w: integer;
begin
  if trim(tagID) = '' then
    tagID := defaultTagID;
  title := format('%s:%s [#%s]', [sHeaderString(rname), sHeaderString(fName), tagID]);
  if bPreProcess then
    title := title + '[PREProc]';
  if bFallback then
    title := title + format('[fb:%x]', [fallbackBank]);
  if bFullReplace then
    title := title + '+[replace]';

  // tmp firstpass (need adjustment)
  bFirstPass := (rname = 'CMPO') or (rname = 'INNR');

  for w := 0 to 1 do
  begin
    akw[w].clear;
    aArt[w].clear;
    aForm[w].clear;
    aCompo[w].clear;
    lEdid[w].clear;
    lKwd[w].clear;
  end;
  enumList(ruleKeyWord[0], 0);
  if bIncludeOR then
    title := title + '+[OR]';
  enumList(ruleKeyWord[1], 1);
  if bNoKw then
    title := title + '+[noKW]';
  if bAnyKw then
    title := title + '+[anyKW]';
  if bHasComponent then
    title := title + '+[HasCompo]';
  validateRule;
end;

procedure tBatcherRules.parseRule(s: string; w: integer); // w is 0 or 1 - include /exclude
var
  l: tstringlist;
  pre1, pre2: string;
const
  tag: array [0 .. 1] of string = ('+', '-');
begin
  pre1 := '';
  pre2 := '';
  l := tstringlist.create;
  l.Delimiter := '|';
  l.QuoteChar := '"';
  l.DelimitedText := s;
  if (l[0] = 'kwd_') or (l[0] = 'kwd+') then
  begin
    akw[w].Add(strtointdef('$' + l[2], 0));
    pre1 := tag[w];
    pre2 := 'k_'
  end
  else if l[0] = 'art_' then
  begin
    aArt[w].Add(strtointdef('$' + l[2], 0));
    pre1 := tag[w];
    pre2 := 'a_'
  end
  else if (l[0] = 'form') or (l[0] = 'for+') then
  begin
    aForm[w].Add(strtointdef('$' + l[2], 0));
    pre1 := tag[w];
    pre2 := 'f_'
  end
  else if l[0] = 'edid' then
  begin
    lEdid[w].Add(ansilowercase(l[1]));
    pre1 := tag[w];
    pre2 := 'e_'
  end
  else if l[0] = 'ekwd' then
  begin
    lKwd[w].Add(ansilowercase(l[1]));
    pre1 := tag[w];
    pre2 := 'ek_'
  end
  else if l[0] = 'c___' then
  begin
    aCompo[w].Add(strtointdef('$' + l[2], 0));
    pre1 := tag[w];
    pre2 := ''
  end;
  if not(bNoKw or bAnyKw) then
    title := title + format('%s[%s%s]', [pre1, pre2, copy(l[1], 1, 5)]);
  l.Free;
end;

end.
