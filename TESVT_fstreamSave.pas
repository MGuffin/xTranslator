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

unit TESVT_fstreamSave;

interface

uses Windows, classes, SysUtils, math, TESVT_Utils, TESVT_Const;

type
  tWriteStringCodepage = function(s: string; fstream: tmemorystream; stringheader: boolean; bzero: boolean = true): integer;
  tWriteBufferCodepage = function(s: string; var b: tbytes; iMaxSize: integer; bzero: boolean = true): integer;

  rCodepage = record
    f: tWriteStringCodepage;
    fb: tWriteBufferCodepage;
    c, verif: word;
    cFallback: word;
    s, sFallback: string;
    isUtf8: boolean;
  end;

Const
  supportedCodepage: array [0 .. 9] of string = ('utf8', '1250', '1251', '1252', '1253', '1254', '1256', '932', '936', '950');
  // must be lowercase, utf8 first = fallback

function getcodepage(f: string; t: tstringlist; forceCP: string; cpByName: string): rCodepage;
// tstream
function WriteStringUtf8(s: string; fstream: tmemorystream; stringheader: boolean; bzero: boolean = true): integer;
function WriteString1250(s: string; fstream: tmemorystream; stringheader: boolean; bzero: boolean = true): integer;
function WriteString1251(s: string; fstream: tmemorystream; stringheader: boolean; bzero: boolean = true): integer;
function WriteString1252(s: string; fstream: tmemorystream; stringheader: boolean; bzero: boolean = true): integer;
function WriteString1253(s: string; fstream: tmemorystream; stringheader: boolean; bzero: boolean = true): integer;
function WriteString1254(s: string; fstream: tmemorystream; stringheader: boolean; bzero: boolean = true): integer;
function WriteString1256(s: string; fstream: tmemorystream; stringheader: boolean; bzero: boolean = true): integer;
function WriteString932(s: string; fstream: tmemorystream; stringheader: boolean; bzero: boolean = true): integer;
function WriteString936(s: string; fstream: tmemorystream; stringheader: boolean; bzero: boolean = true): integer;
function WriteString950(s: string; fstream: tmemorystream; stringheader: boolean; bzero: boolean = true): integer;
function WriteStringForceDeloc(s: string; fstream: tmemorystream; stringheader: boolean; bzero: boolean = true): integer;
// buffer
function WriteBufferutf8(s: string; var b: tbytes; iMaxSize: integer; bzero: boolean = true): integer;
function WriteBuffer1250(s: string; var b: tbytes; iMaxSize: integer; bzero: boolean = true): integer;
function WriteBuffer1251(s: string; var b: tbytes; iMaxSize: integer; bzero: boolean = true): integer;
function WriteBuffer1252(s: string; var b: tbytes; iMaxSize: integer; bzero: boolean = true): integer;
function WriteBuffer1253(s: string; var b: tbytes; iMaxSize: integer; bzero: boolean = true): integer;
function WriteBuffer1254(s: string; var b: tbytes; iMaxSize: integer; bzero: boolean = true): integer;
function WriteBuffer1256(s: string; var b: tbytes; iMaxSize: integer; bzero: boolean = true): integer;
function WriteBuffer932(s: string; var b: tbytes; iMaxSize: integer; bzero: boolean = true): integer;
function WriteBuffer936(s: string; var b: tbytes; iMaxSize: integer; bzero: boolean = true): integer;
function WriteBuffer950(s: string; var b: tbytes; iMaxSize: integer; bzero: boolean = true): integer;

function WriteBufferForceDeloc(s: string; var b: tbytes; iMaxSize: integer; bzero: boolean = true): integer;

function rawStringtoString(rbs: rawbyteString; codepage: rCodepage; var bFallBack: boolean): string;
function rawStringtoStringLockedUTF8(rbs: rawbyteString; codepage: rCodepage): string;
function WriteBufferVMADutf8(s: string; var b: tbytes; startPos: cardinal): word;
procedure fallbackFbk(nbFallback: integer; codepage: rCodepage);
function limitStringSize(s: string; encoding: word; maxSize: integer): string;

implementation

procedure fallbackFbk(nbFallback: integer; codepage: rCodepage);
begin
  if nbFallback > 0 then
    dofeedback(format('%d fallBacks detected [%s]->[%s] ', [nbFallback, codepage.s, codepage.sFallback]));
