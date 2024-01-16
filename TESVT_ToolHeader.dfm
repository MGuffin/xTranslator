object Form19: TForm19
  Left = 0
  Top = 0
  Caption = 'addHeader'
  ClientHeight = 443
  ClientWidth = 649
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
  object ButtonGroup1: TButtonGroup
    Left = 0
    Top = 0
    Width = 649
    Height = 401
    Align = alClient
    BorderStyle = bsNone
    ButtonHeight = 30
    ButtonWidth = 100
    Images = Form1.ImageList1
    Items = <>
    TabOrder = 0
    OnButtonClicked = ButtonGroup1ButtonClicked
  end
  object Panel1: TPanel
    Left = 0
    Top = 401
    Width = 649
    Height = 42
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      649
      42)
    object Button1: TButton
      Left = 569
      Top = 14
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = 'Cancel'
      Default = True
      ModalResult = 2
      TabOrder = 0
    end
    object Button2: TButton
      Left = 8
      Top = 14
      Width = 113
      Height = 25
      Caption = 'but_EditHeaders'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
end
