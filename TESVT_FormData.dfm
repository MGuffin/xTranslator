object FormKeyWord: TFormKeyWord
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'hProcessorForm'
  ClientHeight = 730
  ClientWidth = 1290
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 689
    Width = 1290
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      1290
      41)
    object Button1: TButton
      Left = 1163
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Close'
      Default = True
      ModalResult = 11
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button10: TButton
      Left = 549
      Top = 6
      Width = 161
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'butRunProcessor'
      Enabled = False
      ImageIndex = 74
      Images = Form1.ImageList1
      TabOrder = 1
      OnClick = Button10Click
    end
    object Button11: TButton
      Left = 10
      Top = 6
      Width = 151
      Height = 25
      Caption = 'Menu_ChangeFont'
      ImageIndex = 44
      Images = Form1.ImageList1
      TabOrder = 2
      OnClick = Button11Click
    end
    object ComboBox1: TComboBox
      Left = 716
      Top = 8
      Width = 441
      Height = 21
      Style = csDropDownList
      Anchors = [akRight, akBottom]
      DropDownCount = 15
      ItemIndex = 0
      TabOrder = 3
      Text = 'defaultTemplate'
      Items.Strings = (
        'defaultTemplate')
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 1290
    Height = 689
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 10
    TabOrder = 1
    object Panel3: TPanel
      Left = 10
      Top = 10
      Width = 1270
      Height = 669
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object Panel4: TPanel
        Left = 0
        Top = 311
        Width = 1270
        Height = 358
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 0
        object Panel8: TPanel
          Left = 268
          Top = 0
          Width = 1002
          Height = 358
          Align = alRight
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 0
          object Label1: TLabel
            Left = 16
            Top = 61
            Width = 257
            Height = 13
            AutoSize = False
            Caption = 'lbl_Include'
          end
          object Label2: TLabel
            Left = 416
            Top = 61
            Width = 253
            Height = 13
            AutoSize = False
            Caption = 'lbl_Exclude'
          end
          object Label4: TLabel
            Left = 239
            Top = 286
            Width = 104
            Height = 13
            Caption = 'lbl_IncludeEdidSearch'
          end
          object Label5: TLabel
            Left = 239
            Top = 312
            Width = 106
            Height = 13
            Caption = 'lbl_ExcludeEdidSearch'
          end
          object ListBoxKw_Y: TListBox
            Left = 16
            Top = 80
            Width = 394
            Height = 161
            Style = lbOwnerDrawFixed
            DragMode = dmAutomatic
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            MultiSelect = True
            ParentFont = False
            TabOrder = 0
            OnClick = ListBoxKw_YClick
            OnDragDrop = ListBoxKw_YDragDrop
            OnDragOver = ListBoxKw_NDragOver
            OnDrawItem = ListBox1DrawItem
          end
          object ListBoxKw_N: TListBox
            Left = 416
            Top = 80
            Width = 385
            Height = 161
            Style = lbOwnerDrawFixed
            DragMode = dmAutomatic
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            MultiSelect = True
            ParentFont = False
            TabOrder = 1
            OnClick = ListBoxKw_NClick
            OnDragDrop = ListBoxKw_YDragDrop
            OnDragOver = ListBoxKw_NDragOver
            OnDrawItem = ListBox1DrawItem
          end
          object Button4: TButton
            Left = 329
            Top = 247
            Width = 74
            Height = 20
            Caption = 'butDelete'
            ImageIndex = 12
            Images = Form1.ImageList1
            TabOrder = 2
            OnClick = Button4Click
          end
          object Button5: TButton
            Left = 416
            Top = 247
            Width = 75
            Height = 20
            Caption = 'butDelete'
            ImageIndex = 12
            Images = Form1.ImageList1
            TabOrder = 3
            OnClick = Button5Click
          end
          object CheckBox3: TCheckBox
            Left = 27
            Top = 326
            Width = 206
            Height = 17
            Caption = 'chk_hasComponent'
            TabOrder = 4
            OnClick = CheckBox6Click
          end
          object Edit3: TButtonedEdit
            Left = 351
            Top = 309
            Width = 354
            Height = 22
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            Images = Form1.ImageList1
            ParentFont = False
            RightButton.ImageIndex = 12
            RightButton.Visible = True
            TabOrder = 5
            OnRightButtonClick = Edit3RightButtonClick
          end
          object Edit2: TButtonedEdit
            Left = 351
            Top = 281
            Width = 354
            Height = 22
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            Images = Form1.ImageList1
            ParentFont = False
            RightButton.ImageIndex = 12
            RightButton.Visible = True
            TabOrder = 6
            OnRightButtonClick = Edit2RightButtonClick
          end
          object CheckBox1: TCheckBox
            Left = 27
            Top = 280
            Width = 206
            Height = 17
            Caption = 'chk_NoKeyWord'
            TabOrder = 7
            OnClick = CheckBox6Click
          end
          object CheckBox2: TCheckBox
            Left = 27
            Top = 305
            Width = 206
            Height = 17
            Caption = 'chk_AnyKeyWord'
            TabOrder = 8
            OnClick = CheckBox6Click
          end
          object Panel12: TPanel
            Left = 807
            Top = 231
            Width = 178
            Height = 116
            BevelInner = bvRaised
            BevelOuter = bvLowered
            TabOrder = 9
            object Button3: TButton
              Left = 8
              Top = 69
              Width = 161
              Height = 38
              Caption = 'butCreateRule'
              ImageIndex = 79
              Images = Form1.ImageList1
              TabOrder = 0
              OnClick = Button3Click
            end
            object Button7: TButton
              Left = 16
              Top = 38
              Width = 145
              Height = 25
              Caption = 'butCopyRule'
              ImageIndex = 25
              Images = Form1.ImageList1
              TabOrder = 1
              OnClick = Button7Click
            end
            object Button2: TButton
              Left = 16
              Top = 7
              Width = 145
              Height = 25
              Caption = 'butClearRule'
              ImageIndex = 12
              Images = Form1.ImageList1
              TabOrder = 2
              OnClick = Button2Click
            end
          end
          object Panel15: TPanel
            Left = 807
            Top = 176
            Width = 178
            Height = 49
            BevelInner = bvRaised
            BevelOuter = bvLowered
            TabOrder = 10
            object CheckBox6: TCheckBox
              Left = 16
              Top = 4
              Width = 105
              Height = 17
              Caption = 'PreProcessing'
              TabOrder = 0
              OnClick = CheckBox6Click
            end
            object Button13: TButton
              Left = 16
              Top = 23
              Width = 145
              Height = 20
              Caption = 'Options'
              TabOrder = 1
              OnClick = Button13Click
            end
          end
          object CheckBox8: TCheckBox
            Left = 16
            Top = 247
            Width = 112
            Height = 17
            Caption = '[InclusiveOR]'
            TabOrder = 11
            OnClick = CheckBox6Click
          end
          object EditRname: TEdit
            Left = 807
            Top = 10
            Width = 66
            Height = 21
            Color = clBtnFace
            TabOrder = 12
          end
          object GroupBox1: TGroupBox
            Left = 4
            Top = 6
            Width = 797
            Height = 49
            Caption = 'lbl_Header'
            TabOrder = 13
            object Edit1: TEdit
              Left = 12
              Top = 15
              Width = 702
              Height = 26
              DoubleBuffered = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Courier New'
              Font.Style = []
              ParentDoubleBuffered = False
              ParentFont = False
              TabOrder = 0
              Text = '[Header]'
              OnChange = Edit1Change
            end
            object CheckBox7: TCheckBox
              Left = 720
              Top = 17
              Width = 65
              Height = 21
              Caption = 'Replace'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnClick = CheckBox6Click
            end
          end
          object GroupBox2: TGroupBox
            Left = 807
            Top = 33
            Width = 178
            Height = 44
            Caption = '#tagID'
            TabOrder = 14
            object ComboBox2: TComboBox
              Left = 16
              Top = 20
              Width = 145
              Height = 21
              DropDownCount = 25
              TabOrder = 0
              Text = 'default'
              OnChange = ComboBox2Change
              OnExit = ComboBox2Exit
            end
          end
          object Button14: TButton
            Left = 711
            Top = 278
            Width = 38
            Height = 25
            Caption = 'Edid'
            TabOrder = 15
            OnClick = Button14Click
          end
          object Button15: TButton
            Left = 711
            Top = 309
            Width = 38
            Height = 25
            Caption = 'Edid'
            TabOrder = 16
            OnClick = Button15Click
          end
          object EditFname: TEdit
            Left = 879
            Top = 10
            Width = 66
            Height = 21
            Color = clBtnFace
            TabOrder = 17
          end
          object Button16: TButton
            Left = 959
            Top = 10
            Width = 26
            Height = 18
            Caption = '*'
            TabOrder = 18
            OnClick = Button16Click
          end
          object Panel9: TPanel
            Left = 807
            Top = 83
            Width = 178
            Height = 31
            BevelInner = bvRaised
            BevelOuter = bvLowered
            TabOrder = 19
            object CheckBox9: TCheckBox
              Left = 12
              Top = 7
              Width = 99
              Height = 17
              Caption = 'FallBack'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnClick = CheckBox6Click
            end
            object CombofbBank: TComboBox
              Left = 133
              Top = 5
              Width = 36
              Height = 21
              Style = csDropDownList
              DropDownCount = 20
              TabOrder = 1
              OnChange = CombofbBankChange
              Items.Strings = (
                '0'
                '1'
                '2'
                '3'
                '4'
                '5'
                '6'
                '7'
                '8'
                '9'
                'A'
                'B'
                'C'
                'D'
                'E'
                'F')
            end
          end
          object GroupBox3: TGroupBox
            Left = 807
            Top = 120
            Width = 178
            Height = 49
            Caption = 'Regex'
            TabOrder = 20
            object Edit4: TEdit
              Left = 5
              Top = 17
              Width = 164
              Height = 21
              TabOrder = 0
              OnChange = Edit1Change
            end
          end
        end
        object Panel11: TPanel
          Left = 0
          Top = 0
          Width = 266
          Height = 358
          Align = alLeft
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 1
          object RadioGroup1: TRadioGroup
            Left = 8
            Top = 135
            Width = 249
            Height = 88
            Caption = 'OldDial_Apply'
            ItemIndex = 0
            Items.Strings = (
              'Overwrite_AllRelevant'
              'overwrite_PartialOnly'
              'overwrite_Selection')
            TabOrder = 0
          end
          object RadioGroup2: TRadioGroup
            Left = 8
            Top = 55
            Width = 249
            Height = 66
            Caption = 'String_ref'
            ItemIndex = 0
            Items.Strings = (
              'Source'
              'Destination')
            TabOrder = 1
          end
          object CheckBox5: TCheckBox
            Left = 16
            Top = 229
            Width = 210
            Height = 44
            Caption = 'overwrite_RestrictToFilter'
            TabOrder = 2
            WordWrap = True
          end
          object CheckBox4: TCheckBox
            Left = 16
            Top = 24
            Width = 210
            Height = 17
            Caption = 'chk_rulesSelectedOnly'
            TabOrder = 3
          end
        end
      end
      object Panel7: TPanel
        Left = 0
        Top = 0
        Width = 1270
        Height = 279
        Align = alClient
        BevelOuter = bvNone
        Caption = 'Panel7'
        TabOrder = 1
        object Splitter1: TSplitter
          Left = 265
          Top = 0
          Width = 6
          Height = 279
          AutoSnap = False
          MinSize = 265
          ResizeStyle = rsUpdate
          ExplicitHeight = 254
        end
        object Panel6: TPanel
          Left = 0
          Top = 0
          Width = 265
          Height = 279
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
          object ListBox1: TListBox
            Left = 0
            Top = 0
            Width = 265
            Height = 279
            Style = lbOwnerDrawFixed
            Align = alClient
            DragMode = dmAutomatic
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            MultiSelect = True
            ParentFont = False
            TabOrder = 0
            OnClick = ListBox1Click
            OnDrawItem = ListBox1DrawItem
          end
        end
        object Panel13: TPanel
          Left = 271
          Top = 0
          Width = 999
          Height = 279
          Align = alClient
          BevelOuter = bvNone
          Caption = 'Panel13'
          TabOrder = 1
          object headerTree: TVirtualStringTree
            Left = 0
            Top = 32
            Width = 999
            Height = 247
            Align = alClient
            ButtonStyle = bsTriangle
            Color = clBtnFace
            Colors.SelectionTextColor = clWindowText
            Ctl3D = True
            DefaultNodeHeight = 17
            DragOperations = [doMove]
            DragType = dtVCL
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Header.AutoSizeIndex = -1
            Header.Height = 17
            Header.MinHeight = 5
            Header.Options = [hoAutoResize, hoColumnResize, hoOwnerDraw, hoShowImages, hoVisible]
            Header.SortColumn = 0
            HintMode = hmTooltip
            Images = Form1.ImageList1
            ParentCtl3D = False
            ParentFont = False
            ParentShowHint = False
            PopupMenu = PopupMenu1
            SelectionBlendFactor = 40
            ShowHint = False
            TabOrder = 0
            TreeOptions.AutoOptions = [toAutoDropExpand, toAutoScrollOnExpand, toAutoTristateTracking, toAutoDeleteMovedNodes, toAutoChangeScale]
            TreeOptions.MiscOptions = [toAcceptOLEDrop, toCheckSupport, toFullRepaintOnResize, toInitOnSave, toToggleOnDblClick, toWheelPanning]
            TreeOptions.PaintOptions = [toHideFocusRect, toShowButtons, toShowDropmark, toThemeAware, toUseBlendedImages, toUseBlendedSelection]
            TreeOptions.SelectionOptions = [toExtendedFocus, toFullRowSelect, toMultiSelect]
            OnAdvancedHeaderDraw = headerTreeAdvancedHeaderDraw
            OnBeforeCellPaint = headerTreeBeforeCellPaint
            OnChecked = headerTreeChecked
            OnDblClick = headerTreeDblClick
            OnDragAllowed = headerTreeDragAllowed
            OnDragOver = headerTreeDragOver
            OnDragDrop = headerTreeDragDrop
            OnFreeNode = headerTreeFreeNode
            OnGetText = headerTreeGetText
            OnPaintText = headerTreePaintText
            OnGetImageIndex = headerTreeGetImageIndex
            OnHeaderDrawQueryElements = headerTreeHeaderDrawQueryElements
            OnInitNode = headerTreeInitNode
            Touch.InteractiveGestures = [igPan, igPressAndTap]
            Touch.InteractiveGestureOptions = [igoPanSingleFingerHorizontal, igoPanSingleFingerVertical, igoPanInertia, igoPanGutter, igoParentPassthrough]
            Columns = <
              item
                Options = [coAllowClick, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible, coAutoSpring, coSmartResize, coAllowFocus]
                Position = 0
                Width = 80
              end
              item
                Options = [coAllowClick, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible, coAutoSpring, coSmartResize, coAllowFocus]
                Position = 1
                Width = 915
              end>
          end
          object Panel14: TPanel
            Left = 0
            Top = 0
            Width = 999
            Height = 32
            Align = alTop
            BevelOuter = bvNone
            ParentColor = True
            TabOrder = 1
            object Label6: TLabel
              Left = 8
              Top = 4
              Width = 7
              Height = 14
              Caption = 'H'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
            end
            object Label7: TLabel
              Left = 136
              Top = 4
              Width = 21
              Height = 14
              Caption = 'Ref'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
            end
            object Label8: TLabel
              Left = 456
              Top = 4
              Width = 77
              Height = 14
              Alignment = taRightJustify
              Caption = 'lbl_Include'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
            end
            object Label9: TLabel
              Left = 724
              Top = 3
              Width = 77
              Height = 14
              Alignment = taRightJustify
              Caption = 'lbl_Exclude'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
            end
            object ButtonedEdit2: TButtonedEdit
              Tag = 1
              Left = 22
              Top = 0
              Width = 107
              Height = 21
              DoubleBuffered = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              Images = Form1.ImageList1
              LeftButton.ImageIndex = 13
              LeftButton.Visible = True
              ParentDoubleBuffered = False
              ParentFont = False
              RightButton.ImageIndex = 12
              RightButton.Visible = True
              TabOrder = 0
              OnChange = ButtonedEdit1Change
              OnLeftButtonClick = ButtonedEdit1LeftButtonClick
              OnRightButtonClick = ButtonedEdit1RightButtonClick
            end
            object ButtonedEdit3: TButtonedEdit
              Tag = 3
              Left = 539
              Top = 0
              Width = 179
              Height = 21
              DoubleBuffered = True
              Images = Form1.ImageList1
              LeftButton.ImageIndex = 13
              LeftButton.Visible = True
              ParentDoubleBuffered = False
              RightButton.ImageIndex = 12
              RightButton.Visible = True
              TabOrder = 1
              OnChange = ButtonedEdit1Change
              OnLeftButtonClick = ButtonedEdit1LeftButtonClick
              OnRightButtonClick = ButtonedEdit1RightButtonClick
            end
            object ButtonedEdit4: TButtonedEdit
              Tag = 4
              Left = 807
              Top = 0
              Width = 182
              Height = 21
              DoubleBuffered = True
              Images = Form1.ImageList1
              LeftButton.ImageIndex = 13
              LeftButton.Visible = True
              ParentDoubleBuffered = False
              RightButton.ImageIndex = 12
              RightButton.Visible = True
              TabOrder = 2
              OnChange = ButtonedEdit1Change
              OnLeftButtonClick = ButtonedEdit1LeftButtonClick
              OnRightButtonClick = ButtonedEdit1RightButtonClick
            end
            object ComboBox3: TComboBox
              Left = 251
              Top = 0
              Width = 199
              Height = 21
              DropDownCount = 45
              TabOrder = 3
              StyleElements = []
              OnChange = ButtonedEdit1Change
            end
            object ComboBox4: TComboBox
              Left = 163
              Top = 0
              Width = 82
              Height = 21
              DropDownCount = 30
              TabOrder = 4
              StyleElements = []
              OnChange = ButtonedEdit1Change
            end
          end
        end
      end
      object Panel5: TPanel
        Left = 0
        Top = 279
        Width = 1270
        Height = 32
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        object Button6: TButton
          Left = 1166
          Top = 6
          Width = 96
          Height = 20
          Caption = 'butDelete'
          ImageIndex = 12
          Images = Form1.ImageList1
          TabOrder = 0
          OnClick = Button6Click
        end
        object Button8: TButton
          Left = 1138
          Top = 1
          Width = 22
          Height = 25
          ImageAlignment = iaCenter
          ImageIndex = 53
          Images = Form1.ImageList1
          TabOrder = 1
          OnClick = Button8Click
        end
        object Button9: TButton
          Left = 1112
          Top = 1
          Width = 22
          Height = 25
          ImageAlignment = iaCenter
          ImageIndex = 82
          Images = Form1.ImageList1
          TabOrder = 2
          OnClick = Button9Click
        end
        object Button12: TButton
          Left = 955
          Top = 6
          Width = 143
          Height = 20
          Caption = 'but_EditHeaders'
          TabOrder = 3
          OnClick = Button12Click
        end
      end
    end
  end
  object Button17: TButton
    Left = 1033
    Top = 600
    Width = 34
    Height = 25
    Caption = 'Kwd'
    TabOrder = 2
    OnClick = Button17Click
  end
  object Button18: TButton
    Left = 1033
    Top = 631
    Width = 34
    Height = 25
    Caption = 'Kwd'
    TabOrder = 3
    OnClick = Button18Click
  end
  object MainMenu1: TMainMenu
    Images = Form1.ImageList1
    Left = 48
    Top = 80
    object File1: TMenuItem
      Caption = 'File'
      object LoadDefault1: TMenuItem
        Caption = 'Menu_rules_Load_Default'
        ImageIndex = 9
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object LoadCustom1: TMenuItem
        Caption = 'Menu_rules_Load_Custom'
        ImageIndex = 9
        OnClick = LoadCustom1Click
      end
      object rulesSaveCustom1: TMenuItem
        Caption = 'Menu_rules_Save_Custom'
        ImageIndex = 22
        OnClick = rulesSaveCustom1Click
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object MenuspecialSave1: TMenuItem
        Caption = 'Menu_specialSave'
        ImageIndex = 27
        object AppendCustom1: TMenuItem
          Caption = 'Menu_rules_Append_Custom'
          ImageIndex = 49
          OnClick = AppendCustom1Click
        end
        object MenurulesSaveCustomSelected1: TMenuItem
          Caption = 'Menu_rules_Save_Custom_Selected'
          ImageIndex = 50
          OnClick = MenurulesSaveCustomSelected1Click
        end
      end
      object rulesClearList1: TMenuItem
        Caption = 'Menu_rules_ClearList'
        ImageIndex = 1
        OnClick = rulesClearList1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Templates1: TMenuItem
        Caption = 'lbl_templates'
        ImageIndex = 61
        OnClick = Templates1Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object Close1: TMenuItem
        Caption = 'Close'
        ImageIndex = 12
        OnClick = Close1Click
      end
    end
    object Options1: TMenuItem
      Caption = 'Options'
      object LoadDefaultAtStart1: TMenuItem
        Caption = 'Menu_LoadDefaultAtStart'
        Checked = True
        GroupIndex = 5
        RadioItem = True
        OnClick = LoadDefaultAtStart1Click
      end
      object LoadLastCustomAtStart1: TMenuItem
        Tag = 1
        Caption = 'Menu_LoadLastCustomAtStart'
        GroupIndex = 5
        RadioItem = True
        OnClick = LoadDefaultAtStart1Click
      end
      object DoNotLoad1: TMenuItem
        Tag = 2
        Caption = 'Menu_DoNotLoad'
        GroupIndex = 5
        RadioItem = True
        OnClick = LoadDefaultAtStart1Click
      end
      object N7: TMenuItem
        Tag = -1
        Caption = '-'
        GroupIndex = 5
      end
      object AdvancedMode1: TMenuItem
        Tag = -1
        Caption = 'AdvancedMode'
        GroupIndex = 5
        OnClick = AdvancedMode1Click
      end
    end
  end
  object FontDialog1: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = []
    Left = 216
    Top = 576
  end
  object PopupMenu1: TPopupMenu
    Left = 337
    Top = 66
    object pasteTag: TMenuItem
      Caption = 'lbl_PasteTag'
      ShortCut = 49236
      OnClick = pasteTagClick
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object PasteSuffixes: TMenuItem
      Caption = 'lbl_PasteSuffixes'
      ShortCut = 49238
      OnClick = PasteSuffixesClick
    end
    object CutSuffixes: TMenuItem
      Caption = 'lbl_CutSuffixes'
      ShortCut = 49240
      OnClick = CutSuffixesClick
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object pasteFeedback1: TMenuItem
      Caption = 'lbl_PasteFallBack'
      ShortCut = 49222
      OnClick = pasteFeedback1Click
    end
  end
end
