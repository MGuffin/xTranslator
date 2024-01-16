object Form6: TForm6
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'EspCompareOpts'
  ClientHeight = 193
  ClientWidth = 373
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
  object Label1: TLabel
    Left = 16
    Top = 166
    Width = 95
    Height = 19
    AutoSize = False
    Caption = 'ForceCp'
  end
  object RadioGroup1: TRadioGroup
    Left = 8
    Top = 10
    Width = 357
    Height = 127
    Caption = 'OverWrite'
    ItemIndex = 1
    Items.Strings = (
      'overwrite_All'
      'overwrite_NoTransExlusive'
      'overwrite_NoTransAndPartial'
      'overwrite_PartialOnly'
      'overwrite_Selection')
    TabOrder = 0
  end
  object Button1: TButton
    Left = 197
    Top = 160
    Width = 82
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object Button2: TButton
    Left = 285
    Top = 160
    Width = 80
    Height = 25
    Caption = 'Ok'
    Default = True
    ModalResult = 1
    TabOrder = 2
  end
  object CheckBox1: TCheckBox
    Left = 16
    Top = 143
    Width = 321
    Height = 17
    Caption = 'overwrite_RestrictToFilter'
    TabOrder = 3
  end
  object ComboBox1: TComboBox
    Left = 117
    Top = 164
    Width = 74
    Height = 21
    Style = csDropDownList
    TabOrder = 4
  end
end
