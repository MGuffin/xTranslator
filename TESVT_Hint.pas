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

unit TESVT_Hint;

interface

uses SysUtils, StrUtils, System.UITypes, Classes, Windows, Graphics, imglist, Controls, Forms, TESVT_Const;

const
  // cjhFlags
  JC_LEFT = 0;
  JC_RIGHT = 1;
  JC_CENTER = 2;
  JC_CALCRECT = 4; // does not draw the text, just calcs rect.bottom and return val.
  closeLineTag: array [0 .. 3] of string = ('</p>', '</div>', '</center>', '</right>');
  noHLTag: array [0 .. 14] of string = ('<font', '</font>', '<br>', '</br>', '<b>', '</b>', '<i>', '</i>', '<p', '</p>', '<div', '</div>',
    '<center>', '<u>', '</u>');

type
  rGlobalTipParam = record
    drawFrame: boolean;
    SideBorder, FootBorder, TopBorder, FirstLineHeight: integer;
    BodyColor, FrameColor: tcolor;
  end;

function jhDrawHTMLText(vCanvas: TCanvas; vHTMLstr: string; var vRect: TRect; const cjhFlags: Cardinal; const cLeading: Double)
// percentage of font height - 1 is normal)
  : rGlobalTipParam; // result = hauteur de la premiere ligne

type
  TApplyTagType = (atBreak, atStartIndent, atText, atGoodTag, atBadTag);

  // in interface so WordTagList can be examined for trouble-shooting.
  TjhHTMLText = class(TObject)
  private
    FWordTagList: TStringList;
    FWorkStr: string;
    FLineStartFontName: string;
    fSpecialObj: string;
    FOnRead, fDoNotReduceSize: boolean;
    FLineStartFontSize, FLineStartFontHeight, FIndentD, FIndentL, FCurLine, FLineEndWordTagIdx, FLineEndWordX, FLineObjectCount, FThisLineX,
      FThisLineY, FStaticLineHeight, Fppi: integer;
    FGlobalTipParam: rGlobalTipParam;
    FjhFlags: Cardinal;
    FLeading, FFontsizeMultiplier: Double;
    FRect: TRect;
    FCanvas: TCanvas;
    FLineStartStyle: TFontStyles;
    FLineStartFontColor: tcolor;
    FInPlainTextMode, FLineStartPlainTextMode: boolean;
    FBaseFont: TFont;
    FLastFont: TFont;
    FImListRef: Timagelist;
    procedure FillWordTagList;
    procedure ProcessWordTagList;
    function DrawLine(vLineEndWordTagIdx: integer): boolean;
    function ApplyTag(str: string): TApplyTagType;
    function GetTagParam(const ParamLabStr, s: string): string;
    //procedure SetFontSize(s: string);
    procedure SetFontName(s: string);
    procedure SetFontColor(s: string);
    procedure BreakWords(s: string);
    procedure BreakLongWord(s: string; const idx, startX, TempWidth: integer);
  public
    constructor Create(HTMLstr: string);
    destructor Destroy; override;
    property WordTagList: TStringList read FWordTagList; // public for trouble-shooting.
  end;

  TTESVTHint = class(THintWindow)
  private
    FActivating: boolean;
    GlobalTipParam: rGlobalTipParam;
  public
    procedure ActivateHint(Rect: TRect; const AHint: string); override;
    function CalcHintRect(MaxWidth: integer; const AHint: string; AData: Pointer): TRect; override;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure Paint; override;
  end;

procedure jhSetFontSize(vCanvas: TCanvas; const cSizeInPoints: Double);

implementation

function getLastdelimiter(s: string; delimiter: Char): string;
var
  i: integer;
begin
  i := length(s);
  while (i > 0) and (s[i] <> delimiter) do
    dec(i);
  Result := Copy(s, i + 1, length(s));
end;

procedure jhSetFontSize(vCanvas: TCanvas; const cSizeInPoints: Double);
// allows setting font size to 10ths of a point, ie 9.7 points
begin
  vCanvas.Font.Height := Round(-cSizeInPoints * vCanvas.Font.PixelsPerInch / 72);
