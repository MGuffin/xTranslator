object Form12: TForm12
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'menu_applySST'
  ClientHeight = 359
  ClientWidth = 355
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
  object RadioGroup1: TRadioGroup
    Left = 8
    Top = 2
    Width = 337
    Height = 129
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
    Left = 143
    Top = 327
    Width = 99
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object Button2: TButton
    Left = 248
    Top = 327
    Width = 99
    Height = 25
    Caption = 'Ok'
    Default = True
    ModalResult = 1
    TabOrder = 2
  end
  object RadioGroup2: TRadioGroup
    Left = 10
    Top = 137
    Width = 337
    Height = 112
    Caption = 'apply_Mode'
    Items.Strings = (
      'Apply_FORMIDOnly'
      'Apply_FORMIDStringControlStrict'
      'Apply_FORMIDStringControl'
      'Apply_StringOnly')
    TabOrder = 3
  end
  object CheckBox1: TCheckBox
    Left = 24
    Top = 278
    Width = 313
    Height = 17
    Caption = 'Reset_StringState'
    TabOrder = 4
  end
  object CheckBox2: TCheckBox
    Left = 24
    Top = 255
    Width = 305
    Height = 17
    Caption = 'overwrite_RestrictToFilter'
    TabOrder = 5
  end
  object CheckBox3: TCheckBox
    Left = 24
    Top = 301
    Width = 313
    Height = 17
    Caption = 'Apply_Tag_Only'
    TabOrder = 6
  end
end
