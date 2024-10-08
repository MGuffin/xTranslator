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
unit TESVT_Const; // global definitions and utils

interface

{$I _config.inc}

uses forms, classes, virtualtrees, stdCtrls, ExtCtrls, types, math, graphics, Menus, Dialogs, windows, registry, sysutils, ComCtrls, stdActns,
  controls, TESVT_Dialog, HTMLUn2, HtmlView, shellApi, regularexpressions, RegularExpressionsCore, TESVT_Startup, TESVT_Input, FolderUtil;

type
  sHeaderSig = array [0 .. 3] of AnsiChar;

  tAlist = array [0 .. 2] of tlist;

  sTESVTMode = (sTESVTNone, sTESVTsstCustom, sTESVTsstEdit, sTESVStrings, sTESVEsp, sTESVEspStrings, sTESVMCM, sTESVPex);

  rwindowpos = record
    width, height, top, left: integer;
    Control1, list2, list3: integer;
  end;

  aCharArray = array of char;
  aCardinal = array of cardinal;
  aaCardinal = array [0 .. 1] of array of cardinal;

  PCardinalRec = ^TCardinalRec;

  // use:   PCardinalRec(@c)^.Byte1
  TCardinalRec = packed record
    Byte1, Byte2, Byte3, Byte4: byte;
  end;

  tGlobalTreeUpdate = procedure(var t: TVirtualStringTree; const level: integer = 0);

  tPrefsArray = array [0 .. 15] of integer;
  pPrefsArray = ^tPrefsArray;

  sAskDialButton = (askYes, askNo, askOK, askCancel, askAuto, askPanel);
  sAskDialButtons = set of sAskDialButton;

  TStringArray = array of string;
  pStringArray = ^TStringArray;

  rFileData = record
    fPath: string;
    fPathSlash: string;
    fName: string;
    fExt: string; // extension
    fLang: string; // name w/o language part
    fLangDest: string; // language Out used to parse SST
    fNameStrict: string; // name w/o language part
  end;

  rRecentData = record
    fNameFull: string;
    fNameFile: string;
    fNameFolder: string;
    fNameType: string;
    fType: integer;
  end;

  rGameParams = record
    sQUSTDIALRef: sHeaderSig;
    sMiscCMPORef: sHeaderSig;
    sHeaderCMPORef: sHeaderSig;
    iCompoDataSize: integer;
  end;

  rcustomTxtDefinition = record
    sRegex: string;
    sLabel: string;
    eEncoding: tencoding;
    sRestrictExt: string;
    bRestrictExt: boolean;
    bIsFallback: boolean;
    bSearchByLine: boolean;
    iIdBackref: integer;
    bUseSaveLangSuffixe: boolean;
    stats: integer;
  end;

  pcustomTxtDefinition = ^rcustomTxtDefinition;

  tCustomTxt = class
  private
    lCustomTxtParamList: tlist;
    ifallback: integer;
    procedure incStat(i: integer);
    procedure resetstat;
  public
    sCustomExtList: string;
    constructor Create(l: tstringList);
    destructor Destroy; override;
    function getRegex(i: integer): string;
    function getrefId(i: integer): integer;
    function getLabel(i: integer): string;
    function getEncoding(i: integer): tencoding;
    function mcmDecider(f: tstringList): integer;
    function isValidTxtExt(ext: string): boolean;
    function isSearchByLine(i: integer): boolean;
    function isFallback(i: integer): boolean;
    function useSuffixe(i: integer): boolean;
  end;

const
  // ============================================================
  basePROG_NAME: string = 'xTranslator';
{$IFDEF WIN64}
  basePROG_compil: string = '(x64)';
{$ELSE}
  basePROG_compil: string = '(x32)';
{$ENDIF}
  aPROG_NAME: array [0 .. 5] of string = ('Fallout4', 'Skyrim', 'FalloutNV', 'SkyrimSE', 'Fallout76', 'Starfield');
  aPROG_CURRENTVERSION = 'v1.6.0';

{$IFDEF DEBUG}
{$IFDEF TES4FORMAT}
  aPROG_COMPILINFO = ' [Debug]';
{$ELSE TES4FORMAT}
  aPROG_COMPILINFO = ' [Oblivion+Debug]';
{$ENDIF TES4FORMAT}
{$ELSE DEBUG}
{$IFDEF TES4FORMAT}
  aPROG_COMPILINFO = '';
{$ELSE TES4FORMAT}
  aPROG_COMPILINFO = ' [Oblivion]';
{$ENDIF TES4FORMAT}
{$ENDIF DEBUG}
  // ============================================================
  AuthorName = 'McGuffin @ <a href="https://www.nexusmods.com/skyrimspecialedition/users/3408338">Nexus</a>';
  ABOUTDATA = '<div align="center"><p><b>%s</b></p><p>%s</p><p>%s</p></div>';
  // ============================================================
  VocabUserHeader: cardinal = $32555353; // fileHeader SSU2 user
  VocabUserHeader2: cardinal = $33555353; // fileHeader SSU3 user
  VocabUserHeader3: cardinal = $34555353; // fileHeader SSU4 user
  VocabUserHeader4: cardinal = $35555353; // fileHeader SSU5 user
  VocabUserHeader5: cardinal = $36555353; // fileHeader SSU6 user    v5 = real edidHash
  VocabUserHeader6: cardinal = $37555353; // fileHeader SSU6 user    v6 =  + Id for colab Work
  VocabUserHeader7: cardinal = $38555353; // fileHeader SSU6 user    v7 =  + Label for colabID
  VocabUserHeader8: cardinal = $39555353; // fileHeader SSU7 user    v8 =  Masterlist in sst
  // ============================================================
  // 'Fallout4', 'Skyrim', 'FalloutNV', 'SkyrimSE', 'Fallout76', 'Starfield'
  datacacheVersionByGame: array [0 .. 5] of string = ('5', '4', '1', '4', '5', '7');
  // ============================================================

  aTheme: array [0 .. 3] of string = ('Windows', 'Obsidian', 'Light', 'Slate Classico');
  aThemeDarkPercentUI: array [0 .. 3] of integer = (0, 25, 5, 15);

  strList: array [0 .. 2] of String = ('.strings', '.dlstrings', '.ilstrings');
  strListLabel: array [0 .. 2] of String = ('STRINGS', 'DLSTRINGS', 'ILSTRINGS');
  aShortThreshold: array [0 .. 2] of integer = (1000, 1500, 1000);
  iLDDistanceMax = 30;

  HashSalt = '';

  baseAltTranslator1: string = 'EspTranslator';

  MAXCOLAB_ID = 88;

  proxybaseRatio: double = 0.05;

  PageControl_Heuristic = 2;
  PageControl_Pex = 4;
  PageControl_Quest = 5;
  PageControl_Fuz = 6;
  PageControl_Log = 8;

  sSlash: char = '/';
  saSlash: char = '\';
  sBar: char = '|';
  htmlBR: string = '<br>';
  sFolderInArchiveAll: array [0 .. 2] of String = ('interface', 'scripts', 'strings');
  sExtInArchiveAll: array [0 .. 2] of String = ('.txt', '.pex', '.strings');
  sModeLabel: array [0 .. 7] of string = ('None', 'sstEditCustom', 'sstViewEdit', 'Strings', 'Esp', 'Strings+ EspLayout', 'MCMTranslate', 'ScriptPex');
  sModOpenType: array [0 .. 5] of string = ('---', 'Esp', 'Pex', 'Str', 'McM', 'SST');
  sModChanged: array [0 .. 1] of string = ('', '*');

  // ==================== devtoolflags ====================
  bCountCompressedData = false; // true to get a feedback about compressed data when loading a mod
  bKeepAllRecordHeaders = false; // true to keep all records in fastlist; (except excluded ones)
  bInitLocStringAtStart = false; // true to force localized SkyStr initialization on load
  bUseRecentFileOwnerDraw = false; // use OwnerDraw for the recen file menu
  bForceKeepAllRecAndField = false; // set to true keep all fields data (no rawrecord, except hardcoded Ignored)
  bLocalizedLoadAll = false; // set to true to fully load all localized esm
  bForceEsmDeloc = false; // force Localized esm to be treated as delocalized. Only for integrity testing. *Never* export anything if True.
  bSaveSizeList: boolean = false; // switch to true to run the length benchmark
  bUseRecorddef: boolean = true; // use recorddef.txt file override
  bKeepOldData: boolean = true; // force loader to keep unused data from SST and store them in SST on save
  bDeleteLookUpfailed: boolean = false; // dont keep lookupfail strings;
  bWriteEmoteKeyWord: boolean = false; // set to true to export animKeyWordList
  bGetVMADStringsFromLocalized: boolean = false; // set to true to analyse VMAD on localized esm (devtest)
  bDevDontInjectAllScripts: boolean = true; // if true, don't try to inject scripts with no editable strings.
  bWarnForUnconsistentFormIDVersion: boolean = false; // if true, shows a warning if some records version doesnt match the master version.
  bAskQuickLoad: boolean = false; // true to open a quick forcecodepage on wrong workSpace
  bReadDoFUtf8Fallback: boolean = true; // Activate the Utf8Fallback
  bTagBatchedFiles: boolean = true; // tag Esp files that have been bathced in the wizard
  bAnalyzeOrphanString = false; // set to true to activate orphan loop search (enter data in getFieldfromBuffer function in espDefinition.pas
  cOrphanID1: cardinal = $6100F297; // enter here value of string ID to search. Occurence 1
  cOrphanID2: cardinal = $6100F298; // enter here value of string ID to search. Occurence 2
  cOrphanID3: cardinal = $39294874; // enter here value of string ID to search. Occurence 3
  cOrphanID4: cardinal = $610120A0; // enter here value of string ID to search. Occurence 4
  AUTH_SAME_LANGUAGE_EDITING = true; // authorize samelanguage dictionaries

var
  bUseQuickVocabLoading: boolean = true; // use fast loading for vocabulary (1.4.4+)
  bCleanFuz: boolean = true; // cleanup usused fuz (slow)
  bHideDicOnSearch: boolean = true; // hide dictionaries when searching in vocabulary tab
  iUseAutosaveDelay: integer = 0; // toggle the updatecache on savefile  0= disabled. 9000000 =15mn
  bUseDialFromScene: boolean = true; // activate Scene sorting in Dialog view
  bApplySstOldMasterFix: boolean = true; // Normalize FormiD in dictionaries for record without Edidname (typically: INFO:NAM1)
  bUseHeuristicRefRec: boolean = false; // use rec:field references for heuristic translation

  debugerror: integer = 0;
  iCompressedRecords: integer = 0;
  iCompressedGain: int64 = 0;
  // =====================================================