end;

function jhDrawHTMLText(vCanvas: TCanvas; vHTMLstr: string; var vRect: TRect; const cjhFlags: Cardinal; const cLeading: Double): rGlobalTipParam;
var
  jhHTMLText: TjhHTMLText;
begin

  if trim(vHTMLstr) = '' then
  begin
    vRect.Bottom := vRect.Top;
    vRect.right := vRect.left;
    exit;
  end;
  // create object and process string
  jhHTMLText := TjhHTMLText.Create(vHTMLstr);
  try
    jhHTMLText.FLastFont.Assign(vCanvas.Font);
    jhHTMLText.FBaseFont.Assign(vCanvas.Font);
    jhHTMLText.Fppi := vCanvas.Font.PixelsPerInch;
    jhHTMLText.FLeading := cLeading;
    // jhHTMLText.FLeading := 0.9;
    jhHTMLText.FRect := vRect;
    jhHTMLText.FCanvas := vCanvas;
    jhHTMLText.FjhFlags := cjhFlags;
    jhHTMLText.FStaticLineHeight := Round(vCanvas.TextHeight('Hy') * cLeading);
    jhHTMLText.ProcessWordTagList; // draw the text
    vRect := jhHTMLText.FRect; // pass back the new height
    Result := jhHTMLText.FGlobalTipParam;
    vCanvas.Font.Assign(jhHTMLText.FBaseFont); // revert to prev stat
  finally
    jhHTMLText.Free;
  end;
end;

/// // TjhHTMLText //////////////////////////////////////////////////////////////

constructor TjhHTMLText.Create(HTMLstr: string);
begin
  inherited Create;
  FWorkStr := HTMLstr;
  FWordTagList := TStringList.Create;
  FillWordTagList;

  FLeading := 1;
  FFontsizeMultiplier := 1;
  FIndentD := 0;
  FIndentL := 0;
  FCurLine := 1;
  FLineEndWordTagIdx := -1;
  FLineEndWordX := 0;
  FLineObjectCount := 0;
  FThisLineY := 0;
  FThisLineY := 0;
  FStaticLineHeight := 0;
  FjhFlags := 0;
  fDoNotReduceSize := false;
  FGlobalTipParam.drawFrame := true;
  FGlobalTipParam.SideBorder := 7;
  FGlobalTipParam.FootBorder := 5;
  FGlobalTipParam.TopBorder := 3;
  FGlobalTipParam.FirstLineHeight := 0;
  FGlobalTipParam.FrameColor := clInfoText;
  FGlobalTipParam.BodyColor := clInfoBk;
  FLineStartStyle := [];
  FInPlainTextMode := false;
  FLastFont := TFont.Create;
  FBaseFont := TFont.Create;
  FOnRead := true;
  FImListRef := nil;
end;

destructor TjhHTMLText.Destroy;
begin
  FWordTagList.Free;
  FBaseFont.Free;
  FLastFont.Free;
  inherited;
end;

function checknoHLtag(tag: string): boolean;
var
  j: integer;
begin
  for j := 0 to high(noHLTag) do
    if pos(noHLTag[j], tag) = 1 then
      exit(false);
  Result := true;
end;

procedure TjhHTMLText.FillWordTagList;
// fills the FWordTagList from the HTML tagged string passed to the function,
// breaking apart words and tags onto separate lines.
var
  done: boolean;
  tagPos, endTagPos, j: integer;
  checkTag: string;
