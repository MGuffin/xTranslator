object Form17: TForm17
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'ToolBoxOptions'
  ClientHeight = 530
  ClientWidth = 266
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
    Top = 8
    Width = 233
    Height = 50
    AutoSize = False
    Caption = 'PH'
    WordWrap = True
  end
  object Memo1: TMemo
    Left = 16
    Top = 64
    Width = 233
    Height = 385
    ScrollBars = ssVertical
    TabOrder = 0
    WordWrap = False
  end
  object Button1: TButton
    Left = 174
    Top = 486
    Width = 75
    Height = 25
    Caption = 'Ok'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object Button2: TButton
    Left = 16
    Top = 486
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object Button3: TButton
    Left = 16
    Top = 455
    Width = 233
    Height = 25
    Caption = 'but_LoadfromDefUI'
    TabOrder = 3
    Visible = False
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 97
    Top = 486
    Width = 71
    Height = 25
    Caption = 'sort'
    TabOrder = 4
    OnClick = Button4Click
  end
end
