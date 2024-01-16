object FormHTML: TFormHTML
  Left = 0
  Top = 0
  Caption = 'formHtmlView'
  ClientHeight = 368
  ClientWidth = 632
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
  object Panel1: TPanel
    Left = 0
    Top = 336
    Width = 632
    Height = 32
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      632
      32)
    object Button1: TButton
      Left = 531
      Top = 3
      Width = 97
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = 'Ok'
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 632
    Height = 336
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 4
    TabOrder = 1
    object Panel3: TPanel
      Left = 4
      Top = 4
      Width = 624
      Height = 328
      Align = alClient
      BevelOuter = bvLowered
      Caption = 'Panel3'
      TabOrder = 0
      object HtmlViewer1: THtmlViewer
        Left = 1
        Top = 1
        Width = 622
        Height = 326
        TabOrder = 0
        Align = alClient
        BorderStyle = htFocused
        CharSet = DEFAULT_CHARSET
        DefBackground = clWhite
        DefFontColor = clBlack
        DefFontName = 'Arial'
        DefFontSize = 8
        DefHotSpotColor = clMaroon
        DefOverLinkColor = clMaroon
        DefPreFontName = 'Arial'
        DefVisitedLinkColor = clMaroon
        HistoryMaxCount = 0
        NoSelect = False
        PrintMarginBottom = 2.000000000000000000
        PrintMarginLeft = 2.000000000000000000
        PrintMarginRight = 2.000000000000000000
        PrintMarginTop = 2.000000000000000000
        PrintScale = 1.000000000000000000
        QuirksMode = qmDetect
        OnHotSpotClick = HtmlViewer1HotSpotClick
      end
    end
  end
end
