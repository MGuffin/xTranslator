# _xTranslator

This software is an advanced tool for to translate Skyrim, SkyrimSE and Fallout4 mods from a language to another one.

it's actually the same tool for each game, and comes with a different name:
-tesvTranslator for Skyrim
-sseTranslator for Skyrim SpecialEdition
-fallout4Translator for Fallout4
-falloutNVTranslator for FalloutNV
You can choose and change your game workspace on the fly, so it's not needed to get it from every pages.

------------------------------------------------------------	
The home for this tool is the Nexus, it's made on freetime and the access is free. Please, do not upload it elsewhere.
------------------------------------------------------------	

Features of the tool:

Edition Modes :
1)*Esp mode* can load esp/esm file and perform direct translation
2)*Strings mode* can perform translation on strings files that come with localized esp (STRINGS, DLSTRINGS, ILSTRINGS). This mode does not alter esp/esm (updated and functionnal). This mode is DEPRECATED, use the HybridMode instead that allows much more flexibility.
3)*Hybrid Mode*: load a localized Esp as a Records/fields layout for editing Strings files. (The esp doesn't have to be in the Skyrim directory, but the Strings files must be in a .\strings folder just next to the esp) 
4)*MCM/Translate*: Those files are used by addons that support MCM menu (SkyUI), but also by vanilla skyrim. They contains all UI strings.
5)*PapyrusPex*: The tool includes a papyrus pex decompiler that allows to translate pex files. Internals vars will be locked as non-editable.

Functionalities:
-Build dictionaries of strings pairs from existing *.Strings files
-EspCompare tool: build string pairs directly between 2 esps with different languages.

-Direct strings Search
-Fuz Mapping and Fuz Player
-Heuristic strings search with translation suggestions on the fly
-SpellCheck for your language inline with MSWORD or Hunspell/OpenOffice Dics
-RegEx search/replace/translation
-Tools for various operations like OldDialog, .String files compare, Chinese Traditional/Simplfied conversion etc...
-Diff-viewer, that shows difference between original/updated source-strings
-Support all known encoding for Skyrim/Fallout4
-Alias Tool Check: verify alias integrity between source string and its translation.
-Special DialogList for DIAL/INFO/QUST data
-Search and replace tool with batch support
-Support for some Online ApiTranslation
-Custom dictionary

-Undo
-XML import/export
-Extracts files from BSA/BA2 archives
-Inline dictionary, built on the fly with the existing string pairs.(for latin/english language)
-The UI has been localized and can be easily translated (Ressources can be found in the \res folder, just create a new folder with the desired language. The 'res.ini' file contains all strings used by TESVT. If you are using extended charset, I suggest to save it in utf-8 with BOM, so there will be no codepage issue)


Some hidden ShortCuts:
Ctrl-Shift-S:	Export/finalize current
Ctrl-R: 		Quick AutoTranslate on selection
Shift-F12:		Generate Derived strings


