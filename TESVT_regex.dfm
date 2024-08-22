object Form13: TForm13
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = 'FormRegex'
  ClientHeight = 636
  ClientWidth = 1006
  Color = clBtnFace
  Constraints.MinHeight = 650
  Constraints.MinWidth = 1000
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poDesigned
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 13
  object ListBox1: TListBox
    Left = 779
    Top = 0
    Width = 227
    Height = 595
    Style = lbOwnerDrawFixed
    Align = alRight
    DragMode = dmAutomatic
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ItemHeight = 18
    ParentFont = False
    PopupMenu = PopupMenu1
    TabOrder = 0
    OnDblClick = ListBox1DblClick
    OnDragDrop = ListBox1DragDrop
    OnDragOver = ListBox1DragOver
    OnDrawItem = ListBox1DrawItem
    OnMouseDown = ListBox1MouseDown
    ExplicitLeft = 775
    ExplicitHeight = 594
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 779
    Height = 595
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 4
    TabOrder = 1
    ExplicitWidth = 775
    ExplicitHeight = 594
    object Memo1: TMemo
      Left = 4
      Top = 4
      Width = 771
      Height = 101
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
      ExplicitWidth = 767
    end
    object Memo3: TMemo
      Left = 4
      Top = 252
      Width = 771
      Height = 96
      Align = alBottom
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 1
      ExplicitTop = 251
      ExplicitWidth = 767
    end
    object Panel3: TPanel
      Left = 4
      Top = 424
      Width = 771
      Height = 167
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      ExplicitTop = 423
      ExplicitWidth = 767
      object RadioGroup1: TRadioGroup
        Left = 8
        Top = 15
        Width = 374
        Height = 143
        Caption = 'Strings:'
        ItemIndex = 1
        Items.Strings = (
          'overwrite_All'
          'overwrite_NoTransExlusive'
          'overwrite_NoTransAndPartial'
          'overwrite_PartialOnly'
          'overwrite_Selection')
        TabOrder = 0
      end
      object RadioGroup2: TRadioGroup
        Left = 400
        Top = 14
        Width = 307
        Height = 88
        Caption = 'RegexMode'
        ItemIndex = 0
        Items.Strings = (
          'Chk_Search1'
          'Chk_Search2'
          'searchinSource')
        TabOrder = 1
        OnClick = RadioGroup2Click
      end
      object GroupBox1: TGroupBox
        Left = 400
        Top = 108
        Width = 307
        Height = 49
        Caption = 'HeuristicThreshold'
        TabOrder = 2
        object Edit1: TEdit
          Left = 11
          Top = 20
          Width = 33
          Height = 21
          ReadOnly = True
          TabOrder = 0
          Text = '1'
        end
        object UpDown1: TUpDown
          Left = 44
          Top = 20
          Width = 16
          Height = 21
          Associate = Edit1
          Max = 5
          Position = 1
          TabOrder = 1
        end
      end
    end
    object Panel4: TPanel
      Left = 4
      Top = 348
      Width = 771
      Height = 76
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 3
      ExplicitTop = 347
      ExplicitWidth = 767
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 88
        Height = 76
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object Label1: TLabel
          Left = 28
          Top = 17
          Width = 50
          Height = 13
          Caption = 'Lbl_Regex'
        end
        object Label2: TLabel
          Left = 28
          Top = 49
          Width = 57
          Height = 13
          Caption = 'Lbl_Replace'
        end
      end
      object Panel6: TPanel
        Left = 88
        Top = 0
        Width = 683
        Height = 76
        Align = alClient
        BevelOuter = bvNone
        BorderWidth = 5
        TabOrder = 1
        ExplicitWidth = 679
        DesignSize = (
          683
          76)
        object ComboBox1: TComboBox
          Left = 6
          Top = 16
          Width = 669
          Height = 22
          Hint = 'Hint_RegExParse'
          AutoComplete = False
          Anchors = [akLeft, akTop, akRight, akBottom]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnChange = ComboBox1Change
          ExplicitWidth = 665
        end
        object ComboBox2: TComboBox
          Left = 6
          Top = 44
          Width = 669
          Height = 22
          Hint = 'Hint_RegExReplace3'
          AutoComplete = False
          Anchors = [akLeft, akTop, akRight, akBottom]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnChange = ComboBox1Change
          ExplicitWidth = 665
        end
      end
    end
    object Panel7: TPanel
      Left = 4
      Top = 105
      Width = 771
      Height = 147
      Align = alClient
      BevelOuter = bvNone
      BorderWidth = 4
      Caption = 'Panel7'
      TabOrder = 4
      ExplicitWidth = 767
      ExplicitHeight = 146
      object ListBox2: TListBox
        Left = 4
        Top = 4
        Width = 763
        Height = 139
        Style = lbOwnerDrawFixed
        Align = alClient
        DragMode = dmAutomatic
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ItemHeight = 18
        ParentFont = False
        TabOrder = 0
        OnDrawItem = ListBox2DrawItem
        ExplicitWidth = 759
        ExplicitHeight = 138
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 595
    Width = 1006
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitTop = 594
    ExplicitWidth = 1002
    DesignSize = (
      1006
      41)
    object CheckBox4: TCheckBox
      Left = 8
      Top = 6
      Width = 273
      Height = 17
      Caption = 'overwrite_RestrictToFilter'
      TabOrder = 0
    end
    object CheckBox1: TCheckBox
      Left = 315
      Top = 6
      Width = 94
      Height = 17
      Caption = 'ExcludeAlias'
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
    object CheckBox2: TCheckBox
      Left = 415
      Top = 6
      Width = 108
      Height = 17
      Caption = 'Case_sensitive'
      TabOrder = 2
      OnClick = RadioGroup2Click
    end
    object CheckBox3: TCheckBox
      Left = 544
      Top = 6
      Width = 193
      Height = 17
      Caption = 'Invalidate_fail'
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
    object Button2: TButton
      Left = 802
      Top = 6
      Width = 91
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 4
      ExplicitLeft = 798
    end
    object Button1: TButton
      Left = 899
      Top = 6
      Width = 91
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Ok'
      Default = True
      ModalResult = 1
      TabOrder = 5
      ExplicitLeft = 895
    end
  end
  object PopupMenu1: TPopupMenu
    Images = Form1.ImageList1
    OnPopup = PopupMenu1Popup
    Left = 872
    Top = 192
    object MenuPresetSave1: TMenuItem
      Caption = 'Menu_regExPresetSave'
      ImageIndex = 22
      OnClick = MenuPresetSave1Click
    end
    object MenuPresetRename1: TMenuItem
      Caption = 'Menu_regExPresetRename'
      ImageIndex = 50
      OnClick = MenuPresetRename1Click
    end
    object MenuPresetDelete1: TMenuItem
      Caption = 'Menu_regExPresetDelete'
      ImageIndex = 12
      OnClick = MenuPresetDelete1Click
    end
  end
end
