object Form20: TForm20
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'PreProcessing'
  ClientHeight = 314
  ClientWidth = 553
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ValueListEditor1: TValueListEditor
    Left = 8
    Top = 8
    Width = 537
    Height = 267
    DisplayOptions = [doAutoColResize, doKeyColFixed]
    TabOrder = 0
    ColWidths = (
      193
      338)
  end
  object Button1: TButton
    Left = 470
    Top = 281
    Width = 75
    Height = 25
    Caption = 'Ok'
    ModalResult = 1
    TabOrder = 1
  end
  object Button2: TButton
    Left = 389
    Top = 281
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object Button3: TButton
    Left = 8
    Top = 282
    Width = 75
    Height = 25
    Caption = 'butCopyOpts'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 89
    Top = 282
    Width = 75
    Height = 25
    Caption = 'butPasteOpts'
    TabOrder = 4
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 184
    Top = 282
    Width = 75
    Height = 25
    Caption = 'but_reset'
    TabOrder = 5
    OnClick = Button5Click
  end
end
