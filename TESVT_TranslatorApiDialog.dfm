object Form25: TForm25
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'TranslationAPI'
  ClientHeight = 259
  ClientWidth = 368
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnCreate = FormCreate
  TextHeight = 15
  object Label1: TLabel
    Left = 8
    Top = 37
    Width = 352
    Height = 124
    AutoSize = False
    Caption = 'Label1'
    WordWrap = True
  end
  object ComboBox1: TComboBox
    Left = 8
    Top = 8
    Width = 352
    Height = 23
    Style = csDropDownList
    TabOrder = 0
  end
  object Button1: TButton
    Left = 285
    Top = 227
    Width = 75
    Height = 25
    Caption = 'Ok'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object Button2: TButton
    Left = 204
    Top = 227
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object CheckBox1: TCheckBox
    Left = 8
    Top = 175
    Width = 352
    Height = 17
    Caption = 'chkAutoTagNoTrans'
    Checked = True
    State = cbChecked
    TabOrder = 3
  end
  object CheckBox2: TCheckBox
    Left = 8
    Top = 198
    Width = 337
    Height = 17
    Caption = 'chkNormalizeAlias'
    Checked = True
    State = cbChecked
    TabOrder = 4
  end
end