end;

function rawStringtoStringUTF8(rbs: rawbyteString; codepage: rCodepage; var bFallBack: boolean): string;
var
  tb: tbytes;
begin
  tb:= bytesof(rbs);
  if bReadDoFUtf8Fallback then
  begin

    try
      Result:= tEncoding.utf8.GetString(tb);
    except
      Result:= '';
    end;
  end
  else
    Result:= '';

  if (Result = '') and (Length(tb) > 0) then
  begin
    bFallBack:= bReadDoFUtf8Fallback;
    if (codepage.cFallback = 0) then
      Result:= UTF8toString(rbs)
    else
    begin
      SetCodePage(rbs, codepage.cFallback, False);
      Result:= string(rbs);
    end;
  end;

end;

function rawStringtoString(rbs: rawbyteString; codepage: rCodepage; var bFallBack: boolean): string;
begin
  bFallBack:= False;
  if codepage.isUtf8 then
    Result:= rawStringtoStringUTF8(rbs, codepage, bFallBack)
  else
  begin
    // forceDeloc
    if codepage.c = $FFFF then
    begin
      Result:= string(rbs);
    end
    // normal
    else
    begin
      SetCodePage(rbs, codepage.c, False);
      Result:= string(rbs);
    end;
  end;
end;

function rawStringtoStringLockedUTF8(rbs: rawbyteString; codepage: rCodepage): string;
begin
  Result:= UTF8toString(rbs);
end;

function getcodepage(f: string; t: tstringlist; forceCP: string; cpByName: string): rCodepage;
var
  i: integer;
  codes: string;
  codepage: cardinal;
  a: sArray;
  bForced: boolean;
begin
  Result.cFallback:= 0;
  bForced:= False;
  codepage:= 65001; // default fallback: utf8
  // User overrides-------------->
  if cpByName <> '' then
  begin
    if cpByName = 'utf8' then
      codepage:= 65001
    else
      codepage:= strtointdef(cpByName, 65001);
    bForced:= true;
  end
  else if forceCP <> '' then
  begin
    if cpByName = 'utf8' then
      codepage:= 65001
    else
      codepage:= strtointdef(forceCP, 65001);
    bForced:= true;
  end;
  // <-------------User overrides

  f:= ansilowercase(f);
  for i:= 0 to t.count - 1 do
  begin
    if pos('_' + ansilowercase(t.Names[i]), f) > 0 then
    begin
      codes:= ansilowercase(trim(t.ValueFromIndex[i]));

      explode(codes, a, ',');
      if not bForced then
      begin
        if a[0] = 'utf8' then
          codepage:= 65001
        else if bForceEsmDeloc then
          codepage:= $FFFF
        else
          codepage:= strtointdef(a[0], 65001);
      end;

      if Length(a) > 1 then
        Result.cFallback:= strtointdef(a[1], 0);
      break;
    end;
  end;

  // assign exportProc
  case codepage of
    932:
      begin
        Result.c:= 932;
        Result.verif:= 932;
        Result.f:= WriteString932;
        Result.fb:= WriteBuffer932;
        Result.s:= '932'
      end;
    936:
      begin
        Result.c:= 936;
        Result.verif:= 936;
        Result.f:= WriteString936;
        Result.fb:= WriteBuffer936;
        Result.s:= '936'
      end;
    950:
      begin
        Result.c:= 950;
        Result.verif:= 950;
        Result.f:= WriteString950;
        Result.fb:= WriteBuffer950;
        Result.s:= '950'
      end;
    1250:
      begin
        Result.c:= 1250;
        Result.verif:= 1250;
        Result.f:= WriteString1250;
        Result.fb:= WriteBuffer1250;
        Result.s:= '1250'
      end;
    1251:
      begin
        Result.c:= 1251;
        Result.verif:= 1251;
        Result.f:= WriteString1251;
        Result.fb:= WriteBuffer1251;
        Result.s:= '1251'
      end;
    1252:
      begin
        Result.c:= 1252;
        Result.verif:= 1252;
        Result.f:= WriteString1252;
        Result.fb:= WriteBuffer1252;
        Result.s:= '1252'
      end;
    1253:
      begin
        Result.c:= 1253;
        Result.verif:= 1253;
        Result.f:= WriteString1253;
        Result.fb:= WriteBuffer1253;
        Result.s:= '1253'
      end;
    1254:
      begin
        Result.c:= 1254;
        Result.verif:= 1254;
        Result.f:= WriteString1254;
        Result.fb:= WriteBuffer1254;
        Result.s:= '1254'
      end;
    1256:
      begin
        Result.c:= 1256;
        Result.verif:= 1256;
        Result.f:= WriteString1256;
        Result.fb:= WriteBuffer1256;
        Result.s:= '1256'
      end;
    65001:
      begin
        Result.c:= 0;
        Result.verif:= 65001;
        Result.f:= WriteStringUtf8;
        Result.fb:= WriteBufferutf8;
        Result.s:= 'Utf8'
      end;
    $FFFF:
      begin
        Result.c:= $FFFF;
        Result.verif:= $FFFF;
        Result.f:= WriteStringForceDeloc;
        Result.fb:= WriteBufferForceDeloc;
        Result.s:= 'ForceDeloc'
      end;
  else
    // fallback in UTF8
    begin
      Result.c:= 0;
      Result.verif:= 65001;
      Result.f:= WriteStringUtf8;
      Result.fb:= WriteBufferutf8;
      Result.s:= 'Utf8'
    end;
  end;
  Result.isUtf8:= Result.c = 0;
  if Result.cFallback = 0 then
    Result.cFallback:= Result.c;

  // if result is still 0 then fallback is utf8
  if Result.cFallback = 0 then
    Result.sFallback:= 'Utf8'
  else
    Result.sFallback:= inttostr(Result.cFallback);
