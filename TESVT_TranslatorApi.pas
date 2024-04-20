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
unit TESVT_TranslatorApi;

interface

uses windows, math, Classes, SysUtils, TESVT_CustomList, TESVT_Ressources, TESVT_Const, TESVT_FastSearch, TESVT_Utils,
  REST.Client, REST.types, System.JSON, System.JSON.Readers, System.JSON.types, System.hash, Generics.Collections, IdURI, TESVT_RegexUtils;

Const
  MaxApiCount = 7; // (0..7)  6= deepL 7= OpenAI

type
  tapiBaseTranslation = function(var Text: string; var apiId: integer): boolean;
  tapiBaseTranslationArray = function(l: tstringlist): integer;

  tApiPersistentData = class
  private
    spreffile: string;
    procedure initQueryData;
  public
    aPreferencesApi: tmcStringList;
    apiEnabled: array [0 .. MaxApiCount] of boolean;
    source, dest: array [0 .. MaxApiCount] of string;
    Urldata: tmcStringList;
    CurrentUsageTimer: cardinal;
    aApiBaseNameMaxCharPerMin: array [0 .. MaxApiCount] of integer;
    aApiBaseNameArraySleep: array [0 .. MaxApiCount] of integer;
    aApiBaseNameSleep: array [0 .. MaxApiCount] of integer;
    aApiMaxCharsLimit: array [0 .. MaxApiCount] of integer;
    aApiMaxArraysLimit: array [0 .. MaxApiCount] of integer;

    constructor Create;
    destructor Destroy; override;
    function checkForArrayEnabled: boolean;
    function setUsage(apiId: integer): cardinal;
    procedure PreparePreferenceList(l: tstringlist);
    procedure saveApiPreferences;
    procedure enabledAPIs;

    procedure setProxyREST(RC: tRestClient);
    function getCharCountForApi(s: string): integer;
    function getApiLanguages(const sName, dName: string; const iApiNumber: integer): boolean;
    function validateApiTranslation(Text: string; iApiNumber: integer): boolean;
  end;

  TGenericTranslator = class(Tcomponent)
  private
    RESTClient: tRestClient;
    RESTRequest: TRESTRequest;
    RESTResponse: TRESTResponse;
    procedure setError(var error: boolean; errorText: string);
    procedure ParseJSonValue_generic(l: tstringlist; content: TJSONValue; sTranslateParam: string; sAfterPath: string = '');
    function ParseJSonValue_genericSingle(content: TJSONValue; sTranslateParam: string; sAfterPath: string = ''): string;
  public
    apiId: integer;
    bError: boolean;
    sLastError: String;
    constructor Create(AOwner: Tcomponent); reintroduce;
    destructor Destroy; override;
  end;

  TmsTranslator = class(TGenericTranslator)
  private
    fClientSecret: string;
  public
    constructor Create(AOwner: Tcomponent); overload;
    procedure Translate(l: tstringlist; source, dest: string; var charCount: integer);
    procedure SetCredentials(const secretId: string);
  end;

  TOpenAITranslator = class(TGenericTranslator)
  private
    fClientSecret: string;
    function parseJSon(content: TJSONValue): string;
  public
    constructor Create(AOwner: Tcomponent); overload;
    function Translate(Text: string; const source, dest: String; var charCount: integer): string;
    procedure SetCredentials(const secretId: string);
  end;

  TDeepLTranslator = class(TGenericTranslator)
  private
    fClientSecret: string;
  public
    constructor Create(AOwner: Tcomponent); overload;
    procedure Translate(l: tstringlist; source, dest: string; var charCount: integer);
    procedure SetCredentials(const secretId: string);
  end;

  TgoogleTranslator = class(TGenericTranslator)
  private
    function parseJSon(content: TJSONValue): string;
  public
    constructor Create(AOwner: Tcomponent); overload;
    function Translate(Text: string; const source, dest: String; var charCount: integer): string;
  end;

  TyoudaoTranslator = class(TGenericTranslator)
  private
    keyFrom, key: string;
  public
    constructor Create(AOwner: Tcomponent); overload;
    procedure SetCredentials(const kf, k: string);
    function Translate(Text: string; const source, dest: String; var charCount: integer): string;
  end;

  TbaiduTranslator = class(TGenericTranslator)
  private
    appId, key: string;
  public
    constructor Create(AOwner: Tcomponent); overload;
    procedure SetCredentials(const kf, k: string);
    function Translate(Text: string; const source, dest: String; var charCount: integer): string;
  end;

function msTranslationArray(l: tstringlist): integer;
function DeeplTranslationArray(l: tstringlist): integer;
function GoogleTranslationArray(l: tstringlist): integer;
function OpenAITranslationArray(l: tstringlist): integer;

function msTranslation(var Text: string; var apiId: integer): boolean;
function DeepLTranslation(var Text: string; var apiId: integer): boolean;
function youdaoApiTranslation(var Text: string; var apiId: integer): boolean;
function baiduApiTranslation(var Text: string; var apiId: integer): boolean;
function googleTranslation(var Text: string; var apiId: integer): boolean;
function OpenAITranslation(var Text: string; var apiId: integer): boolean;

// deprecated --->
function freeApiTranslation(var Text: string; var apiId: integer): boolean;
function yandexTranslationArray(l: tstringlist): boolean;
function yandexTranslation(var Text: string; var apiId: integer): boolean;
// <------------
function isApiFakeArray(i: integer): boolean;
function isStringMultiLines(s: string): boolean;
function isAuthForArray(s: string): boolean;
function clearCRLF(s: string; bAllow: boolean = true): string;
function restoreCRLF(s: string; bAllow: boolean = true): string;

