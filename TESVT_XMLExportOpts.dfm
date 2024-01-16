object FormXmlOpt: TFormXmlOpt
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'XML_Options'
  ClientHeight = 190
  ClientWidth = 352
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
    Top = 10
    Width = 337
    Height = 111
    Caption = 'XMExportOpt'
    ItemIndex = 1
    Items.Strings = (
      'XMLExport_All'
      'XMLExport_Translated'
      'XMLExport_Selection'
      'XMLExport_Diff')
    TabOrder = 0
  end
  object Button1: TButton
    Left = 144
    Top = 157
    Width = 99
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object Button2: TButton
    Left = 249
    Top = 157
    Width = 99
    Height = 25
    Caption = 'Ok'
    Default = True
    ModalResult = 1
    TabOrder = 2
  end
  object CheckBox1: TCheckBox
    Left = 16
    Top = 127
    Width = 328
    Height = 17
    Caption = 'Split_colab'
    TabOrder = 3
  end
  object CheckBox2: TCheckBox
    Left = 16
    Top = 127
    Width = 328
    Height = 17
    Caption = 'chk_exportFuzData'
    TabOrder = 4
  end
end