end;


function limitStringSize(s: string; encoding: word; maxSize: integer): string;
var
  i: integer;
  encodeSize: integer;
  cExceed: integer;

begin
  maxSize:= maxSize - 1;
    //encodeSize:= tEncoding.GetEncoding(encoding).GetByteCount(s);
    encodeSize:= getbyteCount(Encoding, s);
    if encodeSize < maxSize then
      Exit(s);

    cExceed:= round((encodeSize - maxSize) / (encodeSize / Length(s)));

    for i:= (Length(s) - cExceed) downto 1 do
    begin
      //if tEncoding.GetEncoding(encoding).GetByteCount(copy(s, 1, i)) <= maxSize then
         if getbyteCount(encoding, copy(s, 1, i)) <= maxSize then
        Exit(copy(s, 1, i));
    end;
    Result:= ' ';


end;

function WriteStringUtf8(s: string; fstream: tmemorystream; stringheader: boolean; bzero: boolean = true): integer;
var
  tmpRaw: rawbyteString;
  sizeRaw: integer;
begin
  s:= limitStringSize(s, 65001, MAXSIZESTRING_GLOBALCAP);
  if bzero then
    tmpRaw:= utf8encode(s) + #0
  else
    tmpRaw:= utf8encode(s);
  sizeRaw:= min(MAXSIZESTRING_GLOBALCAP, Length(tmpRaw));
  Result:= sizeRaw;
  if stringheader then
  begin
    fstream.Write(Result, SizeOf(Result));
    Result:= Result + 4;
  end;
  fstream.Write(tmpRaw[1], sizeRaw);
end;

function WriteString932(s: string; fstream: tmemorystream; stringheader: boolean; bzero: boolean = true): integer;
type
  tmpStringtype = type AnsiString(932);
var
  tmpRaw: tmpStringtype;
  sizeRaw: integer;
begin
  s:= limitStringSize(s, 932, MAXSIZESTRING_GLOBALCAP);
  if bzero then
    tmpRaw:= tmpStringtype(s) + #0
  else
    tmpRaw:= tmpStringtype(s);
  sizeRaw:= min(MAXSIZESTRING_GLOBALCAP, Length(tmpRaw));
  Result:= sizeRaw;
  if stringheader then
  begin
    fstream.Write(Result, SizeOf(Result));
    Result:= Result + 4;
  end;
  fstream.Write(tmpRaw[1], sizeRaw);
end;

function WriteString950(s: string; fstream: tmemorystream; stringheader: boolean; bzero: boolean = true): integer;
type
  tmpStringtype = type AnsiString(950);
var
  tmpRaw: tmpStringtype;
  sizeRaw: integer;
