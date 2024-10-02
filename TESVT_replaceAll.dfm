object Form5: TForm5
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Update_Similar_Strings'
  ClientHeight = 501
  ClientWidth = 925
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 465
    Width = 925
    Height = 36
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = 358
    ExplicitWidth = 736
    object Label1: TLabel
      Left = 8
      Top = 12
      Width = 49
      Height = 13
      Caption = 'ctrl_select'
    end
    object Button1: TButton
      Left = 648
      Top = 6
      Width = 87
      Height = 25
      Caption = 'Ok'
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 440
      Top = 6
      Width = 94
      Height = 25
      Caption = 'SelectAll'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 336
      Top = 6
      Width = 98
      Height = 25
      Caption = 'DeselectAll'
      TabOrder = 2
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 556
      Top = 6
      Width = 86
      Height = 25
      Cancel = True
      Caption = 'No'
      ModalResult = 2
      TabOrder = 3
    end
  end
  object replaceTree: TVirtualStringTree
    Left = 0
    Top = 0
    Width = 925
    Height = 465
    Align = alClient
    Colors.SelectionTextColor = clWindowText
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Header.AutoSizeIndex = 2
    Header.Height = 13
    Header.MainColumn = 1
    Header.Options = [hoAutoResize, hoColumnResize, hoDrag, hoOwnerDraw, hoShowSortGlyphs, hoVisible]
    ParentFont = False
    ParentShowHint = False
    SelectionBlendFactor = 40
    ShowHint = True
    TabOrder = 1
    TreeOptions.AutoOptions = [toAutoDropExpand, toAutoScrollOnExpand, toAutoSort, toAutoTristateTracking, toAutoDeleteMovedNodes]
    TreeOptions.MiscOptions = [toAcceptOLEDrop, toFullRepaintOnResize, toInitOnSave, toToggleOnDblClick, toWheelPanning]
    TreeOptions.PaintOptions = [toHideFocusRect, toShowButtons, toShowDropmark, toUseBlendedImages, toUseBlendedSelection]
    TreeOptions.SelectionOptions = [toExtendedFocus, toFullRowSelect, toMultiSelect]
    OnAdvancedHeaderDraw = replaceTreeAdvancedHeaderDraw
    OnBeforeCellPaint = replaceTreeBeforeCellPaint
    OnFreeNode = replaceTreeFreeNode
    OnGetText = replaceTreeGetText
    OnPaintText = replaceTreePaintText
    OnGetImageIndex = replaceTreeGetImageIndex
    OnHeaderDrawQueryElements = replaceTreeHeaderDrawQueryElements
    OnMouseMove = replaceTreeMouseMove
    Touch.InteractiveGestures = [igPan, igPressAndTap]
    Touch.InteractiveGestureOptions = [igoPanSingleFingerHorizontal, igoPanSingleFingerVertical, igoPanInertia, igoPanGutter, igoParentPassthrough]
    ExplicitWidth = 740
    ExplicitHeight = 359
    Columns = <
      item
        Position = 1
        Text = 'ID'
        Width = 80
      end
      item
        Position = 2
        Text = 'Original'
        Width = 300
      end
      item
        Position = 3
        Text = 'Translated'
        Width = 445
      end
      item
        Options = [coAllowClick, coEnabled, coParentBidiMode, coParentColor, coShowDropMark, coVisible, coAllowFocus]
        Position = 4
        Text = 'LD'
      end
      item
        Position = 0
        Text = 'EDID'
      end>
  end
end
