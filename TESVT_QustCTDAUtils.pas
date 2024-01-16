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
unit TESVT_QustCTDAUtils;

interface

uses SysUtils, TESVT_espDefinition, TESVT_typedef, TESVT_Const, TESVT_Ressources, Classes, math;

function getQuestString(QustRefRec: trecord; QustID: cardinal; l: tstringlist): string;
function getStringFromRecRef(Rec: trecord; RecID: cardinal; bSource: boolean; h: sHeaderSig; l: tstringlist; var bNeedMaster: boolean): string;
procedure CTDADecoderOutput(espLoader: tespLoader; l: tstrings; r: trecord);

implementation

function getQuestString(QustRefRec: trecord; QustID: cardinal; l: tstringlist): string;
var
  mName, qName: string;
  idMaster: byte;
  sk: tSkyStr;
begin
  if Assigned(QustRefRec) then
  begin
    sk := QustRefRec.getSkfromDataRef(headerFULL);
    if Assigned(sk) then
      qName := format('(%s) ', [sk.s])
    else
      qName := '';
    result := format('QUST: %s %s[%.8x]', [QustRefRec.EdidNameEx, qName, QustID]);
  end
  else
  begin
    idMaster := getMasterIndex(QustID);
    if (QustID > 0) and (InRange(idMaster, 0, (l.count - 2))) then
    begin
      mName := formatRes('Qust_NeedMaster%s', [l.Strings[idMaster]])
    end
    else
      mName := getRes('Qust_ErrorInRef');
    result := format('QUST: %s [%.8x]', [mName, QustID]);
  end;
end;

function getStringFromRecRef(Rec: trecord; RecID: cardinal; bSource: boolean; h: sHeaderSig; l: tstringlist; var bNeedMaster: boolean): string;
var
  mName: string;
  idMaster: byte;
  sk: tSkyStr;
begin
  if Assigned(Rec) then
  begin
    sk := Rec.getSkfromDataRef(h);
    if Assigned(sk) then
    begin
      if bSource then
        result := sk.s
      else
        result := sk.strans
    end
    else
      result := Rec.EdidNameEx;
  end
  else
  begin
    idMaster := getMasterIndex(RecID);
    if (RecID > 0) and (InRange(idMaster, 0, (l.count - 2))) then
    begin
      mName := l.Strings[idMaster];
      bNeedMaster := true;
    end
    else
      mName := getRes('Error');
    result := format('%.8x@%s', [RecID, mName]);
  end;
end;


// == CTDA output

function findRecEdidForCTDA(espLoader: tespLoader; formID: cardinal): string;
var
  r: trecord;
  sk: tSkyStr;
begin
  if formID = $14 then
    exit('PlayerRef');

  r := espLoader.getFastRecord(formID);
  if Assigned(r) then
  begin
    sk := r.getSkfromDataRef(headerFULL);
    if Assigned(sk) then
      result := format('[%.4s:%s][%s]', [string(r.header.name), r.EdidNameEx, sk.s])
    else
      result := format('[%.4s:%s]', [string(r.header.name), r.EdidNameEx]);
  end

  else
    result := format('%.8x', [formID]);
end;