begin
  s:= limitStringSize(s, 950, MAXSIZESTRING_GLOBALCAP);
  if bzero then
    tmpRaw:= tmpStringtype(s) + #0
  else
    tmpRaw:= tmpStringtype(s);
  sizeRaw:= min(MAXSIZESTRING_GLOBALCAP, Length(tmpRaw));
  Result:= sizeRaw;
  if stringheader then
  begin
    fstream.Write(Result, SizeOf(Result));
    Result:= Result + 4;
  end;
  fstream.Write(tmpRaw[1], sizeRaw);
end;

function WriteString936(s: string; fstream: tmemorystream; stringheader: boolean; bzero: boolean = true): integer;
type
  tmpStringtype = type AnsiString(936);
var
  tmpRaw: tmpStringtype;
  sizeRaw: integer;
begin
  s:= limitStringSize(s, 936, MAXSIZESTRING_GLOBALCAP);
  if bzero then
    tmpRaw:= tmpStringtype(s) + #0
  else
    tmpRaw:= tmpStringtype(s);
  sizeRaw:= min(MAXSIZESTRING_GLOBALCAP, Length(tmpRaw));
  Result:= sizeRaw;
  if stringheader then
  begin
    fstream.Write(Result, SizeOf(Result));
    Result:= Result + 4;
  end;
  fstream.Write(tmpRaw[1], sizeRaw);
end;

function WriteString1250(s: string; fstream: tmemorystream; stringheader: boolean; bzero: boolean = true): integer;
type
  tmpStringtype = type AnsiString(1250);
var
  tmpRaw: tmpStringtype;
  sizeRaw: integer;
begin
  s:= limitStringSize(s, 1250, MAXSIZESTRING_GLOBALCAP);
  if bzero then
    tmpRaw:= tmpStringtype(s) + #0
  else
    tmpRaw:= tmpStringtype(s);
  sizeRaw:= min(MAXSIZESTRING_GLOBALCAP, Length(tmpRaw));
  Result:= sizeRaw;
  if stringheader then
  begin
    fstream.Write(Result, SizeOf(Result));
    Result:= Result + 4;
  end;
  fstream.Write(tmpRaw[1], sizeRaw);
end;

function WriteString1251(s: string; fstream: tmemorystream; stringheader: boolean; bzero: boolean = true): integer;
type
  tmpStringtype = type AnsiString(1251);
var
  tmpRaw: tmpStringtype;
  sizeRaw: integer;
begin
  s:= limitStringSize(s, 1251, MAXSIZESTRING_GLOBALCAP);
  if bzero then
    tmpRaw:= tmpStringtype(s) + #0
  else
    tmpRaw:= tmpStringtype(s);
  sizeRaw:= min(MAXSIZESTRING_GLOBALCAP, Length(tmpRaw));
  Result:= sizeRaw;
  if stringheader then
  begin
    fstream.Write(Result, SizeOf(Result));
    Result:= Result + 4;
  end;
  fstream.Write(tmpRaw[1], sizeRaw);
end;

function WriteString1252(s: string; fstream: tmemorystream; stringheader: boolean; bzero: boolean = true): integer;
type
  tmpStringtype = type AnsiString(1252);
var
  tmpRaw: tmpStringtype;
  sizeRaw: integer;
begin
  s:= limitStringSize(s, 1252, MAXSIZESTRING_GLOBALCAP);
  if bzero then
    tmpRaw:= tmpStringtype(s) + #0
  else
    tmpRaw:= tmpStringtype(s);
  sizeRaw:= min(MAXSIZESTRING_GLOBALCAP, Length(tmpRaw));
  Result:= sizeRaw;
  if stringheader then
  begin
    fstream.Write(Result, SizeOf(Result));
    Result:= Result + 4;
  end;
  fstream.Write(tmpRaw[1], sizeRaw);
end;

function WriteString1253(s: string; fstream: tmemorystream; stringheader: boolean; bzero: boolean = true): integer;
type
  tmpStringtype = type AnsiString(1253);
var
  tmpRaw: tmpStringtype;
  sizeRaw: integer;
begin
  s:= limitStringSize(s, 1253, MAXSIZESTRING_GLOBALCAP);
  if bzero then
    tmpRaw:= tmpStringtype(s) + #0
  else
    tmpRaw:= tmpStringtype(s);
  sizeRaw:= min(MAXSIZESTRING_GLOBALCAP, Length(tmpRaw));
  Result:= sizeRaw;
  if stringheader then
  begin
    fstream.Write(Result, SizeOf(Result));
    Result:= Result + 4;
  end;
  fstream.Write(tmpRaw[1], sizeRaw);
