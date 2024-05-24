object FormRtl: TFormRtl
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'RtL preview'
  ClientHeight = 442
  ClientWidth = 624
  Color = clBtnFace
  Constraints.MaxHeight = 480
  Constraints.MinHeight = 480
  Constraints.MinWidth = 600
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 442
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 620
    ExplicitHeight = 441
    object Memo1: TMemo
      Left = 1
      Top = 1
      Width = 622
      Height = 153
      Align = alTop
      BiDiMode = bdRightToLeft
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentBiDiMode = False
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 0
      OnChange = Memo1Change
      OnClick = RadioGroup1Click
      ExplicitWidth = 618
    end
    object Memo2: TMemo
      Left = 1
      Top = 279
      Width = 622
      Height = 162
      Align = alBottom
      BiDiMode = bdRightToLeft
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentBiDiMode = False
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 1
      ExplicitTop = 278
      ExplicitWidth = 618
    end
    object RadioGroup1: TRadioGroup
      Left = 8
      Top = 168
      Width = 97
      Height = 82
      Caption = 'Method'
      ItemIndex = 1
      Items.Strings = (
        'None'
        'Shape'
        'Deshape')
      TabOrder = 2
      OnClick = RadioGroup1Click
    end
    object Button1: TButton
      Left = 431
      Top = 231
      Width = 75
      Height = 25
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 3
    end
    object Button2: TButton
      Left = 512
      Top = 231
      Width = 97
      Height = 25
      Caption = 'Convert All'
      ModalResult = 1
      TabOrder = 4
    end
    object AdjustLineSize: TGroupBox
      Left = 111
      Top = 168
      Width = 154
      Height = 57
      Caption = 'AdjustLineSize'
      TabOrder = 5
      object TrackBar1: TTrackBar
        Left = 5
        Top = 22
        Width = 146
        Height = 27
        Max = 200
        Frequency = 15
        Position = 50
        TabOrder = 0
        OnChange = TrackBar1Change
      end
    end
    object CheckBox1: TCheckBox
      Left = 287
      Top = 200
      Width = 98
      Height = 17
      Caption = 'RtLview'
      TabOrder = 6
      OnClick = CheckBox1Click
    end
    object CheckBox2: TCheckBox
      Left = 116
      Top = 231
      Width = 146
      Height = 17
      Caption = 'remove controlChars'
      Checked = True
      State = cbChecked
      TabOrder = 7
      OnClick = RadioGroup1Click
    end
  end
end
