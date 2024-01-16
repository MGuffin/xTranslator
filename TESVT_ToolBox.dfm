object Form16: TForm16
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'ToolBox'
  ClientHeight = 299
  ClientWidth = 256
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
    Left = 8
    Top = 8
    Width = 240
    Height = 249
    BorderStyle = bsNone
    ButtonHeight = 30
    ButtonWidth = 238
    Images = Form1.ImageList1
    Items = <
      item
        ImageIndex = 74
      end
      item
        ImageIndex = 74
      end
      item
        ImageIndex = 74
      end
      item
        ImageIndex = 74
      end
      item
        ImageIndex = 74
      end
      item
        ImageIndex = 74
      end
      item
        ImageIndex = 74
      end>
    TabOrder = 0
    OnButtonClicked = ButtonGroup1ButtonClicked
  end
  object Button1: TButton
    Left = 173
    Top = 271
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    Default = True
    ModalResult = 2
    TabOrder = 1
  end
  object Button2: TButton
    Left = 8
    Top = 271
    Width = 75
    Height = 25
    Caption = 'Options'
    TabOrder = 2
    OnClick = Button2Click
  end
end
