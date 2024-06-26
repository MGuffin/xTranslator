program xTranslator;

uses
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  Forms,
  TESVT_bsa in 'TESVT_bsa.pas',
  TESVT_Const in 'TESVT_Const.pas',
  TESVT_Dialog in 'TESVT_Dialog.pas' {FormDialog},
  TESVT_EspCompareOpts in 'TESVT_EspCompareOpts.pas' {Form6},
  TESVT_espDefinition in 'TESVT_espDefinition.pas',
  TESVT_FastSearch in 'TESVT_FastSearch.pas',
  TESVT_fstreamSave in 'TESVT_fstreamSave.pas',
  TESVT_HeuristicSearch in 'TESVT_HeuristicSearch.pas',
  TESVT_LangPref in 'TESVT_LangPref.pas' {Form3},
  TESVT_main in 'TESVT_main.pas' {Form1},
  TESVT_replaceAll in 'TESVT_replaceAll.pas' {Form5},
  TESVT_search in 'TESVT_search.pas' {Form2},
  TESVT_searchandreplace in 'TESVT_searchandreplace.pas' {Form4},
  TESVT_SearchText in 'TESVT_SearchText.pas' {FormsText},
  TESVT_sharedVTProc in 'TESVT_sharedVTProc.pas',
  TESVT_typedef in 'TESVT_typedef.pas',
  TESVT_Ressources in 'TESVT_Ressources.pas',
  TESVT_Hint in 'TESVT_Hint.pas',
  TESVT_scriptPex in 'TESVT_scriptPex.pas',
  TESVT_AddId in 'TESVT_AddId.pas' {Form8},
  TESVT_OldDialog in 'TESVT_OldDialog.pas' {Form9},
  TESVT_EspStruct in 'TESVT_EspStruct.pas' {Form10},
  TESVT_batch in 'TESVT_batch.pas' {Form11},
  TESVT_ApplySSTOpts in 'TESVT_ApplySSTOpts.pas' {Form12},
  TESVT_SpellCheck in 'TESVT_SpellCheck.pas',
  TESVT_regex in 'TESVT_regex.pas' {Form13},
  TESVT_XMLExportOpts in 'TESVT_XMLExportOpts.pas' {FormXmlOpt},
  TESVT_delocOpts in 'TESVT_delocOpts.pas' {FormLocOpt},
  TESVT_Browser in 'TESVT_Browser.pas' {FormBrowser},
  TESVT_TranslateFunc in 'TESVT_TranslateFunc.pas',
  TESVT_SSTFunc in 'TESVT_SSTFunc.pas',
  TESVT_Undo in 'TESVT_Undo.pas',
  TESVT_StringsFunc in 'TESVT_StringsFunc.pas',
  TESVT_XMLFunc in 'TESVT_XMLFunc.pas',
  TESVT_MainLoader in 'TESVT_MainLoader.pas',
  TESVT_spOptions in 'TESVT_spOptions.pas' {FormSpOpts},
  TESVT_DialHTML in 'TESVT_DialHTML.pas' {FormHTML},
  TESVT_Fuz in 'TESVT_Fuz.pas',
  TESVT_Startup in 'TESVT_Startup.pas' {FormStartup},
  TESVT_VMAD in 'TESVT_VMAD.pas',
  TESVT_Colab in 'TESVT_Colab.pas' {FormColabId},
  TESVT_ColabFilter in 'TESVT_ColabFilter.pas' {FormColabFilter},
  TESVT_StringsStatus in 'TESVT_StringsStatus.pas',
  TESVT_Threads in 'TESVT_Threads.pas',
  TESVT_Codepage in 'TESVT_Codepage.pas' {Form14},
  TESVT_ChooseCP in 'TESVT_ChooseCP.pas' {Form15},
  TESVT_TranslatorApi in 'TESVT_TranslatorApi.pas',
  TESVT_NPCMap in 'TESVT_NPCMap.pas',
  TESVT_ToolBox in 'TESVT_ToolBox.pas' {Form16},
  TESVT_ToolboxOptions in 'TESVT_ToolboxOptions.pas' {Form17},
  TESVT_AdvSearch in 'TESVT_AdvSearch.pas' {AdvSearchForm},
  TESVT_DefUIGen in 'TESVT_DefUIGen.pas' {Form18},
  TESVT_ToolHeader in 'TESVT_ToolHeader.pas' {Form19},
  TESVT_FormData in 'TESVT_FormData.pas' {FormKeyWord},
  TESVT_Batcher in 'TESVT_Batcher.pas',
  TESVT_Input in 'TESVT_Input.pas',
  TESVT_HeaderList in 'TESVT_HeaderList.pas' {FormHList},
  TESVT_preProcessingOpts in 'TESVT_preProcessingOpts.pas' {Form20},
  Vcl.Themes,
  Vcl.Styles,
  TESVT_TagID in 'TESVT_TagID.pas' {Form21},
  TESVT_Templates in 'TESVT_Templates.pas' {Form22},
  TESVT_HeaderWizard in 'TESVT_HeaderWizard.pas' {Form23},
  TESVT_commandProcessor in 'TESVT_commandProcessor.pas' {Form24},
  TESVT_TranslatorApiDialog in 'TESVT_TranslatorApiDialog.pas' {Form25},
  TESVT_RegexUtils in 'TESVT_RegexUtils.pas',
  TESVT_RtlPreview in 'TESVT_RtlPreview.pas' {FormRtl};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'xTranslator';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFormDialog, FormDialog);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TAdvSearchForm, AdvSearchForm);
  Application.CreateForm(TFormKeyWord, FormKeyWord);
  Application.Run;
end.