begin
  done := false;
  while not done do
  begin
    tagPos := pos('<', FWorkStr);
    if tagPos > 0 then
    begin // has tag - maybe
      if tagPos > 1 then
      begin // words before tag
        BreakWords(Copy(FWorkStr, 1, tagPos - 1));
        Delete(FWorkStr, 1, tagPos - 1);
      end
      else
      begin // starts with tag
        endTagPos := pos('>', FWorkStr);
        if endTagPos > tagPos then
        begin // has an endtag
          FWordTagList.Append(Copy(FWorkStr, 1, endTagPos));
          checkTag := ansilowercase(FWordTagList[FWordTagList.count - 1]);
          // except
          for j := 0 to high(closeLineTag) do
            if checkTag = closeLineTag[j] then
            begin
              FWordTagList.insert(FWordTagList.count - 1, '<br>');
              break;
            end;
          // place highlight
          if checknoHLtag(checkTag) then
          begin
            FWordTagList.insert(FWordTagList.count - 1, '<b>');
            FWordTagList.Append('</b>');
          end;
          Delete(FWorkStr, 1, endTagPos);
        end
        else
        begin // no end tag so just output as string
          BreakWords(FWorkStr);
          FWorkStr := '';
        end;
      end;
    end
    else
    begin // no tags
      BreakWords(FWorkStr);
      FWorkStr := '';
    end;
    done := (length(FWorkStr) < 1);
  end;
  // cleanupfirstSpace
  while (FWordTagList.count > 0) and ((ansilowercase(FWordTagList[0]) = '<br>') or (ansilowercase(FWordTagList[0]) = '<br/>')) do
    FWordTagList.Delete(0);
  // cleanuplastSpace
  while (FWordTagList.count > 0) and ((ansilowercase(FWordTagList[FWordTagList.count - 1]) = '<br>') or
      (ansilowercase(FWordTagList[FWordTagList.count - 1]) = '<br/>')) do
    FWordTagList.Delete(FWordTagList.count - 1);
end;

procedure TjhHTMLText.ProcessWordTagList;
var
  done, forceExit: boolean;
begin
  SetTextAlign(FCanvas.Handle, TA_LEFT or TA_BASELINE);
  FThisLineY := FRect.Top;
  FThisLineX := FRect.left;
  forceExit := false;
  repeat
    if FThisLineY > HintSizeThreshold then
    begin
      forceExit := true;
      FLineEndWordTagIdx := FWordTagList.count - 1;
      FWordTagList.Append('</b>');
      FWordTagList.Append('[...]');
    end;
    done := DrawLine(FLineEndWordTagIdx);
    if not done then
    begin
      Inc(FCurLine);
      FLineEndWordX := 0;
      FLineObjectCount := 0;
    end;
  until done or forceExit;
  FRect.Bottom := FThisLineY;
  FRect.right := FThisLineX;
end;

function TjhHTMLText.DrawLine(vLineEndWordTagIdx: integer): boolean;
// measures and draws (if not JC_CALCRECT) a line of text, applying tags
// and parameters as needed.
// Returns True when done processing last item in FWordTagList.
var
  i, TempIdx, StartPosX, StartPosY: integer;
  TempY: integer;
  WordSize: TSize;
  done: boolean;
