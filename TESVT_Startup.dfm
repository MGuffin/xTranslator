object FormStartup: TFormStartup
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'FormStartup'
  ClientHeight = 372
  ClientWidth = 276
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 32
    Top = 128
    Width = 209
    Height = 49
    Caption = 'Button1'
    ImageIndex = 63
    ImageMargins.Left = 25
    ImageMargins.Right = -35
    Images = Form1.ImageList1
    ModalResult = 1
    TabOrder = 2
  end
  object Button2: TButton
    Tag = 1
    Left = 32
    Top = 16
    Width = 209
    Height = 50
    Caption = 'Button2'
    Default = True
    ImageIndex = 64
    ImageMargins.Left = 25
    ImageMargins.Right = -35
    Images = Form1.ImageList1
    ModalResult = 2
    TabOrder = 0
  end
  object Button3: TButton
    Tag = 2
    Left = 32
    Top = 183
    Width = 209
    Height = 50
    Caption = 'Button3'
    ImageIndex = 65
    ImageMargins.Left = 25
    ImageMargins.Right = -35
    Images = Form1.ImageList1
    ModalResult = 6
    TabOrder = 3
  end
  object Button4: TButton
    Tag = 1
    Left = 32
    Top = 72
    Width = 209
    Height = 50
    Caption = 'Button4'
    ImageIndex = 70
    ImageMargins.Left = 25
    ImageMargins.Right = -35
    Images = Form1.ImageList1
    ModalResult = 3
    TabOrder = 1
  end
  object Button5: TButton
    Tag = 1
    Left = 32
    Top = 239
    Width = 209
    Height = 50
    Caption = 'Button4'
    Default = True
    ImageIndex = 81
    ImageMargins.Left = 25
    ImageMargins.Right = -35
    Images = Form1.ImageList1
    ModalResult = 12
    TabOrder = 4
  end
  object Button6: TButton
    Tag = 1
    Left = 32
    Top = 295
    Width = 209
    Height = 50
    Caption = 'Button4'
    Default = True
    ImageIndex = 30
    ImageMargins.Left = 25
    ImageMargins.Right = -35
    Images = Form1.ImageList1
    ModalResult = 7
    TabOrder = 5
  end
end
