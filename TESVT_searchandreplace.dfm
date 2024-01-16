object Form4: TForm4
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Searchandreplace'
  ClientHeight = 251
  ClientWidth = 553
  Color = clBtnFace
  DefaultMonitor = dmMainForm
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 33
    Height = 13
    Caption = 'Search'
  end
  object Label2: TLabel
    Left = 16
    Top = 37
    Width = 38
    Height = 13
    Caption = 'Replace'
  end
  object Label3: TLabel
    Left = 240
    Top = 148
    Width = 93
    Height = 13
    Caption = 'searchRepMethode'
  end
  object RadioGroup1: TRadioGroup
    Left = 9
    Top = 62
    Width = 225
    Height = 107
    Caption = 'searchRepIn'
    ItemIndex = 1
    Items.Strings = (
      'StringsAll'
      'StringNoVal'
      'StringNoLD'
      'StringSel')
    TabOrder = 0
  end
  object RadioGroup2: TRadioGroup
    Left = 240
    Top = 62
    Width = 309
    Height = 80
    Caption = 'search_Method'
    ItemIndex = 1
    Items.Strings = (
      'searchindest'
      'searchinSource'
      'justAddInDest')
    TabOrder = 1
  end
  object Button1: TButton
    Left = 458
    Top = 218
    Width = 91
    Height = 25
    Caption = 'Ok'
    Default = True
    ModalResult = 1
    TabOrder = 2
  end
  object Button2: TButton
    Left = 361
    Top = 218
    Width = 91
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
  end
  object ComboBox1: TComboBox
    Left = 97
    Top = 8
    Width = 452
    Height = 22
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnChange = ComboBox1Change
  end
  object ComboBox2: TComboBox
    Left = 97
    Top = 35
    Width = 452
    Height = 22
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object CheckBox1: TCheckBox
    Left = 16
    Top = 175
    Width = 218
    Height = 17
    Caption = 'Case_sensitive'
    TabOrder = 6
  end
  object ComboBox3: TComboBox
    Left = 240
    Top = 167
    Width = 305
    Height = 22
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ItemIndex = 0
    ParentFont = False
    TabOrder = 7
    Text = '[%REPLACE%] %ORIG%'
    Items.Strings = (
      '[%REPLACE%] %ORIG%'
      '%ORIG% [%REPLACE%]'
      '%REPLACE% %ORIG%'
      '%ORIG% %REPLACE%')
  end
  object CheckBox2: TCheckBox
    Left = 16
    Top = 198
    Width = 317
    Height = 17
    Caption = 'Search_inAllLists'
    TabOrder = 8
  end
  object CheckBox4: TCheckBox
    Left = 16
    Top = 223
    Width = 273
    Height = 17
    Caption = 'overwrite_RestrictToFilter'
    TabOrder = 9
  end
end
