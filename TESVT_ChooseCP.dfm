object Form15: TForm15
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'forceCp'
  ClientHeight = 147
  ClientWidth = 326
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
    Width = 302
    Height = 73
    AutoSize = False
    Caption = 'forceCpInfo'
    WordWrap = True
  end
  object ComboBox1: TComboBox
    Left = 8
    Top = 87
    Width = 310
    Height = 21
    Style = csDropDownList
    TabOrder = 0
  end
  object Button1: TButton
    Left = 243
    Top = 114
    Width = 75
    Height = 25
    Caption = 'Ok'
    ModalResult = 1
    TabOrder = 1
  end
end