begin
  done := false;
  Result := false;
  // set indent
  StartPosX := FIndentL + FRect.left;
  StartPosY := FThisLineY;
  // store init values for line to use during draw to canvas
  FLineEndWordX := StartPosX + FIndentD;
  FLineStartStyle := FCanvas.Font.Style;
  FLineStartFontName := FCanvas.Font.Name;
  FLineStartFontSize := FCanvas.Font.Size;
  FLineStartFontColor := FCanvas.Font.color;
  FLineStartFontHeight := FCanvas.Font.Height;
  FLineStartPlainTextMode := FInPlainTextMode;
  FOnRead := true;
  // measure only
  TempIdx := vLineEndWordTagIdx + 1;
  i := TempIdx;
  // loop list until line end reached
  while not done do
  begin
    case ApplyTag(FWordTagList[i]) of
      atBreak: begin
          if ((JC_CALCRECT and FjhFlags) > 0) then
          begin
            If FRect.right - FRect.left < FLineEndWordX then
              FRect.right := FLineEndWordX;
            if FLineEndWordX > FThisLineX then
              FThisLineX := FLineEndWordX;
          end;
          FLineEndWordTagIdx := i;
          if FLineObjectCount = 0 then
            FThisLineY := StartPosY + Round(FCanvas.TextHeight('Hy') * FLeading);
          if i = (FWordTagList.count - 1) then
          begin // finished last word or tag
            Result := true;
          end;
          break;
        end;
      atStartIndent: begin
          if FLineObjectCount = 0 then
          begin
            StartPosX := FIndentL + FRect.left;
            FLineEndWordX := FIndentL + FRect.left;
          end
          else if FLineEndWordX <= FIndentL + FRect.left + FIndentD then
            FLineEndWordX := FIndentL + FRect.left + FIndentD;
        end;
      atText: begin
          if fSpecialObj <> '' then
            FWordTagList[i] := fSpecialObj;
          WordSize := FCanvas.TextExtent(FWordTagList[i]);
          { on check la hauteur de la premiere ligne pour le resultat global }
          if FCurLine = 1 then
            if FGlobalTipParam.FirstLineHeight < WordSize.cy then
              FGlobalTipParam.FirstLineHeight := WordSize.cy;
          // break line at word if it exceeds bounds
          if (FLineEndWordX + WordSize.cx) > FRect.right then
          begin
            if FLineObjectCount > 0 then
              break
            else
            begin // need to break apart too long of a word
              BreakLongWord(FWordTagList[i], i, StartPosX, WordSize.cx);
              fDoNotReduceSize := true;
              WordSize := FCanvas.TextExtent(FWordTagList[i]);
            end;
          end;
          // update WordCount
          Inc(FLineObjectCount);
          // update FLineEndWordX for right justify
          FLineEndWordX := FLineEndWordX + WordSize.cx;
          // on redefini la valeur de X pour redimentionnement de vRect si necessaire
          if fDoNotReduceSize then
            FThisLineX := FRect.right
          else if FLineEndWordX > FThisLineX then
            FThisLineX := FLineEndWordX;
          // update FThisLineY to tallest font in line
          if FCurLine > 1 then
          begin
            TempY := StartPosY + Round(WordSize.cy * FLeading);
            if TempY > FThisLineY then
              FThisLineY := TempY;
          end;
        end;
    else begin
        // autre tag = nothing
      end;
    end;
    // update index of last word or tag processed
    FLineEndWordTagIdx := i;
    Inc(i);
    if i = (FWordTagList.count) then
    begin // finished last word or tag in list
      Result := true;
      break;
    end;
  end;
  if (JC_CALCRECT and FjhFlags) > 0 then
    exit; // skip drawing of text
  // draw text
  // set init values for line
  FOnRead := false;
  FCanvas.Font.Style := FLineStartStyle;
  FCanvas.Font.Name := FLineStartFontName;
  FCanvas.Font.Size := FLineStartFontSize;
  FCanvas.Font.color := FLineStartFontColor;
  FCanvas.Font.Height := FLineStartFontHeight;
  FInPlainTextMode := FLineStartPlainTextMode;
  // set starting x pos according to justify
  if (JC_RIGHT and FjhFlags) > 0 then
    FCanvas.MoveTo(StartPosX + FRect.right - FLineEndWordX, FThisLineY)
  else if (JC_CENTER and FjhFlags) > 0 then
    FCanvas.MoveTo(StartPosX + ((FRect.right - FLineEndWordX) div 2), FThisLineY)
  else
    FCanvas.MoveTo(StartPosX, FThisLineY);
  // loop section of list processed above
  for i := TempIdx to FLineEndWordTagIdx do
  begin
    case ApplyTag(FWordTagList[i]) of
      atBreak: exit;
      atStartIndent: if FCanvas.PenPos.x < FIndentL + FRect.left then
          FCanvas.MoveTo(FIndentL + FRect.left, FThisLineY);
      atText: FCanvas.TextOut(FCanvas.PenPos.x, FThisLineY, FWordTagList[i]);
    end;
  end;
end;


procedure TjhHTMLText.SetFontName(s: string);
begin
  if s = '' then exit;
  if FCanvas.Font.Name <> s then
    FCanvas.Font.Name := s;
end;


