object FormsText: TFormsText
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'textSearch'
  ClientHeight = 104
  ClientWidth = 312
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cbSearchText: TComboBox
    Left = 8
    Top = 8
    Width = 295
    Height = 21
    TabOrder = 0
  end
  object RadioGroup1: TRadioGroup
    Left = 8
    Top = 35
    Width = 185
    Height = 62
    Caption = 'SearchIn'
    ItemIndex = 1
    Items.Strings = (
      'Source'
      'Destination')
    TabOrder = 1
  end
  object Button1: TButton
    Left = 209
    Top = 72
    Width = 95
    Height = 25
    Caption = 'Ok'
    Default = True
    ModalResult = 1
    TabOrder = 2
  end
end