end;

function WriteString1254(s: string; fstream: tmemorystream; stringheader: boolean; bzero: boolean = true): integer;
type
  tmpStringtype = type AnsiString(1254);
var
  tmpRaw: tmpStringtype;
  sizeRaw: integer;
begin
  s:= limitStringSize(s, 1254, MAXSIZESTRING_GLOBALCAP);
  if bzero then
    tmpRaw:= tmpStringtype(s) + #0
  else
    tmpRaw:= tmpStringtype(s);
  sizeRaw:= min(MAXSIZESTRING_GLOBALCAP, Length(tmpRaw));
  Result:= sizeRaw;
  if stringheader then
  begin
    fstream.Write(Result, SizeOf(Result));
    Result:= Result + 4;
  end;
  fstream.Write(tmpRaw[1], sizeRaw);
end;

function WriteString1256(s: string; fstream: tmemorystream; stringheader: boolean; bzero: boolean = true): integer;
type
  tmpStringtype = type AnsiString(1256);
var
  tmpRaw: tmpStringtype;
  sizeRaw: integer;
begin
  s:= limitStringSize(s, 1256, MAXSIZESTRING_GLOBALCAP);
  if bzero then
    tmpRaw:= tmpStringtype(s) + #0
  else
    tmpRaw:= tmpStringtype(s);
  sizeRaw:= min(MAXSIZESTRING_GLOBALCAP, Length(tmpRaw));
  Result:= sizeRaw;
  if stringheader then
  begin
    fstream.Write(Result, SizeOf(Result));
    Result:= Result + 4;
  end;
  fstream.Write(tmpRaw[1], sizeRaw);
end;

function WriteStringForceDeloc(s: string; fstream: tmemorystream; stringheader: boolean; bzero: boolean = true): integer;
begin
  Result:= 4;
end;



// ---------writeBuffer

function WriteBufferutf8(s: string; var b: tbytes; iMaxSize: integer; bzero: boolean = true): integer;
var
  tmpRaw: rawbyteString;
begin
  s:= limitStringSize(s, 65001, iMaxSize);
  if bzero then
    tmpRaw:= utf8encode(s) + #0
  else
    tmpRaw:= utf8encode(s);
  SetLength(b, min(iMaxSize, Length(tmpRaw)));
  Move(tmpRaw[1], b[0], Length(b));
  Result:= Length(b);
end;

function WriteBuffer1250(s: string; var b: tbytes; iMaxSize: integer; bzero: boolean = true): integer;
type
  tmpStringtype = type AnsiString(1250);
var
  tmpRaw: tmpStringtype;
begin
  s:= limitStringSize(s, 1250, iMaxSize);
  if bzero then
    tmpRaw:= tmpStringtype(s) + #0
  else
    tmpRaw:= tmpStringtype(s);
  SetLength(b, min(iMaxSize, Length(tmpRaw)));
  Move(tmpRaw[1], b[0], Length(b));
  Result:= Length(b);
end;

function WriteBuffer1251(s: string; var b: tbytes; iMaxSize: integer; bzero: boolean = true): integer;
type
  tmpStringtype = type AnsiString(1251);
var
  tmpRaw: tmpStringtype;
begin
  s:= limitStringSize(s, 1251, iMaxSize);
  if bzero then
    tmpRaw:= tmpStringtype(s) + #0
  else
    tmpRaw:= tmpStringtype(s);
  SetLength(b, min(iMaxSize, Length(tmpRaw)));
  Move(tmpRaw[1], b[0], Length(b));
  Result:= Length(b);
end;

function WriteBuffer1252(s: string; var b: tbytes; iMaxSize: integer; bzero: boolean = true): integer;
type
  tmpStringtype = type AnsiString(1252);
var
  tmpRaw: tmpStringtype;
begin
  s:= limitStringSize(s, 1252, iMaxSize);
  if bzero then
    tmpRaw:= tmpStringtype(s) + #0
  else
    tmpRaw:= tmpStringtype(s);
  SetLength(b, min(iMaxSize, Length(tmpRaw)));
  Move(tmpRaw[1], b[0], Length(b));
  Result:= Length(b);