{
procedure TjhHTMLText.SetFontSize(s: string);
var
  TempSize: double;
begin
  if s = '' then exit;
  TempSize := StrToFloatDef(s, 0)*FFontsizeMultiplier;
  if TempSize < 4 then
    TempSize := FBaseFont.Size;
  if FCanvas.Font.Size <> TempSize then
    jhSetFontSize(FCanvas, TempSize);
end;
}

function TjhHTMLText.ApplyTag(str: string): TApplyTagType;
var
  tmpstr: string;
  lstr: string;
begin
  Result := atText;
  fSpecialObj := '';
  lstr := ansilowercase(str);
  if (lstr = '[pagebreak]') or (lstr = '<pagebreak>') then
    exit(atBreak);
  if (lstr = '') or (lstr[1] <> '<') then
    exit; // not valid tag
  if (pos('<br>', lstr) > 0) or (pos('<br/>', lstr) > 0) then
    exit(atBreak);

  // plaintext pour tous les autres tags
  if pos('<pt>', lstr) > 0 then
  begin
    FInPlainTextMode := true;
    Result := atGoodTag;
    exit;
  end
  else if pos('</pt>', lstr) > 0 then
  begin
    FInPlainTextMode := false;
    Result := atGoodTag;
    exit;
  end;
  if FInPlainTextMode then
  begin // don't process tags
    exit;
  end;
  if FOnRead then
    if pos('<body', lstr) > 0 then
    begin
      FRect.right := FRect.left + StrToIntDef(GetTagParam('smax=', lstr), FRect.right); // if ((JC_CALCRECT and FjhFlags) > 0) then
      FGlobalTipParam.SideBorder := StrToIntDef(GetTagParam('side=', lstr), 5);
      FGlobalTipParam.FootBorder := StrToIntDef(GetTagParam('foot=', lstr), 5);
      FGlobalTipParam.TopBorder := StrToIntDef(GetTagParam('top=', lstr), 5);
      FGlobalTipParam.BodyColor := StrToIntDef(GetTagParam('color=', lstr), clInfoBk);
      Result := atGoodTag;
      exit;
    end;

  // alignement dynamique
  if ((JC_CALCRECT and FjhFlags) = 0) then
  begin
    if pos('<center>', lstr) > 0 then
    begin
      FjhFlags := JC_CENTER;
      Result := atGoodTag;
      exit;
    end
    else if pos('<right>', lstr) > 0 then
    begin
      FjhFlags := JC_RIGHT;
      Result := atGoodTag;
      exit;
    end
    else if (pos('<left>', lstr) > 0) or (pos('</center>', lstr) > 0) or (pos('</right>', lstr) > 0) then
    begin
      FjhFlags := JC_LEFT;
      Result := atGoodTag;
      exit;
    end;
  end;
  if pos('<b>', lstr) > 0 then
    FCanvas.Font.Style := FCanvas.Font.Style + [fsBold]
  else if pos('</b>', lstr) > 0 then
    FCanvas.Font.Style := FCanvas.Font.Style - [fsBold]
  else if pos('<i>', lstr) > 0 then
    FCanvas.Font.Style := FCanvas.Font.Style + [fsItalic]
  else if pos('</i>', lstr) > 0 then
    FCanvas.Font.Style := FCanvas.Font.Style - [fsItalic]
  else if pos('<u>', lstr) > 0 then
    FCanvas.Font.Style := FCanvas.Font.Style + [fsUnderline]
  else if pos('</u>', lstr) > 0 then
    FCanvas.Font.Style := FCanvas.Font.Style - [fsUnderline]
  else if pos('<s>', lstr) > 0 then
    FCanvas.Font.Style := FCanvas.Font.Style + [fsStrikeOut]
  else if pos('</s>', lstr) > 0 then
    FCanvas.Font.Style := FCanvas.Font.Style - [fsStrikeOut]
  else if pos('<font', lstr) > 0 then
  begin
    FLastFont.Assign(FCanvas.Font);
    SetFontName(GetTagParam('face=',lstr));
    //SetFontSize(GetTagParam('size=',lstr));
    SetFontColor(GetTagParam('color=',lstr));
  end
  else if (pos('<p', lstr) > 0) or (pos('<div', lstr) > 0) then
  begin
    if ((JC_CALCRECT and FjhFlags) = 0) then
    begin
      tmpstr := GetTagParam('align=', lstr);
      if tmpstr = 'left' then
        FjhFlags := JC_LEFT
      else if tmpstr = 'right' then
        FjhFlags := JC_RIGHT
      else if tmpstr = 'center' then
        FjhFlags := JC_CENTER
    end
  end
  else if (pos('</p>', lstr) > 0) or (pos('</div>', lstr) > 0) then
  begin
    if ((JC_CALCRECT and FjhFlags) = 0) then
      FjhFlags := JC_LEFT
  end
  else if pos('<fp', lstr) > 0 then
  begin
    FFontsizeMultiplier := StrTofloatDef(GetTagParam('=', lstr), 1.0);
  end
  else if pos('<img', lstr) > 0 then
  begin
    fSpecialObj := GetTagParam('src=', lstr);
    if fSpecialObj <> '' then
    begin
      fSpecialObj := changefileext(getLastdelimiter(fSpecialObj, '/'), '');
      // except _letter
      if pos('_letter', fSpecialObj) > 0 then
        fSpecialObj := upperCase(fSpecialObj[1])
      else
        fSpecialObj := '[img]' + fSpecialObj;
      // -----------
      Result := atText;
      exit;
    end
    else
      Result := atBadTag;
    exit;
  end
  else if pos('</font>', lstr) > 0 then
  begin
    FCanvas.Font.Assign(FLastFont);
  end
  else if pos('<ind', lstr) > 0 then
  begin
    FIndentL := StrToIntDef(GetTagParam('left=', lstr), 0);
    FIndentD := StrToIntDef(GetTagParam('right=', lstr), 0);
    // sécurité
    if FIndentL + FIndentD >= FRect.right - FRect.left then
    begin
      FIndentL := 0;
      FIndentD := 0;
      Result := atBadTag;
    end
    else
      Result := atStartIndent;
    exit;
  end
  else if pos('>', (lstr)) > 2 then
  begin
    exit(atText);
  end
  else
    exit; // result is atText
  Result := atGoodTag;
