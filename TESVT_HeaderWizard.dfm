object Form23: TForm23
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'headerWizard'
  ClientHeight = 697
  ClientWidth = 623
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  TextHeight = 13
  object Label1: TLabel
    Left = 56
    Top = 8
    Width = 513
    Height = 26
    AutoSize = False
    Caption = 'lbl_1VerifyPath'
    WordWrap = True
  end
  object Label2: TLabel
    Left = 56
    Top = 67
    Width = 111
    Height = 13
    Caption = 'lbl_2ChooseLanguage2'
  end
  object Label3: TLabel
    Left = 56
    Top = 113
    Width = 87
    Height = 13
    Caption = 'lbl_3LoadRulesList'
  end
  object Label4: TLabel
    Left = 56
    Top = 163
    Width = 109
    Height = 13
    Caption = 'lbl_4ChooseATemplate'
  end
  object Label5: TLabel
    Left = 56
    Top = 369
    Width = 99
    Height = 13
    Caption = 'lbl_6ProcessHeaders'
  end
  object Label6: TLabel
    Left = 207
    Top = 137
    Width = 51
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'lbl_OR'
  end
  object Label8: TLabel
    Left = 56
    Top = 209
    Width = 512
    Height = 30
    AutoSize = False
    Caption = 'lbl_5FiletoProcess'
    WordWrap = True
  end
  object SpeedButton2: TSpeedButton
    Left = 56
    Top = 257
    Width = 57
    Height = 56
    Hint = 'hint_WizardDirectory'
    Flat = True
    Glyph.Data = {
      A6040000424DA604000000000000A60000002800000020000000200000000100
      08000000000000040000120B0000120B00001C0000001C00000000000000FFFF
      FF008D602E008E602F008F613000AC7F4D00AD7F4E00CB9D6C00895D27008A5D
      29008A5E29008B5E2A008C5F2B008C5F2C008D602D00AA7D4A00B5895400BF92
      5F0084592000855A21009E733900AD814A007E5518007D5418007F561A008056
      1B0081571C0082581D0001010101010101010101010101010101010101010101
      0101010101010101010101010101010101010101010101010101010101010101
      0101010101010101010101010101010101010101010101010101010101010101
      0101010101010101010101010101010101010101010101010101010101010101
      0101010101010101010101010101131308080D0D04040404040404040E0E0B0B
      0E0E0B0B0A0A0202010101010101131308080D0D04040404040404040E0E0B0B
      0E0E0B0B0A0A0202010101010101090914141414141414141414141414141414
      1414141414140404010101010101090914141414141414141414141414141414
      14141414141404040101010101010E0E15151515151515151515151515151515
      15151515151504040101010101010E0E15151515151515151515151515151515
      1515151515150404010101010101020210101010101010101010101010101010
      1010101010100404010101010101020210101010101010101010101010101010
      1010101010100404010101010101080811111111111111111111111111111111
      1111111111110303010101010101080811111111111111111111111111111111
      11111111111103030101010101011B1B07070707070707070707070707070707
      0707070707070B0B0101010101011B1B07070707070707070707070707070707
      0707070707070B0B0101010101011B1B07070707070707070707070707070707
      0707070707070B0B0101010101011B1B07070707070707070707070707070707
      0707070707070B0B0101010101011B1B07070707070707070707070707070707
      0707070707070B0B0101010101011B1B07070707070707070707070707070707
      0707070707070B0B010101010101171707070707070707070707070707070707
      0707070707070202010101010101171707070707070707070707070707070707
      0707070707070202010101010101161607070707070707070707070707070707
      070707070707040401010101010116161A1A1A1A1A1A19191616161616161807
      070707070707040401010101010112120F0F0505060604040606060606060407
      070707070707040401010101010112120F0F0505060604040606060606060407
      07070707070704040101010101010C0C0F0F0F0F0F0F04040F0F0F0F0F0F0407
      07070707070704040101010101010C0C04040404040404040404040404040404
      0404040404040404010101010101010101010101010101010101010101010101
      0101010101010101010101010101010101010101010101010101010101010101
      0101010101010101010101010101010101010101010101010101010101010101
      0101010101010101010101010101010101010101010101010101010101010101
      01010101010101010101}
    ParentShowHint = False
    ShowHint = True
    OnClick = SpeedButton2Click
  end
  object SpeedButton3: TSpeedButton
    Left = 68
    Top = 311
    Width = 33
    Height = 26
    Hint = 'hint_wizardDeleteItems'
    ImageIndex = 12
    Images = Form1.ImageList1
    Flat = True
    ParentShowHint = False
    ShowHint = True
    OnClick = SpeedButton3Click
  end
  object ComboBox1: TComboBox
    Left = 56
    Top = 182
    Width = 513
    Height = 21
    Style = csDropDownList
    DropDownCount = 15
    TabOrder = 0
    OnChange = ComboBox1Change
  end
  object Edit1: TEdit
    Left = 56
    Top = 40
    Width = 433
    Height = 21
    ReadOnly = True
    TabOrder = 1
    OnClick = Button7Click
  end
  object Button1: TButton
    Left = 119
    Top = 388
    Width = 361
    Height = 32
    Caption = 'butRunProcessor'
    Enabled = False
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 471
    Top = 664
    Width = 130
    Height = 25
    Cancel = True
    Caption = 'Close'
    ModalResult = 2
    TabOrder = 3
    OnClick = Button2Click
  end
  object ActivityIndicator1: TActivityIndicator
    Left = 486
    Top = 388
  end
  object ComboBox2: TComboBox
    Left = 56
    Top = 86
    Width = 73
    Height = 21
    Style = csDropDownList
    DropDownCount = 20
    TabOrder = 5
    OnChange = ComboBox2Change
  end
  object ButtonLoadRules: TButton
    Left = 56
    Top = 132
    Width = 145
    Height = 25
    Caption = 'but_LoadRulesList'
    TabOrder = 6
    OnClick = ButtonLoadRulesClick
  end
  object Panel1: TPanel
    Left = 264
    Top = 132
    Width = 305
    Height = 25
    BevelOuter = bvLowered
    Caption = 'DragDropRulesHere'
    TabOrder = 7
  end
  object CheckBox1: TCheckBox
    Left = 24
    Top = 666
    Width = 377
    Height = 17
    BiDiMode = bdLeftToRight
    Caption = 'chk_closeallwithwizard'
    Checked = True
    ParentBiDiMode = False
    State = cbChecked
    TabOrder = 8
  end
  object Button7: TButton
    Left = 495
    Top = 38
    Width = 74
    Height = 25
    Caption = 'Options'
    TabOrder = 9
    OnClick = Button7Click
  end
  object CheckBox2: TCheckBox
    Left = 135
    Top = 90
    Width = 354
    Height = 17
    Caption = 'CycleAllLangs'
    TabOrder = 10
    Visible = False
  end
  object CheckBox3: TCheckBox
    Left = 495
    Top = 90
    Width = 97
    Height = 17
    Caption = 'AllTemplates'
    TabOrder = 11
    Visible = False
  end
  object ListBox1: TListBox
    Left = 119
    Top = 245
    Width = 449
    Height = 118
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ItemHeight = 14
    MultiSelect = True
    ParentFont = False
    TabOrder = 12
  end
  object Panel2: TPanel
    Left = 24
    Top = 432
    Width = 577
    Height = 228
    BevelOuter = bvNone
    TabOrder = 13
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 577
      Height = 136
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Label7: TLabel
        Left = 25
        Top = 7
        Width = 513
        Height = 56
        AutoSize = False
        Caption = 'lbl_PatchGameFiles'
        WordWrap = True
      end
      object SpeedButton1: TSpeedButton
        Left = 25
        Top = 69
        Width = 57
        Height = 56
        Hint = 'hint_WizardDirectory'
        Flat = True
        Glyph.Data = {
          A6040000424DA604000000000000A60000002800000020000000200000000100
          08000000000000040000120B0000120B00001C0000001C00000000000000FFFF
          FF008D602E008E602F008F613000AC7F4D00AD7F4E00CB9D6C00895D27008A5D
          29008A5E29008B5E2A008C5F2B008C5F2C008D602D00AA7D4A00B5895400BF92
          5F0084592000855A21009E733900AD814A007E5518007D5418007F561A008056
          1B0081571C0082581D0001010101010101010101010101010101010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          0101010101010101010101010101131308080D0D04040404040404040E0E0B0B
          0E0E0B0B0A0A0202010101010101131308080D0D04040404040404040E0E0B0B
          0E0E0B0B0A0A0202010101010101090914141414141414141414141414141414
          1414141414140404010101010101090914141414141414141414141414141414
          14141414141404040101010101010E0E15151515151515151515151515151515
          15151515151504040101010101010E0E15151515151515151515151515151515
          1515151515150404010101010101020210101010101010101010101010101010
          1010101010100404010101010101020210101010101010101010101010101010
          1010101010100404010101010101080811111111111111111111111111111111
          1111111111110303010101010101080811111111111111111111111111111111
          11111111111103030101010101011B1B07070707070707070707070707070707
          0707070707070B0B0101010101011B1B07070707070707070707070707070707
          0707070707070B0B0101010101011B1B07070707070707070707070707070707
          0707070707070B0B0101010101011B1B07070707070707070707070707070707
          0707070707070B0B0101010101011B1B07070707070707070707070707070707
          0707070707070B0B0101010101011B1B07070707070707070707070707070707
          0707070707070B0B010101010101171707070707070707070707070707070707
          0707070707070202010101010101171707070707070707070707070707070707
          0707070707070202010101010101161607070707070707070707070707070707
          070707070707040401010101010116161A1A1A1A1A1A19191616161616161807
          070707070707040401010101010112120F0F0505060604040606060606060407
          070707070707040401010101010112120F0F0505060604040606060606060407
          07070707070704040101010101010C0C0F0F0F0F0F0F04040F0F0F0F0F0F0407
          07070707070704040101010101010C0C04040404040404040404040404040404
          0404040404040404010101010101010101010101010101010101010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          01010101010101010101}
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton1Click
      end
      object Button5: TButton
        Left = 88
        Top = 70
        Width = 130
        Height = 25
        Caption = 'butBackupBa2'
        TabOrder = 0
        OnClick = Button5Click
      end
      object Button6: TButton
        Left = 88
        Top = 101
        Width = 130
        Height = 25
        Caption = 'butRestoreBackup'
        TabOrder = 1
        OnClick = Button6Click
      end
      object Button4: TButton
        Left = 224
        Top = 70
        Width = 320
        Height = 56
        Caption = 'butPatchGameFile'
        TabOrder = 2
        OnClick = Button4Click
      end
    end
    object Memo1: TSynEdit
      Left = 0
      Top = 136
      Width = 577
      Height = 92
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Pitch = fpFixed
      Font.Style = []
      TabOrder = 1
      CodeFolding.GutterShapeSize = 11
      CodeFolding.CollapsedLineColor = clGrayText
      CodeFolding.FolderBarLinesColor = clGrayText
      CodeFolding.IndentGuidesColor = clGray
      CodeFolding.IndentGuides = True
      CodeFolding.ShowCollapsedLine = False
      CodeFolding.ShowHintMark = True
      UseCodeFolding = False
      Gutter.Color = clWindow
      Gutter.Font.Charset = DEFAULT_CHARSET
      Gutter.Font.Color = clWindowText
      Gutter.Font.Height = -11
      Gutter.Font.Name = 'Courier New'
      Gutter.Font.Style = []
      Gutter.Visible = False
      Gutter.Width = 0
      Lines.Strings = (
        'Log:')
      Options = [eoAutoIndent, eoDragDropEditing, eoEnhanceEndKey, eoGroupUndo, eoScrollPastEol, eoSmartTabDelete, eoSmartTabs, eoTabsToSpaces]
      ReadOnly = True
      RightEdge = 0
      ScrollBars = ssVertical
      WordWrap = True
      OnSpecialLineColors = Memo1SpecialLineColors
      FontSmoothing = fsmNone
    end
  end
end
