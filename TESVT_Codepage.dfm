object Form14: TForm14
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'forceCp'
  ClientHeight = 93
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
  object ComboBox1: TComboBox
    Left = 8
    Top = 8
    Width = 161
    Height = 21
    Style = csDropDownList
    TabOrder = 0
  end
  object ComboBox2: TComboBox
    Left = 8
    Top = 35
    Width = 161
    Height = 21
    Style = csDropDownList
    TabOrder = 1
  end
  object CheckBox1: TCheckBox
    Left = 175
    Top = 10
    Width = 270
    Height = 17
    Caption = 'chk_ForceCpImport'
    TabOrder = 2
  end
  object CheckBox2: TCheckBox
    Left = 175
    Top = 37
    Width = 270
    Height = 17
    Caption = 'chk_ForceCpExport'
    TabOrder = 3
  end
  object Button1: TButton
    Left = 370
    Top = 60
    Width = 75
    Height = 25
    Caption = 'ok'
    Default = True
    TabOrder = 4
    OnClick = Button1Click
  end
  object CheckBox3: TCheckBox
    Left = 8
    Top = 65
    Width = 241
    Height = 17
    Caption = 'chk_saveCPsettings'
    TabOrder = 5
  end
end