end;

function TjhHTMLText.GetTagParam(const ParamLabStr, s: string): string;
// returns a specific value from a <font....> tag.
// ParamLabStr can be "face=", "size=", "color=" etc.
var
  TempPos, i: integer;
  TempStr: string;
begin
  Result := '';
  // error checking
  if (ParamLabStr = '') or (length(s) <= length(ParamLabStr)) or (s = '') then
    exit;
  // find start of ParamLabStr in string
  TempPos := pos(ParamLabStr, LowerCase(s));
  if TempPos > 0 then
  begin
    // delete ParamLabStr from string
    TempStr := Copy(s, TempPos + length(ParamLabStr), length(s));
    // extract value
    case TempStr[1] of
      '''', '"': begin // quoted value - allows space char
          for i := 2 to length(TempStr) do
          begin
            if charinset(TempStr[i], ['''', '"', '>']) then
              break;
            Result := Result + TempStr[i];
          end;
        end;
    else begin // no quotes on value
        for i := 1 to length(TempStr) do
        begin
          if charinset(TempStr[i], [' ', '>']) then
            break;
          Result := Result + TempStr[i];
        end;
      end;
    end;
  end;
end;

procedure TjhHTMLText.SetFontColor(s: string);
var
  TempColor: tcolor;
begin
  if s = '' then
    exit;
  TempColor := StrToIntDef(s, 0);
  if FCanvas.Font.color <> TempColor then
    FCanvas.Font.color := TempColor;
end;

procedure TjhHTMLText.BreakWords(s: string);
// breaks a string of words on spaces or #10 and appends to FWordTagList
var
  i, sLen: integer;
  TempStr: string;
