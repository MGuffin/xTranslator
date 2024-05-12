object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'SearchandEdit'
  ClientHeight = 682
  ClientWidth = 1235
  Color = clBtnFace
  Constraints.MinHeight = 480
  Constraints.MinWidth = 1116
  DefaultMonitor = dmDesktop
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Position = poDefault
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnHelp = FormHelp
  OnKeyDown = FormKeyDown
  OnResize = FormResize
  OnShow = FormShow
  TextHeight = 13
  object Splitter2: TSplitter
    Left = 0
    Top = 343
    Width = 1235
    Height = 5
    Cursor = crVSplit
    Align = alBottom
    AutoSnap = False
    Color = clBtnFace
    MinSize = 100
    ParentColor = False
    ResizeStyle = rsUpdate
    ExplicitTop = 328
    ExplicitWidth = 916
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 1235
    Height = 343
    ActivePage = TabSheet6
    Align = alClient
    DoubleBuffered = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Images = Form1.ImageList1
    ParentDoubleBuffered = False
    ParentFont = False
    TabOrder = 1
    OnChange = PageControl1Change
    ExplicitWidth = 1231
    ExplicitHeight = 342
    object TabSheet4: TTabSheet
      Caption = 'espRecord'
      ImageIndex = 3
      object esprecordTree: TVirtualStringTree
        Left = 0
        Top = 21
        Width = 1227
        Height = 293
        Align = alClient
        BorderStyle = bsNone
        ButtonStyle = bsTriangle
        Colors.SelectionTextColor = clWindowText
        DefaultNodeHeight = 100
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Header.AutoSizeIndex = 2
        Header.Options = [hoAutoResize, hoColumnResize, hoDrag, hoOwnerDraw, hoShowSortGlyphs, hoVisible]
        Images = Form1.ImageList2
        ParentFont = False
        ParentShowHint = False
        PopupMenu = PopupMenu4
        SelectionBlendFactor = 40
        ShowHint = True
        TabOrder = 0
        TreeOptions.AutoOptions = [toAutoDropExpand, toAutoScrollOnExpand, toAutoSort, toAutoTristateTracking, toAutoDeleteMovedNodes]
        TreeOptions.MiscOptions = [toAcceptOLEDrop, toFullRepaintOnResize, toInitOnSave, toToggleOnDblClick, toWheelPanning]
        TreeOptions.PaintOptions = [toHideFocusRect, toShowButtons, toShowDropmark, toThemeAware, toUseBlendedImages, toUseBlendedSelection]
        TreeOptions.SelectionOptions = [toExtendedFocus, toFullRowSelect, toMultiSelect]
        OnAdvancedHeaderDraw = esprecordTreeAdvancedHeaderDraw
        OnBeforeCellPaint = esprecordTreeBeforeCellPaint
        OnDblClick = esprecordTreeDblClick
        OnDrawText = esprecordTreeDrawText
        OnFreeNode = searchTreeFreeNode
        OnGetText = esprecordTreeGetText
        OnPaintText = searchTreePaintText
        OnGetImageIndex = esprecordTreeGetImageIndex
        OnHeaderDrawQueryElements = esprecordTreeHeaderDrawQueryElements
        OnInitNode = searchTreeInitNode
        OnMouseMove = searchTreeMouseMove
        Touch.InteractiveGestures = [igPan, igPressAndTap]
        Touch.InteractiveGestureOptions = [igoPanSingleFingerHorizontal, igoPanSingleFingerVertical, igoPanInertia, igoPanGutter, igoParentPassthrough]
        Columns = <
          item
            Position = 2
            Text = 'ID'
            Width = 70
          end
          item
            Position = 3
            Text = 'Original'
            Width = 300
          end
          item
            Position = 4
            Text = 'Translated'
            Width = 807
          end
          item
            Position = 5
            Text = 'LD'
          end
          item
            Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coAllowFocus]
            Position = 1
          end
          item
            Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coAllowFocus]
            Position = 0
          end>
      end
      object Panel22: TPanel
        Left = 0
        Top = 0
        Width = 1227
        Height = 21
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object Edit2: TEdit
          Left = 0
          Top = 0
          Width = 888
          Height = 21
          Align = alClient
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          ExplicitHeight = 23
        end
        object ComboBox3: TComboBox
          Left = 888
          Top = 0
          Width = 339
          Height = 22
          Align = alRight
          Style = csDropDownList
          DropDownCount = 30
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Search'
      ImageIndex = 2
      object Splitter3: TSplitter
        Left = 686
        Top = 23
        Height = 291
        AutoSnap = False
        MinSize = 100
        ResizeStyle = rsUpdate
        ExplicitLeft = 728
        ExplicitTop = 136
        ExplicitHeight = 100
      end
      object searchTree: TVirtualStringTree
        Left = 0
        Top = 23
        Width = 686
        Height = 291
        Align = alLeft
        Colors.SelectionTextColor = clWindowText
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Header.AutoSizeIndex = 2
        Header.Font.Charset = DEFAULT_CHARSET
        Header.Font.Color = clWindowText
        Header.Font.Height = -11
        Header.Font.Name = 'MS Sans Serif'
        Header.Font.Style = []
        Header.MainColumn = 1
        Header.Options = [hoAutoResize, hoColumnResize, hoDrag, hoOwnerDraw, hoShowSortGlyphs, hoVisible]
        Header.ParentFont = False
        Header.SortColumn = 3
        Images = Form1.ImageList2
        ParentFont = False
        ParentShowHint = False
        PopupMenu = PopupMenu2
        SelectionBlendFactor = 40
        ShowHint = True
        TabOrder = 0
        TreeOptions.AutoOptions = [toAutoDropExpand, toAutoScrollOnExpand, toAutoSort, toAutoTristateTracking, toAutoDeleteMovedNodes]
        TreeOptions.MiscOptions = [toAcceptOLEDrop, toFullRepaintOnResize, toInitOnSave, toToggleOnDblClick, toWheelPanning, toEditOnDblClick]
        TreeOptions.PaintOptions = [toHideFocusRect, toShowButtons, toShowDropmark, toThemeAware, toUseBlendedImages, toUseBlendedSelection]
        TreeOptions.SelectionOptions = [toExtendedFocus, toFullRowSelect]
        OnAdvancedHeaderDraw = esprecordTreeAdvancedHeaderDraw
        OnBeforeCellPaint = searchTreeBeforeCellPaint
        OnCompareNodes = searchTreeCompareNodes
        OnDrawText = esprecordTreeDrawText
        OnFocusChanged = searchTreeFocusChanged
        OnFreeNode = searchTreeFreeNode
        OnGetText = searchTreeGetText
        OnPaintText = searchTreePaintText
        OnGetImageIndex = esprecordTreeGetImageIndex
        OnHeaderClick = searchTreeHeaderClick
        OnHeaderDrawQueryElements = esprecordTreeHeaderDrawQueryElements
        OnInitNode = searchTreeInitNode
        OnMouseMove = searchTreeMouseMove
        Touch.InteractiveGestures = [igPan, igPressAndTap]
        Touch.InteractiveGestureOptions = [igoPanSingleFingerHorizontal, igoPanSingleFingerVertical, igoPanInertia, igoPanGutter, igoParentPassthrough]
        Columns = <
          item
            Position = 0
            Text = 'ID'
            Width = 70
          end
          item
            Position = 1
            Text = 'Original'
            Width = 300
          end
          item
            Position = 2
            Text = 'Translated'
            Width = 288
          end
          item
            Alignment = taCenter
            Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coShowDropMark, coVisible, coAllowFocus]
            Position = 3
            Text = '-'
            Width = 28
          end>
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 1227
        Height = 23
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object Panel10: TPanel
          Left = 361
          Top = 0
          Width = 866
          Height = 23
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object ToolBar2: TToolBar
            Left = 0
            Top = 0
            Width = 866
            Height = 29
            Caption = 'ToolBar2'
            HotImages = Form1.ImageList2
            Images = Form1.ImageList1
            TabOrder = 0
            object ToolButton3: TToolButton
              Left = 0
              Top = 0
              Hint = 'Hint_SearchSource'
              Caption = 'ToolButton3'
              Down = True
              Grouped = True
              ImageIndex = 26
              Style = tbsCheck
              OnClick = ToolButton8Click
            end
            object ToolButton8: TToolButton
              Left = 23
              Top = 0
              Hint = 'Hint_SearchDest'
              Caption = 'ToolButton8'
              Grouped = True
              ImageIndex = 25
              Style = tbsCheck
              OnClick = ToolButton8Click
            end
            object ToolButton14: TToolButton
              Left = 46
              Top = 0
              Hint = 'hint_SearchInCurrentModOnly'
              ImageIndex = 2
              Style = tbsCheck
              OnClick = ToolButton8Click
              OnMouseUp = ToolButton14MouseUp
            end
            object ToolButton17: TToolButton
              Left = 69
              Top = 0
              Width = 8
              Caption = 'ToolButton17'
              ImageIndex = 44
              Style = tbsSeparator
            end
            object ToolButton15: TToolButton
              Left = 77
              Top = 0
              Hint = 'Hint_EditSNext'
              Caption = 'ToolButton15'
              ImageIndex = 15
              OnClick = ToolButton15Click
            end
            object ToolButton16: TToolButton
              Left = 100
              Top = 0
              Hint = 'Hint_EditSPrevious'
              Caption = 'ToolButton16'
              ImageIndex = 43
              OnClick = ToolButton16Click
            end
          end
        end
        object Panel11: TPanel
          Left = 0
          Top = 0
          Width = 361
          Height = 23
          Align = alLeft
          BevelOuter = bvNone
          Caption = 'Panel11'
          TabOrder = 1
          object Edit1: TButtonedEdit
            Left = 0
            Top = 0
            Width = 352
            Height = 23
            Align = alLeft
            DoubleBuffered = False
            Images = Form1.ImageList1
            LeftButton.DisabledImageIndex = 13
            LeftButton.HotImageIndex = 13
            LeftButton.ImageIndex = 13
            LeftButton.PressedImageIndex = 13
            LeftButton.Visible = True
            ParentDoubleBuffered = False
            RightButton.ImageIndex = 12
            RightButton.Visible = True
            TabOrder = 0
            OnChange = Edit1Change
            OnLeftButtonClick = Edit1LeftButtonClick
            OnRightButtonClick = Edit1RightButtonClick
            ExplicitHeight = 21
          end
        end
      end
      object Memo3: TSynEdit
        Tag = 2
        Left = 689
        Top = 23
        Width = 538
        Height = 291
        Align = alClient
        ActiveLineColor = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Pitch = fpFixed
        Font.Style = []
        TabOrder = 2
        CodeFolding.GutterShapeSize = 11
        CodeFolding.CollapsedLineColor = clGrayText
        CodeFolding.FolderBarLinesColor = clGrayText
        CodeFolding.IndentGuidesColor = clGray
        CodeFolding.IndentGuides = True
        CodeFolding.ShowCollapsedLine = False
        CodeFolding.ShowHintMark = True
        UseCodeFolding = False
        BookMarkOptions.GlyphsVisible = False
        Gutter.BorderStyle = gbsRight
        Gutter.Color = clWindow
        Gutter.BorderColor = clBtnFace
        Gutter.Font.Charset = DEFAULT_CHARSET
        Gutter.Font.Color = clWindowText
        Gutter.Font.Height = -11
        Gutter.Font.Name = 'Courier New'
        Gutter.Font.Style = []
        Gutter.Width = 20
        Gutter.GradientEndColor = clWindow
        Options = [eoDragDropEditing, eoEnhanceEndKey, eoGroupUndo, eoHideShowScrollbars, eoSmartTabDelete, eoSmartTabs, eoTabsToSpaces]
        ReadOnly = True
        RightEdge = 0
        SearchEngine = SynEditSearch1
        WordWrap = True
        WordWrapGlyph.Visible = False
        OnGutterClick = Memo2GutterClick
        FontSmoothing = fsmNone
        RemovedKeystrokes = <
          item
            Command = ecContextHelp
            ShortCut = 112
          end
          item
            Command = ecDeleteWord
            ShortCut = 16468
          end
          item
            Command = ecGotoMarker0
            ShortCut = 16432
          end
          item
            Command = ecGotoMarker1
            ShortCut = 16433
          end
          item
            Command = ecGotoMarker2
            ShortCut = 16434
          end
          item
            Command = ecGotoMarker3
            ShortCut = 16435
          end
          item
            Command = ecGotoMarker4
            ShortCut = 16436
          end
          item
            Command = ecGotoMarker5
            ShortCut = 16437
          end
          item
            Command = ecGotoMarker6
            ShortCut = 16438
          end
          item
            Command = ecGotoMarker7
            ShortCut = 16439
          end
          item
            Command = ecGotoMarker8
            ShortCut = 16440
          end
          item
            Command = ecGotoMarker9
            ShortCut = 16441
          end
          item
            Command = ecSetMarker0
            ShortCut = 24624
          end
          item
            Command = ecSetMarker1
            ShortCut = 24625
          end
          item
            Command = ecSetMarker2
            ShortCut = 24626
          end
          item
            Command = ecSetMarker3
            ShortCut = 24627
          end
          item
            Command = ecSetMarker4
            ShortCut = 24628
          end
          item
            Command = ecSetMarker5
            ShortCut = 24629
          end
          item
            Command = ecSetMarker6
            ShortCut = 24630
          end
          item
            Command = ecSetMarker7
            ShortCut = 24631
          end
          item
            Command = ecSetMarker8
            ShortCut = 24632
          end
          item
            Command = ecSetMarker9
            ShortCut = 24633
          end>
        AddedKeystrokes = <
          item
            Command = ecUpperCaseBlock
            ShortCut = 116
          end
          item
            Command = ecLowerCaseBlock
            ShortCut = 117
          end
          item
            Command = ecTitleCase
            ShortCut = 118
          end>
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Diff_Viewer'
      object RichEdit3: TRichEdit
        Left = 0
        Top = 0
        Width = 1227
        Height = 314
        Align = alClient
        Color = clSilver
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        HideScrollBars = False
        ParentFont = False
        PopupMenu = PopupMenu3
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Alias_Check'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ImageIndex = 31
      ParentFont = False
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 1227
        Height = 314
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object AliasTree: TVirtualStringTree
          Left = 0
          Top = 0
          Width = 1227
          Height = 314
          Align = alClient
          Header.AutoSizeIndex = 0
          Header.Font.Charset = DEFAULT_CHARSET
          Header.Font.Color = clWindowText
          Header.Font.Height = -11
          Header.Font.Name = 'Tahoma'
          Header.Font.Style = []
          Header.Options = [hoColumnResize, hoDrag, hoOwnerDraw, hoShowSortGlyphs, hoVisible]
          Header.ParentFont = False
          ScrollBarOptions.ScrollBars = ssVertical
          TabOrder = 0
          TreeOptions.PaintOptions = [toHideFocusRect, toShowButtons, toShowDropmark, toShowHorzGridLines, toShowVertGridLines, toThemeAware, toUseBlendedImages, toUseBlendedSelection]
          TreeOptions.SelectionOptions = [toExtendedFocus, toFullRowSelect]
          OnAdvancedHeaderDraw = esprecordTreeAdvancedHeaderDraw
          OnBeforeCellPaint = AliasTreeBeforeCellPaint
          OnFreeNode = AliasTreeFreeNode
          OnGetText = AliasTreeGetText
          OnHeaderDrawQueryElements = esprecordTreeHeaderDrawQueryElements
          OnMouseUp = AliasTreeMouseUp
          Touch.InteractiveGestures = [igPan, igPressAndTap]
          Touch.InteractiveGestureOptions = [igoPanSingleFingerHorizontal, igoPanSingleFingerVertical, igoPanInertia, igoPanGutter, igoParentPassthrough]
          Columns = <
            item
              Position = 0
              Text = 'Alias_Source'
              Width = 220
            end
            item
              Position = 1
              Text = 'Alias_Dest'
              Width = 220
            end>
        end
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'EspCompRes'
      ImageIndex = 31
      object espCompareTree: TVirtualStringTree
        Left = 0
        Top = 0
        Width = 1227
        Height = 314
        Align = alClient
        Colors.SelectionTextColor = clWindowText
        DefaultNodeHeight = 100
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Header.AutoSizeIndex = -1
        Header.Options = [hoAutoResize, hoColumnResize, hoDrag, hoShowSortGlyphs]
        HintMode = hmTooltip
        Images = Form1.ImageList2
        ParentFont = False
        ParentShowHint = False
        SelectionBlendFactor = 40
        ShowHint = True
        TabOrder = 0
        TreeOptions.AutoOptions = [toAutoDropExpand, toAutoScrollOnExpand, toAutoSort, toAutoTristateTracking, toAutoDeleteMovedNodes]
        TreeOptions.MiscOptions = [toAcceptOLEDrop, toFullRepaintOnResize, toInitOnSave, toToggleOnDblClick, toWheelPanning]
        TreeOptions.PaintOptions = [toHideFocusRect, toShowButtons, toShowDropmark, toUseBlendedImages, toUseBlendedSelection]
        TreeOptions.SelectionOptions = [toExtendedFocus, toFullRowSelect]
        OnDblClick = espCompareTreeDblClick
        OnDrawText = esprecordTreeDrawText
        OnFreeNode = espCompareTreeFreeNode
        OnGetText = espCompareTreeGetText
        OnGetImageIndex = espCompareTreeGetImageIndex
        OnInitNode = searchTreeInitNode
        Touch.InteractiveGestures = [igPan, igPressAndTap]
        Touch.InteractiveGestureOptions = [igoPanSingleFingerHorizontal, igoPanSingleFingerVertical, igoPanInertia, igoPanGutter, igoParentPassthrough]
        Columns = <
          item
            Position = 0
            Width = 1227
          end>
      end
    end
    object TabSheet6: TTabSheet
      Caption = 'Dialogs'
      ImageIndex = 31
      object Splitter4: TSplitter
        Left = 232
        Top = 21
        Width = 5
        Height = 249
        AutoSnap = False
        MinSize = 50
        ExplicitLeft = 191
        ExplicitTop = 23
        ExplicitHeight = 268
      end
      object DialogTree: TVirtualStringTree
        Left = 237
        Top = 21
        Width = 990
        Height = 249
        Align = alClient
        ButtonStyle = bsTriangle
        Colors.SelectionTextColor = clWindowText
        DefaultNodeHeight = 100
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Header.AutoSizeIndex = 2
        Header.MainColumn = 1
        Header.Options = [hoAutoResize, hoColumnResize, hoDrag, hoOwnerDraw, hoShowSortGlyphs, hoVisible]
        Images = Form1.ImageList2
        ParentFont = False
        ParentShowHint = False
        PopupMenu = PopupMenu4
        SelectionBlendFactor = 40
        ShowHint = True
        TabOrder = 0
        TreeOptions.AutoOptions = [toAutoDropExpand, toAutoScrollOnExpand, toAutoSort, toAutoTristateTracking, toAutoDeleteMovedNodes]
        TreeOptions.MiscOptions = [toAcceptOLEDrop, toFullRepaintOnResize, toInitOnSave, toToggleOnDblClick, toWheelPanning]
        TreeOptions.PaintOptions = [toHideFocusRect, toShowButtons, toShowDropmark, toThemeAware, toUseBlendedImages, toUseBlendedSelection]
        TreeOptions.SelectionOptions = [toExtendedFocus, toFullRowSelect, toMultiSelect]
        OnAdvancedHeaderDraw = esprecordTreeAdvancedHeaderDraw
        OnBeforeCellPaint = esprecordTreeBeforeCellPaint
        OnDblClick = esprecordTreeDblClick
        OnDrawText = esprecordTreeDrawText
        OnFocusChanged = DialogTreeFocusChanged
        OnFreeNode = searchTreeFreeNode
        OnGetText = searchTreeGetText
        OnPaintText = searchTreePaintText
        OnGetImageIndex = esprecordTreeGetImageIndex
        OnHeaderDrawQueryElements = esprecordTreeHeaderDrawQueryElements
        OnInitNode = searchTreeInitNode
        OnMouseMove = searchTreeMouseMove
        Touch.InteractiveGestures = [igPan, igPressAndTap]
        Touch.InteractiveGestureOptions = [igoPanSingleFingerHorizontal, igoPanSingleFingerVertical, igoPanInertia, igoPanGutter, igoParentPassthrough]
        Columns = <
          item
            Position = 2
            Text = 'ID'
            Width = 70
          end
          item
            Position = 3
            Text = 'Original'
            Width = 300
          end
          item
            Position = 4
            Text = 'Translated'
            Width = 516
          end
          item
            Position = 5
            Text = 'LD'
          end
          item
            Position = 1
            Text = 'EDID'
          end
          item
            Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coAllowFocus]
            Position = 0
          end>
      end
      object Panel12: TPanel
        Left = 0
        Top = 270
        Width = 1227
        Height = 44
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        ExplicitTop = 269
        ExplicitWidth = 1223
        object Edit4: TEdit
          Left = 0
          Top = 0
          Width = 1227
          Height = 22
          Align = alTop
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          ExplicitWidth = 1223
        end
        object Panel13: TPanel
          Left = 0
          Top = 22
          Width = 1227
          Height = 22
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          ExplicitWidth = 1223
          object ComboBox1: TComboBox
            Left = 0
            Top = 0
            Width = 1129
            Height = 22
            Align = alClient
            Style = csDropDownList
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            ExplicitWidth = 1125
          end
          object Panel14: TPanel
            Left = 1129
            Top = 0
            Width = 98
            Height = 22
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 1
            ExplicitLeft = 1125
            object ToolBar3: TToolBar
              Left = 0
              Top = 0
              Width = 98
              Height = 22
              Align = alClient
              ButtonWidth = 48
              Caption = 'ToolBar3'
              HotImages = Form1.ImageList2
              Images = Form1.ImageList1
              TabOrder = 0
              object ToolButton9: TToolButton
                Left = 0
                Top = 0
                Hint = 'hint_playFuz'
                Caption = 'ToolButton9'
                ImageIndex = 62
                OnClick = ToolButton9Click
              end
              object ToolButton13: TToolButton
                Left = 48
                Top = 0
                Hint = 'hint_FuzClipboard'
                Caption = 'ToolButton13'
                ImageIndex = 54
                OnClick = ToolButton13Click
              end
            end
          end
        end
      end
      object Panel15: TPanel
        Left = 0
        Top = 21
        Width = 232
        Height = 249
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 2
        ExplicitHeight = 248
        object Splitter5: TSplitter
          Left = 0
          Top = 155
          Width = 232
          Height = 5
          Cursor = crVSplit
          Align = alBottom
          AutoSnap = False
          ExplicitTop = 221
          ExplicitWidth = 185
        end
        object ListBox2: TListBox
          Left = 0
          Top = 0
          Width = 232
          Height = 155
          Style = lbOwnerDrawFixed
          Align = alClient
          DragMode = dmAutomatic
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ItemHeight = 18
          MultiSelect = True
          ParentFont = False
          PopupMenu = PopupMenu5
          TabOrder = 0
          OnDblClick = ListBox2DblClick
          OnDrawItem = ListBox2DrawItem
          ExplicitHeight = 154
        end
        object ListBox3: TListBox
          Left = 0
          Top = 160
          Width = 232
          Height = 89
          Style = lbOwnerDrawFixed
          Align = alBottom
          DragMode = dmAutomatic
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ItemHeight = 18
          MultiSelect = True
          ParentFont = False
          TabOrder = 1
          OnDrawItem = ListBox3DrawItem
          ExplicitTop = 159
        end
      end
      object Panel21: TPanel
        Left = 0
        Top = 0
        Width = 1227
        Height = 21
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 3
        ExplicitWidth = 1223
        object Edit3: TEdit
          Left = 0
          Top = 0
          Width = 1227
          Height = 21
          Align = alClient
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          ExplicitWidth = 1223
          ExplicitHeight = 23
        end
      end
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 351
    Width = 1229
    Height = 328
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = 350
    ExplicitWidth = 1225
    object Panel3: TPanel
      Left = 0
      Top = 292
      Width = 1229
      Height = 36
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitWidth = 1225
      object Panel8: TPanel
        Left = 856
        Top = 0
        Width = 373
        Height = 36
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitLeft = 852
        DesignSize = (
          373
          36)
        object Label1: TLabel
          Left = 119
          Top = 6
          Width = 55
          Height = 13
          Alignment = taRightJustify
          Caption = 'count 0/0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 154
          Top = 20
          Width = 19
          Height = 11
          Alignment = taRightJustify
          Caption = 'sel 0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Button2: TButton
          Left = 179
          Top = 6
          Width = 79
          Height = 27
          Anchors = [akRight, akBottom]
          Cancel = True
          Caption = 'Cancel'
          TabOrder = 1
          OnClick = Button2Click
        end
        object Button1: TButton
          Left = 264
          Top = 6
          Width = 109
          Height = 27
          Anchors = [akRight, akBottom]
          Caption = 'Ok_(Ctrl-Enter)'
          TabOrder = 0
          OnClick = Button1Click
        end
      end
      object Panel19: TPanel
        Left = 0
        Top = 0
        Width = 233
        Height = 36
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 1
        object ConfirmChange: TCheckBox
          Left = 4
          Top = 10
          Width = 18
          Height = 17
          TabOrder = 0
          OnClick = ConfirmChangeClick
        end
        object StaticText2: TStaticText
          Left = 28
          Top = 12
          Width = 89
          Height = 17
          Caption = 'Lbl_confirm_Chg2'
          TabOrder = 1
        end
      end
      object Panel20: TPanel
        Left = 233
        Top = 0
        Width = 623
        Height = 36
        Align = alClient
        BevelOuter = bvNone
        BorderWidth = 10
        TabOrder = 2
        ExplicitWidth = 619
        object StaticText1: TStaticText
          Left = 10
          Top = 10
          Width = 603
          Height = 16
          Align = alClient
          Alignment = taCenter
          Caption = 'Lbl_EditInfo'
          TabOrder = 0
          ExplicitWidth = 599
        end
      end
    end
    object Panel4: TPanel
      Left = 0
      Top = 0
      Width = 1229
      Height = 292
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitWidth = 1225
      object Splitter1: TSplitter
        Left = 289
        Top = 0
        Width = 2
        Height = 292
        AutoSnap = False
        Color = clBtnFace
        MinSize = 200
        ParentColor = False
        ResizeStyle = rsUpdate
      end
      object Panel7: TPanel
        Left = 0
        Top = 0
        Width = 289
        Height = 292
        Align = alLeft
        BevelOuter = bvNone
        BorderWidth = 2
        Caption = 'Panel5'
        TabOrder = 0
        object Memo1: TSynEdit
          Left = 2
          Top = 2
          Width = 285
          Height = 252
          Align = alClient
          ActiveLineColor = clInfoBk
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Pitch = fpFixed
          Font.Style = []
          PopupMenu = PopupMenu1
          TabOrder = 0
          OnMouseUp = memo1MouseUp
          CodeFolding.GutterShapeSize = 11
          CodeFolding.CollapsedLineColor = clGrayText
          CodeFolding.FolderBarLinesColor = clGrayText
          CodeFolding.IndentGuidesColor = clGray
          CodeFolding.IndentGuides = True
          CodeFolding.ShowCollapsedLine = False
          CodeFolding.ShowHintMark = True
          UseCodeFolding = False
          BookMarkOptions.GlyphsVisible = False
          Gutter.BorderStyle = gbsRight
          Gutter.Color = clWindow
          Gutter.BorderColor = clBtnFace
          Gutter.DigitCount = 3
          Gutter.Font.Charset = ANSI_CHARSET
          Gutter.Font.Color = clWindowText
          Gutter.Font.Height = -11
          Gutter.Font.Name = 'Courier New'
          Gutter.Font.Style = []
          Gutter.ShowLineNumbers = True
          Gutter.Width = 20
          Options = [eoDragDropEditing, eoEnhanceEndKey, eoGroupUndo, eoHideShowScrollbars, eoSmartTabDelete, eoSmartTabs, eoTabIndent]
          ReadOnly = True
          RightEdge = 0
          SearchEngine = SynEditSearch1
          WordWrap = True
          WordWrapGlyph.Visible = False
          OnGutterClick = Memo1GutterClick
          OnGutterGetText = Memo2GutterGetText
          FontSmoothing = fsmNone
          RemovedKeystrokes = <
            item
              Command = ecContextHelp
              ShortCut = 112
            end
            item
              Command = ecGotoMarker0
              ShortCut = 16432
            end
            item
              Command = ecGotoMarker1
              ShortCut = 16433
            end
            item
              Command = ecGotoMarker2
              ShortCut = 16434
            end
            item
              Command = ecGotoMarker3
              ShortCut = 16435
            end
            item
              Command = ecGotoMarker4
              ShortCut = 16436
            end
            item
              Command = ecGotoMarker5
              ShortCut = 16437
            end
            item
              Command = ecGotoMarker6
              ShortCut = 16438
            end
            item
              Command = ecGotoMarker7
              ShortCut = 16439
            end
            item
              Command = ecGotoMarker8
              ShortCut = 16440
            end
            item
              Command = ecGotoMarker9
              ShortCut = 16441
            end
            item
              Command = ecSetMarker0
              ShortCut = 24624
            end
            item
              Command = ecSetMarker1
              ShortCut = 24625
            end
            item
              Command = ecSetMarker2
              ShortCut = 24626
            end
            item
              Command = ecSetMarker3
              ShortCut = 24627
            end
            item
              Command = ecSetMarker4
              ShortCut = 24628
            end
            item
              Command = ecSetMarker5
              ShortCut = 24629
            end
            item
              Command = ecSetMarker6
              ShortCut = 24630
            end
            item
              Command = ecSetMarker7
              ShortCut = 24631
            end
            item
              Command = ecSetMarker8
              ShortCut = 24632
            end
            item
              Command = ecSetMarker9
              ShortCut = 24633
            end>
          AddedKeystrokes = <>
        end
        object Memo5: TRichEdit
          Left = 2
          Top = 254
          Width = 285
          Height = 36
          Align = alBottom
          BorderWidth = 5
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          PlainText = True
          PopupMenu = PopupMenu1
          ScrollBars = ssVertical
          TabOrder = 1
          Visible = False
        end
      end
      object Panel16: TPanel
        Left = 291
        Top = 0
        Width = 938
        Height = 292
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        ExplicitWidth = 934
        object Panel5: TPanel
          Left = 0
          Top = 0
          Width = 938
          Height = 270
          Align = alClient
          BevelOuter = bvNone
          BorderWidth = 2
          TabOrder = 0
          ExplicitWidth = 934
          object ToolBar1: TToolBar
            Left = 2
            Top = 2
            Width = 26
            Height = 266
            Align = alLeft
            ButtonHeight = 24
            ButtonWidth = 24
            Caption = 'ToolBar1'
            HotImages = Form1.ImageList2
            Images = Form1.ImageList1
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            object ToolButton12: TToolButton
              Left = 0
              Top = 0
              Hint = 'Hint_SpellCheck'
              Caption = 'ToolButton12'
              ImageIndex = 56
              Wrap = True
              OnClick = ToolButton12Click
            end
            object ToolButton1: TToolButton
              Left = 0
              Top = 24
              Hint = 'Hint_EditSearch'
              Caption = 'ToolButton1'
              ImageIndex = 13
              Wrap = True
              OnClick = ToolButton1Click
            end
            object ToolButton2: TToolButton
              Left = 0
              Top = 48
              Hint = 'Hint_EditSNext'
              Caption = 'ToolButton2'
              ImageIndex = 15
              Wrap = True
              OnClick = ToolButton2Click
            end
            object ToolButton4: TToolButton
              Left = 0
              Top = 72
              Hint = 'Hint_EditSPrevious'
              Caption = 'ToolButton4'
              ImageIndex = 43
              Wrap = True
              OnClick = ToolButton4Click
            end
            object ToolButton5: TToolButton
              Left = 0
              Top = 96
              Hint = 'Hint_Uppercase'
              Caption = 'ToolButton5'
              ImageIndex = 44
              Wrap = True
              OnClick = ToolButton5Click
            end
            object ToolButton6: TToolButton
              Left = 0
              Top = 120
              Hint = 'Hint_LowerCase'
              Caption = 'ToolButton6'
              ImageIndex = 45
              Wrap = True
              OnClick = ToolButton6Click
            end
            object ToolButton7: TToolButton
              Left = 0
              Top = 144
              Hint = 'Hint_TitleCase'
              Caption = 'ToolButton7'
              ImageIndex = 46
              Wrap = True
              OnClick = ToolButton7Click
            end
            object ToolButton10: TToolButton
              Left = 0
              Top = 168
              Hint = 'hint_autotrim'
              Caption = 'ToolButton10'
              ImageIndex = 47
              Wrap = True
              Style = tbsCheck
            end
            object ToolButton11: TToolButton
              Left = 0
              Top = 192
              Hint = 'hint_noReplace'
              Caption = 'ToolButton11'
              Down = True
              ImageIndex = 53
              Style = tbsCheck
              OnClick = ToolButton11Click
            end
          end
          object Panel9: TPanel
            Left = 28
            Top = 2
            Width = 908
            Height = 266
            Align = alClient
            BevelOuter = bvNone
            ParentBackground = False
            TabOrder = 1
            ExplicitWidth = 904
            object Memo2: TSynEdit
              Tag = 1
              Left = 0
              Top = 0
              Width = 908
              Height = 208
              Align = alClient
              ActiveLineColor = clInfoBk
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Courier New'
              Font.Pitch = fpFixed
              Font.Style = []
              PopupMenu = PopupMenu1
              TabOrder = 0
              OnMouseUp = Memo2MouseUp
              CodeFolding.GutterShapeSize = 11
              CodeFolding.CollapsedLineColor = clGrayText
              CodeFolding.FolderBarLinesColor = clGrayText
              CodeFolding.IndentGuidesColor = clGray
              CodeFolding.IndentGuides = True
              CodeFolding.ShowCollapsedLine = False
              CodeFolding.ShowHintMark = True
              UseCodeFolding = False
              BookMarkOptions.GlyphsVisible = False
              BorderStyle = bsNone
              Gutter.BorderStyle = gbsRight
              Gutter.Color = clWindow
              Gutter.BorderColor = clBtnFace
              Gutter.DigitCount = 3
              Gutter.Font.Charset = DEFAULT_CHARSET
              Gutter.Font.Color = clWindowText
              Gutter.Font.Height = -9
              Gutter.Font.Name = 'Courier New'
              Gutter.Font.Style = []
              Gutter.ShowLineNumbers = True
              Gutter.Width = 20
              Gutter.GradientEndColor = clWindow
              Options = [eoDragDropEditing, eoEnhanceEndKey, eoGroupUndo, eoHideShowScrollbars, eoSmartTabDelete, eoSmartTabs, eoTabIndent]
              RightEdge = 0
              SearchEngine = SynEditSearch1
              WantTabs = True
              WordWrap = True
              WordWrapGlyph.Visible = False
              OnChange = memo2Change
              OnGutterClick = Memo2GutterClick
              OnGutterGetText = Memo2GutterGetText
              OnStatusChange = Memo2StatusChange
              OnPaintTransient = Memo2PaintTransient
              FontSmoothing = fsmNone
              ExplicitWidth = 904
              RemovedKeystrokes = <
                item
                  Command = ecContextHelp
                  ShortCut = 112
                end
                item
                  Command = ecDeleteWord
                  ShortCut = 16468
                end
                item
                  Command = ecGotoMarker0
                  ShortCut = 16432
                end
                item
                  Command = ecGotoMarker1
                  ShortCut = 16433
                end
                item
                  Command = ecGotoMarker2
                  ShortCut = 16434
                end
                item
                  Command = ecGotoMarker3
                  ShortCut = 16435
                end
                item
                  Command = ecGotoMarker4
                  ShortCut = 16436
                end
                item
                  Command = ecGotoMarker5
                  ShortCut = 16437
                end
                item
                  Command = ecGotoMarker6
                  ShortCut = 16438
                end
                item
                  Command = ecGotoMarker7
                  ShortCut = 16439
                end
                item
                  Command = ecGotoMarker8
                  ShortCut = 16440
                end
                item
                  Command = ecGotoMarker9
                  ShortCut = 16441
                end
                item
                  Command = ecSetMarker0
                  ShortCut = 24624
                end
                item
                  Command = ecSetMarker1
                  ShortCut = 24625
                end
                item
                  Command = ecSetMarker2
                  ShortCut = 24626
                end
                item
                  Command = ecSetMarker3
                  ShortCut = 24627
                end
                item
                  Command = ecSetMarker4
                  ShortCut = 24628
                end
                item
                  Command = ecSetMarker5
                  ShortCut = 24629
                end
                item
                  Command = ecSetMarker6
                  ShortCut = 24630
                end
                item
                  Command = ecSetMarker7
                  ShortCut = 24631
                end
                item
                  Command = ecSetMarker8
                  ShortCut = 24632
                end
                item
                  Command = ecSetMarker9
                  ShortCut = 24633
                end>
              AddedKeystrokes = <
                item
                  Command = ecUpperCaseBlock
                  ShortCut = 116
                end
                item
                  Command = ecLowerCaseBlock
                  ShortCut = 117
                end
                item
                  Command = ecTitleCase
                  ShortCut = 118
                end>
            end
            object ListBox1: TListBox
              Left = 0
              Top = 244
              Width = 908
              Height = 22
              TabStop = False
              Style = lbOwnerDrawFixed
              AutoComplete = False
              Align = alBottom
              BorderStyle = bsNone
              Columns = 6
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Courier New'
              Font.Style = []
              ItemHeight = 22
              ParentFont = False
              ScrollWidth = 1000
              TabOrder = 1
              OnClick = ListBox1Click
              OnDrawItem = ListBox1DrawItem
              ExplicitWidth = 904
            end
            object Memo4: TRichEdit
              Left = 0
              Top = 208
              Width = 908
              Height = 36
              Align = alBottom
              BorderStyle = bsNone
              BorderWidth = 5
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              PlainText = True
              PopupMenu = PopupMenu1
              ScrollBars = ssVertical
              TabOrder = 2
              Visible = False
              OnChange = Memo4Change
              OnSelectionChange = Memo4SelectionChange
              ExplicitWidth = 904
            end
          end
        end
        object Panel17: TPanel
          Left = 0
          Top = 270
          Width = 938
          Height = 22
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 1
          ExplicitWidth = 934
          object ComboBox2: TComboBox
            AlignWithMargins = True
            Left = 529
            Top = 1
            Width = 192
            Height = 21
            Hint = 'Hint_Use_WebApi'
            Margins.Left = 0
            Margins.Top = 1
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alRight
            Style = csDropDownList
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            OnChange = ComboBox2Change
            ExplicitLeft = 525
          end
          object Button3: TButton
            Left = 721
            Top = 0
            Width = 217
            Height = 22
            Hint = 'Hint_Use_WebApi'
            Align = alRight
            Caption = 'but_ApiTranslation'
            ImageIndex = 71
            ImageMargins.Left = 10
            Images = Form1.ImageList1
            TabOrder = 1
            OnClick = Button3Click
            ExplicitLeft = 717
          end
          object Panel18: TPanel
            Left = 0
            Top = 0
            Width = 529
            Height = 22
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 2
            OnClick = Panel18Click
            OnMouseEnter = Panel18MouseEnter
            OnMouseLeave = Panel18MouseLeave
            ExplicitWidth = 525
          end
        end
      end
    end
  end
  object PopupMenu1: TPopupMenu
    BiDiMode = bdLeftToRight
    Images = Form1.ImageList1
    ParentBiDiMode = False
    OnPopup = PopupMenu1Popup
    Left = 496
    Top = 416
    object N2: TMenuItem
      Caption = '-'
    end
    object IgnoreMenu: TMenuItem
      Caption = 'Ignore%s'
      ImageIndex = 12
      OnClick = IgnoreMenuClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object SynCopy: TMenuItem
      Caption = 'Menu_Copy2'
      ImageIndex = 54
      OnClick = SynCopyClick
    end
    object SynPaste: TMenuItem
      Caption = 'Menu_Paste2'
      ImageIndex = 54
      OnClick = SynPasteClick
    end
    object N7: TMenuItem
      Caption = '-'
    end
    object ValidethisTranslation1: TMenuItem
      Caption = 'Menu_Validate3'
      ImageIndex = 36
      ShortCut = 112
      OnClick = ValidethisTranslation1Click
    end
    object MenuPartial22: TMenuItem
      Caption = 'Menu_Partial2'
      ImageIndex = 37
      ShortCut = 113
      OnClick = MenuPartial22Click
    end
    object MenuLocked2: TMenuItem
      Caption = 'Menu_Locked'
      ImageIndex = 16
      ShortCut = 114
      OnClick = MenuLocked2Click
    end
    object Menu_CopySource: TMenuItem
      Caption = 'Menu_CopySource'
      ImageIndex = 39
      ShortCut = 115
      OnClick = Menu_CopySourceClick
    end
    object Restore1: TMenuItem
      Caption = 'Menu_RestoreStr'
      ImageIndex = 55
      ShortCut = 16499
      OnClick = Restore1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object MenuDisplay1: TMenuItem
      Caption = 'MenuDisplay'
      ImageIndex = 46
      object ShowSpecialChar1: TMenuItem
        Caption = 'Menu_SpChar'
        ImageIndex = 7
        OnClick = ShowSpecialChar1Click
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object Zoom1: TMenuItem
        Tag = 1
        Caption = 'Zoom+'
        ImageIndex = 23
        OnClick = Zoom1Click
      end
      object Zoom2: TMenuItem
        Tag = -1
        Caption = 'Zoom-'
        ImageIndex = 24
        OnClick = Zoom1Click
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object ZoomDefault1: TMenuItem
        Caption = 'ZoomDefault'
        ImageIndex = 12
        OnClick = Zoom1Click
      end
    end
  end
  object PopupMenu2: TPopupMenu
    Images = Form1.ImageList1
    Left = 672
    Top = 400
    object Usethistranslation1: TMenuItem
      Caption = 'Menu_UseTrans'
      ImageIndex = 36
      OnClick = Usethistranslation1Click
    end
  end
  object PopupMenu3: TPopupMenu
    Images = Form1.ImageList1
    Left = 744
    Top = 408
    object InvertSourceDest1: TMenuItem
      Caption = 'Menu_InvertDiff'
      Checked = True
      ImageIndex = 43
      OnClick = InvertSourceDest1Click
    end
  end
  object SynEditSearch1: TSynEditSearch
    Left = 384
    Top = 368
  end
  object FontDialog1: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [fdEffects, fdFixedPitchOnly, fdForceFontExist]
    Left = 848
    Top = 184
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 250
    OnTimer = Timer1Timer
    Left = 848
    Top = 232
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 500
    OnTimer = Timer2Timer
    Left = 848
    Top = 136
  end
  object PopupMenu4: TPopupMenu
    Images = Form1.ImageList1
    OnPopup = PopupMenu4Popup
    Left = 560
    Top = 160
    object MenuValidate31: TMenuItem
      Caption = 'Menu_Validate3'
      ImageIndex = 36
      ShortCut = 112
      OnClick = MenuValidate31Click
    end
    object MenuPartial21: TMenuItem
      Caption = 'Menu_Partial2'
      ImageIndex = 37
      ShortCut = 113
      OnClick = MenuPartial21Click
    end
    object MenuLocked1: TMenuItem
      Caption = 'Menu_Locked'
      ImageIndex = 16
      ShortCut = 114
      OnClick = MenuLocked1Click
    end
    object MenuCancel21: TMenuItem
      Caption = 'Menu_Cancel2'
      ImageIndex = 39
      ShortCut = 115
      OnClick = MenuCancel21Click
    end
    object MenuCopy1: TMenuItem
      Caption = 'Menu_Copy'
      ImageIndex = 41
      ShortCut = 16451
      OnClick = MenuCopy1Click
    end
    object MenuPaste1: TMenuItem
      Caption = 'Menu_Paste'
      ImageIndex = 55
      ShortCut = 16470
      OnClick = MenuPaste1Click
    end
    object MenuFixAlias21: TMenuItem
      Caption = 'Menu_FixAlias2'
      ImageIndex = 18
      OnClick = MenuFixAlias21Click
    end
    object MenuFixNumber1: TMenuItem
      Caption = 'Menu_FixNumber'
      ImageIndex = 7
      OnClick = MenuFixNumber1Click
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object MenuColab1: TMenuItem
      Caption = 'Menu_Colab'
      ImageIndex = 67
      ShortCut = 120
      OnClick = MenuColab1Click
    end
    object MenuColabReset1: TMenuItem
      Tag = 1
      Caption = 'Menu_ColabReset'
      ImageIndex = 67
      ShortCut = 121
      OnClick = MenuColab1Click
    end
  end
  object PopupMenu5: TPopupMenu
    Images = Form1.ImageList1
    Left = 448
    Top = 160
    object MenuColab2: TMenuItem
      Caption = 'Menu_Colab'
      ImageIndex = 67
      ShortCut = 120
      OnClick = MenuColab2Click
    end
    object MenuColabReset2: TMenuItem
      Tag = 1
      Caption = 'Menu_ColabReset'
      ImageIndex = 67
      ShortCut = 121
      OnClick = MenuColab2Click
    end
  end
  object Timer3: TTimer
    Enabled = False
    Interval = 250
    OnTimer = Timer3Timer
    Left = 912
    Top = 184
  end
  object ActionList1: TActionList
    Left = 576
    Top = 496
    object launchTranslation: TAction
      ShortCut = 16500
      OnExecute = launchTranslationExecute
    end
  end
  object Timer4: TTimer
    Enabled = False
    OnTimer = Timer4Timer
    Left = 940
    Top = 284
  end
  object Timer5: TTimer
    Enabled = False
    OnTimer = Timer5Timer
    Left = 980
    Top = 292
  end
end
