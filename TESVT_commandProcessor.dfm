object Form24: TForm24
  Left = 82
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'BatchProcessor'
  ClientHeight = 591
  ClientWidth = 893
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  Position = poMainFormCenter
  OnCreate = FormCreate
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 553
    Width = 893
    Height = 38
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = 552
    ExplicitWidth = 889
    DesignSize = (
      893
      38)
    object but_Run: TButton
      Left = 732
      Top = 5
      Width = 139
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'butRunProcessor'
      ModalResult = 1
      TabOrder = 0
      OnClick = but_RunClick
      ExplicitLeft = 728
    end
    object cancel: TButton
      Left = 651
      Top = 5
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'cancel'
      ModalResult = 2
      TabOrder = 1
      ExplicitLeft = 647
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 225
    Height = 553
    Align = alLeft
    BevelOuter = bvNone
    BorderWidth = 5
    TabOrder = 1
    ExplicitHeight = 552
    object ListBox1: TListBox
      Left = 5
      Top = 5
      Width = 215
      Height = 543
      Align = alClient
      ItemHeight = 15
      Items.Strings = (
        'Global_ImportFolder='
        '----------------'
        'StartRule'
        'EndRule'
        '---------------'
        'LangSource='
        'LangDest='
        '---------------'
        'UseDataDir='
        'ExportSubFolder='
        '---------------'
        'Command=LoadFile:'
        'Command=CloseFile'
        'Command=CloseAll'
        'Command=Finalize'
        'Command=GenerateDictionaries'
        'Command=ApplySst:0:1:'
        'Command=ImportSst:0:1:'
        'Command=ImportXml:0:1:'
        'Command=LoadMasters'
        'Command=SaveDictionary'
        'Command=ApiTranslation:5:1')
      TabOrder = 0
      OnDblClick = ListBox1DblClick
      ExplicitHeight = 542
    end
  end
  object Panel3: TPanel
    Left = 225
    Top = 0
    Width = 668
    Height = 553
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 5
    Caption = 'Panel3'
    TabOrder = 2
    ExplicitWidth = 664
    ExplicitHeight = 552
    object synmemo: TSynEdit
      Left = 5
      Top = 5
      Width = 658
      Height = 543
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      TabOrder = 0
      CodeFolding.GutterShapeSize = 11
      CodeFolding.CollapsedLineColor = clGrayText
      CodeFolding.FolderBarLinesColor = clGrayText
      CodeFolding.IndentGuidesColor = clGray
      CodeFolding.IndentGuides = True
      CodeFolding.ShowCollapsedLine = False
      CodeFolding.ShowHintMark = True
      UseCodeFolding = False
      BorderStyle = bsNone
      Gutter.DigitCount = 2
      Gutter.Font.Charset = DEFAULT_CHARSET
      Gutter.Font.Color = clWindowText
      Gutter.Font.Height = -11
      Gutter.Font.Name = 'Courier New'
      Gutter.Font.Style = []
      Gutter.Visible = False
      Gutter.Width = 0
      Options = [eoDragDropEditing, eoEnhanceEndKey, eoGroupUndo, eoSmartTabDelete, eoSmartTabs, eoTabIndent]
      FontSmoothing = fsmNone
      ExplicitWidth = 654
      ExplicitHeight = 542
    end
  end
  object MainMenu1: TMainMenu
    Left = 513
    Top = 448
    object Menu_files: TMenuItem
      Caption = 'File'
      object menu_Load: TMenuItem
        Caption = 'Load_proc'
        OnClick = menu_LoadClick
      end
      object menu_save: TMenuItem
        Caption = 'Save_proc'
        OnClick = menu_saveClick
      end
    end
  end
end
