object FormDialog: TFormDialog
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  ClientHeight = 106
  ClientWidth = 608
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnPaint = FormPaint
  OnShow = FormShow
  DesignSize = (
    608
    106)
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonNo: TButton
    Left = 432
    Top = 73
    Width = 82
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'No'
    ModalResult = 7
    TabOrder = 2
  end
  object ButtonYes: TButton
    Left = 520
    Top = 73
    Width = 80
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Yes'
    Default = True
    ModalResult = 6
    TabOrder = 1
  end
  object ButtonCancel: TButton
    Left = 344
    Top = 73
    Width = 82
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
  end
  object ButtonOk: TButton
    Left = 520
    Top = 73
    Width = 80
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Ok'
    ModalResult = 1
    TabOrder = 0
  end
  object CheckBox1: TCheckBox
    Left = 8
    Top = 77
    Width = 177
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Ask_Remember'
    TabOrder = 4
    OnClick = CheckBox1Click
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 8
    Top = 16
  end
end
