object FormLocOpt: TFormLocOpt
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'LocalizedOpts'
  ClientHeight = 137
  ClientWidth = 404
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
    Left = 299
    Top = 104
    Width = 97
    Height = 25
    Caption = 'Ok'
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object RadioGroup1: TRadioGroup
    Left = 8
    Top = 8
    Width = 388
    Height = 90
    Caption = 'locLabel'
    ItemIndex = 0
    Items.Strings = (
      'locOpt_LoadRegular'
      'locOpt_PrioArchive'
      'locOpt_ChooseStrings')
    TabOrder = 1
  end
end
