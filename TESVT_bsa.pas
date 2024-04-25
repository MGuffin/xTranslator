{
  {
  Fallout4translator - TESVTranslator - sseTranslator  by McGuffin  mguffin[arobase]gmail.com
  main distribution here:  http://www.nexusmods.com/skyrimspecialedition/mods/134?

  The contents of this file are subject to the Mozillau Public License
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

  ----------------------------------------------
  Part of the code (base TwbFileStream / TwbBSAFile classes) of this Unit is based on the source code of the wbBSA.pas from Tes5Edit
  https://github.com/TES5Edit/TES5Edit
  original author: ElminsterAU

  //----------added, mcguffin
  16/02/2013 stringhash generation : BSAhash64
  16/02/2013 added a way to quickly pull known files in a single directory without building the whole file list
  -procedure ReadDirectoryHash(searchhash: uInt64);
  -function getFileHash(folder, filename, ext: string; getFile: boolean; var buffer: tbytes): boolean;
  07/2016 Added readDirectory functions to read precached indexed for both bsa/ba2    (readDirectoryIndex)
  09/2016 Added BSA/BA2 injection for updated existing data.
}

unit TESVT_bsa;

interface

uses zlibex, lz4io, classes, sysutils, TESVT_Streams, TESVT_Const, TESVT_Fuz;

const
  { https://github.com/Ethatron/bsaopt/blob/master/io/bsa.C }
  BSAHEADER_VERSION_OB = $67; // Oblivion
  BSAHEADER_VERSION_SK = $68; // Fallout3, Skyrim
  BSAHEADER_VERSION_SSE = $69; // Skyrim Special Edition
  BSAARCHIVE_COMPRESSFILES = $0004; // Whether the files are compressed in archive (invert file's compression flag)
  BSAARCHIVE_PREFIXFULLFILENAMES = $0100; // Whether the name is prefixed to the data?
  BSAFILE_COMPRESS = $40000000; // Whether the file is compressed
  { https://github.com/jonwd7/bae/blob/master/src/bsa.h }
  BA2HEADER_VERSION_FO4 = $01; // Fallout 4
  BA2HEADER_VERSION_SF = $02; // Fallout 4
  BA2HEADER_VERSION_FO4B= $08; // Fallout 4

type
  TDynStrings = array of string;

  TwbBSAFileRec = record
    Name: string;
    Hash: uInt64;
    Size: Cardinal;
    Offset: Cardinal;
    uTableIndex: Cardinal; // used for injection . position of file data
  end;

  TwbBSAFolderRec = record
    Name: string;
    Hash: uInt64;
    Files: array of TwbBSAFileRec;
    Map: TStringList;
  end;

  TwbBSAFile = class(Tobject)
  private
    bfStream: TwbReadOnlyCachedFileStream; // TwbFileStream;
    bfFileName: string;
    bfVersion: Cardinal;
    bfOffset: Cardinal;
    bfFlags: Cardinal;
    bfFileFlags: Cardinal;
    bfFolders: array of TwbBSAFolderRec;
    bfFolderMap: TStringList;
    bfStartDataOffset: Int64; // used for injection . position of file data
    fileCount: Cardinal;
    procedure ReadDirectory;
    procedure ReadDirectoryHash(searchhash: uInt64);
    procedure ReadDirectoryIndex(index, indexfd: integer);
    function GetFileCompressedFlag(var aSize: Cardinal): boolean;
    function SetFileCompressedFlag(a: Cardinal; compressed: boolean; addLen, addLen_flag: Cardinal): Cardinal;
    function getFileHash(folder, filename, ext: string; getFile: boolean; var buffer: tbytes): boolean;
    procedure InjectDataFile(fStream: TwbWriteCachedFileStream; tmpiName: string; Files: TwbBSAFileRec; tlistInject: TStringList);
  protected
    function GetData(aOffset, aSize: Cardinal): tbytes;
  public
    hashFdrMode: boolean;
    bdirectIndexMode: boolean;
    bfHashFolder: ^TwbBSAFolderRec;
    constructor Create(const aFileName: string; hashOnly: boolean; foldername: string = ''; index: integer = -1; indexfd: integer = -1);
    function getFile(folder, filename, ext: string; getFile: boolean; var buffer: tbytes): boolean;
    function exportFileList(l: tstrings; bAll: boolean; aFolder, aExt: array of string): boolean;
    function exportFileListFuz(l: tlist; aFolder: string; bsaIndex: integer): boolean;
    function InjectData(bsaFile, bsafileTmp: string; tlistInject: TStringList): boolean;
    destructor Destroy; override;
  end;

  TwbBA2TexChunkRec = record
    Size: Cardinal;
    PackedSize: Cardinal;
    Offset: Int64;
    StartMip: Word;
    EndMip: Word;
  end;

  TwbBa2HeaderSF = packed record
    a: Cardinal;
    B: Cardinal;
  end;

  TwbBA2FileRec = record
    Name: string;
    NameHash: Cardinal;
    DirHash: Cardinal;
    Size: Cardinal;
    PackedSize: Cardinal;
    Offset: Int64;
    Height: Word;
    Width: Word;
    NumMips: Byte;
    DXGIFormat: Byte;
    CubeMaps: Word;
    TexChunks: array of TwbBA2TexChunkRec;
    isPacked: boolean;
  end;

  TwbBA2Resource = class(Tobject)
    brFile: pointer;
    brFileRec: TwbBA2FileRec;
  protected
    function GetData: tbytes;
    function GetRawData: tbytes;
  public
    constructor Create(aFile: pointer; var aFileRec: TwbBA2FileRec);
  end;

  TwbBA2File = class(Tobject)
  private
    bfStream: TwbReadOnlyCachedFileStream; // TwbFileStream;
    bfFileName: string;
    bfVersion: Cardinal;
    bfType: TwbSignature;
    bfFiles: array of TwbBA2FileRec;
    bfastFile: boolean;
    bfFolderMap: TStringList;
    bfStartDataOffset: Int64;
    bfFileTablePosition: Int64;
    fileCount: Cardinal;
    procedure ReadDirectory;
    procedure ReadDirectoryIndex(index: integer);
  protected
    function GetName: string;
    function OpenResource(const aFileName: string): TwbBA2Resource;
    function ResourceExists(const aFileName: string): boolean;
    procedure ResourceList(const aList: tstrings; const aFolder: string = '');
    function GetFileName: string;
    procedure ReadData(var buffer; Offset: Int64; Count: Int64);
    function InjectZlibData(astream: tmemoryStream; fStream: TwbWriteCachedFileStream; var currentSize, currentPackedSize: Cardinal): Cardinal;
  public
    function exportFileList(l: tstrings; bAll: boolean; aFolder, aExt: array of string): boolean;
    function exportFileListFuz(l: tlist; aFolder: string; bsaIndex: integer): boolean;
    function InjectData(bsaFile, bsafileTmp: string; tlistInject: TStringList): boolean;
    constructor Create(const aFileName: string; index: integer = -1);
    destructor Destroy; override;
  end;

function getStringfromBSA(var bsaStream: TwbBSAFile; var buffer: tbytes; const bsaFile, sfolder, sFile, sExt: string; getFile: boolean): boolean;
function getStringfromBa2(var ba2Stream: TwbBA2File; var buffer: tbytes; const bsaFile, sfolder, sFile, sExt: string; getFile: boolean): boolean;
function getStringfromArchive(var bStream: Tobject; var buffer: tbytes; const bsaFile, sfolder, sFile, sExt: string; getFile: boolean): boolean;
Procedure freeStreamArchive(var bStream: Tobject);
function getListfromArchive(var bStream: Tobject; const bsaFile: string; l: tstrings; bAll: boolean; aFolder, aExt: array of string): boolean;
function getListfromBa2(var ba2Stream: TwbBA2File; const bsaFile: string; l: tstrings; bAll: boolean; aFolder, aExt: array of string): boolean;
function getListfromBSA(var bsaStream: TwbBSAFile; const bsaFile: string; l: tstrings; bAll: boolean; aFolder, aExt: array of string): boolean;
function injectFileInBa2(var ba2Stream: TwbBA2File; const bsaFile, bsafileTmp: string; tlistInject: TStringList): boolean;
function injectFileInBSA(var bsaStream: TwbBSAFile; const bsaFile, bsafileTmp: string; tlistInject: TStringList): boolean;
procedure createArchiveStream(var bStream: Tobject; const bsaFile: string);
function getFuzListfromArchive(var bStream: Tobject; const bsaFile: string; l: tlist; aFolder: string; bsaIndex: integer): boolean;
function getFastFilefromArchive(var bStream: Tobject; var buffer: tbytes; const bsaFile: string; index, indexfd: integer): boolean;
function getFastFilefromBa2(var ba2Stream: TwbBA2File; var buffer: tbytes; const bsaFile: string; index: integer): boolean;
function getFastFilefromBSA(var bsaStream: TwbBSAFile; var buffer: tbytes; const bsaFile: string; index, indexfd: integer): boolean;
function unifiedFilename(s: string): string;

implementation

// hash functions

procedure normalizePath(var s: string);
var
  i: integer;
begin
  for i:= 1 to length(s) do
    if s[i] = sSlash then
      s[i]:= saSlash;
end;

function unifiedFilename(s: string): string;
begin
  normalizePath(s);
  result:= lowercase(s);
end;

function unifiedExtractFilePath(s: string): string;
begin
  normalizePath(s);
  result:= extractfilePath(s);
end;

function unifiedExtractFileName(s: string): string;
begin
  normalizePath(s);
  result:= extractfileName(s);
end;

function StrToNum(s: string): uInt64;
var
  c: char;
  pc: PChar;
begin
  result:= 0;
  pc:= PChar(s);
  while pc^ <> #0 do
  begin
    c:= pc^;
    result:= result * $1003F + Byte(c);
    Inc(pc);
  end;
end;

// s = filename without extension / ext = extension with the '.'
// must be in lowercase

 function BSAhash64(s, ext: string): uInt64;
  var
  i: Byte;
  a, b, c: Byte;
  begin
  result := 0;
  if length(s) > 0 then
  begin
  result := Byte(s[length(s)]);
  if length(s) > 2 then
  result := result + (Byte(s[length(s) - 1]) shl 8);
  result := result + uint64((length(s) shl 16));
  result := result + (Byte(s[1]) shl 24);

  if length(s) > 3 then
  result := result + StrToNum(copy(s, 2, length(s) - 3)) shl 32;
  end;

  if length(ext) > 0 then
  result := result + StrToNum(ext) shl 32;

  i := 0;
  if (ext = '.nif') then // tested
  i := 1;
  if (ext = '.kf') then // not tested
  i := 2;
  if (ext = '.dds') then // not tested
  i := 3;
  if (ext = '.wav') then // not tested
  i := 4;
  if i <> 0 then
  begin
  a := Byte((i and $FC) shl 5) + Byte((result and $FF000000) shr 24);
  b := Byte((i and $FE) shl 6) + Byte((result and $000000FF));
  c := Byte(i shl 7) + Byte((result and $0000FF00) shr 8);
  result := result - (result and $FF00FFFF);
  result := result + Cardinal(a shl 24 + b + c shl 8);
  end;
  end;

// ------- TwbBSAFile

constructor TwbBSAFile.Create(const aFileName: string; hashOnly: boolean; foldername: string = ''; index: integer = -1; indexfd: integer = -1);
begin
  bfFileName:= aFileName;
  bfStream:= TwbReadOnlyCachedFileStream.Create(aFileName); // TwbFileStream.Create(aFileName, fmOpenRead or fmShareDenyWrite);
  bfHashFolder:= nil;
  hashFdrMode:= hashOnly and (foldername <> '');
  bdirectIndexMode:= index >= 0;
  if bdirectIndexMode then
    ReadDirectoryIndex(index, indexfd)
  else if hashFdrMode then
    ReadDirectoryHash(BSAhash64(foldername, ''))
  else
    ReadDirectory;
end;

destructor TwbBSAFile.Destroy;
var
  i: integer;
begin
  FreeAndNil(bfStream);
  for i:= Low(bfFolders) to High(bfFolders) do
    FreeAndNil(bfFolders[i].Map);
  FreeAndNil(bfFolderMap);
  inherited;
end;

procedure TwbBSAFile.ReadDirectory;
var
  i, j: integer;
  OldPos: Int64;
  NewPos: Int64;
  totalFileNameLength: Cardinal;
begin
  fileCount:= 0;
  bfStream.position:= 0;
  // feedback
  pBar:= 0;
  // --------
  if bfStream.ReadSignature <> 'BSA' then
    raise Exception.Create(bfFileName + ' is not a valid BSA file');
  bfVersion:= bfStream.ReadCardinal;
  if not bfVersion in [BSAHEADER_VERSION_SK, BSAHEADER_VERSION_SSE] then
    raise Exception.Create(bfFileName + ' is an unsupported version: ' + IntToStr(bfVersion));
  bfOffset:= bfStream.ReadCardinal;
  if bfOffset <> $24 then
    raise Exception.Create(bfFileName + ' has unexpected Offset: ' + IntToStr(bfOffset));
  bfFlags:= bfStream.ReadCardinal;
  SetLength(bfFolders, bfStream.ReadCardinal);
  bfStream.ReadCardinal;
  bfStream.ReadCardinal;
  totalFileNameLength:= bfStream.ReadCardinal;
  bfFileFlags:= bfStream.ReadCardinal;
  OldPos:= bfStream.position;

  ProgressBar.Max:= High(bfFolders) * 2;
  for i:= Low(bfFolders) to High(bfFolders) do
    with bfFolders[i] do
    begin
      UpdatePBar(1);
      bfStream.position:= OldPos;
      Hash:= bfStream.ReadUInt64;
      SetLength(Files, bfStream.ReadCardinal);
      if bfVersion = BSAHEADER_VERSION_SSE then
      begin
        bfStream.ReadCardinal; // skip unk32
        NewPos:= bfStream.ReadInt64;
      end
      else
        NewPos:= bfStream.ReadCardinal;
      OldPos:= bfStream.position;
      bfStream.position:= NewPos - totalFileNameLength;
      Name:= ansilowercase(bfStream.ReadStringLen);

      for j:= Low(Files) to High(Files) do
        with Files[j] do
        begin
          Inc(fileCount);
          Hash:= bfStream.ReadUInt64;
          uTableIndex:= bfStream.position;
          Size:= bfStream.ReadCardinal;
          Offset:= bfStream.ReadCardinal;
        end;
    end;

  bfFolderMap:= TStringList.Create;
  for i:= Low(bfFolders) to High(bfFolders) do
  begin
    UpdatePBar(1);
    with bfFolders[i] do
    begin
      bfFolderMap.AddObject(Name, Tobject(i));
      Map:= TStringList.Create;
      for j:= Low(Files) to High(Files) do
        with Files[j] do
        begin
          Name:= bfStream.ReadStringTerm;
          Map.AddObject(Name, Tobject(j));
        end;
      Map.Sorted:= True;
    end;
  end;
  bfFolderMap.Sorted:= True;

  bfStartDataOffset:= bfStream.position;
end;

function validFileExtInArchive(sl: array of string; filename: string): boolean;
var
  i: integer;
  ext: string;
begin
  ext:= extractFileExt(filename);
  for i:= low(sl) to high(sl) do
    if ext = sl[i] then
      Exit(True);
  result:= false;
end;

function validFolderInArchive(sl: array of string; filename: string): boolean;
var
  i: integer;
  folder: string;
begin
  folder:= filename;
  for i:= low(sl) to high(sl) do
    if pos(sl[i], folder) = 1 then
      Exit(True);
  result:= false;
end;

function TwbBSAFile.exportFileList(l: tstrings; bAll: boolean; aFolder, aExt: array of string): boolean;
var
  i, j: integer;
  fsize: Cardinal;
  t: TStringList;
begin
  result:= false;
  for i:= 0 to Pred(bfFolderMap.Count) do
    if bAll or validFolderInArchive(aFolder, bfFolderMap[i]) then
    begin
      t:= bfFolders[integer(bfFolderMap.Objects[i])].Map;
      for j:= 0 to Pred(t.Count) do
      begin
        if bAll or validFileExtInArchive(aExt, t[j]) then
        begin
          fsize:= bfFolders[integer(bfFolderMap.Objects[i])].Files[integer(t.Objects[j])].Size;
          GetFileCompressedFlag(fsize);
          l.AddObject(bfFolderMap[i] + '\' + t[j], Tobject(fsize));
          result:= True;
        end;
      end;
    end;
end;

function TwbBSAFile.exportFileListFuz(l: tlist; aFolder: string; bsaIndex: integer): boolean;
var
  i, j: integer;
  t: TStringList;
begin
  result:= false;
  ProgressBar.Max:= fileCount;
  pBar:= 0;
  for i:= 0 to Pred(bfFolderMap.Count) do
    if pos(aFolder, bfFolderMap[i]) > 0 then
    begin
      t:= bfFolders[integer(bfFolderMap.Objects[i])].Map;
      for j:= 0 to Pred(t.Count) do
      begin
        UpdatePBar(pBarFrequencies);
        if pos(extractFileExt(t[j]), sfuzExt) > 0 then
        begin
          l.Add(tfuzExport.Create(bfFolderMap[i], t[j], integer(t.Objects[j]), integer(bfFolderMap.Objects[i]), bsaIndex));
          result:= True;
        end;
      end;
    end;
end;

function TwbBSAFile.GetFileCompressedFlag(var aSize: Cardinal): boolean;
begin
  result:= (aSize and BSAFILE_COMPRESS) <> 0;
  if result then
    aSize:= aSize and not BSAFILE_COMPRESS;
  if (bfFlags and BSAARCHIVE_COMPRESSFILES) <> 0 then
    result:= not result;
end;

function TwbBSAFile.GetData(aOffset, aSize: Cardinal): tbytes;
var
  IsCompressed: boolean;
  buffer: tbytes;
begin
  IsCompressed:= GetFileCompressedFlag(aSize);
  bfStream.position:= aOffset;
{$WARNINGS OFF}
  if (bfVersion >= BSAHEADER_VERSION_SK) and ((bfFlags and BSAARCHIVE_PREFIXFULLFILENAMES) <> 0) then
    // size - file name length (no terminator) - string length prefix
    aSize:= aSize - length(bfStream.ReadStringLen(false)) - 1;
{$WARNINGS ON}
  if IsCompressed then
  begin
    SetLength(result, bfStream.ReadCardinal);
    aSize:= aSize - 4;
    if (length(result) > 0) and (aSize > 0) then
    begin
      SetLength(buffer, aSize);
      bfStream.ReadBuffer(buffer[0], length(buffer));
      if bfVersion = BSAHEADER_VERSION_SSE then
        lz4DecompressToUserBuf(@buffer[0], length(buffer), @result[0], length(result))
      else
        DecompressToUserBuf(@buffer[0], length(buffer), @result[0], length(result));
    end;
  end
  else
  begin
    SetLength(result, aSize);
    if aSize > 0 then
      bfStream.ReadBuffer(result[0], aSize);
  end;
end;

// <<<<<---------------------  End

// added: open the bsa is Hashcheck only mode.
// filename generation is skipped.
// also the bsa only grant access to the directory specified in TwbBSAFile.create
procedure TwbBSAFile.ReadDirectoryHash(searchhash: uInt64);
var
  i, j: integer;
  OldPos: Int64;
  NewPos: Int64;
  totalFileNameLength: Cardinal;
begin
  bfStream.position:= 0;
  if bfStream.ReadSignature <> 'BSA' then
    raise Exception.Create(bfFileName + ' is not a valid BSA file');
  bfVersion:= bfStream.ReadCardinal;
  if not bfVersion in [BSAHEADER_VERSION_SK, BSAHEADER_VERSION_SSE] then
    raise Exception.Create(bfFileName + ' is an unsupported version: ' + IntToStr(bfVersion));
  bfOffset:= bfStream.ReadCardinal;
  if bfOffset <> $24 then
    raise Exception.Create(bfFileName + ' has unexpected Offset: ' + IntToStr(bfOffset));
  bfFlags:= bfStream.ReadCardinal;

  SetLength(bfFolders, bfStream.ReadCardinal);
  bfStream.ReadCardinal;
  bfStream.ReadCardinal;
  totalFileNameLength:= bfStream.ReadCardinal;
  bfFileFlags:= bfStream.ReadCardinal;
  OldPos:= bfStream.position;
  for i:= Low(bfFolders) to High(bfFolders) do
    with bfFolders[i] do
    begin
      bfStream.position:= OldPos;
      Hash:= bfStream.ReadUInt64;
      // if the folder is the one we are looking for then parse it
      if Hash = searchhash then
      begin
        bfHashFolder:= @bfFolders[i];
        SetLength(Files, bfStream.ReadCardinal);
        if bfVersion = BSAHEADER_VERSION_SSE then
        begin
          bfStream.ReadCardinal; // skip unk32
          NewPos:= bfStream.ReadInt64;
        end
        else
          NewPos:= bfStream.ReadCardinal;
        bfStream.position:= NewPos - totalFileNameLength;
        Name:= bfStream.ReadStringLen;
        for j:= Low(Files) to High(Files) do
          with Files[j] do
          begin
            Hash:= bfStream.ReadUInt64;
            Size:= bfStream.ReadCardinal;
            Offset:= bfStream.ReadCardinal;
          end;
        Break;
      end
      else
      // else, jump to another
      begin
        bfStream.ReadCardinal; // jump over file_size
        bfStream.ReadCardinal;
        if bfVersion = BSAHEADER_VERSION_SSE then
          bfStream.ReadInt64;
        OldPos:= bfStream.position;
      end;
    end;
end;

procedure TwbBSAFile.ReadDirectoryIndex(index, indexfd: integer);
var
  NewPos: Int64;
  totalFileNameLength: Cardinal;
  sseExtraOffset: integer;
begin
  bfStream.position:= 0;
  if bfStream.ReadSignature <> 'BSA' then
    raise Exception.Create(bfFileName + ' is not a valid BSA file');
  bfVersion:= bfStream.ReadCardinal;
  if not bfVersion in [BSAHEADER_VERSION_SK, BSAHEADER_VERSION_SSE] then
    raise Exception.Create(bfFileName + ' is an unsupported version: ' + IntToStr(bfVersion));
  bfOffset:= bfStream.ReadCardinal;
  if bfOffset <> $24 then
    raise Exception.Create(bfFileName + ' has unexpected Offset: ' + IntToStr(bfOffset));
  bfFlags:= bfStream.ReadCardinal;
  bfStream.ReadCardinal;
  SetLength(bfFolders, 1);
  bfStream.ReadCardinal;
  bfStream.ReadCardinal;
  totalFileNameLength:= bfStream.ReadCardinal;
  bfFileFlags:= bfStream.ReadCardinal;

  if bfVersion = BSAHEADER_VERSION_SSE then
    sseExtraOffset:= 8
  else
    sseExtraOffset:= 0;

  bfStream.position:= bfStream.position + (16 + sseExtraOffset) * indexfd;
  with bfFolders[0] do
  begin
    Hash:= bfStream.ReadUInt64;
    bfStream.ReadCardinal;
    SetLength(Files, 1);
    if bfVersion = BSAHEADER_VERSION_SSE then
    begin
      bfStream.ReadCardinal; // skip unk32
      NewPos:= bfStream.ReadInt64;
    end
    else
      NewPos:= bfStream.ReadCardinal;
    bfStream.position:= NewPos - totalFileNameLength;
    Name:= bfStream.ReadStringLen;
    bfStream.position:= bfStream.position + 16 * index;
    with Files[0] do
    begin
      Hash:= bfStream.ReadUInt64;
      Size:= bfStream.ReadCardinal;
      Offset:= bfStream.ReadCardinal;
      // feedback
      Inc(pBar);
      if pBar mod 50 = 0 then
        ProgressBar.position:= Int64Rec(bfStream.position).Lo;
      // -------------
    end;
  end;
end;

// -----Public call for getting file (folder+filename+ext) (extension must be separated from the filename).
// -----The data is returned in the buffer: tbytes
// -----if the boolean getFile is set to false, then is just a fileexists check
// -----If the bsa has been open in the Hashcheck only mode, then the file must be in the pre-opened folder
function TwbBSAFile.getFile(folder, filename, ext: string; getFile: boolean; var buffer: tbytes): boolean;
var
  i, j: integer;
  bfdr: TwbBSAFolderRec;
  bfile: TwbBSAFileRec;
begin
  result:= false;
  buffer:= nil;
  if bdirectIndexMode then
  begin
    bfdr:= bfFolders[0];
    bfile:= bfdr.Files[0];
    buffer:= GetData(bfile.Offset, bfile.Size);
    Exit;
  end;
  if hashFdrMode then
    Exit(getFileHash(folder, filename, ext, getFile, buffer));
  if bfFolderMap.Find(folder, i) then
  begin
    bfdr:= bfFolders[integer(bfFolderMap.Objects[i])];
    if bfdr.Map.Find(filename + ext, j) then
    begin
      if getFile then
      begin
        bfile:= bfdr.Files[integer(bfdr.Map.Objects[j])];
        buffer:= GetData(bfile.Offset, bfile.Size);
      end;
      result:= True;
    end;
  end;
end;

// private function, this is automatically called if the bsa has been open in the Hashcheck only mode
function TwbBSAFile.getFileHash(folder, filename, ext: string; getFile: boolean; var buffer: tbytes): boolean;
var
  j: integer;
  filehash: uInt64;
begin
  result:= false;
  if not assigned(bfHashFolder) then
    Exit;
  filehash:= BSAhash64(filename, ext);
  for j:= low(bfHashFolder^.Files) to high(bfHashFolder^.Files) do
    if bfHashFolder^.Files[j].Hash = filehash then
    begin
      if getFile then
        buffer:= GetData(bfHashFolder^.Files[j].Offset, bfHashFolder^.Files[j].Size);
      result:= True;
    end;
end;

procedure createArchiveStream(var bStream: Tobject; const bsaFile: string);
begin
  if not assigned(bStream) then
  begin
    if lowercase(extractFileExt(bsaFile)) = '.ba2' then
      bStream:= TwbBA2File.Create(bsaFile)
    else
      bStream:= TwbBSAFile.Create(bsaFile, false);
  end;
end;

function getStringfromArchive(var bStream: Tobject; var buffer: tbytes; const bsaFile, sfolder, sFile, sExt: string; getFile: boolean): boolean;
begin
  if lowercase(extractFileExt(bsaFile)) = '.ba2' then
    result:= getStringfromBa2(TwbBA2File(bStream), buffer, bsaFile, sfolder, sFile, sExt, getFile)
  else
    result:= getStringfromBSA(TwbBSAFile(bStream), buffer, bsaFile, sfolder, sFile, sExt, getFile);
end;

function getFastFilefromArchive(var bStream: Tobject; var buffer: tbytes; const bsaFile: string; index, indexfd: integer): boolean;
begin
  if lowercase(extractFileExt(bsaFile)) = '.ba2' then
    result:= getFastFilefromBa2(TwbBA2File(bStream), buffer, bsaFile, index)
  else
    result:= getFastFilefromBSA(TwbBSAFile(bStream), buffer, bsaFile, index, indexfd)
end;

// call as direct access. Bsa file must be declared previously. If it has not been created, then it will be.
function getStringfromBSA(var bsaStream: TwbBSAFile; var buffer: tbytes; const bsaFile, sfolder, sFile, sExt: string; getFile: boolean): boolean;
begin
  result:= false;
  try
    if not assigned(bsaStream) then
      bsaStream:= TwbBSAFile.Create(bsaFile, True, sfolder); //
    result:= bsaStream.getFile(sfolder, sFile, sExt, getFile, buffer);
  except
  end;
end;

function getStringfromBa2(var ba2Stream: TwbBA2File; var buffer: tbytes; const bsaFile, sfolder, sFile, sExt: string; getFile: boolean): boolean;
var
  tRes: TwbBA2Resource;
begin
  result:= false;
  try
    if not assigned(ba2Stream) then
      ba2Stream:= TwbBA2File.Create(bsaFile); //

    if getFile then
    begin
      tRes:= ba2Stream.OpenResource(sfolder + '\' + sFile + sExt);
      if assigned(tRes) then
      begin
        buffer:= tRes.GetData;
        result:= True;
      end;
      tRes.free;
    end
    else
      result:= ba2Stream.ResourceExists(sfolder + '\' + sFile + sExt);
  except
  end;
end;

function getFastFilefromBSA(var bsaStream: TwbBSAFile; var buffer: tbytes; const bsaFile: string; index, indexfd: integer): boolean;
begin
  result:= false;
  try
    if not assigned(bsaStream) then
      bsaStream:= TwbBSAFile.Create(bsaFile, false, '', index, indexfd); //
    result:= bsaStream.getFile('', '', '', True, buffer);
  except
  end;
end;

function getFastFilefromBa2(var ba2Stream: TwbBA2File; var buffer: tbytes; const bsaFile: string; index: integer): boolean;
var
  tRes: TwbBA2Resource;
begin
  result:= false;
  try
    if not assigned(ba2Stream) then
      ba2Stream:= TwbBA2File.Create(bsaFile, index); //
    tRes:= ba2Stream.OpenResource('');
    if assigned(tRes) then
    begin
      buffer:= tRes.GetData;
      result:= True;
    end;
    tRes.free;
  except
  end;
end;

Procedure freeStreamArchive(var bStream: Tobject);
begin
  if assigned(bStream) then
  begin
    if bStream is TwbBSAFile then
      TwbBSAFile(bStream).free;
    if bStream is TwbBA2File then
      TwbBA2File(bStream).free;
    bStream:= nil;
  end;
end;

/// --------------------
function getFuzListfromBa2(var ba2Stream: TwbBA2File; const bsaFile: string; l: tlist; aFolder: string; bsaIndex: integer): boolean;
begin
  result:= false;
  try
    if not assigned(ba2Stream) then
      ba2Stream:= TwbBA2File.Create(bsaFile); //
    result:= ba2Stream.exportFileListFuz(l, aFolder, bsaIndex);
  except
  end;
end;

function getFuzListfromBSA(var bsaStream: TwbBSAFile; const bsaFile: string; l: tlist; aFolder: string; bsaIndex: integer): boolean;
begin
  result:= false;
  try
    if not assigned(bsaStream) then
      bsaStream:= TwbBSAFile.Create(bsaFile, false); //
    result:= bsaStream.exportFileListFuz(l, aFolder, bsaIndex);
  except
  end;
end;

function getFuzListfromArchive(var bStream: Tobject; const bsaFile: string; l: tlist; aFolder: string; bsaIndex: integer): boolean;
begin
  if lowercase(extractFileExt(bsaFile)) = '.ba2' then
    result:= getFuzListfromBa2(TwbBA2File(bStream), bsaFile, l, aFolder, bsaIndex)
  else
    result:= getFuzListfromBSA(TwbBSAFile(bStream), bsaFile, l, aFolder, bsaIndex);
end;

// ------------------------------------
function getListfromArchive(var bStream: Tobject; const bsaFile: string; l: tstrings; bAll: boolean; aFolder, aExt: array of string): boolean;
begin
  if lowercase(extractFileExt(bsaFile)) = '.ba2' then
    result:= getListfromBa2(TwbBA2File(bStream), bsaFile, l, bAll, aFolder, aExt)
  else
    result:= getListfromBSA(TwbBSAFile(bStream), bsaFile, l, bAll, aFolder, aExt);
end;

function getListfromBa2(var ba2Stream: TwbBA2File; const bsaFile: string; l: tstrings; bAll: boolean; aFolder, aExt: array of string): boolean;
begin
  result:= false;
  try
    if not assigned(ba2Stream) then
      ba2Stream:= TwbBA2File.Create(bsaFile); //
    l.clear;
    result:= ba2Stream.exportFileList(l, bAll, aFolder, aExt);
  except
  end;
end;

function getListfromBSA(var bsaStream: TwbBSAFile; const bsaFile: string; l: tstrings; bAll: boolean; aFolder, aExt: array of string): boolean;
begin
  result:= false;
  try
    if not assigned(bsaStream) then
      bsaStream:= TwbBSAFile.Create(bsaFile, false); //
    l.clear;
    result:= bsaStream.exportFileList(l, bAll, aFolder, aExt);
  except
  end;
end;

// --inject

function injectFileInBSA(var bsaStream: TwbBSAFile; const bsaFile, bsafileTmp: string; tlistInject: TStringList): boolean;
begin
  result:= false;
  try
    if not assigned(bsaStream) then
      bsaStream:= TwbBSAFile.Create(bsaFile, false); //
    result:= bsaStream.InjectData(bsaFile, bsafileTmp, tlistInject);
  except
  end;
end;

function injectFileInBa2(var ba2Stream: TwbBA2File; const bsaFile, bsafileTmp: string; tlistInject: TStringList): boolean;
begin
  result:= false;
  try
    if not assigned(ba2Stream) then
      ba2Stream:= TwbBA2File.Create(bsaFile); //
    result:= ba2Stream.InjectData(bsaFile, bsafileTmp, tlistInject);
  except
  end;
end;

/// /{ TwbBA2File } - Based on xEdit for fallout4 https://github.com/TES5Edit/TES5Edit

constructor TwbBA2File.Create(const aFileName: string; index: integer);
begin
  bfFileName:= aFileName;
  bfFolderMap:= nil;
  bfStream:= TwbReadOnlyCachedFileStream.Create(aFileName, fmOpenRead);
  bfastFile:= index >= 0;
  if bfastFile then
    ReadDirectoryIndex(index)
  else
    ReadDirectory;
end;

destructor TwbBA2File.Destroy;
var
  i: integer;
begin
  FreeAndNil(bfStream);
  if assigned(bfFolderMap) then
  begin
    for i:= 0 to Pred(bfFolderMap.Count) do
      TStringList(bfFolderMap.Objects[i]).free;
    FreeAndNil(bfFolderMap);
  end;
  inherited;
end;

procedure TwbBA2File.ReadDirectory;
var
  i, j: integer;
  OldPos: Int64;
  NumChunks: Byte;
  folder: string;
begin
  if bfStream.ReadSignature <> 'BTDX' then
    raise Exception.Create(bfFileName + ' is not a valid BA2 file');
  bfVersion:= bfStream.ReadCardinal;
  if not((bfVersion = BA2HEADER_VERSION_FO4) or (bfVersion = BA2HEADER_VERSION_SF) or (bfVersion = BA2HEADER_VERSION_FO4B)) then
    raise Exception.Create(bfFileName + ' has unknown version: ' + IntToStr(bfVersion));

  bfType:= bfStream.ReadSignature;
  if (bfType <> 'GNRL') then
    Exit;

  // --------
  // and (bfType <> 'DX10') then
  // process only GNRL
  // raise Exception.Create(bfFileName + ' has unknown type: ' + String(bfType));

  fileCount:= bfStream.ReadCardinal;
  bfFileTablePosition:= bfStream.ReadInt64; // offset 16 - int64

  if (bfVersion = BA2HEADER_VERSION_SF) then
  begin
    bfStream.ReadCardinal;
    bfStream.ReadCardinal;
  end;

  OldPos:= bfStream.position;
  bfStream.position:= bfFileTablePosition;
  SetLength(bfFiles, fileCount);

  // feedback
  pBar:= 0;
  ProgressBar.Max:= High(bfFiles) * 3;

  for i:= Low(bfFiles) to High(bfFiles) do
  begin
    bfFiles[i].Name:= bfStream.ReadStringLen16;
    UpdatePBar(25);
  end;
  bfStream.position:= OldPos;

  if bfType = 'GNRL' then
  begin
    for i:= Low(bfFiles) to High(bfFiles) do
    begin
      UpdatePBar(25);
      bfFiles[i].NameHash:= bfStream.ReadCardinal;
      bfStream.ReadCardinal; // skip ext
      bfFiles[i].DirHash:= bfStream.ReadCardinal;
      bfStream.ReadCardinal; // skip unk0C
      bfFiles[i].Offset:= bfStream.ReadInt64;
      bfFiles[i].PackedSize:= bfStream.ReadCardinal;
      bfFiles[i].Size:= bfStream.ReadCardinal;
      bfStream.ReadCardinal; // skip BAADF00D
      bfFiles[i].isPacked:= bfFiles[i].PackedSize > 0;
    end;
  end
  else if bfType = 'DX10' then
  begin
    for i:= Low(bfFiles) to High(bfFiles) do
    begin
      bfFiles[i].NameHash:= bfStream.ReadCardinal;
      bfStream.ReadCardinal; // skip ext
      bfFiles[i].DirHash:= bfStream.ReadCardinal;
      bfStream.ReadByte; // skip unk0C
      NumChunks:= bfStream.ReadByte;
      bfStream.ReadWord; // skip chunkHeaderSize
      bfFiles[i].Height:= bfStream.ReadWord;
      bfFiles[i].Width:= bfStream.ReadWord;
      bfFiles[i].NumMips:= bfStream.ReadByte;
      bfFiles[i].DXGIFormat:= bfStream.ReadByte;
      bfFiles[i].CubeMaps:= bfStream.ReadWord;
      SetLength(bfFiles[i].TexChunks, NumChunks);
      for j:= Low(bfFiles[i].TexChunks) to High(bfFiles[i].TexChunks) do
        with bfFiles[i].TexChunks[j] do
        begin
          Offset:= bfStream.ReadInt64;
          PackedSize:= bfStream.ReadCardinal;
          Size:= bfStream.ReadCardinal;
          StartMip:= bfStream.ReadWord;
          EndMip:= bfStream.ReadWord;
          bfStream.ReadCardinal; // skip BAADF00D
        end;
    end;
  end;
  bfStartDataOffset:= bfStream.position;
  bfFolderMap:= TStringList.Create;
  bfFolderMap.Sorted:= True;
  for i:= Low(bfFiles) to High(bfFiles) do
  begin
    UpdatePBar(25);
    folder:= lowercase(unifiedExtractFilePath(bfFiles[i].Name));
    SetLength(folder, Pred(length(folder)));
    j:= bfFolderMap.IndexOf(folder);
    if not bfFolderMap.Find(folder, j) then
    begin
      bfFolderMap.AddObject(folder, TStringList.Create);
      if not bfFolderMap.Find(folder, j) then
        raise Exception.Create('Indexing error');
    end;
    TStringList(bfFolderMap.Objects[j]).AddObject(lowercase(unifiedExtractFileName(bfFiles[i].Name)), Tobject(i));
  end;
  for i:= 0 to Pred(bfFolderMap.Count) do
    TStringList(bfFolderMap.Objects[i]).Sorted:= True;
end;

procedure TwbBA2File.ReadDirectoryIndex(index: integer);
var
  fileCount: Cardinal;
begin
  if bfStream.ReadSignature <> 'BTDX' then
    raise Exception.Create(bfFileName + ' is not a valid BA2 file');

  bfVersion:= bfStream.ReadCardinal;
  if not((bfVersion = BA2HEADER_VERSION_FO4) or (bfVersion = BA2HEADER_VERSION_SF) or (bfVersion = BA2HEADER_VERSION_FO4B)) then
    raise Exception.Create(bfFileName + ' has unknown version: ' + IntToStr(bfVersion));

  bfType:= bfStream.ReadSignature;
  if (bfType <> 'GNRL') then
    Exit;
  fileCount:= bfStream.ReadCardinal;
  SetLength(bfFiles, 1); // the file will stored be at index 0
  bfFileTablePosition:= bfStream.ReadInt64; // offset 16 - int64

  if (bfVersion = BA2HEADER_VERSION_SF) then
  begin
    bfStream.ReadCardinal;
    bfStream.ReadCardinal;
  end;

  bfStartDataOffset:= bfStream.position + fileCount * 36;
  if bfType = 'GNRL' then
  begin
    // lets jump directly at the direct index
    bfStream.position:= bfStream.position + index * 36;
    bfFiles[0].NameHash:= bfStream.ReadCardinal;
    bfStream.ReadCardinal; // skip ext
    bfFiles[0].DirHash:= bfStream.ReadCardinal;
    bfStream.ReadCardinal; // skip unk0C
    bfFiles[0].Offset:= bfStream.ReadInt64;
    bfFiles[0].PackedSize:= bfStream.ReadCardinal;
    bfFiles[0].Size:= bfStream.ReadCardinal;
    bfStream.ReadCardinal; // skip BAADF00D
    bfFiles[0].isPacked:= bfFiles[0].PackedSize > 0;
  end;
end;

function TwbBA2File.exportFileList(l: tstrings; bAll: boolean; aFolder, aExt: array of string): boolean;
var
  i, j: integer;
  t: TStringList;
  fsize: Cardinal;
begin
  // test
  result:= false;
  if (bfType <> 'GNRL') then
    Exit;
  for i:= 0 to Pred(bfFolderMap.Count) do
    if bAll or validFolderInArchive(aFolder, bfFolderMap[i]) then
    begin
      t:= TStringList(bfFolderMap.Objects[i]);
      for j:= 0 to Pred(t.Count) do
      begin
        if bAll or validFileExtInArchive(aExt, t[j]) then
        begin
          fsize:= bfFiles[integer(t.Objects[j])].Size;
          l.AddObject(bfFolderMap[i] + '\' + t[j], Tobject(fsize));
          result:= True;
        end;
      end;
    end;
end;

function TwbBA2File.exportFileListFuz(l: tlist; aFolder: string; bsaIndex: integer): boolean;
var
  i, j: integer;
  t: TStringList;
begin
  // test
  result:= false;
  if (bfType <> 'GNRL') then
    Exit;
  ProgressBar.Max:= fileCount;
  pBar:= 0;
  for i:= 0 to Pred(bfFolderMap.Count) do
    if pos(aFolder, bfFolderMap[i]) = 1 then
    begin
      t:= TStringList(bfFolderMap.Objects[i]);
      for j:= 0 to Pred(t.Count) do
      begin
        UpdatePBar(pBarFrequencies);
        if pos(extractFileExt(t[j]), sfuzExt) > 0 then
        begin
          l.Add(tfuzExport.Create(bfFolderMap[i], t[j], integer(t.Objects[j]), 0, bsaIndex));
          result:= True;
        end;
      end;
    end;
end;

function TwbBA2File.GetFileName: string;
begin
  result:= bfFileName;
end;

function TwbBA2File.GetName: string;
begin
  result:= GetFileName;
end;

procedure TwbBA2File.ReadData(var buffer; Offset: Int64; Count: Int64);
begin
  bfStream.position:= Offset;
  bfStream.ReadBuffer(buffer, Count);
end;

function TwbBA2File.OpenResource(const aFileName: string): TwbBA2Resource;
var
  lPath, lName: string;
  i, j: integer;
begin
  result:= nil;
  if bfastFile then
    Exit(TwbBA2Resource.Create(Self, bfFiles[0]));

  lPath:= lowercase(extractfilePath(aFileName));
  SetLength(lPath, Pred(length(lPath)));
  lName:= lowercase(extractfileName(aFileName));
  if bfFolderMap.Find(lPath, i) then
    with TStringList(bfFolderMap.Objects[i]) do
      if Find(lName, j) then
        result:= TwbBA2Resource.Create(Self, bfFiles[integer(Objects[j])]);
end;

function TwbBA2File.ResourceExists(const aFileName: string): boolean;
var
  lPath, lName: string;
  i: integer;
begin
  result:= false;
  lPath:= lowercase(extractfilePath(aFileName));
  SetLength(lPath, Pred(length(lPath)));
  lName:= lowercase(extractfileName(aFileName));
  if bfFolderMap.Find(lPath, i) then
    result:= TStringList(bfFolderMap.Objects[i]).IndexOf(lName) <> -1;
end;

procedure TwbBA2File.ResourceList(const aList: tstrings; const aFolder: string = '');
var
  i: integer;
begin
  if not assigned(aList) then
    Exit;
  for i:= Low(bfFiles) to High(bfFiles) do
    aList.Add(lowercase(bfFiles[i].Name));
end;

constructor TwbBA2Resource.Create(aFile: pointer; var aFileRec: TwbBA2FileRec);
begin
  brFile:= aFile; // pointer on TwbBA2File
  brFileRec:= aFileRec;
end;

function TwbBA2Resource.GetData: tbytes;
var
  buffer: tbytes;
begin
  // GNRL resource
  if (brFileRec.Size <> 0) and (length(brFileRec.TexChunks) = 0) then
  begin
    if brFileRec.PackedSize <> 0 then
    begin
      SetLength(buffer, brFileRec.PackedSize);
      TwbBA2File(brFile).ReadData(buffer[0], brFileRec.Offset, length(buffer));
      SetLength(result, brFileRec.Size);
      DecompressToUserBuf(@buffer[0], length(buffer), @result[0], length(result));
    end
    else
    begin
      SetLength(result, brFileRec.Size);
      TwbBA2File(brFile).ReadData(result[0], brFileRec.Offset, length(result));
    end;
  end
  // DX10 texture
  else if length(brFileRec.TexChunks) <> 0 then
  begin
    { using only GNRL, so lets skip this part }
  end;
end;

function TwbBA2Resource.GetRawData: tbytes;
begin
  // GNRL resource
  if (brFileRec.Size <> 0) and (length(brFileRec.TexChunks) = 0) then
  begin
    SetLength(result, brFileRec.Size);
    TwbBA2File(brFile).ReadData(result[0], brFileRec.Offset, length(result));
  end
end;

function TwbBA2File.InjectZlibData(astream: tmemoryStream; fStream: TwbWriteCachedFileStream; var currentSize, currentPackedSize: Cardinal): Cardinal;
var
  buffer: tbytes;
  zcomp: TZCompressionLevel;
  cSize: integer;
begin
  SetLength(buffer, 0); // cleanup
  zcomp:= zcDefault;
  currentSize:= (astream.Size);
  ZCompress(astream.Memory, currentSize, pointer(buffer), cSize, zcomp);
  currentPackedSize:= cSize;
  result:= currentPackedSize;
  // writedata
  fStream.WriteBuffer(buffer[0], result);
  buffer:= nil;
end;

function TwbBA2File.InjectData(bsaFile, bsafileTmp: string; tlistInject: TStringList): boolean;
var
  fStream: TwbWriteCachedFileStream;
  tmpiName: string;
  i, index: integer;
  fPos, fPosEnd: Int64;
  currentSize, currentPackedSize, outSize: Cardinal;
  astream: tmemoryStream;
begin
  ProgressBar.Max:= fileCount;
  pBar:= 0;
  result:= false;
  fStream:= nil;
  if (bfType <> 'GNRL') then
    Exit;
  try
    try
      fStream:= TwbWriteCachedFileStream.Create(bsafileTmp);
      fStream.position:= 0;
      bfStream.position:= 0;
      // copyheader+datatable
      fStream.CopyFrom(bfStream, bfStartDataOffset);
      fPosEnd:= fStream.position;
      // data
      for i:= Low(bfFiles) to High(bfFiles) do
      begin
        fPos:= fStream.position;
        bfStream.position:= bfFiles[i].Offset;
        currentSize:= bfFiles[i].Size;
        currentPackedSize:= bfFiles[i].PackedSize;
        tmpiName:= unifiedFilename(bfFiles[i].Name);

        if tlistInject.Find(tmpiName, index) then
        begin
          astream:= tmemoryStream(tlistInject.Objects[index]);
          astream.position:= 0;
          if bfFiles[i].isPacked then
            InjectZlibData(astream, fStream, currentSize, currentPackedSize)
          else
          begin
            currentSize:= (astream.Size);
            // writedata
            fStream.CopyFrom(astream, currentSize);
          end;
        end
        else
        begin
          // simple copy routine
          if bfFiles[i].isPacked then
            outSize:= currentPackedSize
          else
            outSize:= currentSize;
          // writedata
          fStream.CopyFrom(bfStream, outSize);
        end;
        fPosEnd:= fStream.position;
        // write new offset and new size:
        { offset
          16: filetable, int64
          24: bfFiles_startTable  size of bfFile: 36
          +16 = offset int64
          +24 = Packedsize
          +28 = Size
        }
        fStream.position:= 24 + i * 36 + 16;
        fStream.WriteInt64(fPos);
        fStream.WriteCardinal(currentPackedSize);
        fStream.WriteCardinal(currentSize);
        // write data
        fStream.position:= fPosEnd;
        UpdatePBar(25);
      end;
      // stringTable
      bfStream.position:= bfFileTablePosition;
      fStream.CopyFrom(bfStream, bfStream.Size - bfFileTablePosition);
      // write new tableoffset
      fStream.position:= 16;
      fStream.WriteInt64(fPosEnd);
      result:= True;
    except
      On e: Exception do
        dofeedback(e.Message, True);
    end
  finally
    fStream.free;
  end;
end;


// ---------Inject BSA

function TwbBSAFile.SetFileCompressedFlag(a: Cardinal; compressed: boolean; addLen, addLen_flag: Cardinal): Cardinal;
begin
  // addlen: add the size of cardinal when compressed
  // addlen_flag: add the size of embed name if flag_9 is true
  if (bfFlags and BSAARCHIVE_COMPRESSFILES) <> 0 then
  begin
    if compressed then
      result:= a + addLen + addLen_flag
    else
      result:= (a + addLen_flag) or BSAFILE_COMPRESS;
  end
  else
  begin
    if compressed then
      result:= (a + addLen + addLen_flag) or BSAFILE_COMPRESS
    else
      result:= a + addLen_flag;
  end;
end;

procedure TwbBSAFile.InjectDataFile(fStream: TwbWriteCachedFileStream; tmpiName: string; Files: TwbBSAFileRec; tlistInject: TStringList);
var
  index: integer;
  fPos, fEndPos: Int64;
  compressed: boolean;
  astream, lz4outStream: tmemoryStream;
  // LOutFile: tfileStream;
  buffer: tbytes;
  cSize: integer;
  aSize, uSize, outSize, addLen: Cardinal;
  zcomp: TZCompressionLevel;
  // flag 9 embed ----->
  len_flag: Byte;
  addLen_flag: Cardinal;
begin
  // =========================
  fPos:= fStream.position; // end of the stream
  aSize:= Files.Size; // file size, with the compressed tag
  // =========================
  addLen:= 0; // add the size of cardinal for compressed data
  addLen_flag:= 0; // Total size on name buffer + size when bfFlag 9 is true
  // =========================
  compressed:= GetFileCompressedFlag(aSize);
  // ==========================
  if tlistInject.Find(tmpiName, index) then
  begin
    // if bfVersion = BSAHEADER_VERSION_SSE then // for now save as uncompressed  for SSE
    // compressed := false;
    // bfFlag_9
    if ((bfFlags and BSAARCHIVE_PREFIXFULLFILENAMES) <> 0) then
    begin
      bfStream.position:= Files.Offset;
      len_flag:= bfStream.ReadByte; // read string size
      addLen_flag:= len_flag + 1;
      bfStream.position:= Files.Offset; // move back
      fStream.CopyFrom(bfStream, addLen_flag); // Copy data
    end;

    astream:= tmemoryStream(tlistInject.Objects[index]);
    astream.position:= 0;
    if compressed then
    begin
      addLen:= 4;
      if bfVersion = BSAHEADER_VERSION_SSE then
      begin
        // LZ4
        uSize:= (astream.Size);
        lz4outStream:= tmemoryStream.Create;
        try
          cSize:= LZ4compressStream(astream, lz4outStream, 10);
          outSize:= cSize;
          fStream.WriteCardinal(uSize); // write uncompressed size
          fStream.CopyFrom(lz4outStream, outSize); // Write data:
        finally
          lz4outStream.free;
        end;
      end
      else
      begin
        // zlib
        zcomp:= zcDefault;
        uSize:= (astream.Size);
        ZCompress(astream.Memory, uSize, pointer(buffer), cSize, zcomp);
        outSize:= cSize;
        // ====================
        fStream.WriteCardinal(uSize); // write uncompressed size
        fStream.WriteBuffer(buffer[0], outSize); // Write data:
      end;
    end
    else
    begin
      outSize:= (astream.Size);
      fStream.CopyFrom(astream, outSize);
    end;
  end
  else
  begin
    // simple copy
    bfStream.position:= Files.Offset;
    fStream.CopyFrom(bfStream, aSize);
    outSize:= aSize;
  end;
  fEndPos:= fStream.position;
  // update file table ;
  fStream.position:= Files.uTableIndex;
  outSize:= SetFileCompressedFlag(outSize, compressed, addLen, addLen_flag);
  fStream.WriteCardinal(outSize);
  fStream.WriteCardinal(fPos);
  // move back to end of stream
  fStream.position:= fEndPos;
  buffer:= nil;
end;

function TwbBSAFile.InjectData(bsaFile, bsafileTmp: string; tlistInject: TStringList): boolean;
var
  fStream: TwbWriteCachedFileStream;
  i, j: integer;
  tmpiName: string;
begin
  result:= false;
  ProgressBar.Max:= fileCount;
  pBar:= 0;
  fStream:= nil;
  try
    try
      bfStream.position:= 0;
      fStream:= TwbWriteCachedFileStream.Create(bsafileTmp);
      fStream.position:= 0;
      // copyheader+datatable
      fStream.CopyFrom(bfStream, bfStartDataOffset);

      // crawl data
      for i:= Low(bfFolders) to High(bfFolders) do
        with bfFolders[i] do
          for j:= Low(Files) to High(Files) do
          begin
            tmpiName:= bfFolders[i].Name + '\' + Files[j].Name;
            InjectDataFile(fStream, tmpiName, Files[j], tlistInject);
            UpdatePBar(25);
          end;
      result:= True;
    except
      On e: Exception do
        dofeedback(e.Message + tmpiName, True);
    end;
  finally
    fStream.free;
  end;
end;

end.
