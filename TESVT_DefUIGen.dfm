object Form18: TForm18
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'DEFUIComponentGen'
  ClientHeight = 601
  ClientWidth = 473
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 451
    Height = 145
    AutoSize = False
    Caption = 'DefUIInfo'
    WordWrap = True
  end
  object Label2: TLabel
    Left = 8
    Top = 169
    Width = 62
    Height = 13
    Caption = 'DefUIOutput'
  end
  object Button1: TButton
    Left = 370
    Top = 567
    Width = 91
    Height = 25
    Caption = 'Ok'
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object Button2: TButton
    Left = 274
    Top = 567
    Width = 90
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object Button3: TButton
    Left = 372
    Top = 511
    Width = 89
    Height = 25
    Caption = 'but_reset'
    TabOrder = 2
    OnClick = Button3Click
  end
  object ComboBox1: TComboBox
    Left = 120
    Top = 166
    Width = 339
    Height = 21
    DropDownCount = 2
    TabOrder = 3
  end
  object RadioGroup1: TRadioGroup
    Left = 3
    Top = 511
    Width = 265
    Height = 81
    Caption = 'OldDial_Apply'
    ItemIndex = 0
    Items.Strings = (
      'Overwrite_AllRelevant'
      'overwrite_PartialOnly'
      'overwrite_Selection')
    TabOrder = 4
  end
  object ValueListEditor1: TValueListEditor
    Left = 8
    Top = 198
    Width = 453
    Height = 225
    DisplayOptions = [doAutoColResize, doKeyColFixed]
    TabOrder = 5
    ColWidths = (
      193
      254)
    RowHeights = (
      18)
  end
  object CheckBox3: TCheckBox
    Left = 16
    Top = 431
    Width = 176
    Height = 16
    Caption = 'chk_IgnoreKeyWord'
    Checked = True
    State = cbChecked
    TabOrder = 6
  end
  object Memo1: TMemo
    Left = 198
    Top = 429
    Width = 105
    Height = 76
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    Lines.Strings = (
      '')
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 7
    WordWrap = False
    OnChange = Memo1Change
  end
  object Memo2: TMemo
    Left = 309
    Top = 429
    Width = 151
    Height = 76
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 8
    WordWrap = False
  end
end