begin
  sLen := length(s);
  for i := 1 to sLen do
  begin
    if s[i] <> ' ' then
    begin // not a space
      if (s[i] <> #10) and (s[i] <> #13) then
      begin
        TempStr := TempStr + s[i];
      end
      else if s[i] = #10 then
      begin // new line for #10, skip #13
        FWordTagList.Append(TempStr);
        FWordTagList.Append('<br>'); // replace CRLF with a <br>
        TempStr := '';
      end;
    end
    else
    begin // is a space
      FWordTagList.Append(TempStr + ' ');
      TempStr := '';
    end;
    if (i = sLen) and (TempStr <> '') then
      FWordTagList.Append(TempStr); // catch the last string
  end;
end;

procedure secureinserttolist(l: TStringList; i: integer; s: string);
begin
  if i > l.count - 1 then
    l.Append(s)
  else
    l.insert(i, s);
end;

procedure TjhHTMLText.BreakLongWord(s: string; const idx, startX, TempWidth: integer);
var
  FitInWidth, CharCount: integer;
  TempPerc: Double;
  done: boolean;
begin
  done := false;
  FitInWidth := FRect.right - startX - FIndentD;
  TempPerc := (FitInWidth / TempWidth) * 1.05;
  CharCount := Round(length(s) * TempPerc);
  repeat
    if FCanvas.TextWidth(Copy(s, 1, CharCount)) < FitInWidth then
      done := true
    else
    begin
      dec(CharCount);
    end;
  until done;
  secureinserttolist(FWordTagList, idx + 1, Copy(s, CharCount + 1, maxint));
  FWordTagList[idx] := Copy(s, 1, CharCount);
end;

// **************************************************

procedure TTESVTHint.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  Params.Style := WS_POPUP;
end;

procedure TTESVTHint.Paint;
var
  R: TRect;
begin
  R := ClientRect;
  // framerect
  if GlobalTipParam.drawFrame then
    with canvas do
    begin
      Brush.color := GlobalTipParam.FrameColor;
      FrameRect(R);
      Brush.color := GlobalTipParam.BodyColor;
    end;
  Inc(R.Top, GlobalTipParam.FirstLineHeight + GlobalTipParam.TopBorder);
  Inc(R.left, GlobalTipParam.SideBorder);
  dec(R.right, GlobalTipParam.SideBorder);
  jhDrawHTMLText(canvas, caption, R, JC_LEFT, 1);
end;

function TTESVTHint.CalcHintRect(MaxWidth: integer; const AHint: string; AData: Pointer): TRect;
begin
  Result := Rect(0, 0, 500, 0);
  GlobalTipParam := jhDrawHTMLText(canvas, AHint, Result, JC_CALCRECT or JC_LEFT, 1);
  Inc(Result.Bottom, GlobalTipParam.FirstLineHeight + GlobalTipParam.FootBorder + GlobalTipParam.TopBorder + 4);
  dec(Result.left, GlobalTipParam.SideBorder);
  Inc(Result.right, GlobalTipParam.SideBorder);
end;

procedure TTESVTHint.ActivateHint(Rect: TRect; const AHint: string);
begin
  FActivating := true;
  try
    caption := AHint;
    UpdateBoundsRect(Rect);
    if Rect.Top + Height > Screen.DesktopHeight then
      Rect.Top := Screen.DesktopHeight - Height;
    if Rect.left + Width > Screen.DesktopWidth then
      Rect.left := Screen.DesktopWidth - Width;
    if Rect.left < Screen.DesktopLeft then
      Rect.left := Screen.DesktopLeft;
    if Rect.Bottom < Screen.DesktopTop then
      Rect.Bottom := Screen.DesktopTop;
    color := GlobalTipParam.BodyColor;
    SetWindowPos(Handle, HWND_TOPMOST, Rect.left, Rect.Top, Width, Height, SWP_NOACTIVATE);
    ShowWindow(Handle, SW_SHOWNOACTIVATE);
  finally
    FActivating := false;
  end;
end;

end.