end;

function WriteBuffer1253(s: string; var b: tbytes; iMaxSize: integer; bzero: boolean = true): integer;
type
  tmpStringtype = type AnsiString(1253);
var
  tmpRaw: tmpStringtype;
begin
  s:= limitStringSize(s, 1253, iMaxSize);
  if bzero then
    tmpRaw:= tmpStringtype(s) + #0
  else
    tmpRaw:= tmpStringtype(s);
  SetLength(b, min(iMaxSize, Length(tmpRaw)));
  Move(tmpRaw[1], b[0], Length(b));
  Result:= Length(b);
end;

function WriteBuffer1254(s: string; var b: tbytes; iMaxSize: integer; bzero: boolean = true): integer;
type
  tmpStringtype = type AnsiString(1254);
var
  tmpRaw: tmpStringtype;
begin
  s:= limitStringSize(s, 1254, iMaxSize);
  if bzero then
    tmpRaw:= tmpStringtype(s) + #0
  else
    tmpRaw:= tmpStringtype(s);
  SetLength(b, min(iMaxSize, Length(tmpRaw)));
  Move(tmpRaw[1], b[0], Length(b));
  Result:= Length(b);
end;

function WriteBuffer1256(s: string; var b: tbytes; iMaxSize: integer; bzero: boolean = true): integer;
type
  tmpStringtype = type AnsiString(1256);
var
  tmpRaw: tmpStringtype;
begin
  s:= limitStringSize(s, 1256, iMaxSize);
  if bzero then
    tmpRaw:= tmpStringtype(s) + #0
  else
    tmpRaw:= tmpStringtype(s);
  SetLength(b, min(iMaxSize, Length(tmpRaw)));
  Move(tmpRaw[1], b[0], Length(b));
  Result:= Length(b);
end;

function WriteBuffer932(s: string; var b: tbytes; iMaxSize: integer; bzero: boolean = true): integer;
type
  tmpStringtype = type AnsiString(932);
var
  tmpRaw: tmpStringtype;
begin
  s:= limitStringSize(s, 932, iMaxSize);
  if bzero then
    tmpRaw:= tmpStringtype(s) + #0
  else
    tmpRaw:= tmpStringtype(s);
  SetLength(b, min(iMaxSize, Length(tmpRaw)));
  Move(tmpRaw[1], b[0], Length(b));
  Result:= Length(b);
end;

function WriteBuffer936(s: string; var b: tbytes; iMaxSize: integer; bzero: boolean = true): integer;
type
  tmpStringtype = type AnsiString(936);
var
  tmpRaw: tmpStringtype;
begin
  s:= limitStringSize(s, 936, iMaxSize);
  if bzero then
    tmpRaw:= tmpStringtype(s) + #0
  else
    tmpRaw:= tmpStringtype(s);
  SetLength(b, min(iMaxSize, Length(tmpRaw)));
  Move(tmpRaw[1], b[0], Length(b));
  Result:= Length(b);
end;

function WriteBuffer950(s: string; var b: tbytes; iMaxSize: integer; bzero: boolean = true): integer;
type
  tmpStringtype = type AnsiString(950);
var
  tmpRaw: tmpStringtype;
begin
  s:= limitStringSize(s, 950, iMaxSize);
  if bzero then
    tmpRaw:= tmpStringtype(s) + #0
  else
    tmpRaw:= tmpStringtype(s);
  SetLength(b, min(iMaxSize, Length(tmpRaw)));
  Move(tmpRaw[1], b[0], Length(b));
  Result:= Length(b);
end;

function WriteBufferForceDeloc(s: string; var b: tbytes; iMaxSize: integer; bzero: boolean = true): integer;
begin
  Result:= Length(b);
end;

// BUFFER VMAD
function WriteBufferVMADutf8(s: string; var b: tbytes; startPos: cardinal): word;
var
  tmpRaw: rawbyteString;
begin
  s:= limitStringSize(s, 65001, MAXSIZESTRING_GLOBALCAP_LOW);
  tmpRaw:= utf8encode(s);
  Result:= min(MAXSIZESTRING_GLOBALCAP_LOW, Length(tmpRaw));
  SetLength(b, Length(b) + Result + 2);
  Move(Result, b[startPos], 2);
  Move(tmpRaw[1], b[startPos + 2], Result);
end;

end.
