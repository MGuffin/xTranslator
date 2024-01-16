object Form9: TForm9
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'OldDialogStyle'
  ClientHeight = 489
  ClientWidth = 458
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 458
    Height = 169
    Align = alTop
    BevelOuter = bvNone
    BorderWidth = 5
    TabOrder = 0
    object Label1: TLabel
      Left = 5
      Top = 5
      Width = 448
      Height = 159
      Align = alClient
      AutoSize = False
      Caption = 'OldDial_Info'
      WordWrap = True
      ExplicitHeight = 204
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 169
    Width = 458
    Height = 279
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 1
    object TabSheet2: TTabSheet
      Caption = 'OldDial_Prefix'
      ImageIndex = 1
      object Label2: TLabel
        Left = 214
        Top = 12
        Width = 233
        Height = 114
        AutoSize = False
        Caption = 'OldDial_PrefixInfo'
        WordWrap = True
      end
      object CheckBox3: TCheckBox
        Left = 214
        Top = 132
        Width = 185
        Height = 17
        Caption = 'OldDial_AddPrefix'
        TabOrder = 0
      end
      object Memo1: TMemo
        Left = 3
        Top = 10
        Width = 205
        Height = 168
        Lines.Strings = (
          'Sarcastic'
          'Barter'
          'Flirt'
          'Romance'
          'Relationship')
        ScrollBars = ssBoth
        TabOrder = 1
        WordWrap = False
      end
      object Edit2: TEdit
        Left = 214
        Top = 155
        Width = 233
        Height = 21
        TabOrder = 2
        Text = '[%PREFIXE%] %DIAL%'
      end
      object CheckBox1: TCheckBox
        Left = 3
        Top = 184
        Width = 444
        Height = 17
        BiDiMode = bdLeftToRight
        Caption = 'OldDial_bAll'
        ParentBiDiMode = False
        TabOrder = 3
        OnClick = CheckBox1Click
      end
      object CheckBox4: TCheckBox
        Left = 17
        Top = 207
        Width = 423
        Height = 17
        Caption = 'OldDial_AddOriginal'
        Enabled = False
        TabOrder = 4
      end
      object CheckBox5: TCheckBox
        Left = 3
        Top = 232
        Width = 430
        Height = 17
        Caption = 'OldDial_AllPrefixe'
        TabOrder = 5
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Options'
      object RadioGroup1: TRadioGroup
        Left = 3
        Top = 95
        Width = 444
        Height = 81
        Caption = 'OldDial_Apply'
        ItemIndex = 0
        Items.Strings = (
          'Overwrite_AllRelevant'
          'overwrite_PartialOnly'
          'overwrite_Selection')
        TabOrder = 0
      end
      object RadioGroup2: TRadioGroup
        Left = 3
        Top = 3
        Width = 444
        Height = 86
        Caption = 'OldDial_StringOp'
        ItemIndex = 0
        Items.Strings = (
          'OldDial_Keep'
          'OldDial_Skip'
          'OldDial_Cut')
        TabOrder = 1
      end
      object Edit1: TEdit
        Left = 347
        Top = 20
        Width = 73
        Height = 21
        ReadOnly = True
        TabOrder = 2
        Text = '115'
      end
      object UpDown1: TUpDown
        Left = 420
        Top = 20
        Width = 15
        Height = 21
        Associate = Edit1
        Min = 75
        Max = 150
        Position = 115
        TabOrder = 3
        OnClick = UpDown1Click
      end
      object CheckBox2: TCheckBox
        Left = 11
        Top = 190
        Width = 444
        Height = 17
        Caption = 'OldDial_KeepChanges'
        TabOrder = 4
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 448
    Width = 458
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object Button1: TButton
      Left = 360
      Top = 6
      Width = 91
      Height = 25
      Caption = 'Ok'
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 263
      Top = 6
      Width = 91
      Height = 25
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
    end
  end
end