var
  apiData: tApiPersistentData;
  iMSSessionTimeOut: integer = 540;
  ilastUsedApi: integer = 0;
  ilastUsedApiArray: integer = 0;

Const
  USERAPIPREFS_FILE = 'commonApiPrefs.ini';
  OcpApimSubscriptionKeyHeader = 'Ocp-Apim-Subscription-Key';
  DeepLSubscriptionKeyHeader = 'DeepL-Auth-Key';
  aApiBaseName: array [0 .. MaxApiCount] of string = ('MsTranslate_', 'Yandex_', 'Baidu_', 'Youdao_', 'freeApi_', 'Google_', 'DeepL_', 'OpenAI_');
  aApiBaseNameArraySleepDefault: array [0 .. MaxApiCount] of integer = (3, 0, 0, 0, 0, 4, 3, 5);
  aApiBaseNameSleepDefault: array [0 .. MaxApiCount] of integer = (1, 1, 1, 1, 1, 4, 1, 1);
  aApiBaseNameMaxCharPerMinDefault: array [0 .. MaxApiCount] of integer = (30000, 0, 0, 0, 0, 30000, 30000, 30000);
  aApiBaseuseFakeArray: array [0 .. MaxApiCount] of boolean = (false, false, false, false, false, true, false, true);
  aApiBaseArrayFunc: array [0 .. MaxApiCount] of tapiBaseTranslationArray = (msTranslationArray, nil, nil, nil, nil, GoogleTranslationArray, DeeplTranslationArray, OpenAITranslationArray);
  aApiBaseFunc: array [0 .. MaxApiCount] of tapiBaseTranslation = (msTranslation, yandexTranslation, baiduApiTranslation, youdaoApiTranslation, freeApiTranslation, googleTranslation, DeepLTranslation,
    OpenAITranslation);

  aDefaultPreferenceList: array [0 .. 25] of string = (
    // Google
    'Google_RequestCount=0', 'Google_CharCount=0',
    // MsTranslator
    'MsTranslate_AzureClientSecret=', 'MsTranslate_RequestCount=0', 'MsTranslate_CharCount=0',
    // deepL
    'DeepL_Key=', 'DeepL_RequestCount=0', 'DeepL_CharCount=0',
    // Youdao
    'Youdao_AppID=', 'Youdao_SecretKey=', 'Youdao_RequestCount=0', 'Youdao_CharCount=0',
    // Baidu
    'Baidu_AppId=', 'Baidu_Key=', 'Baidu_RequestCount=0', 'Baidu_CharCount=0',
    // OpenAI
    'OpenAI_Key=', 'OpenAI_URL=', 'OpenAI_Model=', 'OpenAI_Query=', 'OpenAI_RequestCount=0', 'OpenAI_CharCount=0',
    // Proxy
    'Proxy_Server=', 'Proxy_Port=', 'Proxy_Username=', 'Proxy_Password=');

  // -------
  CRLFchars = [#13, #10];
  CRLFtag = '<L_F>';
  CRLFuntilSize = 3500;
  CRLFPattern = '\r\n|\n';
  URISpecialChar: array [0 .. 1] of array [0 .. 1] of string = (('&', '%26'), (';', '%3B'));

implementation

uses IdHashMessageDigest, IdGlobal;

procedure doFeedbackForAPI(aLabel, bLabel, a, b: string);
begin
  if bApiTranslationVerbose then
  begin
    dofeedback(strSeparator);
    dofeedback(aLabel);
    dofeedback(a);
    dofeedback(strSeparator);
    dofeedback(bLabel);
    dofeedback(b);
    dofeedback(strSeparator);
  end;
end;

function isApiFakeArray(i: integer): boolean;
begin
  result := aApiBaseuseFakeArray[i];
end;

function isStringMultiLines(s: string): boolean;
var
  j: integer;
begin
  result := false;
  for j := 1 to length(s) do
    if charinset(s[j], CRLFchars) then
      exit(true);
end;

function isAuthForArray(s: string): boolean;
begin
  result := (length(s) <= CRLFuntilSize);
end;

function clearCRLF(s: string; bAllow: boolean = true): string;
begin
  if bAllow then
  begin
    result := StringReplace(s, sstLineBreak, CRLFtag, [rfReplaceAll]);
    result := StringReplace(result, #13, '', [rfReplaceAll]); // extracheck
    result := StringReplace(result, #10, CRLFtag, [rfReplaceAll]); // extracheck
  end
  else
    result := s;
end;

function restoreCRLF(s: string; bAllow: boolean = true): string;
begin
  if bAllow then
    result := StringReplace(s, CRLFtag, sstLineBreak, [rfReplaceAll])
  else
    result := s;
end;

function paramEncodeEx(const s: string): string;
var
  i: integer;
begin
  result := TIdURI.ParamsEncode(s);
  for i := 0 to high(URISpecialChar) do
    result := StringReplace(result, URISpecialChar[i, 0], URISpecialChar[i, 1], [rfReplaceAll]);
end;

function paramDecodeEx(const s: string): string;
var
  i: integer;
begin
  result := TIdURI.URLDecode(s);
  for i := 0 to high(URISpecialChar) do
    result := StringReplace(result, URISpecialChar[i, 1], URISpecialChar[i, 0], [rfReplaceAll]);
end;

function MD5Stream(sStream: TStringStream): string;

var
  smd5: TIdHashMessageDigest5;
begin
  smd5 := TIdHashMessageDigest5.Create;
  result := smd5.HashStreamAsHex(sStream);
  smd5.free;
end;

constructor TGenericTranslator.Create(AOwner: Tcomponent);
begin
  sLastError := '';
  bError := false;

  RESTClient := tRestClient.Create(Self);
  RESTClient.ContentType := 'application/json';
  RESTClient.Accept := 'application/json, text/plain; q=0.9, text/html;q=0.8,';
  RESTClient.AcceptCharset := 'utf-8, *;q=0.8';
  RESTClient.HandleRedirects := true;
  RESTClient.RaiseExceptionOn500 := false;

  RESTResponse := TRESTResponse.Create(Self);
  RESTResponse.ContentType := 'application/json';

  RESTRequest := TRESTRequest.Create(Self);
  RESTRequest.Response := RESTResponse;
  RESTRequest.Client := RESTClient;
  RESTRequest.Accept := 'application/json, text/plain; q=0.9, text/html;q=0.8,';
  RESTRequest.AcceptCharset := 'utf-8, *;q=0.8';
  RESTRequest.Timeout := 45000;
  RESTRequest.HandleRedirects := true;

  apiData.setProxyREST(RESTClient);
end;

destructor TGenericTranslator.Destroy;
begin
  RESTClient.free;
  RESTRequest.free;
  RESTResponse.free;
  inherited;
end;

procedure TGenericTranslator.ParseJSonValue_generic(l: tstringlist; content: TJSONValue; sTranslateParam: string; sAfterPath: string = '');
var
  LStringReader: TStringReader;
  LJsonReader: TJsonReader;
  count: integer;
begin
  count := 0;
  LStringReader := TStringReader.Create(content.tostring);
  LJsonReader := TJsonTextReader.Create(LStringReader);
  try
    try
      while LJsonReader.read do
        if (LJsonReader.TokenType = TJsonToken.PropertyName) and (LJsonReader.Value.AsString = sTranslateParam) then
        begin
          if l.count - 1 >= count then
            l[count] := content.GetValue<string>(LJsonReader.path + sAfterPath);
          inc(count);
        end;
    except
    end;
  finally
    LStringReader.free;
    LJsonReader.free;
  end;
end;

function TGenericTranslator.ParseJSonValue_genericSingle(content: TJSONValue; sTranslateParam: string; sAfterPath: string = ''): string;
var
  LStringReader: TStringReader;
  LJsonReader: TJsonReader;
  firstline: boolean;
begin
  result := '';
  firstline := true;
  LStringReader := TStringReader.Create(content.tostring);
  LJsonReader := TJsonTextReader.Create(LStringReader);
  try
    try
      while LJsonReader.read do
        if (LJsonReader.TokenType = TJsonToken.PropertyName) and (LJsonReader.Value.AsString = sTranslateParam) then
        begin
          if not firstline then
            result := result + #13;
          result := result + (content.GetValue<string>(LJsonReader.path + sAfterPath));
          firstline := false;
        end;

    except
    end;
  finally
    LStringReader.free;
    LJsonReader.free;
  end;
end;

procedure TGenericTranslator.setError(var error: boolean; errorText: string);
begin
  error := true;
  sLastError := errorText;
end;

// ===================================
// GlobalPersistent data (pref / persistent authKey
// ===================================

function tApiPersistentData.setUsage(apiId: integer): cardinal;
begin
  result := aApiBaseNameSleep[apiId];
end;

procedure tApiPersistentData.PreparePreferenceList(l: tstringlist);
var
  i: integer;
  name, Value: string;
begin
  for i := 0 to high(aDefaultPreferenceList) do
    aPreferencesApi.add(aDefaultPreferenceList[i]);

  for i := 0 to pred(aPreferencesApi.count) do
  begin
    name := aPreferencesApi.Names[i];
    Value := l.Values[name];
    if (Value <> '') then
      aPreferencesApi.Values[name] := Value;
  end;
  enabledAPIs;
end;

function tApiPersistentData.checkForArrayEnabled: boolean;
var
  i: integer;
begin
  enabledAPIs;
  for i := low(aApiBaseArrayFunc) to high(aApiBaseArrayFunc) do
    if apiEnabled[i] and assigned(aApiBaseArrayFunc[i]) then
      exit(true);
  result := false;
end;

procedure tApiPersistentData.setProxyREST(RC: tRestClient);
begin
  if trim(aPreferencesApi.Values['Proxy_Server']) <> '' then
  begin
    RC.ProxyServer := trim(aPreferencesApi.Values['Proxy_Server']);
    RC.ProxyPort := strtoIntdef(trim(aPreferencesApi.Values['Proxy_Port']), 0);
    RC.ProxyUsername := trim(aPreferencesApi.Values['Proxy_Username']);
    RC.ProxyPassword := trim(aPreferencesApi.Values['Proxy_Password']);
  end;
end;

function tApiPersistentData.getCharCountForApi(s: string): integer;
begin
  result := length(utf8encode(s));
end;

function tApiPersistentData.getApiLanguages(const sName, dName: string; const iApiNumber: integer): boolean;
begin
  source[iApiNumber] := Urldata.Values[aApiBaseName[iApiNumber] + sName];
  dest[iApiNumber] := Urldata.Values[aApiBaseName[iApiNumber] + dName];
  result := (source[iApiNumber] <> '') and (dest[iApiNumber] <> '') and (source[iApiNumber] <> dest[iApiNumber]);
end;

function tApiPersistentData.validateApiTranslation(Text: string; iApiNumber: integer): boolean;
begin
  if not getApiLanguages(sourceLanguage, DestLanguage, iApiNumber) then
    exit(false);

  if getCharCountForApi(Text) > aApiMaxCharsLimit[iApiNumber] then
  begin
    dofeedback(formatRes('fbkStringTooLong%d', [aApiMaxCharsLimit[iApiNumber]]), true);
    exit(false);
  end;
  result := true;
end;

procedure tApiPersistentData.saveApiPreferences;
begin
  try
    aPreferencesApi.SaveToFile(spreffile, TEncoding.UTF8);
  except
  end;
end;

constructor tApiPersistentData.Create;
var
  l: tstringlist;
begin
  CurrentUsageTimer := 0;
  l := tstringlist.Create;
  aPreferencesApi := tmcStringList.Create;
  Urldata := tmcStringList.Create;
  try
    if authFileAccess(mainpath + miscPath + apiDataListName) then
      Urldata.loadfromfile(mainpath + miscPath + apiDataListName);
  except
  end;
  // -------------
  initQueryData;

  spreffile := mainpath + PREFS_BASEFOLDER + USERAPIPREFS_FILE;
  try
    try
      ForceDirectories(mainpath + PREFS_BASEFOLDER);
      if authFileAccess(spreffile) then
        l.loadfromfile(spreffile);
    except
    end;
    PreparePreferenceList(l);
  finally
    l.free;
  end;
end;

procedure tApiPersistentData.enabledAPIs;
var
  i: integer;
begin
  // 0='MsTranslate_', 1='Yandex_', 2='Baidu_', 3='Youdao_', 4='freeApi_' , 5=google, 6= deepl
  for i := 0 to MaxApiCount do
    apiEnabled[i] := (Urldata.count > 0) and Urldata.valueBoolean(aApiBaseName[i] + 'enabled');
  apiEnabled[0] := apiEnabled[0] and (aPreferencesApi.Values['MsTranslate_AzureClientSecret'] <> '');
  apiEnabled[1] := apiEnabled[1] and (aPreferencesApi.Values['Yandex_Key'] <> '');
  apiEnabled[2] := apiEnabled[2] and (aPreferencesApi.Values['Baidu_AppId'] <> '') and (aPreferencesApi.Values['Baidu_Key'] <> '');
  apiEnabled[3] := apiEnabled[3] and (aPreferencesApi.Values['Youdao_AppId'] <> '') and (aPreferencesApi.Values['Youdao_SecretKey'] <> '');
  apiEnabled[6] := apiEnabled[6] and (aPreferencesApi.Values['DeepL_Key'] <> '');
  apiEnabled[7] := apiEnabled[7] and (aPreferencesApi.Values['OpenAI_Key'] <> '');
  for i := 0 to MaxApiCount do
    apiEnabled[i] := apiEnabled[i] and getApiLanguages(sourceLanguage, DestLanguage, i);
end;

procedure tApiPersistentData.initQueryData;
var
  i: integer;
begin
  // 0='MsTranslate_', 1='Yandex_', 2='Baidu_', 3='Youdao_', 4='freeApi_' , 5=google, 6= deepl
  for i := 0 to MaxApiCount do
  begin
    aApiBaseNameMaxCharPerMin[i] := Urldata.ValueInt(aApiBaseName[i] + 'ArrayMaxCharPerMin', aApiBaseNameMaxCharPerMinDefault[i]);
    aApiBaseNameArraySleep[i] := Urldata.ValueInt(aApiBaseName[i] + 'ArrayTimePause', aApiBaseNameArraySleepDefault[i]) * 1000;
    aApiBaseNameSleep[i] := Urldata.ValueInt(aApiBaseName[i] + 'SingleTimePause', aApiBaseNameSleepDefault[i]) * 1000;
    aApiMaxCharsLimit[i] := Urldata.ValueInt(aApiBaseName[i] + 'CharLimit', 5000);
    aApiMaxArraysLimit[i] := Urldata.ValueInt(aApiBaseName[i] + 'ArrayLimit', 25);
  end;
end;

destructor tApiPersistentData.Destroy;
begin
  aPreferencesApi.free;
  Urldata.free;
end;


// ===================================
// youdaoAPI class
// ===================================

constructor TyoudaoTranslator.Create(AOwner: Tcomponent);
begin
  inherited;
  apiId := 3;
end;

procedure TyoudaoTranslator.SetCredentials(const kf, k: string);
begin
  keyFrom := kf;
  key := k;
end;

function TyoudaoTranslator.Translate(Text: string; const source, dest: String; var charCount: integer): string;
var
  URL: string;
  salt: string;
  smd5: string;
begin
  result := '';
  salt := inttostr(random(10000));
  smd5 := THashMD5.GetHashString(keyFrom + Text + salt + key);
  Text := paramEncodeEx(Text);
  charCount := length(Text);
  URL := format(apiData.Urldata.Values['Youdao_ApiUrl'], [keyFrom, Text, source, dest, smd5, salt]);

  RESTClient.BaseURL := URL;
  RESTRequest.Params.Clear;
  RESTRequest.Body.ClearBody;
  RESTRequest.method := rmGET;

  try
    RESTRequest.Execute;
    doFeedbackForAPI('Header', 'JSON', RESTResponse.headers.Text, RESTResponse.content);
    if (RESTResponse.content = '') or (RESTResponse.StatusCode <> 200) then
      setError(bError, '[error:' + inttostr(RESTResponse.StatusCode) + ']' + #13 + RESTResponse.content)
    else
      result := ParseJSonValue_genericSingle(RESTResponse.JSONValue, 'translation', '[0]');
  except
    on E: exception do
      setError(bError, getRes('HTTPError') + #13 + E.Message);
  end;
end;


// ===================================
// baiduAPI class
// ===================================

constructor TbaiduTranslator.Create(AOwner: Tcomponent);
begin
  inherited;
  apiId := 2;
end;

procedure TbaiduTranslator.SetCredentials(const kf, k: string);
begin
  appId := kf;
  key := k;
end;

function TbaiduTranslator.Translate(Text: string; const source, dest: String; var charCount: integer): string;
var
  URL: string;
  salt: string;
  smd5: string;
begin
  result := '';

  salt := inttostr(random(10000));
  smd5 := THashMD5.GetHashString(appId + Text + salt + key);
  Text := paramEncodeEx(Text);
  charCount := length(Text);
  URL := format(apiData.Urldata.Values['Baidu_ApiUrl'], [appId, Text, source, dest, salt, smd5]);

  RESTClient.BaseURL := URL;
  RESTRequest.Params.Clear;
  RESTRequest.Body.ClearBody;
  RESTRequest.method := rmGET;

  try
    RESTRequest.Execute;
    doFeedbackForAPI('Header', 'JSON', RESTResponse.headers.Text, RESTResponse.content);
    if (RESTResponse.content = '') or (RESTResponse.StatusCode <> 200) then
      setError(bError, '[error:' + inttostr(RESTResponse.StatusCode) + ']' + #13 + RESTResponse.content)
    else
      result := ParseJSonValue_genericSingle(RESTResponse.JSONValue, 'dst');
  except
    on E: exception do
      setError(bError, getRes('HTTPError') + #13 + E.Message);
  end;
end;

// ===================================
// googleAPI class
// ===================================

constructor TgoogleTranslator.Create(AOwner: Tcomponent);
begin
  inherited;
  apiId := 5;
end;

function TgoogleTranslator.parseJSon(content: TJSONValue): string;
var
  JSONItems: TJSONArray;
  CountItems, i: integer;
begin
  JSONItems := content.GetValue<TJSONArray>('[0]');
  CountItems := JSONItems.count;
  result := '';
  for i := 0 to CountItems - 1 do
    result := result + JSONItems.Items[i].GetValue<string>('[0]');
end;

function TgoogleTranslator.Translate(Text: string; const source, dest: String; var charCount: integer): string;
var
  URL: string;
begin
  result := '';
  Text := paramEncodeEx(Text);
  charCount := length(Text);
  URL := format(apiData.Urldata.Values['google_ApiUrl'], [source, dest, Text]);
  RESTRequest.Params.Clear;
  RESTRequest.Body.ClearBody;
  RESTRequest.method := rmGET;
  RESTClient.BaseURL := URL;
  try
    RESTRequest.Execute;
    doFeedbackForAPI('Header', 'JSON', RESTResponse.headers.Text, RESTResponse.content);
    if (RESTResponse.content = '') or (RESTResponse.StatusCode <> 200) then
      setError(bError, '[error:' + inttostr(RESTResponse.StatusCode) + ']' + #13 + RESTResponse.content)
    else
      result := parseJSon(RESTResponse.JSONValue);
  except
    on E: exception do
      setError(bError, getRes('HTTPError') + #13 + E.Message);
  end;
end;

// ===================================
// MSTranslator class
// ===================================
constructor TmsTranslator.Create(AOwner: Tcomponent);
begin
  inherited;
  apiId := 0;
end;

procedure TmsTranslator.SetCredentials(const secretId: string);
begin
  fClientSecret := secretId;
end;

procedure TmsTranslator.Translate(l: tstringlist; source, dest: string; var charCount: integer);
var
  URL: string;
  param: TRESTRequestParameter;

var
  i: integer;
begin
  charCount := 0;
  URL := format(apiData.Urldata.Values['MsTranslate_ApiUrl'], [source, dest]);

  RESTClient.BaseURL := URL;
  RESTRequest.Params.Clear;
  RESTRequest.Body.ClearBody;
  RESTRequest.method := rmPOST;

  param := RESTRequest.Params.AddHeader(OcpApimSubscriptionKeyHeader, fClientSecret);
  param.ContentType := TRESTContentType.ctNone;
  param.Kind := TRESTRequestParameterKind.pkHTTPHEADER;
  // - parsing query
  RESTRequest.Body.JSONWriter.WriteStartArray;
  for i := 0 to l.count - 1 do
  begin
    RESTRequest.Body.JSONWriter.WriteStartObject;
    RESTRequest.Body.JSONWriter.WritePropertyName('text');
    RESTRequest.Body.JSONWriter.WriteValue(l[i]);
    charCount := charCount + length(l[i]);
    RESTRequest.Body.JSONWriter.WriteEndObject;
  end;
  RESTRequest.Body.JSONWriter.WriteEndArray;
  // -
  try
    RESTRequest.Execute;
    doFeedbackForAPI('Header', 'JSON', RESTResponse.headers.Text, RESTResponse.content);
    if (RESTResponse.content = '') or (RESTResponse.StatusCode <> 200) then
      setError(bError, '[error:' + inttostr(RESTResponse.StatusCode) + ']' + #13 + RESTResponse.content)
    else
      ParseJSonValue_generic(l, RESTResponse.JSONValue, 'text');
  except
    on E: exception do
      setError(bError, getRes('HTTPError') + #13 + E.Message);
  end;
end;

// ===================================
// DeeplTranslator class
// ===================================
constructor TDeepLTranslator.Create(AOwner: Tcomponent);
begin
  inherited;
  apiId := 6;
end;

procedure TDeepLTranslator.SetCredentials(const secretId: string);
begin
  fClientSecret := secretId;
end;

procedure TDeepLTranslator.Translate(l: tstringlist; source, dest: string; var charCount: integer);
var
  URL: string;
  i: integer;
  TextQuery: string;
  // param: TRESTRequestParameter;
begin
  charCount := 0;

  if lowercase(fClientSecret).endswith(':fx') then
    URL := format(apiData.Urldata.Values['DeepL_ApiUrl'], [fClientSecret, source, dest])
  else
    URL := format(apiData.Urldata.Values['DeepL_ProApiUrl'], [fClientSecret, source, dest]);
  RESTRequest.Params.Clear;
  RESTRequest.Body.ClearBody;
  RESTRequest.method := rmPOST;
  // - parsing query
  TextQuery := '';
  for i := 0 to l.count - 1 do
  begin
    TextQuery := TextQuery + '&text=' + paramEncodeEx(l[i]);
    charCount := charCount + length(l[i]);
  end;

  URL := StringReplace(URL, '{text}', TextQuery, [rfReplaceAll, rfIgnoreCase]);
  RESTClient.BaseURL := URL;

  try
    RESTRequest.Execute;
    doFeedbackForAPI('Header', 'JSON', RESTResponse.headers.Text, RESTResponse.content);
    if (RESTResponse.content = '') or (RESTResponse.StatusCode <> 200) then
    begin
      case RESTResponse.StatusCode of
        429: setError(bError, '[error:' + inttostr(RESTResponse.StatusCode) + ']' + #13 + getRes('deepl_error429'));
        456: setError(bError, '[error:' + inttostr(RESTResponse.StatusCode) + ']' + #13 + getRes('deepl_error456'));
      else setError(bError, '[error:' + inttostr(RESTResponse.StatusCode) + ']' + #13 + RESTResponse.content)
      end
    end
    else
      ParseJSonValue_generic(l, RESTResponse.JSONValue, 'text');
  except
    on E: exception do
      setError(bError, getRes('HTTPError') + #13 + E.Message);
  end;
end;

// ==================================================
// Call to defined Api
// ==================================================
function msTranslationArray(l: tstringlist): integer;
var
  MSV3: TmsTranslator;
  charCount: integer;
begin
  result := 0;
  MSV3 := TmsTranslator.Create(nil);
  try
    try
      MSV3.SetCredentials(apiData.aPreferencesApi.Values['MsTranslate_AzureClientSecret']);
      MSV3.Translate(l, apiData.source[MSV3.apiId], apiData.dest[MSV3.apiId], charCount);
      if not MSV3.bError then
      begin
        apiData.aPreferencesApi.valueIntAdd('MsTranslate_RequestCount', 1);
        apiData.aPreferencesApi.valueIntAdd('MsTranslate_CharCount', charCount);
        result := 1;
      end
      else
        dofeedback(MSV3.sLastError, true, [askPanel]);
    except
    end;
  finally
    MSV3.free;
  end;
end;

function DeeplTranslationArray(l: tstringlist): integer;
var
  Deepl: TDeepLTranslator;
  charCount: integer;
begin
  result := 0;
  Deepl := TDeepLTranslator.Create(nil);
  try
    try
      Deepl.SetCredentials(apiData.aPreferencesApi.Values['DeepL_Key']);
      Deepl.Translate(l, apiData.source[Deepl.apiId], apiData.dest[Deepl.apiId], charCount);
      if not Deepl.bError then
      begin
        apiData.aPreferencesApi.valueIntAdd('DeepL_RequestCount', 1);
        apiData.aPreferencesApi.valueIntAdd('DeepL_CharCount', charCount);
        result := 1;
      end
      else
        dofeedback(Deepl.sLastError, true, [askPanel]);
    except
    end;
  finally
    Deepl.free;
  end;
end;

// -
function fixVirtualArray(s, suf: string): string;
begin
  if not s.endswith(suf) then
    result := s + suf
  else
    result := s;
end;

function GoogleTranslationArray(l: tstringlist): integer; // freegoogle = only lengh = 1
var
  charCount, i: integer;
  googleApi: TgoogleTranslator;
  textOut, TextIn: string;
begin
  // result = -1, nomatch error
  // result =0, api error
  // result =1, ok

  result := 0;
  if l.count = 0 then
    exit;

  textOut := '';
  if l.count = 1 then
    textOut := l[0]
  else
  begin
    for i := 0 to l.count - 2 do
      textOut := textOut + l[i] + sstLineBreak;
    textOut := textOut + l[l.count - 1];
    // add latest line without linebreak;
  end;

  googleApi := TgoogleTranslator.Create(nil);
  try
    TextIn := googleApi.Translate(textOut, apiData.source[googleApi.apiId], apiData.dest[googleApi.apiId], charCount);
    if not googleApi.bError then
    begin
      apiData.aPreferencesApi.valueIntAdd('google_RequestCount', 1);
      apiData.aPreferencesApi.valueIntAdd('google_CharCount', charCount);
      if l.count = 1 then
      begin
        l[0] := TextIn;
        result := 1;
      end
      else
      begin
        // if ExtractArrayStrings(fixVirtualArray(TextIn, ArrayChar_suf), ArrayChar_Parse, l) then
        if ExtractArrayStrings(TextIn, CRLFPattern, l) then
          result := 1
        else
        begin
          dofeedback(getRes('Fbk_VirtualArrayNoMatch'));
          result := -1;
        end;
        doFeedbackForAPI('TxtOut', 'TxtIn', textOut, TextIn);
      end;
    end
    else
      dofeedback(googleApi.sLastError, true, [askPanel]);
  finally
    googleApi.free;
  end;
end;

// Deprecated aarray api
function yandexTranslationArray(l: tstringlist): boolean;
begin
  result := false;
end;

// -----------OpenAI
function OpenAITranslationArray(l: tstringlist): integer;
var
  charCount, i: integer;
  OpenAI: TOpenAITranslator;
  textOut, TextIn: string;
begin
  // result = -1, nomatch error
  // result =0, api error
  // result =1, ok

  result := 0;
  if l.count = 0 then
    exit;

  textOut := '';
  if l.count = 1 then
    textOut := l[0]
  else
  begin
    for i := 0 to l.count - 2 do
      textOut := textOut + l[i] + sstLineBreak;
    textOut := textOut + l[l.count - 1];
    // add latest line without linebreak;
  end;

  OpenAI := TOpenAITranslator.Create(nil);
  OpenAI.SetCredentials(apiData.aPreferencesApi.Values['OpenAI_Key']);
  try
    TextIn := OpenAI.Translate(textOut, apiData.source[OpenAI.apiId], apiData.dest[OpenAI.apiId], charCount);
    if not OpenAI.bError then
    begin
      apiData.aPreferencesApi.valueIntAdd('OpenAI_RequestCount', 1);
      apiData.aPreferencesApi.valueIntAdd('OpenAI_CharCount', charCount);
      if l.count = 1 then
      begin
        l[0] := TextIn;
        result := 1;
      end
      else
      begin
        if ExtractArrayStrings(TextIn, CRLFPattern, l) then
          result := 1
        else
        begin
          dofeedback(getRes('Fbk_VirtualArrayNoMatch'));
          result := -1;
        end;
        doFeedbackForAPI('TxtOut', 'TxtIn', textOut, TextIn);
      end;
    end
    else
      dofeedback(OpenAI.sLastError, true, [askPanel]);
  finally
    OpenAI.free;
  end;
end;

// --------------Simple translate-----------

function msTranslation(var Text: string; var apiId: integer): boolean;
var
  charCount: integer;
  MSV3: TmsTranslator;
  l: tstringlist;
begin
  result := false;
  apiId := 0;
  if not apiData.validateApiTranslation(Text, apiId) then
    exit;
  l := tstringlist.Create;
  l.add(Text);
  MSV3 := TmsTranslator.Create(nil);
  MSV3.SetCredentials(apiData.aPreferencesApi.Values['MsTranslate_AzureClientSecret']);
  try
    MSV3.Translate(l, apiData.source[MSV3.apiId], apiData.dest[MSV3.apiId], charCount);
    if not MSV3.bError then
    begin
      Text := l[0];
      apiData.aPreferencesApi.valueIntAdd('MsTranslate_RequestCount', 1);
      apiData.aPreferencesApi.valueIntAdd('MsTranslate_CharCount', charCount);
      result := true;
    end
    else
      dofeedback(MSV3.sLastError, true, [askAuto]);
  finally
    l.free;
    MSV3.free;
  end;
end;

function DeepLTranslation(var Text: string; var apiId: integer): boolean;
var
  charCount: integer;
  Deepl: TDeepLTranslator;
  l: tstringlist;
begin
  result := false;
  apiId := 6;
  if not apiData.validateApiTranslation(Text, apiId) then
    exit;
  l := tstringlist.Create;
  l.add(Text);
  Deepl := TDeepLTranslator.Create(nil);
  Deepl.SetCredentials(apiData.aPreferencesApi.Values['DeepL_Key']);
  try
    Deepl.Translate(l, apiData.source[Deepl.apiId], apiData.dest[Deepl.apiId], charCount);
    if not Deepl.bError then
    begin
      Text := l[0];
      apiData.aPreferencesApi.valueIntAdd('DeepL_RequestCount', 1);
      apiData.aPreferencesApi.valueIntAdd('DeepL_CharCount', charCount);
      result := true;
    end
    else
      dofeedback(Deepl.sLastError, true, [askAuto]);
  finally
    l.free;
    Deepl.free;
  end;
end;

function googleTranslation(var Text: string; var apiId: integer): boolean;
var
  charCount: integer;
  googleApi: TgoogleTranslator;
begin
  result := false;
  apiId := 5;
  if not apiData.validateApiTranslation(Text, apiId) then
    exit;
  googleApi := TgoogleTranslator.Create(nil);
  try
    Text := googleApi.Translate(Text, apiData.source[googleApi.apiId], apiData.dest[googleApi.apiId], charCount);

    if not googleApi.bError then
    begin
      apiData.aPreferencesApi.valueIntAdd('google_RequestCount', 1);
      apiData.aPreferencesApi.valueIntAdd('google_CharCount', charCount);
      result := true;
    end
    else
      dofeedback(googleApi.sLastError, true, [askAuto]);
  finally
    googleApi.free;
  end;
end;

function OpenAITranslation(var Text: string; var apiId: integer): boolean;
var
  charCount: integer;
  OpenAI: TOpenAITranslator;
begin
  result := false;
  apiId := 7;
  if not apiData.validateApiTranslation(Text, apiId) then
    exit;
  OpenAI := TOpenAITranslator.Create(nil);
  OpenAI.SetCredentials(apiData.aPreferencesApi.Values['OpenAI_Key']);
  try
    Text := OpenAI.Translate(Text, apiData.source[OpenAI.apiId], apiData.dest[OpenAI.apiId], charCount);

    if not OpenAI.bError then
    begin
      apiData.aPreferencesApi.valueIntAdd('OpenAI_RequestCount', 1);
      apiData.aPreferencesApi.valueIntAdd('OpenAI_CharCount', charCount);
      result := true;
    end
    else
      dofeedback(OpenAI.sLastError, true, [askAuto]);
  finally
    OpenAI.free;
  end;
end;

function youdaoApiTranslation(var Text: string; var apiId: integer): boolean;
var
  charCount: integer;
  youdao: TyoudaoTranslator;
begin
  result := false;
  apiId := 3;
  if not apiData.validateApiTranslation(Text, apiId) then
    exit;
  youdao := TyoudaoTranslator.Create(nil);
  youdao.SetCredentials(apiData.aPreferencesApi.Values['Youdao_AppId'], apiData.aPreferencesApi.Values['Youdao_SecretKey']);
  try
    Text := youdao.Translate(Text, apiData.source[youdao.apiId], apiData.dest[youdao.apiId], charCount);

    if not youdao.bError then
    begin
      apiData.aPreferencesApi.valueIntAdd('Youdao_RequestCount', 1);
      apiData.aPreferencesApi.valueIntAdd('Youdao_CharCount', charCount);
      result := true;
    end
    else
      dofeedback(youdao.sLastError, true, [askAuto]);
  finally
    youdao.free;
  end;
end;

function baiduApiTranslation(var Text: string; var apiId: integer): boolean;
var
  charCount: integer;
  baidu: TbaiduTranslator;
begin
  result := false;
  apiId := 2;
  if not apiData.validateApiTranslation(Text, apiId) then
    exit;
  baidu := TbaiduTranslator.Create(nil);
  baidu.SetCredentials(apiData.aPreferencesApi.Values['Baidu_AppId'], apiData.aPreferencesApi.Values['Baidu_Key']);
  try
    Text := baidu.Translate(Text, apiData.source[baidu.apiId], apiData.dest[baidu.apiId], charCount);
    if not baidu.bError then
    begin
      apiData.aPreferencesApi.valueIntAdd('Baidu_RequestCount', 1);
      apiData.aPreferencesApi.valueIntAdd('Baidu_CharCount', charCount);
      result := true;
    end
    else
      dofeedback(baidu.sLastError, true, [askAuto]);
  finally
    baidu.free;
  end;
end;

// Deprecated apis
function freeApiTranslation(var Text: string; var apiId: integer): boolean;
begin
  result := false;
  apiId := 4;
end;

function yandexTranslation(var Text: string; var apiId: integer): boolean;

begin
  result := false;
  apiId := 1;
end;

// ===================================
// OPENAI class
// ===================================
constructor TOpenAITranslator.Create(AOwner: Tcomponent);
begin
  inherited;
  apiId := 7;
end;

procedure TOpenAITranslator.SetCredentials(const secretId: string);
begin
  fClientSecret := secretId;
end;

function TOpenAITranslator.parseJSon(content: TJSONValue): string;
var
  LStringReader: TStringReader;
  LJsonReader: TJsonReader;
begin
  result := '';
  LStringReader := TStringReader.Create(content.tostring);
  LJsonReader := TJsonTextReader.Create(LStringReader);
  try
    try
      while LJsonReader.read do
        if LJsonReader.path = 'choices[0].message.content' then
        begin
          result := content.GetValue<string>(LJsonReader.path);
          break;
        end;
    except
    end;
  finally
    LStringReader.free;
    LJsonReader.free;
  end;
end;

function TOpenAITranslator.Translate(Text: string; const source, dest: String; var charCount: integer): string;
var
  altParam, URL, sModel, sQuery: string;
  param: TRESTRequestParameter;

  JSONObject, MessageObj: TJSONObject;
  JSONArray: TJSONArray;
begin
  result := '';
  charCount := length(Text);

  // Url
  altParam := trim(apiData.aPreferencesApi.Values['OpenAI_Url']);
  if altParam <> '' then
    URL := altParam
  else
    URL := apiData.Urldata.Values['OpenAI_ApiURL'];

  // Model
  altParam := trim(apiData.aPreferencesApi.Values['OpenAI_Model']);
  if altParam <> '' then
    sModel := altParam
  else
    sModel := apiData.Urldata.Values['OpenAI_Model0'];

  // Query
  altParam := trim(apiData.aPreferencesApi.Values['OpenAI_Query']);
  if altParam <> '' then
    sQuery := altParam
  else
    sQuery := apiData.Urldata.Values['OpenAI_DefaultQuery'];

  sQuery := StringReplace(sQuery, '%lang_dest%', dest, [rfReplaceAll]);
  sQuery := StringReplace(sQuery, '%lang_source%', source, [rfReplaceAll]);

  RESTRequest.Params.Clear;
  RESTRequest.Body.ClearBody;
  RESTRequest.method := rmPOST;
  RESTClient.BaseURL := URL;

  param := RESTRequest.Params.AddHeader('Authorization', 'Bearer ' + fClientSecret);
  param.Options := [poDoNotEncode];

  // build Json query
  JSONObject := TJSONObject.Create;
  MessageObj := TJSONObject.Create;
  JSONArray := TJSONArray.Create;
  try
    JSONObject.AddPair('model', sModel);
    MessageObj.AddPair('role', 'user');
    MessageObj.AddPair('content', sQuery + sstLineBreak + Text);
    JSONArray.add(MessageObj);
    JSONObject.AddPair('messages', JSONArray);

    RESTRequest.Params.AddBody(JSONObject.tostring, TRESTContentType.ctAPPLICATION_JSON);
  finally
    JSONObject.free;
  end;

  try
    RESTRequest.Execute;
    doFeedbackForAPI('Header', 'JSON', RESTResponse.headers.Text, RESTResponse.content);
    if (RESTResponse.content = '') or (RESTResponse.StatusCode <> 200) then
      setError(bError, '[error:' + inttostr(RESTResponse.StatusCode) + ']' + #13 + RESTResponse.content)
    else
      result := parseJSon(RESTResponse.JSONValue);
  except
    on E: exception do
      setError(bError, getRes('HTTPError') + #13 + E.Message);
  end;
end;

end.
