object FormBrowser: TFormBrowser
  Left = 0
  Top = 0
  BorderIcons = [biMinimize, biMaximize]
  Caption = 'Form_Browser'
  ClientHeight = 491
  ClientWidth = 542
  Color = clBtnFace
  Constraints.MinHeight = 400
  Constraints.MinWidth = 550
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 458
    Width = 542
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = 457
    ExplicitWidth = 538
    DesignSize = (
      542
      33)
    object Button1: TButton
      Left = 439
      Top = 6
      Width = 91
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Ok'
      Default = True
      ModalResult = 1
      TabOrder = 0
      ExplicitLeft = 435
    end
    object Button2: TButton
      Left = 342
      Top = 6
      Width = 91
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
      ExplicitLeft = 338
    end
    object CheckBox1: TCheckBox
      Left = 8
      Top = 10
      Width = 323
      Height = 17
      Caption = 'DiscardNoTransPex'
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 542
    Height = 33
    Align = alTop
    BevelOuter = bvNone
    BorderWidth = 5
    Caption = 'Panel2'
    TabOrder = 1
    ExplicitWidth = 538
    object ButtonedEdit1: TButtonedEdit
      Left = 5
      Top = 5
      Width = 532
      Height = 21
      Align = alTop
      DoubleBuffered = False
      Images = Form1.ImageList1
      LeftButton.DisabledImageIndex = 13
      LeftButton.Enabled = False
      LeftButton.HotImageIndex = 13
      LeftButton.ImageIndex = 13
      LeftButton.PressedImageIndex = 13
      LeftButton.Visible = True
      ParentDoubleBuffered = False
      RightButton.ImageIndex = 12
      RightButton.Visible = True
      TabOrder = 0
      OnChange = ButtonedEdit1Change
      OnRightButtonClick = ButtonedEdit1RightButtonClick
      ExplicitWidth = 528
    end
  end
  object BrowserTree: TVirtualStringTree
    Left = 0
    Top = 33
    Width = 542
    Height = 425
    Align = alClient
    ButtonStyle = bsTriangle
    Colors.SelectionTextColor = clWindowText
    DragOperations = [doMove]
    DragType = dtVCL
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Header.AutoSizeIndex = 1
    Header.Font.Charset = DEFAULT_CHARSET
    Header.Font.Color = clWindowText
    Header.Font.Height = -11
    Header.Font.Name = 'MS Sans Serif'
    Header.Font.Style = []
    Header.Height = 17
    Header.MainColumn = 1
    Header.Options = [hoAutoResize, hoColumnResize, hoDrag, hoOwnerDraw, hoVisible]
    Header.ParentFont = False
    Header.SortColumn = 0
    HintMode = hmTooltip
    Images = Form1.ImageList1
    ParentFont = False
    ParentShowHint = False
    PopupMenu = PopupMenu1
    SelectionBlendFactor = 80
    ShowHint = False
    TabOrder = 2
    TreeOptions.MiscOptions = [toAcceptOLEDrop, toCheckSupport, toFullRepaintOnResize, toInitOnSave, toToggleOnDblClick, toWheelPanning]
    TreeOptions.PaintOptions = [toHideFocusRect, toShowButtons, toShowDropmark, toThemeAware, toUseBlendedImages]
    TreeOptions.SelectionOptions = [toExtendedFocus, toFullRowSelect]
    OnAdvancedHeaderDraw = BrowserTreeAdvancedHeaderDraw
    OnCompareNodes = BrowserTreeCompareNodes
    OnDblClick = BrowserTreeDblClick
    OnFreeNode = BrowserTreeFreeNode
    OnGetText = BrowserTreeGetText
    OnGetImageIndex = BrowserTreeGetImageIndex
    OnHeaderClick = BrowserTreeHeaderClick
    OnHeaderDrawQueryElements = BrowserTreeHeaderDrawQueryElements
    Touch.InteractiveGestures = [igPan, igPressAndTap]
    Touch.InteractiveGestureOptions = [igoPanSingleFingerHorizontal, igoPanSingleFingerVertical, igoPanInertia, igoPanGutter, igoParentPassthrough]
    Columns = <
      item
        Position = 0
        Width = 23
      end
      item
        Position = 1
        Text = 'Files'
        Width = 439
      end
      item
        Alignment = taRightJustify
        Position = 2
        Text = 'Size'
        Width = 80
      end>
  end
  object PopupMenu1: TPopupMenu
    Left = 232
    Top = 224
    object selectAll1: TMenuItem
      Caption = 'selectAll'
      OnClick = selectAll1Click
    end
    object deselectAll1: TMenuItem
      Caption = 'deselectAll'
      OnClick = deselectAll1Click
    end
  end
end
