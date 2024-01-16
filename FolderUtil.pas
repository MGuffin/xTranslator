unit FolderUtil;
 
interface
 
type
  RFolderHelper = record
  strict private
    class function GetFolder(const aCSIDL: Integer): string; static;
  public
    class function GetMyDocumentsFolder: string; static;
    class function GetMyMusicFolder: string; static;
    // ... any other folders in which you are interested
  end;
 
implementation
 
uses
  ShlObj, // Needed for the CSIDL constants
  Windows;
 
  function SHGetFolderPath(hwnd: HWND; csidl: Integer; hToken: THandle;
    dwFlags: DWord; pszPath: LPWSTR): HRESULT; stdcall;
    forward;
  function SHGetFolderPath; external 'SHFolder.dll' name 'SHGetFolderPathW';
 
class function RFolderHelper.GetFolder(const aCSIDL: Integer): string;
var
  FolderPath: array[0 .. MAX_PATH] of Char;
begin
  SetLastError(ERROR_SUCCESS);
  if SHGetFolderPath(0, aCSIDL, 0, 0, @FolderPath) = S_OK then
    Result := FolderPath;
end;
 
class function RFolderHelper.GetMyDocumentsFolder: string;
begin
  Result := GetFolder(CSIDL_PERSONAL);
end;
 
class function RFolderHelper.GetMyMusicFolder: string;
begin
  Result := GetFolder(CSIDL_MYMUSIC);
end;
 
end.