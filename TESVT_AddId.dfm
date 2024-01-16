object Form8: TForm8
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'AddIdToStrings'
  ClientHeight = 281
  ClientWidth = 252
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
  object Button1: TButton
    Left = 153
    Top = 248
    Width = 91
    Height = 25
    Caption = 'Ok'
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object Button2: TButton
    Left = 8
    Top = 248
    Width = 91
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 95
    Width = 236
    Height = 130
    Caption = 'AddWhat'
    TabOrder = 2
    object CheckBox1: TCheckBox
      Left = 24
      Top = 24
      Width = 97
      Height = 17
      Caption = 'Add_StringID'
      Enabled = False
      TabOrder = 0
    end
    object CheckBox3: TCheckBox
      Left = 24
      Top = 47
      Width = 97
      Height = 17
      Caption = 'Add_EDID'
      Enabled = False
      TabOrder = 1
    end
    object CheckBox4: TCheckBox
      Left = 24
      Top = 70
      Width = 97
      Height = 17
      Caption = 'Add_RecordRef'
      Enabled = False
      TabOrder = 2
    end
    object CheckBox2: TCheckBox
      Left = 24
      Top = 93
      Width = 201
      Height = 17
      Caption = 'Add_DialRef'
      Enabled = False
      TabOrder = 3
    end
  end
  object RadioGroup1: TRadioGroup
    Left = 8
    Top = 8
    Width = 236
    Height = 81
    Caption = 'AddId'
    ItemIndex = 1
    Items.Strings = (
      'overwrite_All'
      'overwrite_NoTrans'
      'overwrite_Selection')
    TabOrder = 3
  end
end
