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
unit TESVT_Threads;

interface

uses Windows, Classes, SysUtils, TESVT_Const, TESVT_typedef, SyncObjs;

type
  TinitStringThread = class(TThread)
  private
    FLock: TCriticalSection;
    procedure doExecute;
  public
    constructor Create(aLock: TCriticalSection; CreateSuspended: boolean);
    destructor Destroy; override;
  protected
    procedure Execute; override;
  end;

var
  initStrThread: TinitStringThread;
  Lock: TCriticalSection;

implementation

constructor TinitStringThread.Create(aLock: TCriticalSection; CreateSuspended: boolean);
begin
  inherited Create(CreateSuspended);
  FLock:= aLock;
  FreeOnTerminate := true;
  Priority := tpNormal;
end;

destructor TinitStringThread.Destroy;
begin
  inherited;
end;

procedure TinitStringThread.Execute;
begin
  while not terminated do
  begin
    Sleep(25);
    Synchronize(doExecute);
  end;
end;

procedure TinitStringThread.doExecute;
var
  i: integer;
begin
  if (vocabBaselist.count > 0) and (idleVocabCounter < vocabBaselist.count) then
  begin
    FLock.Acquire;
    for i := idleVocabCounter to idleVocabCounter + idleVocabStringInitThreshold do
    begin
      if i > pred(vocabBaselist.count) then
        break;
      tskystr(vocabBaselist[i]).initStrings(false);
    end;
    idleVocabCounter := idleVocabCounter + idleVocabStringInitThreshold;
    FLock.release;
  end
  else
    terminate;
end;

end.
