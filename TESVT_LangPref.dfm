object Form3: TForm3
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Set_Options'
  ClientHeight = 667
  ClientWidth = 665
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 626
    Width = 665
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = 616
    ExplicitWidth = 661
    object Button1: TButton
      Left = 552
      Top = 6
      Width = 97
      Height = 25
      Caption = 'Ok'
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
    object Button6: TButton
      Left = 17
      Top = 6
      Width = 128
      Height = 25
      Hint = 'Hint_butresetdialog'
      Caption = 'but_reset_dialogopts'
      TabOrder = 1
      OnClick = Button6Click
    end
    object Button2: TButton
      Left = 448
      Top = 6
      Width = 98
      Height = 25
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 2
    end
    object Button8: TButton
      Left = 151
      Top = 6
      Width = 130
      Height = 25
      Hint = 'Hint_butresetrecent'
      Caption = 'but_resetRecent'
      TabOrder = 3
      OnClick = Button8Click
    end
    object Button14: TButton
      Left = 287
      Top = 6
      Width = 130
      Height = 25
      Hint = 'Hint_butresetprefs'
      Caption = 'but_resetPrefs'
      ModalResult = 1
      TabOrder = 4
      OnClick = Button14Click
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 665
    Height = 626
    ActivePage = TabSheet6
    Align = alClient
    TabOrder = 1
    OnChange = PageControl1Change
    ExplicitWidth = 661
    ExplicitHeight = 616
    object TabSheet1: TTabSheet
      Caption = 'Set_Options2'
      object Label1: TLabel
        Left = 11
        Top = 11
        Width = 146
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        BiDiMode = bdLeftToRight
        Caption = 'Source_Lang'
        ParentBiDiMode = False
      end
      object Label2: TLabel
        Left = 376
        Top = 11
        Width = 115
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        BiDiMode = bdLeftToRight
        Caption = 'Dest_Lang'
        ParentBiDiMode = False
      end
      object Label4: TLabel
        Left = 274
        Top = 11
        Width = 106
        Height = 13
        AutoSize = False
      end
      object Label5: TLabel
        Left = 608
        Top = 11
        Width = 41
        Height = 13
        AutoSize = False
      end
      object SpeedButton1: TSpeedButton
        Left = 481
        Top = 551
        Width = 30
        Height = 26
        Hint = 'hint_CacheInfoPage'
        Flat = True
        Glyph.Data = {
          C6010000424DC601000000000000C60000002800000010000000100000000100
          08000000000000010000120B0000120B0000240000002400000000000000FFFF
          FF008D602E008E602F008F613000C99B6A00885C2600895D27008A5D29008A5E
          29008B5E2A008C5F2C008D602D00B5895400B98C580083581F0084592000855A
          2200865B2300875C2500A57A42007F561A0080561B0081571C0082581D009269
          2D009A7035007C5415007F5716007D5416007E551700875F20008C6325007750
          0E0078510F00FFFFFF0001010101010101010101010101010101010101010101
          0101010101010101010101010101012121211C1F190101010101010101012121
          1B1718180F140101010101010121211508030B0713060E010101010121211E0A
          0401010A090B04050101010121221104040101060704040501010101211D0804
          0401011013040405010101011C160A04040101171304040501010101200F0B04
          040A10100B040405010101011A120C040401010B0404040501010101010D0204
          0404040404040501010101010101050404040404040501010101010101010105
          0505050505010101010101010101010101010101010101010101010101010101
          01010101010101010101}
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton1Click
      end
      object ComboBox1: TComboBox
        Left = 163
        Top = 8
        Width = 105
        Height = 21
        Style = csDropDownList
        DropDownCount = 30
        ItemIndex = 0
        TabOrder = 0
        Text = 'English'
        OnChange = ComboBox1Change
        Items.Strings = (
          'English'
          'French')
      end
      object ComboBox2: TComboBox
        Left = 497
        Top = 8
        Width = 105
        Height = 21
        Style = csDropDownList
        DropDownCount = 30
        ItemIndex = 1
        TabOrder = 1
        Text = 'French'
        OnChange = ComboBox2Change
        Items.Strings = (
          'English'
          'French')
      end
      object GroupBox3: TGroupBox
        Left = 17
        Top = 35
        Width = 621
        Height = 86
        Caption = 'pathForCache'
        TabOrder = 2
        object Label11: TLabel
          Left = 0
          Top = 22
          Width = 133
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Data_Cache_Folder'
        end
        object Label3: TLabel
          Left = 0
          Top = 49
          Width = 133
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          BiDiMode = bdLeftToRight
          Caption = 'Strings_Cache_Folder'
          ParentBiDiMode = False
        end
        object Edit6: TEdit
          Left = 139
          Top = 19
          Width = 398
          Height = 21
          Hint = 'Hint_folderData'
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 0
          OnClick = Edit6Click
        end
        object Edit1: TEdit
          Left = 139
          Top = 46
          Width = 398
          Height = 21
          Hint = 'Hint_folderString'
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 1
          OnClick = Edit1Click
        end
        object Button13: TButton
          Left = 560
          Top = 32
          Width = 50
          Height = 25
          DropDownMenu = PopupData
          ImageAlignment = iaCenter
          ImageIndex = 42
          Images = Form1.ImageList1
          Style = bsSplitButton
          TabOrder = 2
          OnClick = Button13Click
        end
      end
      object Button3: TButton
        Left = 517
        Top = 551
        Width = 121
        Height = 25
        Caption = 'but_Build_Dic'
        TabOrder = 3
        OnClick = Button3Click
      end
      object CheckBox9: TCheckBox
        Left = 155
        Top = 555
        Width = 320
        Height = 17
        Caption = 'Chk_OnlyLooseFile'
        TabOrder = 4
        OnClick = CheckBox9Click
      end
      object PageControl2: TPageControl
        Left = 13
        Top = 136
        Width = 632
        Height = 401
        ActivePage = TabSheet4
        TabOrder = 5
        OnChange = PageControl2Change
        object TabSheet4: TTabSheet
          Caption = 'tab_Preview'
          object memo1: TSynEdit
            Left = 0
            Top = 0
            Width = 624
            Height = 373
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Pitch = fpFixed
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
            Gutter.Color = clWindow
            Gutter.Font.Charset = DEFAULT_CHARSET
            Gutter.Font.Color = clWindowText
            Gutter.Font.Height = -11
            Gutter.Font.Name = 'Courier New'
            Gutter.Font.Style = []
            Gutter.Visible = False
            Gutter.Width = 0
            Options = [eoAutoIndent, eoDragDropEditing, eoEnhanceEndKey, eoGroupUndo, eoSmartTabDelete, eoSmartTabs, eoTabsToSpaces]
            ReadOnly = True
            RightEdge = 0
            OnSpecialLineColors = memo1SpecialLineColors
            FontSmoothing = fsmNone
          end
        end
        object TabSheet5: TTabSheet
          Caption = 'tab_bsaDef'
          ImageIndex = 1
          object GroupBox5: TGroupBox
            Left = 3
            Top = 0
            Width = 303
            Height = 361
            Caption = 'bsa_DefaultName'
            Padding.Left = 10
            Padding.Top = 10
            Padding.Right = 10
            Padding.Bottom = 10
            TabOrder = 0
            object Memo3: TMemo
              Left = 12
              Top = 25
              Width = 279
              Height = 297
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              WordWrap = False
              OnChange = Memo3Change
            end
            object Button9: TButton
              Left = 215
              Top = 328
              Width = 75
              Height = 20
              Caption = 'but_reset'
              TabOrder = 1
              OnClick = Button9Click
            end
          end
          object GroupBox6: TGroupBox
            Left = 312
            Top = 0
            Width = 309
            Height = 361
            Caption = 'bsa_Alias'
            Padding.Left = 10
            Padding.Top = 10
            Padding.Right = 10
            Padding.Bottom = 10
            TabOrder = 1
            object Memo4: TMemo
              Left = 13
              Top = 24
              Width = 283
              Height = 298
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              WordWrap = False
              OnChange = Memo3Change
            end
            object Button10: TButton
              Left = 221
              Top = 328
              Width = 75
              Height = 20
              Caption = 'but_reset'
              TabOrder = 1
              OnClick = Button10Click
            end
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Set_Options4'
      ImageIndex = 1
      object Label16: TLabel
        Left = 126
        Top = 208
        Width = 519
        Height = 13
        AutoSize = False
        Caption = 'lbl_UndoCount'
      end
      object CheckBoxOptSound: TCheckBox
        Left = 16
        Top = 182
        Width = 629
        Height = 17
        Caption = 'ChkOptSound'
        TabOrder = 0
      end
      object GroupBox1: TGroupBox
        Left = 13
        Top = 334
        Width = 629
        Height = 105
        Caption = 'OptBackup'
        TabOrder = 1
        object CheckBoxOptBackup: TCheckBox
          Left = 11
          Top = 23
          Width = 594
          Height = 17
          Caption = 'CheckBoxOptBackup'
          TabOrder = 0
          OnClick = CheckBoxOptBackupClick
        end
        object CheckBoxOptFolder: TCheckBox
          Left = 24
          Top = 46
          Width = 581
          Height = 17
          Caption = 'CheckBoxOptFolder'
          Enabled = False
          TabOrder = 1
          OnClick = CheckBoxOptBackupClick
        end
        object Edit2: TEdit
          Left = 24
          Top = 69
          Width = 581
          Height = 21
          Enabled = False
          ReadOnly = True
          TabOrder = 2
          OnClick = Edit2Click
        end
      end
      object CheckBox5: TCheckBox
        Left = 16
        Top = 159
        Width = 617
        Height = 17
        Caption = 'ChkVTSimpleLine'
        TabOrder = 2
      end
      object CheckBox7: TCheckBox
        Left = 16
        Top = 67
        Width = 617
        Height = 17
        Caption = 'ChkAutoTranslate'
        TabOrder = 3
      end
      object CheckBox8: TCheckBox
        Left = 16
        Top = 90
        Width = 629
        Height = 17
        Caption = 'ChkUseLocOptions'
        TabOrder = 4
      end
      object CheckBox1: TCheckBox
        Left = 16
        Top = 113
        Width = 629
        Height = 17
        Caption = 'ChkLoadSingleList'
        TabOrder = 5
      end
      object CheckBox2: TCheckBox
        Left = 16
        Top = 136
        Width = 617
        Height = 17
        Caption = 'ChkAutoSwitchDIAL'
        TabOrder = 6
      end
      object Panel3: TPanel
        Left = 16
        Top = 11
        Width = 629
        Height = 41
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 7
        object Label7: TLabel
          Left = 11
          Top = 11
          Width = 91
          Height = 13
          AutoSize = False
          BiDiMode = bdLeftToRight
          Caption = 'UILang'
          ParentBiDiMode = False
        end
        object Label8: TLabel
          Left = 227
          Top = 11
          Width = 378
          Height = 13
          AutoSize = False
          BiDiMode = bdLeftToRight
          Caption = 'Lbl_UIChange'
          ParentBiDiMode = False
        end
        object ComboBox3: TComboBox
          Left = 108
          Top = 8
          Width = 105
          Height = 21
          Style = csDropDownList
          BiDiMode = bdLeftToRight
          DropDownCount = 30
          ParentBiDiMode = False
          TabOrder = 0
        end
      end
      object Edit8: TEdit
        Left = 16
        Top = 205
        Width = 89
        Height = 21
        ReadOnly = True
        TabOrder = 8
        Text = '50'#160'000'
      end
      object UpDown2: TUpDown
        Left = 105
        Top = 205
        Width = 15
        Height = 21
        Associate = Edit8
        Max = 300000
        Increment = 10000
        Position = 50000
        TabOrder = 9
      end
      object GroupBox8: TGroupBox
        Left = 13
        Top = 445
        Width = 629
        Height = 70
        TabOrder = 10
        object CheckBox12: TCheckBox
          Left = 24
          Top = 16
          Width = 569
          Height = 17
          Caption = 'ChkFixedExportFolder'
          TabOrder = 0
        end
        object Edit9: TEdit
          Left = 24
          Top = 39
          Width = 581
          Height = 21
          ReadOnly = True
          TabOrder = 1
          OnClick = Edit9Click
        end
      end
      object GroupBox11: TGroupBox
        Left = 16
        Top = 278
        Width = 629
        Height = 56
        Caption = 'OptDataCache'
        TabOrder = 11
        object CheckBox15: TCheckBox
          Left = 24
          Top = 21
          Width = 433
          Height = 17
          Caption = 'ChkUseDataCache'
          TabOrder = 0
        end
        object Button15: TButton
          Left = 478
          Top = 19
          Width = 127
          Height = 25
          Hint = 'Hint_resetDataCache'
          Caption = 'but_resetDataCache'
          TabOrder = 1
          OnClick = Button15Click
        end
      end
      object CheckBox4: TCheckBox
        Left = 16
        Top = 232
        Width = 473
        Height = 17
        Caption = 'ChkQuickEdit'
        TabOrder = 12
      end
      object CheckBox16: TCheckBox
        Left = 57
        Top = 255
        Width = 416
        Height = 17
        Caption = 'ChkQuickEditShortcut'
        TabOrder = 13
      end
      object GroupBox13: TGroupBox
        Left = 13
        Top = 519
        Width = 629
        Height = 67
        TabOrder = 14
        object Label9: TLabel
          Left = 72
          Top = 14
          Width = 473
          Height = 13
          AutoSize = False
          Caption = 'sstCountBackup'
        end
        object Label20: TLabel
          Left = 72
          Top = 41
          Width = 481
          Height = 13
          AutoSize = False
          Caption = 'lbl_AutoSave'
        end
        object SpeedButton2: TSpeedButton
          Left = 571
          Top = 24
          Width = 34
          Height = 22
          Hint = 'Hint_OpenUserFolder'
          ImageIndex = 21
          Images = Form1.ImageList1
          Flat = True
          ParentShowHint = False
          ShowHint = True
          OnClick = SpeedButton2Click
        end
        object Edit3: TEdit
          Left = 11
          Top = 10
          Width = 33
          Height = 21
          Hint = 'Hint_Savebackup'
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 0
          Text = '5'
        end
        object UpDown1: TUpDown
          Left = 44
          Top = 10
          Width = 16
          Height = 21
          Associate = Edit3
          Max = 25
          Position = 5
          TabOrder = 1
        end
        object Edit11: TEdit
          Left = 11
          Top = 37
          Width = 33
          Height = 21
          Hint = 'Hint_Autobackup'
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 2
          Text = '0'
        end
        object UpDown3: TUpDown
          Left = 44
          Top = 37
          Width = 16
          Height = 21
          Associate = Edit11
          TabOrder = 3
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Set_Options5'
      ImageIndex = 2
      object PageControl3: TPageControl
        Left = 3
        Top = 7
        Width = 651
        Height = 579
        ActivePage = TabSheet7
        TabOrder = 0
        object TabSheet7: TTabSheet
          Caption = 'FuzMiscOpt'
          object GroupBox4: TGroupBox
            Left = 3
            Top = 16
            Width = 637
            Height = 500
            Caption = 'fuzBSAPattern'
            TabOrder = 0
            object Label12: TLabel
              Left = 16
              Top = 24
              Width = 593
              Height = 66
              AutoSize = False
              Caption = 'fuzPatternNotice'
              WordWrap = True
            end
            object Label13: TLabel
              Left = 16
              Top = 468
              Width = 98
              Height = 13
              AutoSize = False
              Caption = 'lbl_FuzDataFdr'
            end
            object Memo2: TMemo
              Left = 16
              Top = 104
              Width = 609
              Height = 321
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
              ScrollBars = ssVertical
              TabOrder = 0
            end
            object Button7: TButton
              Left = 550
              Top = 438
              Width = 75
              Height = 20
              Caption = 'but_reset'
              TabOrder = 1
              OnClick = Button7Click
            end
            object Edit7: TEdit
              Left = 120
              Top = 464
              Width = 505
              Height = 21
              ReadOnly = True
              TabOrder = 2
              OnClick = Edit7Click
            end
          end
          object CheckBox3: TCheckBox
            Left = 19
            Top = 522
            Width = 593
            Height = 17
            Caption = 'ChkUseAdvancedDic2'
            TabOrder = 1
          end
        end
        object TabSheet8: TTabSheet
          Caption = 'RegExOpt'
          ImageIndex = 1
          object GroupBox2: TGroupBox
            Left = 3
            Top = 3
            Width = 637
            Height = 143
            Caption = 'regExOpts'
            TabOrder = 0
            object Label6: TLabel
              Left = 24
              Top = 23
              Width = 67
              Height = 13
              Caption = 'FixNumberPtn'
            end
            object Label10: TLabel
              Left = 24
              Top = 48
              Width = 52
              Height = 13
              Caption = 'FixAliasPtn'
            end
            object Label22: TLabel
              Left = 24
              Top = 76
              Width = 77
              Height = 13
              Caption = 'FixAliasStrictPtn'
            end
            object Label23: TLabel
              Left = 24
              Top = 104
              Width = 67
              Height = 13
              Caption = 'FixBreakWord'
            end
            object edit4: TEdit
              Left = 134
              Top = 20
              Width = 379
              Height = 22
              BiDiMode = bdLeftToRight
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Courier New'
              Font.Style = []
              ParentBiDiMode = False
              ParentFont = False
              TabOrder = 0
            end
            object Button4: TButton
              Left = 534
              Top = 21
              Width = 75
              Height = 20
              Caption = 'but_reset'
              TabOrder = 1
              OnClick = Button4Click
            end
            object Button5: TButton
              Left = 534
              Top = 47
              Width = 75
              Height = 19
              Caption = 'but_reset'
              TabOrder = 2
              OnClick = Button5Click
            end
            object edit5: TEdit
              Left = 134
              Top = 47
              Width = 379
              Height = 22
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
            end
            object Edit12: TEdit
              Left = 134
              Top = 75
              Width = 379
              Height = 22
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
              TabOrder = 4
            end
            object Button18: TButton
              Left = 534
              Top = 75
              Width = 75
              Height = 19
              Caption = 'but_reset'
              TabOrder = 5
              OnClick = Button18Click
            end
            object Edit13: TEdit
              Left = 134
              Top = 103
              Width = 379
              Height = 22
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
              TabOrder = 6
            end
            object Button19: TButton
              Left = 534
              Top = 103
              Width = 75
              Height = 19
              Caption = 'but_reset'
              TabOrder = 7
              OnClick = Button19Click
            end
          end
          object GroupBox7: TGroupBox
            Left = 3
            Top = 152
            Width = 637
            Height = 396
            Caption = 'derivedStringsParseRules'
            TabOrder = 1
            object Label17: TLabel
              Left = 16
              Top = 24
              Width = 593
              Height = 74
              AutoSize = False
              Caption = 'derivedStringsNotice'
              WordWrap = True
            end
            object Memo5: TMemo
              Left = 16
              Top = 104
              Width = 593
              Height = 256
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
              ScrollBars = ssVertical
              TabOrder = 0
            end
            object Button11: TButton
              Left = 534
              Top = 366
              Width = 75
              Height = 20
              Caption = 'but_reset'
              TabOrder = 1
              OnClick = Button11Click
            end
            object CheckBox10: TCheckBox
              Left = 194
              Top = 366
              Width = 319
              Height = 17
              Caption = 'VerboseParsing'
              TabOrder = 2
            end
            object CheckBox11: TCheckBox
              Left = 16
              Top = 366
              Width = 153
              Height = 17
              Caption = 'EnableDerived'
              TabOrder = 3
            end
          end
        end
        object TabSheet10: TTabSheet
          Caption = 'TagNoTransOpt'
          ImageIndex = 3
          object GroupBox12: TGroupBox
            Left = 3
            Top = 3
            Width = 637
            Height = 545
            Caption = 'TagNoTransParseRules'
            TabOrder = 0
            object Label21: TLabel
              Left = 16
              Top = 24
              Width = 593
              Height = 74
              AutoSize = False
              Caption = 'TagNoTransNotice'
              WordWrap = True
            end
            object Memo7: TMemo
              Left = 16
              Top = 88
              Width = 601
              Height = 240
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
              ScrollBars = ssVertical
              TabOrder = 0
            end
            object Button16: TButton
              Left = 542
              Top = 334
              Width = 75
              Height = 20
              Caption = 'but_reset'
              TabOrder = 1
              OnClick = Button16Click
            end
            object Memo8: TMemo
              Left = 16
              Top = 360
              Width = 601
              Height = 144
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
              ScrollBars = ssVertical
              TabOrder = 2
            end
            object Button17: TButton
              Left = 542
              Top = 510
              Width = 75
              Height = 20
              Caption = 'but_reset'
              TabOrder = 3
              OnClick = Button17Click
            end
          end
        end
        object TabSheet9: TTabSheet
          Caption = 'ScriptsAndVmad'
          ImageIndex = 2
          object GroupBox9: TGroupBox
            Left = 19
            Top = 16
            Width = 590
            Height = 374
            Caption = 'lbl_Vmad'
            TabOrder = 0
            object Label18: TLabel
              Left = 16
              Top = 45
              Width = 87
              Height = 13
              Caption = 'lbl_ScriptTemplate'
            end
            object CheckBox6: TCheckBox
              Left = 16
              Top = 24
              Width = 553
              Height = 17
              Caption = 'ChkAnalyzeVMAD'
              TabOrder = 0
            end
            object Memo6: TMemo
              Left = 16
              Top = 64
              Width = 561
              Height = 241
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
              ScrollBars = ssVertical
              TabOrder = 1
            end
            object Button12: TButton
              Left = 498
              Top = 311
              Width = 75
              Height = 20
              Caption = 'but_reset'
              TabOrder = 2
              OnClick = Button12Click
            end
            object CheckBoxLockGlobal: TCheckBox
              Left = 16
              Top = 344
              Width = 561
              Height = 17
              Caption = 'chk_UnlockGlobalVar'
              TabOrder = 3
            end
          end
          object GroupBox10: TGroupBox
            Left = 19
            Top = 419
            Width = 590
            Height = 129
            Caption = 'grpExternalDecompiler'
            TabOrder = 1
            object Label19: TLabel
              Left = 16
              Top = 77
              Width = 561
              Height = 36
              AutoSize = False
              Caption = 'lblExternaldecompiler'
              WordWrap = True
            end
            object Edit10: TEdit
              Left = 16
              Top = 50
              Width = 561
              Height = 21
              TabOrder = 0
              OnClick = Edit10Click
            end
            object CheckBox13: TCheckBox
              Left = 16
              Top = 24
              Width = 561
              Height = 20
              Caption = 'chkOptExternalDecompiler'
              TabOrder = 1
            end
          end
          object CheckBox14: TCheckBox
            Left = 35
            Top = 396
            Width = 574
            Height = 17
            Caption = 'chk_pexUseCustomCodepage'
            TabOrder = 2
          end
        end
      end
    end
    object TabSheet6: TTabSheet
      Caption = 'TranslatorAPIs'
      ImageIndex = 3
      object Label14: TLabel
        Left = 3
        Top = 3
        Width = 651
        Height = 14
        AutoSize = False
        Caption = 'lbl_ApiKey'
        WordWrap = True
      end
      object Label15: TLabel
        Left = 3
        Top = 312
        Width = 255
        Height = 26
        AutoSize = False
        Caption = 'lbl_ApiStats'
        WordWrap = True
      end
      object ValueListEditor1: TValueListEditor
        Left = 3
        Top = 23
        Width = 651
        Height = 283
        Strings.Strings = (
          '=')
        TabOrder = 0
        TitleCaptions.Strings = (
          'KeyNames'
          'Values')
        OnSelectCell = ValueListEditor1SelectCell
        ColWidths = (
          156
          489)
        RowHeights = (
          18
          18)
      end
      object ValueListEditor2: TValueListEditor
        Left = 3
        Top = 360
        Width = 255
        Height = 217
        Strings.Strings = (
          '=')
        TabOrder = 1
        TitleCaptions.Strings = (
          'StatistiquesId'
          'Values')
        OnGetPickList = ValueListEditor2GetPickList
        ColWidths = (
          149
          100)
        RowHeights = (
          18
          18)
      end
      object Panel5: TPanel
        Left = 264
        Top = 312
        Width = 390
        Height = 265
        BevelOuter = bvLowered
        Caption = 'Panel3'
        TabOrder = 2
        object HtmlViewer1: THtmlViewer
          Left = 1
          Top = 1
          Width = 388
          Height = 263
          BorderStyle = htNone
          DefBackground = clWhite
          DefFontColor = clBlack
          DefFontName = 'Arial'
          DefFontSize = 8
          DefHotSpotColor = clMaroon
          DefOverLinkColor = clMaroon
          DefPreFontName = 'Arial'
          DefVisitedLinkColor = clMaroon
          HistoryMaxCount = 0
          NoSelect = False
          PrintMarginBottom = 2.000000000000000000
          PrintMarginLeft = 2.000000000000000000
          PrintMarginRight = 2.000000000000000000
          PrintMarginTop = 2.000000000000000000
          PrintScale = 1.000000000000000000
          QuirksMode = qmDetect
          Text = ''
          OnHotSpotClick = HtmlViewer1HotSpotClick
          Align = alClient
          TabOrder = 0
          Touch.InteractiveGestures = [igPan]
          Touch.InteractiveGestureOptions = [igoPanSingleFingerHorizontal, igoPanSingleFingerVertical, igoPanInertia]
          ExplicitHeight = 295
        end
      end
    end
  end
  object CheckCacheTimer: TTimer
    Enabled = False
    Interval = 250
    OnTimer = CheckCacheTimerTimer
    Left = 400
    Top = 360
  end
  object PopupData: TPopupMenu
    Images = Form1.ImageList1
    Left = 532
    Top = 379
    object pathType1: TMenuItem
      Caption = 'Steam'
      ImageIndex = 64
      OnClick = pathType1Click
    end
    object pathType2: TMenuItem
      Caption = 'BethesdaNet'
      ImageIndex = 64
      OnClick = pathType2Click
    end
    object pathType3: TMenuItem
      Caption = 'PTS (Steam)'
      ImageIndex = 64
      OnClick = pathType3Click
    end
  end
end