procedure CTDADecoderOutput(espLoader: tespLoader; l: tstrings; r: trecord);
var
  i: integer;
  f: tField;
  ctda: rCtdaData;
  count1, count2: integer;
  tagBool: string;

  function op(id: byte): string;
  begin
    case id of
      1: result := '!=';
      2: result := '>';
      3: result := '>=';
      4: result := '<';
      5: result := '<=';
    else
      result := '=';
    end;
  end;

  function runOnId(id: cardinal): string;
  begin
    case id of
      1: result := 'Target';
      2: result := 'Reference';
      3: result := 'CombatTarget';
      4: result := 'LinkedRef';
      5: result := 'QuestAlias';
      6: result := 'Package';
      7: result := 'Event';
      8: result := 'Unknown8';
      9: result := 'CommandTarget';
      10: result := 'CameraRef';
      11: result := 'MyKiller';
      12: result := 'Unknown12';
      13: result := 'Unknown13';
      14: result := 'PlayerShip';
      15: result := 'Target List';
      16: result := 'Instance Owner';
    else
      result := 'Subject';
    end;
  end;

  function gender(id: cardinal): string;
  begin
    if id = 0 then
      result := 'Male'
    else
    result:= 'Female';
  end;

  function getObjRef(ref: cardinal): string;
  var
    ref1: cardinal;
  begin
    ref1 := espLoader.getFastRefr(ref);
    if ref1 > 0 then
      result := findRecEdidForCTDA(espLoader, ref1)
    else
      result := findRecEdidForCTDA(espLoader, ref);
  end;

  function getAliasLabel(id: cardinal): string;
  var
    rQust: trecord;
  begin
    result := '';
    rQust := espLoader.getQustFromInfo(r);
    if Assigned(rQust) then
      result := rQust.GetAliasName(id);
    if result = '' then
      result := inttostr(id);
  end;

  function getStageLabel(qID, id: cardinal): string;
  var
    rQust: trecord;
  begin
    result := '';
    rQust := espLoader.getFastRecord(qID, headerQUST);
    // rQust := espLoader.getQustFromInfo(r);
    if Assigned(rQust) then
      result := rQust.GetStageNote(id);
    if result = '' then
      result := inttostr(id);
  end;

  function getFunc(runOn, ref, p1, p2: cardinal; func: word): string;
  var
    i: integer;
    fName, subject, fparam: string;
    fparams: TStringArray;
  begin
    fName := '';
    fparam := '';
    for i := 0 to lCtdaFunc.count - 1 do
    begin
      if strtointdef(lCtdaFunc.Names[i], 0) = func then
      begin
        fparams := split(lCtdaFunc.ValueFromIndex[i], ':', 2);
        fName := fparams[0];
        fparam := fparams[1];
        break;
      end;
    end;
    if fName = '' then
      fName := inttostr(func);
    // runOn
    if ref = 0 then
      subject := runOnId(runOn)
    else
      subject := getObjRef(ref);
    // fparams

    if fparam <> '' then
    begin
      fparam := stringreplace(fparam, '{1}', getObjRef(p1), []);
      fparam := stringreplace(fparam, '{2}', getObjRef(p2), []);
      fparam := stringreplace(fparam, '{A}', '[' + getAliasLabel(p1) + ']', []);
      fparam := stringreplace(fparam, '{S}', '[' + getStageLabel(p1, p2) + ']', []);
      fparam := stringreplace(fparam, '{V}', inttostr(p1), []); // actorValue enum for Skyrim
      fparam := stringreplace(fparam, '{I}', inttostr(p1), []);
      fparam := stringreplace(fparam, '{W}', ':StringVar', []);
      fparam := stringreplace(fparam, '{E}', ':EnumVar', []);
      fparam := stringreplace(fparam, '{X}', gender(p1), []); // sex
    end;
    // endresult
    if fparam <> '' then
      result := format('%s.%s(%s)', [subject, fName, fparam])
    else
      result := format('%s.%s', [subject, fName]);
  end;

const
  bOr: array [0 .. 1] of string = (' and', ' or');

begin
  count1 := 0;
  count2 := 0;
  if Assigned(r) and (r.header.name = headerINFO) then
  begin
    // count ctda
    for i := 0 to pred(r.fList.count) do
    begin
      f := r.fList[i];
      if (f.header.name = 'CTDA') then
        inc(count1);
    end;
    // analyse ctda
    for i := 0 to pred(r.fList.count) do
    begin
      f := r.fList[i];
      if (f.header.name = 'CTDA') then
      begin
        inc(count2);
        ctda := r.CTDADecoderEx(f);
        if count1 = count2 then
          tagBool := ''
        else
          tagBool := bOr[ord(ctda.boolOr)];
        l.AddObject(format('%s%s%.0f%s' + sLineBreak, [getFunc(ctda.runOn, ctda.reference, ctda.param1, ctda.param2, ctda.func), op(ctda.opType), ctda.value, tagBool]), l);
      end;
    end;
  end;
end;

end.