const
  STARTUPPREFS_FILE = 'startup.ini';
  USERPREFS_FILE = 'prefs.ini';
  USERPREFS_Vocab_FILE = 'prefs_vocab_';
  USERPREFS_VocabDisabled_FILE = 'prefs_vocabDisabled_';
  USERPREFS_Vocab_Ext = '.ini';
  aPluginTypeName: array [0 .. 3] of string = ('Normal', 'Small', 'Esl', 'Medium');

  USERPREFS_VmadFile_FILE = 'Prefs_vmad.ini';
  USERPREFSCOMMON_FILE = 'commonPrefs.ini';
  RECORDSFILENAME_FILE = '_recorddefs.txt';
  RECORDSIZEMAXNAME_FILE = 'fieldSizeRef.txt';
  VOCABFILENAME_FILE = 'vocabulary.txt';
  CODEPAGEFILENAME_FILE = 'codepage.txt';
  PEXNOTRANSPROCNAME_FILE = 'pexNoTransProc.txt';
  EMOTEEXPORTFILE_FILE = 'EmoteDefinition.txt';
  CTDAFUNC_FILE = 'ctdaFunc.txt';
  DIALSUBTYPE_FILE = 'DialSubType.txt';
  DEFAULT_RES_FILE = 'Res.ini';
  FALLBACK_RES_FILE = 'english\Res.ini';
  apiDataListName = 'ApiTranslator.txt';
  HeaderWizardIni = 'HeaderWizard.ini';
  wordExceptionFile = 'ToolBox_WordExceptions.txt';
  HeaderProcessorFolder = 'HeaderProcessor\';
  customTxtDefinition = 'customTxtDefinition.txt';

  // ----------------------------------
  STARTUP_INI_VALUES: array [0 .. 8] of String = ('Fallout4', 'Skyrim', 'FalloutNV', 'LastUsed', 'AskDialog', 'ExeName', 'SkyrimSE', 'Fallout76', 'Starfield');
  STARTUP_INI_VALUES_BYGAME: array [0 .. 5] of integer = (0, 1, 2, 6, 7, 8);
  CURRENT_GAME_ID_ICON: array [0 .. 5] of integer = (63, 64, 65, 70, 81, 30);
  // ----------------
  sstreadme = '..\common\sstreadme.htm';
  sstDocManual = 'manual.htm';
  HTM_HEADER = 'header.tpl';
  searchImageID: array [0 .. 3] of integer = (26, 25, 17, 68);
  searchImageHINT: array [0 .. 3] of string = ('Hint_SearchSource', 'Hint_SearchDest', 'Hint_SearchEdid', 'hint_searchRecField');

  miscPath = 'misc\';
  batchPath = 'batch\';
  BatchprocessorPath = 'batchprocessor\';
  customPath = 'custom\';
  oldDialogStyle_ = 'oldDialogStyle_';
  sTxtExt = '.txt';

  edidColumnSize = 200;
  colCatchhint = 50;

  // fallout/starfield special extra LGDI/INNR KeyWord
  fVirtualKwdLGDIKwdId = $00FFFFF0;
  fVirtualKwdLGDIKwdName = '@@xKWD:LegendaryKwd';
  fVirtualKwdINNRKwdId: array [0 .. 9] of cardinal = ($00FFFFF1, $00FFFFF2, $00FFFFF3, $00FFFFF4, $00FFFFF5, $00FFFFF6, $00FFFFF7, $00FFFFF8, $00FFFFF9, $00FFFFFA);
  fVirtualKwdINNRKwdName: array [0 .. 9] of string = ('@@xKWD:INNRgrp_0', '@@xKWD:INNRgrp_1', '@@xKWD:INNRgrp_2', '@@xKWD:INNRgrp_3', '@@xKWD:INNRgrp_4', '@@xKWD:INNRgrp_5',
    '@@xKWD:INNRgrp_6', '@@xKWD:INNRgrp_7', '@@xKWD:INNRgrp_8', '@@xKWD:_INNRgrp_9');
  fVirtualKwdDataValue: array [0 .. 3] of cardinal = ($00FFFFFB, $00FFFFFC, $00FFFFFD, $00FFFFFE);
  fVirtualKwdDataValueName: array [0 .. 3] of string = ('@@DATA:Value500', '@@DATA:Value1000', '@@DATA:Value2000', '@@DATA:Value4000');

  //
  defaultvirtualTreeFont = 'Tahoma';
  defaultvirtualTreeFixedFont = 'Courier new';
  defaultHeaderComponentFont = 'Tahoma';
  defaultvirtualTreeFontSize = 10;
  defaultSynFont = 'Courier New';
  defaultSynFontSize = 10;
  additionalRecMargin = 3;
  SPLITSIZETTHRESHOLD = 650;
  MAXLINEINTREE = 3;
  MAXSIZESTRING_IN_TREE: array [0 .. 1] of integer = (MAXLINEINTREE * 100, 150); // use: MAXSIZESTRING_IN_TREE[ord(bVTSimpleLine)];
  MAXSIZESTRING_IN_TREE_FOR_SORT = 30;
  LONGTEXTTHRESHOLD = 200;
  MAXSIZESTRING_IN_HARDCAP = 2000;
  MAXSIZESTRING_GLOBALCAP: cardinal = 00900000; // (940ko)
  MAXSIZESTRING_GLOBALCAP_LOW: Word = $8FFF;
  MAXSIZESTRING_TES4_CNAM: Word = 512;
  MAXSIZESTRING_TES4_SNAM: Word = $8FFF;
  ENDING_DOTS: string = '...';
  cEmptyStringColor = $00CC6666;
  xtHrTag: string = '{xtHR}';
  sstLineBreak = AnsiString(#13#10);
  BuildIdMaxPerAddon = 200000; // for each addon in vocablist
  replacePattern: array [0 .. 2] of string = (sstLineBreak, #10, '[pagebreak]');
  mcmExt = '_mcm';
  pexExt = '_pex';
  MAXRECENTADDON = 10;
  MAXPRESETLANG = 10;
  MAXAUTHCACHE = $FFF;

  SSTCustomfilename = '_userCustomDictionary';
  StringNotFoundPlaceHolder = '<StringNotFound_PlaceHolder %.6x>';

  // ----------------------------------
  aEXE_GAME: Array [0 .. 5] of string = ('fo4translator.exe', //
    'tesvtranslator.exe', //
    'fonvtranslator.exe', //
    'ssetranslator.exe', //
    'f76translator.exe', //
    'sftranslator.exe');
  DATA_BASEFOLDER: string = '\Data\';
  DATACACHE_BASEFOLDER: string = 'Datacache\';
  DATACACHE_EXT: string = '.cache';
  DATACACHE_EXT_ID = '.id.cache';
  DATACACHE_EXT_REF = '.ref.cache';
  DATACACHE_MinSize = $AFFFFF;
  PREFS_BASEFOLDER = 'UserPrefs\';
  USERDIC_BASEFOLDER = 'UserDictionaries\';
  USERDIC_SUBBACKUP = 'Backup\';
  USERDIC_AUTOBACKUP = 'Auto\';
  // CACHE_BASEFOLDER = 'Cache\';
  MY_GAMESFOLDER = '\My Games\';
  MY_DATA_BASEFOLDER: string = 'Data\';
  aGAMES_SUBFOLDER: Array [0 .. 5] of string = ('Fallout4\', 'Skyrim\', 'FalloutNV\', 'SkyrimSE\', 'Fallout76\', 'Starfield\');
  aMY_GAMESNAME_SUBFOLDER: Array [0 .. 5] of string = ('Fallout4\', 'Skyrim\', 'FalloutNV\', 'Skyrim Special Edition\', 'Fallout 76\', 'Starfield\');
  GAME_STRINGS_SUBFOLDER = 'strings\';
  GAME_SCRIPTS_SUBFOLDER = 'scripts\';
  GAME_INTERFACE_SUBFOLDER = 'interface\';
  GAME_INTERFACEMCM_SUBFOLDER = 'interface\translations';
  SPELL_CHECK_PATH = 'spellcheck\';
  SPELL_CHECK_DICPATH = SPELL_CHECK_PATH + 'dictionaries\';
  SPELL_CHECK_IGNORELIST = 'spIgnoreList.txt';
  TOOLFIXEDPATH = 'tools\';
  TMPTOOLSUBFOLDER = 'temp\';
  strBSAfolder = 'strings';
  interfaceBSAfolder = 'interface';
  mcmBSAfolder = 'interface\translations';
  sDefUITagXml = 'Interface\DEF_CONF\DEF_INV_TAGS.xml';
  sDefUITagList_FILE = 'HeaderList.txt';

  strSeparator = '-----------------------------------------------';
  strSeparatorCRLF = strSeparator + sstLineBreak;
  defaultLang_Res = 'English';
  defaultReplacePattern = '[%REPLACE%] %ORIG%';
  pexDrawDebug = false;

  iLoadedFilesThreshold = 5;

  sDEFUIRegEx1: Array [0 .. 5] of string = ('^(.+)\{\{\{.+\}\}\}$', '', '', '', '^(.+)\(.+\)$', '^(.+)\{\{\{.+\}\}\}$');
  sDEFUIRegEx2: string = '^[\[\(\{\|].+?[\|\]\}\)](.+)$';
  sDEFUIOut: Array [0 .. 5] of string = ('%BASE% {{{%COMPOS%}}}', '', '', '', '%BASE% (%COMPOS%)', '%BASE% {{{%COMPOS%}}}');
  sDEFUIwOut: Array [0 .. 5] of string = ('%BASE% {{{%WEIGHT%lb, %COMPOS%}}}', '', '', '', '%BASE% (%WEIGHT%lb, %COMPOS%)', '%BASE% {{{%WEIGHT%lb, %COMPOS%}}}');

  defaultDefUIOptions: Array [0 .. 5] of string = ('bUseSourceForString=False' + sstLineBreak + // *
    'bUseSourceForComponents=True' + sstLineBreak + // *
    'bCleanCompo=True' + sstLineBreak + // *
    'sCleanCompoRegEx=^[\[\(\{\|].+?[\|\]\}\)](.+)$' + sstLineBreak + // *
    'bCleanBase=False' + sstLineBreak + // *
    'sCleanBaseRegEx=^(.+) ?\{\{\{.+\}\}\}$' + sstLineBreak + // *
    'bOverrideHeaderWithCompo=False' + sstLineBreak + // *
    'bQuantityIndicator=True' + sstLineBreak + // *
    'sQuantityIndicator1=+' + sstLineBreak + // *
    'sQuantityIndicator2=++' + sstLineBreak + // *
    'sComponentSeparator=, ' + sstLineBreak + // *
    'bUseComponentFirstChar=False', // *
    '', // *
    '', // *
    '', // *
    'bUseSourceForString=False' + sstLineBreak + // *
    'bUseSourceForComponents=True' + sstLineBreak + // *
    'bCleanCompo=True' + sstLineBreak + // *
    'sCleanCompoRegEx=^[\[\(\{\|].+?[\|\]\}\)](.+)$' + sstLineBreak + // *
    'bCleanBase=False' + sstLineBreak + // *
    'sCleanBaseRegEx=^(.+) \(.+\)$' + sstLineBreak + // *
    'bOverrideHeaderWithCompo=False' + sstLineBreak + // *
    'bQuantityIndicator=True' + sstLineBreak + // *
    'sQuantityIndicator1=+' + sstLineBreak + // *
    'sQuantityIndicator2=++' + sstLineBreak + // *
    'sComponentSeparator=, ' + sstLineBreak + // *
    'bUseComponentFirstChar=False', // *
    // SF
    'bUseSourceForString=False' + sstLineBreak + // *
    'bUseSourceForComponents=True' + sstLineBreak + // *
    'bCleanCompo=True' + sstLineBreak + // *
    'sCleanCompoRegEx=^[\[\(\{\|].+?[\|\]\}\)](.+)$' + sstLineBreak + // *
    'bCleanBase=False' + sstLineBreak + // *
    'sCleanBaseRegEx=^(.+) \(.+\)$' + sstLineBreak + // *
    'bOverrideHeaderWithCompo=False' + sstLineBreak + // *
    'bQuantityIndicator=True' + sstLineBreak + // *
    'sQuantityIndicator1=+' + sstLineBreak + // *
    'sQuantityIndicator2=++' + sstLineBreak + // *
    'sComponentSeparator=, ' + sstLineBreak + // *
    'bUseComponentFirstChar=False' // *
    );

  defaultprocessorSuffixeOptions: Array [0 .. 5] of string = ('sTemplate=%BASE% {{{%COMPOS%}}}' + sstLineBreak + // *
    'bUseSourceForComponents=True' + sstLineBreak + // *
    'bCleanCompo=True' + sstLineBreak + // *
    'sCleanCompoRegEx=^[\[\(\{\|].+?[\|\]\}\)](.+)$' + sstLineBreak + // *
    'bCleanBase=False' + sstLineBreak + // *
    'sCleanBaseRegEx=^(.+) ?\{\{\{.+\}\}\}$' + sstLineBreak + // *
    'bOverrideHeaderWithCompo=False' + sstLineBreak + // *
    'bQuantityIndicator=True' + sstLineBreak + // *
    'sQuantityIndicator1=+' + sstLineBreak + // *
    'sQuantityIndicator2=++' + sstLineBreak + // *
    'sComponentSeparator=, ' + sstLineBreak + // *
    'bUseComponentFirstChar=False', // *
    '', // *
    '', // *
    '', // *
    'sTemplate=%BASE% (%COMPOS%)' + sstLineBreak + 'bUseSourceForComponents=True' + sstLineBreak + // *
    'bCleanCompo=True' + sstLineBreak + // *
    'sCleanCompoRegEx=^[\[\(\{\|].+?[\|\]\}\)](.+)$' + sstLineBreak + // *
    'bCleanBase=False' + sstLineBreak + // *
    'sCleanBaseRegEx=^(.+) \(.+\)$' + sstLineBreak + // *
    'bOverrideHeaderWithCompo=False' + sstLineBreak + // *
    'bQuantityIndicator=True' + sstLineBreak + // *
    'sQuantityIndicator1=+' + sstLineBreak + // *
    'sQuantityIndicator2=++' + sstLineBreak + // *
    'sComponentSeparator=, ' + sstLineBreak + // *
    'bUseComponentFirstChar=False', // *
    // SF
    'sTemplate=%BASE% (%COMPOS%)' + sstLineBreak + 'bUseSourceForComponents=True' + sstLineBreak + // *
    'bCleanCompo=True' + sstLineBreak + // *
    'sCleanCompoRegEx=^[\[\(\{\|].+?[\|\]\}\)](.+)$' + sstLineBreak + // *
    'bCleanBase=False' + sstLineBreak + // *
    'sCleanBaseRegEx=^(.+) \(.+\)$' + sstLineBreak + // *
    'bOverrideHeaderWithCompo=False' + sstLineBreak + // *
    'bQuantityIndicator=True' + sstLineBreak + // *
    'sQuantityIndicator1=+' + sstLineBreak + // *
    'sQuantityIndicator2=++' + sstLineBreak + // *
    'sComponentSeparator=, ' + sstLineBreak + // *
    'bUseComponentFirstChar=False' // *
    );

  sDEFUICleanHeader: string = '^[\[\(\{\|].+?[\|\]\}\)] *(.+)$';
  iDefaultLocOptions: Array [0 .. 5] of integer = (0, 0, 0, 0, 1, 1); // define if string are loaded in bsa first (1)
  sDefaultDEFUIHeader: string = '[Book]' + sstLineBreak + '[Note]' + sstLineBreak + '[Quest]' + sstLineBreak;
  MAXREGEXPREFS = 25;
  MAXREGEXPRESET = $FF;
  ERRORTXT = 'ERROR';
  BSAExportFdbLineLimit = 25;
  StrictStringDataLimit = 100;

  fuzTMPXMW = '~tmp.xwm';
  fuzTMPWEM = '~tmp.wem';
  fuzTMPWAV = '~tmp.wav';

  fuzConvert1 = 'xWMAEncode.exe';
  fuzConvert2 = 'vgmstream-cli.exe';

  fuzLooseFolder = 'sound\voice\';
  aFUZEXT: array [0 .. 1] of string = ('.fuz;.wav;.xwm;.wem', '.ogg');
  aFUZEXTPLAY = '.fuz';
  aWAVEXTPLAY = '.wav';
  aXMWEXTPLAY = '.xwm';
  aWEMEXTPLAY = '.wem';
  // --BIDI---------
  UCODE_START_RTL: char = #$200F;
  UCODE_END_RTL: char = #$200E;
  UCODE_RLE = #$202B;
  UCODE_PDF = #$202C;

  FORBIDDENFILECHAR: array [0 .. 8] of char = ('"', '/', '\', '*', '?', '<', '>', '|', ':');

  ascIISymbols: array [0 .. 32] of string = ('NUL ', 'SOH ', 'STX ', 'ETX ', 'EOT ', 'ENQ ', 'ACK ', 'BEL ', 'BS ', 'TAB ', 'LF ', 'VT ', 'FF ', 'CR ', 'SO ', 'SI ', 'DLE ',
    'DC1 ', 'DC2 ', 'DC3 ', 'DC4 ', 'NAK ', 'SYN ', 'ETB ', 'CAN ', 'EM ', 'SUB ', 'ESC ', 'FS ', 'GS ', 'RS ', 'US ', 'SPACECHAR ');
  aCleanChar: array [0 .. 33] of char = (#0, #1, #2, #3, #4, #5, #6, #7, #8, #9, #10, #11, #12, #13, #14, #15, #16, #17, #18, #19, #20, #21, #22, #23, #24, #25, #26, #26, #28, #29,
    #30, #31, #32, #$3000);
  aSymbols: array [0 .. 4] of char = (',', '-', '.', ':', ';');
  aWhiteChar: array [0 .. 1] of char = (#$0020, #$00A0);
  cWidgetColor: array [1 .. 6] of cardinal = ($00FFFFFF, $00DDBBAA, $00DD77DD, $00AACCAA, $005555FF, $0088DDDD);

  sPunctuation = [#0 .. #31, #33 .. #47, #58 .. #64, #91 .. #96, #123 .. #127];
  sSymbols = [#33 .. #47, #58 .. #59, #63, #64, #91 .. #96, #123 .. #127]; // without <,=,>
  sPunctuationEx = [#0 .. #47, #58 .. #64, #91 .. #96, #123 .. #127];
  sBlank = [#0 .. #32, #160];
  sBracketEx = [#34, #40, #41, #91, #93, #123, #125];
  LBChar = [#10, #13];
  sCleanChar = [#0, #1, #2, #3, #4, #5, #6, #7, #8, #9, #10, #11, #12, #13, #14, #15, #16, #17, #18, #19, #20, #21, #22, #23, #24, #25, #26, #26, #28, #29, #30, #31, #32];
  sHEADERCHAR = ['0' .. 'z'];
  // ---------IDLECONST--------------
  idleVocabStringInitThreshold = 1000;

  EMOTESUBSTR = 'AnimFaceArchetype';
  defaultFUZBSA: string = '^%basename%$' + sstLineBreak + '^%basename% - main$' + sstLineBreak + '^%basename% - voices.*$';
  defaultDerivedRegex: string = '#(header) bakref1' + sstLineBreak + // *
    '^[\[\(\{\|]+.*?[\|\]\}\)]+(.+)$' + sstLineBreak + // *
    '#Delete [()] etc (short word)' + sstLineBreak + // *
    '^[\[\(\{\|]+(\S+)[\|\]\}\)]+$' + sstLineBreak + // *
    '#Delete . or ? (short word)' + sstLineBreak + // *
    '^(\S{2,20}?)[\.\?]+$'; // *

  defaultDefUIIgnoreList: array [0 .. 5] of string = ('', '', '', '', '00135c17' + sstLineBreak + '001cc46a' + sstLineBreak + '0043c439', '');

  DialCategories: array [0 .. 7] of string = ('Topic', 'Favor', 'Scene', 'Combat', 'Favors', 'Detection', 'Service', 'Misc');

  // bsadef
  defaultscriptdef: array [0 .. 5] of string = (
    // fallout4
    '%basename% - main.ba2' + sstLineBreak + '%basename% - misc.ba2' + sstLineBreak + '%basename%.ba2',
    // skyrim
    '%basename% - misc.bsa' + sstLineBreak + '%basename%.bsa',
    // NV
    '',
    // skyrimSE
    '%basename% - misc.bsa' + sstLineBreak + '%basename%.bsa',
    // fallout76
    '%basename% - miscClient.bsa' + sstLineBreak + '%basename%.bsa',
    // Starfield
    '%basename% - main.ba2' + sstLineBreak + '%basename% - misc.ba2' + sstLineBreak + '%basename%.ba2');
  //
  defaultBSAdef: array [0 .. 5] of string = (
    // fallout4
    '%basename% - main.ba2' + sstLineBreak + '%basename% - interface.ba2' + sstLineBreak + '%basename%.ba2',
    // skyrim
    '%basename% - interface.bsa' + sstLineBreak + '%basename%.bsa',
    // NV
    '',
    // skyrimSE
    '%basename% - interface.bsa' + sstLineBreak + '%basename%.bsa',
    // fallout76
    '%basename% - main.ba2' + sstLineBreak + '%basename% - Localization.ba2' + sstLineBreak + '%basename% - interface.ba2' + sstLineBreak + '%basename%.ba2' + sstLineBreak +
    'seventysix - localization.ba2',
    // starfield
    '%basename% - main.ba2' + sstLineBreak + '%basename% - main02.ba2' + sstLineBreak + '%basename% - Localization.ba2' + sstLineBreak + '%basename% - interface.ba2' + sstLineBreak
    + '%basename%.ba2');
  //
  defaultBSAAlias: array [0 .. 5] of string = (
    // fallout4
    '',
    // skyrim
    '',
    // NV
    '',
    // skyrimSE
    'update=skyrim - interface.bsa' + sstLineBreak + 'dawnguard=skyrim - interface.bsa' + sstLineBreak + 'hearthfires=skyrim - interface.bsa' + sstLineBreak +
    'dragonborn=skyrim - interface.bsa',
    // fallout76
    '',
    // starfield
    '');

  { // skyrimSE
    'skyrim=skyrim - patch.bsa' + sstLineBreak + 'update=skyrim - patch.bsa' + sstLineBreak + 'dawnguard=skyrim - patch.bsa' + sstLineBreak + 'hearthfires=skyrim - patch.bsa' +
    sstLineBreak + 'dragonborn=skyrim - patch.bsa', }

var
  lRulesNoTransListIn: tstringList;
  lRulesNoTransListOut: tstringList;

const
  lRulesNoTransListOutDefault: string = // *
    '@ALCH:FULL' + sstLineBreak + //
    '@BOOK:FULL' + sstLineBreak + //
    '@BOOK:DESC' + sstLineBreak + //
    '^(?!<).*<.+>.*[^>]?$' + sstLineBreak + // *
    '\n' + sstLineBreak + //
    '^<.*>.{3,}<.*>$' + sstLineBreak; //

  lRulesNoTransListInDefault: string = // *
    '@BPTD:BPTN' + sstLineBreak + //
    '@PKIN:FULL' + sstLineBreak + //
    '@RACE:FDSL' + sstLineBreak + //
    '^\w{3,}_\w*$' + sstLineBreak + // *
    '^\w+[A-Z]+[_a-z\d]+[A-Z]+\w+$' + sstLineBreak + // *
    '^\R+$' + sstLineBreak + // *
    '^.{1,2}$' + sstLineBreak + // *
    '^(\W|\d|\.)*$' + sstLineBreak + // *
    '^[\d%\.\\\+\-:]+$' + sstLineBreak + // *
    '^\w*\\\w*' + sstLineBreak + // *
    '^<[\w\.]+=[\w\.]+>.<[\w\.]+=[\w\.]+>$' + sstLineBreak + // *
    '^<[\w\.]+=[\w\.]+>$' + sstLineBreak + //
    '\b\w+_\w+\b' + sstLineBreak; //

  rxPatternNumber = '([0-9]+)((\.|,)([0-9]+))?'; // '[+-]?([0-9]+)((\.|,)([0-9]+))?';
  rxPatternAliasStrict = '<alias.*>|<global.*>|<relat.*>|<basename.*>|<token.*>|<repetitions>|</?font.*>|<mag>|<dur>'; //
  rxPatternAlias = '<.+?>'; //
  rxPatternWord = '[\p{L}\p{N}_\-]{3,}'; // {3,} indicate the min size for a word
  rxPatternNoWhite = '^[^\s\p{P}]*$';
  rxNormalizedAlias = '<a_A>';
  rxNormalizedAliasRestore = '< ?a_A ?>';
  rxNormalizedNumber = '999';

var
  sPref_rxPatternNumber: string = '';
  sPref_rxPatternAlias: string = '';
  sPref_rxPatternAliasStrict: string = '';
  sPref_rxPatternWord: string = '';

  debug_getBatcher: boolean = false;
  bSuspendstringwarning: boolean = false;
  iGlobalLastError: integer = 0;
  bAutocloseWithWizard: boolean = true;

  // -----------------
  CustomTxtParams: tCustomTxt;

  bAllowDirectEdit: boolean = true; // Allow editing directly inthe main tree view
  bAllowDirectEditCtrl: boolean = true; // Use Ctrl for direct edit in the main tree view (if false ctrl is used for opening the edit window)
  // -----------------------------
  gamesParams: rGameParams;
  // -----------------------------
  bGameHasWizardProc: boolean = false;
  bLocalizedLoadingWarning: boolean = false;
  bLocalizedVerboseWarning: boolean = false;
  bApiTranslationVerbose: boolean = false;
  bGlobalUILocked: integer = 0;
  bIdleReady: boolean = false;
  bUIStopped: boolean = true;
  bCanSave: boolean = true;
  bApplicationStarted: boolean = false;
  bConfirmChange: boolean = false;
  regexwWidth: integer = 900;
  regexwHeight: integer = 600;
  regexwtop: integer = 50;
  regexwleft: integer = 50;
  hProcessorDefault: integer = 0;
  hProcessorLastCustom: string = '';
  iTheme: integer = 0;

  bPexUnLockGlobalVar: boolean = false;
  gTimerFeedback: ttimer;
  gPanelFeedback: tpanel;
  bshowProcessorSave: boolean = false;
  bHeaderAdvanced: boolean = false;
  MY_DOC_SUBFOLDER: string;
  CURRENT_GAME_PATH: string;
  CURRENT_GAME_SUBFOLDER: string;
  CURRENT_PREFS_SUBFOLDER: string;
  CURRENT_USERDIC_BASEFOLDER: string;
  CURRENT_USERDIC_SUBBACKUP: string;
  CURRENT_USERDIC_AUTOBACKUP: string;
  // CURRENT_CACHE_BASEFOLDER: string;
  CURRENT_DATACACHE_BASEFOLDER: string;
  LOADING_PREFS_ID: integer = 3;
  CURRENT_GAME_ID: integer = -1;
  LAST_GAME_ID: integer = -1;
  bSKIP_NULLSTRING: boolean = true;

  sFuzExt: string;
  ProgName: string;
  ProgVersion: string;
  bForceAddSpaceNotNull: boolean = false; // force adding a space when the string must be not null (true for Skyrim)
  // --
  bUseExternalDecompilerOpt: boolean = false;
  sUseExternalDecompilerPath: string = '';
  bUseExternalDecompiler: boolean;

  bGetVMADStrings: boolean = false; // set to true to analyse VMAD
  bApplyVMADOpt: boolean = true; // autoapply VMAD on string

  // ArabicRtl----->
  bRtlRemoveControl: boolean = true;
  iRtlMethod: integer = 1;
  bUseLineSize: boolean = false;
  iRtlLineSize: integer = 75;
  // <----ArabicRtl

  genericTreeImageList: timagelist;
  bBidiBase: TBiDiMode = bdLeftToRight;
  bUseSimpleMemo: boolean = false;
  bSimpleMemoRTL: boolean = false;
  testCanvas: tcanvas;
  MainPageControl: tPageControl;
  bDerivedVerbose: boolean = false;
  bAllowPexCodepage: boolean = false;
  bEnableDerived: boolean = false;
  bStringAutoTrim: boolean = false;
  // ---------IDLE--------------
  idleVocabCounter: integer = 0;
  maxSpCheckUnderline: integer = 50;
  maxSpCheckUnderlineRatio: integer = 50;
  TimerSearch: ttimer;
  // -------
  sCurrentDEFUIOut: string;
  lBSAdef: tstringList;
  lScriptdef: tstringList;
  lBSAAlias: tstringList;
  lDEFUIHeader: tstringList;
  lfileusingVMAD: tstringList;
  lDEFUIIgnore: tstringList;

  // ---------------------------
  bHeuristicListValidated: boolean = false;
  // ----------------------------
  sortLocalOptions: TLocaleOptions = loUserLocale; // loUserLocale
  pBar: integer = 0; // universal ProgressBar counter
  vocabFiles: tstringList;
  codepageFiles: tstringList;
  treearray: array [0 .. 2] of TVirtualStringTree;

  CurrentTESVmode: sTESVTMode = sTESVTNone;
  // --vocablist
  LocalVocabBaseList: tlist;
  LocalVocabEdidList: tlist;

  vocabBaselist: tlist;
  vocabBaselistCurrentCompareProc: TListSortCompare;
  vocabEdidList: tlist;
  vocabEdidListCurrentCompareProc: TListSortCompare;
  // -------------------
  recentAddon: tstringList;
  pexNoTransProcList: tstringList;
  EmoteDefinitionList: tstringList;
  DialSubTypeList: tstringList;
  onewordList: tlist;
  defUIoptions: tstringList;
  // ---regExPreset
  lRegEx_RegEx: tstringList;
  lRegEx_Replace: tstringList;

  lRegExPreset_Label: tstringList;
  lRegExPreset_RegEx: tstringList;
  lRegExPreset_Replace: tstringList;
  lAdvSearchPreset: tstringList;

  // ------------prefsdialogs------------->
  askPrefsArray: tPrefsArray;
  // 0: finalyzeWarn
  // 1: PexDisclaimer
  // 2: DiscardInBsa
  // 3: fileexixts Overwrite (esp)
  // 4: fileexixts Overwrite (MCM)
  // 5: fileexixts Overwrite (Pex)
  // 6: fileexixts Overwrite (STR)
  // 7: restart othergame
  // 8: warnFormVersion
  // 9: VMAD
  // 10: warn forcedCodepage
  // 11: deprecated
  askPrefsArraySession: tPrefsArray;
  // 0: Utf8 warning
  // 1: SSTExists Warning
  // <---------endPrefsDialogs-------------
  pBarFrequencies: integer = 500;
  iFrequenciesMult: integer = 10;
  Sourcelanguage: string = 'en';
  Destlanguage: string = 'fr';
  mainpath: string;
  toolPath: string;
  datacache: string;
  tmpFuzPath: string;

  Game_CacheStringFolder: string = '';
  Game_CacheDataFolder: string = '';
  Game_FuzDataFolder: string = '';
  Game_StringFolder: string = '';
  Game_StringCompareFolder: string = '';
  Game_EspFolder: string = '';
  Game_EspFolderSaveAs: string = '';
  Game_EspFolderFixedExport: string = '';
  bUseFixedFolderExport: boolean = false;
  Game_NpcMapFolder: string = '';
  Game_PexFolder: string = '';
  Game_BSAFolder: string = '';
  Game_TXTFolder: string = '';
  Game_EspCompareFolder: string = '';
  Game_XMLFolder: string = '';
  Game_SSTFolder: string = '';
  sstResFolder: string = '';
  tesvtnoReplace: boolean = false;
  bVTSimpleLine: boolean = true;
  bDefaultTrimState: boolean = false;
  bRessourceFallBackFeedback: boolean = false;
  bUseLocOptions: boolean = false;
  bUseAddonHash2: boolean = false;
  CancelStuff: boolean = false;
  bCacheLoaded: boolean = false;

  bUseDataCache: boolean = true;
  iCompareEspOpt: array [0 .. 1] of integer = (
    1,
    0
  );
  bDontUseFilter: boolean = false;
  bApplyTagOnly: boolean = false;
  iXMLExportOpt: integer = 0;
  iApplySSTModeOpt: integer = 1;
  bResetStateOpt: boolean = false;
  bAuthAutoTranslate: boolean = true;
  bLoadEspSingleListA: boolean = true;
  // ======SpellCheck
  bUseSpellCheck: boolean = false;
  iUseSpellCheckID: integer = 0;
  sUseSpellCheckDic: String = '';
  iSpParseOptions: byte = 7;
  // ============================
  forcedCodepage: string = ''; // store the codepage used by espcompare and loadstringasdest. Must be reset to '' after usage.
  bSkipLDpreWordMatch: boolean = false;
  bSwitchAutoDial: boolean = true;
  // ------prefs force Codepage-------------
  bForceCodepageOnLoad: boolean = false;
  bForceCodepageOnSave: boolean = false;
  bSaveCodepageSetting: boolean = false;
  sForceCodepageOnLoad: string = '';
  sForceCodepageOnSave: string = '';
  // ------prefs force Codepage-------------
  timedebut: dword;
  canCloseProg: boolean = true;
  // SSTCacheFolder: string = '';
  SSTUserFolder: string = '';
  SSTUserFolderBackup: string = '';
  SSTUserFolderAutoBackup: string = '';
  EspBackup_Folder: string = '';
  sstBackupCount: integer = 3;
  oldDial_Format: string = '[%PREFIXE%] %DIAL%';
  stringLog: tstrings;
  isfirstLaunch: boolean = true;

  htmlloaded: boolean = false;
  ProgressBar: tprogressBar;
  SearchrWindowpos: rwindowpos;
  AdvSearchrWindowpos: rwindowpos;

  // ----font/zoom-------->

  GlobalFontHeight: integer = 18;
  virtualTreeFontSize: array [0 .. 2] of integer = (
    defaultvirtualTreeFontSize,
    defaultvirtualTreeFontSize,
    defaultvirtualTreeFontSize
  );
  virtualTreeFont: string = defaultvirtualTreeFont;
  virtualTreeFixedFont: string = defaultvirtualTreeFixedFont;

  SearchSynFontSize: integer = defaultSynFontSize;

  HeaderComponentFont: string = defaultHeaderComponentFont;
  bForceAltHeaderDisplay: boolean = false;
  // <--------------------

  headerString: tstringList;
  Lang_Res: string = defaultLang_Res;
  OptAuthSound: boolean = true;
  OptEspBackupOptSimple: boolean = true;
  OptEspBackupOptFolder: boolean = false;
  OptKeepOrpheanStr: boolean = true;
  authFocus: boolean = true;
  mainform: tform;
  hintActiveNode: pvirtualNode = nil;
  maxStringSize: array [0 .. 2] of integer = (
    0,
    0,
    0
  );
  HintSizeThreshold: integer = 400;

procedure doFeedback(s: string = ''; doMsg: boolean = false; sopt: sAskDialButtons = [askOK]);
function GetDirectory(title, s: string): string;
function UpdatePBar(pF: integer; newPos: integer = 0; bMult: boolean = true): boolean;
procedure initWindowPos(var windowpos: rwindowpos);
function SaveFileDialog(title, folder, filename, filter: string; defaultext: string = ''): string;
function OpenFileDialog(title, folder, filename, filter: string): string;
function OpenFileDialogMulti(title, folder, filename, filter: string; var f: tstringList): boolean;
function askDialog(s: string; form: tform; iRememberIndex: integer; bAlwaysYes: boolean; sopt: sAskDialButtons; autoDuration: integer = 2500): integer; overload;
function askDialog(s: string; form: tform; sopt: sAskDialButtons; autoDuration: integer = 1500): integer; overload;
function cleanString(s: string; c: char = #0): string; overload;
function cleanString(s: string; c: array of char): string; overload;
function getcharinArray(ch: char; c: array of char): boolean;
procedure getLangSST(const s: string; var s1, s2, s3: string);
function bApplyVMAD: boolean;
function is_comment(t: string): boolean;
function is_adress(t: string): boolean;
procedure removeCommentLine(t: tstringList);
procedure cleanResList(t: tstringList);
function checkForNullTrans(s, strans: string): boolean;
function RemoveFileExt(const filename: string; verifyExt: string = ''): string;
procedure openHtmFile(filename: string; htmlrender: THTMLViewer; DocType: THtmlFileType);
function divide(a, b: integer): double; overload;
function divide(a, b: double): double; overload;
function atleast(const value, atleast: integer): integer;
function GetParentDirectory(path: string): string;
function authFileAccess(filename: TFileName): boolean;
function authFileAccessRW(filename: TFileName): boolean;
function GetFileSize(const filename: TFileName): int64;
procedure writeFileVsCache(filename: string; size: int64);
function verifyFileVsCache(addonFullpath, filename: string; var bCanBeCached: boolean; var fSize: int64): boolean;
function conditionalCase(s: string; l: boolean): string;
function doAddonHash(const addon, v: cardinal): cardinal;
function cleanForbiddenChar(s: string): string;
function StringHash(const str: string): cardinal;
function Split(aString: String; const aSeparator: char; aMax: integer): TStringArray; overload;
function Split(const aString: String; const aSeparator: char): string; overload;
Function getBSAFileName(lDef, lAlias: tstrings; var BsaName: string; folder, s: String): boolean;
function cIsDigit(c: char): boolean;
function parseFileNameData(filename: string): rFileData;
function parseRecentMenuData(filename: string): rRecentData;
function getHeaderProcVersion(s: string): integer;
function appendDatetoName(s: string; tag: string = ''): string;
function shortenStringInternal(s: string; sizeMax: integer): string;
function TESVTSameLanguage: boolean;
function BlockSameLanguageEditing: boolean;
function cacheLoaded: boolean;
function getMenuCaptionId: integer;
function getCaptionLabel: string;
procedure setTreeSortAndSort(index, column: integer); overload;
procedure setTreeSortAndSort(column: integer); overload;
function IfThenStr(AValue: boolean; const ATrue: string; const AFalse: string): string;
procedure globalEndUpdate(var t: TVirtualStringTree; const level: integer = 0);
procedure globalBeginUpdate(var t: TVirtualStringTree; const level: integer = 0);
procedure globalUpdateAll(pProc: tGlobalTreeUpdate; const level: integer = 0);
procedure resetTreeArrayState;
procedure sortAllTree;
procedure cleanFuzTmpFile;
function getTotalVocabCount(aList: tAlist): integer;
function TESVTmodEspLoaded: boolean;
function TESVTmodSaveEsp: boolean;
function TESVTsstCustom: boolean;
function TESVTsst: boolean;
function TESVTmodLoaded: boolean;
function TESVTmodLoadedHeaderProc: boolean;
procedure enableToolBar(tb: TToolBar; b: boolean);
function isChar_WordDelimiter(c: char): boolean;
function isChar_WordDelimiterExtended(c: char): boolean;
function isChar_WordDelimitersEndLine(c: char): boolean;
function isChar_WordDelimitersSPAcceptedInside(c: char): boolean;
function setGameByExe: boolean;
procedure setGameByIni;
procedure setLastGameUsed;
function getGameByFormVersion(iVersion: integer; bFbk: boolean = false): integer;
procedure setGameByCommand(command: String);
function loadStringList(f: string; sorted: boolean; clean: byte = 0): tstringList;
procedure loadStringListEx(var l: tstringList; f: string; sorted: boolean; clean: byte = 0);
procedure initRessources;
procedure SaveBytesToFile(const Data: TBytes; const filename: string);
function TrimExtended(const s: string; CharSet: TSysCharSet): string;
function getHeightforCell(s: string; X: single; multiplier: integer = 1): integer;
function isGameHandled(id: integer): boolean;
function bforceCpOnLoad: string;
function bforceCpOnSave: string;
function warnForcedCodepage: boolean;
function inttostrShort(i: cardinal): string; overload;
function inttostrShort(i: integer): string; overload;
function retCardinal(i: integer): cardinal;
function checkStringWOnlyWhiteChar(s: string): boolean;
procedure replaceLineBreak(var s: string);
function secureSavetStringList(l: tstringList; filename: string): boolean;
procedure LaunchSearchTimer;
function localInput(const title, info, default: string): string;
function ShortenStringEx(DC: HDC; const s: UnicodeString; width: integer; EllipsisWidth: integer = 0): UnicodeString;
procedure getAllGamePath(installType: integer);
procedure setallpath(path: string);
function override_ExportFolder(iMode: integer; sfolder: string; sFolderAlt: string = ''): string;
procedure deleteDataCachefileFolder(path, ext: string);
function currentEditedTree: TVirtualStringTree;
procedure deleteListEntry(l: TListBox);
function bGameIsSF: boolean;
function bGameIsSkyrim: boolean;
function bGameIsFallout: boolean;
function RemoveChar(const aString: string): string;
function GetStringProxy(gs, gTrans: string): integer;
procedure ClearTmpFiles;
function GetTEncoding(const EncodingName: string): tencoding;

const // registry data
  {
    0:Fallout4
    1:Skyrim
    2:FalloutNV
    3:SkyrimSE
    4:Fallout76

    1: steam;
    2: bnet
    3: PTS
  }

  aGameSteam: array [0 .. 5] of boolean = (true, true, true, true, true, true);
  aGameBnet: array [0 .. 5] of boolean = (false, false, false, false, true, false);
  aGamePTS: array [0 .. 5] of boolean = (false, false, false, false, true, false);
  aGameSteamID: array [0 .. 5] of string = ( //
    'Microsoft\Windows\CurrentVersion\Uninstall\Steam App 377160', //
    'Microsoft\Windows\CurrentVersion\Uninstall\Steam App 72850', //
    'Microsoft\Windows\CurrentVersion\Uninstall\Steam App 22380', //
    'Microsoft\Windows\CurrentVersion\Uninstall\Steam App 489830', //
    'Microsoft\Windows\CurrentVersion\Uninstall\Steam App 1151340', // f76
    'Microsoft\Windows\CurrentVersion\Uninstall\Steam App 1716740'); // SF

  aGameSteamKey: array [0 .. 5] of string = ('InstallLocation', 'InstallLocation', 'InstallLocation', 'InstallLocation', 'InstallLocation', 'InstallLocation');
  aGameBNetPath: array [0 .. 5] of string = ('', '', '', '', 'Microsoft\Windows\CurrentVersion\Uninstall\Fallout 76', '');
  aGameBNetKey: array [0 .. 5] of string = ('', '', '', '', 'Path', '');
  aGamePTSPath: array [0 .. 5] of string = ('', '', '', '', 'Microsoft\Windows\CurrentVersion\Uninstall\Fallout 76 PTS', '');
  aGamePTSSteamPath: array [0 .. 5] of string = ('', '', '', '', 'Microsoft\Windows\CurrentVersion\Uninstall\Steam App 1836200', '');
  aGamePTSKey: array [0 .. 5] of string = ('', '', '', '', 'Path', '');
  aGamePTSSteamKey: array [0 .. 5] of string = ('', '', '', '', 'InstallLocation', '');

  RegistryBase32 = 'SOFTWARE\';
  RegistryBase64 = 'SOFTWARE\WOW6432Node\';

implementation

uses TESVT_Ressources;

// ===========================
function getGameByFormVersion(iVersion: integer; bFbk: boolean = false): integer;
begin
  if bFbk then
    doFeedback('iVersion: ' + inttostr(iVersion));
  if iVersion = 131 then // fallout4
    Result := 0
  else if inrange(iVersion, 40, 43) then // Skyrim
    Result := 1
  else if inrange(iVersion, 2, 15) then // FNV
    Result := 2
  else if iVersion = 44 then // SSE
    Result := 3
  else if inrange(iVersion, 182, 201) then // f76
    Result := 4
  else if inrange(iVersion, 552, 576) then // Starfield
    Result := 5
  else
  begin
    Result := -1;
  end;
end;
// =====================

function GetTEncoding(const EncodingName: string): tencoding;
var
  codepage: integer;
begin
  try
    if lowercase(EncodingName) = 'utf8' then
      Result := tencoding.utf8
    else if lowercase(EncodingName) = 'utf16' then
      Result := tencoding.unicode
    else if TryStrToInt(EncodingName, codepage) then
      Result := tencoding.getEncoding(codepage)
    else
      Result := tencoding.getEncoding(EncodingName);
  except
    Result := tencoding.unicode;
  end;
end;

constructor tCustomTxt.Create(l: tstringList);
var
  i, nbParam: integer;
  strtmp: string;
  p: pcustomTxtDefinition;
begin
  // ----------------
  lCustomTxtParamList := tlist.Create;
  sCustomExtList := (l.Values['SupportedTxtExt']);

  nbParam := strtointdef(l.Values['CustomTypeCount'], 0);

  for i := 1 to nbParam do
  begin
    new(p);
    lCustomTxtParamList.Add(p);
    p.sRegex := l.Values[format('CustomTypeRegex_%d', [i])];
    p.sLabel := l.Values[format('CustomTypeLabel_%d', [i])];
    p.sRestrictExt := l.Values[format('CustomTypeRestrictExt_%d', [i])];
    p.bRestrictExt := p.sRestrictExt <> '*';
    strtmp := l.Values[format('CustomTypeEncoding_%d', [i])];
    p.eEncoding := GetTEncoding(strtmp);
    p.iIdBackref := strtointdef(l.Values[format('CustomTypeBackrefID_%d', [i])], 0);
    p.bIsFallback := strtobooldef(l.Values[format('CustomTypeIsFallback_%d', [i])], false);
    p.bUseSaveLangSuffixe := strtobooldef(l.Values[format('CustomTypeSaveLangSuffixe_%d', [i])], false);
    p.bSearchByLine := strtobooldef(l.Values[format('CustomTypeSearchByLine_%d', [i])], true);

  end;
  // define fallback
  for i := 0 to lCustomTxtParamList.Count - 1 do
  begin
    p := lCustomTxtParamList[i];
    if p.bIsFallback then
    begin
      ifallback := i;
      break;
    end;
  end;

  l.Free;
end;

destructor tCustomTxt.Destroy;
var
  i: integer;
begin
  // ----------------
  for i := 0 to lCustomTxtParamList.Count - 1 do
    dispose(pcustomTxtDefinition(lCustomTxtParamList[i]));
  lCustomTxtParamList.Free;
  inherited;
end;

function tCustomTxt.isValidTxtExt(ext: string): boolean;
begin
  Result := pos(ext, sCustomExtList) > 0;
end;

function tCustomTxt.isFallback(i: integer): boolean;
var
  p: pcustomTxtDefinition;
begin
  p := lCustomTxtParamList[i];
  Result := p.bIsFallback;
end;

function tCustomTxt.isSearchByLine(i: integer): boolean;
var
  p: pcustomTxtDefinition;
begin
  p := lCustomTxtParamList[i];
  Result := p.bSearchByLine;
end;

function tCustomTxt.getRegex(i: integer): string;
var
  p: pcustomTxtDefinition;
begin
  p := lCustomTxtParamList[i];
  Result := p.sRegex;
end;

function tCustomTxt.useSuffixe(i: integer): boolean;
var
  p: pcustomTxtDefinition;
begin
  p := lCustomTxtParamList[i];
  Result := p.bUseSaveLangSuffixe;
end;

function tCustomTxt.getrefId(i: integer): integer;
var
  p: pcustomTxtDefinition;
begin
  p := lCustomTxtParamList[i];
  Result := p.iIdBackref;
end;

function tCustomTxt.getEncoding(i: integer): tencoding;
var
  p: pcustomTxtDefinition;
begin
  p := lCustomTxtParamList[i];
  Result := p.eEncoding;
end;

function tCustomTxt.getLabel(i: integer): string;
var
  p: pcustomTxtDefinition;
begin
  p := lCustomTxtParamList[i];
  Result := p.sLabel;
end;

procedure tCustomTxt.incStat(i: integer);
var
  p: pcustomTxtDefinition;
begin
  p := lCustomTxtParamList[i];
  inc(p.stats);
end;

procedure tCustomTxt.resetstat;
var
  i: integer;
begin
  for i := 0 to lCustomTxtParamList.Count - 1 do
    pcustomTxtDefinition(lCustomTxtParamList[i]).stats := 0;
end;

function tCustomTxt.mcmDecider(f: tstringList): integer;
var
  i, j, m: integer;
  RegEx: tperlRegex;
const
  iLineLimit = 50;
  iSizeLimit = 2048;
begin
  Result := -1;
  if lCustomTxtParamList.Count = 0 then
    exit;

  CustomTxtParams.resetstat;
  RegEx := tperlRegex.Create;
  try
    for j := 0 to lCustomTxtParamList.Count - 1 do
    begin
      if not isFallback(j) then
      begin

        RegEx.RegEx := getRegex(j);
        RegEx.Replacement := '';
        RegEx.Options := [preCaseLess, preSingleLine];

        if isSearchByLine(j) then
        begin
          for i := 0 to f.Count - 1 do
          begin
            RegEx.subject := f[i];
            if RegEx.Match then
              incStat(j);
            if i > iLineLimit then
              break;
          end;
        end
        else
        begin
          RegEx.subject := copy(f.text, 1, iSizeLimit);
          if RegEx.Match then
            repeat
              incStat(j);
            until not RegEx.MatchAgain;
        end;
      end;
    end;

    m := pcustomTxtDefinition(lCustomTxtParamList[0]).stats;
    for i := 1 to lCustomTxtParamList.Count - 1 do
      if m < pcustomTxtDefinition(lCustomTxtParamList[i]).stats then
        m := pcustomTxtDefinition(lCustomTxtParamList[i]).stats;

    if m = 0 then
      Result := ifallback
    else
    begin
      for i := 0 to lCustomTxtParamList.Count - 1 do
        if pcustomTxtDefinition(lCustomTxtParamList[i]).stats = m then
        begin
          Result := i;
          break;
        end;
    end;
  finally
    RegEx.Free;
  end;
end;

// ------------------------

function RemoveChar(const aString: string): string;
var
  slen, i: integer;
begin
  Result := '';
  slen := length(aString);
  for i := 1 to slen do
    if not charinset(aString[i], [#9, #10, #13, '!' .. ',', '.' .. '?']) then
      Result := Result + aString[i]
    else
      Result := Result + ' ';
end;

procedure deleteListEntry(l: TListBox);
var
  i: integer;
begin
  with l do
    for i := items.Count - 1 downto 0 do
      if selected[i] then
        items.delete(i);
end;

function currentEditedTree: TVirtualStringTree;
begin
  Result := treearray[MainPageControl.ActivePageIndex];
end;

function bGameIsSF: boolean;
begin
  Result := CURRENT_GAME_ID = 5;
end;

function bGameIsSkyrim: boolean;
begin
  Result := CURRENT_GAME_ID in [1, 3];
end;

function bGameIsFallout: boolean;
begin
  Result := CURRENT_GAME_ID in [0, 4];
end;

function override_ExportFolder(iMode: integer; sfolder: string; sFolderAlt: string = ''): string;
begin
  if sFolderAlt <> '' then
  begin
    case iMode of
      1:
        Result := sFolderAlt;
      // esp
      2:
        Result := sFolderAlt + GAME_INTERFACEMCM_SUBFOLDER; // mcm
      3:
        Result := sFolderAlt + GAME_SCRIPTS_SUBFOLDER; // script
      4:
        Result := sfolder + sFolderAlt; // wizardAllTemplates
    else
      Result := sFolderAlt + GAME_STRINGS_SUBFOLDER; // string
    end;
  end
  else
    Result := sfolder;

end;

function get_uPath_in_registryEx(path, key: string): string;
begin
  Result := '';
  With TRegistry.Create Do
    Try
      RootKey := HKEY_LOCAL_MACHINE;
      if OpenKeyreadonly(path) then
        Result := ReadString(key);
    Finally
      Free;
    End;
end;

function get_uPath_in_registry(path, key: string): string;
begin
  Result := get_uPath_in_registryEx(RegistryBase32 + path, key);
  Result := stringreplace(Result, '"', '', [rfReplaceAll]);
  if Result = '' then
    Result := get_uPath_in_registryEx(RegistryBase64 + path, key);
  Result := stringreplace(Result, '"', '', [rfReplaceAll]);
  if Result <> '' then
    Result := Result + CURRENT_GAME_PATH;
end;

procedure getAllGamePath(installType: integer);
var
  path: string;
begin
  // registry
  { installtype:
    0: steam+Bnet
    1: steam;
    2: bnet
    3: PTS
  }
  path := '';
  if ((installType = 0) or (installType = 1)) and aGameSteam[CURRENT_GAME_ID] then
    path := get_uPath_in_registry(aGameSteamID[CURRENT_GAME_ID], aGameSteamKey[CURRENT_GAME_ID]);
  if (path = '') and ((installType = 0) or (installType = 2)) and aGameBnet[CURRENT_GAME_ID] then
    path := get_uPath_in_registry(aGameBNetPath[CURRENT_GAME_ID], aGameBNetKey[CURRENT_GAME_ID]);
  // if (installType = 3) and aGamePTS[CURRENT_GAME_ID] then
  // path:= get_uPath_in_registry(aGamePTSPath[CURRENT_GAME_ID], aGamePTSKey[CURRENT_GAME_ID]);
  if (installType = 3) and aGamePTS[CURRENT_GAME_ID] then
    path := get_uPath_in_registry(aGamePTSSteamPath[CURRENT_GAME_ID], aGamePTSSteamKey[CURRENT_GAME_ID]);

  path := stringreplace(path, '/', '\', [rfReplaceAll]);

  setallpath(path);
end;

procedure setallpath(path: string);
begin
  Game_EspFolder := path;
  if directoryExists(Game_EspFolder) then
  begin
    Game_StringFolder := Game_EspFolder + GAME_STRINGS_SUBFOLDER;
    Game_EspFolderSaveAs := Game_EspFolder;
    Game_CacheDataFolder := Game_EspFolder;
    Game_EspFolderFixedExport := Game_EspFolder;
    Game_NpcMapFolder := Game_EspFolder;
    Game_FuzDataFolder := Game_EspFolder;
    Game_CacheStringFolder := Game_CacheDataFolder + GAME_STRINGS_SUBFOLDER;
    Game_PexFolder := Game_EspFolder + GAME_SCRIPTS_SUBFOLDER;
    Game_BSAFolder := Game_EspFolder;
    Game_TXTFolder := Game_EspFolder + GAME_INTERFACE_SUBFOLDER;
    EspBackup_Folder := Game_EspFolder;
    Game_EspCompareFolder := Game_EspFolder;
  end
  else
  begin
    Game_EspFolder := mainpath;
    Game_StringFolder := mainpath;
    Game_EspFolderSaveAs := mainpath;
    Game_CacheDataFolder := mainpath;
    Game_EspFolderFixedExport := mainpath;
    Game_NpcMapFolder := mainpath;
    Game_FuzDataFolder := mainpath;
    Game_CacheStringFolder := mainpath;
    Game_PexFolder := mainpath;
    Game_BSAFolder := mainpath;
    Game_TXTFolder := mainpath;
    EspBackup_Folder := mainpath;
    Game_EspCompareFolder := mainpath;
  end;
end;

function bApplyVMAD: boolean;
begin
  Result := bApplyVMADOpt or bGetVMADStrings;
end;

function localInput(const title, info, default: string): string;
begin
  formInput := tformInput.Create(application);
  formInput.caption := title;
  formInput.Label1.caption := info;
  formInput.edit1.text := default;
  if formInput.ShowModal = mrOk then
    Result := formInput.edit1.text
  else
    Result := default;
  formInput.Free;
end;

procedure LaunchSearchTimer;
begin
  if bApplicationStarted then
  begin
    TimerSearch.Enabled := false;
    TimerSearch.Enabled := true;
  end;
end;

function retCardinal(i: integer): cardinal;
begin
  if i < 0 then
    Result := 0
  else
    Result := i;
end;

function inttostrShort(i: integer): string;
begin
  if i >= 1024 * 1024 then
    Result := format('%.1f Mo', [i / (1024 * 1024)])
  else
    Result := format('%.1f Ko', [i / 1024])
end;

function inttostrShort(i: cardinal): string;
begin
  if i >= 1024 * 1024 then
    Result := format('%.1f Mo', [i / (1024 * 1024)])
  else
    Result := format('%.1f Ko', [i / 1024])
end;

function warnForcedCodepage: boolean;
begin
  if bForceCodepageOnLoad or bForceCodepageOnSave then
  begin
    Result := askDialog(formatres('Warn_ForceCodepage%s%s', [sForceCodepageOnLoad, sForceCodepageOnSave]), nil, 10, true, [askYes, askNo]) = mrYes;
  end
  else
    Result := true;
end;

function bforceCpOnLoad: string;
begin
  if bForceCodepageOnLoad then
    Result := sForceCodepageOnLoad
  else
    Result := '';
end;

function bforceCpOnSave: string;
begin
  if bForceCodepageOnSave then
    Result := sForceCodepageOnSave
  else
    Result := '';
end;

procedure initRessources;
var
  SSTFallback, fallbackResult: tstringList;
  i: integer;
begin
  // --------res-------------->
  sstResFolder := mainpath + sstResPath + Lang_Res + '\';
  SSTRessources := loadStringList(sstResFolder + DEFAULT_RES_FILE, false, 1);
  SSTFallback := loadStringList(mainpath + sstResPath + FALLBACK_RES_FILE, false, 1);

  fallbackResult := getResFallback(SSTFallback);
  if bRessourceFallBackFeedback then
    for i := 0 to fallbackResult.Count - 1 do
      doFeedback('UIFallback found for: ' + fallbackResult[i]);
  // -free tmp stuff
  fallbackResult.Free;
  SSTFallback.Free;
end;

function loadStringList(f: string; sorted: boolean; clean: byte = 0): tstringList;
begin
  Result := nil;
  loadStringListEx(Result, f, sorted, clean);
end;

procedure loadStringListEx(var l: tstringList; f: string; sorted: boolean; clean: byte = 0);
begin
  if not assigned(l) then
    l := tstringList.Create
  else
    l.Clear;
  if sorted then
  begin
    l.sorted := true;
    l.duplicates := dupIgnore;
  end;
  try
    if authFileAccess(f) then
      l.loadfromfile(f);
    case clean of
      0:
        removeCommentLine(l);
      1:
        cleanResList(l);
    else
      exit;
    end;
  except
    On E: Exception do
      doFeedback(E.Message, true);
  end;
end;

function secureSavetStringList(l: tstringList; filename: string): boolean;
begin
  try
    l.SaveToFile(filename, tencoding.utf8);
    Result := true;
  except
    Result := false;
    doFeedback(formatres('errorOnSave%s', [filename]), true);
  end;
end;

procedure enableToolBar(tb: TToolBar; b: boolean);
var
  i: integer;
begin
  for i := 0 to tb.Buttoncount - 1 do
    TToolButton(tb.buttons[i]).Enabled := b;
  tb.Enabled := b;
end;

function isChar_WordDelimiter(c: char): boolean;
begin
  case c of
    #0 .. #32, '.', ',', '?', '!', ':', ';', '(', ')', '[', ']', '{', '}', '�', '"', '/', '\', '|', '+', '*', '=', '%', '&', '>', '<', '�', '�', '$', '@', '�', '#', '~', '^', '_',
      #160, #8239,
    // Non-breaking spaces ,
    #8230, // Suspension points
    #8216, // Single quotes
    #171, #187, #8220, #8221, // Double quotes
    #8211, #8212:
      Result := true; // Dashes
  else
    Result := false;
  end;
end;

function isChar_WordDelimiterExtended(c: char): boolean;
begin
  Result := isChar_WordDelimiter(c);
  if not Result then
    case c of
      '-', '''', #8209, '�', #8720:
        Result := true;
    end;
end;

function isChar_WordDelimitersEndLine(c: char): boolean;
begin
  case c of
    '.', '?', '!', '�', '�', #8230:
      Result := true;
  else
    Result := false;
  end;
end;

function isChar_WordDelimitersSPAcceptedInside(c: char): boolean;
begin
  case c of
    '-', '''', #8209, #8217, #8720:
      Result := true;
  else
    Result := false;
  end;
end;

function getTotalVocabCount(aList: tAlist): integer;
var
  j: integer;
begin
  Result := 0;
  for j := 0 to 2 do
    Result := Result + aList[j].Count;
end;

function cIsDigit(c: char): boolean;
begin
  Result := charinset(c, ['0' .. '9']);
end;

function doAddonHash(const addon, v: cardinal): cardinal;
const
  FNV_offset_basis = 2166136261;
  FNV_prime = 16777619;
begin
  if addon = 0 then
    Result := FNV_offset_basis
  else
    Result := addon;
  Result := (Result xor v) * FNV_prime;
end;

function conditionalCase(s: string; l: boolean): string;
begin
  if l then
    Result := AnsiLowerCase(s)
  else
    Result := s;
end;

function cleanString(s: string; c: char = #0): string;
var
  l, tag, i: integer;
begin
  l := length(s);
  tag := 0;
  for i := l downto 1 do
    if (s[i] = c) then
      inc(tag)
    else
      break;
  if tag > 0 then
    Result := copy(s, 1, l - tag)
  else
    Result := s;
end;

function getcharinArray(ch: char; c: array of char): boolean;
var
  j: integer;
begin
  for j := low(c) to high(c) do
    if ch = c[j] then
      exit(true);
  Result := false;
end;

function cleanString(s: string; c: array of char): string;
var
  l, tag, i: integer;
begin
  l := length(s);
  tag := 0;
  for i := l downto 1 do
    if getcharinArray(s[i], c) then
      inc(tag)
    else
      break;
  if tag > 0 then
    Result := copy(s, 1, l - tag)
  else
    Result := s;
end;

function GetStringProxy(gs, gTrans: string): integer;
var
  num1, num2, punc1, punc2: boolean;
  i: integer;
begin
  // if length(gs) > iLengthCaseCompareThreshold then
  // exit(0);
  Result := 3;
  // check Uppercase
  if (ansiUpperCase(gTrans) = gTrans) = (ansiUpperCase(gs) = gs) then
    dec(Result);
  // hasNumber
  num1 := false;
  num2 := false;
  punc1 := false;
  punc2 := false;

  for i := 1 to length(gs) do
  begin
    if charinset(gs[i], ['0' .. '9']) then
      num1 := true;
    if charinset(gs[i], sPunctuation) then
      punc1 := true;
    if num1 and punc1 then
      break;
  end;
  for i := 1 to length(gTrans) do
  begin
    if charinset(gTrans[i], ['0' .. '9']) then
      num2 := true;
    if charinset(gTrans[i], sPunctuation) then
      punc2 := true;
    if num2 and punc2 then
      break;
  end;
  if num1 = num2 then
    dec(Result);
  if punc1 = punc2 then
    dec(Result);
end;

function askDialog(s: string; form: tform; sopt: sAskDialButtons; autoDuration: integer = 1500): integer;
begin
  Result := askDialog(s, form, -1, false, sopt, autoDuration);
end;

function askDialog(s: string; form: tform; iRememberIndex: integer; bAlwaysYes: boolean; sopt: sAskDialButtons; autoDuration: integer = 2500): integer;
var
  bRemember: boolean;
  tmpArray: pPrefsArray;
  h: integer;
begin
  // fallback is the form is called at start
  if (not assigned(formDialog)) then
  begin
    showmessage(s);
    Result := mrOk;
    exit;
  end;
  // sanitize dialog
  formDialog.close;
  formDialog.timer1.Enabled := false;
  application.ProcessMessages;
  // ----------------------
  bRemember := false;
  formDialog.iRememberIndex := -1;
  formDialog.sessionOnly := false;

  if bAlwaysYes then
    formDialog.CheckBox1.caption := getres('Ask_Remember3')
  else
    formDialog.CheckBox1.caption := IfThenStr(iRememberIndex >= 100, getres('Ask_Remember2'), getres('Ask_Remember1'));

  if iRememberIndex >= 100 then
  begin
    iRememberIndex := iRememberIndex - 100;
    tmpArray := @askPrefsArraySession;
    formDialog.sessionOnly := true;
  end
  else
    tmpArray := @askPrefsArray;

  if inrange(iRememberIndex, low(tmpArray^), high(tmpArray^)) then
  begin
    if tmpArray^[iRememberIndex] > 0 then
    begin
      Result := ifthen(bAlwaysYes, mrYes, tmpArray^[iRememberIndex]);
      exit;
    end
    else
    begin
      formDialog.iRememberIndex := iRememberIndex;
      bRemember := true;
    end;
  end;

  // ----------------------
  formDialog.caption := format('%s %s', [ProgName, ProgVersion]);
  formDialog.sContent := s;
  h := formDialog.getsize;
  formDialog.bAlwaysYes := bAlwaysYes;
  // ---------------------
  formDialog.buttonCancel.visible := askCancel in sopt;
  formDialog.buttonNo.visible := askNo in sopt;
  formDialog.buttonNo.Enabled := true;
  formDialog.buttonYes.visible := askYes in sopt;
  formDialog.buttonOk.visible := askOK in sopt;

  if sopt * [askNo, askYes, askOK] = [] then
    formDialog.BorderIcons := [biSystemMenu]
  else
    formDialog.BorderIcons := [];

  formDialog.CheckBox1.visible := bRemember;
  formDialog.CheckBox1.checked := false;

  if OptAuthSound then
    MessageBeep(MB_ICONASTERISK);

  if askPanel in sopt then
  begin
    gPanelFeedback.caption := s;
    gTimerFeedback.Interval := autoDuration;
    gTimerFeedback.Enabled := true;
    gPanelFeedback.height := h;
    gPanelFeedback.visible := true;
    application.ProcessMessages;
    Result := 1;
  end
  else
  begin
    if askAuto in sopt then
    begin
      formDialog.timer1.Interval := autoDuration;
      formDialog.timer1.Enabled := true;
    end;

    if sopt = [askAuto] then
    begin
      formDialog.Show;
      application.ProcessMessages;
      Result := 1;
    end
    else
      Result := formDialog.ShowModal;
  end;
end;

procedure initWindowPos(var windowpos: rwindowpos);
begin
  windowpos.width := 1150;
  windowpos.height := 600;
  windowpos.top := 50;
  windowpos.left := 50;
  windowpos.Control1 := 300;
  windowpos.list2 := 300;
  windowpos.list3 := 90;
end;

function UpdatePBar(pF: integer; newPos: integer = 0; bMult: boolean = true): boolean;
begin
  if bMult then
    pF := pF * iFrequenciesMult;
  inc(pBar);
  if (pF = 0) or (pBar mod pF = 0) then
  begin
    if newPos > 0 then
      ProgressBar.Position := newPos
    else
      ProgressBar.Position := pBar;
    ProgressBar.Position := ProgressBar.Position - 1;
    // fix for odd bug  in aero
    application.ProcessMessages;
    exit(true);
  end;
  Result := false;
end;

function cacheLoaded: boolean;
begin
  Result := bCacheLoaded
  // ; or TESVTsstCustom or (TESVmode = sTESVTsstEdit); // added sstEditmode, so that can handle the userCacheUpdatedFlag
end;

function TESVTSameLanguage: boolean;
begin
  Result := AnsiLowerCase(Sourcelanguage) = AnsiLowerCase(Destlanguage);
end;

function BlockSameLanguageEditing: boolean;
begin
  Result := (not AUTH_SAME_LANGUAGE_EDITING) and TESVTSameLanguage
end;

function isGameHandled(id: integer): boolean;
begin
  Result := inrange(id, 0, high(STARTUP_INI_VALUES_BYGAME)); // 5 = max Game Id value
end;

procedure setGameEx(id: integer);
begin
  MY_DOC_SUBFOLDER := RFolderHelper.GetMyDocumentsFolder + MY_GAMESFOLDER + aMY_GAMESNAME_SUBFOLDER[id] + MY_DATA_BASEFOLDER;
  CURRENT_GAME_PATH := DATA_BASEFOLDER;
  CURRENT_GAME_SUBFOLDER := DATA_BASEFOLDER + aGAMES_SUBFOLDER[id];
  CURRENT_PREFS_SUBFOLDER := PREFS_BASEFOLDER + aGAMES_SUBFOLDER[id];
  CURRENT_USERDIC_BASEFOLDER := USERDIC_BASEFOLDER + aGAMES_SUBFOLDER[id];
  CURRENT_USERDIC_SUBBACKUP := CURRENT_USERDIC_BASEFOLDER + USERDIC_SUBBACKUP;
  CURRENT_USERDIC_AUTOBACKUP := CURRENT_USERDIC_BASEFOLDER + USERDIC_AUTOBACKUP;
  // CURRENT_CACHE_BASEFOLDER:= CACHE_BASEFOLDER + aGAMES_SUBFOLDER[id];
  CURRENT_DATACACHE_BASEFOLDER := DATACACHE_BASEFOLDER + aGAMES_SUBFOLDER[id];
  ProgName := basePROG_NAME + basePROG_compil + ' - ' + aPROG_NAME[id];
  ProgVersion := aPROG_CURRENTVERSION + aPROG_COMPILINFO;
  CURRENT_GAME_ID := id;
  case id of
    0:
      begin // Fallout4
        gamesParams.sQUSTDIALRef := 'QNAM';
        gamesParams.sMiscCMPORef := 'CVPA';
        gamesParams.sHeaderCMPORef := 'CMPO';
        gamesParams.iCompoDataSize := 8;
        bForceAddSpaceNotNull := true;
        bSKIP_NULLSTRING := true;
        sFuzExt := aFUZEXT[0];
        Sourcelanguage := 'en';
        Destlanguage := 'fr';
      end;
    1:
      begin
        // Skyrim
        gamesParams.sQUSTDIALRef := 'QNAM';
        gamesParams.sMiscCMPORef := '****';
        gamesParams.sHeaderCMPORef := '****';
        gamesParams.iCompoDataSize := 0;
        bForceAddSpaceNotNull := true;
        bSKIP_NULLSTRING := true;
        sFuzExt := aFUZEXT[0];
        Sourcelanguage := 'english';
        Destlanguage := 'french';
      end;
    2:
      begin // NV
        gamesParams.sQUSTDIALRef := 'QSTI';
        gamesParams.sMiscCMPORef := '****';
        gamesParams.sHeaderCMPORef := '****';
        gamesParams.iCompoDataSize := 0;
        bForceAddSpaceNotNull := false;
        bSKIP_NULLSTRING := true;
        sFuzExt := aFUZEXT[1];
        Sourcelanguage := 'en';
        Destlanguage := 'fr';
      end;
    3:
      begin // SkyrimSE
        gamesParams.sQUSTDIALRef := 'QNAM';
        gamesParams.sMiscCMPORef := '****';
        gamesParams.sHeaderCMPORef := '****';
        gamesParams.iCompoDataSize := 0;
        bForceAddSpaceNotNull := true;
        bSKIP_NULLSTRING := true;
        sFuzExt := aFUZEXT[0];
        Sourcelanguage := 'english';
        Destlanguage := 'french';
      end;
    4:
      begin // fallout76
        gamesParams.sQUSTDIALRef := 'QNAM';
        gamesParams.sMiscCMPORef := 'MCQP';
        gamesParams.sHeaderCMPORef := 'CMPO';
        gamesParams.iCompoDataSize := 8;
        bForceAddSpaceNotNull := true;
        bSKIP_NULLSTRING := true;
        sFuzExt := aFUZEXT[0];
        Sourcelanguage := 'en';
        Destlanguage := 'fr';
      end;

    5:
      begin // starfield
        gamesParams.sQUSTDIALRef := 'QNAM';
        gamesParams.sMiscCMPORef := 'CVPA';
        gamesParams.sHeaderCMPORef := 'IRES';
        gamesParams.iCompoDataSize := 12;
        bForceAddSpaceNotNull := true;
        bSKIP_NULLSTRING := true;
        sFuzExt := aFUZEXT[0];
        Sourcelanguage := 'en';
        Destlanguage := 'fr';
      end;
  end;
end;

procedure setGameByDialog;
begin
  formStartup := tformStartup.Create(nil);
  formStartup.caption := basePROG_NAME;
  formStartup.button1.caption := STARTUP_INI_VALUES[0];
  formStartup.button2.caption := STARTUP_INI_VALUES[1];
  formStartup.button3.caption := STARTUP_INI_VALUES[2];
  formStartup.button4.caption := STARTUP_INI_VALUES[6];
  formStartup.button5.caption := STARTUP_INI_VALUES[7];
  formStartup.button6.caption := STARTUP_INI_VALUES[8];
  formStartup.ShowModal;
  case formStartup.ModalResult of
    mrOk:
      begin
        setGameEx(0);
      end;
    mrCancel:
      begin
        setGameEx(1);
      end;
    mrYes:
      begin
        setGameEx(2);
      end;
    mrAbort:
      begin
        setGameEx(3);
      end;
    mrAll:
      begin
        setGameEx(4);
      end;
    mrNo:
      begin
        setGameEx(5);
      end;
  end;
  formStartup.Free;
end;

function setGameByExe: boolean;
var
  i: integer;
begin
  Result := false;
  for i := 0 to high(aEXE_GAME) do
    if lowercase(extractFilename(application.ExeName)) = aEXE_GAME[i] then
    begin
      Result := true;
      setGameEx(i);
      exit;
    end;
  setGameByDialog;
end;

procedure setGameByCommand(command: String);
begin
  if command = AnsiLowerCase(STARTUP_INI_VALUES[0]) then
  begin
    setGameEx(0);
  end
  else if command = AnsiLowerCase(STARTUP_INI_VALUES[1]) then
  begin
    setGameEx(1);
  end
  else if command = AnsiLowerCase(STARTUP_INI_VALUES[2]) then
  begin
    setGameEx(2);
  end
  else if command = AnsiLowerCase(STARTUP_INI_VALUES[6]) then
  begin
    setGameEx(3);
  end
  else if command = AnsiLowerCase(STARTUP_INI_VALUES[7]) then
  begin
    setGameEx(4);
  end
  else if command = AnsiLowerCase(STARTUP_INI_VALUES[8]) then
  begin
    setGameEx(5);
  end
  else if command = AnsiLowerCase(STARTUP_INI_VALUES[4]) then
  begin
    setGameByDialog;
  end
  else if command = AnsiLowerCase(STARTUP_INI_VALUES[5]) then
  begin
    setGameByExe;
  end
  else
  begin
    setLastGameUsed;
  end;
end;

procedure setLastGameUsed;
begin
  if not isGameHandled(LAST_GAME_ID) then
    setGameByDialog
  else
    setGameEx(LAST_GAME_ID);
end;

procedure setGameByIni;
begin
  case LOADING_PREFS_ID of
    0 .. 2:
      setGameEx(LOADING_PREFS_ID);
    3:
      setLastGameUsed;
    4:
      setGameByDialog;
    5:
      setGameByExe;
    6:
      setGameEx(3); // skyrim SE
    7:
      setGameEx(4); // fallout76
    8:
      setGameEx(5); // starfield
  end;
end;

function GetDirectory(title, s: string): string;
begin
  Result := s;
  with TBrowseForFolder.Create(nil) do
    try
      BrowseOptions := BrowseOptions + [bifStatusText, bifUseNewUI];
      caption := title;
      if (s <> '') and directoryExists(s) then
        folder := cleanString(s, '\');
      if Execute then
        Result := cleanString(folder, '\') + '\'
    finally
      Free;
    end;
end;

function SaveFileDialog(title, folder, filename, filter: string; defaultext: string = ''): string;
var
  savedialog: tsavedialog;
begin
  Result := '';
  savedialog := tsavedialog.Create(nil);
  try
    savedialog.filter := filter;
    savedialog.Options := savedialog.Options + [ofPathMustExist];
    savedialog.InitialDir := folder;
    savedialog.filename := filename;
    if defaultext <> '' then
      savedialog.defaultext := defaultext;
    savedialog.title := title;
    if savedialog.Execute then
      Result := savedialog.filename;
  finally
    savedialog.Free;
  end;
end;

function OpenFileDialog(title, folder, filename, filter: string): string;
var
  opendialog: topendialog;
begin
  Result := '';
  opendialog := topendialog.Create(nil);
  try
    opendialog.filter := filter;
    opendialog.Options := opendialog.Options + [ofPathMustExist];
    opendialog.InitialDir := folder;
    opendialog.filename := filename;
    opendialog.title := title;
    if opendialog.Execute then
      Result := opendialog.filename
  finally
    opendialog.Free;
  end;
end;

function OpenFileDialogMulti(title, folder, filename, filter: string; var f: tstringList): boolean;
var
  opendialog: topendialog;
begin
  Result := false;
  opendialog := topendialog.Create(nil);
  try
    opendialog.filter := filter;
    opendialog.Options := opendialog.Options + [ofPathMustExist, ofAllowMultiSelect];
    opendialog.InitialDir := folder;
    opendialog.filename := filename;
    opendialog.title := title;
    if opendialog.Execute then
    begin
      f.text := opendialog.files.text;
      Result := true;
    end;
  finally
    opendialog.Free;
  end;
end;

procedure doFeedback(s: string = ''; doMsg: boolean = false; sopt: sAskDialButtons = [askOK]);
var
  timeStop: dword;
begin
  if assigned(stringLog) then
    stringLog.Add(s);
  if doMsg then
  begin
    timeStop := GetTickCount;
    askDialog(s, mainform, sopt);
    timedebut := timedebut + (GetTickCount - timeStop);
  end;
end;

procedure writeFileVsCache(filename: string; size: int64);
var
  txtfilename: string;
  l: tstringList;
begin
  txtfilename := datacache + ChangeFileExt(filename, DATACACHE_EXT_ID);
  l := tstringList.Create;
  try
    l.Values['version'] := datacacheVersionByGame[CURRENT_GAME_ID];
    l.Values['id'] := inttohex(size, 16);
    l.SaveToFile(txtfilename);
  finally
    l.Free;
  end;
end;

procedure ClearTmpFiles;
var
  ShOp: TSHFileOpStruct;
begin
  ShOp.Wnd := application.Handle;
  ShOp.wFunc := FO_DELETE;
  ShOp.pFrom := PChar(tmpFuzPath + #0);
  ShOp.pTo := nil;
  ShOp.fFlags := FOF_NO_UI;
  // ShOp.fFlags := FOF_NOCONFIRMATION; //progressbar
  // ShOp.fFlags := FOF_ALLOWUNDO;  //trashCan
  SHFileOperation(ShOp);
end;

function verifyFileVsCache(addonFullpath, filename: string; var bCanBeCached: boolean; var fSize: int64): boolean;
var
  txtfilename: string;
  l: tstringList;
  registeredtoolversion, registeredmodsize: string;
begin

  // DATACACHE_MinSize
  Result := false;
  txtfilename := datacache + ChangeFileExt(filename, DATACACHE_EXT_ID);
  fSize := GetFileSize(addonFullpath);
  bCanBeCached := fSize > DATACACHE_MinSize;

  l := tstringList.Create;
  try
    if authFileAccessRW(txtfilename) then
      l.loadfromfile(txtfilename);
    registeredtoolversion := l.Values['version'];
    registeredmodsize := l.Values['id'];

    if (registeredtoolversion = datacacheVersionByGame[CURRENT_GAME_ID]) and (fSize > 0) then
      Result := registeredmodsize = inttohex(fSize, 16);
  finally
    l.Free;
  end;
end;

function GetFileSize(const filename: TFileName): int64;
var
  SearchRec: TSearchRec;
begin
  if FindFirst(filename, faAnyFile, SearchRec) = 0 then
  begin
    Result := SearchRec.size;
    sysutils.FindClose(SearchRec);
  end
  else
    Result := -1;
end;

procedure deleteDataCachefileFolder(path, ext: string);
var
  SearchRec: TSearchRec;
begin
  if FindFirst(path + '\*' + ext, faAnyFile, SearchRec) = 0 then
    repeat
      DeleteFile(path + '\' + SearchRec.Name);
    until FindNext(SearchRec) <> 0;
  FindClose(SearchRec);
end;

function authFileAccess(filename: TFileName): boolean;
var
  HFileRes: HFILE;
begin
  Result := false;
  if not fileexists(filename) then
    exit;
  HFileRes := CreateFile(PChar(filename), GENERIC_READ, FILE_SHARE_READ, nil, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
  Result := (HFileRes <> INVALID_HANDLE_VALUE);
  if Result then
    CloseHandle(HFileRes);
end;

function authFileAccessRW(filename: TFileName): boolean;
var
  HFileRes: HFILE;
begin
  Result := false;
  if not fileexists(filename) then
    exit;
  HFileRes := CreateFile(PChar(filename), GENERIC_READ OR GENERIC_WRITE, 0, nil, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
  Result := (HFileRes <> INVALID_HANDLE_VALUE);
  if Result then
    CloseHandle(HFileRes);
end;

function GetParentDirectory(path: string): string;
begin
  Result := ExpandFileName(path + '\..')
end;

function divide(a, b: integer): double;
begin
  if b = 0 then
    exit(0)
  else
    Result := a / b;
end;

function divide(a, b: double): double;
begin
  if b = 0 then
    exit(0)
  else
    Result := a / b;
end;

procedure headerHtmFile(s: tstringList);
var
  i: integer;
begin
  for i := headerString.Count - 1 downto 0 do
    s.Insert(0, headerString.strings[i]);
end;

procedure openHtmFile(filename: string; htmlrender: THTMLViewer; DocType: THtmlFileType);
var
  s: tstringList;
begin
  SetCurrentDir(sstResFolder);
  s := tstringList.Create;
  try
    if fileexists(filename) then
    begin
      s.loadfromfile(filename);
      headerHtmFile(s);
      htmlrender.LoadFromString(s.text, filename, DocType);
    end
    else
      htmlrender.LoadFromString(filename + sstDocmissing);
  finally
    s.Free;
  end;
end;

procedure getLangSST(const s: string;

  var s1, s2, s3: string);
var
  i, firstToken: integer;
begin
  s1 := '';
  s2 := '';
  s3 := '';
  firstToken := 0;
  for i := length(s) downto 1 do
  begin
    if (s[i] = '_') and (firstToken > 0) then
    begin
      s1 := copy(s, i + 1, firstToken - (i + 1));
      s3 := copy(s, 1, i - 1);
      if s3 = '' then
        s3 := 'Unknown';
      exit;
    end;
    if (s[i] = '_') and (firstToken = 0) then
    begin
      firstToken := i;
      s2 := copy(s, i + 1, maxInt);
    end;
  end;
end;

function RemoveFileExt(const filename: string; verifyExt: string = ''): string;
var
  tmpExt: string;
  bRemove: boolean;
begin
  bRemove := true;
  if verifyExt <> '' then
  begin
    verifyExt := lowercase(verifyExt);
    tmpExt := lowercase(extractfileext(filename));
    bRemove := verifyExt = tmpExt;
  end;
  if bRemove then
    Result := sysutils.ChangeFileExt(filename, '')
  else
    Result := filename;
end;

function atleast(const value, atleast: integer): integer;
begin
  if value < atleast then
    Result := atleast
  else
    Result := value;
end;

function checkForNullTrans(s, strans: string): boolean;
begin
  Result := false;
  // result:= (length(s) = 1) and (length(strans) = 0);
end;

procedure removeCommentLine(t: tstringList);
var
  j: integer;
begin
  for j := t.Count - 1 downto 0 do
    if is_comment(t.strings[j]) then
      t.delete(j);
end;

procedure cleanResList(t: tstringList);
var
  j: integer;
begin
  for j := t.Count - 1 downto 0 do
    if is_comment(t[j]) or (pos('=', t[j]) = 0) then
      t.delete(j);
end;

function is_comment(t: string): boolean;
begin
  Result := (trim(t) = '') or (t[1] = '#');
end;

function is_adress(t: string): boolean;
begin
  Result := (length(trim(t)) = 10) and (t[1] = '@');
end;

function cleanForbiddenChar(s: string): string;
var
  i: integer;
begin
  Result := trim(s);
  for i := 0 to high(FORBIDDENFILECHAR) do
    Result := stringreplace(Result, FORBIDDENFILECHAR[i], '', [rfReplaceAll]);
end;

function StringHash(const str: String): cardinal;
var
  i: integer;
const
  FNV_offset_basis = 2166136261;
  FNV_prime = 16777619;
begin
  // FNV-1a hash
  Result := FNV_offset_basis;
  for i := 1 to length(str) do
    Result := (Result xor byte(str[i])) * FNV_prime;
end;

function Split(aString: String; const aSeparator: char; aMax: integer): TStringArray;
var
  i, j: integer;
begin
  setlength(Result, aMax);
  for i := 0 to aMax - 1 do
    Result[i] := '';
  j := 0;
  for i := 1 to length(aString) do
  begin
    if aString[i] <> aSeparator then
      Result[j] := Result[j] + aString[i]
    else
    begin
      inc(j);
      if j > aMax - 1 then
        exit;
    end;
  end;
end;

function Split(const aString: String; const aSeparator: char): string;
var
  SepPos: integer;
begin
  Result := aString;
  SepPos := pos(aSeparator, Result);
  if (SepPos > 0) then
    System.delete(Result, 1, SepPos)
  else
    Result := '';
end;

function getBSAFileName(lDef, lAlias: tstrings; var BsaName: string; folder, s: String): boolean;
var
  lowername: string;
  aliasStr: string;
  i: integer;
begin
  Result := false;
  BsaName := '';
  lowername := AnsiLowerCase(s);
  // alias first
  if assigned(lAlias) then
  begin
    aliasStr := AnsiLowerCase(trim(lAlias.Values[lowername]));
    if aliasStr <> '' then
    begin
      BsaName := ExcludeTrailingPathDelimiter(folder) + '\' + aliasStr;
      Result := authFileAccess(BsaName);
      if Result then
        exit;
    end;
  end;
  // regular
  if assigned(lDef) then
  begin
    for i := 0 to pred(lDef.Count) do
    begin
      aliasStr := trim(AnsiLowerCase(stringreplace(lDef[i], '%basename%', lowername, [rfIgnoreCase])));
      BsaName := ExcludeTrailingPathDelimiter(folder) + '\' + aliasStr;
      Result := authFileAccess(BsaName);
      if Result then
        exit;
    end;
  end;
end;

function getHeaderProcVersion(s: string): integer;
var
  r: TRegEx;
  m: TMatch;
begin
  Result := 0;
  r := TRegEx.Create('^\[version=(\d+)\]$');
  m := r.Match(s);
  if m.Success then
  begin
    Result := strtointdef(m.Groups[1].value, 0);
  end;
end;

function parseRecentMenuData(filename: string): rRecentData;
var
  r: TRegEx;
  m: TMatch;
begin
  r := TRegEx.Create('^\[(.+)\] (.+?)$');
  m := r.Match(filename);
  if m.Success then
  begin
    Result.fNameFull := m.Groups[2].value;
    Result.fNameFile := extractFilename(Result.fNameFull);
    Result.fNameFolder := ExtractFilePath(Result.fNameFull);
    Result.fNameType := m.Groups[1].value;
    if Result.fNameType = 'TXT' then
      Result.fType := 1
    else if Result.fNameType = 'PEX' then
      Result.fType := 2
    else if Result.fNameType = 'STR' then
      Result.fType := 3
    else if Result.fNameType = 'ESP' then
      Result.fType := 4
    else if Result.fNameType = 'BSA' then
      Result.fType := 5;
  end
  else
  begin
    Result.fNameFull := filename;
    Result.fNameFile := extractFilename(filename);
    Result.fNameFolder := ExtractFilePath(filename);
    Result.fNameType := '???';
    Result.fType := 0;
  end;
end;

function parseFileNameData(filename: string): rFileData;
var
  r1, r2: TRegEx;
  m: TMatch;
begin
  r1 := TRegEx.Create('^(.+)\\(.+?)\.(\w+)$');
  m := r1.Match(filename);

  if m.Success then
  begin
    Result.fPath := m.Groups[1].value;
    Result.fName := m.Groups[2].value;
    Result.fExt := '.' + m.Groups[3].value;
  end
  else
  begin
    Result.fPath := ERRORTXT;
    Result.fName := ERRORTXT;
    Result.fExt := ERRORTXT;
  end;
  Result.fPathSlash := Result.fPath + '\';

  r2 := TRegEx.Create('^(.+)_(\w+)$');
  m := r2.Match(Result.fName);

  if m.Success then
  begin
    Result.fNameStrict := m.Groups[1].value;
    Result.fLang := m.Groups[2].value;
  end
  else
  begin
    Result.fNameStrict := Result.fName;
    Result.fLang := '';
  end;

end;

function appendDatetoName(s: string; tag: string = ''): string;
begin
  Result := s + '.' + tag + FormatDateTime('yyyy_mm_dd_hh_nn_ss', now);
end;

function ShortenStringEx(DC: HDC; const s: UnicodeString; width: integer; EllipsisWidth: integer = 0): UnicodeString;

// Adjusts the given string S so that it fits into the given width. EllipsisWidth gives the width of
// the three points to be added to the shorted string. If this value is 0 then it will be determined implicitely.
// For higher speed (and multiple entries to be shorted) specify this value explicitely.
// Note: It is assumed that the string really needs shortage. Check this in advance.

var
  size: TSize;
  Len: integer;
  l, h, N, W: integer;

begin
  Len := length(s);
  if (Len = 0) or (width <= 0) then
    Result := ''
  else
  begin
    // Determine width of triple point using the current DC settings (if not already done).
    if EllipsisWidth = 0 then
    begin
      GetTextExtentPoint32W(DC, '...', 3, size);
      EllipsisWidth := size.cx;
    end;

    if width <= EllipsisWidth then
      Result := ''
    else
    begin
      // Do a binary search for the optimal string length which fits into the given width.
      l := 0;
      h := Len - 1;
      while l < h do
      begin
        N := (l + h + 1) shr 1;
        GetTextExtentPoint32W(DC, PWideChar(s), N, size);
        W := size.cx + EllipsisWidth;
        if W <= width then
          l := N
        else
          h := N - 1;
      end;
      Result := copy(s, 1, l) + '...';
    end;
  end;
end;

function shortenStringInternal(s: string; sizeMax: integer): string;
var
  l, j, threshold: integer;
  authCut: boolean;
begin
  l := length(s);
  threshold := 0;
  authCut := false;
  if (l > 4) and (l > sizeMax) then
  begin
    for j := sizeMax downto 1 do
    begin
      if authCut and (s[j] <> ' ') then
        exit(copy(s, 1, j) + '...');
      if (threshold > 20) then
        exit(copy(s, 1, sizeMax - 3) + '...');
      if s[j] = ' ' then
        authCut := true;
      inc(threshold)
    end;
  end
  else
    Result := s;
end;

function TESVTsstCustom: boolean;
begin
  Result := (CurrentTESVmode = sTESVTsstCustom);
end;

function TESVTsst: boolean;
begin
  Result := (CurrentTESVmode = sTESVTsstCustom) or (CurrentTESVmode = sTESVTsstEdit);
end;

function TESVTmodLoaded: boolean;
begin
  Result := (CurrentTESVmode = sTESVPex) or (CurrentTESVmode = sTESVMCM) or (CurrentTESVmode = sTESVStrings) or (CurrentTESVmode = sTESVEsp) or (CurrentTESVmode = sTESVEspStrings);
end;

function TESVTmodEspLoaded: boolean;
begin
  Result := CurrentTESVmode in [sTESVEsp, sTESVEspStrings];
end;

function TESVTmodLoadedHeaderProc: boolean;
begin
  Result := CurrentTESVmode in [sTESVEsp, sTESVEspStrings, sTESVMCM];
end;

function TESVTmodSaveEsp: boolean;
begin
  Result := (CurrentTESVmode = sTESVEsp);
end;

function getMenuCaptionId: integer;
begin
  if CurrentTESVmode = sTESVPex then
    Result := 3
  else if CurrentTESVmode = sTESVMCM then
    Result := 2
  else
    Result := ord(TESVTmodSaveEsp);
end;

function getCaptionLabel: string;
begin
  Result := format('%s - %s - [' + getres('CaptionMode') + ': %s]', [ProgName, ProgVersion, sModeLabel[ord(CurrentTESVmode)]]);
end;

procedure setTreeSortAndSort(column: integer);
var
  i: integer;
begin
  for i := 0 to 2 do
    setTreeSortAndSort(i, column);
end;

procedure setTreeSortAndSort(index, column: integer);
begin
  treearray[index].header.SortColumn := column;
  treearray[index].Sort(nil, column, sdAscending);
end;

function IfThenStr(AValue: boolean; const ATrue: string; const AFalse: string): string;
begin
  if AValue then
    Result := ATrue
  else
    Result := AFalse;
end;


// global tree update

procedure resetTreeArrayState;
var
  i: integer;
begin
  for i := 0 to 2 do
    treearray[i].tag := 0;
end;

procedure sortAllTree;
var
  i: integer;
begin
  for i := 0 to 2 do
    treearray[i].sortTree(treearray[i].header.SortColumn, treearray[i].header.SortDirection, false);
end;

Procedure globalUpdateAll(pProc: tGlobalTreeUpdate; const level: integer = 0);
var
  i: integer;
begin
  for i := 0 to 2 do
    pProc(treearray[i], level);
end;

procedure globalBeginUpdate(var t: TVirtualStringTree;

  const level: integer = 0);
begin
  if (level > 0) and (t.tag < level) then
  begin
    t.tag := level;
    t.beginUpdate;
  end
  else if (t.tag = 0) then
    t.beginUpdate;
end;

procedure globalEndUpdate(var t: TVirtualStringTree;

  const level: integer = 0);
begin
  if (level > 0) and (t.tag <= level) then
  begin
    t.tag := 0;
    t.endUpdate;
  end
  else if (t.tag = 0) then
    t.endUpdate;
end;

procedure cleanFuzTmpFile;
begin
  DeleteFile(tmpFuzPath + fuzTMPWAV);
  DeleteFile(tmpFuzPath + fuzTMPXMW);
end;

procedure SaveBytesToFile(const Data: TBytes; const filename: string);
var
  stream: TMemoryStream;
begin
  stream := TMemoryStream.Create;
  try
    if length(Data) > 0 then
      stream.WriteBuffer(Data[0], length(Data));
    stream.SaveToFile(mainpath + '\_Tests\' + filename);
  finally
    stream.Free;
  end;
end;

function TrimExtended(const s: string; CharSet: TSysCharSet): string;
var
  i, l: integer;
begin
  l := length(s);
  i := 1;
  while (i <= l) and (charinset(s[i], CharSet)) do
    inc(i);
  if i > l then
    Result := ''
  else
  begin
    while (charinset(s[l], CharSet)) do
      dec(l);
    Result := copy(s, i, l - i + 1);
  end;
end;

function getHeightforCell(s: string; X: single; multiplier: integer = 1): integer;
var
  l: integer;
begin
  if bVTSimpleLine or (X = -1) then
    exit(GlobalFontHeight + additionalRecMargin);
  l := round(min(length(s), MAXSIZESTRING_IN_TREE[0]) * X) div SPLITSIZETTHRESHOLD + 1;
  Result := GlobalFontHeight * min(l, MAXSIZESTRING_IN_TREE[0]) + additionalRecMargin;
end;

function checkStringWOnlyWhiteChar(s: string): boolean;
var
  l, i: integer;
begin
  l := length(s);
  for i := 1 to l do
    if not(charinset(s[i], sCleanChar)) then
      exit(false);
  Result := true;
end;

procedure replaceLineBreak(var s: string);
var
  l, i: integer;
begin
  l := length(s);
  for i := 1 to l do
    if (charinset(s[i], LBChar)) then
      s[i] := ' ';
end;

end.