Important: This translator is *not* a tool for to localize/delocalize *.esp/*.esm file. Please, use xEdit for that.

Notes & Crédits: 
UIlocalization: Inherited from TesvTranslator & fallout4translator (some Translations are not up to date)
-Japanese by Vivanon, Kuroko137 & BowmoreLover (Up to date)
-German by Slavovitsh, nnw,Scharesoft & X00LA (Partial)
-Polish by TomBrightblade (Partial)
-Chinese Simplified & Chinese Traditional by Ruinelec, Windkenlu, Rebya & 0xb160d1c5 (Partial)
-Spanish by Fiama & Pashalsta (Up to Date)
-Portuguese by Vulthoryu (Partial)
-Russian by Iclinet (Partial)
-Korean by -Ren- (Partial)
-Italian by alfx3 (Partial)
-Slovak by pe-pe143 (Partial)


Special thanks to 
Bethesda
Tes5edit team for their work
Alexander Blade for the last fallout4 OpCode in Pex
Internet for the gigantic resource


Note on extra Components used by this Tool:

-SynEdit: https://github.com/TurboPack/SynEdit
-VirtualStringTree: written by Mike Lischke (www.soft-gems.net).
-Diff: Search Heuristic compare is using the Diff Unit http://www.angusj.com/delphi/textdiff.html credit to Angus Johnson - angusj-AT-myrealbox-DOT-com
-HtmlViewer: https://github.com/BerndGabriel/HtmlViewer
-ZLibex: 1.2.3 http://www.dellapasqua.com and xEdit https://github.com/TES5Edit
-LZ4 https://github.com/atelierw/LZ4Delphi and xEdit https://github.com/TES5Edit
-Part of the code for Bsa/ba2/Stream loading from xEdit  https://github.com/TES5Edit
-OmniXML: https://github.com/mremec/omnixml
-PCRE Regex library: http://www.regular-expressions.info/delphi.html (unicode version)
-Hunspell Module is distributed under the Mozilla Public License Version 1.1 https://github.com/hunspell/hunspell/releases
-xmw to wav converter: xWMAEncode.exe from directX SDK/microsoft
-Madshi exception handler [non commercial version] (http://www.madshi.net/) 

Online translation support, the tool can also use: 

DeepL: https://www.deepl.com/translator
MsTranslator: http://www.bing.com/translator
OpenAI: https://api.openai.com/
GoogleTranslate(web end point only): https://translate.google.com/ 
Youdao: https://translate.youdao.com/
Baidu: https://www.baiduinenglish.com/
	
------------------------------------------------------------	
History

version 1.5.9:
-UI/Translation: In the regex translation tool, the end of line tag usage has been slightly modified: you can now use '\r' to add 'CR' and/or '\n' to add 'LF'
-Internal: Added full support for Small and Medium master for Starfield. (BGS broke everything there, so this probably needs further testing...)
-Internal: Updated Starfield header version

version 1.5.8:
-Internal: Added support for Medium & light Master analysis (fuzmap, npcmap, processing, keyword etc...). Note: the support is limited for now, and wont work correctly for more than one cascading master.
-Internal: Updated Starfield and Fallout76 header version
-Dictionary: Added new base game master to the vocabulary setting. 
-UI: french UI resource updated. Thx to plplecuyer.

version 1.5.7b:
-Custom txt (McM): Sst Dictionaries have been improved for custom txt. 
-Custom txt (McM): Some parsing regex have been added and adjusted 
-Custom txt (McM): It's now possible to change text codepage on load, on the fly.
-UI/internal: The synedit component has been updated to the TurboPack update https://github.com/TurboPack/SynEdit
-UI: In the edit windows, it's now possible de change the text editor to a LiteVersion (ie: TRichEdit), which can handle RTL display (the option is available in the editor context menu->display). This lite editior is faster for heavy unicode language (east, farsi etc...) but doesn't handle hightlight and search, dynamic corrections etc...
-Arabic: arabic RTLtoLRT conversion (menu ->tool -> language specific tools) has been improved, so it's possible to choose the method, and see a preview of the result. 
-Internal: Fixed an issue with McM/customTxt compare tool.
-UI/Internal: loading a lot of PexScripts from outside BSA at the same time has been optimized and now offers the possibility to discard Pex without translation needed.

version 1.5.6:
-Custom txt import: Fixed an issue with lang suffixe not applied correctly when extracting a txt file from a bsa.
-Custom txt import: Fixed an issue with McMCompare.
-Arabic: Added a very experimental and early alpha test for arabic RTLtoLRT conversion (menu ->tool -> language specific tools)

version 1.5.5:
-Custom txt import:Text importing has been rewritten to allow importing custom text files as long as their string definitions are handled on single lines. This applies to Mcm/translate default files, as well as rftp, Skyrim Desc files, and so on. The parsing definition is located in [xTranslator\misc\customTxtDefinition.txt] and can be edited as needed.
-Starfield: Added new REC:FIELD definitions 
-Starfield: Added new game esm in the vocabulary list 
-Fallout76: Added new REC:FIELD definitions
-UI: Fix for high resolution scaling > 100%.

version 1.5.4 quick Maintenance update:
-fix for the new Fallout4 ba2 archive header.
-Added the free CreationClub mods in vocabulary list.

version 1.5.3:
-Translation API: Added OpenAI support. You need to set the key in the Translation Apis options. You can also adjust the prompt if necessary, the model, and eventually the url. Note: OpenAI limits the number of requests/token per day. 
-UI: when hovering the translation meter widget you can see a tooltip with the raw numbers of translated/untranslated items.

version 1.5.2 Maintenance update:
Starfield: Updated new header info version
UI: updated Spanish UI translation, credit and thanks to Pashalsta.

version 1.5.1 Maintenance update:
Starfield: Updated new header info version
F76: Updated new header info version 

version 1.5.0:
UI/DialogAnalysis: Added a new data analysis to show conditions on dialog line when relevant. 
Internal: Fixed an crash that could occur when trying to generate a npcMap on 2 different versions of the same esp/esm loaded at the same time.
UI/TranslationApi: Reduced Google virtual array inconsistencies and added fallbacks to handle normalized string translation error.
UI/Vocabulary: Loading a lot of dictionaries as been greatly optimized.
Internal: a lot of small optimizations

version 1.4.20:
UI/TranslationApi: implemented an option to normalize texts containing <Alias> or <Number> before sending them to the translation API. This can significantly reduce costs and improve translation speed for mods that utilize a large number of similar strings with varying aliases and numbers.
UI/TranslationApi: fixed some URL encoding issues that could prevent correct queries in rare instances.
UI/TranslationApi: made some adjustments to query timers to prevent server errors with large arrays.
Internal: improved internal strings initialization.
UI: Updated Japanase UI, credits to Kuroko137.

version 1.4.19b:
UI/TranslationApi: Fixed an issue with apiTranslation being disabled while it should not in some cases.
UI/TranslationApi: Added a small statistic feedback in the log while running array apiTranslation.

version 1.4.19a
UI/TranslationApi: Fixed an issue that could lock the GoogleApi. The reliability of the googleAPI virtual array has also been slightly improved in the process. 
Internal/Translation: Using the fix-Number and fix-Alias subtool now only tag strings to partial if a change has been applied.

version 1.4.19
UI/TranslationApi: Array Api Translation has been overhauled and improved. Google Translate (free) has been added to automatic array translation. You can make a direct APItranslation on selection (context menu) or globally (main menu/toolbar) on all untranslated strings. Note: MSTranslatorAPI and DeeplAPI are way faster and a lot more reliable for big tasks.
Batch Processor: APITranslation and save dictionary commands have been added. See https://www.nexusmods.com/starfield/articles/283 for more details. 
UI: Adjusted rules for the Heuristic String exclusion (former 'Lock non-translatable') tool. 
HeaderProcessor/internal: Fixed an issue with some fallback lookup from masters. 

version 1.4.18a
UI: fixed an issue with dialog swapping
FuzMap: Fixed an issue where unused voices references were still showing up.

version 1.4.18
UI/Editing: added a way to do a quick edit for short strings directly in the main list. The default activation is Ctrl-Enter for the Quick edit, and Enter to open the classic edit window. This setting can be inverted in the options. You can also use F1-F2-F3 to validate or tag close the string. When edited, 'Enter' validate the string like F1. 
UI: Added a new command tool (menu Tool->Lock non-translatable) to tag in yellow (locked) all strings that should not need translation. (the tag rules can be adjusted in the advanced options, tab: Non-translatable strings rules)
UI/Dictionaries: The vocabulary list has been reworked. You can now sort your dictionaries with sub folders. As before, the first dictionaries loaded (highest in list) take priority when a source has multiple translation. All new dictionaries goes in the default folder. 
UI: In the edit window, first edit tab, a dropdownList has been added to see all keywords and other relevant data related to the edited item. You can use F12 to toggle the dropdown view.
UI: Dialogs are now correctly switched to next logical dialog even if the current editing tab is not the DialogView Tab.
HeaderProcessorWizard: The wizard has been updated so it's possible apply processor rules to multiple esm files with few clicks as long as they are all installed in the game\data folder.
HeaderProcessor: the UI has been slightly adjusted. Added a direct Regex support. Backrefs can be captured and sent in the header definition with %1 to %9 references. If the regex fails the rule is not processed.
UI: Some minor adjustments

version 1.4.17
UI/XML: It is now possible to drag and drop XML files over a loaded ESP/ESM for quick translation (This directly use the default options).
UI/BatchProcessor: Made some internal adjustments. Batch files will now be correctly saved with the .txt extension. Added the commands command=closeAll and command=loadAllMasters.
UI Feedback: Lookup-failed strings now correctly receive a placeholder string replacement.
UI/Internal: Fixed an issue that prevented keywords from being correctly identified when their master ID was greater than 00. (issue introduced in 1.4.13)
UI: Fixed an issue where a window could be locked in certain circumstances.
UI: Fixed minor issues related to vcl theme switching.
UI: Added a LoadAllMaster button in the main tool bar.
UI: fixed an issue where validating a string in the edit window did not move to the next logical record. 
Internal: The applysst function has been optimized slightly.
HeaderProcessor: Added some new internal data analysis for virtual keywords (global value, item price, GBFM analysis).
TranslationAPI: Fixed an issue when adding new supported languages for MS Translate and DeepL.
UI: Some operations are now prohibited if an esp/esm has been forced into the wrong workspace. The wrong workspace UI feedback has also been changed to be visible with alternate vcl themes.

version 1.4.16
-UI/BatchProcessor: Added the first iteration of a batch processor that allows to process files with various commands (language selection, sstImport, xmlImport, finalization, etc...). (Menu->Wizard->BatchProcessor). More info will be available here: https://www.nexusmods.com/starfield/articles/283
-UI/DialogView: fixed an issue with the display of the current Info record reference
-Internal/Heuristic: Heuristic translation is now ~40% faster and should be, overall, more accurate. Speed is directly correlated to the size of the loaded vocabulary. Heuristic distance results are also slightly modulated against the text size. 

version 1.4.15
-Internal: Updated Version Control for Fallout76

version 1.4.14
-Internal: fixed an issue with some archives using lz4 compression that prevented files to be extracted
-UI: Fixed some minor issues with the integrated bsa/ba2 browser
-UI: Fixed some minor graphical glitches with the gray theme

version 1.4.13
-Internal: Fixed an issue with espcompare that caused it to mix up records with the same FormID but different master Index in the same .esp file. As a result, espcompare should now be more versatile when comparing .esp files with different masters.

version 1.4.12
-NPCmap: Dialog analysis should be quite complete now for Starfield
-UI/Dialog view: Dialog items are now sorted by scene in the Dialog view when it's relevant. You will need to [load all masters] to be able to get all references for mods that edit quests from masters.
-Editing/Heuristic: Slight optimizations, and improved status bar feedback during the process. 
-Internal: Fixed an old issue were a dictionary could fail to apply on records with no Edidname, if the esp have different masters than the ones registered in the dictionary.
-UI: Improved RegEx feedback in search fields.

version 1.4.11
-Editing: fixed a critical error when using heuristic editing
-UI/Filter: Filters have been reworked to offer a more streamlined logic. You can also select a specific warning by right-clicking the warning filter button.

version 1.4.10
-UI: xTranslator should now be fully "dpi aware" for High resolution monitors.
-UI/Editing: It's now possible to add a linebreak in RegEx Tool output (use \n)
-UI: added an AutoBackup system. Off by default, you can setup a timer to save a backup dictionary (This Dictionary will be saved in the _xTranslator\UserDictionaries\[Game]\Auto\ folder, in case you need to restore it.This setting is saved by game. Note: this feature is in alpha test, please report any issue with it.
-Editing: Fixed an issue with breakingChars in the edit window.
-internal: IDE updated to Delphi 11.3.
-Internal: Many internal improvements and adjustments.

version 1.4.9 Alpha
-UI/Internal: Fixed a crash related to FuzMap on Starfield.
-UI: fixed an issue where drag&drop was disabled after switching Theme.
-UI: The translator meter should now hide correctly when closing files.
-FuzMap: it's now possible to map and read fuz voices whose name has been overridden in INFO record.
-Internal: fixed an issue where the state [translated, partial etc...] of identical strings could be mixed when they don't have the same state in a dictionary.
-UI: Using the application name to define the workspace has been fixed. Available exe names are [fo4Translator.exe, tesvTranslator.exe, fonvTranslator.exe, sseTranslator.exe, f76Translator.exe, sfTranslator.exe].

version 1.4.8 Alpha
-UI: Added limited Theme support. In the menu option->display, you can choose between default/light/grey/dark. You can also adjust the luminosity of the editing components. It's not full theme support because of of the general color code used in xTranslator.
-UI/Internal: The NPCmap as been updated. NPC are now linked to ~80% of dialogs. Still some decoding to go to be able to get everything.
-UI/Internal: The fuzMap generation has been optimized.
-UI: the Translation meter widget has been moved from the PageControl headers and redesigned (This had to be done to support Theme). It can also be hidden (main list Context menu->Translation meter widget)
-UI: Many UI adjustments. 
-Internal: Many internal improvements and adjustments.
-Updated Japanase UI, credits to Kuroko137.

version 1.4.7 Alpha
-UI: When you search text in vocabulary (edit window>searchTab), the searched text will be automatically highlighted in the full text view. 
-Internal: fix for a crash when selecting specific params when applying sst dictionary.

version 1.4.6 Alpha
-Internal: Sst&cache loading has been greatly improved (again), up to 10 times faster, especially if you have a lot of dictionaries. You will need to regenerate your game dictionaries (options -> dictionary to take advantage of this if you didnt do that @ v 1.4.3-alpha release. User dictionaries will gain the optimization as soon as they are opened and resaved.
UI/Strings: "Load String As .Translation" does not require the 3 strings/dStrings/ilStrings files to be able to perform. You can now load just one. (Note: if the files 3 are in the same folder or in a bsa, the tool automatically load the whole set)
-Internal/EspCompare: Fixed a rare issue with espcompare when record of the same type have the same base formID in multiple master
-Internal: fixed few minor issues.

version 1.4.5 Alpha
-UI/Search: In the advanced search it's now possible to search by keyword. Keywords are special keys identifier that define a behavior or rules for a lot of records in Bethesda games. Note that you will need to load all masters of the edited mod to be able to get access to all the fallback references (you can load all masters in the tool menu)
-UI/TranslatorAPI: You can now select as many items as you want and send them to Array translator API (Deepl/MSTranslator only). A confirmation box will tell you an evaluation of how many chars will be send for translation. Note that, ultimately, you will be limited by the state of your API account. Free account usually allow ~500000 chars per month.
-internal: items initialization moved into a TThread: Localized files will load faster.
-UI: added CreationClub default mods in the vocabulary list for Skyrim SE/AE.

version 1.4.4 Alpha
-Internal: fixed an issue with the Starfield dictionaries since the game files use shared strings ID in duplicated record. Please regenerate your starfield dictionaries (options->dictionaries) if you use some.
-Internal: Added an ESM cache system for large localized ESM files. This allows for much faster reloading after the cache has been generated once. Note: the cache will be regenerated if the original ESM is updated. The cache system can be disabled in the options.
-Internal: sst&cache loading has been greatly improved. You might want to regenerate your game dictionaries (options -> dictionary to take advantage of this. User dictionaries will gain the optimization as soon as they are opened and resaved.
-Internal: Large Esm loading and large string finalizing have been optimized
-Internal: The virtual tree view component has been updated to the last version.
-UI: Fixed an issue where the treeheaders were being cropped in very high resolutions. (The icon are still small for now, however. xTranslator is not fully "dpi aware" at this time)
-UI: added a warning if you try to open xTranslator in strings only mode. It's here as a legacy method, but should not be used for deep translation. Open the esm/esp instead.
-general: the old string only cache system has been removed as it was deprecated since a long time.
-HeaderProcessor: added internal call for Starfield. 


version 1.4.3 Alpha
-UI: QuestList/Dialog view have been updated for Starfield. 
Open the Quest tab, then double-click on a quest to open the dialog catalog for that quest.
-Internal:  Adjustments relative to Starfield esm data.


version 1.4.2 Alpha
-FuzMap: updated for Starfield. However: NPC relation may be incomplete.
You will need a third party tool to convert the audio: Download the Command-Line64bits at https://vgmstream.org/  and dezip it in the xTranslator\tool\ folder, with no subfolder. 
Then open xTranslator in the starfield workspace, load Starfield.esm, open the Npc/Fuzmap tab to generate the map, the you can listen the dialogs.
-Pex Decompiler: Updated for Starfield. Pex can be opened directly or directly in Ba2 archives. The name for new OPCode are placeholder. 
-Internal:  adjustments relative to Starfield esm data.
-Updated Japanase UI, credits to Kuroko137.


version 1.4.1 Alpha
-Xml: Xml generated with strings only will fallback to string to string comparison, this should avoid the "old data format for XML error". Note that the string mode is quite deprecated at this time. It's preferable to load the esm directly even to edit strings only.
-General: Added some languages data in the default setup.
-Internal: adjustment relative to Starfield esm data.
-UI: added an internal option to verbose localized loading warning.

version 1.4.0 Alpha
-Added basic support for StarField (alpha)
(note: some features does not work yet in the Starfield workspace)


version 1.3.9a (Quick Maintenance update)
-Internal: fixed version Header for Fallout76

History
version 1.3.9 (Quick Maintenance update)
-TranslationAPI: Fixed connectivity issue with DeepL
-Wizard: Fixed an issue with ba2 backup not being created in some cases.
-UI: Fallout76PTS now points on Steam registry.


version 1.3.8 (Quick Maintenance update)
-Updated Esm Header definition for Fallout76
-Wizard:Fixed an Issue with HeaderWizard injector in Polish Language.

version 1.3.7 (Quick Maintenance update SkyrimSE 1.6)
-Fixed defaut bsa alias paths.

version 1.3.6 (Quick Maintenance update for Fallout76 wizard header/injector)
-Wizard: can handle multi archives interface/moved internal references in wizard.ini
-Wizard: default rules are load automatically if placed in the  folder [game]\data\_HeaderRules\
-TranslationAPI: In order to avoid a 'too much requests error', added a request limiter to Google api. 1 request every 3secs and max 45 requests every 180sec.
-TranslationAPI: DeepL pro account should automatically use the deepL Pro end point (dry coded)
-QuickHeaderTool: added a sort button in the header config.
-updated Japanese UI credits to BowmoreLover

version 1.3.5 (Maintenance update for apiTranslation).
-TranslationAPI: Updated internal translator api framework
-TranslationAPI: Updated MS Translator to V3. You will need an Microsoft Azure Secret key. Also you will need to set your region to "Global" in your azure settings.
-TranslationAPI: Added support for DeepL api. You will need an account from deepl and a free key. Note: if you use a deepl paid key, you can try to change the endpoint to https://api.deepl.com (from https://api-free.deepl.com ) in the file:_xTranslator\Misc\ApiTranslator.txt. 
-updated Spanish UI credits to Pashalsta
-updated Japanese UI credits to BowmoreLover

version 1.3.4
-Pex: Beta/experimental Feature. In advanced options->script tab, you can set an option so it's possible to load/save pex file with custom codepage. The codepage used are the regular forced codepage onload/onsave. Default is utf8. Use with caution if needed as the game can fallback to *your* system ansi codepage in some cases.
-Fuz/NPCMap: Fixed an issue with fuz responseID > 9
-headerProcessor: McM processor now supports regex preprocessor params
-headerProcessor: COBJ fallback now point on the produced item, if available.
-minor UI improvements
-minor internal improvements

version 1.3.3
-UI/Translation: Added vocabulary support for same language editing. 
----Note about the 'same language' Workspace: 
----only modified strings (ie: source != dest) are automatically saved in dictionaries
----all loaded "translations" are tagged as validated (blue)
----string to string autotranslation is disabled.
-Translation: It's now possible to edit the TES4:CNAM/SNAM subfields for delocalized esp/esm.
-tools: LoadStringAsTranslation tool now only sets items as "validated" (blue) if the translation target has been modified by the process. If the translation is not modified the item is set as "Translated" (white)
-UI/Translation: String to string autotranslated items are now always tagged as validated (blue).
-Data: updated version info for Fallout76 PTS esm 
-headerWizard: improved log feedback
-headerWizard: fixed various minor internal issues, you can also access the xTranslator options directly from the wizard windows
-UI/feedback: a confirmation is now needed to close xTranslator if the header processor contains unsaved data.
-headerProcessor: extended fallbackBank from 0->9 to 0->F (hexadecimal). it's also possible to set fallback bank on selection (ctrl-alt-f)
-headerProcessor: fixed an issue with recipes fallback 


version 1.3.2
-UI:The registry path detection has been updated. Clicking the little magnifying glass button update all paths of the current game. Steam games can now be also found in secondary game directories as long as they were correctly installed through Steam. It's also now possible to choose between Steam/bethesdaNet/PTS version for Fallout76.
Note: updating path also reset the Recent files list to avoid confusion.
-MCMCompare tool: Fixed an issue when String ID are identical but with different Uppercase/lowercase chars.
-Data: Updated lstring conditions for PERK:EPF2 definition.
-headerProcessor: LGDI records now fallback to its related leveled item.
-headerProcessor: ALCH records now indicate effects data as pseudo-Keyword for advanced food/chem processing 
-headerProcessor: It's now possible to use a %s tag inside a header definition, where %s stands for the original computed string, in order to allow advanced formatting, where some (or all) header parts can be placed after the original string instead of only before.
-Yandex is disabled for now. The api has been changed and may not be free anymore.

version 1.3.1
-Editing/Text/Internal: Fixed a rare issue with mod containing texts longer than 65565 ($ffff) characters. The text limit is now (arbitrary) pushed to ~1000000bytes once encoded, which should give some space. Low limit for vmad and Pex strings is still valid.
-Editing/Text: added a beta feature (not completed yet) that allows to switch to a faster (but less fancy) editor. this could help heavy multibyte languages while editing long texts. You can switch (on/off) to the faster editor with ctrl-shift-F12. The feature is not complete, the spellCheck/search&replace is not ready yet.
-headerProcessorWizard: do not try to load interface file if the ruleslist doesn't contain mcm rules.
-Encoding/Internal: Fixed an issue with codepage 936.
-UI: Updated Japanese UI (Thx and credit to BowmoreLover)

version 1.3.0
-UI/Internal: added an encoding size visual when editing a string. 
If the size goes above 65520 bytes ($fff0), the string is trimed on save. Some languages use multibyte char (eastern char can use up to 4 bytes per char for example) so this reduces the possibilily to edit very long texts. The on save string size verification has also been improved so a multibyte char cannot be splitted and to loose its integrity anymore.
-Internal: Fixed an issue where a bsa/ba2 could remain locked by xTranslator.
-headerProcessor: Added recursive search for few new 76 internal data
-headerProcessor: Rules can be processed on mcm/translate text file, only stringID search can be applied in that case obviously.
-headerProcessor: Added text search for keyword edid name.
-headerProcessor: edid and kwrd text search pattern now also supports regex (You need to add # in front of a pattern to activate regex computing.)
-headerProcessorWizard: added dynamic patching & rules for Translate txt Files

version 1.2.9
-Internal: Updated data definition for fallout 76

version 1.2.8
-Internal: Updated data definition for fallout 76
-Internal: Fixed a rare issue with empty compressed records

version 1.2.7
-Updated version info for Fallout76. Also silenced some harmless loading errors. (still shown in log)
-When source and destination languages are the same, saving a MCM file uses its original filename instead of a computed name with destination language (in order to facilitate batch/multilingual MCM corrections).
-UI (beta): using Ctrl-Shift-W now finalyze and close all opened files

version 1.2.6
-UI: Improved performance when using the "One Line display" option (which is also now enabled by default). This should greatly enhance the list scrolling with heavy fonts (heavy 'glyphed' fonts, eastern fonts...). Note: you can re-enable the previous display behavior by unchecking the one line display in the options.
-UI: Added an icon in front of multi-lined strings
-headerProcessorWizard: Minor UI Improvements

version 1.2.5
-headerProcessorWizard: Added a One-Click File patcher in order to allow Font/Icon modification in F76 (will not work with Nuclear Winter)
-UI: Fixed some issues (Tooltips, High display scaling...)
-UI: Updated Spanish UI (Thx and credit to Pashalsta)

version 1.2.4
-UI: feedback windows output has been adjusted in order to fix overlap issue when using a high display scaling
-Internal: fixed a CTD issue when the application is restarted on the fly while changing workspace on load.
-Internal: Fixed an issue while retrieving Keywords data in enumerated subrecords.
-headerProcessor: Fallbacks introduced in version 1.2.3 now works correctly with INNR records.
-headerProcessor: Headers that contain only one space char are now correctly applied.

version 1.2.3
-General: Removed the beta tag.
-UI: Fixed few minor issues.
-headerProcessor: Added a recursive fallback system (More info in the readme)
-UI: Updated Japanese UI (Thx and credit to BowmoreLover)

Note about Header Processor fallback. 
The fallback mechanism is an advanced system that uses a deep data analysis where you can build the output recursively.
For now: 
-BOOK entries return the related constructed object 
-MISCmod entries return the related OMOD data
-FLOR return the first related harvested item
-Any other item type returns itself.
You can use 11 keywords (@f, @s, @1..@9) in order to compute output dynamically from the returned item. (note: those keyword are de facto reserved and can't be used as header themselves)
@f (default fallBack): provides a recursive search from any rules and from default fallback Bank (fb:0) (ideal for recipe, flora etc...)
@s (strict fallBack): provides a recursive search data from any rules with same record signature and from default fallback bank (fb:0) with same record signature 
@1..@9 (specific fallback): provide a recursive search in the specified fallback Bank (fb:1 .. fb:9) (record header signature doesnt apply there)
If a rule is specifically a fallback (bank 0 to 9), if will be used only in recursive search with the given keyword. Note: INNR rules are automatically set as dynamic Fallback:0 as long as they does not rely on formiD or Edid analysis rules.

version 1.2.2beta
-UI: Switching between 2 loaded files now keep and retrieve the list position for each file.
-Script/PEX: Added an advanced option to unlock Global Vars inside PEX for editing. Use with caution.
-headerProcessor/F76 only: Added a wizard for to quickly apply rules on the fly for the end user. (Menu -> Wizards -> Header Wizard). Just open xTranslator, start the wizard and follow the instructions.
-headerProcessor: Improved UI, improved search, added some functionalities with fallback references, and added a tag system that allows to set templates for to automatically enable/disable rules. Edid references are now stored in the include/exclude lists, this allow to set multiple edid references (AND / OR) in a single rule. Rules are backward compatibles.

version 1.2.1beta
-Pex: Skyrim/SkyrimSE pex are now correctly loaded in 64 bits
-UI: The main treeview list doesn't autosort itself after editing a text
-UI: Switching between two loaded esp doesnt reset the filter state if the VMAD button is checked.
-Export: Fixed wrongly named xml/sst if a filename contains a dot not related to its extension.
Thx and credit to BowmoreLover for the testing and feedback.

version 1.2.0beta
-Internal: xTranslator 32bits and 64bits versions available. 
-Internal: Now compiled with delphi Berlin. 
-Internal: Updated all major integrated components (VirtualTree, Zlib, perlregEx, synedit, htmlViewer, hunspell, indy10, madshi)
-Internal: Update and cleanup in code to support x64 compilation as well as all components evolutions.
-UI: in the 'search and edit' windows, if you have checked the 'confirm on swap' option (on bottom left),you will also get a confirmation box if the string has been edited and you choose to cancel the window.
-Fallout76: updated lastest TES header version support
-headerProcessor: added options to choose if a list of keywords/components is exclusive (AND) or inclusive (OR).
-headerProcessor: added an option to allow the Header to fully replace the destination string.


version 1.1.6e
-Fallout76: updated TES header version support
-headerProcessor: It's now possible to add component conditions. Just drag/drop the included/excluded component(s) in the relevant list like any other rules.
-UI: it's now possible to drag and drop a dictionary over an open esp/esp to translate it directly with default predefined options. (If you need more options you can still import the dictionary via the menu). This works only for sst file only for now.


version 1.1.6d
-headerProcessor: fixed few issues in the preProcessing options that prevented change if no component were found, Also it's possible to set  a blank header, if the string only needs a preprocessing treatment.
-headerProcessor: When some preProcessing options are copied, it's now possible to apply them on all selected rules with Ctrl-Alt-V ( this also enables preProcessing on those rules) . You also can use Ctrl-Alt-X to disable preProcessing on all selected rules
-DefUIGenerator. Some internal cleanup. However, this feature is quite deprecated now, since headerProcessor allows deeper control.
-UI: Fixed an issue that could hang the tool while quickly increasing/decreasing font size.
-UI: Updated Japanese UI (Thx and credit to BowmoreLover)


version 1.1.6c
-headerProcessor: the rules creation has been revamped in order too facilitate updates and navigation. Now, you need to create an empty rule at first, and it is automatically updated when you had stuff in it.
-headerProcessor: added a button to duplicate rules 
-headerProcessor: added a preprocessing feature. Each rules can have a string manipulation attached (a simple regex) and component part directly integrated. Each rule has its own template so it's possible to change the output according to situation. You can copy past preProcessing options between rules. Note: you can type 'preprocess' in the include search filter to see all preProcessed rules.
-Internal: few cleanup.

version 1.1.6b
-headerProcessor: Added search filter for the header list. You can search for header, references (MISC, ALCH etc..) or included/excluded contents (formiID ref, art ref etc...)
-headerProcessor: The header list has been improved. It's also now easier to modified order with drag and drop.
-headerProcessor: Processing has been greatly optimized (again)q
-Internal: Orphan strings are now correctly purged when language/codepage is changed on the fly
-Internal: few cleanup.

version 1.1.6a
-headerProcessor: Added support for extra Font: Set the extra font in the header processor windows, this activate the font in all relevant edit fields in xTranslator. If a header font is set, you can use Ctrl-F9 to toggle it in the main string view list (main window).
-headerProcessor: fixed an issue with excluded FormID/ArtID
-headerProcessor: Slightly changed the behavior for keywords: Included keywords are using Logical 'AND' (all keywords must be found) and excluded keywords are using Logical 'OR' (at least one keyword exclude the item)
-headerProcessor: Processing has been greatly optimized 
-ComponentGenerator: Added some options in defUI tools, this allows more versatility and customization
-ComponentGenerator: Options are now saved between sessions

version 1.1.6
-All Loaders: Added a FallBack encoding mechanism. If Utf8 is the primary encoding, and fails to decode a string, then a fallBack codepage is applying for that very string. Fallback data have been added to SkyrimSE and Fallout76 codepage.txt definition files. This should help to resolve some default strings inconsistency.
-headerProcessor/Fallout 76: updated default rules. Tags are now more like little "fake icons", and it's 100% language independent (But this works with occidental languages, because it uses some diacritics symbols that can't in default Cn/Jp/Ko setup)
-headerProcessor: loading default rules menu is now a drop down menu with more than one entry allowed
-headerProcessor: fixed issue with the header editor.
-UI: Updated Japanese UI (Thx and credit to BowmoreLover)

version 1.1.5c
-ComponentGenerator/Fallout 76: Added an option to indicate component quantity (The exact value is not available so it's only a range. this adds the tag + for medium amount, and ++ for high amount. Note that this quantity is also modified by your perks.)
-headerProcessor/Fallout 76: updated default rules.
-headerProcessor: you can now drag and drop a rules.txt file on the headerProcessor window to load it.
-headerProcessor: added an option to process only selected rules
-headerProcessor: added an option to specify if the base strings need to be pulled for the source or destination strings
-headerProcessor: added output selection strings
-headerProcessor: fixed rules not applying on record with multiple strings entries.
-Misc: Fixed wrong cap for undo operations
-Misc: Fixed some UI issues. (bugTracker)

version 1.1.5b
-A tutorial for the header Processor can be found here: https://www.nexusmods.com/fallout76/mods/74
-headerProcessor: Added a edit Header button, there you can rename (or translate) all headers directly, without have to change every rules one by one.
-headerProcessor: Fixed some issues with the processor UI.
-UI: Updated Japanese UI (Thx and credit to BowmoreLover)

version 1.1.5
-Fallout76/Fallout4: Added an headerProcessor Tool for multilang item sorting. Define your set of rules and all headers will be added automatically. All comparison data are languages indepedants, so it's easy to translate and update at any point.
Comes with a defaut set of rules. More info in a tutorial soon.
-Misc few internal fixes.
-UI: Updated Japanese UI (Thx and credit to BowmoreLover)

version 1.1.4
-Fallout76: Improved Component generator. You can now exclude item by Keyword (default setup exclude bulk, armorMod and weaponmod items). You can customize this by entering or removing formID keyword.  You can also add the weight of the item (use the Output string combolist, or customize the entry) 
-Misc: Fixed an issue that prevented keyword for INNR entries. 

version 1.1.3a
-Fallout76: Added chinese codepage definitions
-Fallout76: Strings are now pulled from archives rather than loose files by default.

version 1.1.3
-Fallout76: Added registry detection for game path
-Fallout76: Fixed Component generator. (Tutorial here https://www.nexusmods.com/fallout4/articles/447). It's possible to automatically add component info to scrapable miscItems and save the edited strings (it works on loose file in current version of the game)
-UI: Updated Japanese UI (Thx and credit to BowmoreLover)

version 1.1.2
-Added basic support for Fallout76.
Since modding is not supported right now for the game, this is much more for those who want to take a look at the structure, texts and even data. (actually this is quite the same as Fallout 4)
-Fallout76 workspace added.
-New strings entries for Fallout76 added.
-Dictionary generation is working (you need to manually enter the game data folder in the dictionary options)
-Npcmap,Fuzmap and voice play is working. (you need to manually enter the game data folder in the fuz options)
-Script decompiler is working

version 1.1.1a
-Translation: Fixed an issue in espCompare tool, where translated strings could be flagged as untranslated.

version 1.1.1 
-VMAD: It's possible again to do a string2string translation on VMAD items tagged as 'Partial' (F2) or currently selected (using the relevant option). This works also for both Xml / SST import. Again, be very careful while doing this, and be sure to select the vmad items that really need to be translated.
-VMAD: Strictly translated VMADs are now flagged as translated (White) instead of validated (Blue).
-UI: The UI-locking process when xTranslator is busy has been streamlined.
-UI: Updated Japanese UI (Thx and credit to BowmoreLover)


version 1.1.0 - VMAD Overhaul

-Script/PEX: Added support for external pex decompiler (Ie: Champollion). That way you can see an alternate output of decompilation when editing Pex files.
You need to set the path to the exe in the advanced Options Script tab. Note: There are two versions of Champollion:
+Champollion for Fallout4 (by Orvid) can be found here: https://www.nexusmods.com/fallout4/mods/3742
+Champollion for Skyrim/SkyrimSE (by li1nx) can be found here: https://www.nexusmods.com/skyrim/mods/35307/?
Be sure to indicate the path to the right one for the current xTranslator workspace.
-VMAD: When using the context menu over a selected VMAD entry in the main list, you can directly open the Script related to that VMAD.
-XML: Added support for VMAD in xml dictionaries.
-VMAD: enabling/disabling VMAD in advanced options is now reflected on the fly. However you also need to activate VMAD visibility per file in order to see unedited VMAD items (light bubble icon in the main toolbar). This setting while be saved per file cross sessions. VMAD can also be filtered in the standard filter mechanism.
-VMAD/Dictionaries: If a strict VMAD data is matching in dictionary (while loading or applying it on a delocalized esp), then the translation for all relevant VMAD entries will be automatically applied even if VMAD analytic is not enabled. That way, you can share dictionary with VMAD entries without further operation by the end user.
Important note: string to string auto-Translation doesn't not work as-is with VMAD. This by design, because the you need to be very careful when creating new translation for VMAD entries. 
If you want to perform a string to string auto-translation for VMAD, you need to select the given strings or tag them as partial (purple/F2), then start auto-translation (ctrl-T) with the overwrite option set on selection or partial. Keep in mind that a editing a wrong VMAD can break your mod. So, again, be careful. 
Also, Compare data (like espCompare) doesn't work with vmad, due to the versatility of the process. 
-UI: some general improvements in locked strings security mechanism.
-UI: Fixed an issue where saving dictionary (Ctrl-S) could be locked if you switch fast between 2 files while heuristic suggestion is running. 
-UI: Updating derived string data in options doesn't require a full vocabulary update anymore.
-AutoTranslation: Improved result given by the mode 'string only' when applying  SST or XML dictionary. This mode is quite deprecated but can still be useful in some cases.
-AutoTranslation: Warning feedback has been improved when applying XML dictionary in edid only mode. (Works with dictionaries saved in 1.1.0). Everything is backward compatible otherwise.

version 1.0.9
-Translation: When importing a dictionary (sst) or applying manually a dictionary, destination strings that have been modified in the process are now flagged as "validated" (blue) instead of "translated" (white). This helps to check differences between 2 translations, for example. 
-Tool: QuickTrans (Ctrl-R) now use a strict string+edid check.
-Misc/UI: Feedback popup when saving a file has been replaced by a more streamlined mechanism
-Translation: Old data should not get priority over actual data anymore.
-Added a quick audit in log that shows the total of unique strings (total / untranslated), to get a better overview about what need to be done.
-Options/Tool: You can now disable "derived string" in option, but do a manual derived string computing with Shift-F12 when needed.
-Options/Tool: Derived string parse data will be ignored is they begin with a # (standard comment)
-UI: fixed an odd refresh issue with progressbar on windows Aero
-Misc: Minor internal improvements

version 1.0.8c
-Regex: Fixed an issue where using more than 10 back-references in the regex translation tool
-Regex: The regex translation tool window is now resizable and saved through sessions.

version 1.0.8b
-Fixed an issue where pex/mcm autotranslation was always tagged as 'warning'.
-Warning for OldData/Derived strings auto-translation now uses a blue icon (low Warning).
-Updated Japanese UI (credit and thx to Kuroko137)

version 1.0.8a
-Fixed an issue with some keyboard shortcuts not working properly.

version 1.0.8
-Tag/CollabID: Filter improved. When using right-click on the tag filter, you can now set tags as shown (+) or hidden(-). That way you can easily include or exclude items.
-FormID/record filter: The filter is now isolated from other filter. By pressing F12 (or using the context menu) you can quickly filter/unfliter a specific record. Useful to deal with records with multiple strings. A button have also been addded in the tool bar for that purpose. Also each opened esp as its own formID filter.
-Translation: Quick Translate added. By using Ctrl-R, you can quickly do a *strict* autoTranstate based on current selection (based on Edid + string). Useful to restore a previous set of translation.
-Translation: Auto-translation based on string and heuristic suggestion now take vocabulary order in account. First dictionaries in the vocabulary list get priority. You can sort the list by drag and drop.
-Advanced: Improved derived strings. It's now possible to generated more than one match count per string as long as both source and dest strings share the same structure. You can also hit 'escape' to stop derived strings processing (useful if you are testing some new entries).
-Advanced: strings automatically translated by a derived string or an 'olddata' strings (from unused entries in dictionaries) now get a warning for verification (note: strings with a warning are not saved in dictionaries).
-Tool: EspCompare now validate entries only if it detects changes between translated strings outputs.
-Misc: Various small internal improvements
-UI: Ctrl-Shift-S shorcut added for Finalize.
-UI: Using 'Cancel' when a mod is loaded in a wrong workspace actually really cancel the process.
-UI: Updated Italian UI, credit to alfx3.


version 1.0.7 (release)
-Tag/CollabID: You can now write a comment related to a given tag. When applying a tag (F9), or editing the tag filter, use Shift+Left-Click to write/update a comment. The comment is saved in SST file.
-SST dictionaries. Due to update for Tag/CollabID the sst file format has slightly changed. (the newer sst version can't be opened by older version of the tool, but of course there is still a backward compatibility with older dictionaries)
-ToolBox: Only items that has been effectively modified by the tool are now now tagged as 'partial' (purple).
-NPC/FuzMap: Added support for sound files that are coming as simple xwm not embedded in a fuz file.
-Tool: Fixed a minor issue with basic search and replace.
-Translation API: Openssl Dll are now included in the release.


version 1.0.6b (release)
Small Maintenance update:
-Fixed a small issue when filtering items with warning


version 1.0.6 (release)
Small Maintenance update:
-Restrict to 'visible items in current filter' can now be applied to the search&replace tool.
-Translation API: Improved http error message if the request fails.
-Misc: Reverted the change where the main windows was locked when processing data.


version 1.0.5 (release)
-Misc: Added the *.esl extension when loading mod file (for Creation club files)
-Translation API: MicrosoftTranslator API framework has been updated and fixed  (You need to get a free account on https://azure.microsoft.com/, then activate the text translation service in the cognitive section, then you can translate up to 2 000 000 chars per month for free)
-Translation API: Youdao API framework has been updated. (You need to update your Youdao account accordingly to be able to use the new API. The new char limit is now 5000 chars per request, up from 200).


version 1.0.4a (release)
-Fix for a rare issue when opening the tool for the first time
-Updated Japanese UI (credit and thx to Kuroko137)

version 1.0.4 (release)
-NPCMap: Added a recursive loop guard in the NPC map generator to avoid infinite Alias Loop crash in some rare occasions (like in Bruma for Skyrim. Might be a CK bug in first place)
-Misc: Added support for codepage  936 and 950
-Misc: Added items selection count in status bar
-Translation API: you can now enter Proxy settings in the translatorAPI option panel if needed.
-Misc: Added a close [X] button on some feedback panels, to prevent the windows to be stuck.
-Tool: Fixed an issue with the toolbox (uppercase/lowercase)
-Misc/Fix: Various minor fixes.
-UI: Updated Italian and Chinese UI - Credit to alfx3 & Rebya
-UI: Added Slovak UI - Credits to pe-pe143


version 1.0.3 (release)
-TranslationAPI: Added lite support for googletranslate API (based on chromeApi, free, no key required). Works only in edit windows.
-TranslationAPI: The msTranslationAPI key has been reset. The credential protocol has changed (https://blogs.msdn.microsoft.com/translation/2017/04/10/). The changes have been applied in xTranslator but are untested since I didn't update my azure account.
-TranslationAPI: Disabled the freeAPI, since the service is not available anymore
-UI: Improved Recent Menu aspect
-UI: Ctrl-C/Ctrl-V now also work in the edit window records list
-UI: Fix for a potential crash if the user tries to retrieve heuristic suggestions while saving dictionary.
-Advanced Search tool regex: (contextual menu in the advanced search panel) You can extract one regex backref from source field  and one regex backref from dest field then compare the two backrefs. This allow to filter only strings that match the same backref (=), or a different one (!=). (Useful to check consistency for numeric values or pattern type strings between original and translated data)


version 1.0.2b (release)
-Tool DefUI Component Generator: The selection option now works correctly. Also the tag is now cleaned for items with no scrap material.
-UI: You can Drag&Drop multiple files at once into xTranslator
-Updated Italian UI (credits and thx to alfx3)
-Updated Japanese UI (credit and thx to Kuroko137)

version 1.0.2a (release)
-ToolBox: (List Context menu on selection) Add Header. Quick Access Ctrl-D. For to quickly add/change Headers (like DefUI/sorting tags) before the selected strings. You can add any header you need in the list and also automatically import the DEFUItags xml if it's installed from the .\Fallout 4\Data\Interface\DEF_CONFDEF_INV_TAGS.xml. (Data path must be configured for this to work). More info here http://www.nexusmods.com/fallout4/articles/447/?
-ToolBox: (List Context menu on selection) Trim String (to remove extra space char before of after the string)

version 1.0.2 (release)
-Tool: Added (Menu Tool) a DefUI Component Generator for Fallout4. 
This tool adds the relevant components to MISC item with the DefUI formatting. (By default: '{{{c1, c2, ...}}}', based on internal registered data for each eligible Item. The tool only works if both source and dest languages are the same. You can also choose to clean up both component string and item string (delete the current {{{...}}} data) before applying a new one and you can adjust the used RegEx for those both tasks if needed. (Default settings work 'as is' by default for most situations.). You might also need to load all relevant master esm for this to fully work. More info here http://www.nexusmods.com/fallout4/articles/447/?
-Minor UI fixes
-Updated Simplified Chinese UI (credits and thx to Rebya & 0xb160d1c5)

version 1.0.1c (release)
-UI:The main form now regains focus correctly after editing string if the advanced search windows is opened
-UI/Search: Fixed an issue where non translated strings tagged with a collabID would stay hidden after a dictionary save
-Internal: The derived strings are now correctly generated again after saving a dictionary
-Corrected Japanese UI (credit and thx to Kuroko137)

version 1.0.1b (release)
-Minor UI fix
-Updated Japanese UI (credit and thx to Kuroko137)

version 1.0.1 (release)
Note: Each time I think I am done for a while, I get a bunch of new needs, ideas and fixes, so here it is... :)

-Export/Finalize: Added an option to use a fixed folder for finalizing an esp/esm. That way, you can store your untranslated esp/esm in a given folder then export, even a partially translated mod (for testing purpose) always in another defined folder (like, for example, the game data folder) more easily. The "export as..." folder is also retained between sessions.
-Added Copy/Paste context menus in the edit window record/dialog list (note: ctrl-C/ctrl-V are disable for this menu to avoid conflicts with ctrl-C/ctrl-V used in the textbox.)
-Added Advanced Search, that allows MultiField search, with Normal or regEx patterns (case sensitive or not). It's also possible to save search template between sessions. 
-You can now open and edit more than open SST at once, by multiselecting them in the vocabulary tab. (Multiselect also work for creating reverse SST)
-Opened SST dictionaries are now automatically closed if you change source/dest languages on the fly (to avoid mismatch vocabulary).
-Added a new Regex Mode: 'Search in source and add in dest'. Useful to add some patterns. Example you have a bunch of strings like '[variousHeaders] sourceText' -> 'destText'. Use: '^([\[\(\{\|].+?[\|\]\}\)])'  then replace with '#1 %d' to get '[variousHeaders] destText'.
-Added KeyWord data for INNR records (in edit windows, top text info) so it's easier to see to what data an instance naming (INNR) is related. You need to load all masters for the edited mod for this to fully work. 
-Added a menu command to load all masters for the current loaded esp/esm. (tool -> load all masters)
-Added a context menu command to automatically filter all strings from the current edited Record in the main list.
-Small fixes and tweaks for Derived Strings computing and UI.
-Added some old missing UI strings in the ressource file.
-Updated Japanese UI (credit and thx to Kuroko137)



version 1.0.0 (release)
-UI/Tool: Added a toolbox (main strings list, context menu -> selection: toolBox). Available tools: Uppercase All, LowerCase All, UpperCase First Char First Word, UpperCase First Char All Words 
-UI/Tool: Added a menu entry (main strings list, context menu -> focus:Send to custom dictionary) for to send the focused entry to the personal dictionary 
-Vocabulary: Improved derived strings cache. Also added options to customize derived strings generation. This feature is enabled by default.
-Fuz: Fixed an issue when playing dialog/voice associated with multiple fuz files in edit window
-BSA: the bsa browser now correctly shows the file size inside BA2 archive

==================================================================

version 1.0beta22
-Misc/Fix: pressing F1 in some situations should not try to call the external help (hopefully).
-Misc/XML: Added support for XML translation from EspTranslator. (menu file -> Import/XML)
-Misc: Improved exception handlers options.
-Internal: some optimizations.

version 1.0beta21e
-Internal: Another (bigs) optimizations when drawing Treeview and computing big strings.
-Updated Italian UI (credits and thanks to alfx3)

version 1.0beta21d
-Misc/UI: using arrowkeys works again to browse the INFO:NAM1 list in the main window
-Misc/UI: improved progressbar feedback when generating fuzMap and opening BSA/BA2
-Internal: Some optimizations when drawing Treeview.
-Internal: Updated few components (VirtualTreeView  and SynEdit)
-Misc: Updated Madshi exception handler settings. In case of errors, the log can be found in the xTranslator Folder (xTranslator_bugreport.txt).
-Updated Chinese and Japanese UI (credits and thanks to Rebya and Kuroko137)
-Added Italian UI (credits and thanks to alfx3)

version 1.0beta21c
-Fixed Minor issue with npc/fuzMap tab

version 1.0beta21b
-NPCmap/FUzMap: Merged FuzMap and NPCmap panels. 
Note1: To generate the maps, you need to go to open Fuzmap/NpcMapPanel first. 
Note2: you can still load masters on demand and refresh the NPCMap if needed.
-SST: In the vocabulary tab it's possible to generate a "reverse" sst dictionary (en->fr to fr->en  for example). Note: only fully validated strings are taken in account.
-Misc: Reduced the default Undo count limit and added an option for to raise it. (Note: some mass operations are always limited for faster workflow)
-Misc: Added a quick memory audit: while in the main windows, hit Ctrl-shift-F12 to print a memory feedback in the log. (note: the process memory represent the memory blocks allocation)
-Misc: Added Madshi exception handler [non commercial version] (http://www.madshi.net/) 

version 1.0beta21a
-NPCMap: Added Dynamic ObjReferences detection (REFR) (Found a way to deal with this against a reasonable amount of memory).
-NPCMap: Added a NPClist in the NPCMap panel to see the Speaker(s) for the selected dialog while navigating in the main list. 
-NPCMap: Improved accuracy detection and analysis
-NPCMap: Fixed issue with override data references
-LoadMaster: Fixed an issue where a master could be loaded again if it has been manually loaded before.
-Updated the Japanese UI (credits to Kuroko137)

version 1.0beta21
-NPCMap: the NPC map can be generated on the fly. Just click the Orange Button and get the map in a snap ;). 
Almost all dialogs/NPC are mapped, there are few limitations: Dynamic REFR and conditional KYWD references are skipped for now. 99% of the time, they are not really needed (since they are usually not specific NPC, but faction or situational). Also when loading esp with master, partial QUST form are not supported yet. 
Usually the fuz map + npc map are covering everything, but you can still load a map from the xEdit scripts alike before, if you really need the missing data. 
-Master Support: Added a function to load all masters esm for the current mod ([game]\data folder is the default path).
-FuzMap: Some optimizations.
-Misc:You can use Escape to abort big esm/esp loading 
-Misc: Internal data analysis framework greatly optimized
-Misc: Optimization when loading esp/esm (up to 15% faster)
-Updated the Chinese UI (credits to Rebya)

version 1.0beta20d
-Fixed an issue with the ba2 (fallout4) script reinjection for uncompressed data.
-Small optimizations for NPCMap
-Some internal change for data analysis.
-Updated the Japanese UI (credits to Kuroko137)

version 1.0beta20c
-TranslatorAPIs: fixed some minors issues.
-Added NPCmap import from xEdit: Most NPC data are already available through the fuzMap/VoiceType filter which is generated on the fly. You can also now import a npcMap from xEdit to be able to filter dialog by NPC. Please read this article (http://www.nexusmods.com/skyrimspecialedition/articles/78/) on nexus for more information. It's mainly a workaround for those who asked me for Npc support, until I can find the time to adapt the framework to do this internally on the fly.
-Updated UI and some icons

version 1.0beta20b
-TranslatorAPIs: It's now possible to use the TranslateAPI on the main list. You can send up to 200 selected lines in a row (for a grant total of ~10000 characters with Yandex / MSTranslate only).
-TranslatorAPIs: Redesigned the options pages for Api, so it's much more streamlined for eventual additions in the future. Enter your key values next to the relevant KeyNames for the Api you want to use.
-TranslatorAPIs: Added support for Yandao and Baidu Api, also added the completely free "Transltr" Api, which is really raw but can help on some short sentences
-TranslatorAPIs: In the edit window, if no text is selected then the whole text is sent to the translationAPI, otherwise only the selected section will be sent (and replaced). Moved the api access from the context menu to a more efficient UI.
-TranslatorAPIs: Some internal optimization/improvements
-SpellCheck: The underline process has been optimized to avoid lag with big texts full of spelling mistakes
-Codepage/Language: Added mirror menu for language preset in the main toolbar (next to the Force codepage button)

version 1.0beta20a
-TranslatorAPIs: Added an option to set the MStranslate TimeOut session (max/default 540s = 9mn), set to 0 to force credentials query at each translation request (but this is slower)
-TranslatorAPIs: Added a visual feedback when the Api Translation process is running and the correct Api credit is now shown properly as it should.
-TranslatorAPIs: The menu now also shows the used languages [source->dest].

version 1.0beta20
-TranslatorAPIs: (by request) Added support on some online Translator. MsTranslator (http://www.bing.com/translator) and Yandex: (https://translate.yandex.com/). You can get free authKey for those services, and set those key in xtranslator Options -> TranslatorAPIS, then call translation via the context menu in the edit window. Please read the article on nexus to know how to get authkeys.
Note1: the used translation languages (sources/dest) are the ones set in xTranslator
Note2: some relevant data can be found in the file named 'ApiTranslator.txt' in xTranslator\misc folder.
-Added an icon in the main bar for quick access to the force codepage settings.

version 1.0beta19
-UI/Codepage:Added a new comboList in the main bar that allows to adjust the codepage on the fly for a loaded Esp/Esm, without having to reload it, so you can quickly adjust the right source codepage if it's necessary.
-Workflow improvement: It's now possible to change the languages source and/or dest on the fly, without the need of reloading the currently loaded mods. If the source language is changed, all source strings will also be automatically updated with the default codepage used by the new source language (for esp/esm). This works with the language presets too.
-Workflow improvement: Added some options to skip some warnings (VMAD, Wrong WorkSpace, Codepage warning on export)
-UI: added a button in option to reset the recent list.
-FuzMap/UI: it's possible to set a data folder specifically for the fuz map in advanced options. (by default it's the game data folder)
-UI: Added a way to adjust BSA definition and BSA Alias for strings in archive. Default values should work as they are without editing. I just wanted to not have this hardcoded, just in case.
-UI: added some sorting in the internal BSA browser, by clicking on the list header.

version 1.0beta18e
-sseTranslator now allows the possibility to open a mod in a workspace it doesn't belong to (Like Skyrim mod in SkyrimSE workspace). This should help with the codepage confusion. 
When an esp is loaded in a wrong workspace, you will have to enter the codepage to use on load (please refer to the codepage used in the legit workspace. If you get weird characters you probably didnt choose the right codepage, so close and reload the mod). Also, the listview borders will be colored in green to remind you that you are not using the right workspace.
-EspCompare: Default encoding is now based on the default Destination encoding (instead of source)

version 1.0beta18d
-Menu Options->ForceCodepage: The Utf8 menu has been replaced by a ForceCodepage setting, that allows to force a given codepage on load and/or save. This can be used to easily convert the codepage of a mod. 
For example, to convert a French esp from ansi1252 to utf8, set your source and dest language as French, then set the force codepage to 1252 (source) and utf8 (dest), then load your esp, and finalize it.). Since these settings are mostly situational it's not recommended to save them between sessions (but you can).  
-SkyrimSE: new BSA injection in now working for pexfile (Beta)
-SkyrimSE: Added a formVersion consistency check for SE mods
-XMLImport: forced default encoding to utf8 for XML, so old xml dictionaries without codepage data can be loaded correctly
-EditWindow/Search: Added a button to search only in the current mod vocabulary (Toggle shortCut: F8 while in the edit window)
-EditWindow/Search: Fixed the sorting by ID in the search result
-Updated Japanese UI. Credits to Kuroko137

version 1.0beta18c
-Fixed an issue where some files could not be found in the new BSA while using directHash check.
-Updated Chinese UI credit to Rebya 

version 1.0beta18b
-Added an option in EspCompare Tool and Load StringAsdest Tool, for to choose a different codepage for the compared esp/Strings.
That allows the possibility to compare esp and import strings from different games (like Skyrim vs SkyrimSE) where the codepage is different for the same language.

version 1.0beta18a
-SkyrimSE: fixed default path for embedded strings for the game masters esm
-SkyrimSE:  changed default encoding to utf8 for all languages, since this seems to be the default used codepage, at least for the european release. (Known Issue: EspCompare may not use the correct encoding if you try to compare a SkyrimSE mod to a Skyrim mod. This will be fixed later) 
-SkyrimSE: fixed an issue when playing fuz file from the new BSA archives.

version 1.0beta18
-renamed the main executable with a generic name (xTranslator.exe)
-Added SkyrimSE Game support
-Added SkyrimSE BSA support (injection is not ready yet)
-Espcompare is now not strict to a specific game, so it's possible to compare skyrimSE with Skyrim mods for example.
-Updated OmniXML component, fixed an issue with empty/spacechar strings in XML
-When exporting XML, it's now possible to include FuzData if the fuzmap has been generated.
-Minor fix/improvements in UI
-Updated Japanese UI/Tutorial/manual: Credit to Kuroko137

version 1.0beta17
-BSA/BA2 reintegration (Beta): Updated, and also works for BSA now. When exporting a Translated Pex file that was opened in a BSA/BA2, you can choose to export it directly in its belonging archive. You can also choose to inject all opened PEX files that belong to the same BSA/BA2 *and* are translated (meaning: without red/pink string). 
-UI: A lot of improvements, fixes and optimizations in various places.
-UI: Added some feedbacks and UI captions that were missing.
-UI: Using f1/f2/f3/ctrl-Up/Down to switch items in the edit windows has been streamlined.
-Quest list: Fixed for FalloutNV. (known issue: some NewVegas mods/dlc have some discrepancies with more than one DIAL subtree in their database, the quest list will not be handled correctly in that case)
-Updated Korean and Chinese UI (credits to -Ren- & Rebya)

version 1.0beta16e
-FuzMap: Added a voicetype list in the Fuzmap panel. You can filter INFO records and only show those whom are used by a given voice. (Requires a fuzMap)
-Tag/Id: Added Tag/Id toggle (via contextMenu) directly from the Dialog List in the Edit window.
-FuzMap: Added support for .wav files (as fuz files), since some mods are using this format.

version 1.0beta16c/d
-QuestList: More optimizations. Also, the quests and dialogs entries without editable strings are not added to the list.
-QuestList: The Quest/Dialog lists are now not redrawn when it's unnecessary, and keep the current dialog topic on track correctly
-QuestList: Added Data informations to Quest & Dialog entries (name,category/subtype/KeyWord when relevant).
-QuestList: Added a new DialSubType data file in the fallout4translator\data\[game] folder. 
-QuestList: If master esm/esp are also loaded, the relevant Quests and Data informations (like KeyWord/Name) will be used from Masters if necessary.
-OldDialogStyle: the tool now uses override data in priority.
-The Tag/Id filter now correctly sorts Strings with no tag when the Selected tag list is empty.
-Added Strings Status/Tag operation in edit windows through Context Menu, for both Dialog and Record List.
-Updated Chinese UI (credit to Rebya)

version 1.0beta16b
-QuestList: Some optimizations for to avoid lag on very big quests

version 1.0beta16
-Added a Quests panel in the lower section of the main window, to edit specific quests dialogs. Dbl-click to edit the given quest
-Added a Dialog SubList related to the parent quest in the dialog panel. Dbl-click to edit the given dialog.
-Added filter by Tag/Id: Use Left-Click to change the filter status and Right-click to change the selected Tag/Id.
-Added an option to all functions that use a selection of items to restrict the field of application to visible items only (through the current applied search/filter). So you can combine any tags with string status.
-Added an option to import only Tag/Id from SSTimport.
-Added some derived text suggestions (for example: [TestString] will automatically add: TestString (without bracket) in suggestion list)
-Changed the "search in" (source/dest etc.) group buttons to a single dropDown, for clarity.
-Added Zoom+/zoom-/Restore option menus to resize Font in List. (Note: the font name can be edited in the commonPrefs.ini file, if needed)
-Added an option for to use only strings files from the \strings folder (as loose files) instead of trying to extract them from bsa/ba2 archives while generating dictionaries.
-Fix: Manually applying direct translation does not reset tag/ID anymore
-Improved/Fixed various minor UI stuff.

version 1.0beta15c
-Added a warning to the oldDialogStyle tool if the process requires a master file loaded.
-Added more Tag/ID entries (1-88) to collaborative framework. Also, tags that have been already set at least once to an item are shown in the Apply Tag Dialogbox.
-Just a typo but I changed 'CollabId' to 'Tag/Id'.

version 1.0beta15b
-Fix for OldDialStyle tool: The tool can now load DNAM references strings from master files, as long as all relevant esp/esm are loaded together.
If you want to generate some .strings for New Dialog/FullDialog Interface for example, for Nuka World, Far Harbor or UFO4P (or other mods using dialogs), some references need to be pulled from masters esm. So now, if you load NukaWorld.esm *and* its master Fallout4.esm in Fallout4translator *at the same time*, the strings will be generated with NukaWorld *and* Fallout4 references. This considerably reduces the amount of the remaining short strings in DLCs.

version 1.0beta15a
-Fixed an issue with the personal dictionary.

version 1.0beta15
-New feature: first step on collaborative framework for big translation (this has been requested since a long time)
Select some strings, then tag them with some 'Collab ID' (context menu -> define Collab ID / or shortcut F9) to define which part belong to which participant, then you export your SST (or split it by ID). The dictionaries will retain ID and can be distributed.
You can also use the ID to flag some strings for a given purpose.
Note1: Not translated items are saved in SST when they have CollabID. This can be a trick to save all datas, if needed.
Note2: For the moment only SST files are handling the Collab Framework. I plan to extend this to XML as well in the future.
-Because of the collaborative Framework, the sst file format has slightly changed. (the newer version can't be opened by older version of the tool)
-Added new menu files section with import / export. Xml import/export has moved here. Also added SST import/export entries, with some options, so it's more convenient to share SST outside the userDictionaries folder). 
Note: The default SST saving is still a mandatory if you want to use your dictionary automatically and extend your dictionary cache.
-Added selection options to the direct translation.
-The closing file behavior has been improved when more than one file are opened
-Fixed minor UI issues

version 1.0.0beta14
-Added an advanced options panel. Some options has been moved there.
-Added custom pattern for the FuzMap builder in advanced options:
For to build the fuzMap, relevant BSA/BA2 archives (ie: containing fuz files) must match a specific template. Add one regEX pattern per line without the file extension.
The tag %BASENAME% is replaced by the addon name on runtime. You can also add patterns without %basename% reference to force some specific BSA/BA2.
For example, if you want to translate Enderal, add the line 'EEN - SoundVoice' in the pattern text box, so the 'EEN - SoundVoice.bsa' will be used to build the fuzmap.
-Added a 'Save SST as...' menu so it's possible to define a custom name for a dictionary (note: in that case, if the BaseName is not the same than the esp BaseName, the dictionary will not be applied automatically on load)
-Added a Search in Record/Field feature for searching items by Header Signature  (like QUST:FULL etc...)
-Parent DIAL topics should now be shown correctly in the Dialog Edit Tab
-Loading an esp using Utf8 should not show a warning if the 'forceUtf8OnLoad' option is checked.
-VMAD items can now be sorted/filtered properly
-Added some new icons

version 1.0.0beta13b
-Fixed some issues when exporting VMAD strings. Please discard any VMAD changes you might have exported with the previous beta13 version
-Pure strings dictionaries should also not try to auto-translate locked VMAD strings.

version 1.0.0beta13
-Added VMAD (script property) analysis. This option is in Beta, and disabled by default (go in option to enable it). Please report any issue.
WARNING: editing wrong strings can break your mod, so use with caution. Auto-translations tools are disabled for such strings.
They appear in yellow (locked) with a specific icon after each loading and you have to unlock them (with F1, F2 or F4, depending on what you want) to use tools on them. Also, only strings that are *not* in Yellow (locked) are updated in the esp when exported. 
When you edit a VMAD string, you can see in the edit window which script and property it belongs to.
If you want to reimport a translation saved in a dictionary on VMAD strings: select the string you want to translate, hit F2 to tag them in purple, then use the applySST tool with "string only" on "Partial String", once it's done, validate them (F1) after controlling everything is OK.
NOTE: VMAD analysis only works on delocalized esp. 
-If an esp requires another workspace (ie: the current game workspace is not the right one), and if there are no other files loaded at that moment, then you can choose to restart the tool automatically for the right workspace. The esp will be loaded directly.
-Updated UI for Chinese & Japanese (credit to Rebya & Kuroko137)

version 1.0.0beta12
-Full unification between Fallout4Translator and TesvTranslator. It's not necessary to rename the executable anymore.
-Added support for FalloutNewVegas. (BETA, Experimental!). Please report any issue. Note: Fuz (ogg) mapping doesn't not work for FalloutNV yet.
-Fallout4 beta 1.7 strings files can now be properly extracted from ba2 while loading Fallout4.esm and generating dictionaries
-Added a menu to restart the tool for alternate games and to set the startup behavior 
-Changing the UI language will automatically restart the tool when closing preferences.
-Improved the utf8detection check to get rid of false-positives.
-Search results are now sorted by string length by default to improve readability.
-The null filter is now working again properly.
-Fixed an (harmless) UI error when the last file opened was closed.

-IMPORTANT:
-SST Dictionaries folder and Preferences folder have changed. Please, read the _Beta12_UpdateNotice.txt in falloutTranslator Folder to restore your parameters and dictionaries properly
-Also, renaming the executable is not a mandatory anymore, but it's still an option if you want to go this way and keep things separated. Check the option menu -> options -> Startup -> "Use Executable Name", and rename you executable accordingly: Fallout4Translator, TesvTranslator or FalloutNVTranslator.


version 1.0.0beta11
-Unified datas between Fallout4Transtator/TESVTranslator.
For the time being, simply rename the program (exe) name from 'Fallout4Translator' to 'TESVTranslator'  (include the .exe, if you see file extension in Windows). 
-Updated Chinese UI by Rebya

version 1.0.0beta10
-Added a fuzMap panel in the main windows. The fuz file can be played with the 'play' button, shortcut: f11 or by double-clicking an item on the list.
-The regEx tool has been reworked. The test UI and selections have been streamlined. Also, the current regEx template can be saved through the list-contextMenu on the right. Double-Click on a list item to load the saved setting, drag and drop items to sort the list.
-Fixed an issue with Undo not being properly applied after regEx.
-Various internal minor changes/optimizations.

version 1.0.0beta9d
-StreamLined the internal call to sound converter.

version 1.0.0beta9c
-FuzMap now supports fuz in loose files. Looses files are listed in priority in fuzList
-The fuzMap is now correctly reset when closing the esp/esm it's belonging to
-The Fuz_ComboList turns Red when the sound can't be played
-DirectTranslation and Heuristic now take in account the analogy of the format of both source and dest strings.
-Improved RegEx warning results
-Increased the playSound call timeOut for Fuz file. (this can also be manually adjusted in the prefs.ini, by editing the iPlayTimeOut value (default: 30): each digit means 100ms.
-Updated KoreanUI (by -Ren-)

version 1.0.0beta9b
-The 'generate fuz map' button has been removed: The Fuz map in now automatically generated the first time you click on the Play fuz audio button for a given loaded esp/esm. 
-TopicINFO with missing fuz file are now flagged (they can be filtered with the 'warning' filter)
-Fixed an issue where fuz files could be associated to a string if they both share the same Base formId but not the same MasterID.
-Added an icon to female NPC_
-Added emote info to the topicINFO comment section
-Updated strings warning datas
-Various optimizations in the fuz map generation

version 1.0.0beta9a
-Added Fuz Map support for Skyrim (to use Fallout4translator for Skyrim please follow the instructions on the TesvTranslator mainpage on Nexus)
-Added full inherited fuz support: The fuz map is now generated with all Master dependencies of the current loaded esp/esm. The folder for data is the same as the one used for dictionary cache (default .\fallout\data\).
-Added a button to copy the fuz list for the current edited record in the clipboard
-Added F11 as a shortcut to play fuz file.
-Some fuz UI polish and fix, added new icons.
-Archive direct access optimization when loading files from a generated map.

version 1.0.0beta9
New feature: Fuz generation map / and audio.
While translating an esp/esm, you can generate a fuz map for the given loaded mod, if relevant. 
Then you can see for each dialog which are the linked .Fuz files, and you can play them (Audio).

-Load an esm with some recorded dialog
-Edit a dialog
-go to the last Tab of edit window called 'dialog and topic'
-at the bottom of the topic list, click on the button 'generate fuz map'. 
-now you can see the associated fuz, and you can click on the '>' (play) button to listen it.

Notes: 
-this is limited to mod for fallout4 only ATM. The Skyrim Fuz support will be added later.
-the table is limited for the current edited mod only. Meaning, for the moment, there are no cross mod fuz maps (this will come later)
-the fuz map may not work well on its current state for mods that have inherited fuz from different masters. (This will be fixed later)


version 1.0.0beta8b/c
-Fixed an issue where some words could be inverted in .strings files in rare cases for some languages (Chinese/japanese) 

version 1.0.0beta8
-Translation state widgets are now refreshed correctly when switching between files.
-Few UI polish, added a new menu entry to directly access to Options or Languages, added few hints.
-The 'hide null string' filter now hides only strict null .strings (but not strings with invisible char like CR, LF, TAB etc...)
-ApplySST over .strings files now correctly uses internal StringID
-Added Experimental features for RTL languages and Unicode flag for RTL strings.
-Fixed LineBreak for Xml import over scriptPex strings.
-Fixed/Optimized few internal stuffs

version 1.0.0beta7
-Revamped the dictionaries options, and added an advanced dictionary cache generator for the game files. It's taking a bit more time to generate (10-30 sec depending of your system) but, it's highly recommended to use them and skip the old cache files system.
-Added an option to load delocalized esp/esm in a single list view (*Off* by default).
-Added a button toggle in the main toolbar to switch on the fly between the single-list and the three-lists view.
-Added widgets in the listViewHeaders that show the state of the current translation
-Because it's confusing, the GlobalSpellCheck doesn't switch the search filter itself.
-Added the response ID and the internal Dialog commentary in the DIAL and Topic tab in the Edit Windows
-Added an option to auto switch between DIAL and Record Tab while editing, (*On* by default)
-Added options to choose which strings to use when launching a global heuristic translation
-The cache builder now tries to use strings from BSA/BA2 in first place.
-Improved heuristic suggestions for shorts strings.
-Improved the startup initialization.
-The spellChecker is now not enabled by default.
-Updated few Hint texts for clarification.

version 1.0.0beta6
-User Dictionaries now also hold datas that may have been deleted in newer version of a given esp. In that way, a dictionary retains translation for esp/esm with same name but different content. (That situation occurs mainly when a mod comes with optionals esp with the same name but various content) The advanced dictionary save method (with esp checksum) is not necessary anymore (However the option is still there, as a legacy, in case people still want to use it)
-It is now possible to open and edit SST dictionaries (via contextMenu in the vocabulary list -> edit SST)
-Shorcuts for moving through records while in the editing windows have changed to ctrl-arrow_up/ctrl-arrow_down. (f1/f2 still work for that too)
-when an unchecked user dictionary sst is automatically applied, it is also properly added to the cache.
-added an option in the vocabulary tab to not load an 'unchecked' user dictionary automatically with its esp/esm. (this option is situational only and is not saved)
-Fixed an issue with the heuristic suggestions list sorting.


version 1.0.0beta5
-added a regex search option: click on the magnifying glass icon on the search field to bring switch the search mode (Note: the search is 'case insensitive')
-updated and reactivated the personal dictionary (a direct access has also been added in the main file menu). If the personal dictionary does not exist, then it is created. Use Ctrl-T to add a new entry, then you can edit both source and dest strings. Adding common entries in this dictionary improve all tools that use direct or heuristic word to word translation (like regEx, word-to-word suggestions while editing etc...) 
-you can now get strings directly by opening a Bsa/Ba2 archive. You can also select a Bsa/Ba2 when using the 'LoadStringAsTranslation' tool.
-improved the spellchecker words splitter accuracy, and added some options for to ignore some kind of words.
-added a globalSpellCheck tool that can check the whole opened file, and tag strings with spotted spellcheck errors. Note: If you intent to use the globalSpellCheck tool often, especially on big files, I strongly suggest to use the Hunspell API, because the MSWord API is really (I mean REALLY) slow to perform this kind of task. 
-added a basic, cross language ignore list for the spell checker (stored in utf8, in the .\spellchecker folder). You can ignore words by using the editor context menu.
-moved  spellChecker options in the options menu. (you also can still find it in the editor window toolbar) 
-when right-clicking on a filter button, you can select only that filter.
-added a case sensitive option to the regEx tool
-fixed an issue with 'Close All' where a dictionary could be closed without checking if it was modified before.
-some tools/buttons have new icons.


version 1.0.0beta4
-Updated the SpellCheck, improved 'underline' visual, and added Hunspell  API support that uses the free OpenOfice/mozilla dictionaries(please refer to the article: http://www.nexusmods.com/fallout4/articles/255/?)
-Fixed some minor stuff in the UI

version 1.0.0beta3
-Fixed a nasty issue where fallout4Translator would have crashed if MSword is not found on the system (for SpellCheck). Thx to pokara06 for the report ^^.

version 1.0.0beta2
-Improved the BSA/BA2 browser with faster list support, and quick filter
-Fixed an access violation error: the PexData viewer content is now correctly discarded when closing all pex files.
-Minor UI improvements

version 1.0.0beta1 : 
Big changes in this version and a lot of internal code refactoring. This version is in BETA. Any feedback welcome!

Main Feature:
Fallout4translator can now open more than one file at a time. This is opening some big new perpectives.
-You can now copy paste text between files/check a whole folder(the only limit is the system memory ;) )
-You can select more than one files in the loading files dialog or in the  bsa/ba2 browser. Very effective when looking for scripts to translate in a complete archive, (by default, script without text to translate are discarded). 
-When exporting a Translated Pex file in a BSA/BA2 , you can choose to also inject all opened PEX files that belong to the same BSA/BA2 *and* are translated (meaning: without red/pink string)
-You can navigate between files by using the top right ComboList or the shortcuts: Ctrl-Tab/Ctrl-shif-Tab. 
-Improved Undo: each file has it's own undo.
-Improved internal heuristic caching, which is now generated on the fly. 
-Added a reverse String tool (menu tool->language specific) for testing purpose (farsi/arabic).
-A lot of small fixes/improvement in various modules.





version 0.9.9a/b
-The Translate/MCM menu is available again, as well as the MCM compare tool.
-It's now possible to select an archive bsa/ba2 to open a script(Pex) or a Translate/MCM(Txt). This open a quick browser with the relevant files selection if there are any. 
-When finalizing a Script/Pex translation, you can choose to reintegrate the PEX inside the original archive (Work only for BA2, for now), or if you want to export it in loose file in the relevant subfolder next to the archive. 
-Added an option to prompt a dialog on what to do when loading a localized esp/esm (load .strings by defaut, in bsa first or choose them manually)
-Added a prefixe in the recent menu to see which kind of file is opened.
-Deleted some deprecated options
-Improved XML export speed


version 0.9.9
-Added a new tag for strings, for to indicate strings that don't need translation (Yellow/ hotkey: F3). Like the WorkInProgress (Pink/F2) tag, those strings are not added to the cache. 
-When editing a string, you can now use F1, F2, arrow keys up and down, to validate changes and navigate through fields of the current record.
-Added some XML export options  
-Updated import XML, SST, espCompare options. 
-Updated XML version export (with backward compatibility) for to fix some of the new XML import options. Legacy (default) options are not changed and work as before.
-Updated general performance and decreasing memory usage while loading big files
-oldDialogStyle: new option to add the original text as prefixe for all strings
-oldDialogStyle: when using prefixe it's now possible to set a different replacing string: for example, use: Sarcastic=Sarcasm to search for Sarcastic and replace by Sarcasm. (not a mandatory, you can keep only one word). Note: the search is case sensitive.
-Updated some internal code


version 0.9.8c.
-Added an utf8 check on delocalized esp load. If an esp encoded in utf8 is loaded when the source language is not set as utf8, a prompt will ask you what to do [force utf8] or [load anyway with the encoding defined by the source setting]. (in the last case, you may need to change the source language in fallout4translator options, then reload the esp 
-Recent regEx definitions are now saved through sessions
-Changed some regEx behaviors: 
Now you can use different syntaxes for backReferences calls to adjust how the regEx replacement must work for a given backreference, so you can mix part that should not be translated with other parts.
#1: do not translate the backreference and keep it "as is".
%1: try to translate the backreference by using strict match (direct translation)
$1: try translate the backreference using heuristic match (heuristic threshold can still be adjusted)
ex:
(Note) My Special Demo Note
^([\[\(\{\|].+?[\|\]\}\)]) (.+)
#1 %2
The regEx will not try to translate the part '(Note)' but will try to do a direct translate on the 2nd part 'My Special Demo Note'.

version 0.9.8b
-Fixed an issue with the word-splitter heuristic
-Added Undo/CtrlZ. All direct operations can be 'undone' except global functions. Undo/Ctrl-Z can be called more that once in a row.
Undo works on: direct translations, validation, copy paste, heuristic search, search and replace, regex, value fixes etc...
Undo doesn't work on: Full reset, Compare, new dialog or AddId tool can't be undone
-Streamlined options in SST and XML import with different scenarii/cases
-Updated SST format a slightly. New SST can't be used in previous version of fallout4translator

version 0.9.8
-Greatly improved the heuristic speed, threshold and results.
-Translations validated in the edit windows are now dynamically added to the current vocabulary without the need to save/reload the cache.
-Added options to XML import.
-Applying changes to "selection only" is now restricted to the current list view
-Updated default regEx for fixNumber/Alias.
-Added vocabulary entry cache for the upcoming new DLC

version 0.9.7b
-FixAlias now works the same way than FixNumbers 
-regEx pattern for FixAlias and FixNumber can be changed in options. (By default the regEx for Fixnumber should now match any (+-)integer or decimal numbers)
-Added an item in the heuristic validation menu to automatically validate a string and fixNumber for it on the fly.
-HeuristicSearch now matches strings without caring about %numbers% or <alias>
-Heuristic threshold increased.
-Fixed some debug code and a pointer exception.

version 0.9.7a
-Added a copy/paste directly through the lists. (Ctrl-C, Ctrl-V). (see article on Nexus)
-Added a Quick Numeric Regex Replace function. (Ctrl-N, or context menu): numbers from source strings will automatically replace numbers in destination string (in same order) (see article on Nexus)
-SpellCheck is now enabled by default if MSWord is found on the system.
-Added an option to keep the ForceUtf8 on Load/Save. (Not recommanded however, it's better to set the right codepage in the codepage.txt file and use the right source/dest languages to avoid translation mixup)
-XML export when using same language as source and dest now ignores strings that have the same source and dest content. That way you can export same language corrections more easily.

version 0.9.6a
-String status is now reset when applying an SST on the fly
-Autotrim string function is 'not disabled' by default
-RegEx now works with multilines entries
-Xml export now excludes blank and null strings

version 0.9.6
-New tool:RegEx Translation. It's now possible to use RegEx to translate or transform strings. (See the tutorial on Nexus)
-Added .Ba2 support. .Strings files will be automatically pulled from ba2 archives if relevant
-SpellCheck optimization.
-Added Korean Ressources (credits to -Ren-)
-Fixed an issue when .strings files are flagged as ReadOnly
-Various improvements and fixes.

version 0.9.5b
-Backward compatibility fix for XmlImport

version 0.9.5
-Added a spellCheck in the edit windows. This must be enabled in fallout4translator Options. Right click on a mispelled word will update the context menu with a list of suggestion. 
Important: The spellCheck relies on MSWord, so you need to have it installed for this to work, and it uses the parameters/language set in MSWord.
Note: this option is experimental. It will probably not work well with non occidental language. You can restrict the spellcheck to work only on the current selected word (with the context menu). In that case mispelled words are not underlined.
-Fixed an issue with XML import when a record have some same enumerated subrecords, with same source text but different translations (very rare). (xml must be exported again for this to work)
-Added StringID to XML export when it's relevant 
-Various improvements and fixes.


version 0.9.4
-New option (menu options, 2nd tab): when loading a localized esp/esm that requires .strings, you can now set an option to prompt for a filedialog, so you can choose which strings should be loaded (The strings must match the addon name and the source language set in Fallout4translator, but they can be placed anywhere rather than in a string folder next to the esp/esm)
-New tool: .Strings files comparison. Works only with source and dest language are the same. (You can use this to merge .strings together by flagging strings that match or not). More info here http://www.nexusmods.com/fallout4/articles/89/?
-Fixed an issue with some options/preferences default save.

version 0.9.3
-Added an option to force the strings view to use on one line only per string. This should help some languages to maintain a fluid display
-Added an option to disable the autotranslation on load. (Autotranslation is still available on demand through the menu or Ctrl-H)
-XML import now behaves the same way than SST, and look for EDID matches.
-Greatly optimized the Add DIAL ID option in AddIDtoString tool
-Internal changes to prepare the future unification with TesvTranslator.

version 0.9.2
-Updated Chinese UI translations. Thanks & Credits to Rebya.
-Apply SST tool improved. (vocabulary tab -> contextmenu on a dictionary). It now possible to define which strings selection is replaced and if the match must check for EDID references only, or EDID+SourceString.
-Streamlined options between EspCompare tool and ApplySST tool.
-Changed some heuristic thresholds.
-Updated CompareText routine.
-Various fix, improvements and optimizations

version 0.9.1
-Added an option in "search and replace" to search in all 3 lists (.strings, .dlStrings, .ilStrings). The keywords "alllists" has been added to the batch command.
-Fix for a case where the UI could stay locked after a load.
-Fixed an issue in EspCompare tool where some warnings were incorrectly set.

Version 0.9
-LookupFail in .Strings are now automatically fixed when loading .string with Esp/esm. Check in the log to see which record. The text '<PlaceHolder_Lookup>' is set as placeholder for fixed strings, so you can search for those terms to find the strings easily. (Default TraditionalChinese .strings come such buggys lookup failed)
-Some minor fix and optimization.
-Major core changes on how SSTDictionaries are saved and loaded. This will allow more functionalities and flexibility. Old SST can be loaded with restricted functionalities.
-Due to those major changes, saving dictionary in pure STRING mode is now deprecated and disabled. Strings must be loaded in Esp+Strings Hybrid mode to ensure forward compatibility.

Version 0.8.2
-New tool: "Batch search and replace": Allows to do mass search and replace based rules.
-By request, Added beta version of converter for Traditional Chinese <-> Simplified Chinese.
-"Load .Strings as Translation" also now work in .Strings mode.

Version 0.8.1
-New tool: "Load .Strings as Translation" to bypass the default translation mecanism when editing/translating .strings files. This can help the translation of mods that change the default .Strings files.
-Streamlined some Feedback/status. 

Version 0.8
-SST dictionary format change. Fallout4translator 0.8 can load the previous format but previous version of the tool will not be able to open 0.8+ files.
-SST dictionnary now can apply directly all similar sources strings with different translation in esp, string or hybrid mode.
-OldDialogTool: New option to copy original source for <Alias/global>
-OldDialogTool: The prefixe list is now saved by language. Tip: to not loose the list, if you want to disable an element, just add a char to it instead of deleting the line (for example: sarcastic*). 
-Search and replace: added a pattern system to the replace output.

Version 0.7b
-FormID search. Use "search in: EDID", and type the formID in hexadecimal.
-By Request: AddIdTool option to add DIAL Id to INFO datas.
-Minor code changes and Some internal optimizations

Version 0.7a
-Fixed some typo, and minor code changes 
-OldDialogTool: Prefixes tab is now showing at first

Version0.7
-OldDialogStyle tool. Added a recursive search so RNAM INFO data can be updated with the full dialog, even if it's not linked in the same record. Result will be flagged with a small light bulb for extra checking. This means that almost 100% strings can now been automagically converted. This works if all relevant datas are in the same esp/esm.
-OldDialogStyle tool : added some info in the tool window.
-Some internal optimizations again

Version0.6
-Added some advanced options to the OldDialogStyle tool.
-Some internal optimizations

Version0.5b
-Updated the Fields reference file to match Fallout4 stats.
-OldDialStyle Improvements:
-Added an option to cut the size of a strings if it's too long (The cut try to find the end of the closest word. Might not work well in chinese or japanese)
-Some internal optimizations

Version 0.5a
-OldDialStyle Improvements: 
-Added an option to skip strings that are too long for the screen 
-Added an option to add the relevant Prefixe (such as Flirt, Romance, Barter etc.)

Version 0.5
-New tool: OldDialog Style that generates Strings to use with the "Full Dialogs" mods found on Nexus here or here

Version 0.5
-New tool: OldDialogStyle that generates Strings to use with the "Full Dialogs" mods found on Nexus 


Version 0.4
-Greatly improved XMLImport/Export. 
-Since it was asked many times, XmlExport also indicate record/EDID. Note: importXML does not use Record/EDID references to build back translation, but only strings pairs.
-By request: Added a tool to add EDID/StringID to strings for translation reference in game.
-By request: Added a toggle to not popup the 'replace all similar strings' (The option can be found in the vertical icon bar of the edit windows, so it can be toggled on the fly if needed)
-English string are back to codepage 1252. Other stays to UTF8.
-Force UTF8 menu is back.

Version 0.3alpha
-Added some languages data
-Some UI cleanup.

Version 0.2alpha
-utf8 is now the default (and fallback) encoding. Other encoding are still available, but are probably not needed in regular process. 
-all strings references are now decoded: 100% of strings are correctly applied when loading fallout.esm. 
-few cleanup

version 0.1 alpha
-Inherited code from TesvTranslator
-Some Cleanup
-Fixed DIAL/INFO/QUST records for Fallout4
-Updated Pex decompiler (New opcode feedback is still a work in progress)