object AdvSearchForm: TAdvSearchForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'AdvancedSearch'
  ClientHeight = 403
  ClientWidth = 348
  Color = clBtnFace
  Constraints.MaxWidth = 600
  Constraints.MinHeight = 320
  Constraints.MinWidth = 360
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  PopupMenu = PopupMenu1
  Position = poDefault
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 365
    Width = 348
    Height = 38
    Align = alBottom
    BevelOuter = bvNone
    Padding.Left = 5
    Padding.Top = 5
    Padding.Right = 5
    Padding.Bottom = 5
    TabOrder = 0
    ExplicitTop = 364
    ExplicitWidth = 344
    object Panel4: TPanel
      Left = 5
      Top = 5
      Width = 260
      Height = 28
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitWidth = 256
      object Button3: TButton
        Left = 105
        Top = 1
        Width = 96
        Height = 25
        Caption = 'DeleteSearch'
        ImageIndex = 12
        Images = Form1.ImageList1
        TabOrder = 0
        OnClick = Button3Click
      end
      object Button2: TButton
        Left = 0
        Top = 1
        Width = 99
        Height = 25
        Caption = 'SaveSearch'
        ImageIndex = 10
        Images = Form1.ImageList1
        TabOrder = 1
        OnClick = Button2Click
      end
    end
    object Panel5: TPanel
      Left = 265
      Top = 5
      Width = 78
      Height = 28
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitLeft = 261
      object Button1: TButton
        Left = 3
        Top = 0
        Width = 75
        Height = 28
        Align = alRight
        Caption = 'Close'
        Default = True
        TabOrder = 0
        OnClick = Button1Click
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 348
    Height = 145
    Align = alTop
    BevelOuter = bvNone
    DoubleBuffered = True
    Padding.Left = 5
    Padding.Top = 5
    Padding.Right = 5
    Padding.Bottom = 5
    ParentDoubleBuffered = False
    TabOrder = 1
    ExplicitWidth = 344
    object Panel6: TPanel
      Left = 5
      Top = 5
      Width = 99
      Height = 135
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object Label1: TLabel
        Left = 10
        Top = 5
        Width = 33
        Height = 13
        Caption = 'Source'
      end
      object Label2: TLabel
        Left = 10
        Top = 32
        Width = 51
        Height = 13
        Caption = 'Translated'
      end
      object Label3: TLabel
        Left = 10
        Top = 59
        Width = 63
        Height = 13
        Caption = 'EDID/FormID'
      end
      object Label4: TLabel
        Left = 10
        Top = 86
        Width = 66
        Height = 13
        AutoSize = False
        Caption = 'RFSig'
      end
      object Label6: TLabel
        Left = 10
        Top = 112
        Width = 42
        Height = 13
        Caption = 'Keyword'
        ParentShowHint = False
        ShowHint = True
      end
    end
    object Panel7: TPanel
      Left = 104
      Top = 5
      Width = 239
      Height = 135
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitWidth = 235
      object Panel8: TPanel
        Left = 0
        Top = 0
        Width = 239
        Height = 27
        Align = alTop
        BevelOuter = bvNone
        Padding.Top = 2
        Padding.Bottom = 2
        TabOrder = 0
        ExplicitWidth = 235
        object ButtonedEdit1: TButtonedEdit
          Tag = 1
          Left = 0
          Top = 2
          Width = 239
          Height = 23
          Hint = 'hint_SearchFieldInfo'
          Align = alClient
          DoubleBuffered = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Images = Form1.ImageList1
          LeftButton.DisabledImageIndex = 13
          LeftButton.HotImageIndex = 13
          LeftButton.ImageIndex = 13
          LeftButton.PressedImageIndex = 13
          LeftButton.Visible = True
          ParentDoubleBuffered = False
          ParentFont = False
          ParentShowHint = False
          RightButton.ImageIndex = 12
          RightButton.Visible = True
          ShowHint = True
          TabOrder = 0
          OnChange = ButtonedEdit1Change
          OnLeftButtonClick = ButtonedEdit1LeftButtonClick
          OnRightButtonClick = ButtonedEdit1RightButtonClick
          ExplicitWidth = 235
          ExplicitHeight = 22
        end
      end
      object Panel9: TPanel
        Left = 0
        Top = 27
        Width = 239
        Height = 27
        Align = alTop
        BevelOuter = bvNone
        Padding.Top = 2
        Padding.Bottom = 2
        TabOrder = 1
        ExplicitWidth = 235
        object ButtonedEdit2: TButtonedEdit
          Tag = 2
          Left = 0
          Top = 2
          Width = 239
          Height = 23
          Hint = 'hint_SearchFieldInfo'
          Align = alClient
          DoubleBuffered = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Images = Form1.ImageList1
          LeftButton.DisabledImageIndex = 13
          LeftButton.HotImageIndex = 13
          LeftButton.ImageIndex = 13
          LeftButton.PressedImageIndex = 13
          LeftButton.Visible = True
          ParentDoubleBuffered = False
          ParentFont = False
          ParentShowHint = False
          RightButton.ImageIndex = 12
          RightButton.Visible = True
          ShowHint = True
          TabOrder = 0
          OnChange = ButtonedEdit1Change
          OnLeftButtonClick = ButtonedEdit1LeftButtonClick
          OnRightButtonClick = ButtonedEdit1RightButtonClick
          ExplicitWidth = 235
          ExplicitHeight = 22
        end
      end
      object Panel10: TPanel
        Left = 0
        Top = 54
        Width = 239
        Height = 27
        Align = alTop
        BevelOuter = bvNone
        Padding.Top = 2
        Padding.Bottom = 2
        TabOrder = 2
        ExplicitWidth = 235
        object ButtonedEdit3: TButtonedEdit
          Tag = 3
          Left = 0
          Top = 2
          Width = 239
          Height = 23
          Hint = 'Hint_Edid'
          Align = alClient
          DoubleBuffered = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Images = Form1.ImageList1
          LeftButton.DisabledImageIndex = 13
          LeftButton.HotImageIndex = 13
          LeftButton.ImageIndex = 13
          LeftButton.PressedImageIndex = 13
          LeftButton.Visible = True
          ParentDoubleBuffered = False
          ParentFont = False
          ParentShowHint = False
          RightButton.ImageIndex = 12
          RightButton.Visible = True
          ShowHint = True
          TabOrder = 0
          OnChange = ButtonedEdit1Change
          OnLeftButtonClick = ButtonedEdit1LeftButtonClick
          OnRightButtonClick = ButtonedEdit1RightButtonClick
          ExplicitWidth = 235
          ExplicitHeight = 22
        end
      end
      object Panel11: TPanel
        Left = 0
        Top = 81
        Width = 239
        Height = 27
        Align = alTop
        BevelOuter = bvNone
        Padding.Top = 2
        Padding.Bottom = 2
        TabOrder = 3
        ExplicitWidth = 235
        object Label7: TLabel
          Left = 108
          Top = 5
          Width = 13
          Height = 13
          AutoSize = False
          Caption = '  :'
        end
        object ButtonedEdit4: TButtonedEdit
          Left = 0
          Top = 2
          Width = 103
          Height = 22
          Hint = 'Hint_RecField'
          DoubleBuffered = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Images = Form1.ImageList1
          LeftButton.Enabled = False
          ParentDoubleBuffered = False
          ParentFont = False
          ParentShowHint = False
          RightButton.ImageIndex = 12
          RightButton.Visible = True
          ShowHint = True
          TabOrder = 0
          OnChange = ButtonedEdit1Change
          OnRightButtonClick = ButtonedEdit1RightButtonClick
        end
        object ButtonedEdit5: TButtonedEdit
          Left = 128
          Top = 2
          Width = 97
          Height = 22
          Hint = 'Hint_RecField'
          DoubleBuffered = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Images = Form1.ImageList1
          LeftButton.Enabled = False
          ParentDoubleBuffered = False
          ParentFont = False
          ParentShowHint = False
          RightButton.ImageIndex = 12
          RightButton.Visible = True
          ShowHint = True
          TabOrder = 1
          OnChange = ButtonedEdit1Change
          OnRightButtonClick = ButtonedEdit1RightButtonClick
        end
      end
      object Panel13: TPanel
        Left = 0
        Top = 108
        Width = 239
        Height = 23
        Align = alTop
        BevelOuter = bvNone
        Caption = 'Panel13'
        TabOrder = 4
        ExplicitWidth = 235
        object ButtonedEdit6: TButtonedEdit
          Tag = 4
          Left = 0
          Top = 0
          Width = 239
          Height = 23
          Hint = 'hint_Keyword'
          Align = alClient
          DoubleBuffered = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Images = Form1.ImageList1
          LeftButton.DisabledImageIndex = 13
          LeftButton.HotImageIndex = 13
          LeftButton.ImageIndex = 13
          LeftButton.PressedImageIndex = 13
          LeftButton.Visible = True
          ParentDoubleBuffered = False
          ParentFont = False
          ParentShowHint = False
          RightButton.ImageIndex = 12
          RightButton.Visible = True
          ShowHint = True
          TabOrder = 0
          OnChange = ButtonedEdit1Change
          OnLeftButtonClick = ButtonedEdit1LeftButtonClick
          OnRightButtonClick = ButtonedEdit1RightButtonClick
          ExplicitWidth = 235
          ExplicitHeight = 22
        end
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 185
    Width = 348
    Height = 180
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel3'
    Padding.Left = 5
    Padding.Top = 5
    Padding.Right = 5
    Padding.Bottom = 5
    TabOrder = 2
    ExplicitWidth = 344
    ExplicitHeight = 179
    object ListBox1: TListBox
      Left = 5
      Top = 5
      Width = 338
      Height = 170
      Style = lbOwnerDrawFixed
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      MultiSelect = True
      ParentFont = False
      TabOrder = 0
      OnDblClick = ListBox1DblClick
      OnDrawItem = ListBox1DrawItem
      ExplicitWidth = 334
      ExplicitHeight = 169
    end
  end
  object Panel12: TPanel
    Left = 0
    Top = 145
    Width = 348
    Height = 40
    Align = alTop
    BevelOuter = bvNone
    Padding.Left = 5
    Padding.Top = 5
    Padding.Right = 5
    Padding.Bottom = 5
    TabOrder = 3
    ExplicitWidth = 344
    object Label5: TLabel
      Left = 5
      Top = 5
      Width = 338
      Height = 30
      Align = alClient
      Caption = 'lbl_regexAdvInfo'
      WordWrap = True
      ExplicitWidth = 83
      ExplicitHeight = 13
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 168
    Top = 200
    object N1: TMenuItem
      Caption = '(.*)  ||   (.*) '
      Checked = True
      RadioItem = True
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = '(.*)  =  (.*)'
      RadioItem = True
      OnClick = N1Click
    end
    object N3: TMenuItem
      Caption = '(.*)  !=  (.*)'
      RadioItem = True
      OnClick = N1Click
    end
  end
end