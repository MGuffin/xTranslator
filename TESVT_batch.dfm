object Form11: TForm11
  Left = 0
  Top = 0
  Caption = 'BatchSearchAndReplace'
  ClientHeight = 480
  ClientWidth = 609
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 439
    Width = 609
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = 440
    ExplicitWidth = 613
    DesignSize = (
      609
      41)
    object Button1: TButton
      Left = 514
      Top = 6
      Width = 91
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Ok'
      Default = True
      ModalResult = 1
      TabOrder = 0
      ExplicitLeft = 522
    end
    object Button2: TButton
      Left = 417
      Top = 6
      Width = 91
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
      ExplicitLeft = 425
    end
    object Button3: TButton
      Left = 14
      Top = 8
      Width = 83
      Height = 25
      Caption = 'SaveRules'
      TabOrder = 2
      OnClick = Button3Click
    end
  end
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 609
    Height = 439
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 1
    WordWrap = False
    ExplicitWidth = 613
    ExplicitHeight = 440
  end
end
