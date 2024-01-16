object FormSpOpts: TFormSpOpts
  Left = 0
  Top = 0
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsDialog
  Caption = 'FormSpOpts'
  ClientHeight = 303
  ClientWidth = 473
  Color = clBtnFace
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
  object GroupBox1: TGroupBox
    Left = 8
    Top = 3
    Width = 457
    Height = 261
    Caption = 'SpellCheckOpts'
    TabOrder = 0
    object Label3: TLabel
      Left = 69
      Top = 122
      Width = 173
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'hunspell_Dics'
    end
    object SpeedButton1: TSpeedButton
      Left = 16
      Top = 119
      Width = 23
      Height = 22
      Hint = 'hint_OpenInfoPage'
      Flat = True
      Glyph.Data = {
        C6010000424DC601000000000000C60000002800000010000000100000000100
        08000000000000010000120B0000120B0000240000002400000000000000FFFF
        FF008D602E008E602F008F613000C99B6A00885C2600895D27008A5D29008A5E
        29008B5E2A008C5F2C008D602D00B5895400B98C580083581F0084592000855A
        2200865B2300875C2500A57A42007F561A0080561B0081571C0082581D009269
        2D009A7035007C5415007F5716007D5416007E551700875F20008C6325007750
        0E0078510F00FFFFFF0001010101010101010101010101010101010101010101
        0101010101010101010101010101012121211C1F190101010101010101012121
        1B1718180F140101010101010121211508030B0713060E010101010121211E0A
        0401010A090B04050101010121221104040101060704040501010101211D0804
        0401011013040405010101011C160A04040101171304040501010101200F0B04
        040A10100B040405010101011A120C040401010B0404040501010101010D0204
        0404040404040501010101010101050404040404040501010101010101010105
        0505050505010101010101010101010101010101010101010101010101010101
        01010101010101010101}
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 40
      Top = 119
      Width = 23
      Height = 22
      Hint = 'hint_OpenDicFolder'
      Flat = True
      Glyph.Data = {
        AA010000424DAA01000000000000AA0000002800000010000000100000000100
        08000000000000010000120B0000120B00001D0000001D00000000000000FFFF
        FF008D602E008E602F008F613000AC7F4D00AD7F4E00CB9D6C00895D27008A5D
        29008A5E29008B5E2A008C5F2B008C5F2C008D602D00AA7D4A00B5895400BF92
        5F0084592000855A21009E733900AD814A007E5518007D5418007F561A008056
        1B0081571C0082581D00FFFFFF00010101010101010101010101010101010101
        0101010101010101010101010101010113080D040404040E0B0E0B0A02010101
        091414141414141414141414040101010E151515151515151515151504010101
        0210101010101010101010100401010108111111111111111111111103010101
        1B07070707070707070707070B0101011B07070707070707070707070B010101
        1B07070707070707070707070B01010117070707070707070707070702010101
        161A1A1A191616161807070704010101120F0506040606060407070704010101
        0C04040404040404040404040401010101010101010101010101010101010101
        0101010101010101010101010101}
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton2Click
    end
    object CheckBox1: TCheckBox
      Left = 16
      Top = 27
      Width = 345
      Height = 17
      Caption = 'Use_SpellCheck'
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object RadioGroup1: TRadioGroup
      Left = 16
      Top = 50
      Width = 425
      Height = 63
      Caption = 'Choose_API'
      ItemIndex = 0
      Items.Strings = (
        'Microsoft Word API'
        'Hunspell/OpenOffice API')
      TabOrder = 1
      OnClick = RadioGroup1Click
    end
    object ComboBox1: TComboBox
      Left = 248
      Top = 119
      Width = 193
      Height = 21
      Style = csDropDownList
      TabOrder = 2
    end
    object GroupBox2: TGroupBox
      Left = 16
      Top = 146
      Width = 425
      Height = 103
      Caption = 'spParseOptions'
      TabOrder = 3
      object CheckBox2: TCheckBox
        Left = 16
        Top = 24
        Width = 393
        Height = 17
        Caption = 'spParseIgnoreFirstUpper'
        TabOrder = 0
      end
      object CheckBox3: TCheckBox
        Left = 16
        Top = 47
        Width = 393
        Height = 17
        Caption = 'spParseIgnoreMultiUpper'
        TabOrder = 1
      end
      object CheckBox4: TCheckBox
        Left = 16
        Top = 70
        Width = 377
        Height = 17
        Caption = 'spParseIgnoreAlias'
        TabOrder = 2
      end
    end
  end
  object Button3: TButton
    Left = 362
    Top = 270
    Width = 105
    Height = 25
    Caption = 'Ok'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object Button1: TButton
    Left = 250
    Top = 270
    Width = 106
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
end
