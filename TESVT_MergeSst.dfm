object Form7: TForm7
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'MergeSst'
  ClientHeight = 303
  ClientWidth = 564
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
    Left = 8
    Top = 242
    Width = 269
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'inputMergeName'
  end
  object Memo1: TMemo
    Left = 8
    Top = 8
    Width = 546
    Height = 225
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 3
    WordWrap = False
  end
  object Button1: TButton
    Left = 479
    Top = 270
    Width = 75
    Height = 25
    Caption = 'Ok'
    Default = True
    Enabled = False
    ModalResult = 1
    TabOrder = 1
  end
  object Button2: TButton
    Left = 398
    Top = 270
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object Edit1: TEdit
    Left = 283
    Top = 239
    Width = 273
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
    OnContextPopup = Edit1ContextPopup
    OnKeyPress = Edit1KeyPress
  end
end
