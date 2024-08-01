object Form1: TForm1
  Left = 511
  Top = 0
  Caption = 'xTranslator'
  ClientHeight = 674
  ClientWidth = 1256
  Color = clBtnFace
  Constraints.MinHeight = 480
  Constraints.MinWidth = 600
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  Position = poDesigned
  OnActivate = FormActivate
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDeactivate = FormDeactivate
  OnHelp = FormHelp
  OnKeyDown = FormKeyDown
  OnResize = FormResize
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 307
    Width = 1256
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    AutoSnap = False
    MinSize = 100
    ResizeStyle = rsUpdate
    ExplicitTop = 267
    ExplicitWidth = 1106
  end
  object ProgressBar1: TProgressBar
    Left = 1001
    Top = 38
    Width = 33
    Height = 16
    DoubleBuffered = False
    ParentDoubleBuffered = False
    MarqueeInterval = 0
    Step = 20
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 1256
    Height = 30
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitWidth = 1252
    object Splitter3: TSplitter
      Left = 240
      Top = 0
      Height = 30
      AutoSnap = False
      Beveled = True
      MinSize = 80
      ResizeStyle = rsUpdate
      ExplicitLeft = 244
    end
    object Panel1: TPanel
      AlignWithMargins = True
      Left = 57
      Top = 1
      Width = 180
      Height = 29
      Margins.Top = 1
      Margins.Bottom = 0
      Align = alLeft
      BevelOuter = bvNone
      Padding.Top = 3
      Padding.Right = 3
      Padding.Bottom = 6
      TabOrder = 0
      object ButtonedEdit1: TButtonedEdit
        Left = 0
        Top = 3
        Width = 177
        Height = 20
        Hint = 'hint_SearchFieldInfo'
        Align = alClient
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvNone
        DoubleBuffered = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Images = ImageList1
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
        StyleElements = []
        OnChange = ButtonedEdit1Change
        OnLeftButtonClick = ButtonedEdit1LeftButtonClick
        OnRightButtonClick = ButtonedEdit1RightButtonClick
        ExplicitHeight = 22
      end
    end
    object Panel3: TPanel
      AlignWithMargins = True
      Left = 246
      Top = 3
      Width = 508
      Height = 24
      Margins.Right = 0
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 1
      object ToolBar1: TToolBar
        Left = 0
        Top = 0
        Width = 508
        Height = 24
        Align = alClient
        Caption = 'ToolBar1'
        DoubleBuffered = True
        EdgeInner = esNone
        EdgeOuter = esNone
        HotImages = ImageList2
        HotTrackColor = clActiveCaption
        Images = ImageList1
        ParentDoubleBuffered = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Transparent = True
        object ToolButton1: TToolButton
          Left = 0
          Top = 0
          Hint = 'Hint_SearchSource'
          Caption = 'ToolButton1'
          DropdownMenu = SearchMenu
          ImageIndex = 26
          Style = tbsDropDown
          OnClick = ToolButton1Click
        end
        object ToolButton20: TToolButton
          Left = 38
          Top = 0
          Width = 8
          Caption = 'ToolButton20'
          ImageIndex = 58
          Style = tbsSeparator
        end
        object ToolButton2: TToolButton
          Left = 46
          Top = 0
          Hint = 'hint_colabFilter'
          Caption = 'ToolButton2'
          ImageIndex = 67
          Style = tbsCheck
          OnMouseUp = ToolButton2MouseUp
        end
        object ToolButton3: TToolButton
          Left = 69
          Top = 0
          Width = 8
          Caption = 'ToolButton3'
          Down = True
          ImageIndex = 2
          Style = tbsSeparator
        end
        object ToolButton4: TToolButton
          Tag = 1
          Left = 77
          Top = 0
          Hint = 'Hint_SearchTrans'
          Caption = 'Trans.'
          Down = True
          ImageIndex = 38
          Style = tbsCheck
          OnMouseUp = ToolButton4MouseUp
        end
        object ToolButton5: TToolButton
          Tag = 2
          Left = 100
          Top = 0
          Hint = 'Hint_SearchNoTrans'
          Caption = 'Not.Trans'
          Down = True
          ImageIndex = 39
          Style = tbsCheck
          OnMouseUp = ToolButton4MouseUp
        end
        object ToolButton7: TToolButton
          Tag = 3
          Left = 123
          Top = 0
          Hint = 'Hint_SearchVal'
          Caption = 'Validated'
          Down = True
          ImageIndex = 36
          Style = tbsCheck
          OnMouseUp = ToolButton4MouseUp
        end
        object ToolButton6: TToolButton
          Tag = 4
          Left = 146
          Top = 0
          Hint = 'Hint_SearchPart'
          Caption = 'Partial'
          Down = True
          ImageIndex = 37
          Style = tbsCheck
          OnMouseUp = ToolButton4MouseUp
        end
        object ToolButton8: TToolButton
          Tag = 5
          Left = 169
          Top = 0
          Hint = 'Hint_SearchLD'
          Caption = 'LD'
          Down = True
          ImageIndex = 29
          Style = tbsCheck
          OnMouseUp = ToolButton4MouseUp
        end
        object ToolButton9: TToolButton
          Tag = 6
          Left = 192
          Top = 0
          Hint = 'Hint_SearchLocked'
          Caption = 'Alias'
          Down = True
          ImageIndex = 16
          Style = tbsCheck
          OnMouseUp = ToolButton4MouseUp
        end
        object ToolButton15: TToolButton
          Tag = 7
          Left = 215
          Top = 0
          Hint = 'Hint_SearchDupli'
          Caption = 'ToolButton15'
          Down = True
          ImageIndex = 13
          Style = tbsCheck
          OnMouseUp = ToolButton4MouseUp
        end
        object ToolButton44: TToolButton
          Left = 238
          Top = 0
          Width = 8
          Caption = 'ToolButton44'
          ImageIndex = 58
          Style = tbsSeparator
        end
        object ToolButton27: TToolButton
          Left = 246
          Top = 0
          Hint = 'Hint_ShowNull'
          Caption = 'ToolButton27'
          ImageIndex = 47
          Style = tbsCheck
          OnClick = ToolButton27Click
        end
        object ToolButton22: TToolButton
          Left = 269
          Top = 0
          Width = 8
          Caption = 'ToolButton22'
          ImageIndex = 62
          Style = tbsSeparator
        end
        object ToolButton42: TToolButton
          Left = 277
          Top = 0
          Hint = 'Hint_SearchSp2'
          Caption = 'ToolButton42'
          ImageIndex = 56
          Style = tbsCheck
          OnMouseUp = ToolButton48MouseUp
        end
        object ToolButton57: TToolButton
          Left = 300
          Top = 0
          Hint = 'Hint_SearchVMAD2'
          Caption = 'ToolButton57'
          ImageIndex = 17
          Style = tbsCheck
          OnMouseUp = ToolButton48MouseUp
        end
        object ToolButton12: TToolButton
          Left = 323
          Top = 0
          Hint = 'Hint_SearchWarn3'
          Caption = 'ToolButton12'
          ImageIndex = 58
          PopupMenu = PopupWarning
          Style = tbsCheck
          OnMouseUp = ToolButton12MouseUp
        end
        object ToolButton26: TToolButton
          Left = 346
          Top = 0
          Hint = 'hint_filterVoice'
          Caption = 'ToolButton26'
          ImageIndex = 59
          Style = tbsCheck
          OnMouseUp = ToolButton26MouseUp
        end
        object ToolButton48: TToolButton
          Left = 369
          Top = 0
          Hint = 'hint_NpcMapFilter2'
          Caption = 'ToolButton48'
          ImageIndex = 72
          Style = tbsCheck
          OnMouseUp = ToolButton48MouseUp
        end
        object ToolButton23: TToolButton
          Left = 392
          Top = 0
          Width = 8
          Caption = 'ToolButton23'
          ImageIndex = 63
          Style = tbsSeparator
        end
        object ToolButton56: TToolButton
          Left = 400
          Top = 0
          Hint = 'Hint_ResetRecordFilter'
          Caption = 'ToolButton56'
          ImageIndex = 68
          OnClick = ToolButton56Click
        end
        object ToolButton10: TToolButton
          Left = 423
          Top = 0
          Hint = 'Hint_ResetAllFilters'
          Caption = 'ToolButton10'
          ImageIndex = 12
          OnClick = ToolButton10Click
        end
        object ToolButton14: TToolButton
          Left = 446
          Top = 0
          Width = 8
          Caption = 'ToolButton14'
          ImageIndex = 62
          Style = tbsSeparator
        end
        object ToolButton19: TToolButton
          Left = 454
          Top = 0
          Hint = 'hint_UseSingleList'
          Caption = 'ToolButton19'
          ImageIndex = 61
          Style = tbsCheck
          OnClick = ToolButton19Click
        end
        object ToolButton45: TToolButton
          Left = 477
          Top = 0
          Hint = 'Hint_LoadAllMaster'
          Caption = 'ToolButton45'
          ImageIndex = 78
          OnClick = ToolButton46Click
        end
        object ToolButton29: TToolButton
          Left = 500
          Top = 0
          Width = 8
          Caption = 'ToolButton29'
          ImageIndex = 62
          Style = tbsSeparator
        end
      end
    end
    object Panel12: TPanel
      Left = 952
      Top = 0
      Width = 304
      Height = 30
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      ExplicitWidth = 300
      object ComboBox1: TComboBox
        AlignWithMargins = True
        Left = 63
        Top = 3
        Width = 238
        Height = 21
        Hint = 'hint_loadedModeList'
        Align = alClient
        AutoComplete = False
        AutoDropDown = True
        Style = csDropDownList
        BiDiMode = bdLeftToRight
        DoubleBuffered = True
        DropDownCount = 20
        ParentBiDiMode = False
        ParentDoubleBuffered = False
        TabOrder = 0
        OnChange = ComboBox1Change
        ExplicitWidth = 234
      end
      object ComboBox_changeCP: TComboBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 54
        Height = 21
        Hint = 'hint_CpOnLoad'
        Align = alLeft
        AutoDropDown = True
        BevelInner = bvNone
        BevelOuter = bvNone
        Style = csDropDownList
        DropDownCount = 20
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        Visible = False
        OnChange = ComboBox_changeCPChange
      end
    end
    object Panel17: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 48
      Height = 24
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 3
      object ToolBar5: TToolBar
        Left = 0
        Top = 0
        Width = 48
        Height = 24
        Align = alClient
        Caption = 'ToolBar5'
        DoubleBuffered = True
        EdgeInner = esNone
        EdgeOuter = esNone
        HotImages = ImageList2
        Images = ImageList1
        ParentDoubleBuffered = False
        TabOrder = 0
        Transparent = True
        object ToolButton43: TToolButton
          Left = 0
          Top = 0
          Caption = 'ToolButton43'
          ImageIndex = 67
          OnMouseUp = ToolButton43MouseUp
        end
        object ToolButton55: TToolButton
          Left = 23
          Top = 0
          Hint = 'hint_AdvancedSearch'
          Caption = 'ToolButton55'
          ImageIndex = 14
          Style = tbsCheck
          OnMouseUp = ToolButton55MouseUp
        end
      end
    end
    object Panel30: TPanel
      AlignWithMargins = True
      Left = 754
      Top = 3
      Width = 195
      Height = 24
      Margins.Left = 0
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 4
      object ToolBar8: TToolBar
        Left = 0
        Top = 0
        Width = 195
        Height = 24
        Align = alClient
        Caption = 'ToolBar8'
        HotImages = ImageList2
        HotTrackColor = clActiveCaption
        Images = ImageList1
        TabOrder = 0
        object ToolButton59: TToolButton
          Left = 0
          Top = 0
          Hint = 'Hint_VMADFound'
          Caption = 'ToolButton59'
          Enabled = False
          ImageIndex = 32
          Style = tbsCheck
          OnClick = ToolButton59bClick
        end
        object ToolButton65: TToolButton
          Left = 23
          Top = 0
          Width = 8
          Caption = 'ToolButton65'
          ImageIndex = 5
          Style = tbsSeparator
        end
        object ToolButton49: TToolButton
          Left = 31
          Top = 0
          Hint = 'hint_transApi'
          Caption = 'ToolButton49'
          Enabled = False
          ImageIndex = 71
          OnClick = ToolButton49Click
        end
        object ToolButton13: TToolButton
          Left = 54
          Top = 0
          Hint = 'Trans_Exact'
          Caption = 'ToolButton13'
          Enabled = False
          ImageIndex = 41
          OnClick = TranslateExactMenu1Click
        end
        object ToolButton25: TToolButton
          Left = 77
          Top = 0
          Hint = 'Heuristic'
          Caption = 'ToolButton25'
          Enabled = False
          ImageIndex = 40
          OnClick = HeuristicMenu1Click
        end
        object ToolButton11: TToolButton
          Left = 100
          Top = 0
          Hint = 'SearchandReplace'
          Caption = 'ToolButton11'
          ImageIndex = 15
          OnClick = SearchandReplace1Click
        end
        object ToolButton41: TToolButton
          Left = 123
          Top = 0
          Hint = 'FormRegex'
          Caption = 'ToolButton41'
          ImageIndex = 57
          OnClick = ToolButton41bClick
        end
        object ToolButton66: TToolButton
          Left = 146
          Top = 0
          Width = 8
          Caption = 'ToolButton66'
          ImageIndex = 5
          Style = tbsSeparator
        end
        object ToolButton24: TToolButton
          Left = 154
          Top = 0
          Hint = 'hint_ForceCPandPreset'
          Caption = 'ToolButton24'
          DropdownMenu = PopupMenu5
          ImageIndex = 73
          Style = tbsDropDown
          OnClick = ForceCP21Click
        end
      end
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 310
    Width = 1256
    Height = 364
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'Panel4'
    TabOrder = 2
    ExplicitTop = 309
    ExplicitWidth = 1252
    object pagecontrol2: TPageControl
      Left = 0
      Top = 0
      Width = 1256
      Height = 340
      ActivePage = TabSheet10
      Align = alClient
      Images = ImageList1
      TabOrder = 0
      OnChange = pagecontrol2Change
      ExplicitWidth = 1252
      object TabSheet8: TTabSheet
        Caption = 'Home'
        ImageIndex = 3
        object Panel5: TPanel
          Left = 0
          Top = 0
          Width = 1248
          Height = 311
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alClient
          BevelOuter = bvNone
          Caption = 'Panel4'
          TabOrder = 0
          object HtmlViewer1: THtmlViewer
            Left = 0
            Top = 0
            Width = 1248
            Height = 311
            StyleElements = [seClient, seBorder]
            BorderStyle = htSingle
            DefBackground = clWhite
            DefFontName = 'Times New Roman'
            DefPreFontName = 'Courier New'
            HistoryMaxCount = 0
            NoSelect = False
            PrintMarginBottom = 2.000000000000000000
            PrintMarginLeft = 2.000000000000000000
            PrintMarginRight = 2.000000000000000000
            PrintMarginTop = 2.000000000000000000
            PrintScale = 1.000000000000000000
            QuirksMode = qmDetect
            ScrollBars = ssVertical
            Text = ''
            OnHotSpotClick = HtmlViewer1HotSpotClick
            Align = alClient
            TabOrder = 0
            Touch.InteractiveGestures = [igPan]
            Touch.InteractiveGestureOptions = [igoPanSingleFingerHorizontal, igoPanSingleFingerVertical, igoPanInertia]
          end
        end
      end
      object TabSheet9: TTabSheet
        Caption = 'Vocabulary'
        ImageIndex = 1
        object VocabTree: TVirtualStringTree
          Left = 0
          Top = 25
          Width = 1248
          Height = 286
          Align = alClient
          ButtonStyle = bsTriangle
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
          Header.MainColumn = 1
          Header.Options = [hoAutoResize, hoColumnResize, hoDrag, hoOwnerDraw, hoVisible]
          Header.ParentFont = False
          Header.SortColumn = 1
          HintMode = hmTooltip
          Images = ImageList1
          ParentFont = False
          ParentShowHint = False
          PopupMenu = PopupMenu4
          SelectionBlendFactor = 40
          ShowHint = False
          TabOrder = 0
          TreeOptions.AutoOptions = [toAutoDropExpand, toAutoTristateTracking, toAutoDeleteMovedNodes, toAutoChangeScale]
          TreeOptions.MiscOptions = [toAcceptOLEDrop, toCheckSupport, toFullRepaintOnResize, toInitOnSave, toToggleOnDblClick, toWheelPanning]
          TreeOptions.PaintOptions = [toHideFocusRect, toShowButtons, toShowDropmark, toShowRoot, toShowTreeLines, toShowVertGridLines, toThemeAware, toUseBlendedImages]
          TreeOptions.SelectionOptions = [toExtendedFocus, toFullRowSelect, toMultiSelect]
          OnAdvancedHeaderDraw = SkyTreeAdvancedHeaderDraw
          OnCompareNodes = VocabTreeCompareNodes
          OnDragAllowed = VocabTreeDragAllowed
          OnDragOver = VocabTreeDragOver
          OnDragDrop = VocabTreeDragDrop
          OnFreeNode = VocabTreeFreeNode
          OnGetText = VocabTreeGetText
          OnPaintText = VocabTreePaintText
          OnGetImageIndex = VocabTreeGetImageIndex
          OnHeaderDrawQueryElements = SkyTreeHeaderDrawQueryElements
          OnInitNode = VocabTreeInitNode
          OnMouseUp = VocabTreeMouseUp
          Touch.InteractiveGestures = [igPan, igPressAndTap]
          Touch.InteractiveGestureOptions = [igoPanSingleFingerHorizontal, igoPanSingleFingerVertical, igoPanInertia, igoPanGutter, igoParentPassthrough]
          Columns = <
            item
              Position = 0
              Width = 23
            end
            item
              Position = 1
              Text = 'Dictionaries'
              Width = 1221
            end
            item
              Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coAllowFocus]
              Position = 2
              Text = 'Translated'
              Width = 627
            end
            item
              Options = [coAllowClick, coEnabled, coParentBidiMode, coParentColor, coShowDropMark, coAllowFocus]
              Position = 3
              Text = 'LD'
            end>
        end
        object Panel6: TPanel
          Left = 0
          Top = 0
          Width = 1248
          Height = 25
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object Panel7: TPanel
            Left = 357
            Top = 0
            Width = 891
            Height = 25
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object ToolBar3: TToolBar
              Left = 0
              Top = 0
              Width = 891
              Height = 28
              ButtonHeight = 24
              ButtonWidth = 25
              Caption = 'ToolBar3'
              Color = clBtnFace
              HotImages = ImageList2
              Images = ImageList1
              ParentColor = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              object ToolButton17: TToolButton
                Left = 0
                Top = 0
                Hint = 'Hint_VocabUnSel'
                Caption = 'ToolButton17'
                ImageIndex = 8
                OnClick = ToolButton17Click
              end
              object ToolButton16: TToolButton
                Left = 25
                Top = 0
                Hint = 'Hint_VocabSel'
                Caption = 'ToolButton16'
                ImageIndex = 12
                OnClick = ToolButton16Click
              end
              object ToolButton31: TToolButton
                Left = 50
                Top = 0
                Hint = 'Hint_SortSST'
                Caption = 'ToolButton31'
                ImageIndex = 53
                OnClick = ToolButton31Click
              end
              object ToolButtonForceSST: TToolButton
                Left = 75
                Top = 0
                Hint = 'Hint_forceLoadSST'
                Down = True
                ImageIndex = 52
                Style = tbsCheck
              end
              object ToolButton36: TToolButton
                Left = 100
                Top = 0
                Width = 8
                Caption = 'ToolButton36'
                ImageIndex = 21
                Style = tbsSeparator
              end
              object ToolButton35: TToolButton
                Left = 108
                Top = 0
                Hint = 'Hint_applySst'
                Caption = 'ToolButton35'
                Enabled = False
                ImageIndex = 55
                OnClick = ToolButton35Click
              end
              object ToolButton33: TToolButton
                Left = 133
                Top = 0
                Width = 8
                Caption = 'ToolButton33'
                ImageIndex = 21
                Style = tbsSeparator
                Visible = False
              end
              object ToolButton21: TToolButton
                Left = 141
                Top = 0
                Hint = 'Hint_VocabOCustom'
                Caption = 'ToolButton21'
                ImageIndex = 10
                OnClick = OpenSSTcustomClick
              end
              object ToolButton32: TToolButton
                Left = 166
                Top = 0
                Width = 8
                Caption = 'ToolButton32'
                ImageIndex = 12
                Style = tbsSeparator
              end
              object ToolButton18: TToolButton
                Left = 174
                Top = 0
                Hint = 'Hint_VocabReload'
                Caption = 'ToolButton18'
                ImageIndex = 35
                OnClick = ToolButton18Click
              end
              object ToolButton28: TToolButton
                Left = 199
                Top = 0
                Hint = 'Hint_OpenUserFolder'
                Caption = 'ToolButton28'
                ImageIndex = 21
                OnClick = ToolButton28Click
              end
            end
          end
          object Panel8: TPanel
            Left = 0
            Top = 0
            Width = 357
            Height = 25
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 1
            object ButtonedEdit2: TButtonedEdit
              Left = 0
              Top = 0
              Width = 347
              Height = 21
              DoubleBuffered = True
              Images = ImageList1
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
              OnChange = ButtonedEdit2Change
              OnRightButtonClick = ButtonedEdit2RightButtonClick
            end
          end
        end
      end
      object TabSheet7: TTabSheet
        Caption = 'HeuristicSuggestions'
        ImageIndex = 29
        object LDtree: TVirtualStringTree
          Left = 0
          Top = 0
          Width = 1248
          Height = 311
          Align = alClient
          Colors.SelectionTextColor = clWindowText
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header.AutoSizeIndex = 2
          Header.MainColumn = 1
          Header.Options = [hoAutoResize, hoColumnResize, hoDrag, hoOwnerDraw, hoShowSortGlyphs, hoVisible]
          Header.SortColumn = 3
          Header.SortDirection = sdDescending
          Images = ImageList2
          ParentFont = False
          ParentShowHint = False
          PopupMenu = PopupMenu2
          SelectionBlendFactor = 40
          ShowHint = True
          TabOrder = 0
          TreeOptions.AutoOptions = [toAutoDropExpand, toAutoScrollOnExpand, toAutoSort, toAutoTristateTracking, toAutoDeleteMovedNodes]
          TreeOptions.PaintOptions = [toHideFocusRect, toShowButtons, toShowDropmark, toUseBlendedImages, toUseBlendedSelection]
          TreeOptions.SelectionOptions = [toExtendedFocus, toFullRowSelect]
          OnAdvancedHeaderDraw = SkyTreeAdvancedHeaderDraw
          OnBeforeCellPaint = LDtreeBeforeCellPaint
          OnCompareNodes = SkyTreeCompareNodes
          OnDblClick = translate2Click
          OnFreeNode = SkyTreeFreeNode
          OnGetText = SkyTreeGetText
          OnPaintText = SkyTreePaintText
          OnHeaderDrawQueryElements = SkyTreeHeaderDrawQueryElements
          OnInitNode = SkyTreeInitNode
          OnMouseMove = SkyTreeMouseMove
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
              Width = 824
            end
            item
              Options = [coAllowClick, coEnabled, coParentBidiMode, coParentColor, coShowDropMark, coVisible, coAllowFocus]
              Position = 3
              Text = 'LD'
            end>
        end
      end
      object TabSheet5: TTabSheet
        Caption = 'EspTree'
        ImageIndex = 17
        object espTree: TVirtualStringTree
          Left = 0
          Top = 0
          Width = 1248
          Height = 311
          Align = alClient
          ButtonStyle = bsTriangle
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Header.AutoSizeIndex = 0
          Header.MainColumn = -1
          ParentFont = False
          PopupMenu = PopupMenu3
          TabOrder = 0
          TreeOptions.PaintOptions = [toHideFocusRect, toShowButtons, toShowDropmark, toShowRoot, toThemeAware, toUseBlendedImages]
          OnDblClick = espTreeDblClick
          OnFreeNode = espTreeFreeNode
          OnGetText = espTreeGetText
          OnPaintText = espTreePaintText
          Touch.InteractiveGestures = [igPan, igPressAndTap]
          Touch.InteractiveGestureOptions = [igoPanSingleFingerHorizontal, igoPanSingleFingerVertical, igoPanInertia, igoPanGutter, igoParentPassthrough]
          Columns = <>
        end
      end
      object TabSheet10: TTabSheet
        Caption = 'PexData'
        ImageIndex = 16
        OnShow = TabSheet10Show
        object Panel9: TPanel
          Left = 0
          Top = 0
          Width = 1248
          Height = 25
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          ExplicitWidth = 1244
          object Panel10: TPanel
            Left = 357
            Top = 0
            Width = 891
            Height = 25
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            ExplicitWidth = 887
            object ToolBar2: TToolBar
              Left = 0
              Top = 0
              Width = 891
              Height = 28
              ButtonHeight = 24
              ButtonWidth = 25
              Caption = 'ToolBar3'
              Color = clBtnFace
              HotImages = ImageList2
              Images = ImageList1
              ParentColor = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              ExplicitWidth = 887
              object ToolButton37: TToolButton
                Left = 0
                Top = 0
                Hint = 'Hint_EditSNext'
                Caption = 'ToolButton17'
                ImageIndex = 15
                OnClick = ToolButton37Click
              end
              object ToolButton38: TToolButton
                Left = 25
                Top = 0
                Hint = 'Hint_EditSPrevious'
                Caption = 'ToolButton16'
                ImageIndex = 43
                OnClick = ToolButton38Click
              end
              object ToolButton39: TToolButton
                Left = 50
                Top = 0
                Width = 8
                Caption = 'ToolButton39'
                ImageIndex = 44
                Style = tbsSeparator
              end
              object ToolButton40: TToolButton
                Left = 58
                Top = 0
                Hint = 'Hint_LockTranslateTag'
                Caption = 'ToolButton40'
                Down = True
                ImageIndex = 19
                Style = tbsCheck
              end
            end
          end
          object Panel11: TPanel
            Left = 0
            Top = 0
            Width = 357
            Height = 25
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 1
            object ButtonedEdit3: TButtonedEdit
              Left = 0
              Top = 0
              Width = 347
              Height = 21
              DoubleBuffered = True
              Images = ImageList1
              LeftButton.ImageIndex = 13
              LeftButton.Visible = True
              ParentDoubleBuffered = False
              RightButton.ImageIndex = 12
              RightButton.Visible = True
              TabOrder = 0
              OnChange = ButtonedEdit3Change
              OnLeftButtonClick = ButtonedEdit3LeftButtonClick
              OnRightButtonClick = ButtonedEdit3RightButtonClick
            end
          end
        end
        object PageControlPex: TPageControl
          Left = 0
          Top = 25
          Width = 1248
          Height = 286
          ActivePage = TabSheet14
          Align = alClient
          TabOrder = 1
          ExplicitWidth = 1244
          object TabSheet13: TTabSheet
            Caption = 'PexAsm'
            object SynEditPex: TSynEdit
              Left = 0
              Top = 0
              Width = 1240
              Height = 258
              Align = alClient
              ActiveLineColor = clInfoBk
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Courier New'
              Font.Pitch = fpFixed
              Font.Style = []
              Font.Quality = fqClearTypeNatural
              TabOrder = 0
              OnMouseDown = SynEditPexMouseDown
              UseCodeFolding = False
              BookMarkOptions.BookmarkImages = ImageList3
              BookMarkOptions.GlyphsVisible = False
              BookMarkOptions.LeftMargin = 1
              BorderStyle = bsNone
              Gutter.Color = clWindow
              Gutter.BorderColor = clScrollBar
              Gutter.DigitCount = 5
              Gutter.Font.Charset = DEFAULT_CHARSET
              Gutter.Font.Color = clWindowText
              Gutter.Font.Height = -11
              Gutter.Font.Name = 'Courier New'
              Gutter.Font.Style = []
              Gutter.ShowLineNumbers = True
              Gutter.Bands = <
                item
                  Kind = gbkMarks
                  Visible = True
                  Width = 13
                end
                item
                  Kind = gbkLineNumbers
                end
                item
                  Kind = gbkFold
                end
                item
                  Kind = gbkTrackChanges
                end
                item
                  Kind = gbkMargin
                  Visible = True
                  Width = 3
                end>
              Options = [eoAutoIndent, eoDragDropEditing, eoEnhanceEndKey, eoGroupUndo, eoHideShowScrollbars, eoSmartTabDelete, eoSmartTabs, eoTabsToSpaces]
              ReadOnly = True
              RightEdge = 0
              SearchEngine = SynEditSearch1
              TabWidth = 6
              WordWrap = True
              WordWrapGlyph.Visible = False
              OnGutterClick = SynEditPexGutterClick
              OnMouseCursor = SynEditPexMouseCursor
              ExplicitWidth = 1236
              RemovedKeystrokes = <
                item
                  Command = ecContextHelp
                  ShortCut = 112
                end>
              AddedKeystrokes = <>
            end
          end
          object TabSheet14: TTabSheet
            Caption = 'PexScript'
            ImageIndex = 1
            object SynEditScript: TSynEdit
              Left = 0
              Top = 0
              Width = 1240
              Height = 258
              Align = alClient
              ActiveLineColor = clCream
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Courier New'
              Font.Pitch = fpFixed
              Font.Style = []
              Font.Quality = fqClearTypeNatural
              TabOrder = 0
              CodeFolding.FolderBarLinesColor = clGray
              UseCodeFolding = False
              BookMarkOptions.BookmarkImages = ImageList3
              BookMarkOptions.GlyphsVisible = False
              BookMarkOptions.LeftMargin = 1
              BorderStyle = bsNone
              Gutter.Color = clWindow
              Gutter.BorderColor = clScrollBar
              Gutter.DigitCount = 5
              Gutter.Font.Charset = DEFAULT_CHARSET
              Gutter.Font.Color = clWindowText
              Gutter.Font.Height = -11
              Gutter.Font.Name = 'Courier New'
              Gutter.Font.Style = []
              Gutter.ShowLineNumbers = True
              Gutter.Bands = <
                item
                  Kind = gbkMarks
                  Visible = True
                  Width = 13
                end
                item
                  Kind = gbkLineNumbers
                end
                item
                  Kind = gbkFold
                end
                item
                  Kind = gbkTrackChanges
                end
                item
                  Kind = gbkMargin
                  Visible = True
                  Width = 3
                end>
              Options = [eoAutoIndent, eoDragDropEditing, eoEnhanceEndKey, eoGroupUndo, eoHideShowScrollbars, eoSmartTabDelete, eoSmartTabs, eoTabsToSpaces]
              ReadOnly = True
              RightEdge = 0
              SearchEngine = SynEditSearch1
              TabWidth = 6
              WordWrap = True
              WordWrapGlyph.Visible = False
              RemovedKeystrokes = <
                item
                  Command = ecContextHelp
                  ShortCut = 112
                end>
              AddedKeystrokes = <>
            end
          end
        end
      end
      object TabSheet12: TTabSheet
        Caption = 'Quests'
        ImageIndex = 75
        object ListBox2: TListBox
          Left = 0
          Top = 25
          Width = 1248
          Height = 286
          Style = lbOwnerDrawFixed
          Align = alClient
          DragMode = dmAutomatic
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ItemHeight = 18
          ParentFont = False
          TabOrder = 0
          OnDblClick = ListBox2DblClick
          OnDrawItem = ListBox2DrawItem
        end
        object Panel18: TPanel
          Left = 0
          Top = 0
          Width = 1248
          Height = 25
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object Panel23: TPanel
            Left = 0
            Top = 0
            Width = 353
            Height = 25
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 0
            object ButtonedEdit4: TButtonedEdit
              Left = 0
              Top = 0
              Width = 347
              Height = 21
              DoubleBuffered = True
              Images = ImageList1
              LeftButton.ImageIndex = 13
              LeftButton.Visible = True
              ParentDoubleBuffered = False
              RightButton.ImageIndex = 12
              RightButton.Visible = True
              TabOrder = 0
              OnChange = ButtonedEdit4Change
              OnRightButtonClick = ButtonedEdit4RightButtonClick
            end
          end
          object Panel24: TPanel
            Left = 353
            Top = 0
            Width = 895
            Height = 25
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object ToolBar7: TToolBar
              Left = 0
              Top = 0
              Width = 895
              Height = 29
              ButtonHeight = 24
              ButtonWidth = 24
              Caption = 'ToolBar7'
              HotImages = ImageList2
              Images = ImageList1
              TabOrder = 0
              object ToolButton54: TToolButton
                Left = 0
                Top = 0
                Hint = 'Hint_RefreshQustList'
                Caption = 'ToolButton54'
                ImageIndex = 68
                OnClick = ToolButton54Click
              end
              object ToolButton53: TToolButton
                Left = 24
                Top = 0
                Hint = 'Hint_LoadAllMaster'
                Caption = 'ToolButton53'
                ImageIndex = 78
                OnClick = ToolButton46Click
              end
            end
          end
        end
      end
      object TabSheet11: TTabSheet
        Caption = 'Npc/Fuz Map'
        ImageIndex = 72
        object Panel16: TPanel
          Left = 0
          Top = 0
          Width = 1248
          Height = 52
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Panel13: TPanel
            Left = 0
            Top = 0
            Width = 1248
            Height = 22
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object Edit1: TEdit
              Left = 0
              Top = 0
              Width = 1144
              Height = 22
              Align = alClient
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object Panel14: TPanel
              Left = 1152
              Top = 0
              Width = 96
              Height = 22
              Align = alRight
              BevelOuter = bvNone
              TabOrder = 1
              object ToolBar4: TToolBar
                Left = 0
                Top = 0
                Width = 96
                Height = 22
                Align = alClient
                ButtonWidth = 48
                Caption = 'ToolBar3'
                HotImages = ImageList2
                Images = ImageList1
                TabOrder = 0
                object ToolButton30: TToolButton
                  Left = 0
                  Top = 0
                  Hint = 'hint_playFuz'
                  Caption = 'ToolButton9'
                  ImageIndex = 62
                  OnClick = ToolButton30Click
                end
                object ToolButton34: TToolButton
                  Left = 48
                  Top = 0
                  Hint = 'hint_FuzClipboard'
                  Caption = 'ToolButton13'
                  ImageIndex = 54
                  OnClick = ToolButton34Click
                end
              end
            end
            object Panel15: TPanel
              Left = 1144
              Top = 0
              Width = 8
              Height = 22
              Align = alRight
              BevelOuter = bvNone
              TabOrder = 2
            end
          end
          object Panel20: TPanel
            Left = 0
            Top = 27
            Width = 1248
            Height = 25
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 1
            object Panel21: TPanel
              Left = 0
              Top = 0
              Width = 365
              Height = 25
              Align = alLeft
              BevelOuter = bvNone
              TabOrder = 0
              object ButtonedEdit6: TButtonedEdit
                Left = 0
                Top = 0
                Width = 365
                Height = 21
                Align = alTop
                DoubleBuffered = True
                Images = ImageList1
                LeftButton.ImageIndex = 13
                LeftButton.Visible = True
                ParentDoubleBuffered = False
                RightButton.ImageIndex = 12
                RightButton.Visible = True
                TabOrder = 0
                OnChange = ButtonedEdit6Change
                OnRightButtonClick = ButtonedEdit6RightButtonClick
              end
            end
            object Panel22: TPanel
              Left = 365
              Top = 0
              Width = 132
              Height = 25
              Align = alLeft
              BevelOuter = bvNone
              TabOrder = 1
              object ToolBar6: TToolBar
                Left = 0
                Top = 0
                Width = 132
                Height = 29
                ButtonHeight = 24
                ButtonWidth = 24
                Caption = 'ToolBar6'
                HotImages = ImageList2
                Images = ImageList1
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                object ToolButton50: TToolButton
                  Left = 0
                  Top = 0
                  Hint = 'hint_GenerateNPCMap2'
                  Caption = 'ToolButton50'
                  ImageIndex = 68
                  OnClick = ToolButton50Click
                end
                object ToolButton46: TToolButton
                  Left = 24
                  Top = 0
                  Hint = 'Hint_LoadAllMaster2'
                  Caption = 'ToolButton46'
                  ImageIndex = 78
                  OnClick = ToolButton46Click
                end
                object ToolButton51: TToolButton
                  Left = 48
                  Top = 0
                  Width = 8
                  Caption = 'ToolButton51'
                  ImageIndex = 5
                  Style = tbsSeparator
                end
                object ToolButton47: TToolButton
                  Left = 56
                  Top = 0
                  Hint = 'hint_ResetNPCMap'
                  Caption = 'ToolButton47'
                  ImageIndex = 12
                  OnClick = ToolButton47Click
                end
              end
            end
            object Panel26: TPanel
              Left = 497
              Top = 0
              Width = 751
              Height = 25
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 2
            end
          end
        end
        object Panel25: TPanel
          Left = 0
          Top = 52
          Width = 1248
          Height = 259
          Align = alClient
          BevelOuter = bvNone
          Caption = 'Panel25'
          TabOrder = 1
          object Splitter2: TSplitter
            Left = 365
            Top = 0
            Width = 5
            Height = 259
            AutoSnap = False
            MinSize = 200
          end
          object Panel27: TPanel
            Left = 0
            Top = 0
            Width = 365
            Height = 259
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 0
            object Splitter4: TSplitter
              Left = 0
              Top = 112
              Width = 365
              Height = 5
              Cursor = crVSplit
              Align = alTop
              AutoSnap = False
              MinSize = 80
            end
            object Panel19: TPanel
              Left = 0
              Top = 0
              Width = 365
              Height = 112
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              object ListBox4: TListBox
                Left = 0
                Top = 0
                Width = 365
                Height = 112
                Style = lbOwnerDrawFixed
                Align = alClient
                DoubleBuffered = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ItemHeight = 18
                ParentDoubleBuffered = False
                ParentFont = False
                TabOrder = 0
                OnDrawItem = ListBox4DrawItem
                OnKeyUp = ListBox4KeyUp
                OnMouseDown = ListBox4MouseDown
              end
            end
            object Panel28: TPanel
              Left = 0
              Top = 117
              Width = 365
              Height = 142
              Align = alClient
              BevelOuter = bvNone
              Caption = 'Panel28'
              TabOrder = 1
              object ListBox3: TListBox
                Left = 0
                Top = 0
                Width = 365
                Height = 142
                Style = lbOwnerDrawFixed
                Align = alClient
                DoubleBuffered = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ItemHeight = 18
                ParentDoubleBuffered = False
                ParentFont = False
                TabOrder = 0
                OnDrawItem = ListBox3DrawItem
                OnKeyUp = ListBox3KeyUp
                OnMouseDown = ListBox3MouseDown
              end
            end
          end
          object ListBox1: TListBox
            Left = 370
            Top = 0
            Width = 878
            Height = 259
            Style = lbOwnerDrawFixed
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ItemHeight = 18
            ParentFont = False
            TabOrder = 1
            OnDblClick = ListBox1DblClick
            OnDrawItem = ListBox1DrawItem
          end
        end
      end
      object TabSheet6: TTabSheet
        Caption = 'Records_def'
        ImageIndex = 3
        TabVisible = False
        object SynEditRecord: TSynEdit
          Left = 0
          Top = 0
          Width = 1248
          Height = 311
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Pitch = fpFixed
          Font.Style = []
          Font.Quality = fqClearTypeNatural
          TabOrder = 0
          UseCodeFolding = False
          Gutter.Color = clWindow
          Gutter.Font.Charset = DEFAULT_CHARSET
          Gutter.Font.Color = clWindowText
          Gutter.Font.Height = -11
          Gutter.Font.Name = 'Courier New'
          Gutter.Font.Style = []
          Gutter.Visible = False
          Gutter.Bands = <
            item
              Kind = gbkMarks
              Visible = True
              Width = 13
            end
            item
              Kind = gbkLineNumbers
            end
            item
              Kind = gbkFold
            end
            item
              Kind = gbkTrackChanges
            end
            item
              Kind = gbkMargin
              Visible = True
              Width = 3
            end>
          Lines.Strings = (
            
              '#WARNING: do not modify this file, unless you know what you are ' +
              'doing.'
            '#Bad editing can  result in corrupted Esp.'
            '#FieldId=RecordID=List (0: strings, 1: dlStrings, 2: ilStrings'
            '#CharCase must match'
            
              '#(*) indicate the string can'#39't be null (needs at least one space' +
              ').'
            
              '#-proc1, -proc2 refer to internal procedures that defines some c' +
              'onditions for reading the data'
            'Def_:DNAM=MGEF=0'
            'Def_:NAM1=INFO=2*'
            'Def_:SHRT=NPC_=0'
            'Def_:CNAM=QUST=1'
            'Def_:CNAM=BOOK=1'
            'Def_:TNAM=WOOP=0'
            'Def_:NNAM=QUST=0'
            'Def_:NNAM=MESG=0'
            'Def_:ITXT=MESG=0'
            'Def_:RDMP=REGN=0'
            'Def_:EPF2=PERK=0'
            'Def_:RNAM=ACTI=0'
            'Def_:RNAM=FLOR=0'
            'Def_:RNAM=INFO=0*'
            'Def_:BPTN=BPTD=0'
            'Def_:MNAM=FACT=0'
            'Def_:FNAM=FACT=0'
            'Def_:DESC=LSCR=0'
            '#Fallout4'#9
            'Def_:ONAM=AMMO=0'
            'Def_:ONAM=LVLI=0'
            'Def_:ANAM=AVIF=0'
            'Def_:CNAM=DOOR=0'
            'Def_:WNAM=INNR=0'
            'Def_:FMRN=RACE=0'
            'Def_:BTXT=TERM=0'
            'Def_:ITXT=TERM=0'
            'Def_:RNAM=TERM=0'
            'Def_:UNAM=TERM=0'
            'Def_:WNAM=TERM=0'
            'Def_:DNAM=ALCH=0'
            'Def_:ONAM=DOOR=0'
            'Def_:TTGP=RACE=0'
            'Def_:MPPN=RACE=0'
            'Def_:NAM0=TERM=0'
            '#'
            'Def_:DATA=GMST=0-proc1'
            'Def_:EPFD=PERK=0-proc2'
            
              '#the two next fields must remain at the end of the section since' +
              ' they are fallback.'
            'Def_:FULL=****=0'
            'Def_:DESC=****=1'
            'Def_:ATTX=****=0'
            '#Warning Field: known enumerated entries (field=record)'
            'Warn:ITXT=MESG'
            'Warn:ITXT=TERM'
            'Warn:BTXT=TERM'
            'Warn:UNAM=TERM'
            'Warn:NNAM=QUST'
            'Warn:NAM1=INFO'
            'Warn:CNAM=QUST'
            'Warn:FULL=WEAP'
            'Warn:FULL=ARMO'
            'Warn:FULL=NPC_'
            'Warn:BPTN=BPTD'
            'Warn:MPPN=RACE'
            'Warn:FMRN=RACE'
            '#--------Skipped record----'
            '#Records with no known Lstrings'
            '#these records will not be parsed '
            ''
            '')
          Options = [eoAutoIndent, eoDragDropEditing, eoEnhanceEndKey, eoGroupUndo, eoHideShowScrollbars, eoNoCaret, eoSmartTabDelete, eoSmartTabs, eoTabsToSpaces]
          ReadOnly = True
          RightEdge = 0
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Log'
        ImageIndex = 2
        object Panel32: TPanel
          Left = 0
          Top = 0
          Width = 1248
          Height = 311
          Align = alClient
          BevelOuter = bvNone
          Caption = 'Panel32'
          TabOrder = 0
          object MemoLog: TRichEdit
            Left = 0
            Top = 0
            Width = 1248
            Height = 311
            Align = alClient
            BevelInner = bvSpace
            BevelOuter = bvNone
            BorderStyle = bsNone
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = []
            HideScrollBars = False
            ParentFont = False
            PlainText = True
            ReadOnly = True
            ScrollBars = ssVertical
            TabOrder = 0
            StyleElements = []
          end
        end
      end
    end
    object StatusBar1: TStatusBar
      Left = 0
      Top = 340
      Width = 1256
      Height = 24
      DoubleBuffered = True
      Panels = <
        item
          Width = 150
        end
        item
          Width = 400
        end
        item
          Width = 45
        end
        item
          BiDiMode = bdLeftToRight
          ParentBiDiMode = False
          Width = 200
        end>
      ParentColor = True
      ParentDoubleBuffered = False
      ExplicitWidth = 1252
    end
  end
  object Panel29: TPanel
    Left = 0
    Top = 42
    Width = 1256
    Height = 265
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 3
    ExplicitWidth = 1252
    ExplicitHeight = 264
    object PageControl1: TPageControl
      Left = 0
      Top = 0
      Width = 1256
      Height = 247
      ActivePage = TabSheet1
      Align = alClient
      Images = ImageList1
      TabOrder = 0
      OnChange = PageControl1Change
      ExplicitWidth = 1252
      ExplicitHeight = 246
      object TabSheet1: TTabSheet
        Caption = 'STRINGS'
        object SkyTree: TVirtualStringTree
          Left = 0
          Top = 0
          Width = 1248
          Height = 218
          Align = alClient
          BiDiMode = bdLeftToRight
          ButtonStyle = bsTriangle
          Colors.SelectionTextColor = clWindowText
          EditDelay = 250
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header.AutoSizeIndex = 2
          Header.Font.Charset = DEFAULT_CHARSET
          Header.Font.Color = clWindowText
          Header.Font.Height = -11
          Header.Font.Name = 'Tahoma'
          Header.Font.Style = []
          Header.MainColumn = 1
          Header.Options = [hoAutoResize, hoColumnResize, hoDrag, hoOwnerDraw, hoShowSortGlyphs, hoVisible]
          Header.ParentFont = False
          Images = ImageList2
          ParentBiDiMode = False
          ParentFont = False
          ParentShowHint = False
          PopupMenu = PopupMenu1
          ScrollBarOptions.AlwaysVisible = True
          ScrollBarOptions.ScrollBars = ssVertical
          SelectionBlendFactor = 40
          ShowHint = True
          StyleElements = [seBorder]
          TabOrder = 0
          TreeOptions.AutoOptions = [toAutoDropExpand, toAutoScrollOnExpand, toAutoTristateTracking, toAutoDeleteMovedNodes]
          TreeOptions.MiscOptions = [toAcceptOLEDrop, toEditable, toFullRepaintOnResize, toInitOnSave, toWheelPanning]
          TreeOptions.PaintOptions = [toHideFocusRect, toShowButtons, toShowDropmark, toShowRoot, toThemeAware, toUseBlendedImages, toUseBlendedSelection]
          TreeOptions.SelectionOptions = [toExtendedFocus, toFullRowSelect, toMultiSelect]
          OnAdvancedHeaderDraw = SkyTreeAdvancedHeaderDraw
          OnBeforeCellPaint = SkyTreeBeforeCellPaint
          OnChange = SkyTreeChange
          OnCompareNodes = SkyTreeCompareNodes
          OnDblClick = SkyTreeDblClick
          OnDrawText = SkyTreeDrawText
          OnEdited = SkyTreeEdited
          OnEditing = SkyTreeEditing
          OnEndOperation = SkyTreeEndOperation
          OnFocusChanged = SkyTreeFocusChanged
          OnFreeNode = SkyTreeFreeNode
          OnGetText = SkyTreeGetText
          OnPaintText = SkyTreePaintText
          OnGetImageIndex = SkyTreeGetImageIndex
          OnHeaderClick = SkyTreeHeaderClick
          OnHeaderDrawQueryElements = SkyTreeHeaderDrawQueryElements
          OnInitNode = SkyTreeInitNode
          OnMouseMove = SkyTreeMouseMove
          OnNewText = SkyTreeNewText
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
              Width = 757
            end
            item
              Options = [coAllowClick, coEnabled, coParentBidiMode, coParentColor, coShowDropMark, coVisible, coAllowFocus]
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
              Spacing = 0
            end>
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'DLSTRINGS'
        object dlSkyTree: TVirtualStringTree
          Left = 0
          Top = 0
          Width = 1248
          Height = 218
          Align = alClient
          ButtonStyle = bsTriangle
          Colors.SelectionTextColor = clWindowText
          Colors.TreeLineColor = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header.AutoSizeIndex = 2
          Header.MainColumn = 1
          Header.Options = [hoAutoResize, hoColumnResize, hoDrag, hoOwnerDraw, hoShowSortGlyphs, hoVisible]
          Images = ImageList2
          LineMode = lmBands
          LineStyle = lsSolid
          ParentFont = False
          ParentShowHint = False
          PopupMenu = PopupMenu1
          ScrollBarOptions.AlwaysVisible = True
          ScrollBarOptions.ScrollBars = ssVertical
          SelectionBlendFactor = 40
          ShowHint = True
          TabOrder = 0
          TreeOptions.AutoOptions = [toAutoDropExpand, toAutoScrollOnExpand, toAutoTristateTracking, toAutoDeleteMovedNodes]
          TreeOptions.MiscOptions = [toAcceptOLEDrop, toEditable, toFullRepaintOnResize, toInitOnSave, toWheelPanning]
          TreeOptions.PaintOptions = [toHideFocusRect, toShowButtons, toShowDropmark, toShowRoot, toThemeAware, toUseBlendedImages, toUseBlendedSelection]
          TreeOptions.SelectionOptions = [toExtendedFocus, toFullRowSelect, toMultiSelect]
          OnAdvancedHeaderDraw = SkyTreeAdvancedHeaderDraw
          OnBeforeCellPaint = SkyTreeBeforeCellPaint
          OnChange = SkyTreeChange
          OnCompareNodes = SkyTreeCompareNodes
          OnDblClick = SkyTreeDblClick
          OnDrawText = SkyTreeDrawText
          OnEdited = SkyTreeEdited
          OnEditing = SkyTreeEditing
          OnEndOperation = SkyTreeEndOperation
          OnFocusChanged = SkyTreeFocusChanged
          OnFreeNode = SkyTreeFreeNode
          OnGetText = SkyTreeGetText
          OnPaintText = SkyTreePaintText
          OnGetImageIndex = SkyTreeGetImageIndex
          OnHeaderClick = SkyTreeHeaderClick
          OnHeaderDrawQueryElements = SkyTreeHeaderDrawQueryElements
          OnInitNode = SkyTreeInitNode
          OnMouseMove = SkyTreeMouseMove
          OnNewText = SkyTreeNewText
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
              Width = 752
            end
            item
              Options = [coAllowClick, coEnabled, coParentBidiMode, coParentColor, coShowDropMark, coVisible, coAllowFocus]
              Position = 5
              Text = 'LD'
              Width = 55
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
      end
      object TabSheet4: TTabSheet
        Caption = 'ILSTRINGS'
        object ilSkyTree: TVirtualStringTree
          Left = 0
          Top = 0
          Width = 1248
          Height = 218
          Align = alClient
          ButtonStyle = bsTriangle
          Colors.SelectionTextColor = clWindowText
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header.AutoSizeIndex = 2
          Header.MainColumn = 1
          Header.Options = [hoAutoResize, hoColumnResize, hoDrag, hoOwnerDraw, hoShowSortGlyphs, hoVisible]
          Header.Style = hsFlatButtons
          Images = ImageList2
          ParentFont = False
          ParentShowHint = False
          PopupMenu = PopupMenu1
          ScrollBarOptions.AlwaysVisible = True
          ScrollBarOptions.ScrollBars = ssVertical
          SelectionBlendFactor = 40
          ShowHint = True
          StyleElements = [seBorder]
          TabOrder = 0
          TreeOptions.AutoOptions = [toAutoDropExpand, toAutoScrollOnExpand, toAutoTristateTracking, toAutoDeleteMovedNodes]
          TreeOptions.MiscOptions = [toAcceptOLEDrop, toEditable, toFullRepaintOnResize, toInitOnSave, toWheelPanning]
          TreeOptions.PaintOptions = [toHideFocusRect, toShowButtons, toShowDropmark, toShowRoot, toThemeAware, toUseBlendedImages, toUseBlendedSelection]
          TreeOptions.SelectionOptions = [toExtendedFocus, toFullRowSelect, toMultiSelect]
          OnAdvancedHeaderDraw = SkyTreeAdvancedHeaderDraw
          OnBeforeCellPaint = SkyTreeBeforeCellPaint
          OnChange = SkyTreeChange
          OnCompareNodes = SkyTreeCompareNodes
          OnDblClick = SkyTreeDblClick
          OnDrawText = SkyTreeDrawText
          OnEdited = SkyTreeEdited
          OnEditing = SkyTreeEditing
          OnEndOperation = SkyTreeEndOperation
          OnFocusChanged = SkyTreeFocusChanged
          OnFreeNode = SkyTreeFreeNode
          OnGetText = SkyTreeGetText
          OnPaintText = SkyTreePaintText
          OnGetImageIndex = SkyTreeGetImageIndex
          OnHeaderClick = SkyTreeHeaderClick
          OnHeaderDrawQueryElements = SkyTreeHeaderDrawQueryElements
          OnInitNode = SkyTreeInitNode
          OnMouseMove = SkyTreeMouseMove
          OnNewText = SkyTreeNewText
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
              Width = 757
            end
            item
              Options = [coAllowClick, coEnabled, coParentBidiMode, coParentColor, coShowDropMark, coVisible, coAllowFocus]
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
      end
    end
    object PanelFeedBack: TPanel
      Left = 0
      Top = 247
      Width = 1256
      Height = 18
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      Visible = False
      ExplicitTop = 246
      ExplicitWidth = 1252
    end
  end
  object Panel31: TPanel
    Left = 0
    Top = 30
    Width = 1256
    Height = 12
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 4
    Visible = False
    OnAlignPosition = Panel31AlignPosition
    ExplicitWidth = 1252
    object Image1: TImage
      Left = 259
      Top = 6
      Width = 540
      Height = 7
      Hint = 'TEST'
      Align = alCustom
      ParentShowHint = False
      ShowHint = True
    end
  end
  object MainMenu1: TMainMenu
    Images = ImageList1
    Left = 528
    Top = 128
    object File1: TMenuItem
      Caption = 'File'
      object LoadEsp1: TMenuItem
        Caption = 'Load_Esp'
        ImageIndex = 9
        ShortCut = 16463
        OnClick = LoadEsp1Click
      end
      object Load1: TMenuItem
        Caption = 'Load_Strings'
        ImageIndex = 9
        OnClick = Load1Click
      end
      object loadMCMmenu1: TMenuItem
        Caption = 'Load_MCMmenu2'
        ImageIndex = 9
        OnClick = loadMCMmenu1Click
      end
      object LoadScriptPex1: TMenuItem
        Caption = 'Load_ScriptPex'
        ImageIndex = 9
        OnClick = LoadScriptPex1Click
      end
      object LoadBSA: TMenuItem
        Caption = 'Load_Bsa'
        ImageIndex = 10
        OnClick = LoadBSAClick
      end
      object OpenSSTcustom: TMenuItem
        Caption = 'Load_Custom'
        ImageIndex = 10
        OnClick = OpenSSTcustomClick
      end
      object Recentfiles1: TMenuItem
        Caption = 'Recent_files'
        ImageIndex = 9
      end
      object N19: TMenuItem
        Caption = '-'
      end
      object MenuImport1: TMenuItem
        Caption = 'Menu_Import'
        Enabled = False
        ImageIndex = 9
        object importSST1: TMenuItem
          Caption = 'lbl_SST'
          Enabled = False
          ImageIndex = 10
          OnClick = importSST1Click
        end
        object LoadCurrentXML1: TMenuItem
          Caption = 'lbl_XML'
          Enabled = False
          ImageIndex = 49
          OnClick = LoadCurrentXML1Click
        end
        object LoadCurrentXML2: TMenuItem
          Caption = 'lbl_XML'
          ImageIndex = 49
          OnClick = LoadCurrentXML2Click
        end
      end
      object MenuExport1: TMenuItem
        Caption = 'Menu_Export'
        Enabled = False
        ImageIndex = 22
        object sstExport1: TMenuItem
          Caption = 'lbl_sst'
          Enabled = False
          ImageIndex = 66
          OnClick = sstExport1Click
        end
        object xmlSave1: TMenuItem
          Caption = 'lbl_XML'
          Enabled = False
          ImageIndex = 50
          OnClick = xmlSave1Click
        end
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object SaveSSTStrings: TMenuItem
        Caption = 'Save_SST'
        Enabled = False
        ImageIndex = 66
        ShortCut = 16467
        OnClick = SaveSSTStringsClick
      end
      object N9: TMenuItem
        Caption = '-'
      end
      object MenuFinalizeEspsc1: TMenuItem
        Caption = 'Menu_FinalizeEsp_sc'
        Visible = False
        OnClick = Save1Click
      end
      object Save1: TMenuItem
        Caption = 'Menu_FinalizeEsp'
        Enabled = False
        ImageIndex = 22
        OnClick = Save1Click
      end
      object Save2: TMenuItem
        Caption = 'Menu_FinalizeEspAs'
        Enabled = False
        ImageIndex = 22
        OnClick = Save2Click
      end
      object Save3bsa: TMenuItem
        Caption = 'Menu_FinalizeInBsa'
        Enabled = False
        ImageIndex = 22
        Visible = False
        OnClick = Save3bsaClick
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object MenuCloseCurrent: TMenuItem
        Caption = 'Menu_CloseCurrent'
        Enabled = False
        ImageIndex = 12
        ShortCut = 16471
        OnClick = MenuCloseCurrentClick
      end
      object MenuCloseALL1: TMenuItem
        Caption = 'Menu_CloseAll'
        Enabled = False
        ImageIndex = 12
        OnClick = MenuCloseALL1Click
      end
      object CloseAndFinalyseAll: TMenuItem
        Caption = 'Menu_CloseAndFinalyseAll'
        ShortCut = 24663
        Visible = False
        OnClick = CloseAndFinalyseAllClick
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object Close1: TMenuItem
        Caption = 'Close'
        ShortCut = 16465
        OnClick = Close1Click
      end
    end
    object TranslationMenu1: TMenuItem
      Caption = 'Translation'
      object TranslateExactMenu1: TMenuItem
        Caption = 'Trans_Exact'
        Enabled = False
        ImageIndex = 13
        ShortCut = 16468
        OnClick = TranslateExactMenu1Click
      end
      object QuickTransExactonSel1: TMenuItem
        Caption = 'QuickTrans_Exact_on_Sel'
        ShortCut = 16466
        Visible = False
        OnClick = QuickTransExactonSel1Click
      end
      object HeuristicMenu1: TMenuItem
        Caption = 'Heuristic2'
        Enabled = False
        ImageIndex = 14
        ShortCut = 16456
        OnClick = HeuristicMenu1Click
      end
      object ApiTransMenu: TMenuItem
        Caption = 'ApiTranslation'
        Enabled = False
        ImageIndex = 71
        OnClick = ApiTransMenuClick
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object SearchandReplace1: TMenuItem
        Caption = 'SearchandReplace'
        Enabled = False
        ImageIndex = 15
        ShortCut = 16454
        OnClick = SearchandReplace1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object ValidateallTranslations1: TMenuItem
        Caption = 'Menu_Validate_All'
        Enabled = False
        ImageIndex = 36
        ShortCut = 16496
        OnClick = ValidateallTranslations1Click
      end
      object ResetallTranslations1: TMenuItem
        Caption = 'Menu_ResetAll'
        Enabled = False
        ImageIndex = 39
        ShortCut = 16499
        OnClick = ResetallTranslations1Click
      end
      object N16: TMenuItem
        Caption = '-'
      end
      object Undo1: TMenuItem
        Caption = 'Undo'
        Enabled = False
        ImageIndex = 52
        ShortCut = 16474
        OnClick = Undo1Click
      end
    end
    object Vocabulary1: TMenuItem
      Caption = 'Options'
      object SetOptions12: TMenuItem
        Caption = 'Set_Options2'
        ImageIndex = 20
        OnClick = SetOptions12Click
      end
      object SetOptions11: TMenuItem
        Caption = 'Set_Options4'
        ImageIndex = 20
        OnClick = SetOptions11Click
      end
      object SetOptions31: TMenuItem
        Caption = 'Set_Options5'
        ImageIndex = 20
        OnClick = SetOptions31Click
      end
      object setoption32: TMenuItem
        Caption = 'TranslatorAPIs'
        ImageIndex = 71
        OnClick = setoption32Click
      end
      object spCheckOpt1: TMenuItem
        Caption = 'FormSpOpts'
        ImageIndex = 56
        OnClick = spCheckOpt1Click
      end
      object MenuDisplay1: TMenuItem
        Caption = 'MenuDisplay'
        ImageIndex = 46
        object zoom1: TMenuItem
          Tag = 1
          Caption = 'Zoom+'
          ImageIndex = 23
          ShortCut = 16507
          OnClick = zoom1Click
        end
        object Zoom2: TMenuItem
          Tag = -1
          Caption = 'Zoom-'
          ImageIndex = 24
          ShortCut = 16506
          OnClick = zoom1Click
        end
        object default1: TMenuItem
          Caption = 'ZoomDefault'
          ImageIndex = 12
          ShortCut = 16505
          OnClick = zoom1Click
        end
        object N25: TMenuItem
          Caption = '-'
        end
        object Darker2: TMenuItem
          Tag = -5
          Caption = 'UILighter'
          ImageIndex = 26
          ShortCut = 24699
          OnClick = Darker1Click
        end
        object Darker1: TMenuItem
          Tag = 5
          Caption = 'UIDarker'
          ImageIndex = 25
          ShortCut = 24698
          OnClick = Darker1Click
        end
        object N26: TMenuItem
          Caption = '-'
        end
        object Theme1: TMenuItem
          Caption = 'Theme'
          ImageIndex = 37
          object ThemeDefault: TMenuItem
            Caption = 'ThemeDefault'
            Checked = True
            RadioItem = True
            OnClick = ThemeDefaultClick
          end
          object ThemeLite: TMenuItem
            Tag = 2
            Caption = 'ThemeLight'
            RadioItem = True
            OnClick = ThemeDefaultClick
          end
          object ThemeGrey: TMenuItem
            Tag = 3
            Caption = 'ThemeGrey'
            RadioItem = True
            OnClick = ThemeDefaultClick
          end
          object ThemeObsidian: TMenuItem
            Tag = 1
            Caption = 'ThemeObsidian'
            RadioItem = True
            OnClick = ThemeDefaultClick
          end
        end
        object N21: TMenuItem
          Caption = '-'
        end
      end
      object N20: TMenuItem
        Caption = '-'
      end
      object Startup1: TMenuItem
        Caption = 'Set_Options3'
        ImageIndex = 67
        object startupMenu1: TMenuItem
          Caption = 'Always_Fallout4'
          RadioItem = True
          OnClick = startupMenu1Click
        end
        object startupMenu2: TMenuItem
          Tag = 1
          Caption = 'Always_Skyrim'
          RadioItem = True
          OnClick = startupMenu1Click
        end
        object startupMenu3: TMenuItem
          Tag = 2
          Caption = 'Always_FalloutNV'
          RadioItem = True
          OnClick = startupMenu1Click
        end
        object AlwaysSkyrimSE1: TMenuItem
          Tag = 6
          Caption = 'Always_SkyrimSE'
          RadioItem = True
          OnClick = startupMenu1Click
        end
        object startupMenu4: TMenuItem
          Tag = 3
          Caption = 'LastGameUsed'
          Checked = True
          RadioItem = True
          OnClick = startupMenu1Click
        end
        object startupMenu5: TMenuItem
          Tag = 4
          Caption = 'AskAtstart'
          RadioItem = True
          OnClick = startupMenu1Click
        end
        object startupMenu6: TMenuItem
          Tag = 5
          Caption = 'UseExecutableName'
          RadioItem = True
          OnClick = startupMenu1Click
        end
      end
      object Restart1: TMenuItem
        Caption = 'Restart_Fallout4'
        ImageIndex = 63
        OnClick = Restart1Click
      end
      object Restart3: TMenuItem
        Tag = 2
        Caption = 'Restart_FalloutNV'
        ImageIndex = 65
        OnClick = Restart1Click
      end
      object Restart2: TMenuItem
        Tag = 1
        Caption = 'Restart_Skyrim'
        ImageIndex = 64
        OnClick = Restart1Click
      end
      object Restart4: TMenuItem
        Tag = 3
        Caption = 'Restart_SkyrimSE'
        ImageIndex = 70
        OnClick = Restart1Click
      end
      object Restart5: TMenuItem
        Tag = 4
        Caption = 'Restart_Fallout76'
        ImageIndex = 81
        OnClick = Restart1Click
      end
      object Restart6: TMenuItem
        Tag = 5
        Caption = 'Restart_Starfield'
        ImageIndex = 30
        OnClick = Restart1Click
      end
      object N18: TMenuItem
        Caption = '-'
      end
      object langpresetsmenu1: TMenuItem
        Caption = 'lang_presets'
        SubMenuImages = ImageList1
        ImageIndex = 73
        object N2: TMenuItem
          Tag = -1
          Caption = '-'
        end
        object addPreset1: TMenuItem
          Tag = -1
          Caption = 'addPreset'
          ImageIndex = 73
          OnClick = addPreset1Click
        end
        object clearPreset1: TMenuItem
          Tag = -1
          Caption = 'clearPreset'
          ImageIndex = 73
          OnClick = clearPreset1Click
        end
      end
      object ForceCP21: TMenuItem
        Caption = 'ForceCP2'
        ImageIndex = 73
        OnClick = ForceCP21Click
      end
    end
    object Tools1: TMenuItem
      Caption = 'Tools'
      object EspCompare1: TMenuItem
        Caption = 'LoadEspCompare'
        Enabled = False
        ImageIndex = 15
        OnClick = EspCompare1Click
      end
      object LoadStringAsDest1: TMenuItem
        Caption = 'LoadStringAsDest'
        Enabled = False
        ImageIndex = 15
        OnClick = LoadStringAsDest1Click
      end
      object McmCompare1: TMenuItem
        Caption = 'LoadMcMCompare'
        Enabled = False
        ImageIndex = 15
        OnClick = McmCompare1Click
      end
      object N15: TMenuItem
        Caption = '-'
      end
      object Batch1: TMenuItem
        Caption = 'BatchSearchAndReplace'
        Enabled = False
        ImageIndex = 14
        OnClick = Batch1Click
      end
      object RegexTranslation1: TMenuItem
        Caption = 'FormRegex'
        Enabled = False
        ImageIndex = 57
        OnClick = RegexTranslation1Click
      end
      object gbSpellCheck1: TMenuItem
        Caption = 'gbSpellCheck'
        Enabled = False
        ImageIndex = 56
        OnClick = gbSpellCheck1Click
      end
      object DebugMenu: TMenuItem
        Caption = 'DebugMenu'
        ImageIndex = 74
        Visible = False
        object AltDisplay1: TMenuItem
          Caption = 'AltDisplay'
          ShortCut = 16504
          Visible = False
          OnClick = AltDisplay1Click
        end
        object derived1: TMenuItem
          Caption = 'GenerateDerived'
          ShortCut = 8315
          Visible = False
          OnClick = derived1Click
        end
        object UniqueAudit: TMenuItem
          Caption = 'UniqueAudit'
          ShortCut = 24697
          Visible = False
          OnClick = UniqueAuditClick
        end
        object UsageAudit1: TMenuItem
          Caption = 'UsageAudit'
          ShortCut = 24698
          Visible = False
          OnClick = UsageAudit1Click
        end
        object FixTES4SNAM1: TMenuItem
          Caption = 'tag_TES4_SNAM'
          OnClick = FixTES4SNAM1Click
        end
        object checkTaggedTES4SNAM1: TMenuItem
          Caption = 'checkTagged_TES4_SNAM'
          OnClick = checkTaggedTES4SNAM1Click
        end
        object TestFixStringID: TMenuItem
          Caption = 'TestFixStringID'
          object SaveLocalized: TMenuItem
            Caption = 'SaveLocalized'
            OnClick = SaveLocalizedClick
          end
          object SaveLocalizedRandom: TMenuItem
            Caption = 'SaveLocalizedRandom'
            OnClick = SaveLocalizedRandomClick
          end
        end
      end
      object N12: TMenuItem
        Caption = '-'
      end
      object loadAllMasters1: TMenuItem
        Caption = 'LoadAllMasters'
        Enabled = False
        ImageIndex = 78
        OnClick = loadAllMasters1Click
      end
      object OldDialogStyle1: TMenuItem
        Caption = 'OldDialogStyle'
        Enabled = False
        ImageIndex = 59
        OnClick = OldDialogStyle1Click
      end
      object DEFUIComponent1: TMenuItem
        Caption = 'DEFUIComponentGen'
        Enabled = False
        ImageIndex = 74
        OnClick = DEFUIComponent1Click
      end
      object HeaderProcessor1: TMenuItem
        Caption = 'HeaderProcessor'
        Enabled = False
        ImageIndex = 74
        OnClick = HeaderProcessor1Click
      end
      object TagNoTrans1: TMenuItem
        Caption = 'TagNoTrans'
        Enabled = False
        ImageIndex = 16
        OnClick = TagNoTrans1Click
      end
      object AddIdToStr: TMenuItem
        Caption = 'AddIdToStrings'
        Enabled = False
        ImageIndex = 54
        OnClick = AddIdToStrClick
      end
      object CompareSourceDest: TMenuItem
        Caption = 'Menu_CompareSourceDest'
        Enabled = False
        ImageIndex = 37
        object TagDiff1: TMenuItem
          Caption = 'Menu_TagDiff'
          OnClick = TagDiff1Click
        end
        object TagSame1: TMenuItem
          Caption = 'Menu_TagSame'
          OnClick = TagSame1Click
        end
      end
      object N14: TMenuItem
        Caption = '-'
      end
      object LangSpecific1: TMenuItem
        Caption = 'LangSpecific'
        Enabled = False
        ImageIndex = 1
        object ConvertTCSC1: TMenuItem
          Caption = 'ConvertTCSC'
          ImageIndex = 1
          OnClick = ConvertTCSC1Click
        end
        object ConvertSCTC1: TMenuItem
          Caption = 'ConvertSCTC'
          ImageIndex = 1
          OnClick = ConvertSCTC1Click
        end
        object RtlToLtr1: TMenuItem
          Caption = 'Arabic RtlToLtr (AlphaTEST-WIP)'
          ImageIndex = 24
          ShortCut = 32887
          OnClick = RtlToLtr1Click
        end
        object N17: TMenuItem
          Caption = '-'
        end
        object Experimental1: TMenuItem
          Caption = 'Experimental: Set bidiMode RTL<-> LTR'
          ImageIndex = 24
          ShortCut = 32888
          OnClick = Experimental1Click
        end
      end
    end
    object Wizard1: TMenuItem
      Caption = 'Wizards'
      Visible = False
      object headerWizard1: TMenuItem
        Caption = 'headerWizard'
        ImageIndex = 51
        OnClick = headerWizard1Click
      end
      object N30: TMenuItem
        Caption = '-'
      end
      object BatchCommand: TMenuItem
        Caption = 'batchProcessor'
        ImageIndex = 74
        OnClick = BatchCommandClick
      end
    end
  end
  object PopupMenu1: TPopupMenu
    Images = ImageList1
    OnPopup = PopupMenu1Popup
    Left = 600
    Top = 120
    object EditString2: TMenuItem
      Caption = 'Menu_Edit'
      ImageIndex = 0
      OnClick = EditString2Click
    end
    object ValidTranslation1: TMenuItem
      Caption = 'Menu_Validate3'
      ImageIndex = 36
      ShortCut = 112
      OnClick = ValidTranslation1Click
    end
    object ValidTranslationPartial: TMenuItem
      Caption = 'Menu_Partial2'
      ImageIndex = 37
      ShortCut = 113
      OnClick = ValidTranslationPartialClick
    end
    object MenuLocked1: TMenuItem
      Caption = 'Menu_Locked'
      ImageIndex = 16
      ShortCut = 114
      OnClick = MenuLocked1Click
    end
    object CancelTranslation1: TMenuItem
      Caption = 'Menu_Cancel2'
      ImageIndex = 39
      ShortCut = 115
      OnClick = CancelTranslation1Click
    end
    object MenuAddHeader1: TMenuItem
      Caption = 'Menu_AddHeader'
      ImageIndex = 74
      ShortCut = 16452
      OnClick = MenuAddHeader1Click
    end
    object SelectionFixNumberMatch1: TMenuItem
      Caption = 'Menu_FixNumber'
      ImageIndex = 74
      ShortCut = 16462
      OnClick = SelectionFixNumberMatch1Click
    end
    object MenuToolbox1: TMenuItem
      Caption = 'Menu_Toolbox'
      ImageIndex = 74
      ShortCut = 16450
      OnClick = MenuToolbox1Click
    end
    object SelectionCopier: TMenuItem
      Caption = 'Menu_Copy'
      ImageIndex = 41
      ShortCut = 16451
      OnClick = SelectionCopierClick
    end
    object SelectionColler: TMenuItem
      Caption = 'Menu_Paste'
      ImageIndex = 55
      ShortCut = 16470
      OnClick = SelectionCollerClick
    end
    object N11: TMenuItem
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
    object N7: TMenuItem
      Caption = '-'
    end
    object MenuFilterCurrentFormID1: TMenuItem
      Caption = 'Menu_FilterCurrentFormID'
      ImageIndex = 68
      ShortCut = 123
      OnClick = MenuFilterCurrentFormID1Click
    end
    object menuCustomDic1: TMenuItem
      Caption = 'Menu_CustomDic'
      ImageIndex = 1
      ShortCut = 16461
      OnClick = menuCustomDic1Click
    end
    object AddFieldCustom1: TMenuItem
      Caption = 'Menu_AddField'
      Enabled = False
      ImageIndex = 1
      ShortCut = 16453
      OnClick = AddFieldCustom1Click
    end
    object N24: TMenuItem
      Caption = '-'
    end
    object OpenScript1: TMenuItem
      Caption = 'Menu_OpenVMADScript'
      ImageIndex = 23
      OnClick = OpenScript1Click
    end
    object ShowRecStruct2: TMenuItem
      Caption = 'ShowRecStruct'
      ImageIndex = 17
      OnClick = ShowRecStruct2Click
    end
    object N27: TMenuItem
      Caption = '-'
    end
    object TranslationMeter1: TMenuItem
      Caption = 'TranslationMeter'
      ImageIndex = 7
      object TranslationMeterShow: TMenuItem
        Caption = 'TMShow'
        Checked = True
        OnClick = TranslationMeterShowClick
      end
      object TranslationMeterAll: TMenuItem
        Caption = 'TMShowAllListAtOnce'
        Checked = True
        Enabled = False
        OnClick = TranslationMeterAllClick
      end
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object ArrayTranslatorApi_2: TMenuItem
      Caption = 'Menu_TranslateApiArray'
      ImageIndex = 71
      ShortCut = 16500
      OnClick = ArrayTranslatorApi_2Click
    end
  end
  object PopupMenu2: TPopupMenu
    Images = ImageList1
    Left = 664
    Top = 120
    object translate2: TMenuItem
      Caption = 'Menu_Edit2'
      ImageIndex = 0
      OnClick = translate2Click
    end
    object translate1: TMenuItem
      Caption = 'Menu_Validate2'
      ImageIndex = 36
      ShortCut = 16450
      OnClick = translate1Click
    end
    object translate2fixNumber: TMenuItem
      Caption = 'Menu_ValidateFix'
      ImageIndex = 36
      ShortCut = 16462
      OnClick = translate2fixNumberClick
    end
    object N29: TMenuItem
      Caption = '-'
    end
    object Menu_RestrictRefRec: TMenuItem
      AutoCheck = True
      Caption = 'Menu_RestrictRefRec'
    end
  end
  object ImageList1: TImageList
    BlendColor = clWhite
    DrawingStyle = dsTransparent
    Left = 64
    Top = 136
    Bitmap = {
      494C010154004C11040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000006001000001002000000000000060
      0100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008F6130008F6130008F6130008F613000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008F6130008F6130008F6130008F613000000000000000
      000000000000000000000000000000000000000000008F6130008F6130008F61
      30008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F6130008F613000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008F613000000000008F613000EEC16100EEC161008F613000000000008F61
      3000000000000000000000000000000000000000000000000000000000000000
      00008F613000000000008F613000EEC16100EEC161008F613000000000008F61
      300000000000000000000000000000000000000000008F613000ECECEC00ECEC
      EC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC008F613000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008F61
      3000EEC161008F6130008F613000EEC16100EEC161008F6130008F613000EEC1
      61008F6130000000000000000000000000000000000000000000000000008F61
      3000EEC161008F6130008F613000EEC16100EEC161008F6130008F613000EEC1
      61008F613000000000000000000000000000000000008F613000ECECEC00ECEC
      EC00ECECEC00ECECEC008F6130008F6130008F6130008F613000ECECEC00ECEC
      EC00ECECEC00ECECEC008F613000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008F613000EEC1
      6100EEC16100EEC16100EEC16100EEC16100EEC16100EEC16100EEC16100EEC1
      6100EEC161008F613000000000000000000000000000000000008F6130001DA9
      CA008F613000EEC16100EEC16100EEC16100EEC16100EEC16100EEC16100EEC1
      6100EEC161008F6130000000000000000000000000008F613000ECECEC001260
      C0001260C0001260C0008F613000FFD48B00FFD48B008F6130001260C0001260
      C0001260C000ECECEC008F613000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008F61
      3000EEC16100EEC16100EEC16100EEC16100EEC16100EEC16100EEC16100EEC1
      61008F6130000000000000000000000000000000000000000000000000008F61
      30001DA9CA008F613000EEC16100EEC16100EEC16100EEC16100EEC16100EEC1
      61008F613000000000000000000000000000000000008F613000ECECEC00ECEC
      EC00ECECEC00ECECEC008F613000FFD48B00FFD48B008F613000ECECEC00ECEC
      EC00ECECEC00ECECEC008F613000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008F6130008F6130008F61
      3000EEC16100EEC16100EEC16100EEC16100EEC16100EEC16100EEC16100EEC1
      61008F6130008F6130008F61300000000000000000008F6130008F6130008F61
      30001DA9CA001DA9CA008F613000EEC16100EEC16100EEC16100EEC16100EEC1
      61008F6130008F6130008F61300000000000000000008F613000ECECEC001260
      C0001260C0001260C0008F613000FFD48B00FFD48B008F6130001260C0001260
      C0001260C000ECECEC008F613000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008F613000EEC16100EEC1
      61008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      3000EEC16100EEC161008F61300000000000000000008F6130001DA9CA001DA9
      CA001DA9CA001DA9CA001DA9CA008F613000EEC16100EEC16100EEC16100EEC1
      6100EEC16100EEC161008F61300000000000000000008F613000ECECEC00ECEC
      EC00ECECEC00ECECEC008F613000FFD48B00FFD48B008F613000ECECEC00ECEC
      EC00ECECEC00ECECEC008F613000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008F613000EEC16100EEC1
      61008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      3000EEC16100EEC161008F61300000000000000000008F6130001DA9CA001DA9
      CA001DA9CA001DA9CA001DA9CA001DA9CA008F613000EEC16100EEC16100EEC1
      6100EEC16100EEC161008F61300000000000000000008F613000ECECEC001260
      C0008F6130008F6130008F613000FFD48B00FFD48B008F6130008F6130008F61
      30001260C000ECECEC008F613000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008F6130008F6130008F61
      3000EEC16100EEC16100EEC16100EEC16100EEC16100EEC16100EEC16100EEC1
      61008F6130008F6130008F61300000000000000000008F6130008F6130008F61
      30001DA9CA001DA9CA001DA9CA001DA9CA001DA9CA008F613000EEC16100EEC1
      61008F6130008F6130008F61300000000000000000008F613000ECECEC00ECEC
      EC008F613000FFD48B00FFD48B00FFD48B00FFD48B00FFD48B00FFD48B008F61
      3000ECECEC00ECECEC008F613000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008F61
      3000EEC16100EEC16100EEC16100EEC16100EEC16100EEC16100EEC16100EEC1
      61008F6130000000000000000000000000000000000000000000000000008F61
      30001DA9CA001DA9CA001DA9CA001DA9CA001DA9CA001DA9CA008F613000EEC1
      61008F613000000000000000000000000000000000008F613000ECECEC001260
      C0001260C0008F613000FFD48B00FFD48B00FFD48B00FFD48B008F6130001260
      C0001260C000ECECEC008F613000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008F613000EEC1
      6100EEC16100EEC16100EEC16100EEC16100EEC16100EEC16100EEC16100EEC1
      6100EEC161008F613000000000000000000000000000000000008F6130001DA9
      CA001DA9CA001DA9CA001DA9CA001DA9CA001DA9CA001DA9CA001DA9CA008F61
      3000EEC161008F6130000000000000000000000000008F613000ECECEC00ECEC
      EC00ECECEC00ECECEC008F613000FFD48B00FFD48B008F613000ECECEC00ECEC
      EC00ECECEC00ECECEC008F613000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008F61
      3000EEC161008F6130008F613000EEC16100EEC161008F6130008F613000EEC1
      61008F6130000000000000000000000000000000000000000000000000008F61
      30001DA9CA008F6130008F6130001DA9CA001DA9CA008F6130008F6130001DA9
      CA008F613000000000000000000000000000000000008F613000ECECEC001260
      C0001260C0001260C0001260C0008F6130008F6130001260C0001260C0001260
      C0001260C000ECECEC008F613000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008F613000000000008F613000EEC16100EEC161008F613000000000008F61
      3000000000000000000000000000000000000000000000000000000000000000
      00008F613000000000008F6130001DA9CA001DA9CA008F613000000000008F61
      300000000000000000000000000000000000000000008F613000ECECEC00ECEC
      EC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC008F613000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008F6130008F6130008F6130008F613000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008F6130008F6130008F6130008F613000000000000000
      000000000000000000000000000000000000000000008F6130008F6130008F61
      30008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F6130008F613000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008F6130008F6130008F6130008F613000000000000000
      0000000000000000000000000000000000000000000077500E0077500E007750
      0E0077500E0077500E0077500E0077500E0077500E0077500E0077500E007750
      0E0077500E0077500E0077500E00000000000000000077500E0077500E007750
      0E0077500E0077500E0077500E0077500E0077500E0077500E0077500E007750
      0E0077500E0077500E0077500E0000000000000000008F6130008F6130008F61
      30008F6130008F6130008F6130008B5E2A008B5E2A0077500E0077500E007750
      0E0077500E0077500E0077500E00000000000000000000000000000000000000
      00008F613000000000008F61300013B5E00013B5E0008F613000000000008F61
      3000000000000000000000000000000000000000000077500E002191E9002191
      E9002191E9002191E9002191E9002191E900E3B35200E3B35200E3B35200E3B3
      5200E3B35200E3B3520077500E00000000000000000077500E00E3B35200E3B3
      5200E3B35200E3B35200E3B35200E3B35200E3B35200E3B35200E3B35200E3B3
      5200E3B35200E3B3520077500E0000000000000000008F613000000000000000
      000000000000000000008F6130002385E7002385E7002385E7002385E7002385
      E7002385E7002385E70077500E00000000000000000000000000000000008F61
      300013B5E0008F6130008F61300013B5E00013B5E0008F6130008F61300013B5
      E0008F613000000000000000000000000000000000000000000077500E002191
      E9002191E9002191E9002191E9008F6130008F613000E3B35200E3B35200E3B3
      5200E3B3520077500E000000000000000000000000000000000077500E00E3B3
      5200E3B35200E3B35200E3B352008F6130008F613000E3B35200E3B35200E3B3
      5200E3B3520077500E000000000000000000000000008F613000000000000000
      000000000000000000008F6130002385E7002385E7002385E7002385E7002385
      E7002385E7002385E70077500E000000000000000000000000008F61300013B5
      E00013B5E00013B5E00013B5E0008F6130008F61300013B5E00013B5E00013B5
      E00013B5E0008F6130000000000000000000000000000000000077500E002191
      E9002191E9002191E9002191E9008F6130008F613000E3B35200E3B35200E3B3
      5200E3B3520077500E000000000000000000000000000000000077500E00E3B3
      5200E3B35200E3B35200E3B352008F6130008F613000E3B35200E3B35200E3B3
      5200E3B3520077500E000000000000000000000000008F613000000000000000
      000083581F00000000008F6130008B5E2A008C5F2C008D602D0083581F008358
      1F0083581F007B53140077500E00000000000000000000000000000000008F61
      300013B5E00013B5E00013B5E0008F6130008F61300013B5E00013B5E00013B5
      E0008F6130000000000000000000000000000000000000000000000000007750
      0E002191E9002191E9002191E9002191E900E3B35200E3B35200E3B35200E3B3
      520077500E000000000000000000000000000000000000000000000000007750
      0E00E3B35200E3B35200E3B35200E3B35200E3B35200E3B35200E3B35200E3B3
      520077500E000000000000000000000000000000000000000000000000008B5E
      2A00875C2600000000000000000000000000000000008F6130002385E7002385
      E7002385E7002385E70077500E0000000000000000008F6130008F6130008F61
      300013B5E00013B5E00013B5E0008F6130008F61300013B5E00013B5E00013B5
      E0008F6130008F6130008F613000000000000000000000000000000000007750
      0E002191E9002191E9002191E9008F6130008F613000E3B35200E3B35200E3B3
      520077500E000000000000000000000000000000000000000000000000007750
      0E00E3B35200E3B35200E3B352008F6130008F613000E3B35200E3B35200E3B3
      520077500E0000000000000000000000000000000000000000008F6130008F61
      30008F6130008F6130008F6130008F613000000000008F6130002385E7002385
      E7002385E7002385E70077500E0000000000000000008F61300013B5E00013B5
      E0008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      300013B5E00013B5E0008F613000000000000000000000000000000000000000
      000077500E002191E9002191E9008F6130008F613000E3B35200E3B352007750
      0E00000000000000000000000000000000000000000000000000000000000000
      000077500E00E3B35200E3B352008F6130008F613000E3B35200E3B352007750
      0E0000000000000000000000000000000000000000008F6130008F6130008F61
      30008F6130008F6130008F6130008F613000000000008F613000845920008459
      2000845920007D54160077500E0000000000000000008F61300013B5E00013B5
      E0008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      300013B5E00013B5E0008F613000000000000000000000000000000000000000
      000077500E002191E9002191E9008F6130008F613000E3B35200E3B352007750
      0E00000000000000000000000000000000000000000000000000000000000000
      000077500E00E3B35200E3B352008F6130008F613000E3B35200E3B352007750
      0E000000000000000000000000000000000000000000000000008F6130008F61
      30008F6130008F6130008F6130008F613000000000008F6130002385E7002385
      E7002385E7002385E70077500E0000000000000000008F6130008F6130008F61
      300013B5E00013B5E00013B5E0008F6130008F6130001DA9CA001DA9CA001DA9
      CA008F6130008F6130008F613000000000000000000000000000000000000000
      00000000000077500E002191E9008F6130008F613000E3B3520077500E000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000077500E00E3B352008F6130008F613000E3B3520077500E000000
      0000000000000000000000000000000000000000000000000000000000008F61
      30008F613000000000000000000000000000000000008F6130002385E7002385
      E7002385E7002385E70077500E00000000000000000000000000000000008F61
      300013B5E00013B5E00013B5E0008F6130008F6130001DA9CA001DA9CA001DA9
      CA008F6130000000000000000000000000000000000000000000000000000000
      00000000000077500E002191E9002191E900E3B35200E3B3520077500E000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000077500E00E3B35200E3B35200E3B35200E3B3520077500E000000
      000000000000000000000000000000000000000000008F613000000000000000
      00008F613000000000008F6130008F6130008F6130008F6130008F6130008F61
      30008F61300080561B0077500E000000000000000000000000008F61300013B5
      E00013B5E00013B5E00013B5E0008F6130008F6130001DA9CA001DA9CA001DA9
      CA001DA9CA008F61300000000000000000000000000000000000000000000000
      0000000000000000000077500E002191E900E3B3520077500E00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000077500E00E3B35200E3B3520077500E00000000000000
      000000000000000000000000000000000000000000008F613000000000000000
      000000000000000000008F6130002385E7002385E7002385E7002385E7002385
      E7002385E7002385E70077500E00000000000000000000000000000000008F61
      300013B5E0008F6130008F61300013B5E00013B5E0008F6130008F6130001DA9
      CA008F6130000000000000000000000000000000000000000000000000000000
      0000000000000000000077500E002191E900E3B3520077500E00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000077500E00E3B35200E3B3520077500E00000000000000
      000000000000000000000000000000000000000000008F613000000000000000
      000000000000000000008F6130002385E7002385E7002385E7002385E7002385
      E7002385E7002385E70077500E00000000000000000000000000000000000000
      00008F613000000000008F61300013B5E00013B5E0008F613000000000008F61
      3000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000077500E0077500E0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000077500E0077500E0000000000000000000000
      000000000000000000000000000000000000000000008F6130008F6130008F61
      30008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F61300077500E00000000000000000000000000000000000000
      000000000000000000008F6130008F6130008F6130008F613000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008B5E2A008B5E
      2A008A5E29008B5E2A008B5E2A008B5E2A008B5E2A008B5E2A008B5E2A008C5F
      2B008C5F2C008D602D0000000000000000000000000093565000935650009356
      5000935650009356500093565000935650009356500093565000935650009356
      5000945653009456530096575700000000000000000000000000000000000000
      000000000000000000008C5F2C008D602D008D602E0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008C5F2C008D602D0000000000000000000000
      00000000000000000000000000000000000000000000000000008B5E2A009865
      2D0098652D0099652E0099652E0099652E0099652E009A652E009A652E009B66
      30009D6731008E602F0000000000000000000000000093565000DAC2BF00DAC2
      BF00DAC2BF00DAC2BF00DAC2BF00DAC2BF00DAC2BF00DAC2BF00DBC3C100DBC3
      C100DCC4C300DDC5C50096575900000000000000000000000000000000000000
      000000000000000000008C5F2C000665D4008E602F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008C5F2B008D602D0000000000000000000000
      00000000000000000000000000000000000000000000000000008B5E2A009865
      2D009A652E009B6630009D6731009D6731009D6731009D6731009D6731009D67
      31009D6831008F61300000000000000000000000000094565300DAC2BF00DAC2
      BF00DBC3C100DBC3C100DBC3C100DBC3C100DBC3C100DCC4C300DCC4C300DDC5
      C500DDC5C500DFC7C80097575A00000000000000000000000000000000000000
      000000000000000000008D602D000466D8008F61300000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008B5E2A00E5CAA600E9CFAC008D602E00000000000000
      00000000000000000000000000000000000000000000000000008B5E2A009965
      2E009B6630009D6731009D6831009D6831009D6831009E6832009E6832009E68
      32009E6832008F61300000000000000000000000000094565300DAC2BF00DBC3
      C10096575700965757009657570096575700965759009657590097575A009757
      5A00DFC7C800DFC7C80097575A00000000000000000000000000000000000000
      000000000000000000008D602D000167DE008F61300000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008B5E2A00E5CAA600EDD3B2008D602E00000000000000
      00000000000000000000000000000000000000000000000000008B5E2A009965
      2E009B6630009D6731009E6832009E6832009E6832009E6832009E6832009E68
      32009E6832008F61300000000000000000000000000094565300DAC2BF00DBC3
      C10096575700965759009657590097575A0097575A0097575A0097575A00DFC7
      C800DFC7C800DFC7C80097575A00000000000000000000000000000000000000
      000000000000000000008D602D000067E0008F61300000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008A5D2900E0C59F00E9CFAC00F0D6B500F0D6B5008D602E000000
      0000000000000000000000000000000000000000000000000000000000008C5F
      2C009B6630009D6731009E6832009E6832009E6832009E6832009E6832009E68
      32008F6130000000000000000000000000000000000093565000DAC2BF00DBC3
      C10096575700965759009657590097575A0097575A0097575A00DFC7C800A35F
      6200DFC7C800DFC7C80097575A00000000000000000000000000000000000000
      000000000000000000008D602D008F6130008F61300000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008A5E2900E5CAA600EDD3B200F3D9B900F0D6B5008D602E000000
      0000000000000000000000000000000000000000000000000000000000008C5F
      2C009A652E009D6731009D6731009E6832009E6832009E6832009E6832009E68
      32008F6130000000000000000000000000000000000093565000DAC2BF00DBC3
      C1009657570097575A0097575A0097575A0097575A00DFC7C800A35F6200DFC7
      C800DFC7C800DFC7C80097575A00000000000000000000000000000000000000
      000000000000000000008D602D008F6130008F61300000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008A5E2900E0C59F00E9CFAC00F0D6B500F3D9B900F3D9B900F0D6B5008D60
      2E00000000000000000000000000000000000000000000000000000000000000
      00008C5F2C008D602D008D602E009E6832009E6832008F6130008F6130008F61
      3000000000000000000000000000000000000000000093565000DAC2BF00DBC3
      C1009657590097575A0097575A0097575A00DFC7C800A35F6200DFC7C800A35F
      6200DFC7C800DFC7C80097575A00000000000000000000000000000000000000
      000000000000000000008D602D008F6130008F61300000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008B5E2A00E5CAA600EDD3B2008F6130008F613000F4DBBB00F4DBBB008F61
      3000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008D602D009D6831009E6832008F613000000000000000
      0000000000000000000000000000000000000000000093565000DAC2BF00DCC4
      C3009657590097575A0097575A00DFC7C800A35F6200DFC7C800DFC7C800DFC7
      C800DFC7C800DFC7C80097575A00000000000000000000000000000000000000
      000000000000000000008C5F2C008E602F008E602F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008C5F
      2B00E5CAA600E9CFAC008E602F00F4DBBB00F4DBBB008F613000F4DBBB00F4DB
      BB008F6130000000000000000000000000000000000000000000000000000000
      0000000000008B5E2A008D602D009D6731009E6832008F6130008F6130000000
      0000000000000000000000000000000000000000000093565000DBC3C100DCC4
      C30097575A0097575A00DFC7C800A35F6200DFC7C800DFC7C800DFC7C800DFC7
      C800DFC7C800DFC7C80097575A00000000000000000000000000000000000000
      000000000000000000008C5F2C000665D4008E602F0000000000000000000000
      00008D602D008D602E00000000000000000000000000000000008D602D008D60
      2D008D602D008D602D008E602F00F4DBBB00F4DBBB008F6130008F6130008F61
      30008F6130008F61300000000000000000000000000000000000000000000000
      0000000000008B5E2A009A652E009D6831009E6832009E6832008F6130000000
      0000000000000000000000000000000000000000000093565000DBC3C100DDC5
      C50097575A00DFC7C800A35F6200DFC7C800A35F6200DFC7C800DFC7C800A35F
      6200DFC7C800DFC7C80097575A000000000000000000000000008D602D000000
      0000000000008C5F2C008D602D008E602F008F6130008E602F008D602E008D60
      2E008E602F008E602F0000000000000000000000000000000000000000000000
      0000000000008D602D00EDD3B200F4DBBB00F4DBBB00F4DBBB008F6130000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008C5F2B009B6630009E6832009E6832009E6832008F6130000000
      0000000000000000000000000000000000000000000094565300DCC4C300DDC5
      C500DFC7C800DFC7C800DFC7C800DFC7C800DFC7C800DFC7C800DFC7C800DFC7
      C800DFC7C800DFC7C80097575A000000000000000000000000008D602E008D60
      2D008D602D008D602D008E602F008F6130008F6130008F6130008F6130008F61
      30008F6130008F61300000000000000000000000000000000000000000000000
      000000000000000000008D602E00F3D9B900F4DBBB008F613000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008C5F2C009B6630009E6832009E6832009E6832008F6130000000
      0000000000000000000000000000000000000000000094565300DDC5C500DFC7
      C800DFC7C800DFC7C800DFC7C800DFC7C800DFC7C800DFC7C800DFC7C800DFC7
      C800DFC7C800DFC7C80097575A00000000000000000000000000000000008D60
      2E008D602E008D602E008E602F008F6130008F6130008F6130008F6130008F61
      30008F6130008F61300000000000000000000000000000000000000000000000
      00000000000000000000000000008F6130008F61300000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008D602E008F6130008F6130008F613000000000000000
      0000000000000000000000000000000000000000000096575700965759009757
      5A0097575A0097575A0097575A0097575A0097575A0097575A0097575A009757
      5A0097575A0097575A008C505200000000000000000000000000000000000000
      000000000000000000008E602F008F6130008F6130008F613000000000000000
      00008F6130008F61300000000000000000000000000000000000000000000000
      00000000000000000000000000008F6130008F61300000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000D63C8000D63C8000965
      D1000665D4000466D8000366DB000267DD000167DE00000000000366DB000366
      DB000267DD00000000000366DB000000000000000000E6790200E6790200EA7A
      0100EA7A0100EE7B0100EE7B0100EE7B0100EF7B000000000000EE7B0100EF7B
      0000EF7B000000000000F17C0000000000000000000000000000000000000000
      000000000000000000008A5E29008B5E2A008B5E2A008C5F2B00000000000000
      000000000000000000000000000000000000000000008D602D008D602E008D60
      2E0000000000000000008D602D008D602D008D602D0000000000000000008D60
      2E008D602E008F6130000000000000000000000000000D63C8000665D4000267
      DD000067E0000067E0000067E0000067E0000067E000000000000167DE000067
      E0000067E000000000000167DE000000000000000000EA7A0100EE7B0100F17C
      0000F37D0000F37D0000F37D0000F37D0000F37D000000000000F17C0000F37D
      0000F37D000000000000F37D0000000000000000000000000000000000000000
      00008A5E2900000000008B5E2A00C3A27600C3A276008C5F2C00000000008C5F
      2C0000000000000000000000000000000000000000008D602E008E602F008E60
      2F0000000000000000008D602E008D602E008E602F0000000000000000008E60
      2F008F6130008F6130000000000000000000000000000965D1000267DD000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EE7B0100F37D00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008A5D
      2900BD9C6F008B5E2A008C5F2C00C5A57A00C7A77D008D602D008D602D00C5A5
      7A008D602D0000000000000000000000000000000000000000008D602E000000
      00000000000000000000000000008D602E000000000000000000000000000000
      00008F613000000000000000000000000000000000000665D4000067E0000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EE7B0100F37D00000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008A5E2900BD9C
      6F00C3A27600C5A57A00C9A87E00CBAA8100CBAA8100CBAA8100CBAA8100C9A8
      7E00C9A87E008D602E00000000000000000000000000000000008D602E008D60
      2E008D602E008D602E008D602E008D602E008E602F008E602F008E602F008F61
      30008F613000000000000000000000000000000000000466D8000067E0000000
      0000000000000267DD000267DD000167DE000067E000000000000067E0000067
      E0000067E000000000000167DE000000000000000000EF7B0000F37D00000000
      000000000000F17C0000F17C0000F17C0000F37D000000000000F37D0000F37D
      0000F37D000000000000F37D0000000000000000000000000000000000008B5E
      2A00C5A57A00C9A87E00CCAB8300CDAD8500CDAD8500CDAD8500CDAD8500CCAC
      83008E602F000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008D602E000000000000000000000000000000
      000000000000000000000000000000000000000000000466D8000267DD000000
      0000000000000466D8000366DB000167DE000067E000000000000067E0000067
      E0000067E000000000000167DE000000000000000000EE7B0100F17C00000000
      000000000000EE7B0100F17C0000F17C0000F37D000000000000F37D0000F37D
      0000F37D000000000000F37D000000000000000000008A5E29008B5E2A008C5F
      2C00C9A87E00CCAB8300CDAD8500CEAE8600CEAE8600CEAE8600CEAE8600CEAE
      86008F6130008E602F008E602F0000000000000000008C5F2C008C5F2B008C5F
      2C008C5F2C008D602D008D602D008D602D008D602E008D602D008D602E008D60
      2E008D602E008E602F000000000000000000000000000665D4000466D8000000
      0000000000000466D8000267DD00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EA7A0100EE7B01000000
      000000000000EF7B0000F17C0000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008B5E2A00C3A27600C5A5
      7A00CBAA8100CDAD8500CEAE8600CEAE8600CEAE8600CEAE8600CEAE8600CEAE
      8600CEAE8600CEAE86008F61300000000000000000008C5F2C00C3A27600C5A5
      7A00C9A87E00C9A87E00CBAA8100CBAA8100CBAA8100CBAA8100CBAA8100CBAA
      8100CBAA81008E602F000000000000000000000000000665D4000466D8000000
      0000000000000067E0000067E000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EA7A0100EE7B01000000
      000000000000F37D0000F37D0000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008B5E2A00C3A27600C7A7
      7D00CBAA8100CDAD8500CEAE8600CEAE8600CEAE8600CEAE8600CEAE8600CEAE
      8600CEAE8600CEAE86008F61300000000000000000008C5F2C00C3A27600C5A5
      7A00CBAA8100CBAA8100CCAB8300CCAB8300CCAB8300CCAB8300CCAC8300CDAD
      8500CDAD85008E602F000000000000000000000000000665D4000466D8000267
      DD000067E0000067E0000067E0000067E0000067E000000000000067E0000067
      E0000067E000000000000167DE000000000000000000EA7A0100EF7B0000F17C
      0000F37D0000F37D0000F37D0000F37D0000F37D000000000000F37D0000F37D
      0000F37D000000000000F37D000000000000000000008C5F2B008C5F2C008D60
      2D00CBAA8100CDAD8500CEAE8600CEAE8600CEAE8600CEAE8600CEAE8600CEAE
      86008F6130008F6130008F61300000000000000000008C5F2C00C5A57A00C9A8
      7E00CBAA8100CDAD8500CDAD8500CDAD8500CDAD8500CDAD8500CEAE8600CEAE
      8600CEAE86008F6130000000000000000000000000000965D1000366DB000067
      E0000067E0000067E0000067E0000067E0000067E000000000000067E0000067
      E0000067E000000000000167DE000000000000000000EA7A0100F17C0000F37D
      0000F37D0000F37D0000F37D0000F37D0000F37D000000000000F37D0000F37D
      0000F37D000000000000F37D0000000000000000000000000000000000008D60
      2D00CBAA8100CDAD8500CEAE8600CEAE8600CEAE8600CEAE8600CEAE8600CEAE
      86008F613000000000000000000000000000000000008C5F2C00C5A57A00CBAA
      8100CEAE8600CEAE8600CEAE8600CEAE8600CEAE8600CEAE8600CEAE8600CEAE
      8600CEAE86008F6130000000000000000000000000000965D1000267DD000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EA7A0100F17C00000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008C5F2C00C5A5
      7A00C9A87E00CCAC8300CEAE8600CEAE8600CEAE8600CEAE8600CEAE8600CEAE
      8600CEAE86008F6130000000000000000000000000008C5F2C00C7A77D00CBAA
      8100CEAE8600CEAE8600CEAE8600CEAE8600CEAE8600CEAE8600CEAE8600CEAE
      8600CEAE86008F6130000000000000000000000000000965D1000267DD000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EE7B0100F37D00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008D60
      2D00C9A87E008E602F008F613000CEAE8600CEAE86008F6130008F613000CEAE
      86008F613000000000000000000000000000000000008D602D00C9A87E00CCAB
      8300CEAE8600CEAE8600CEAE8600CEAE8600CEAE8600CEAE8600CEAE8600CEAE
      8600CEAE86008F6130000000000000000000000000000665D4000167DE000067
      E0000067E0000067E0000067E0000067E0000067E000000000000067E0000067
      E0000067E000000000000067E0000000000000000000EE7B0100F37D0000F37D
      0000F37D0000F37D0000F37D0000F37D0000F37D000000000000F37D0000F37D
      0000F37D000000000000F37D0000000000000000000000000000000000000000
      00008D602E00000000008E602F00CEAE8600CEAE86008F613000000000008F61
      300000000000000000000000000000000000000000008D602E008D602E008E60
      2F008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F6130000000000000000000000000000466D8000167DE000067
      E0000067E0000067E0000067E0000067E0000067E000000000000067E0000067
      E0000067E000000000000067E0000000000000000000F17C0000F37D0000F37D
      0000F37D0000F37D0000F37D0000F37D0000F37D000000000000F37D0000F37D
      0000F37D000000000000F37D0000000000000000000000000000000000000000
      000000000000000000008E602F008F6130008F6130008F613000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008B5E2A008C5F2B008C5F2C008C5F2C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008C5F2B008C5F2C008D602D008D602D00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000895D2700895D2700895D2700895D
      2700895D2700895D2700895D2700000000000000000000000000000000000000
      000000000000000000008F6130008F6130008F6130008F613000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008A5E2900000000008B5E2A0098652D0098652D008C5F2C00000000008C5F
      2C00000000000000000000000000000000000000000000000000000000000000
      0000895D2700000000008B5E2A00337ECE00337ECE008D602D00000000008C5F
      2C0000000000000000000000000000000000000000000000000077500E007750
      0E0078510F007D5416000000000000000000895D2700F4DBBB00F4DBBB00F4DB
      BB00F4DBBB00F4DBBB00895D2700000000000000000000000000000000000000
      00008E602F00000000008F61300000000000000000008F613000000000008F61
      3000000000000000000000000000000000000000000000000000000000008A5D
      290097632B008B5E2A008C5F2C009A662F009B6630008D602D008D602D009A65
      2E008D602D00000000000000000000000000000000000000000000000000895D
      2700397ABF008A5D29008C5F2C00327ED200327ED2008D602D008D602D00327E
      D2008D602D00000000000000000000000000000000000000000077500E007750
      0E00835B15007F561A000000000000000000875C2600F4DBBB00F37D0000F37D
      0000F37D0000F4DBBB00895D2700000000000000000000000000000000008E60
      2F00000000008F6130008F61300000000000000000008F6130008F6130000000
      00008F61300000000000000000000000000000000000000000008A5E29009763
      2B0098652D009A652E009B6630009D6731009D6731009D6731009D6731009D67
      31009B6630008D602E00000000000000000000000000000000008A5E2900397A
      BF00337ECE00337ECE003080D9002D81DF002D81DF002D81DF002D81DF003080
      D9003080D9008D602E000000000000000000000000000000000077500E007A53
      11007C5415007F561A0092692D00875C2600895D2700F4DBBB00F4DBBB00F4DB
      BB00F4DBBB00F4DBBB00895D27000000000000000000000000008D602E000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008F61300000000000000000000000000000000000000000008B5E
      2A009A652E009D6731009D6731009E6832009E6832009E6832009E6832009D67
      31008E602F000000000000000000000000000000000000000000000000008B5E
      2A00337ECE003080D9002D81DF002C82E2002C83E4002C83E4002C82E2002C82
      E2008E602F00000000000000000000000000000000000000000077500E008961
      190080561B006E9891006E98910069796200895D2700F4DBBB00F37D0000F37D
      0000F37D0000F4DBBB00895D2700000000000000000000000000000000008F61
      3000000000000000000000000000000000000000000000000000000000000000
      00008F613000000000000000000000000000000000008C5F2B008B5E2A008C5F
      2C009B6630009D6731009E6832009E6832009E6832009E6832009E6832009E68
      32008F6130008E602F008E602F0000000000000000008C5F2B008B5E2A008C5F
      2C003080D9002D81DF002C82E2002B83E5002B83E5002B83E6002B83E6002B83
      E6008F6130008E602F008E602F0000000000000000000000000077500E009269
      1D0082581D0067B0AE006BBBCD0067B0AE00895D2700F4DBBB00F4DBBB00F4DB
      BB00F4DBBB00F4DBBB00895D270000000000000000008D602E008F6130008F61
      3000000000000000000000000000000000000000000000000000000000000000
      00008E602F008E602F008E602F0000000000000000008C5F2C0099652E009A66
      2F009D6731009E6832009E6832009E6832009E6832009E6832009E6832009E68
      32009E6832009E6832008F61300000000000000000008C5F2C00337ECE00327E
      D2002D81DF002C82E2002B83E5002B83E6002B83E6002B83E6002B83E6002B83
      E6002B83E6002B83E5008F61300000000000000000000000000077500E009269
      1D00845920006BBBCD005FC2E2008C5F2C00895D2700F4DBBB00F37D0000F37D
      0000F37D0000F4DBBB00895D270000000000000000008E602F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008F61300000000000000000008D602D009A652E009B66
      30009D6731009E6832009E6832009E6832009E6832009E6832009E6832009E68
      32009E6832009E6832008F61300000000000000000008D602D00337ECE00327E
      D2002D81DF002C83E4002B83E5002B83E6002B83E6002B83E6002B83E6002B83
      E6002B83E6002B83E6008F61300000000000000000000000000077500E009269
      1D00855A21006BBBCD006ACFF5008F613000895D2700F4DBBB00F4DBBB00F4DB
      BB00F4DBBB00F4DBBB00895D270000000000000000008E602F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008F61300000000000000000008D602D008D602D008D60
      2D009D6731009E6832009E6832009E6832009E6832009E6832009E6832009E68
      32008F6130008F6130008F61300000000000000000008D602D008D602D008D60
      2D002D81DF002C83E4002B83E6002B83E6002B83E6002B83E6002B83E6002B83
      E6008F6130008F6130008F61300000000000000000000000000077500E009269
      1D00855A21006BBBCD006ACFF5006ACFF500895D2700F4DBBB00F37D0000F37D
      0000F37D0000F4DBBB00895D270000000000000000008E602F008F6130008F61
      3000000000000000000000000000000000000000000000000000000000000000
      00008E602F008F6130008F613000000000000000000000000000000000008D60
      2D009D6731009E6832009E6832009E6832009E6832009E6832009E6832009E68
      32008F6130000000000000000000000000000000000000000000000000008D60
      2D002D81DF002C82E2002B83E6002B83E6002B83E6002B83E6002B83E6002B83
      E6008F6130000000000000000000000000000000000000000000795211009B70
      2400875C26008F6130008F6130008F613000895D2700F4DBBB00F4DBBB00F4DB
      BB00F4DBBB00F4DBBB00895D2700000000000000000000000000000000008F61
      3000000000000000000000000000000000000000000000000000000000000000
      00008F61300000000000000000000000000000000000000000008C5F2C009A65
      2E009D6731009D6731009E6832009E6832009E6832009E6832009E6832009E68
      32009E6832008F613000000000000000000000000000000000008C5F2C00327E
      D2003080D9002C82E2002B83E6002B83E6002B83E6002B83E6002B83E6002B83
      E6002B83E6008F613000000000000000000000000000000000007E551800BB8C
      3500D8AB4D00E6B65200E6B65200E6B65200895D2700895D2700895D2700895D
      2700895D2700895D2700895D27000000000000000000000000008F6130000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008F61300000000000000000000000000000000000000000008D60
      2D009B6630008E602F008F6130009E6832009E6832008F6130008F6130009E68
      32008F6130000000000000000000000000000000000000000000000000008D60
      2D003080D9008E602F008F6130002B83E6002B83E6008F6130008F6130002B83
      E6008F613000000000000000000000000000000000000000000084592000D8AB
      4D00E6B65200E6B65200E6B65200E6B65200E6B65200E6B65200E6B65200E6B6
      5200E6B652009366370000000000000000000000000000000000000000008F61
      3000000000008F6130008E602F0000000000000000008E602F008F6130000000
      00008F6130000000000000000000000000000000000000000000000000000000
      00008D602E00000000008E602F009E6832009E6832008F613000000000008F61
      3000000000000000000000000000000000000000000000000000000000000000
      00008D602E00000000008E602F002B83E5002B83E6008F613000000000008F61
      30000000000000000000000000000000000000000000000000008C5F2C008F61
      30008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F61300000000000000000000000000000000000000000000000
      00008F613000000000008F61300000000000000000008F613000000000008F61
      3000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008E602F008F6130008F6130008F613000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008E602F008F6130008F6130008F613000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008F6130008F6130008F6130008F613000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008C5F2B008C5F2C008D602D008D602D00000000000000
      0000000000000000000000000000000000000000000077500E0077500E007750
      0E0077500E0077500E0077500E0077500E0077500E0077500E0077500E007750
      0E0077500E0077500E0077500E00000000008F6130008F6130008F6130008F61
      30008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F6130008F6130008F6130000000000000000000000000000000
      000000000000000000000000000000000000000000008D602E00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008A5E2900000000008B5E2A0045A68D0045A68D008D602D00000000008C5F
      2C00000000000000000000000000000000000000000077500E00409CD500409C
      D5003E9DDB003E9DDB003E9DDB003E9DDB003E9DDB003E9DDB003E9DDB003CA0
      E2003BA2E70039A5EE0077500E00000000008F613000ECECEC00ECECEC00ECEC
      EC00ECECEC008F613000ECECEC00ECECEC00ECECEC00ECECEC008F613000ECEC
      EC00ECECEC00ECECEC00ECECEC008F6130000000000000000000000000000000
      0000000000000000000000000000000000008D602E008D602E00000000000000
      0000000000000000000000000000000000000000000000000000000000008A5D
      29004A9E82008A5E29008C5F2C0045A68D0043AB93008D602D008D602D0045A6
      8D008D602D00000000000000000000000000000000000000000077500E003E9D
      DB003CA0E2003BA2E7003BA2E7008D602E008D602E003BA2E70039A5EE0038A6
      F20037A7F40077500E0000000000000000008F613000ECECEC001260C0001260
      C000ECECEC008F613000ECECEC001260C0001260C000ECECEC008F613000ECEC
      EC001260C0001260C000ECECEC008F6130000000000000000000000000000000
      00000000000000000000000000008D602E00CB9D6C008D602E00000000008D60
      2E000000000000000000000000000000000000000000000000008A5E29004A9E
      820045A68D0045A68D0043AB930041AE980041AE980041AE980041AE980043AB
      930043AB93008D602E000000000000000000000000000000000077500E003E9D
      DB003BA2E70039A5EE0039A5EE008F6130008F61300037A7F40037A7F40037A7
      F40037A7F40077500E0000000000000000008F613000ECECEC00ECECEC00ECEC
      EC00ECECEC008F613000ECECEC00ECECEC00ECECEC00ECECEC008F613000ECEC
      EC00ECECEC00ECECEC00ECECEC008F6130000000000000000000000000008D60
      2E008D602E008D602E008D602E00CB9D6C00CB9D6C008D602E00000000000000
      00008D602E000000000000000000000000000000000000000000000000008B5E
      2A0045A68D0043AB930041AE980040B09B003FB19D003FB19D0040B09B0040B0
      9B008E602F000000000000000000000000000000000000000000000000007750
      0E003CA0E20039A5EE0038A6F20037A7F40037A7F40037A7F40037A7F40037A7
      F40077500E000000000000000000000000008F613000ECECEC001260C0001260
      C000ECECEC008F613000ECECEC001260C0001260C000ECECEC008F613000ECEC
      EC001260C0001260C000ECECEC008F6130000000000000000000000000008D60
      2E00CB9D6C008D602E00CB9D6C00CB9D6C00CB9D6C008D602E00000000000000
      00008D602E00000000000000000000000000000000008A5E29008A5E29008C5F
      2C0043AB930041AE980040B09B003FB19D003FB19D003FB19D003FB19D003FB1
      9D008F6130008E602F008E602F00000000000000000000000000000000007750
      0E003E9DDB003BA2E70039A5EE008F6130008F61300037A7F40037A7F40037A7
      F40077500E000000000000000000000000008F613000ECECEC00ECECEC00ECEC
      EC00ECECEC008F613000ECECEC00ECECEC00ECECEC00ECECEC008F613000ECEC
      EC00ECECEC00ECECEC00ECECEC008F6130000000000000000000000000008D60
      2E00CB9D6C008D602E00CB9D6C00CB9D6C00CB9D6C008D602E00000000000000
      00008D602E00000000000000000000000000000000008B5E2A0045A68D0045A6
      8D0041AE980040B09B003FB19D003FB19D003FB19D003FB19D003FB19D003FB1
      9D003FB19D003FB19D008F613000000000000000000000000000000000000000
      000077500E003CA0E20039A5EE008F6130008F61300037A7F40037A7F4007750
      0E00000000000000000000000000000000008F613000ECECEC001260C0001260
      C000ECECEC008F613000ECECEC001260C0001260C000ECECEC008F613000ECEC
      EC001260C0001260C000ECECEC008F6130000000000000000000000000008D60
      2E00CB9D6C008D602E00CB9D6C00CB9D6C00CB9D6C008D602E00000000000000
      00008D602E00000000000000000000000000000000008B5E2A0045A68D0043AB
      930041AE98003FB19D003FB19D003FB19D003FB19D003FB19D003FB19D003FB1
      9D003FB19D003FB19D008F613000000000000000000000000000000000000000
      000077500E003E9DDB003BA2E7008F6130008F61300037A7F40037A7F4007750
      0E00000000000000000000000000000000008F613000ECECEC00ECECEC00ECEC
      EC00ECECEC008F613000ECECEC00ECECEC00ECECEC00ECECEC008F613000ECEC
      EC00ECECEC00ECECEC00ECECEC008F6130000000000000000000000000008D60
      2E00CB9D6C008D602E00CB9D6C00CB9D6C00CB9D6C008D602E00000000000000
      00008D602E00000000000000000000000000000000008C5F2B008C5F2C008D60
      2D0041AE98003FB19D003FB19D003FB19D003FB19D003FB19D003FB19D003FB1
      9D008F6130008F6130008F613000000000000000000000000000000000000000
      00000000000077500E003CA0E2008F6130008F61300037A7F40077500E000000
      0000000000000000000000000000000000008F613000ECECEC001260C0001260
      C000ECECEC008F613000ECECEC001260C0001260C000ECECEC008F613000ECEC
      EC001260C0001260C000ECECEC008F6130000000000000000000000000008D60
      2E008D602E008D602E008D602E00CB9D6C00CB9D6C008D602E00000000000000
      00008D602E000000000000000000000000000000000000000000000000008D60
      2D0041AE980040B09B003FB19D003FB19D003FB19D003FB19D003FB19D003FB1
      9D008F6130000000000000000000000000000000000000000000000000000000
      00000000000077500E003CA0E20038A6F20037A7F40037A7F40077500E000000
      0000000000000000000000000000000000008F613000ECECEC00ECECEC00ECEC
      EC00ECECEC008F613000ECECEC00ECECEC00ECECEC00ECECEC008F613000ECEC
      EC00ECECEC00ECECEC00ECECEC008F6130000000000000000000000000000000
      00000000000000000000000000008D602E00CB9D6C008D602E00000000008D60
      2E000000000000000000000000000000000000000000000000008C5F2C0045A6
      8D0043AB930040B09B003FB19D003FB19D003FB19D003FB19D003FB19D003FB1
      9D003FB19D008F61300000000000000000000000000000000000000000000000
      0000000000000000000077500E0038A6F20037A7F40077500E00000000000000
      0000000000000000000000000000000000008F613000ECECEC001260C0001260
      C000ECECEC008F613000ECECEC001260C0001260C000ECECEC008F613000ECEC
      EC001260C0001260C000ECECEC008F6130000000000000000000000000000000
      0000000000000000000000000000000000008D602E008D602E00000000000000
      0000000000000000000000000000000000000000000000000000000000008D60
      2D0043AB93008E602F008F6130003FB19D003FB19D008F6130008F6130003FB1
      9D008F6130000000000000000000000000000000000000000000000000000000
      0000000000000000000077500E0038A6F20037A7F40077500E00000000000000
      0000000000000000000000000000000000008F613000ECECEC00ECECEC00ECEC
      EC00ECECEC008F613000ECECEC00ECECEC00ECECEC00ECECEC008F613000ECEC
      EC00ECECEC00ECECEC00ECECEC008F6130000000000000000000000000000000
      000000000000000000000000000000000000000000008D602E00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008D602E00000000008E602F003FB19D003FB19D008F613000000000008F61
      3000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000077500E0077500E0000000000000000000000
      0000000000000000000000000000000000008F6130008F6130008F6130008F61
      30008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F6130008F6130008F6130000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008E602F008F6130008F6130008F613000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001446E0000000000000000000000000000F45EA0000000000000000000000
      00001245E5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001446
      E0001446E0001245E500000000000F45EA000F45EA000F45EA00000000000F45
      EA000F45EA000E45EC0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000077500E0077500E007750
      0E0077500E0077500E0077500E0077500E0077500E0077500E0077500E007750
      0E0077500E0077500E0077500E00000000000000000000000000000000000000
      000000000000000000000000000000000000000000008C5F2B008D602D000000
      00000000000000000000000000000000000000000000000000001446E0001245
      E500000000000F45EA000F45EA000F45EA00000000000F45EA000E45EC000D45
      EF00000000000D45EF000D45EF00000000000000000000000000000000007750
      0E0077500E000000000000000000000000000000000000000000000000000000
      000077500E0077500E0000000000000000000000000077500E006EDCE0006EDC
      E0006EDFE4006EDFE4006EDFE4006EDFE4006EDFE4006EDFE4006EDFE4006EE4
      EC006EE9F3006DEFFC0077500E00000000000000000000000000000000000000
      0000000000000000000000000000000000008B5E2A00E8E2D5008D602D000000
      00000000000000000000000000000000000000000000000000001446E0000000
      000000000000000000000E45EC000000000000000000000000000D45EF000000
      000000000000000000000D45EF0000000000000000000000000077500E007750
      0E00000000000000000000000000000000000000000000000000000000000000
      00000000000077500E0077500E0000000000000000000000000077500E006EDF
      E4006EE4EC006EE9F3006EE9F3008D602E008D602E006EE9F3006EE9F3006DEF
      FC006DF1FF0077500E0000000000000000000000000000000000000000000000
      0000000000008A5D29008A5E29008B5E2A008C5F2B00EDE8DE008D602D000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000077500E000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000077500E0000000000000000000000000077500E006EDF
      E4006EE9F3006EE9F3006DEFFC008F6130008F6130006DF1FF006DF1FF006DF1
      FF006DF1FF0077500E0000000000000000000000000000000000000000008A5D
      29008A5D2900E3DBCC00E8E2D500EDE8DE00F2EEE600F4F1EB00F2EEE6008D60
      2D008D602D000000000000000000000000000000000000000000000000007750
      0E0077500E0077500E0077500E0077500E0077500E0077500E0077500E000000
      000077500E0077500E000000000000000000000000000000000077500E000000
      00000000000077500E0077500E00000000000000000000000000000000000000
      0000000000000000000077500E00000000000000000000000000000000007750
      0E006EE4EC006EE9F3006DEFFC006DF1FF006DF1FF006DF1FF006DF1FF006DF1
      FF0077500E0000000000000000000000000000000000000000008A5D2900E3DB
      CC00E8E2D500EDE8DE00F2EEE600F4F1EB00F7F4F000F8F7F200F7F4F000F4F1
      EB00F2EEE6008D602D000000000000000000000000000000000077500E007750
      0E00000000000000000077500E0077500E000000000077500E0077500E007750
      0E000000000077500E0077500E0000000000000000000000000077500E000000
      00000000000077500E0077500E0000000000000000000000000077500E000000
      0000000000000000000077500E00000000000000000000000000000000007750
      0E006EDFE4006EE9F3006DEFFC008F6130008F6130006DF1FF006DF1FF006DF1
      FF0077500E00000000000000000000000000000000008A5E2900E3DBCC00E8E2
      D500EDE8DE00F4F1EB00F7F4F000F9F8F400FAF9F500FAF9F500F9F8F400F8F7
      F200F7F4F000F4F1EB008E602F0000000000000000000000000077500E007750
      0E00000000000000000077500E0077500E000000000077500E0077500E000000
      00000000000077500E0077500E0000000000000000000000000077500E000000
      000000000000000000000000000000000000000000000000000077500E000000
      0000000000000000000077500E00000000000000000000000000000000000000
      000077500E006EE4EC006EE9F3008F6130008F6130006DF1FF006DF1FF007750
      0E0000000000000000000000000000000000000000008B5E2A00E8E2D500EDE8
      DE00F4F1EB00F9F8F400FAF9F600FAF9F600FBFAF700FBFAF700FBFAF700FBFA
      F700FBFAF700FAF9F5008F613000000000000000000000000000000000007750
      0E0077500E0077500E0077500E0077500E000000000077500E0077500E000000
      00000000000077500E0077500E0000000000000000000000000077500E000000
      00000000000000000000000000000000000077500E0077500E0077500E007750
      0E0077500E000000000077500E00000000000000000000000000000000000000
      000077500E006EDFE4006EE9F3008F6130008F6130006DF1FF006DF1FF007750
      0E0000000000000000000000000000000000000000008B5E2A00EDE8DE00F2EE
      E600F8F7F200FAF9F600FBFAF700FBFAF700FBFAF700FBFAF700FBFAF700FBFA
      F700FBFAF700FBFAF7008F613000000000000000000000000000000000000000
      0000000000000000000077500E0077500E000000000077500E0077500E007750
      0E000000000077500E0077500E0000000000000000000000000077500E000000
      000000000000000000000000000000000000000000000000000077500E000000
      0000000000000000000077500E00000000000000000000000000000000000000
      00000000000077500E006EE4EC008F6130008F6130006DF1FF0077500E000000
      000000000000000000000000000000000000000000008C5F2B00EDE8DE00F2EE
      E600F8F7F200FBFAF700FBFAF700FBFAF700FBFAF700FBFAF700FBFAF700FBFA
      F700FBFAF700FBFAF7008F613000000000000000000000000000000000007750
      0E0077500E0077500E0077500E00000000000000000077500E0077500E000000
      000077500E0077500E000000000000000000000000000000000077500E007750
      0E0000000000000000000000000000000000000000000000000077500E000000
      00000000000077500E0077500E00000000000000000000000000000000000000
      00000000000077500E006EE4EC006DEFFC006DF1FF006DF1FF0077500E000000
      00000000000000000000000000000000000000000000000000008D602D00F2EE
      E600F7F4F000FAF9F500FBFAF700FBFAF700FBFAF700FBFAF700FBFAF700FBFA
      F700FBFAF7008F61300000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000077500E0077500E000000
      0000000000000000000000000000000000000000000000000000000000007750
      0E0077500E000000000000000000000000000000000000000000000000000000
      000077500E0077500E0000000000000000000000000000000000000000000000
      0000000000000000000077500E006DEFFC006DF1FF0077500E00000000000000
      0000000000000000000000000000000000000000000000000000000000008D60
      2D008D602E00F7F4F000FAF9F500FBFAF700FBFAF700FBFAF700FBFAF7008F61
      30008F6130000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000077500E0077500E0077500E000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000077500E006DEFFC006DF1FF0077500E00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008E602F008E602F008F6130008F6130008F6130008F6130000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000077500E0077500E0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008F6130008F6130008F61
      30008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F6130008F613000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008F6130008F6130008F61
      30008F6130008F6130008F6130008F6130000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008B5E2A008B5E2A008F6130008F6130008F6130008F61
      30008F6130008F6130008F61300000000000000000008F613000ECECEC00ECEC
      EC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC008F613000000000008F6130008F6130008F6130008F61
      30008F6130008F6130008F61300000000000000000008F613000ECECEC00ECEC
      EC00ECECEC00ECECEC00ECECEC008F6130000000000000000000000000000000
      000000000000000000008B5E2A008B5E2A008B5E2A0077500E0077500E007750
      0E0077500E0077500E0077500E00000000000000000000000000000000000000
      000000000000000000008F613000ECECEC00ECECEC00ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC008F61300000000000000000008F613000ECECEC001260
      C0001260C0001260C0001260C0008F6130008F6130001260C0001260C0001260
      C0001260C000ECECEC008F613000000000008F613000ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC008F61300000000000000000008F613000ECECEC001260
      C0001260C0001260C000ECECEC008F6130000000000000000000000000000000
      000000000000000000008F613000ECECEC00ECECEC00ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC0077500E00000000000000000000000000000000000000
      000000000000000000008F613000ECECEC001260C0001260C0001260C0001260
      C0001260C000ECECEC008F61300000000000000000008F613000ECECEC00ECEC
      EC00ECECEC00ECECEC008F613000FFD48B00FFD48B008F613000ECECEC00ECEC
      EC00ECECEC00ECECEC008F613000000000008F613000ECECEC001260C0001260
      C0001260C000ECECEC008F61300000000000000000008F613000ECECEC00ECEC
      EC00ECECEC00ECECEC00ECECEC008F6130000000000000000000000000000000
      000000000000000000008F613000ECECEC00ECECEC00ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC0077500E00000000000000000000000000000000000000
      000083581F00000000008F613000ECECEC00ECECEC00ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC008F61300000000000000000008F613000ECECEC001260
      C0001260C0008F613000FFD48B00FFD48B00FFD48B00FFD48B008F6130001260
      C0001260C000ECECEC008F613000000000008F613000ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC008F6130008F6130008F6130008F613000ECECEC001260
      C0001260C0001260C000ECECEC008F6130000000000000000000000000000000
      000083581F00000000008F6130008B5E2A008C5F2C008D602D0083581F008358
      1F0083581F007B53140077500E00000000000000000000000000000000008B5E
      2A00875C26000000000000000000ECECEC001260C0001260C0001260C0001260
      C0001260C000ECECEC008F61300000000000000000008F613000ECECEC00ECEC
      EC008F613000FFD48B00FFD48B00FFD48B00FFD48B00FFD48B00FFD48B008F61
      3000ECECEC00ECECEC008F613000000000008F613000ECECEC001260C0001260
      C0001260C000ECECEC008F61300000000000000000008F613000ECECEC00ECEC
      EC00ECECEC00ECECEC00ECECEC008F6130000000000000000000000000008B5E
      2A00875C2600000000000000000000000000000000008F613000ECECEC00ECEC
      EC00ECECEC00ECECEC0077500E000000000000000000000000008F6130008F61
      30008F6130008F6130008F613000ECECEC00ECECEC00ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC008F61300000000000000000008F613000ECECEC001260
      C0008F6130008F6130008F613000FFD48B00FFD48B008F6130008F6130008F61
      30001260C000ECECEC008F613000000000008F613000ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC008F61300000000000000000008F613000ECECEC001260
      C0001260C0001260C000ECECEC008F61300000000000000000008F6130008F61
      30008F6130008F6130008F6130008F613000000000008F613000ECECEC00ECEC
      EC00ECECEC00ECECEC0077500E0000000000000000008F6130008F6130008F61
      30008F6130008F6130008F613000ECECEC001260C0001260C0001260C0001260
      C0001260C000ECECEC008F61300000000000000000008F613000ECECEC00ECEC
      EC00ECECEC00ECECEC008F613000FFD48B00FFD48B008F613000ECECEC00ECEC
      EC00ECECEC00ECECEC008F613000000000008F613000ECECEC001260C0001260
      C0001260C000ECECEC008F61300000000000000000008F613000ECECEC00ECEC
      EC00ECECEC00ECECEC00ECECEC008F613000000000008F6130008F6130008F61
      30008F6130008F6130008F6130008F613000000000008F613000845920008459
      2000845920007D54160077500E000000000000000000000000008F6130008F61
      30008F6130008F6130008F613000ECECEC00ECECEC00ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC008F61300000000000000000008F613000ECECEC001260
      C0001260C0001260C0008F613000FFD48B00FFD48B008F6130001260C0001260
      C0001260C000ECECEC008F613000000000008F613000ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC008F61300000000000000000008F613000ECECEC001260
      C0001260C0001260C000ECECEC008F61300000000000000000008F6130008F61
      30008F6130008F6130008F6130008F613000000000008F613000ECECEC00ECEC
      EC00ECECEC00ECECEC0077500E00000000000000000000000000000000008F61
      30008F6130000000000000000000ECECEC001260C0001260C0001260C0001260
      C0001260C000ECECEC008F61300000000000000000008F613000ECECEC00ECEC
      EC00ECECEC00ECECEC008F613000FFD48B00FFD48B008F613000ECECEC00ECEC
      EC00ECECEC00ECECEC008F613000000000008F613000ECECEC001260C0001260
      C0001260C000ECECEC008F6130008F6130008F6130008F613000ECECEC00ECEC
      EC00ECECEC00ECECEC00ECECEC008F6130000000000000000000000000008F61
      30008F613000000000000000000000000000000000008F613000ECECEC00ECEC
      EC00ECECEC00ECECEC0077500E00000000000000000000000000000000000000
      00008F613000000000008F613000ECECEC00ECECEC00ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC008F61300000000000000000008F613000ECECEC001260
      C0001260C0001260C0008F613000FFD48B00FFD48B008F6130001260C0001260
      C0001260C000ECECEC008F613000000000008F613000ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC008F61300000000000000000008F613000ECECEC001260
      C0001260C0001260C000ECECEC008F6130000000000000000000000000000000
      00008F613000000000008F6130008F6130008F6130008F6130008F6130008F61
      30008F61300080561B0077500E00000000000000000000000000000000000000
      000000000000000000008F613000ECECEC001260C0001260C0001260C0001260
      C0001260C000ECECEC008F61300000000000000000008F613000ECECEC00ECEC
      EC00ECECEC00ECECEC008F6130008F6130008F6130008F613000ECECEC00ECEC
      EC00ECECEC00ECECEC008F613000000000008F613000ECECEC001260C0001260
      C0001260C000ECECEC008F61300000000000000000008F613000ECECEC00ECEC
      EC00ECECEC00ECECEC00ECECEC008F6130000000000000000000000000000000
      000000000000000000008F613000FF56C400FF56C400FF56C400FF56C400FF56
      C400FF56C400FF56C40077500E00000000000000000000000000000000000000
      000000000000000000008F613000ECECEC00ECECEC00ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC008F61300000000000000000008F613000ECECEC00ECEC
      EC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC008F613000000000008F613000ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC008F61300000000000000000008F6130008F6130008F61
      30008F6130008F6130008F6130008F6130000000000000000000000000000000
      000000000000000000008F613000FF56C400FF56C400FF56C400FF56C400FF56
      C400FF56C400FF56C40077500E00000000000000000000000000000000000000
      000000000000000000008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F6130008F61300000000000000000008F6130008F6130008F61
      30008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F6130008F613000000000008F6130008F6130008F6130008F61
      30008F6130008F6130008F613000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F61300077500E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000895D2700895D2700895D2700895D
      2700895D2700895D2700895D2700000000000000000000000000000000000000
      000000000000000000000000000000000000895D2700895D2700895D2700895D
      2700895D2700895D2700895D2700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000077500E007750
      0E0078510F007D5416000000000000000000895D2700ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC00895D270000000000000000000000000077500E007750
      0E0078510F007D5416000000000000000000895D2700ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC00895D2700000000000000000000000000000000000000
      000000000000000000008F613000CB9D6C00CB9D6C0080522100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C99B6A000000000000000000000000000000
      000000000000000000000000000000000000000000000000000077500E007750
      0E00815919007E5518000000000000000000895D2700ECECEC006A9355006A93
      55006A935500ECECEC00895D270000000000000000000000000077500E007750
      0E00835B15007F561A000000000000000000875C2600ECECEC006A9355006A93
      55006A935500ECECEC00895D2700000000000000000000000000000000000000
      000000000000000000008F613000CB9D6C00C395640072441300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C99B6A000000000000000000000000000000
      000000000000000000000000000000000000000000000000000077500E007A53
      11007C54150080561B0092692D006C532300895D2700ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC00895D270000000000000000000000000077500E007A53
      11007C5415007F561A0092692D00875C2600895D2700ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC00895D2700000000000000000000000000000000000000
      000000000000000000008F613000CB9D6C00B688570072441300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C99B6A00C99B6A00C99B6A00C99B6A00C99B6A00000000000000
      000000000000000000000000000000000000000000000000000077500E00875F
      200081571C002F5B8E00365B800048576200895D2700ECECEC00ECECEC00ECEC
      EC006A935500ECECEC00895D270000000000000000000000000077500E008961
      190080561B006E9891006E98910069796200895D2700ECECEC00ECECEC00ECEC
      EC006A935500ECECEC00895D2700000000000000000000000000000000000000
      000000000000000000008F613000CB9D6C00BD905F007A4C1B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C99B6A000000000000000000000000000000
      000000000000000000000000000000000000000000000000000077500E008C63
      250083581F00205FA700205FA700275D9A00895D2700ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC00895D270000000000000000000000000077500E009269
      1D0082581D0067B0AE006BBBCD0067B0AE00895D2700ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC00895D2700000000000000000000000000000000000000
      0000000000008F6130008F6130008F6130008F61300084562500805221000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C99B6A000000000000000000000000000000
      000000000000000000000000000000000000000000000000000077500E008C63
      250084592000175FB6000665D4008C5F2C00895D2700ECECEC00ECECEC006A93
      55006A935500ECECEC00895D270000000000000000000000000077500E009269
      1D00845920006BBBCD005FC2E2008C5F2C00895D2700ECECEC00ECECEC006A93
      55006A935500ECECEC00895D2700000000000000000000000000000000000000
      00008F6130008F61300041A7FF0041A7FF0041A7FF0041A7FF00875928008456
      2500000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C99B6A00C99B6A00C99B6A0000000000000000000000
      000000000000000000000000000000000000000000000000000077500E008C63
      2500845920001260C0000064DF008F613000895D2700ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC00895D270000000000000000000000000077500E009269
      1D00855A21006BBBCD006ACFF5008F613000895D2700ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC00895D2700000000000000000000000000000000008F61
      30008F61300041A7FF0041A7FF0041A7FF0041A7FF0041A7FF0041A7FF008052
      2100774918000000000000000000000000000000000000000000000000000000
      000000000000C99B6A00000000000000000000000000C99B6A00000000000000
      000000000000000000000000000000000000000000000000000077500E008C63
      2500845920001260C0000064DF000064DF00895D2700ECECEC006A9355006A93
      55006A935500ECECEC00895D270000000000000000000000000077500E009269
      1D00855A21006BBBCD006ACFF5006ACFF500895D2700ECECEC006A9355006A93
      55006A935500ECECEC00895D2700000000000000000000000000000000008F61
      300041A7FF0041A7FF0041A7FF0041A7FF0041A7FF0041A7FF0041A7FF0041A7
      FF006A420E000000000000000000000000000000000000000000000000000000
      0000C99B6A000000000000000000000000000000000000000000C99B6A000000
      000000000000000000000000000000000000000000000000000079521100966C
      3000875C26008F6130008F6130008F613000895D2700ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC00895D2700000000000000000000000000795211009B70
      2400875C26008F6130008F6130008F613000895D2700ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC00895D2700000000000000000000000000000000008F61
      300041A7FF0041A7FF0041A7FF0041A7FF0041A7FF0041A7FF0041A7FF0041A7
      FF00673908000000000000000000000000000000000000000000000000000000
      0000C99B6A000000000000000000000000000000000000000000C99B6A000000
      00000000000000000000000000000000000000000000000000007E551800AB80
      4800C89A6900CB9D6C00CB9D6C00CB9D6C00895D2700895D2700895D2700895D
      2700895D2700895D2700895D27000000000000000000000000007E551800BB8C
      3500D8AB4D00E6B65200E6B65200E6B65200895D2700895D2700895D2700895D
      2700895D2700895D2700895D2700000000000000000000000000000000008F61
      300041A7FF0041A7FF0041A7FF0041A7FF0041A7FF0041A7FF0041A7FF0041A7
      FF00653706000000000000000000000000000000000000000000000000000000
      0000C99B6A000000000000000000000000000000000000000000C99B6A000000
      000000000000000000000000000000000000000000000000000084592000C295
      6300CB9D6C00CB9D6C00CB9D6C00CB9D6C00CB9D6C00CB9D6C00CB9D6C00CB9D
      6C00CB9D6C008F6130000000000000000000000000000000000084592000D8AB
      4D00E6B65200E6B65200E6B65200E6B65200E6B65200E6B65200E6B65200E6B6
      5200E6B652009366370000000000000000000000000000000000000000008F61
      30008E602F0041A7FF0041A7FF0041A7FF0041A7FF0041A7FF0041A7FF006537
      0600653706000000000000000000000000000000000000000000000000000000
      000000000000C99B6A00000000000000000000000000C99B6A00000000000000
      00000000000000000000000000000000000000000000000000008C5F2C008F61
      30008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F613000000000000000000000000000000000008C5F2C008F61
      30008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F61300000000000000000000000000000000000000000000000
      00008052210041A7FF0041A7FF0041A7FF0041A7FF0041A7FF0041A7FF006537
      0600000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C99B6A00C99B6A00C99B6A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000724413006A3C0B00653706006537060065370600653706000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF56
      C4000000000000000000FF56C400FF56C400FF56C400FF56C400000000000000
      0000FF56C4000000000000000000000000000000000077500E0077500E007750
      0E000000000077500E0077500E0077500E0077500E0077500E0077500E007750
      0E0077500E00000000000000000000000000000000000000000077500E007750
      0E0077500E0077500E0077500E0077500E0077500E0077500E00000000007750
      0E0077500E000000000000000000000000000000000077500E0077500E007750
      0E000000000077500E0077500E0077500E0077500E0077500E00000000007750
      0E0077500E000000000000000000000000000000000000000000FF56C400FF56
      C400000000000000000000000000000000000000000000000000000000000000
      0000FF56C400FF56C4000000000000000000000000000000000077500E007750
      0E000000000077500E0077500E000000000077500E0077500E00000000000000
      000077500E0077500E0000000000000000000000000077500E0077500E000000
      00000000000077500E0077500E000000000077500E0077500E0077500E000000
      000077500E0077500E000000000000000000000000000000000077500E007750
      0E000000000077500E0077500E000000000077500E0077500E0077500E000000
      000077500E0077500E0000000000000000000000000000000000FF56C4000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF56C4000000000000000000000000000000000077500E007750
      0E0077500E0077500E0077500E000000000077500E0077500E00000000000000
      000077500E0077500E0000000000000000000000000077500E0077500E000000
      00000000000077500E0077500E000000000077500E0077500E00000000000000
      000077500E0077500E000000000000000000000000000000000077500E007750
      0E0077500E0077500E0077500E000000000077500E0077500E00000000000000
      000077500E0077500E0000000000000000000000000000000000FF56C4000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF56C4000000000000000000000000000000000077500E007750
      0E000000000077500E0077500E000000000077500E0077500E00000000000000
      000077500E0077500E000000000000000000000000000000000077500E007750
      0E0077500E0077500E0077500E000000000077500E0077500E00000000000000
      000077500E0077500E000000000000000000000000000000000077500E007750
      0E000000000077500E0077500E000000000077500E0077500E00000000000000
      000077500E0077500E0000000000000000000000000000000000FF56C4000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF56C4000000000000000000000000000000000077500E007750
      0E000000000077500E0077500E000000000077500E0077500E0077500E007750
      0E0077500E000000000000000000000000000000000000000000000000000000
      00000000000077500E0077500E000000000077500E0077500E0077500E000000
      000077500E0077500E000000000000000000000000000000000077500E007750
      0E000000000077500E0077500E000000000077500E0077500E0077500E000000
      000077500E0077500E0000000000000000000000000000000000FF56C4000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF56C40000000000000000000000000000000000000000007750
      0E000000000077500E00000000000000000077500E0077500E00000000000000
      000077500E0077500E000000000000000000000000000000000077500E007750
      0E0077500E0077500E00000000000000000077500E0077500E00000000007750
      0E0077500E000000000000000000000000000000000000000000000000007750
      0E000000000077500E00000000000000000077500E0077500E00000000007750
      0E0077500E000000000000000000000000000000000000000000FF56C4000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF56C40000000000000000000000000000000000000000007750
      0E0077500E0077500E00000000000000000077500E0077500E00000000000000
      000077500E0077500E0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000077500E0077500E00000000000000
      0000000000000000000000000000000000000000000000000000000000007750
      0E0077500E0077500E00000000000000000077500E0077500E00000000000000
      0000000000000000000000000000000000000000000000000000FF56C4000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF56C40000000000000000000000000077500E0077500E007750
      0E0077500E0077500E000000000077500E0077500E0077500E0077500E007750
      0E0077500E000000000000000000000000000000000000000000000000000000
      000000000000000000000000000077500E0077500E0077500E00000000000000
      0000000000000000000000000000000000000000000077500E0077500E007750
      0E0077500E0077500E000000000077500E0077500E0077500E00000000000000
      0000000000000000000000000000000000000000000000000000FF56C400FF56
      C400000000000000000000000000000000000000000000000000000000000000
      0000FF56C400FF56C40000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF56
      C400000000000000000000000000000000000000000000000000000000000000
      0000FF56C4000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000645131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000073531900645131000000
      0000000000000000000000000000000000000000000077500E0077500E007750
      0E007D5418007D5418007D5418008D602D008D602D008F613000000000000000
      0000000000000000000000000000000000000000000077500E0077500E007750
      0E0077500E0077500E0077500E008B5E2A008B5E2A008B5E2A00000000000000
      0000000000000000000000000000000000000000000091633200C99B6A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000082581D009E7339000000
      00000000000000000000000000000000000077500E0077500E001260C000554F
      4E00275D9A001260C0000064DF00000000000000000077500E0061C4880061C4
      880061C4880061C4880061C4880061C4880061C488008D602D00000000000000
      0000000000000000000000000000000000000000000077500E00ECECEC00ECEC
      EC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC008F613000000000000000
      00000000000000000000000000000000000000000000FCD5AC0091633200C99B
      6A00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D5AC7B00865B2300AE82
      4C0000000000000000000000000000000000554F4E001260C0001260C0001260
      C0000064DF000064DF000064DF00000000000000000077500E0061C4880061C4
      880061C4880061C4880061C4880061C4880061C488008F613000000000000000
      0000000000000000000000000000000000000000000077500E00ECECEC00ECEC
      EC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC008F613000000000000000
      0000000000000000000000000000000000000000000000000000FCD5AC008E60
      2F00C79968000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EAC399008A5E
      2900AE824C00000000000000000000000000000000001260C0001260C0000000
      0000000000000000000000000000000000000000000077500E007B5314008358
      1F008A5E29008F6130008F6130008C5F2C008D602D008F613000000000008358
      1F00000000000000000000000000000000000000000077500E007B5314008358
      1F0083581F0083581F008D602D008C5F2C008B5E2A008F613000000000008358
      1F0000000000000000000000000000000000000000000000000000000000EAC3
      9900916332000000000091633200916332009163320091633200916332000000
      000000000000000000000000000000000000000000000000000000000000E1B7
      89008A5E290000000000865B2300875B2400895D2700895D27001260C0000000
      0000000000000000000000000000000000000000000077500E003F92B0003F92
      B0003F92B0003F92B0008F61300000000000000000000000000000000000875C
      26008B5E2A000000000000000000000000000000000077500E00ECECEC00ECEC
      EC00ECECEC00ECECEC008F61300000000000000000000000000000000000875C
      26008B5E2A000000000000000000000000000000000000000000000000000000
      00000000000091633200C3956400AD7F4E00B0844F00C7996800C99B6A008F61
      3000000000000000000000000000000000000000000000000000000000000000
      0000000000008D602D00C99B6A00C99B6A00C99B6A00C99B6A00C99B6A009163
      3200000000000000000000000000000000000000000077500E003F92B0003F92
      B0003F92B0003F92B0008F613000000000008F6130008F6130008F6130008F61
      30008F6130008F61300000000000000000000000000077500E00ECECEC00ECEC
      EC00ECECEC00ECECEC008F613000000000008F6130008F6130008F6130008F61
      30008F6130008F61300000000000000000000000000000000000000000000000
      000091633200C0926100805221006DF1FF006DF1FF006DF1FF00C0926100C092
      6100805221000000000000000000000000000000000000000000000000000000
      0000875B2400C99B6A00C99B6A00000000000000000000000000C99B6A00C99B
      6A00916332000000000000000000000000000000000077500E007D5418008459
      20008F6130008F6130008F613000000000008F6130008F6130008F6130008F61
      30008F6130008F6130008F613000000000000000000077500E007D5416008459
      200084592000845920008F613000000000008F6130008F6130008F6130008F61
      30008F6130008F6130008F613000000000000000000000000000000000000000
      000091633200AD7F4E006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF00C89A
      69007A4C1B000000000000000000000000000000000000000000000000000000
      0000865B2300C99B6A000000000000000000000000000000000000000000C99B
      6A00916332000000000000000000000000000000000078510F001E5FDA001E5F
      DA001E5FDA001E5FDA008F613000000000008F6130008F6130008F6130008F61
      30008F6130008F61300000000000000000000000000077500E00ECECEC00ECEC
      EC00ECECEC00ECECEC008F613000000000008F6130008F6130008F6130008F61
      30008F6130008F61300000000000000000000000000000000000000000000000
      000091633200B58954006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF00C99B
      6A007A4C1B000000000000000000000000000000000000000000000000000000
      0000865B2300C99B6A000000000000000000000000000000000000000000C99B
      6A009163320000000000000000000000000000000000795111001E5FDA001E5F
      DA001E5FDA001E5FDA008F613000000000000000000000000000000000008F61
      30008F6130000000000000000000000000000000000077500E00ECECEC00ECEC
      EC00ECECEC00ECECEC008F613000000000000000000000000000000000008F61
      30008F6130000000000000000000000000000000000000000000000000000000
      000091633200C99B6A006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF00C99B
      6A00724413000000000000000000000000000000000000000000000000000000
      0000865B2300C59866000000000000000000000000000000000000000000C99B
      6A0091633200000000000000000000000000000000007D54160081571C00875C
      26008F6130008F6130008F6130008F6130008F6130008F613000000000008F61
      3000000000000000000000000000000000000000000077500E0080561B008F61
      30008F6130008F6130008F6130008F6130008F6130008F613000000000008F61
      3000000000000000000000000000000000000000000000000000000000000000
      000091633200C99B6A00C89A69006DF1FF006DF1FF006DF1FF00C99B6A00AD7F
      4E006A3C0B000000000000000000000000000000000000000000000000000000
      0000895D2700C2956300C89A6900000000000000000000000000BE925F00C99B
      6A009163320000000000000000000000000000000000855A21000D45EF000D45
      EF000D45EF000D45EF000D45EF000D45EF000D45EF008F613000000000000000
      0000000000000000000000000000000000000000000077500E00ECECEC00ECEC
      EC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC008F613000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008A5C2B00BB8D5C00C99B6A00C99B6A00C99B6A00AD7F4E006A3C
      0B00000000000000000000000000000000000000000000000000000000000000
      00000000000090623100C99B6A00C99B6A00C99B6A00C99B6A00C99B6A009163
      320000000000000000000000000000000000000000008C5F2C000D45EF000D45
      EF000D45EF000D45EF000D45EF000D45EF000D45EF008F613000000000000000
      0000000000000000000000000000000000000000000077500E00ECECEC00ECEC
      EC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC008F613000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007A4C1B00774918007648170072441300673908000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000091633200916332009163320091633200916332000000
      000000000000000000000000000000000000000000008F6130008F6130008F61
      30008F6130008F6130008F6130008F6130008F6130008F613000000000000000
      0000000000000000000000000000000000000000000077500E008F6130008F61
      30008F6130008F6130008F6130008F6130008F6130008F613000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000077500E0077500E007750
      0E007D5418008B5E2A008B5E2A008B5E2A008B5E2A008B5E2A008B5E2A008B5E
      2A008B5E2A008B5E2A008B5E2A00000000000000000077500E0077500E007750
      0E007D5418008D602D008D602D008D602D008D602D008D602D008D602D008D60
      2D008D602D008D602D008D602D00000000000000000077500E0077500E007750
      0E007D5418008B5E2A008B5E2A008B5E2A008B5E2A008B5E2A008B5E2A008B5E
      2A008B5E2A008B5E2A008B5E2A00000000000000000077500E0077500E007750
      0E007D5418008D602D008D602D008D602D008D602D008D602D008D602D008D60
      2D008D602D008D602D008D602D00000000000000000077500E00FFD48B00FFD4
      8B00FFD48B00FFD48B00FFD48B00FFD48B00FFD48B00FFD48B00FFD48B00FFD4
      8B00FFD48B00FFD48B008B5E2A00000000000000000077500E00FF56C400FF56
      C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56
      C400FF56C400FF56C4008D602D00000000000000000077500E00ECECEC00ECEC
      EC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC008B5E2A00000000000000000077500E000D45EF000D45
      EF000D45EF000D45EF000D45EF000D45EF000D45EF000D45EF000D45EF000D45
      EF000D45EF000D45EF008D602D00000000000000000077500E00FFD48B00FFD4
      8B00FFD48B00FFD48B00FFD48B00FFD48B00FFD48B00FFD48B00FFD48B00FFD4
      8B00FFD48B00FFD48B008B5E2A00000000000000000077500E00FF56C400FF56
      C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56
      C400FF56C400FF56C4008D602D00000000000000000077500E00ECECEC00ECEC
      EC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC008B5E2A00000000000000000077500E000D45EF000D45
      EF000D45EF000D45EF000D45EF000D45EF000D45EF000D45EF000D45EF000D45
      EF000D45EF000D45EF008D602D00000000000000000077500E007B5314008358
      1F008A5E29008D602D008C5F2C008B5E2A008B5E2A008B5E2A008B5E2A008B5E
      2A008B5E2A008B5E2A008B5E2A00000000000000000077500E007B5314008358
      1F008A5E29008D602D008C5F2C008D602D008D602D008D602D008D602D008D60
      2D008D602D008D602D008D602D00000000000000000077500E007B5314008358
      1F008A5E29008D602D008C5F2C008B5E2A008B5E2A008B5E2A008B5E2A008B5E
      2A008B5E2A008B5E2A008B5E2A00000000000000000077500E007B5314008358
      1F008A5E29008D602D008C5F2C008D602D008D602D008D602D008D602D008D60
      2D008D602D008D602D008D602D00000000000000000077500E00FFD48B00FFD4
      8B00FFD48B00FFD48B00FFD48B00FFD48B00FFD48B00FFD48B00FFD48B00FFD4
      8B00FFD48B00FFD48B008B5E2A00000000000000000077500E00FF56C400FF56
      C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56
      C400FF56C400FF56C4008D602D00000000000000000077500E00ECECEC00ECEC
      EC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC008B5E2A00000000000000000077500E000D45EF000D45
      EF000D45EF000D45EF000D45EF000D45EF000D45EF000D45EF000D45EF000D45
      EF000D45EF000D45EF008D602D00000000000000000077500E00FFD48B00FFD4
      8B00FFD48B00FFD48B00FFD48B00FFD48B00FFD48B00FFD48B00FFD48B00FFD4
      8B00FFD48B00FFD48B008B5E2A00000000000000000077500E00FF56C400FF56
      C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56
      C400FF56C400FF56C4008D602D00000000000000000077500E00ECECEC00ECEC
      EC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC008B5E2A00000000000000000077500E000D45EF000D45
      EF000D45EF000D45EF000D45EF000D45EF000D45EF000D45EF000D45EF000D45
      EF000D45EF000D45EF008D602D00000000000000000077500E007D5416008459
      20008C5F2C008F6130008D602E008A5D2900845920007F5619007E5518007F56
      1A008B5E2A008B5E2A008B5E2A00000000000000000077500E007D5418008459
      20008C5F2C008F6130008D602E008A5D2900845920007F5619007E5518007F56
      1A00845920008D602D008D602D00000000000000000077500E007D5416008459
      20008C5F2C008F6130008D602E008A5D2900845920007F5619007E5518007F56
      1A008B5E2A008B5E2A008B5E2A00000000000000000077500E007D5418008459
      20008C5F2C008F6130008D602E008A5D2900845920007F5619007E5518007F56
      1A00845920008D602D008D602D00000000000000000077500E00FFD48B00FFD4
      8B00FFD48B00FFD48B00FFD48B00FFD48B00FFD48B00FFD48B00FFD48B00FFD4
      8B00FFD48B00FFD48B008B5E2A00000000000000000077500E00FF56C400FF56
      C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56
      C400FF56C400FF56C4008D602D00000000000000000077500E00ECECEC00ECEC
      EC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC008B5E2A00000000000000000077500E000D45EF000D45
      EF000D45EF000D45EF000D45EF000D45EF000D45EF000D45EF000D45EF000D45
      EF000D45EF000D45EF008D602D00000000000000000077500E00FFD48B00FFD4
      8B00FFD48B00FFD48B00FFD48B00FFD48B00FFD48B00FFD48B00FFD48B00FFD4
      8B00FFD48B00FFD48B008B5E2A00000000000000000077500E00FF56C400FF56
      C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56
      C400FF56C400FF56C4008D602D00000000000000000077500E00ECECEC00ECEC
      EC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC008B5E2A00000000000000000077500E000D45EF000D45
      EF000D45EF000D45EF000D45EF000D45EF000D45EF000D45EF000D45EF000D45
      EF000D45EF000D45EF008D602D00000000000000000077500E0080561B00875C
      26008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F6130008B5E2A00000000000000000077500E0081571C00875C
      26008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F6130008D602D00000000000000000077500E0080561B00875C
      26008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F6130008B5E2A00000000000000000077500E0081571C00875C
      26008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F6130008D602D00000000000000000077500E00FFD48B00FFD4
      8B00FFD48B00FFD48B00FFD48B00FFD48B00FFD48B00FFD48B00FFD48B00FFD4
      8B00FFD48B00FFD48B008F613000000000000000000077500E00FF56C400FF56
      C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56
      C400FF56C400FF56C4008F613000000000000000000077500E00ECECEC00ECEC
      EC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC008F613000000000000000000077500E000D45EF000D45
      EF000D45EF000D45EF000D45EF000D45EF000D45EF000D45EF000D45EF000D45
      EF000D45EF000D45EF008F613000000000000000000077500E00FFD48B00FFD4
      8B00FFD48B00FFD48B00FFD48B00FFD48B00FFD48B00FFD48B00FFD48B00FFD4
      8B00FFD48B00FFD48B008F613000000000000000000077500E00FF56C400FF56
      C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56
      C400FF56C400FF56C4008F613000000000000000000077500E00ECECEC00ECEC
      EC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC008F613000000000000000000077500E000D45EF000D45
      EF000D45EF000D45EF000D45EF000D45EF000D45EF000D45EF000D45EF000D45
      EF000D45EF000D45EF008F613000000000000000000077500E008F6130008F61
      30008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F6130008F613000000000000000000077500E008F6130008F61
      30008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F6130008F613000000000000000000077500E008F6130008F61
      30008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F6130008F613000000000000000000077500E008F6130008F61
      30008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F6130008F613000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008F613000CB9D6C00CB9D6C0080522100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000091633200C99B6A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000077500E0077500E007851
      0F007E5518000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008F613000CB9D6C00C395640072441300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FCD5AC0091633200C99B6A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000077500E0077500E008159
      19007F561A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008F613000CB9D6C00B688570072441300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008F6130008F613000000000000000
      00000000000000000000000000000000000000000000FCD5AC008E602F00C799
      6800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000077500E007A5311007C54
      150082581D0083581F0082581D0082581D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008F613000CB9D6C00BD905F007A4C1B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008F61300000F3FD008F6130000000
      0000000000000000000000000000000000000000000000000000EAC399009163
      3200000000009163320091633200916332009163320091633200000000000000
      0000000000000000000000000000000000000000000077500E00875F20008157
      1C00275D9A00205FA7002F5B8E00855A21000000000083581F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008F6130008F6130008F6130008F61300084562500805221000000
      0000000000000000000000000000000000000000000000000000000000008F61
      30008F6130008F6130008F6130008F6130008F61300000F3FD0000F3FD008F61
      3000000000000000000000000000000000000000000000000000000000000000
      000091633200C3956400AD7F4E00B0844F00C7996800C99B6A008F6130000000
      0000000000000000000000000000000000000000000077500E008C6325008358
      1F00175FB6000D63C800175FB600895D270000000000875C26008B5E2A000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008F6130008F6130006DF1FF006DF1FF006DF1FF006DF1FF00875928008456
      2500000000000000000000000000000000000000000000000000000000008F61
      300000F3FD0000F3FD0000F3FD0000F3FD0000F3FD0000F3FD0000F3FD0000F3
      FD008F6130000000000000000000000000000000000000000000000000009163
      3200C0926100805221006DF1FF006DF1FF006DF1FF00C0926100C09261008052
      2100000000000000000000000000000000000000000077500E008C6325008459
      20000D63C8000064DF008F6130008F6130008F6130008F6130008F6130008F61
      3000000000000000000000000000000000000000000000000000000000008F61
      30008F6130006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF008052
      2100774918000000000000000000000000000000000000000000000000008F61
      300000F3FD0000F3FD0000F3FD0000F3FD0000F3FD0000F3FD0000F3FD0000F3
      FD008F6130000000000000000000000000000000000000000000000000009163
      3200AD7F4E006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF00C89A69007A4C
      1B00000000000000000000000000000000000000000077500E008C6325008459
      20000665D4000064DF008F6130008F6130008F6130008F6130008F6130008F61
      3000000000000000000000000000000000000000000000000000000000008F61
      30006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1
      FF006A420E000000000000000000000000000000000000000000000000008F61
      30008F6130008F6130008F6130008F6130008F61300000F3FD0000F3FD008F61
      3000000000000000000000000000000000000000000000000000000000009163
      3200B58954006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF00C99B6A007A4C
      1B00000000000000000000000000000000000000000077500E008C6325008459
      20000463D8000064DF000064DF008F613000000000008F6130008F6130000000
      0000000000000000000000000000000000000000000000000000000000008F61
      30006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1
      FF00673908000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008F61300000F3FD008F6130000000
      0000000000000000000000000000000000000000000000000000000000009163
      3200C99B6A006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF00C99B6A007244
      1300000000000000000000000000000000000000000079521100966C3000875C
      26008F6130008F6130008F6130008F613000000000008F613000000000000000
      0000000000000000000000000000000000000000000000000000000000008F61
      30006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1
      FF00653706000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008F6130008F613000000000000000
      0000000000000000000000000000000000000000000000000000000000009163
      3200C99B6A00C89A69006DF1FF006DF1FF006DF1FF00C99B6A00AD7F4E006A3C
      0B0000000000000000000000000000000000000000007E551800AB804800C89A
      6900CB9D6C00CB9D6C00CB9D6C008F6130000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008F61
      30008E602F0088EBFF0088EBFF006DF1FF006DF1FF006DF1FF006DF1FF006537
      0600653706000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008A5C2B00BB8D5C00C99B6A00C99B6A00C99B6A00AD7F4E006A3C0B000000
      0000000000000000000000000000000000000000000084592000C2956300CB9D
      6C00CB9D6C00CB9D6C00CB9D6C008F6130000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008052210088EBFF0088EBFF0088EBFF006DF1FF006DF1FF006DF1FF006537
      0600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007A4C1B0077491800764817007244130067390800000000000000
      000000000000000000000000000000000000000000008C5F2C008F6130008F61
      30008F6130008F6130008F6130008F6130000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000724413006A3C0B00653706006537060065370600653706000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000077500E004C33090000000000000000000000
      0000000000000000000000000000000000000000000077500E0077500E007851
      0F007D5418008459200000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000077500E0077500E007750
      0E007D541800845920008D602D008D602D008D602D008D602D008F6130008D60
      2D008D602D008D602D008D602D00000000000000000000000000000000000000
      000000000000000000008F6130008F6130008F6130008F613000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000077500E007C5413009E7339008B5E2A00000000000000
      0000000000000000000000000000000000000000000077500E0077500E007353
      19006A935500875C260000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000077500E0061C4880061C4
      880061C4880061C4880061C4880061C4880061C4880061C488008F61300061C4
      88008F61300061C488008D602D00000000000000000000000000000000000000
      00008F6130008F61300041A7FF0041A7FF0041A7FF0041A7FF008F6130008F61
      3000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000077500E00845C1D00AB8048008F613000000000000000
      0000000000000000000000000000000000000000000077500E0077500E006E68
      37006A9355008A5E290000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000077500E0061C4880061C4
      880061C4880061C4880061C4880061C4880061C4880061C488008F61300061C4
      880061C4880061C488008D602D00000000000000000000000000000000008F61
      300041A7FF0041A7FF0041A7FF0041A7FF0041A7FF0041A7FF0041A7FF0041A7
      FF00805221000000000000000000000000000000000000000000000000000000
      0000000000000000000077500E008F662900B98C58008F613000000000000000
      0000000000000000000000000000000000000000000077500E007A5311008258
      1D008A5E29008D602D008C5F2C008B5E2A000000000000000000000000000000
      0000000000000000000000000000000000000000000077500E007B5314008358
      1F008A5E29008D602D008C5F2C008D602D008D602D008D602D008F6130008D60
      2D008D602D008D602D008D602D00000000000000000000000000000000008F61
      300041A7FF0041A7FF0041A7FF0041A7FF0041A7FF0041A7FF0041A7FF0041A7
      FF007A4C1B000000000000000000000000000000000000000000000000000000
      0000000000000000000077500E009A703500BE925F008F613000000000000000
      0000000000000000000000000000000000000000000077500E006E6837006A93
      550064B4770061C4880061C488008B5E2A000000000000000000000000000000
      0000000000000000000000000000000000000000000077500E003F92B0003F92
      B0003F92B0003F92B0003F92B0003F92B0003F92B0003F92B0008F6130003F92
      B0008F6130003F92B0008D602D000000000000000000000000008F61300041A7
      FF0041A7FF0041A7FF0041A7FF0041A7FF0041A7FF0041A7FF0041A7FF0041A7
      FF0041A7FF007244130000000000000000000000000000000000000000000000
      00000000000077500E0077500E0082581D008B5E2A008F6130008E602F000000
      0000000000000000000000000000000000000000000077500E006E6837006A93
      550064B4770061C4880064B47700895D27000000000000000000000000000000
      0000000000000000000000000000000000000000000077500E003F92B0003F92
      B0003F92B0003F92B0003F92B0003F92B0003F92B0003F92B0008F6130003F92
      B0003F92B0003F92B0008D602D000000000000000000000000008F61300041A7
      FF0041A7FF0041A7FF0041A7FF0041A7FF0041A7FF0041A7FF0041A7FF0041A7
      FF0041A7FF006A3C0B0000000000000000000000000000000000000000000000
      000077500E0077500E00000000000000000000000000000000008D602E008D60
      2D00000000000000000000000000000000000000000077500E007C5413008358
      1F008C5F2C008F6130008D602E008A5D2900845920007F5619007E5518007F56
      1A00845920000000000000000000000000000000000077500E007D5418008459
      20008C5F2C008F6130008D602E008A5D2900845920008D602D008F6130008D60
      2D008D602D008D602D008D602D000000000000000000000000008F61300041A7
      FF0041A7FF0041A7FF0041A7FF0041A7FF0041A7FF0041A7FF0041A7FF0041A7
      FF0041A7FF006537060000000000000000000000000000000000000000007750
      0E0077500E000000000000000000000000000000000000000000000000008F61
      30008F6130000000000000000000000000000000000077500E006E6837006A93
      550064B4770061C4880061C4880064B477006A9355006A9355006A9355006A93
      5500875C26000000000000000000000000000000000078510F001E5FDA001E5F
      DA001E5FDA001E5FDA001E5FDA001E5FDA001E5FDA001E5FDA008F6130001E5F
      DA008F6130001E5FDA008D602D000000000000000000000000008F61300041A7
      FF0041A7FF0041A7FF0041A7FF0041A7FF0041A7FF0041A7FF0041A7FF0041A7
      FF0041A7FF006537060000000000000000000000000000000000000000007750
      0E00000000000000000000000000000000000000000000000000000000000000
      00008F6130000000000000000000000000000000000077500E006E6837006A93
      550064B4770061C4880061C4880064B4770064B477006A9355006A93550064B4
      77008A5E290000000000000000000000000000000000795111001E5FDA001E5F
      DA001E5FDA001E5FDA001E5FDA001E5FDA001E5FDA001E5FDA008F6130001E5F
      DA001E5FDA001E5FDA008D602D00000000000000000000000000000000008F61
      300041A7FF0041A7FF0041A7FF0041A7FF0041A7FF0041A7FF0041A7FF0041A7
      FF00653706000000000000000000000000000000000000000000000000007750
      0F00000000000000000000000000000000000000000000000000000000000000
      00008F613000000000000000000000000000000000007952110080561B00875C
      26008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F6130008D602E0000000000000000007D54160081571C00875C
      26008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F6130008D602E0000000000000000000000000000000000895B
      2A0041A7FF0041A7FF0041A7FF0041A7FF0041A7FF0041A7FF0041A7FF0041A7
      FF00653706000000000000000000000000000000000000000000000000007D54
      1600000000000000000000000000000000000000000000000000000000000000
      00008F613000000000000000000000000000000000007E5518006A93550061C4
      880061C4880061C4880061C4880061C4880061C4880061C4880061C4880061C4
      880061C4880061C488008F6130000000000000000000855A21000D45EF000D45
      EF000D45EF000D45EF000D45EF000D45EF000D45EF000D45EF008F6130000D45
      EF008F6130000D45EF008F613000000000000000000000000000000000000000
      00007A4C1B007648170041A7FF0041A7FF0041A7FF0041A7FF00653706006537
      0600000000000000000000000000000000000000000000000000000000008258
      1D00875B24000000000000000000000000000000000000000000000000008F61
      30008F613000000000000000000000000000000000008459200064B4770061C4
      880061C4880061C4880061C4880061C4880061C4880061C4880061C4880061C4
      880061C4880061C488008F61300000000000000000008C5F2C000D45EF000D45
      EF000D45EF000D45EF000D45EF000D45EF000D45EF000D45EF008F6130000D45
      EF000D45EF000D45EF008F613000000000000000000000000000000000000000
      000000000000000000006A3C0B00653706006537060065370600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008B5E2A000000000000000000000000000000000000000000000000008F61
      300000000000000000000000000000000000000000008C5F2C008F6130008F61
      30008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F6130008F61300000000000000000008F6130008F6130008F61
      30008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F6130008F613000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008F6130008F6130008F6130008F6130008F6130008F6130000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008F6130008F6130008F61
      30008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F6130008F61300000000000000000008F6130008F6130008F61
      30008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F6130008F61300000000000000000008F6130008F6130008F61
      30008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F6130008F613000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008F6130000AD7FF000AD7
      FF000AD7FF000AD7FF000AD7FF000AD7FF000AD7FF000AD7FF000AD7FF000AD7
      FF000AD7FF000AD7FF008F61300000000000000000008F613000FF56C400FF56
      C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56
      C400FF56C400FF56C4008F61300000000000000000008F613000FF56C400FF56
      C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56
      C400FF56C400FF56C4008F61300000000000000000000000000077500E007750
      0E0078510F007E55180000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008F6130000AD7FF000AD7
      FF000AD7FF000AD7FF000AD7FF000AD7FF000AD7FF000AD7FF000AD7FF000AD7
      FF000AD7FF000AD7FF008F61300000000000000000008F613000FF56C400FF56
      C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56
      C400FF56C400FF56C4008F61300000000000000000008F613000FF56C400FF56
      C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56
      C400FF56C400FF56C4008F61300000000000000000000000000077500E007750
      0E00815919007F561A0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008F6130000AD7FF000AD7
      FF000AD7FF000AD7FF008F6130008F6130000AD7FF000AD7FF000AD7FF000AD7
      FF000AD7FF000AD7FF008F61300000000000000000008F613000FF56C400FF56
      C400FF56C400FF56C400FF56C400FF56C4008F6130008F613000FF56C400FF56
      C400FF56C400FF56C4008F61300000000000000000008F613000FF56C400FF56
      C400FF56C400FF56C4008F6130008F613000FF56C400FF56C400FF56C400FF56
      C400FF56C400FF56C4008F61300000000000000000000000000077500E007A53
      11007C54150082581D0083581F0082581D0082581D0000000000000000000000
      000000000000000000000000000000000000000000008F6130000AD7FF000AD7
      FF000AD7FF008F61300000F3FD008F6130000AD7FF000AD7FF000AD7FF000AD7
      FF000AD7FF000AD7FF008F61300000000000000000008F613000FF56C400FF56
      C400FF56C400FF56C400FF56C400FF56C4008F613000FFD48B008F613000FF56
      C400FF56C400FF56C4008F61300000000000000000008F613000FF56C400FF56
      C400FF56C4008F613000FFD48B008F613000FF56C400FF56C400FF56C400FF56
      C400FF56C400FF56C4008F61300000000000000000000000000077500E00875F
      200081571C00275D9A00205FA7002F5B8E00855A21000000000083581F000000
      000000000000000000000000000000000000000000008F6130000AD7FF000AD7
      FF008F61300000F3FD0000F3FD008F6130008F6130008F6130008F6130008F61
      30008F6130000AD7FF008F61300000000000000000008F613000FF56C4008F61
      30008F6130008F6130008F6130008F6130008F613000FFD48B00FFD48B008F61
      3000FF56C400FF56C4008F61300000000000000000008F613000FF56C400FF56
      C4008F613000FFD48B00FFD48B008F6130008F6130008F6130008F6130008F61
      30008F613000FF56C4008F61300000000000000000000000000077500E008C63
      250083581F00175FB6000D63C800175FB600895D270000000000875C26008B5E
      2A0000000000000000000000000000000000000000008F6130000AD7FF008F61
      300000F3FD0000F3FD0000F3FD0000F3FD0000F3FD0000F3FD0000F3FD0000F3
      FD008F6130000AD7FF008F61300000000000000000008F613000FF56C4008F61
      3000FFD48B00FFD48B00FFD48B00FFD48B00FFD48B00FFD48B00FFD48B00FFD4
      8B008F613000FF56C4008F61300000000000000000008F613000FF56C4008F61
      3000FFD48B00FFD48B00FFD48B00FFD48B00FFD48B00FFD48B00FFD48B00FFD4
      8B008F613000FF56C4008F61300000000000000000000000000077500E008C63
      2500845920000D63C8000064DF008F6130008F6130008F6130008F6130008F61
      30008F613000000000000000000000000000000000008F6130000AD7FF008F61
      300000F3FD0000F3FD0000F3FD0000F3FD0000F3FD0000F3FD0000F3FD0000F3
      FD008F6130000AD7FF008F61300000000000000000008F613000FF56C4008F61
      3000FFD48B00FFD48B00FFD48B00FFD48B00FFD48B00FFD48B00FFD48B00FFD4
      8B008F613000FF56C4008F61300000000000000000008F613000FF56C4008F61
      3000FFD48B00FFD48B00FFD48B00FFD48B00FFD48B00FFD48B00FFD48B00FFD4
      8B008F613000FF56C4008F61300000000000000000000000000077500E008C63
      2500845920000665D4000064DF008F6130008F6130008F6130008F6130008F61
      30008F613000000000000000000000000000000000008F6130000AD7FF000AD7
      FF008F61300000F3FD0000F3FD008F6130008F6130008F6130008F6130008F61
      30008F6130000AD7FF008F61300000000000000000008F613000FF56C4008F61
      30008F6130008F6130008F6130008F6130008F613000FFD48B00FFD48B008F61
      3000FF56C400FF56C4008F61300000000000000000008F613000FF56C400FF56
      C4008F613000FFD48B00FFD48B008F6130008F6130008F6130008F6130008F61
      30008F613000FF56C4008F61300000000000000000000000000077500E008C63
      2500845920000463D8000064DF000064DF008F613000000000008F6130008F61
      300000000000000000000000000000000000000000008F6130000AD7FF000AD7
      FF000AD7FF008F61300000F3FD008F6130000AD7FF000AD7FF000AD7FF000AD7
      FF000AD7FF000AD7FF008F61300000000000000000008F613000FF56C400FF56
      C400FF56C400FF56C400FF56C400FF56C4008F613000FFD48B008F613000FF56
      C400FF56C400FF56C4008F61300000000000000000008F613000FF56C400FF56
      C400FF56C4008F613000FFD48B008F613000FF56C400FF56C400FF56C400FF56
      C400FF56C400FF56C4008F61300000000000000000000000000079521100966C
      3000875C26008F6130008F6130008F6130008F613000000000008F6130000000
      000000000000000000000000000000000000000000008F6130000AD7FF000AD7
      FF000AD7FF000AD7FF008F6130008F6130000AD7FF000AD7FF000AD7FF000AD7
      FF000AD7FF000AD7FF008F61300000000000000000008F613000FF56C400FF56
      C400FF56C400FF56C400FF56C400FF56C4008F6130008F613000FF56C400FF56
      C400FF56C400FF56C4008F61300000000000000000008F613000FF56C400FF56
      C400FF56C400FF56C4008F6130008F613000FF56C400FF56C400FF56C400FF56
      C400FF56C400FF56C4008F6130000000000000000000000000007E551800AB80
      4800C89A6900CB9D6C00CB9D6C00CB9D6C008F61300000000000000000000000
      000000000000000000000000000000000000000000008F6130000AD7FF000AD7
      FF000AD7FF000AD7FF000AD7FF000AD7FF000AD7FF000AD7FF000AD7FF000AD7
      FF000AD7FF000AD7FF008F61300000000000000000008F613000FF56C400FF56
      C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56
      C400FF56C400FF56C4008F61300000000000000000008F613000FF56C400FF56
      C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56
      C400FF56C400FF56C4008F61300000000000000000000000000084592000C295
      6300CB9D6C00CB9D6C00CB9D6C00CB9D6C008F61300000000000000000000000
      000000000000000000000000000000000000000000008F6130000AD7FF000AD7
      FF000AD7FF000AD7FF000AD7FF000AD7FF000AD7FF000AD7FF000AD7FF000AD7
      FF000AD7FF000AD7FF008F61300000000000000000008F613000FF56C400FF56
      C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56
      C400FF56C400FF56C4008F61300000000000000000008F613000FF56C400FF56
      C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56
      C400FF56C400FF56C4008F6130000000000000000000000000008C5F2C008F61
      30008F6130008F6130008F6130008F6130008F61300000000000000000000000
      000000000000000000000000000000000000000000008F6130008F6130008F61
      30008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F6130008F61300000000000000000008F6130008F6130008F61
      30008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F6130008F61300000000000000000008F6130008F6130008F61
      30008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F6130008F613000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000077500E007750
      0E0077500E0077500E0077500E0077500E0077500E0077500E00815919009269
      2D00A87D4500C295630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008F6130008F6130008F61
      30008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F6130008F61300000000000000000000000000077500E007750
      0E0077500E00795211007A5212007B5314007C5415007E55180082581D00875C
      26008D602E00CB9D6C0000000000000000000000000000000000855A2100895D
      27008C5F2C008F6130008F6130008F6130008F6130008D602D008B5E2A008D60
      2D008B5E2A008A5E29008D602E0000000000000000000000000077500E007750
      0E0078510F007D5416000000000000000000000000000000000077500E007750
      0E007F561900875C26000000000000000000000000008F6130000AD7FF000AD7
      FF000AD7FF000AD7FF000AD7FF000AD7FF000AD7FF000AD7FF000AD7FF000AD7
      FF000AD7FF000AD7FF008F6130000000000000000000000000007C541300835B
      1C00875F200092692D009A70350082581D00855A2100B0844F00BE925F00CB9D
      6C00CB9D6C00CB9D6C00000000000000000000000000000000008A5D29009E73
      39009E7339009E7339009E7339009E7339009E7339009E7339009E7339009E73
      39009E7339009E7339008F61300000000000000000000000000077500E007750
      0E00835B15007F561A000000000000000000000000000000000077500E008961
      1900BB8C35008F6130000000000000000000000000008F6130000AD7FF000AD7
      FF000AD7FF000AD7FF000AD7FF000AD7FF000AD7FF000AD7FF000AD7FF000AD7
      FF000AD7FF000AD7FF008F613000000000000000000000000000000000000000
      000000000000A2783E00B0844F008A5D29008C5F2C00C89A6900CB9D6C000000
      00000000000000000000000000000000000000000000000000008D602D00AD81
      4A00AD814A00AD814A00AD814A00AD814A00AD814A00AD814A00AD814A00AD81
      4A00AD814A00AD814A008F61300000000000000000000000000077500E007A53
      11007C5415007F561A0092692D008459200077500E0077500F007B5314008459
      2000D8AB4D008F6130000000000000000000000000008F6130000AD7FF000AD7
      FF000AD7FF000AD7FF000AD7FF000AD7FF008F6130008F6130000AD7FF000AD7
      FF000AD7FF000AD7FF008F61300000000000000000000000000077500E007F57
      16008F662900A57A4200B98C58008D602D008F613000CB9D6C00CB9D6C00CB9D
      6C00CB9D6C00CB9D6C00000000000000000000000000000000008D602E00B589
      5400B5895400B5895400B5895400B5895400B5895400B5895400B5895400B589
      5400B5895400B58954008F61300000000000000000000000000077500E008961
      19007F561A006E9891006E98910069796200697962006E6837006E9891008D60
      2E00E6B652008F6130000000000000000000000000008F6130000AD7FF000AD7
      FF000AD7FF000AD7FF000AD7FF000AD7FF008F61300000F3FD008F6130000AD7
      FF000AD7FF000AD7FF008F61300000000000000000000000000077500E007951
      11007E551800865B23008B5E2A008D602E008F6130008F6130008F6130008F61
      30008F613000CB9D6C0000000000000000000000000000000000895D2700BE92
      5F00BE925F00BE925F00BE925F00BE925F00BE925F00BE925F00BE925F00BE92
      5F00BE925F00BE925F008E602F0000000000000000000000000077500E009269
      1D0082581D0067B0AE006BBBCD0067B0AE006E9891006E9891006BBBCD009467
      3700E6B652008F6130000000000000000000000000008F6130000AD7FF008F61
      30008F6130008F6130008F6130008F6130008F61300000F3FD0000F3FD008F61
      30000AD7FF000AD7FF008F61300000000000000000000000000077500E007951
      110092692D00275D9A000D63C8000463D8000064DF000064DF000064DF000064
      DF008F613000CB9D6C000000000000000000000000000000000082581D00CB9D
      6C00CB9D6C00CB9D6C00CB9D6C00CB9D6C00CB9D6C00CB9D6C00CB9D6C00CB9D
      6C00CB9D6C00CB9D6C008B5E2A0000000000000000000000000077500E009269
      1D00845920006BBBCD005FC2E2008C5F2C008C5F2C006BBBCD006ACFF500A27C
      5400E6B652008F6130000000000000000000000000008F6130000AD7FF008F61
      300000F3FD0000F3FD0000F3FD0000F3FD0000F3FD0000F3FD0000F3FD0000F3
      FD008F6130000AD7FF008F61300000000000000000000000000077500E007B53
      14003D5A7300B98C58000463D8000064DF000064DF000064DF000064DF000064
      DF008F613000CB9D6C000000000000000000000000000000000082581D00CB9D
      6C00CB9D6C00CB9D6C00CB9D6C00CB9D6C00CB9D6C00CB9D6C00CB9D6C00CB9D
      6C00CB9D6C00CB9D6C008B5E2A0000000000000000000000000077500E009269
      1D00855A21006BBBCD006ACFF5008F6130008F6130006ACFF5006ACFF500976C
      3F00D8C17A00936637000000000000000000000000008F6130000AD7FF008F61
      300000F3FD0000F3FD0000F3FD0000F3FD0000F3FD0000F3FD0000F3FD0000F3
      FD008F6130000AD7FF008F61300000000000000000000000000078510F007D54
      1600365B80001260C000CB9D6C000064DF000064DF000064DF000064DF000064
      DF008F613000CB9D6C000000000000000000000000000000000082581D00CB9D
      6C00CB9D6C00CB9D6C00CB9D6C00CB9D6C00CB9D6C00CB9D6C00CB9D6C00CB9D
      6C00CB9D6C00CB9D6C008B5E2A0000000000000000000000000077500E009269
      1D00855A21006BBBCD006ACFF5006ACFF5006ACFF5006ACFF5006ACFF5009163
      3200E6B65200976C3F000000000000000000000000008F6130000AD7FF008F61
      30008F6130008F6130008F6130008F6130008F61300000F3FD0000F3FD008F61
      30000AD7FF000AD7FF008F6130000000000000000000000000007A5212007D54
      1600365B80001260C0000064DF000064DF000064DF000064DF000064DF000064
      DF008F613000CB9D6C00000000000000000000000000000000007D541800CB9D
      6C00CB9D6C00CB9D6C00CB9D6C00CB9D6C00CB9D6C00CB9D6C00CB9D6C00CB9D
      6C00CB9D6C00CB9D6C008D602E00000000000000000000000000795211009B70
      2400875C26008F6130008F6130008F6130008F6130008F6130008F6130008F61
      3000E6B65200946737000000000000000000000000008F6130000AD7FF000AD7
      FF000AD7FF000AD7FF000AD7FF000AD7FF008F61300000F3FD008F6130000AD7
      FF000AD7FF000AD7FF008F613000000000000000000000000000845B1C008056
      1B00275D9A000064DF000064DF000064DF000064DF000064DF00000000000064
      DF008F613000CB9D6C00000000000000000000000000000000007E5518008157
      1C0081571C0081571C0080561B007E5518007E5518007E5518007F561A00CB9D
      6C00CB9D6C00CB9D6C008F6130000000000000000000000000007E551800BB8C
      3500D8AB4D00E6B65200E6B65200E6B65200E6B65200E6B65200E6B65200E6B6
      5200E6B65200976C3F000000000000000000000000008F6130000AD7FF000AD7
      FF000AD7FF000AD7FF000AD7FF000AD7FF008F6130008F6130000AD7FF000AD7
      FF000AD7FF000AD7FF008F613000000000000000000000000000966C3000865B
      23000665D4000064DF000064DF000064DF000064DF000064DF000064DF000064
      DF008F613000CB9D6C000000000000000000000000000000000084592000AB80
      4800AD7F4E00AD7F4E008F613000AD7F4E00AD7F4E00AD7F4E008F613000CB9D
      6C00CB9D6C00CB9D6C008F61300000000000000000000000000084592000D8AB
      4D00E6B65200E6B65200E6B65200E6B65200E6B65200E6B65200E6B65200E6B6
      5200E6B65200936637000000000000000000000000008F6130000AD7FF000AD7
      FF000AD7FF000AD7FF000AD7FF000AD7FF000AD7FF000AD7FF000AD7FF000AD7
      FF000AD7FF000AD7FF008F613000000000000000000000000000AE824C008C5F
      2C008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F613000CB9D6C00000000000000000000000000000000008C5F2B008F61
      30008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F6130008F6130000000000000000000000000008C5F2C008F61
      30008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F6130000000000000000000000000008F6130000AD7FF000AD7
      FF000AD7FF000AD7FF000AD7FF000AD7FF000AD7FF000AD7FF000AD7FF000AD7
      FF000AD7FF000AD7FF008F613000000000000000000000000000C99B6A00CB9D
      6C00CB9D6C00CB9D6C00CB9D6C00CB9D6C00CB9D6C00CB9D6C00CB9D6C00CB9D
      6C00CB9D6C00CB9D6C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008F6130008F6130008F61
      30008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F6130008F613000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008D602D008D602D008D60
      2D008D602D008D602D008D602D008D602D008D602D00000000008D602D008D60
      2D008D602D00000000008D602D00000000000000000000000000000000000000
      000000000000000000000000000077500E004C33090000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000077500E0077500E007750
      0E007D5418008D602D008D602D008D602D008D602D008D602D008D602D008D60
      2D008D602D008D602D008D602D0000000000000000008D602D008D602D008D60
      2D008D602D008D602D008D602D008D602D008D602D00000000008D602D008D60
      2D008D602D00000000008D602D00000000000000000000000000000000000000
      0000000000000000000077500E007C5413009E7339008B5E2A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000077500E0080F9FE0080F9
      FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9
      FE0080F9FE0080F9FE008D602D0000000000000000008D602D008D602D000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000077500E00845C1D00AB8048008F613000000000000000
      0000000000000000000000000000000000000000000000000000000000007750
      0E0077500E0077500E0077500E0077500E0077500E0077500E006A420E004C33
      0900201604000000000000000000000000000000000077500E0080F9FE0080F9
      FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9
      FE0080F9FE0080F9FE008D602D0000000000000000008D602D008D602D000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000077500E008F662900B98C58008F613000000000000000
      0000000000000000000000000000000000000000000000000000000000007750
      0E0077500E0077500E007D561500845C1D00845C1D008F662900A2783E00B589
      5400000000000000000000000000000000000000000077500E007B5314008358
      1F008A5E29008D602D008C5F2C008D602D008D602D008D602D008D602D008D60
      2D008D602D008D602D008D602D0000000000000000008D602D008D602D000000
      0000000000008D602D008D602D008D602D008D602D00000000008D602D008D60
      2D008D602D00000000008D602D00000000000000000000000000000000000000
      0000000000000000000077500E009A703500BE925F008F613000000000000000
      0000000000000000000000000000000000000000000000000000000000007750
      0E0077500E00835B1C007F561A0082581D0082581D00865B2300BE925F00CB9D
      6C00000000000000000000000000000000000000000077500E0080F9FE0080F9
      FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9
      FE0080F9FE0080F9FE008D602D0000000000000000008D602D008D602D000000
      0000000000008D602D008D602D008D602D008D602D00000000008D602D008D60
      2D008D602D00000000008D602D00000000000000000000000000000000000000
      00000000000077500E0077500E0082581D008B5E2A008F6130008E602F000000
      0000000000000000000000000000000000000000000000000000000000007750
      0E00835B1C009A703500875C26001260C0001260C0008E602F00CB9D6C00CB9D
      6C00000000000000000000000000000000000000000077500E0080F9FE0080F9
      FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9
      FE0080F9FE0080F9FE008D602D0000000000000000008D602D008D602D000000
      0000000000008D602D008D602D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000077500E0077500E00000000000000000000000000000000008D602E008D60
      2D0000000000000000000000000000000000000000000000000000000000714C
      0D0092692D00AB8048008E602F000064DF000064DF008F613000CB9D6C00CB9D
      6C00000000000000000000000000000000000000000077500E007D5418008459
      20008C5F2C008F6130008D602E008A5D2900845920007F5619007E5518007F56
      1A00845920008D602D008D602D0000000000000000008D602D008D602D000000
      0000000000008D602D008D602D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007750
      0E0077500E000000000000000000000000000000000000000000000000008F61
      30008F6130000000000000000000000000000000000000000000000000006A42
      0E009E733900BB8F5B008F6130008F6130008F6130008F613000CB9D6C00CB9D
      6C00000000000000000000000000000000000000000077500E0080F9FE0080F9
      FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9
      FE0080F9FE0080F9FE008D602D0000000000000000008D602D008D602D008D60
      2D008D602D008D602D008D602D008D602D008D602D00000000008D602D008D60
      2D008D602D00000000008D602D00000000000000000000000000000000007750
      0E00000000000000000000000000000000000000000000000000000000000000
      00008F6130000000000000000000000000000000000000000000000000004C33
      0900AB804800CB9D6C00CB9D6C00CB9D6C00CB9D6C00CB9D6C00CB9D6C00CB9D
      6C00000000000000000000000000000000000000000077500E0080F9FE0080F9
      FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9
      FE0080F9FE0080F9FE008D602D0000000000000000008D602D008D602D008D60
      2D008D602D008D602D008D602D008D602D008D602D00000000008D602D008D60
      2D008D602D00000000008D602D00000000000000000000000000000000007750
      0F00000000000000000000000000000000000000000000000000000000000000
      00008F6130000000000000000000000000000000000000000000000000004C33
      0900181003000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000077500E0081571C00875C
      26008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F6130008D602D0000000000000000008D602D008D602D000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007D54
      1600000000000000000000000000000000000000000000000000000000000000
      00008F6130000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000077500E006DF8FE0080F9
      FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9
      FE0080F9FE0080F9FE008F61300000000000000000008D602D008D602D000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008258
      1D00875B24000000000000000000000000000000000000000000000000008F61
      30008F6130000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000077500E006DF8FE0080F9
      FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9
      FE0080F9FE0080F9FE008F61300000000000000000008D602D008D602D008D60
      2D008D602D008D602D008D602D008D602D008D602D00000000008D602D008D60
      2D008D602D00000000008D602D00000000000000000000000000000000000000
      00008B5E2A000000000000000000000000000000000000000000000000008F61
      3000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000077500E008F6130008F61
      30008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F6130008F61300000000000000000008D602D008D602D008D60
      2D008D602D008D602D008D602D008D602D008D602D00000000008D602D008D60
      2D008D602D00000000008D602D00000000000000000000000000000000000000
      0000000000008F6130008F6130008F6130008F6130008F6130008F6130000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000645131000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000077500E0077500E007B53
      140081571C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000554F4E00275D9A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007F5619009A7035000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007F5619009A7035000000
      00000000000000000000000000000000000077500E0077500E00645131004857
      6200865B2300895D270000000000000000000000000082581D009E7339000000
      00000000000000000000000000000000000077500E0077500E0073531900554F
      4E00275D9A000064DF000064DF00000000000000000000000000000000007E55
      17007F561A000000000000000000000000000000000000000000000000008F61
      30008C5F2C0000000000000000000000000000000000BB8F5B00865B2300AE82
      4C00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BB8F5B00865B2300A87D
      450000000000000000000000000077500E0077500E00645131003D5A7300205F
      A7001260C00090623100916332000000000000000000D5AC7B00865B2300AE82
      4C00000000000000000000000000000000006C5323005B553D003D5A73001260
      C0000064DF000064DF000064DF00000000000000000000000000000000008F61
      300082581D0082581D000000000000000000000000000000000083581F008D60
      2D008F6130000000000000000000000000000000000000000000E1B789008A5E
      2900B0844F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E1B78900895D
      2700A2783E0000000000000000007B5516005B553D00365B8000000000000000
      00000064DF000064DF0091633200000000000000000000000000EAC399008A5E
      2900AE824C000000000000000000000000000000000000000000000000000000
      00000064DF000064DF0000000000000000000000000000000000000000000000
      00008459200082581D007F561900000000000000000082581D008D602D008F61
      300000000000000000000000000000000000000000000000000000000000E1B7
      89008A5E290000000000855A2100855A21008459200084592000865B23000000
      000000000000000000000000000000000000000000000000000000000000D5AC
      7B00875B24000000000081571C0084592000275D9A001260C000916332000000
      00000064DF000064DF009163320000000000000000000000000000000000E1B7
      89008A5E290000000000865B2300875B2400895D27008D602D00916332000000
      00000064DF000000000000000000000000000000000000000000000000000000
      00000000000080561B007F5619007F561A0083581F008C5F2C008F6130000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008D602D00C99B6A00C99B6A00C99B6A00C5986600BE925F008E61
      2D00000000000000000000000000000000000000000000000000000000000000
      000000000000895D2700BB8F5B0094673700946737000064DF000064DF000064
      DF000064DF009163320091633200000000000000000000000000000000000000
      0000000000008D602D00C99B6A00C99B6A00C99B6A00C99B6A00C99B6A009163
      3200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000081571C00875C26008E602F008F613000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000875B2400C99B6A00C99B6A00000000000000000000000000C99B6A00C99B
      6A00916332000000000000000000000000000000000000000000000000000000
      0000865B2300C2956300C99B6A000000000094673700946737000064DF000064
      DF00916332009163320000000000000000000000000000000000000000000000
      0000875B2400C99B6A00C99B6A00000000000000000000000000C99B6A00C99B
      6A00916332000000000000000000000000000000000000000000000000000000
      00000000000000000000855A21008F6130008F6130008F613000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000865B2300C99B6A000000000000000000000000000000000000000000C99B
      6A00916332000000000000000000000000000000000000000000000000000000
      0000865B2300C99B6A0000000000000000000000000094673700946737009163
      3200916332000000000000000000000000000000000000000000000000000000
      0000865B2300C99B6A000000000000000000000000000000000000000000C99B
      6A00916332000000000000000000000000000000000000000000000000000000
      000000000000845920008E602F008F6130008F6130008F6130008F6130000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000865B2300C99B6A000000000000000000000000000000000000000000C99B
      6A00916332000000000000000000000000000000000000000000000000000000
      0000855A2100C99B6A000000000000000000000000000000000000000000C99B
      6A00916332000000000000000000000000000000000000000000000000000000
      0000865B2300C99B6A000000000000000000000000000000000000000000C99B
      6A00916332000000000000000000000000000000000000000000000000000000
      0000845920008F6130008F61300000000000000000008F6130008F6130008F61
      30008F6130000000000000000000000000000000000000000000000000000000
      0000865B2300C59866000000000000000000000000000000000000000000C99B
      6A00916332000000000000000000000000000000000000000000000000000000
      0000865B2300C59866000000000000000000000000000000000000000000C99B
      6A00916332000000000000000000000000000000000000000000000000000000
      0000865B2300C59866000000000000000000000000000000000000000000C99B
      6A00916332000000000000000000000000000000000000000000000000008F61
      30008F6130008F613000000000000000000000000000000000008F6130008F61
      30008F6130000000000000000000000000000000000000000000000000000000
      0000895D2700C2956300C89A6900000000000000000000000000BE925F00C99B
      6A00916332000000000000000000000000000000000000000000000000000000
      0000895D2700C2956300C99B6A00000000000000000000000000C99B6A00C99B
      6A00916332000000000000000000000000000000000000000000000000000000
      0000895D2700C2956300C89A6900000000000000000000000000BE925F00C99B
      6A00916332000000000000000000000000000000000000000000000000008E60
      2F008F6130000000000000000000000000000000000000000000000000008F61
      30008F6130000000000000000000000000000000000000000000000000000000
      00000000000090623100C99B6A00C99B6A00C99B6A00C99B6A00C99B6A009163
      3200000000000000000000000000000000000000000000000000000000000000
      00000000000090623100C99B6A00C99B6A00C99B6A00C99B6A00C99B6A009163
      3200000000000000000000000000000000000000000000000000000000000000
      00000000000090623100C99B6A00C99B6A00C99B6A00C99B6A00C99B6A009163
      3200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000091633200916332009163320091633200916332000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000091633200916332009163320091633200916332000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000091633200916332009163320091633200916332000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000895D2700895D2700895D2700895D
      2700895D2700895D2700895D2700000000000000000000000000000000000000
      000000000000000000000000000000000000895D2700895D2700895D2700895D
      2700895D2700895D2700895D2700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000895D2700ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC00895D2700000000000000000000000000000000000000
      000000000000000000000000000000000000895D2700ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC00895D27000000000000000000000000007F561A00855A
      21008B5E2A008F613000000000000000000000000000000000007F561A008258
      1D00865B23008D602D000000000000000000000000000000000077500E007750
      0E0078510F007D5416000000000000000000000000000000000077500E007750
      0E007F561900875B24000000000000000000000000000000000077500E007750
      0E0078510F007D5416000000000000000000895D2700ECECEC001260C0001260
      C0001260C000ECECEC00895D270000000000000000000000000077500E007750
      0E0078510F007D5416000000000000000000895D2700ECECEC001260C0001260
      C0001260C000ECECEC00895D2700000000000000000000000000875B24000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008F6130000000000000000000000000000000000077500E007750
      0E00815919007E5518000000000000000000000000000000000077500E00875F
      2000AB8048008D602E000000000000000000000000000000000077500E007750
      0E00815919007E5518000000000000000000895D2700ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC00895D270000000000000000000000000077500E007750
      0E00835B15007F561A000000000000000000875C2600ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC00895D27000000000000000000000000008C5F2C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008F6130000000000000000000000000000000000077500E007A53
      11007C54150080561B0092692D006C53230077500E0077500E00795111008459
      2000C59866008F6130000000000000000000000000000000000077500E007A53
      11007C54150080561B0092692D006C532300895D2700ECECEC001260C0001260
      C0001260C000ECECEC00895D270000000000000000000000000077500E007A53
      11007C5415007F561A0092692D00875C2600895D2700ECECEC001260C0001260
      C0001260C000ECECEC00895D27000000000000000000000000008F6130000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008F6130000000000000000000000000000000000077500E00875F
      200081571C002F5B8E00365B800048576200554F4E00554F4E003D5A73008D60
      2E00CB9D6C008F6130000000000000000000000000000000000077500E00875F
      200081571C002F5B8E00365B800048576200895D2700ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC00895D270000000000000000000000000077500E008961
      190080561B006E9891006E98910069796200895D2700ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC00895D2700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000077500E008C63
      250083581F00205FA700205FA700275D9A002F5B8E002F5B8E001260C0008F61
      3000CB9D6C008F6130000000000000000000000000000000000077500E008C63
      250083581F00205FA700205FA700275D9A00895D2700ECECEC001260C0001260
      C0001260C000ECECEC00895D270000000000000000000000000077500E009269
      1D0082581D0067B0AE006BBBCD0067B0AE00895D2700ECECEC001260C0001260
      C0001260C000ECECEC00895D2700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000077500E008C63
      250084592000175FB6000665D4008C5F2C008C5F2C000D63C8000064DF008F61
      3000CB9D6C008F6130000000000000000000000000000000000077500E008C63
      250084592000175FB6000665D4008C5F2C00895D2700ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC00895D270000000000000000000000000077500E009269
      1D00845920006BBBCD005FC2E2008C5F2C00895D2700ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC00895D2700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000077500E008C63
      2500845920001260C0000064DF008F6130008F6130000064DF000064DF008F61
      3000CB9D6C008F6130000000000000000000000000000000000077500E008C63
      2500845920001260C0000064DF008F613000895D2700895D2700895D2700895D
      2700895D2700895D2700895D270000000000000000000000000077500E009269
      1D00855A21006BBBCD006ACFF5008F613000895D2700895D2700895D2700895D
      2700895D2700895D2700895D2700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000077500E008C63
      2500845920001260C0000064DF000064DF000064DF000064DF000064DF008F61
      3000CB9D6C008F6130000000000000000000000000000000000077500E008C63
      2500845920001260C0000064DF000064DF000064DF000064DF000064DF008F61
      3000CB9D6C008F6130000000000000000000000000000000000077500E009269
      1D00855A21006BBBCD006ACFF5006ACFF5006ACFF5006ACFF5006ACFF5009163
      3200E6B65200976C3F00000000000000000000000000000000007F5619000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000895D27000000000000000000000000000000000079521100966C
      3000875C26008F6130008F6130008F6130008F6130008F6130008F6130008F61
      3000CB9D6C008F6130000000000000000000000000000000000079521100966C
      3000875C26008F6130008F6130008F6130008F6130008F6130008F6130008F61
      3000CB9D6C008F61300000000000000000000000000000000000795211009B70
      2400875C26008F6130008F6130008F6130008F6130008F6130008F6130008F61
      3000E6B65200946737000000000000000000000000000000000082581D000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008F613000000000000000000000000000000000007E551800AB80
      4800C89A6900CB9D6C00CB9D6C00CB9D6C00CB9D6C00CB9D6C00CB9D6C00CB9D
      6C00CB9D6C008F613000000000000000000000000000000000007E551800AB80
      4800C89A6900CB9D6C00CB9D6C00CB9D6C00CB9D6C00CB9D6C00CB9D6C00CB9D
      6C00CB9D6C008F613000000000000000000000000000000000007E551800BB8C
      3500D8AB4D00E6B65200E6B65200E6B65200E6B65200E6B65200E6B65200E6B6
      5200E6B65200976C3F0000000000000000000000000000000000875B24000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008F6130000000000000000000000000000000000084592000C295
      6300CB9D6C00CB9D6C00CB9D6C00CB9D6C00CB9D6C00CB9D6C00CB9D6C00CB9D
      6C00CB9D6C008F6130000000000000000000000000000000000084592000C295
      6300CB9D6C00CB9D6C00CB9D6C00CB9D6C00CB9D6C00CB9D6C00CB9D6C00CB9D
      6C00CB9D6C008F6130000000000000000000000000000000000084592000D8AB
      4D00E6B65200E6B65200E6B65200E6B65200E6B65200E6B65200E6B65200E6B6
      5200E6B6520093663700000000000000000000000000000000008F6130008F61
      30008F6130008F613000000000000000000000000000000000008B5E2A008F61
      30008F6130008F613000000000000000000000000000000000008C5F2C008F61
      30008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F613000000000000000000000000000000000008C5F2C008F61
      30008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F613000000000000000000000000000000000008C5F2C008F61
      30008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F61300000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000077500E0077500E0077500E007F571600875F200092692D000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000077500E0077500E0077500E0078510F00815919008F6629000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007E5517008056
      1B000000000000000000000000000000000000000000000000007C5415008459
      2000000000000000000000000000000000000000000000000000000000000000
      000077500E0077500E007C54150081571C0082581D0082581D0083581F00A57A
      4200000000000000000000000000000000000000000000000000000000000000
      000077500E00795211007D5416007F5619007F561A0081571C0082581D00A87D
      4500000000000000000000000000000000000000000000000000855A2100895D
      27008C5F2C008F6130008F6130008F6130008F6130008D602D008B5E2A008B5E
      2A008A5E29008D602E000000000000000000000000000000000081571C00A278
      3E00865B2300000000000000000000000000000000007D541800A57A4200C598
      66008F6130000000000000000000000000000000000000000000000000007750
      0E0077500E007F561A008A5D29008E602F008C5F2C00895D2700875C2600875C
      2600B98C58000000000000000000000000000000000000000000000000007750
      0E007C531500855A21008A5D29008B5E2A008A5E29008A5D29008A5E29008B5E
      2A00BB8F5B0000000000000000000000000000000000000000008A5D29000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008F6130000000000000000000000000000000000000000000875C
      2600BB8F5B008A5E2900000000000000000000000000865B2300CB9D6C00CB9D
      6C008F613000000000000000000000000000000000000000000077500E007750
      0E007E5517008B5E2A008F61300000000000000000008B5E2A008A5E29008C5F
      2C008F613000C99B6A000000000000000000000000000000000077500E007A52
      1200855A210000000000000000008F6130008F6130008F6130008F6130008F61
      30008F613000C99B6A00000000000000000000000000000000008D602D000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008F61300000000000000000000000000000000000000000000000
      00008D602D00C59866008B5E2A000000000000000000000000008F6130008F61
      300000000000000000000000000000000000000000000000000077500E007851
      0F00855A21008F6130008F6130000000000000000000875C2600895D27008F61
      30008F613000C99B6A000000000000000000000000000000000077500E007D54
      1800895D27000000000000000000000000008F6130008F6130008F6130008F61
      30008F613000C99B6A00000000000000000000000000000000008D602E000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008F61300000000000000000000000000000000000000000000000
      0000000000008D602D00C29563008C5F2C000000000000000000000000000000
      000000000000000000000000000000000000000000000000000077500E007D54
      16008A5D29008F6130008F613000000000000000000084592000875C26008F61
      30008F613000C99B6A0000000000000000000000000000000000795111007F56
      1A008A5D29008F6130000000000000000000000000008F613000000000008F61
      30008F613000C99B6A0000000000000000000000000000000000895D27000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008E602F0000000000000000000000000000000000000000000000
      000000000000000000008C5F2B00C59866008F61300000000000000000000000
      00000000000000000000000000000000000000000000000000007F5716008056
      1B008B5E2A008F6130008F613000000000000000000081571C00875C26008F61
      30008F613000C99B6A0000000000000000000000000000000000815919008157
      1C008A5D29008F6130008F613000000000000000000000000000000000008F61
      30008F613000C99B6A000000000000000000000000000000000082581D000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008B5E2A0000000000000000000000000000000000000000000000
      00000000000000000000000000008D602E00CB9D6C008F613000000000000000
      00000000000000000000000000000000000000000000000000008C6325008358
      1F008C5F2C008F6130008F6130008B5E2A0084592000845920008C5F2C008F61
      30008F613000C99B6A00000000000000000000000000000000008C6325008358
      1F008A5E29008F6130008F6130008D602E000000000000000000000000008F61
      30008F613000C99B6A00000000000000000000000000000000007D5418000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008D602E0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008F613000CB9D6C008F6130000000
      00000000000000000000000000000000000000000000000000009A703500865B
      23008D602D008F6130008F61300000000000000000008C5F2C008F6130008F61
      30008F613000C99B6A00000000000000000000000000000000009A703500865B
      23008C5F2C008F6130008F613000000000000000000000000000000000008F61
      30008F613000C99B6A00000000000000000000000000000000007E5518008157
      1C0081571C0081571C0080561B007E5518007E5518007E5518007F561A00865B
      23008D602D008F61300000000000000000000000000000000000000000000000
      00007D541600855A21000000000000000000000000008F613000CB9D6C008F61
      300000000000000000000000000000000000000000000000000000000000B589
      54008D602E008F6130008F6130008F6130008F6130008F6130008F6130008F61
      3000C99B6A00000000000000000000000000000000000000000000000000B589
      54008E602F008F6130008F6130008F6130008E602F008D602E008F6130008F61
      3000C99B6A00000000000000000000000000000000000000000084592000895D
      27008D602D008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F61300000000000000000000000000000000000000000007E55
      1700A57A4200CA9C6B008F6130000000000000000000000000008F613000CB9D
      6C008F6130000000000000000000000000000000000000000000000000000000
      0000C99B6A008F6130008F6130008F6130008F6130008F6130008F613000C99B
      6A00000000000000000000000000000000000000000000000000000000000000
      0000C99B6A008F6130008F6130008F6130008F6130008F6130008F613000C99B
      6A000000000000000000000000000000000000000000000000008C5F2B008F61
      30008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F6130000000000000000000000000000000000000000000865B
      2300CB9D6C00CB9D6C008F613000000000000000000000000000000000008F61
      3000CB9D6C008F61300000000000000000000000000000000000000000000000
      000000000000C99B6A00C99B6A00C99B6A00C99B6A00C99B6A00C99B6A000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C99B6A00C99B6A00C99B6A00C99B6A00C99B6A00C99B6A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008F6130008F61300000000000000000000000000000000000000000000000
      00008F6130008F61300000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000077500F007A52
      12007D54160080561B0081571C0080561B007F561A007E5517007E5518008056
      1B00845920008A5E29000000000000000000000000000000000077500E007851
      0F007A5212007C5315007D5418007D5418007D5416007C5415007D5418007F56
      1A00845920008A5D29000000000000000000000000000000000077500E007750
      0E0077500E007B53140080561B0083581F008459200082581D0081571C008258
      1D00855A21008A5E29000000000000000000000000000000000077500E007750
      0E0077500E0078510F0079511100795211007A521200795211007B5314007F56
      1900845920008A5E2900000000000000000000000000000000007B5314009E73
      3900B5895400C5986600C99B6A00C2956300BE925F00B5895400B5895400B98C
      5800C29563008F61300000000000000000000000000000000000795111008F66
      29009E733900A87D4500AE824C00AE824C00B0844F00AE824C00B0844F00B589
      5400BE925F008F6130000000000000000000000000000000000077500E007851
      0F007F561900AE824C00C2956300C99B6A00C99B6A00C5986600BB8F5B00B98C
      5800C29563008F6130000000000000000000000000000000000077500E00835B
      1C008F6629009A703500A57A4200A87D4500A57A4200A57A4200AB804800B589
      5400C29563008F613000000000000000000000000000000000007F561900B98C
      5800000000000000000000000000000000000000000000000000000000000000
      0000C99B6A008F613000000000000000000000000000000000007B5314009E73
      3900000000000000000000000000000000000000000000000000000000000000
      0000C99B6A008F6130000000000000000000000000000000000078510F008056
      1B00205FA7008F61300000000000000000000000000000000000000000000000
      0000C99B6A008F61300000000000000000000000000000000000795211009A70
      350000000000BE925F008F6130008F6130008F6130008E602F00C99B6A000000
      0000C99B6A008F6130000000000000000000000000000000000083581F00C99B
      6A00000000000064DF00000000000064DF000064DF000064DF000064DF000000
      0000C99B6A008F613000000000000000000000000000000000007E551700A87D
      450000000000C5A06700CDB56F00CDB56F00D8C17A00D8C17A00D8C17A000000
      0000C99B6A008F613000000000000000000000000000000000007E551700B589
      54008F6130000064DF008F613000000000000000000000000000000000000000
      0000C99B6A008F613000000000000000000000000000000000007C541500AB80
      480000000000C99B6A008F61300000000000000000008F613000C99B6A000000
      0000C99B6A008F61300000000000000000000000000000000000855A2100C99B
      6A00000000000000000000000000000000000000000000000000000000000000
      0000C99B6A008F613000000000000000000000000000000000007F561900AE82
      4C0000000000CDB56F00AA573700D8C17A000000000000000000D8C17A000000
      0000C99B6A008F6130000000000000000000000000000000000083581F00C99B
      6A00000000008F6130000064DF008F6130000000000000000000000000000000
      0000C99B6A008F613000000000000000000000000000000000007E551700B287
      510000000000C99B6A008F61300000000000000000008F613000C99B6A000000
      0000C99B6A008F6130000000000000000000000000000000000084592000C99B
      6A00000000000064DF00000000000D63C8001260C000175FB6001260C0000000
      0000C99B6A008F613000000000000000000000000000000000007E551800AB80
      480000000000CDB56F00D8C17A00D8C17A00D8C17A00D8C17A00D8C17A000000
      0000C99B6A008F6130000000000000000000000000000000000084592000C99B
      6A0000000000000000008F6130000064DF008F6130000D63C800205FA700895D
      2700C99B6A008F613000000000000000000000000000000000007D541600AE82
      4C0000000000C99B6A008F61300000000000000000008B5E2A00C59866000000
      0000C99B6A008F6130000000000000000000000000000000000081571C00BE92
      5F00000000000000000000000000000000000000000000000000000000000000
      0000C59866008F613000000000000000000000000000000000007D541600A57A
      420000000000CDB56F00AA573700D8C17A000000000000000000D8C17A000000
      0000C99B6A008F6130000000000000000000000000000000000083581F00C598
      66000000000000000000000000008F6130000064DF000000000000000000175F
      B6008F6130008F613000000000000000000000000000000000007B531400A57A
      420000000000C29563008F6130000000000000000000865B2300B58954000000
      0000C99B6A008F613000000000000000000000000000000000007E551800AE82
      4C0000000000275D9A0000000000485762003D5A7300485762003D5A73000000
      0000C29563008F613000000000000000000000000000000000007C531500A278
      3E0000000000CDB56F00D8C17A00D8C17A00D8C17A00CDB56F00CDB56F000000
      0000C99B6A008F6130000000000000000000000000000000000080561B00B084
      4F000000000000000000000000000D63C8000000000000000000000000000000
      00000164DD008F613000000000000000000000000000000000007A5212009A70
      350000000000B28751008A5D2900000000000000000081571C00AB8048000000
      0000C99B6A008F613000000000000000000000000000000000007A5212009A70
      3500000000000000000000000000000000000000000000000000000000000000
      0000C29563008F613000000000000000000000000000000000007A521200966C
      3000000000000000000000000000000000000000000000000000000000000000
      0000C99B6A008F613000000000000000000000000000000000007B531400966C
      3000000000000000000000000000365B80000000000000000000000000000000
      00000D63C8008F6130000000000000000000000000000000000078510F008F66
      290000000000AB804800875C2600865B230082581D0081571C00A87D45000000
      0000C99B6A008F6130000000000000000000000000000000000078510F007C54
      15007E5518007E5518007D5418007B5314007B5314007B5314007F561900865B
      23008E602F008F6130000000000000000000000000000000000078510F007D54
      160080561B0083581F00855A210083581F0082581D0081571C0083581F00875C
      26008F6130008F6130000000000000000000000000000000000078510F007B53
      14007C5415007E5518007F5619007F561A004857620000000000000000003D5A
      73008C5F2C008F6130000000000000000000000000000000000077500E007C54
      150081571C00855A2100875C2600000000000000000082581D00865B23008D60
      2D008F6130008F61300000000000000000000000000000000000795211008F66
      29009E733900A87D4500AB804800A57A4200A57A4200A57A4200B2875100C99B
      6A00C99B6A008F61300000000000000000000000000000000000795111009269
      2D00A2783E00B2875100B98C5800B5895400B2875100B0844F00B98C5800C99B
      6A00C99B6A008F61300000000000000000000000000000000000795111008F66
      29009A703500A57A4200AB804800A87D450084592000485762003D5A7300875C
      2600C99B6A008F61300000000000000000000000000000000000795111009269
      2D00A87D4500B98C58008C5F2C008A5E2900875C2600875C2600BE925F00C99B
      6A00C99B6A008F613000000000000000000000000000000000007E551800A57A
      4200BB8F5B00C99B6A00C99B6A00C99B6A00C99B6A00C99B6A00C99B6A00C99B
      6A00C99B6A008F613000000000000000000000000000000000007E551700A57A
      4200BB8F5B00C99B6A00C99B6A00C99B6A00C99B6A00C99B6A00C99B6A00C99B
      6A00C99B6A008F613000000000000000000000000000000000007E551700A57A
      4200B98C5800C99B6A00C99B6A00C99B6A00C99B6A00C99B6A00C99B6A00C99B
      6A00C99B6A008F613000000000000000000000000000000000007E551700A87D
      4500C2956300C99B6A00C99B6A00C99B6A00C99B6A00C99B6A00C99B6A00C99B
      6A00C99B6A008F61300000000000000000000000000000000000855A21008C5F
      2C008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F61300000000000000000000000000000000000845920008C5F
      2C008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F61300000000000000000000000000000000000845920008C5F
      2C008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F61300000000000000000000000000000000000845920008C5F
      2C008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F613000000000000000000000000000000000008D602D008F61
      30008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F613000000000000000000000000000000000008C5F2C008F61
      30008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F613000000000000000000000000000000000008C5F2C008F61
      30008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F613000000000000000000000000000000000008C5F2C008F61
      30008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F61300000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000600100000100010000000000000B00000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFFFFFFFC3FFC3F8001FFFF
      F42FF42F8001FFFFE007E0078001FFFFC003C0038001FFFFE007E0078001FFFF
      800180018001FFFF800180018001FFFF800180018001FFFF800180018001FFFF
      E007E0078001FFFFC003C0038001FFFFE007E0078001FFFFF42FF42F8001FFFF
      FC3FFC3F8001FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3F
      800180018001F42F80018001BC01E007C003C003BC01C003C003C003B401E007
      E007E007E7818001E007E007C0818001F00FF00F80818001F00FF00FC0818001
      F81FF81FE781E007F81FF81FB401C003FC3FFC3FBC01E007FC3FFC3FBC01F42F
      FE7FFE7F8001FC3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0038001FC7FFE7F
      C0038001FC7FFE7FC0038001FC7FFC3FC0038001FC7FFC3FC0038001FC7FF81F
      E0078001FC7FF81FE0078001FC7FF00FF00F8001FC7FF00FFC3F8001FC7FE007
      F81F8001FC73C003F81F8001D803F81FF81F8001C003FC3FF81F8001E003FE7F
      FC3F8001FC33FE7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80458045FC3F8C63
      80458045F42F8C639FFF9FFFE007DEF79FFF9FFFC003C00798459845E007FEFF
      984598458001800399FF99FF8001800399FF99FF800180038045804580018003
      80458045E00780039FFF9FFFC00380039FFF9FFFE007800380458045F42F8003
      80458045FC3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3FFC3FFF01FC3F
      F42FF42FC301F5AFE007E007C301E997C003C003C001DFFBE007E007C001EFF7
      80018001C0018FF180018001C001BFFD80018001C001BFFD80018001C0018FF1
      E007E007C001EFF7C003C003C001DFFBE007E007C003E997F42FF42FC003F5AF
      FC3FFC3FFFFFFC3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3F
      80010000FFBFF42F80010000FF3FE007C0030000FE2FC003C0030000E037E007
      E0070000E0378001E0070000E0378001F00F0000E0378001F00F0000E0378001
      F81F0000E037E007F81F0000FE2FC003FC3F0000FF3FE007FC3F0000FFBFF42F
      FE7F0000FFFFFC3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF777FFFFFFFFFFFF
      E223FFFF8001FF9FC889E7F38001FF1FDDDDCFF9C003F81FFFFFDFFDC003E007
      E013D9FDE007C003CC89D9DDE0078001CC99DFDDF00F8001E099DF05F00F8001
      FC89DFDDF81F8001E193CFD9F81FC003FF9FE7F3FC3FE007FF1FFFFFFC3FF81F
      FFFFFFFFFE7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8001FF80FFFF
      FC0180010180FC01FC0180010180FC01FC0180010180FC01F40180010000F401
      E60180010180E781C00180010180C0818001800101808081C00180010180C081
      E60180010000E781F40180010180F401FC0180010180FC01FC0180010180FC01
      FC01800101FFFC01FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF01FF01FE7F
      FFFFC301C301FC3FFEFFC301C301FC3FFEFFC001C001FC3FF83FC001C001FC3F
      FEFFC001C001F81FFEFFC001C001F00FFC7FC001C001E007FBBFC001C001E007
      F7DFC001C001E007F7DFC001C001E007F7DFC003C003E007FBBFC003C003F00F
      FC7FFFFFFFFFF81FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFEC378807C0278827CFF3C9339913C913DFFB
      C1339933C133DFFBC933C133C933DFFBC907F913C913DFFBEB33C327EB27DFFB
      E333FF3FE33FDFFB8207FE3F823FCFF3FFFFFFFFFFFFEFF7FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFFFFFFFFFFFFFFF9F
      803F803F9FFF9F01803F803F8FFF8F01803F803FC7FFC79F802F802FE41FE41F
      81E781E7F80FF80F81038103F007F1C781018101F007F3E781038103F007F3E7
      81E781E7F007F3E7802F802FF007F1C7803F803FF80FF80F803F803FFC1FFC1F
      803F803FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      8001800180018001800180018001800180018001800180018001800180018001
      8001800180018001800180018001800180018001800180018001800180018001
      8001800180018001800180018001800180018001800180018001800180018001
      8001800180018001FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7FFFFFFFFFFFFF
      FC3FFFFF3FFF87FFFC3FFFFF1FFF87FFFC3FFF3F8FFF80FFFC3FFF1FC83F80BF
      F81FE00FF01F809FF00FE007E00F800FE007E007E00F800FE007E00FE00F809F
      E007FF1FE00F80BFE007FF3FE00F80FFE007FFFFF01F80FFF00FFFFFF83F80FF
      F81FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7F
      83FF8001FC3FFC3F83FF8001F00FFC3F83FF8001E007FC3F80FF8001E007FC3F
      80FF8001C003F81F80FF8001C003F3CF80078001C003E7E780078001C003EFF7
      80078001E007EFF780018001E007EFF780018001F00FE7E780018001FC3FF7EF
      80018001FFFFF81FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF800180018001FFFF
      800180018001C3FF800180018001C3FF800180018001C07F800180018001C05F
      800180018001C04F800180018001C007800180018001C007800180018001C04F
      800180018001C05F800180018001C07F800180018001C07F800180018001C07F
      800180018001FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC003FFFFFFFF8001
      C003C001C3C38001C003C001C3C38001F81FC001C0038001C003C001C0038001
      C003C001C0038001C003C001C0038001C003C001C0038001C003C001C0038001
      C003C001C0038001C023C001C0038001C003C001C0038001C003C001C0038001
      C003FFFFFFFF8001FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8045FE7FFFFF
      80018045FC3FFFFF80019FFFFC3FE00780019FFFFC3FE00780019845FC3FE007
      80019845F81FE007800199FFF3CFE007800199FFE7E7E00780018045EFF7E007
      80018045EFF7E00780019FFFEFF7F3CF80019FFFE7E7F3CF80018045F7EFF99F
      80018045F81FFC3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFFFFFFF87FFF3
      FFFF9FFF9F039F01E7E78FFF8E018F01E3C7C7FFC631C7F3F18FE41FE411E417
      F81FF80FF801F80FFC3FF1C7F103F1C7FC3FF3E7F387F3E7F81FF3E7F3E7F3E7
      F187F3E7F3E7F3E7E3C7F1C7F1C7F1C7E7E7F80FF80FF80FFFFFFC1FFC1FFC1F
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF01FF01FFFFFFFFFF01FF01
      C3C3C3C3C301C301DFFBC3C3C301C301DFFBC003C001C001DFFBC003C001C001
      FFFFC003C001C001FFFFC003C001C001FFFFC003C001C001FFFFC003C003C003
      DFFBC003C003C003DFFBC003C003C003DFFBC003C003C003C3C3C003C003C003
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      F81FF81FFFFFCFCFF00FF00FC003C787E007E007DFFBE387C183C603DFFBF1CF
      C183C703DFFBF8FFC183C3A3DFFBFC7FC183C1E3DFFBFE3FC003C0E3DFFBFF1F
      C183C1E3C003F38FE007E007C003E1C7F00FF00FC003E1E3F81FF81FFFFFF3F3
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC003C003C003C003
      C003C003C003C003CFF3CFF3C3F3C813CA13C813C1F3C993CFF3C8D3C8F3C993
      CA13C813CC03C993CFF3C8D3CE63C993CA13C813CEF3C993CFF3CFF3CEF3C813
      C003C003C063C183C003C003C003C003C003C003C003C003C003C003C003C003
      C003C003C003C003FFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object ImageList2: TImageList
    BlendColor = clWhite
    DrawingStyle = dsTransparent
    Left = 128
    Top = 136
    Bitmap = {
      494C01015400E010040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000006001000001002000000000000060
      0100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008F6130008F6130008F6130008F613000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008F6130008F6130008F6130008F613000000000000000
      000000000000000000000000000000000000000000008F6130008F6130008F61
      30008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F6130008F613000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008F613000000000008F613000EEC16100EEC161008F613000000000008F61
      3000000000000000000000000000000000000000000000000000000000000000
      00008F613000000000008F613000EEC16100EEC161008F613000000000008F61
      300000000000000000000000000000000000000000008F61300080F9FE0080F9
      FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9
      FE0080F9FE0080F9FE008F613000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008F61
      3000EEC161008F6130008F613000EEC16100EEC161008F6130008F613000EEC1
      61008F6130000000000000000000000000000000000000000000000000008F61
      3000EEC161008F6130008F613000EEC16100EEC161008F6130008F613000EEC1
      61008F613000000000000000000000000000000000008F61300080F9FE0080F9
      FE0080F9FE0080F9FE008F6130008F6130008F6130008F61300080F9FE0080F9
      FE0080F9FE0080F9FE008F613000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008F613000EEC1
      6100EEC16100EEC16100EEC16100EEC16100EEC16100EEC16100EEC16100EEC1
      6100EEC161008F613000000000000000000000000000000000008F6130001DA9
      CA008F613000EEC16100EEC16100EEC16100EEC16100EEC16100EEC16100EEC1
      6100EEC161008F6130000000000000000000000000008F61300080F9FE001260
      C0001260C0001260C0008F613000FFD48B00FFD48B008F6130001260C0001260
      C0001260C00080F9FE008F613000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008F61
      3000EEC16100EEC16100EEC16100EEC16100EEC16100EEC16100EEC16100EEC1
      61008F6130000000000000000000000000000000000000000000000000008F61
      30001DA9CA008F613000EEC16100EEC16100EEC16100EEC16100EEC16100EEC1
      61008F613000000000000000000000000000000000008F61300080F9FE0080F9
      FE0080F9FE0080F9FE008F613000FFD48B00FFD48B008F61300080F9FE0080F9
      FE0080F9FE0080F9FE008F613000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008F6130008F6130008F61
      3000EEC16100EEC16100EEC16100EEC16100EEC16100EEC16100EEC16100EEC1
      61008F6130008F6130008F61300000000000000000008F6130008F6130008F61
      30001DA9CA001DA9CA008F613000EEC16100EEC16100EEC16100EEC16100EEC1
      61008F6130008F6130008F61300000000000000000008F61300080F9FE001260
      C0001260C0001260C0008F613000FFD48B00FFD48B008F6130001260C0001260
      C0001260C00080F9FE008F613000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008F613000EEC16100EEC1
      61008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      3000EEC16100EEC161008F61300000000000000000008F6130001DA9CA001DA9
      CA001DA9CA001DA9CA001DA9CA008F613000EEC16100EEC16100EEC16100EEC1
      6100EEC16100EEC161008F61300000000000000000008F61300080F9FE0080F9
      FE0080F9FE0080F9FE008F613000FFD48B00FFD48B008F61300080F9FE0080F9
      FE0080F9FE0080F9FE008F613000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008F613000EEC16100EEC1
      61008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      3000EEC16100EEC161008F61300000000000000000008F6130001DA9CA001DA9
      CA001DA9CA001DA9CA001DA9CA001DA9CA008F613000EEC16100EEC16100EEC1
      6100EEC16100EEC161008F61300000000000000000008F61300080F9FE001260
      C0008F6130008F6130008F613000FFD48B00FFD48B008F6130008F6130008F61
      30001260C00080F9FE008F613000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008F6130008F6130008F61
      3000EEC16100EEC16100EEC16100EEC16100EEC16100EEC16100EEC16100EEC1
      61008F6130008F6130008F61300000000000000000008F6130008F6130008F61
      30001DA9CA001DA9CA001DA9CA001DA9CA001DA9CA008F613000EEC16100EEC1
      61008F6130008F6130008F61300000000000000000008F61300080F9FE0080F9
      FE008F613000FFD48B00FFD48B00FFD48B00FFD48B00FFD48B00FFD48B008F61
      300080F9FE0080F9FE008F613000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008F61
      3000EEC16100EEC16100EEC16100EEC16100EEC16100EEC16100EEC16100EEC1
      61008F6130000000000000000000000000000000000000000000000000008F61
      30001DA9CA001DA9CA001DA9CA001DA9CA001DA9CA001DA9CA008F613000EEC1
      61008F613000000000000000000000000000000000008F61300080F9FE001260
      C0001260C0008F613000FFD48B00FFD48B00FFD48B00FFD48B008F6130001260
      C0001260C00080F9FE008F613000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008F613000EEC1
      6100EEC16100EEC16100EEC16100EEC16100EEC16100EEC16100EEC16100EEC1
      6100EEC161008F613000000000000000000000000000000000008F6130001DA9
      CA001DA9CA001DA9CA001DA9CA001DA9CA001DA9CA001DA9CA001DA9CA008F61
      3000EEC161008F6130000000000000000000000000008F61300080F9FE0080F9
      FE0080F9FE0080F9FE008F613000FFD48B00FFD48B008F61300080F9FE0080F9
      FE0080F9FE0080F9FE008F613000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008F61
      3000EEC161008F6130008F613000EEC16100EEC161008F6130008F613000EEC1
      61008F6130000000000000000000000000000000000000000000000000008F61
      30001DA9CA008F6130008F6130001DA9CA001DA9CA008F6130008F6130001DA9
      CA008F613000000000000000000000000000000000008F61300080F9FE001260
      C0001260C0001260C0001260C0008F6130008F6130001260C0001260C0001260
      C0001260C00080F9FE008F613000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008F613000000000008F613000EEC16100EEC161008F613000000000008F61
      3000000000000000000000000000000000000000000000000000000000000000
      00008F613000000000008F6130001DA9CA001DA9CA008F613000000000008F61
      300000000000000000000000000000000000000000008F61300080F9FE0080F9
      FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9
      FE0080F9FE0080F9FE008F613000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008F6130008F6130008F6130008F613000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008F6130008F6130008F6130008F613000000000000000
      000000000000000000000000000000000000000000008F6130008F6130008F61
      30008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F6130008F613000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008F6130008F6130008F6130008F613000000000000000
      0000000000000000000000000000000000000000000077500E0077500E007750
      0E0077500E0077500E0077500E0077500E0077500E0077500E0077500E007750
      0E0077500E0077500E0077500E00000000000000000077500E0077500E007750
      0E0077500E0077500E0077500E0077500E0077500E0077500E0077500E007750
      0E0077500E0077500E0077500E0000000000000000008F6130008F6130008F61
      30008F6130008F6130008F6130008B5E2A008B5E2A0077500E0077500E007750
      0E0077500E0077500E0077500E00000000000000000000000000000000000000
      00008F613000000000008F61300013B5E00013B5E0008F613000000000008F61
      3000000000000000000000000000000000000000000077500E006DF1FF006DF1
      FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DEE
      FA006FD8D90070C1B70077500E00000000000000000077500E006DF1FF006DF1
      FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DEE
      FA006FD8D9006FCDC90077500E0000000000000000008F613000000000000000
      000000000000000000008F6130006DF1FF006DF1FF006DF1FF006DF1FF006DF1
      FF006DE9F3006FD2D10077500E00000000000000000000000000000000008F61
      300013B5E0008F6130008F61300013B5E00013B5E0008F6130008F61300013B5
      E0008F613000000000000000000000000000000000000000000077500E006DF1
      FF006DF1FF006DF1FF006DF1FF008F6130008F6130006DF1FF006DF1FF006EDF
      E40070C1B70077500E000000000000000000000000000000000077500E006DF1
      FF006DF1FF006DF1FF006DF1FF008F6130008F6130006DF1FF006DF1FF006EDF
      E40070C1B70077500E000000000000000000000000008F613000000000000000
      000000000000000000008F6130006DF1FF006DF1FF006DF1FF006DF1FF006DF1
      FF006EE4EC0070C7C10077500E000000000000000000000000008F61300013B5
      E00013B5E00013B5E00013B5E0008F6130008F61300013B5E00013B5E00013B5
      E00013B5E0008F6130000000000000000000000000000000000077500E006DEE
      FA006DF1FF006DF1FF006DF1FF008F6130008F6130006DF1FF006EDFE40070C1
      B70072A68E0077500E000000000000000000000000000000000077500E006DEE
      FA006DF1FF006DF1FF006DF1FF008F6130008F6130006DF1FF006EDFE40070C1
      B70072A68E0077500E000000000000000000000000008F613000000000000000
      000083581F00000000008F6130008B5E2A008C5F2C008D602D0083581F008358
      1F0081571C007951110077500E00000000000000000000000000000000008F61
      300013B5E00013B5E00013B5E0008F6130008F61300013B5E00013B5E00013B5
      E0008F6130000000000000000000000000000000000000000000000000007750
      0E006DE9F3006DF1FF006DF1FF006DF1FF006DEEFA006EDFE40070C7C10072A6
      8E0077500E000000000000000000000000000000000000000000000000007750
      0E006DE9F3006DF1FF006DF1FF006DF1FF006DEEFA006EDFE40070C7C10072A6
      8E0077500E000000000000000000000000000000000000000000000000008B5E
      2A00875C2500000000000000000000000000000000008F6130006DF1FF006DF0
      FE006FD2D10071B2A10077500E0000000000000000008F6130008F6130008F61
      300013B5E00013B5E00013B5E0008F6130008F61300013B5E00013B5E00013B5
      E0008F6130008F6130008F613000000000000000000000000000000000007750
      0E006EE4EC006DEEFA006DF1FF008F6130008D602E006FD2D10071B8A900729A
      7E0077500E000000000000000000000000000000000000000000000000007750
      0E006EE4EC006DEEFA006DF1FF008F6130008D602E006FD2D10071B8A900729A
      7E0077500E0000000000000000000000000000000000000000008F6130008F61
      30008F6130008F6130008F6130008F613000000000008F6130006DF1FF006DF1
      FF006FD8D90071B2A10077500E0000000000000000008F61300013B5E00013B5
      E0008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      300013B5E00013B5E0008F613000000000000000000000000000000000000000
      000077500E006DE9F3006DF1FF008F6130008D5F2E0070C7C10072A68E007750
      0E00000000000000000000000000000000000000000000000000000000000000
      000077500E006DE9F3006DF1FF008F6130008D5F2E0070C7C10072A68E007750
      0E0000000000000000000000000000000000000000008F6130008F6130008F61
      30008F6130008D602E008E602F008F613000000000008F613000845920008459
      200082581D007B53140077500E0000000000000000008F61300013B5E00013B5
      E0008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      300013B5E00013B5E0008F613000000000000000000000000000000000000000
      000077500E006EE4EC006DEEFA008E602F008B5E2A0071B8A900729A7E007750
      0E00000000000000000000000000000000000000000000000000000000000000
      000077500E006EE4EC006DEEFA008E602F008B5E2A0071B8A900729A7E007750
      0E000000000000000000000000000000000000000000000000008F6130008D60
      2E008C5F2C008C5F2B008D602E008F613000000000008F6130006DF1FF006DF1
      FF006FD8D90071B2A10077500E0000000000000000008F6130008F6130008F61
      300013B5E00013B5E00013B5E0008F6130008F6130001DA9CA001DA9CA001DA9
      CA008F6130008F6130008F613000000000000000000000000000000000000000
      00000000000077500E006DE9F3008D602E00895D280072A68E0077500E000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000077500E006DE9F3008D602E00895D280072A68E0077500E000000
      0000000000000000000000000000000000000000000000000000000000008C5F
      2C008B5E2A00000000000000000000000000000000008F6130006DF1FF006DF1
      FF006FD8D90071B2A10077500E00000000000000000000000000000000008F61
      300013B5E00013B5E00013B5E0008F6130008F6130001DA9CA001DA9CA001DA9
      CA008F6130000000000000000000000000000000000000000000000000000000
      00000000000077500E006EDFE4006FD8D90070BCAF00729A7E0077500E000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000077500E006EDFE4006FD8D90070BCAF00729A7E0077500E000000
      000000000000000000000000000000000000000000008F613000000000000000
      00008D5F2E00000000008F6130008F6130008F6130008F6130008F6130008D60
      2E00895D28007D54160077500E000000000000000000000000008F61300013B5
      E00013B5E00013B5E00013B5E0008F6130008F6130001DA9CA001DA9CA001DA9
      CA001DA9CA008F61300000000000000000000000000000000000000000000000
      0000000000000000000077500E0070C7C10071AD990077500E00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000077500E0070C7C10071AD990077500E00000000000000
      000000000000000000000000000000000000000000008F613000000000000000
      000000000000000000008F6130006DF1FF006DF1FF006DE9F3006EDFE4006FD2
      D10071B8A90072A68E0077500E00000000000000000000000000000000008F61
      300013B5E0008F6130008F61300013B5E00013B5E0008F6130008F6130001DA9
      CA008F6130000000000000000000000000000000000000000000000000000000
      0000000000000000000077500E0070C7C10071AD990077500E00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000077500E0070BCAF0072A68E0077500E00000000000000
      000000000000000000000000000000000000000000008F613000000000000000
      000000000000000000008F6130006DE9F3006EDFE4006FD2D10070C7C10070BC
      AF0071AD9900729A7E0077500E00000000000000000000000000000000000000
      00008F613000000000008F61300013B5E00013B5E0008F613000000000008F61
      3000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000077500E0077500E0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000077500E0077500E0000000000000000000000
      000000000000000000000000000000000000000000008F6130008F6130008F61
      30008F6130008F6130008D602E008B5E2A00895D2700875B2400865B2300855A
      22008459200083581F0077500E00000000000000000000000000000000000000
      000000000000000000008F6130008F6130008F6130008F613000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008F6130008F61
      30008F6130008F6130008F6130008F6130008F6130008F6130008F6130008E60
      2F008C5F2C008B5E2A0000000000000000000000000097575A0097575A009757
      5A0097575A0097575A0097575A0097575A0097575A0097575A0097575A009757
      5A0097575A009557560093565100000000000000000000000000000000000000
      000000000000000000008F6130008F6130008D602E0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008F6130008F61300000000000000000000000
      00000000000000000000000000000000000000000000000000008F6130006DF1
      FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1
      FF006DF1FF00895D270000000000000000000000000097575A006DF1FF006DF1
      FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1
      FF006DF1FF006DF1FF008F554800000000000000000000000000000000000000
      000000000000000000008F6130006DF1FF008C5F2B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008F6130008F61300000000000000000000000
      00000000000000000000000000000000000000000000000000008F6130006DF1
      FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1
      FF006DF1FF00865B230000000000000000000000000097575A006DF1FF006DF1
      FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1
      FF006DF1FF006DF1FF008C554100000000000000000000000000000000000000
      000000000000000000008F6130006DF1FF008A5D290000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008F6130006DF1FF006DF1FF00895D2800000000000000
      00000000000000000000000000000000000000000000000000008F6130006DF1
      FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1
      FF006DF1FF008459200000000000000000000000000097575A006DF1FF006DF1
      FF0097575A0097575A0097575A0097575A0097575A0097575A0097575A009557
      56006DF1FF006DF1FF008B543C00000000000000000000000000000000000000
      000000000000000000008F6130006DF1FF00895D270000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008F6130006DF1FF006DF1FF00895D2700000000000000
      00000000000000000000000000000000000000000000000000008D602E006DF1
      FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1
      FF00885B1E0082581D0000000000000000000000000097575A006DF1FF006DF1
      FF0097575A0097575A0097575A0097575A0097575A0095575600955756006DF1
      FF006DF1FF006DF1FF008B543C00000000000000000000000000000000000000
      000000000000000000008F6130006DF1FF00875C250000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008F6130006DF1FF006DF1FF006DF1FF006DF1FF00865B23000000
      0000000000000000000000000000000000000000000000000000000000008C5F
      2C006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1
      FF0080561B000000000000000000000000000000000097575A006DF1FF006DF1
      FF0097575A0097575A0097575A0097575A0095575600935651006DF1FF009E5D
      58006DF1FF006DF1FF008B543C00000000000000000000000000000000000000
      000000000000000000008F6130008F613000875C250000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008F6130006DF1FF006DF1FF006DF1FF006DF1FF00875B24000000
      0000000000000000000000000000000000000000000000000000000000008C5F
      2B006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF00885B
      1E007F561A000000000000000000000000000000000097575A006DF1FF006DF1
      FF0097575A0097575A0097575A0095575600935651006DF1FF009E5D58006DF1
      FF006DF1FF006DF1FF008B543C00000000000000000000000000000000000000
      000000000000000000008F6130008F613000895D270000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008F6130006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF00865B
      2300000000000000000000000000000000000000000000000000000000000000
      00008C5F2B008D5F2E008E602F009D67310099652D00875B240082581D008056
      1B00000000000000000000000000000000000000000097575A006DF1FF006DF1
      FF0097575A0097575A0095575600935651006DF1FF009C5D54006DF1FF009E5D
      58006DF1FF006DF1FF008B543C00000000000000000000000000000000000000
      000000000000000000008F6130008F6130008A5E290000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008F6130006DF1FF006DF1FF008F6130008D602E006DF1FF006DF1FF00855A
      2200000000000000000000000000000000000000000000000000000000000000
      000000000000000000008F6130006DF1FF006DF1FF00865B2300000000000000
      0000000000000000000000000000000000000000000097575A006DF1FF006DF1
      FF0097575A0095575600935651006DF1FF009C5D54006DF1FF006DF1FF006DF1
      FF006DF1FF006DF1FF008C554100000000000000000000000000000000000000
      000000000000000000008F6130008F6130008C5F2C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008F61
      30006DF1FF006DF1FF008F6130006DF1FF006DF1FF00895D28006DF1FF006DF1
      FF00845920000000000000000000000000000000000000000000000000000000
      0000000000008F6130008F6130006DF1FF006DF1FF00865B230082581D000000
      0000000000000000000000000000000000000000000097575A006DF1FF006DF1
      FF0097575A00955756006DF1FF009E5D58006DF1FF006DF1FF006DF1FF006DF1
      FF006DF1FF006DF1FF008C554100000000000000000000000000000000000000
      000000000000000000008F6130006DF1FF008E602F0000000000000000000000
      00008E602F008C5F2C00000000000000000000000000000000008F6130008D60
      2E008D5F2E008C5F2C008D5F2E006DF1FF006DF1FF00865B230083581F008258
      1D0082581D00855A220000000000000000000000000000000000000000000000
      0000000000008F6130006DF1FF006DF1FF006DF1FF006DF1FF0081571C000000
      0000000000000000000000000000000000000000000097575A006DF1FF006DF1
      FF00955756006DF1FF009E5D58006DF1FF009E5D58006DF1FF006DF1FF00A15E
      5E006DF1FF006DF1FF008C5541000000000000000000000000008F6130000000
      0000000000008F6130008F6130008F6130008F6130008D602E008E602F008E60
      2F008D5F2E00895D280000000000000000000000000000000000000000000000
      000000000000895D28006DF1FF006DF1FF006DF1FF006DF1FF0080561B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008D602E006DF1FF006DF1FF006DF1FF006DF1FF0081571C000000
      0000000000000000000000000000000000000000000097575A006DF1FF006DF1
      FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1
      FF006DF1FF006DF1FF008B543C000000000000000000000000008F6130008F61
      30008F6130008F6130008F6130008D602E008C5F2C008C5F2C008C5F2C008C5F
      2B008A5D2900865B230000000000000000000000000000000000000000000000
      00000000000000000000875C25006DF1FF006DF1FF0081571C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008D5F2E006DF1FF006DF1FF006DF1FF006DF1FF0081571C000000
      00000000000000000000000000000000000000000000955756006DF1FF006DF1
      FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1
      FF006DF1FF006DF1FF008B543C00000000000000000000000000000000008D60
      2E008D5F2E008C5F2C008B5E2A008A5D2900895D2700875C2500875B2400875B
      2400865B23008459200000000000000000000000000000000000000000000000
      0000000000000000000000000000875C2500855A210000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008B5E2A00895D2800865B230083581F00000000000000
      00000000000000000000000000000000000000000000935651008F5548008C55
      41008B543C008B543C008B543C008B543C008B543C008B543C008B543C008B54
      3C008B543C008B543C0083503400000000000000000000000000000000000000
      00000000000000000000895D2700875C2500865B2300855A2100000000000000
      000083581F008359200000000000000000000000000000000000000000000000
      00000000000000000000000000008C5F2C00895D270000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000067E0000067E0000067
      E0000067E0000067E0000067E0000067E0000067E000000000000067E0000067
      E0000167DE00000000000067E0000000000000000000F37D0000F37D0000F37D
      0000F37D0000F37D0000F37D0000F37D0000F07C000000000000F37D0000F37D
      0000F37D000000000000E7790100000000000000000000000000000000000000
      000000000000000000008F6130008F6130008F6130008F613000000000000000
      000000000000000000000000000000000000000000008F6130008F6130008F61
      300000000000000000008F6130008F6130008F61300000000000000000008F61
      30008D602E008A5E29000000000000000000000000000067E0000067E0000067
      E0000167DE000666D5000566D8000366DA000566D800000000000067E0000067
      E0000866D200000000000067E0000000000000000000F37D0000F37D0000F37D
      0000F37D0000ED7B0100ED7B0100F07C0000ED7B010000000000F37D0000F37D
      0000ED7B010000000000E1770200000000000000000000000000000000000000
      00008F613000000000008F613000BEBD9E00BEBD9E008F613000000000008F61
      300000000000000000000000000000000000000000008F6130008F6130008F61
      300000000000000000008F6130008F6130008F61300000000000000000008F61
      30008D602D00895D28000000000000000000000000000067E0000067E0000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F37D0000F37D00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008F61
      3000BEBD9E008F6130008F613000BEBD9E00BEBD9E008F6130008F613000BEBD
      9E008F61300000000000000000000000000000000000000000008F6130000000
      00000000000000000000000000008F6130000000000000000000000000000000
      00008D602D00000000000000000000000000000000000067E0000167DE000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F37D0000F07C00000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008F613000BEBD
      9E00BEBD9E00BEBD9E00BEBD9E00BEBD9E00BEBD9E00BEBD9E00BEBD9E00BEBD
      9E00BEBD9E008F613000000000000000000000000000000000008F6130008F61
      30008F6130008F6130008F6130008F6130008F6130008F6130008F6130008E60
      2F008C5F2B00000000000000000000000000000000000067E0000067E0000000
      0000000000000067E0000067E0000067E0000666D500000000000167DE000366
      DA000C65CB00000000000067E0000000000000000000F37D0000F07C00000000
      000000000000F37D0000F37D0000F37D0000ED7B010000000000F37D0000F07C
      0000E779010000000000DD750200000000000000000000000000000000008F61
      3000BEBD9E00BEBD9E00BEBD9E00BEBD9E00BEBD9E00BEBD9E00BEBD9E00BEBD
      9E008F6130000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008F6130000000000000000000000000000000
      000000000000000000000000000000000000000000000067E0000067E0000000
      0000000000000067E0000067E0000067E0000C65CB00000000000167DE000366
      DA000C65CB00000000000067E0000000000000000000F37D0000F37D00000000
      000000000000F37D0000F37D0000F37D0000E779010000000000F37D0000F07C
      0000E779010000000000DD75020000000000000000008F6130008F6130008F61
      3000BEBD9E00BEBD9E00BEBD9E00BEBD9E00BEBD9E00BEBD9E00BEBD9E00BEBD
      9E008F6130008F6130008F61300000000000000000008F6130008F6130008F61
      30008F6130008F6130008F6130008F6130008F6130008F6130008F6130008D60
      2E008B5E2A00875C25000000000000000000000000000067E0000067E0000000
      0000000000000067E0000067E000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F37D0000F37D00000000
      000000000000F37D0000F37D0000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008F613000BEBD9E00BEBD
      9E00BEBD9E00BEBD9E00BEBD9E00BEBD9E00BEBD9E00BEBD9E00BEBD9E00BEBD
      9E00BEBD9E00BEBD9E008F61300000000000000000008F6130006DF1FF006DF1
      FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1
      FF006DF1FF00865B23000000000000000000000000000067E0000067E0000000
      0000000000000067E0000C65CB00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F37D0000F37D00000000
      000000000000F37D0000E7790100000000000000000000000000000000000000
      000000000000000000000000000000000000000000008F613000BEBD9E00BEBD
      9E00BEBD9E00BEBD9E00BEBD9E00BEBD9E00BEBD9E00BEBD9E00BEBD9E00BEBD
      9E00BEBD9E00BEBD9E008F61300000000000000000008F6130006DF1FF006DF1
      FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1
      FF006DF1FF00845920000000000000000000000000000067E0000067E0000067
      E0000167DE000C65CB001260C0001862B5001862B500000000000366DA000366
      DA000C65CB00000000000067E0000000000000000000F37D0000F37D0000F37D
      0000F37D0000E7790100DD750200DA740300DD75020000000000F07C0000F07C
      0000E779010000000000DD75020000000000000000008F6130008F6130008F61
      3000BEBD9E00BEBD9E00BEBD9E00BEBD9E00BEBD9E00BEBD9E00BEBD9E00BEBD
      9E008F6130008F6130008F61300000000000000000008F6130006DF1FF006DF1
      FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1
      FF006DF1FF0083581F000000000000000000000000000067E0000067E0000167
      DE000C65CB001862B5001862B5001862B5001260C000000000000267DD000366
      DA000C65CB00000000000067E0000000000000000000F37D0000F37D0000F37D
      0000E7790100DD750200DA740300DD750200E177020000000000F07C0000F07C
      0000E779010000000000DD750200000000000000000000000000000000008F61
      3000BEBD9E00BEBD9E00BEBD9E00BEBD9E00BEBD9E00BEBD9E00BEBD9E00BEBD
      9E008F613000000000000000000000000000000000008F6130006DF1FF006DF1
      FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1
      FF006DF1FF0082581D000000000000000000000000000067E0000067E0000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F37D0000F37D00000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008F613000BEBD
      9E00BEBD9E00BEBD9E00BEBD9E00BEBD9E00BEBD9E00BEBD9E00BEBD9E00BEBD
      9E00BEBD9E008F6130000000000000000000000000008E602F006DF1FF006DF1
      FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1
      FF006DF1FF0081571C000000000000000000000000000067E0000267DD000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F37D0000F07C00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008F61
      3000BEBD9E008F6130008F613000BEBD9E00BEBD9E008F6130008F613000BEBD
      9E008F613000000000000000000000000000000000008C5F2C006DF1FF006DF1
      FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1
      FF006DF1FF0081571C000000000000000000000000000866D2000C65CB001164
      C2001260C0001260C0001164C2001064C4000C65CB00000000000666D5000866
      D2001064C400000000000666D5000000000000000000ED7B0100E7790100E177
      0200E1770200DD750200E1770200E7790100E779010000000000ED7B0100E779
      0100E177020000000000DA740300000000000000000000000000000000000000
      00008F613000000000008F613000BEBD9E00BEBD9E008F613000000000008F61
      300000000000000000000000000000000000000000008A5E2900875C2500855A
      22008359200083581F0083581F008359200083581F0083581F0082581D008157
      1C0081571C0081571C000000000000000000000000001164C2001862B5002261
      A5002261A5002261A5002261A5001862B5001862B500000000001260C0001260
      C0001862B500000000001064C4000000000000000000DD750200D4720400CF70
      0400CF700400CF700400D4720400DA740300DA74030000000000E1770200E177
      0200DA74030000000000DA740300000000000000000000000000000000000000
      000000000000000000008F6130008F6130008F6130008F613000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008F6130008F6130008F6130008F613000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008F6130008F6130008F6130008F613000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000895D2700895D2700895D2700895D
      2700895D2700895D2700895D2700000000000000000000000000000000000000
      000000000000000000008F6130008E602F008E602F008D5F2E00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008F613000000000008F613000918D6900918D69008F613000000000008F61
      3000000000000000000000000000000000000000000000000000000000000000
      00008F613000000000008F6130003DA1ED003DA1ED008F613000000000008F61
      30000000000000000000000000000000000000000000000000008F6130008F61
      30008F6130008F6130000000000000000000895D270080F9FE0080F9FE0080F9
      FE0080F9FE0080F9FE00895D2700000000000000000000000000000000000000
      00008F613000000000008F61300000000000000000008D602E00000000008E60
      2F00000000000000000000000000000000000000000000000000000000008F61
      3000918D69008F6130008F613000918D6900918D69008F6130008F613000918D
      69008F6130000000000000000000000000000000000000000000000000008F61
      30003DA1ED008F6130008F6130003DA1ED003DA1ED008F6130008F6130003DA1
      ED008F61300000000000000000000000000000000000000000008F613000CB9D
      6C00CB9D6C008F6130000000000000000000895D270080F9FE006A9355006A93
      55006A93550080F9FE00895D2700000000000000000000000000000000008F61
      3000000000008E602F008C5F2C0000000000000000008D5F2E008D602E000000
      00008E602F0000000000000000000000000000000000000000008F613000918D
      6900918D6900918D6900918D6900918D6900918D6900918D6900918D6900918D
      6900918D69008F613000000000000000000000000000000000008F6130003DA1
      ED003DA1ED003DA1ED003DA1ED003DA1ED003DA1ED003DA1ED003DA1ED003DA1
      ED003DA1ED008F613000000000000000000000000000000000008F613000CB9D
      6C008F6130008F613000CB9D6C006DF1FF00895D270080F9FE0080F9FE0080F9
      FE0080F9FE0080F9FE00895D27000000000000000000000000008F6130000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008F61300000000000000000000000000000000000000000008F61
      3000918D6900918D6900918D6900918D6900918D6900918D6900918D6900918D
      69008F6130000000000000000000000000000000000000000000000000008F61
      30003DA1ED003DA1ED003DA1ED003DA1ED003DA1ED003DA1ED003DA1ED003DA1
      ED008F61300000000000000000000000000000000000000000008F613000CB9D
      6C008F6130006DF1FF006DF1FF006DF1FF00895D270080F9FE006A9355006A93
      55006A93550080F9FE00895D2700000000000000000000000000000000008E60
      2F00000000000000000000000000000000000000000000000000000000000000
      00008F613000000000000000000000000000000000008F6130008F6130008F61
      3000918D6900918D6900918D6900918D6900918D6900918D6900918D6900918D
      69008F6130008F6130008F61300000000000000000008F6130008F6130008F61
      30003DA1ED003DA1ED003DA1ED003DA1ED003DA1ED003DA1ED003DA1ED003DA1
      ED008F6130008F6130008F6130000000000000000000000000008F613000CB9D
      6C008F6130006DF1FF006DF1FF006DF1FF00895D270080F9FE0080F9FE0080F9
      FE0080F9FE0080F9FE00895D270000000000000000008F6130008F6130008C5F
      2C00000000000000000000000000000000000000000000000000000000000000
      00008F6130008F6130008F61300000000000000000008F613000918D6900918D
      6900918D6900918D6900918D6900918D6900918D6900918D6900918D6900918D
      6900918D6900918D69008F61300000000000000000008F6130003DA1ED003DA1
      ED003DA1ED003DA1ED003DA1ED003DA1ED003DA1ED003DA1ED003DA1ED003DA1
      ED003DA1ED003DA1ED008F6130000000000000000000000000008F613000CB9D
      6C008F6130006DF1FF006DF1FF008F613000895D270080F9FE006A9355006A93
      55006A93550080F9FE00895D270000000000000000008F613000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008F61300000000000000000008F613000918D6900918D
      6900918D6900918D6900918D6900918D6900918D6900918D6900918D6900918D
      6900918D6900918D69008F61300000000000000000008F6130003DA1ED003DA1
      ED003DA1ED003DA1ED003DA1ED003DA1ED003DA1ED003DA1ED003DA1ED003DA1
      ED003DA1ED003DA1ED008F6130000000000000000000000000008F613000CB9D
      6C008F6130006DF1FF006DF1FF008F613000895D270080F9FE0080F9FE0080F9
      FE0080F9FE0080F9FE00895D270000000000000000008F613000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008F61300000000000000000008F6130008F6130008F61
      3000918D6900918D6900918D6900918D6900918D6900918D6900918D6900918D
      69008F6130008F6130008F61300000000000000000008F6130008F6130008F61
      30003DA1ED003DA1ED003DA1ED003DA1ED003DA1ED003DA1ED003DA1ED003DA1
      ED008F6130008F6130008F6130000000000000000000000000008F613000CB9D
      6C008F6130006DF1FF006DF1FF006DF1FF00895D270080F9FE006A9355006A93
      55006A93550080F9FE00895D270000000000000000008F6130008E602F008D5F
      2E00000000000000000000000000000000000000000000000000000000000000
      00008F6130008F6130008F613000000000000000000000000000000000008F61
      3000918D6900918D6900918D6900918D6900918D6900918D6900918D6900918D
      69008F6130000000000000000000000000000000000000000000000000008F61
      30003DA1ED003DA1ED003DA1ED003DA1ED003DA1ED003DA1ED003DA1ED003DA1
      ED008F61300000000000000000000000000000000000000000008F613000CB9D
      6C008F6130008F6130008F6130008F613000895D270080F9FE0080F9FE0080F9
      FE0080F9FE0080F9FE00895D2700000000000000000000000000000000008D60
      2E00000000000000000000000000000000000000000000000000000000000000
      00008F61300000000000000000000000000000000000000000008F613000918D
      6900918D6900918D6900918D6900918D6900918D6900918D6900918D6900918D
      6900918D69008F613000000000000000000000000000000000008F6130003DA1
      ED003DA1ED003DA1ED003DA1ED003DA1ED003DA1ED003DA1ED003DA1ED003DA1
      ED003DA1ED008F613000000000000000000000000000000000008F613000CB9D
      6C00C6986700B4865500B4865500B4865500895D2700895D2700895D2700895D
      2700895D2700895D2700895D27000000000000000000000000008F6130000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008C5F2C0000000000000000000000000000000000000000008F61
      3000918D69008F6130008F613000918D6900918D69008F6130008F613000918D
      69008F6130000000000000000000000000000000000000000000000000008F61
      30003DA1ED008F6130008F6130003DA1ED003DA1ED008F6130008F6130003DA1
      ED008F61300000000000000000000000000000000000000000008F613000B688
      570095673600855726008557260085572600855726008557260085572600784A
      1900653706006537060000000000000000000000000000000000000000008E60
      2F00000000008F6130008F61300000000000000000008F6130008F6130000000
      00008B5E2A000000000000000000000000000000000000000000000000000000
      00008F613000000000008F613000918D6900918D69008F613000000000008F61
      3000000000000000000000000000000000000000000000000000000000000000
      00008F613000000000008F6130003DA1ED003DA1ED008F613000000000008F61
      3000000000000000000000000000000000000000000000000000845625007345
      1400673908006537060065370600653706006537060065370600653706006537
      0600653706006537060000000000000000000000000000000000000000000000
      00008D602E00000000008F61300000000000000000008D602E00000000008B5E
      2A00000000000000000000000000000000000000000000000000000000000000
      000000000000000000008F6130008F6130008F6130008F613000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008F6130008F6130008F6130008F613000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008F6130008D602E008D602E008C5F2C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008F6130008F6130008F6130008F613000000000000000
      0000000000000000000000000000000000000000000077500E0077500E007750
      0E0077500E0077500E0077500E0077500E0077500E0077500E0077500E007750
      0E0077500E0077500E0077500E00000000008F6130008F6130008F6130008F61
      30008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F6130008F6130008F6130000000000000000000000000000000
      000000000000000000000000000000000000000000008D602E00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008F613000000000008F6130004BC2B8004BC2B8008F613000000000008F61
      3000000000000000000000000000000000000000000077500E0041A7FF0041A7
      FF0041A7FF0041A7FF0041A7FF0041A7FF0041A7FF0041A7FF0041A7FF0042A6
      FC00479DE3004D94CA0077500E00000000008F613000ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC00ECECEC008F6130000000000000000000000000000000
      0000000000000000000000000000000000008D602E008D602D00000000000000
      0000000000000000000000000000000000000000000000000000000000008F61
      30004BC2B8008F6130008F6130004BC2B8004BC2B8008F6130008F6130004BC2
      B8008F613000000000000000000000000000000000000000000077500E0041A7
      FF0041A7FF0041A7FF0041A7FF008F6130008F61300041A7FF0041A7FF0045A0
      EC004D94CA0077500E0000000000000000008F613000ECECEC001260C0001260
      C0001260C0001260C0001260C0001260C0001260C0001260C0001260C0001260
      C0001260C0001260C000ECECEC008F6130000000000000000000000000000000
      00000000000000000000000000008D602E0080F9FE008B5E2A00000000008A5E
      29000000000000000000000000000000000000000000000000008F6130004BC2
      B8004BC2B8004BC2B8004BC2B8004BC2B8004BC2B8004BC2B8004BC2B8004BC2
      B8004BC2B8008F6130000000000000000000000000000000000077500E0042A6
      FB0041A7FF0041A7FF0041A7FF008F6130008F61300041A7FF0045A0EC004D94
      CA00538AAE0077500E0000000000000000008F613000ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC00ECECEC008F6130000000000000000000000000008D60
      2E008D602E008D602E008D602E0080F9FE0080F7FB00895D2800000000000000
      0000895D28000000000000000000000000000000000000000000000000008F61
      30004BC2B8004BC2B8004BC2B8004BC2B8004BC2B8004BC2B8004BC2B8004BC2
      B8008F6130000000000000000000000000000000000000000000000000007750
      0E0044A3F40041A7FF0041A7FF0041A7FF0042A6FB0045A0EC004D94CA00538A
      AE0077500E000000000000000000000000008F613000ECECEC001260C0001260
      C0001260C0001260C0001260C0001260C0001260C0001260C0001260C0001260
      C0001260C0001260C000ECECEC008F6130000000000000000000000000008D60
      2E0080F9FE008D602E0080F9FE0080F8FD007FE6E300875B2400000000000000
      0000895D2700000000000000000000000000000000008F6130008F6130008F61
      30004BC2B8004BC2B8004BC2B8004BC2B8004BC2B8004BC2B8004BC2B8004BC2
      B8008F6130008F6130008F613000000000000000000000000000000000007750
      0E0045A0EC0042A6FB0041A7FF008F6130008D602E00479DE3004D94CA005685
      9F0077500E000000000000000000000000008F613000ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC00ECECEC008F6130000000000000000000000000008D60
      2E0080F9FE008D602E0080F9FE007FE6E3007ED5CA00855A2200000000000000
      0000895D2700000000000000000000000000000000008F6130004BC2B8004BC2
      B8004BC2B8004BC2B8004BC2B8004BC2B8004BC2B8004BC2B8004BC2B8004BC2
      B8004BC2B8004BC2B8008F613000000000000000000000000000000000000000
      000077500E0044A3F40041A7FF008F6130008D5F2E004D94CA00538AAE007750
      0E00000000000000000000000000000000008F613000ECECEC001260C0001260
      C0001260C0001260C0001260C0001260C0001260C0001260C0001260C0001260
      C0001260C0001260C000ECECEC008F6130000000000000000000000000008D60
      2E0080F9FE008D602E007FEFF0007ED5CA007DC8B900855A2200000000000000
      0000875C2500000000000000000000000000000000008F6130004BC2B8004BC2
      B8004BC2B8004BC2B8004BC2B8004BC2B8004BC2B8004BC2B8004BC2B8004BC2
      B8004BC2B8004BC2B8008F613000000000000000000000000000000000000000
      000077500E0045A0EC0042A6FB008E602F008A5D29004D94CA0056859F007750
      0E00000000000000000000000000000000008F613000ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC00ECECEC008F6130000000000000000000000000008B5E
      2A007FDED700895D28007ED5CA007DC8B9007DC8B900855A2200000000000000
      0000875C2500000000000000000000000000000000008F6130008F6130008F61
      30004BC2B8004BC2B8004BC2B8004BC2B8004BC2B8004BC2B8004BC2B8004BC2
      B8008F6130008F6130008F613000000000000000000000000000000000000000
      00000000000077500E0044A3F4008D602E00895D2800538AAE0077500E000000
      0000000000000000000000000000000000008F613000ECECEC001260C0001260
      C0001260C0001260C0001260C0001260C0001260C0001260C0001260C0001260
      C0001260C0001260C000ECECEC008F613000000000000000000000000000895D
      2800875B2400865B2300855A22007DBFAC007DBFAC00855A2100000000000000
      0000865B23000000000000000000000000000000000000000000000000008F61
      30004BC2B8004BC2B8004BC2B8004BC2B8004BC2B8004BC2B8004BC2B8004BC2
      B8008F6130000000000000000000000000000000000000000000000000000000
      00000000000077500E0045A0EC00479DE3004D94CA0056859F0077500E000000
      0000000000000000000000000000000000008F613000ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC00ECECEC008F6130000000000000000000000000000000
      0000000000000000000000000000855A21007DBAA5008459200000000000855A
      22000000000000000000000000000000000000000000000000008F6130004BC2
      B8004BC2B8004BC2B8004BC2B8004BC2B8004BC2B8004BC2B8004BC2B8004BC2
      B8004BC2B8008F61300000000000000000000000000000000000000000000000
      0000000000000000000077500F004D94CA00538AAE0077500E00000000000000
      0000000000000000000000000000000000008F613000ECECEC001260C0001260
      C0001260C0001260C0001260C0001260C0001260C0001260C0001260C0001260
      C0001260C0001260C000ECECEC008F6130000000000000000000000000000000
      000000000000000000000000000000000000855A220084592000000000000000
      0000000000000000000000000000000000000000000000000000000000008F61
      30004BC2B8008F6130008F6130004BC2B8004BC2B8008F6130008F6130004BC2
      B8008F6130000000000000000000000000000000000000000000000000000000
      0000000000000000000077500E004D94CA00538AAE0077500E00000000000000
      0000000000000000000000000000000000008F613000ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC00ECECEC008F6130000000000000000000000000000000
      00000000000000000000000000000000000000000000855A2200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008F613000000000008F6130004BC2B8004BC2B8008F613000000000008F61
      3000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000077500E0077500E0000000000000000000000
      0000000000000000000000000000000000008F6130008F6130008F6130008F61
      30008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F6130008F6130008F6130000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008F6130008F6130008F6130008F613000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000D45EF000000000000000000000000000D45EF0000000000000000000000
      00000D45EF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000D45
      EF000D45EF000D45EF00000000000D45EF000D45EF000D45EF00000000000D45
      EF000E45ED001746DA0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000077500E0077500E007750
      0E0077500E0077500E0077500E0077500E0077500E0077500E0077500E007750
      0E0077500E0077500E0077500E00000000000000000000000000000000000000
      000000000000000000000000000000000000000000008F6130008D602E000000
      00000000000000000000000000000000000000000000000000000D45EF000D45
      EF00000000000D45EF000D45EF000D45EF00000000000D45EF000D45EF000D45
      EF00000000001746DA001E47CD00000000000000000000000000000000007750
      0E0077500E000000000000000000000000000000000000000000000000000000
      000077500E0077500E0000000000000000000000000077500E006DF1FF006DF1
      FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DEE
      FA006EDFE4006FD2D10077500E00000000000000000000000000000000000000
      0000000000000000000000000000000000008F613000FBFAF7008D5F2E000000
      00000000000000000000000000000000000000000000000000000D45EF000000
      000000000000000000000D45EF000000000000000000000000000F45EB000000
      000000000000000000001E47CD0000000000000000000000000077500E007750
      0E00000000000000000000000000000000000000000000000000000000000000
      00000000000077500E0077500E0000000000000000000000000077500E006DF1
      FF006DF1FF006DF1FF006DF1FF008F6130008F6130006DF1FF006DF1FF006EE4
      EC006FCDC90077500E0000000000000000000000000000000000000000000000
      0000000000008F6130008F6130008F6130008F613000FBFAF7008C5F2C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000077500E000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000077500E0000000000000000000000000077500E006DEE
      FA006DF1FF006DF1FF006DF1FF008F6130008F6130006DF1FF006EE4EC006FCD
      C90071B8A90077500E0000000000000000000000000000000000000000008F61
      30008F613000FBFAF700FBFAF700FBFAF700FBFAF700FBFAF700F1EDE500895D
      2800895D28000000000000000000000000000000000000000000000000007750
      0E0077500E0077500E0077500E0077500E0077500E0077500E0077500E000000
      000077500E0077500E000000000000000000000000000000000077500E000000
      00000000000077500E0077500E00000000000000000000000000000000000000
      0000000000000000000077500E00000000000000000000000000000000007750
      0E006DE9F3006DF1FF006DF1FF006DF1FF006DEEFA006EE4EC006FD2D10070BC
      AF0077500E0000000000000000000000000000000000000000008F613000FBFA
      F700FBFAF700FBFAF700FBFAF700FBFAF700FBFAF700FBFAF700F6F3EE00EBE6
      DB00DCD3C100875B24000000000000000000000000000000000077500E007750
      0E00000000000000000077500E0077500E000000000077500E0077500E007750
      0E000000000077500E0077500E0000000000000000000000000077500E000000
      00000000000077500E0077500E0000000000000000000000000077500E000000
      0000000000000000000077500E00000000000000000000000000000000007750
      0E006EE4EC006DEEFA006DF1FF008F6130008D602E006EDFE40070C7C10071B2
      A10077500E00000000000000000000000000000000008F613000FBFAF700FBFA
      F700FBFAF700FBFAF700FBFAF700FBFAF700FBFAF700FBFAF700FAF9F500F1ED
      E500E2DACB00D1C4AD00865B230000000000000000000000000077500E007750
      0E00000000000000000077500E0077500E000000000077500E0077500E000000
      00000000000077500E0077500E0000000000000000000000000077500E000000
      000000000000000000000000000000000000000000000000000077500E000000
      0000000000000000000077500E00000000000000000000000000000000000000
      000077500E006DE9F3006DF1FF008F6130008D5F2E006FD2D10070BCAF007750
      0E0000000000000000000000000000000000000000008F613000FBFAF700FBFA
      F700FBFAF700FBFAF700FBFAF700FBFAF700FBFAF700FBFAF700F9F8F400F1ED
      E500DCD3C100C8B99E0084592000000000000000000000000000000000007750
      0E0077500E0077500E0077500E0077500E000000000077500E0077500E000000
      00000000000077500E0077500E0000000000000000000000000077500E000000
      00000000000000000000000000000000000077500E0077500E0077500E007750
      0E0077500E000000000077500E00000000000000000000000000000000000000
      000077500E006EE4EC006DEEFA008E602F008B5E2A0070C7C10071B2A1007750
      0E0000000000000000000000000000000000000000008F613000FBFAF700FBFA
      F700FBFAF700FBFAF700FAF9F600FAF9F600FAF9F500F8F6F200F1EDE500E2DA
      CB00D1C4AD00BBA8870082581D00000000000000000000000000000000000000
      0000000000000000000077500E0077500E000000000077500E0077500E007750
      0E000000000077500E0077500E0000000000000000000000000077500E000000
      000000000000000000000000000000000000000000000000000077500E000000
      0000000000000000000077500E00000000000000000000000000000000000000
      00000000000077500E006DE9F3008D602D00895D270070BCAF0077500E000000
      000000000000000000000000000000000000000000008D5F2E00EBE6DB00EBE6
      DB00EEE9E000F1EDE500F1EDE500F1EDE500F1EDE500EBE6DB00E2DACB00D1C4
      AD00BBA88700AF98700080561B00000000000000000000000000000000007750
      0E0077500E0077500E0077500E00000000000000000077500E0077500E000000
      000077500E0077500E000000000000000000000000000000000077500E007750
      0E0000000000000000000000000000000000000000000000000077500E000000
      00000000000077500E0077500E00000000000000000000000000000000000000
      00000000000077500E006EDFE4006EDFE4006FCDC90071B2A10077500E000000
      00000000000000000000000000000000000000000000000000008A5D2900DCD3
      C100DCD3C100DCD3C100DCD3C100DCD3C100DCD3C100D1C4AD00C8B99E00BBA8
      8700AF9870007F56190000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000077500E0077500E000000
      0000000000000000000000000000000000000000000000000000000000007750
      0E0077500E000000000000000000000000000000000000000000000000000000
      000077500E0077500E0000000000000000000000000000000000000000000000
      0000000000000000000077500E006FD2D10070C1B70077500E00000000000000
      000000000000000000000000000000000000000000000000000000000000875C
      2500875B2400C8B99E00C8B99E00C8B99E00C8B99E00BBA88700AF9870008056
      1B007F561A000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000077500E0077500E0077500E000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000077500E0070C7C10071B8A90077500E00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008459200083581F0083581F0082581D0081571C0080561B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000077500E0077500E0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008F6130008F6130008F61
      30008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F6130008F613000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008F6130008F6130008F61
      30008F6130008F6130008F6130008F6130000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008B5E2A008B5E2A008F6130008F6130008F6130008F61
      30008F6130008F6130008F61300000000000000000008F61300080F9FE0080F9
      FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9
      FE0080F9FE0080F9FE008F613000000000008F6130008F6130008F6130008F61
      30008F6130008F6130008F61300000000000000000008F61300080F9FE0080F9
      FE0080F9FE0080F9FE0080F9FE008F6130000000000000000000000000000000
      000000000000000000008B5E2A008B5E2A008B5E2A0077500E0077500E007750
      0E0077500E0077500E0077500E00000000000000000000000000000000000000
      000000000000000000008F61300080F9FE0080F9FE0080F9FE0080F9FE0080F9
      FE0080F9FE0080F9FE008F61300000000000000000008F61300080F9FE001260
      C0001260C0001260C0001260C0008F6130008F6130001260C0001260C0001260
      C0001260C00080F9FE008F613000000000008F61300080F9FE0080F9FE0080F9
      FE0080F9FE0080F9FE008F61300000000000000000008F61300080F9FE001260
      C0001260C0001260C00080F9FE008F6130000000000000000000000000000000
      000000000000000000008F61300080F9FE0080F9FE0080F9FE0080F9FE0080F9
      FE0080F9FE0080F9FE0077500E00000000000000000000000000000000000000
      000000000000000000008F61300080F9FE001260C0001260C0001260C0001260
      C0001260C00080F9FE008F61300000000000000000008F61300080F9FE0080F9
      FE0080F9FE0080F9FE008F613000FFD48B00FFD48B008F61300080F9FE0080F9
      FE0080F9FE0080F9FE008F613000000000008F61300080F9FE001260C0001260
      C0001260C00080F9FE008F61300000000000000000008F61300080F9FE0080F9
      FE0080F9FE0080F9FE0080F9FE008F6130000000000000000000000000000000
      000000000000000000008F61300080F9FE0080F9FE0080F9FE0080F9FE0080F9
      FE0080F9FE0080F9FE0077500E00000000000000000000000000000000000000
      000083581F00000000008F61300080F9FE0080F9FE0080F9FE0080F9FE0080F9
      FE0080F9FE0080F9FE008F61300000000000000000008F61300080F9FE001260
      C0001260C0008F613000FFD48B00FFD48B00FFD48B00FFD48B008F6130001260
      C0001260C00080F9FE008F613000000000008F61300080F9FE0080F9FE0080F9
      FE0080F9FE0080F9FE008F6130008F6130008F6130008F61300080F9FE001260
      C0001260C0001260C00080F9FE008F6130000000000000000000000000000000
      000083581F00000000008F6130008B5E2A008C5F2C008D602D0083581F008358
      1F0083581F007B53140077500E00000000000000000000000000000000008B5E
      2A00875C2500000000000000000080F9FE001260C0001260C0001260C0001260
      C0001260C00080F9FE008F61300000000000000000008F61300080F9FE0080F9
      FE008F613000FFD48B00FFD48B00FFD48B00FFD48B00FFD48B00FFD48B008F61
      300080F9FE0080F9FE008F613000000000008F61300080F9FE001260C0001260
      C0001260C00080F9FE008F61300000000000000000008F61300080F9FE0080F9
      FE0080F9FE0080F9FE0080F9FE008F6130000000000000000000000000008B5E
      2A00875C2500000000000000000000000000000000008F61300080F9FE0080F9
      FE0080F9FE0080F9FE0077500E000000000000000000000000008F6130008F61
      30008F6130008F6130008F61300080F9FE0080F9FE0080F9FE0080F9FE0080F9
      FE0080F9FE0080F9FE008F61300000000000000000008F61300080F9FE001260
      C0008F6130008F6130008F613000FFD48B00FFD48B008F6130008F6130008F61
      30001260C00080F9FE008F613000000000008F61300080F9FE0080F9FE0080F9
      FE0080F9FE0080F9FE008F61300000000000000000008F61300080F9FE001260
      C0001260C0001260C00080F9FE008F61300000000000000000008F61300080F9
      FE008F6130008F6130008F6130008F613000000000008F61300080F9FE0080F9
      FE0080F9FE0080F9FE0077500E0000000000000000008F6130008F6130008F61
      30008F6130008F6130008F61300080F9FE001260C0001260C0001260C0001260
      C0001260C00080F9FE008F61300000000000000000008F61300080F9FE0080F9
      FE0080F9FE0080F9FE008F613000FFD48B00FFD48B008F61300080F9FE0080F9
      FE0080F9FE0080F9FE008F613000000000008F61300080F9FE001260C0001260
      C0001260C00080F9FE008F61300000000000000000008F61300080F9FE0080F9
      FE0080F9FE0080F9FE0080F9FE008F613000000000008F61300080F9FE0080F9
      FE0080F9FE0080F9FE0080F9FE008F613000000000008F613000845920008459
      2000845920007D54160077500E000000000000000000000000008F6130008F61
      30008F6130008F6130008F61300080F9FE0080F9FE0080F9FE0080F9FE0080F9
      FE0080F9FE0080F9FE008F61300000000000000000008F61300080F9FE001260
      C0001260C0001260C0008F613000FFD48B00FFD48B008F6130001260C0001260
      C0001260C00080F9FE008F613000000000008F61300080F9FE0080F9FE0080F9
      FE0080F9FE0080F9FE008F61300000000000000000008F61300080F9FE001260
      C0001260C0001260C00080F9FE008F61300000000000000000008F61300080F9
      FE008F6130008F6130008F6130008F613000000000008F61300080F9FE0080F9
      FE0080F9FE0080F9FE0077500E00000000000000000000000000000000008F61
      30008F613000000000000000000080F9FE001260C0001260C0001260C0001260
      C0001260C00080F9FE008F61300000000000000000008F61300080F9FE0080F9
      FE0080F9FE0080F9FE008F613000FFD48B00FFD48B008F61300080F9FE0080F9
      FE0080F9FE0080F9FE008F613000000000008F61300080F9FE001260C0001260
      C0001260C00080F9FE008F6130008F6130008F6130008F61300080F9FE0080F9
      FE0080F9FE0080F9FE0080F9FE008F6130000000000000000000000000008F61
      30008F613000000000000000000000000000000000008F61300080F9FE0080F9
      FE0080F9FE0080F9FE0077500E00000000000000000000000000000000000000
      00008F613000000000008F61300080F9FE0080F9FE0080F9FE0080F9FE0080F9
      FE0080F9FE0080F9FE008F61300000000000000000008F61300080F9FE001260
      C0001260C0001260C0008F613000FFD48B00FFD48B008F6130001260C0001260
      C0001260C00080F9FE008F613000000000008F61300080F9FE0080F9FE0080F9
      FE0080F9FE0080F9FE008F61300000000000000000008F61300080F9FE001260
      C0001260C0001260C00080F9FE008F6130000000000000000000000000000000
      00008F613000000000008F6130008F6130008F6130008F6130008F6130008F61
      30008F61300080561B0077500E00000000000000000000000000000000000000
      000000000000000000008F61300080F9FE001260C0001260C0001260C0001260
      C0001260C00080F9FE008F61300000000000000000008F61300080F9FE0080F9
      FE0080F9FE0080F9FE008F6130008F6130008F6130008F61300080F9FE0080F9
      FE0080F9FE0080F9FE008F613000000000008F61300080F9FE001260C0001260
      C0001260C00080F9FE008F61300000000000000000008F61300080F9FE0080F9
      FE0080F9FE0080F9FE0080F9FE008F6130000000000000000000000000000000
      000000000000000000008F613000FF56C400FF56C400FF56C400FF56C400FF56
      C400FF56C400FF56C40077500E00000000000000000000000000000000000000
      000000000000000000008F61300080F9FE0080F9FE0080F9FE0080F9FE0080F9
      FE0080F9FE0080F9FE008F61300000000000000000008F61300080F9FE0080F9
      FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9
      FE0080F9FE0080F9FE008F613000000000008F61300080F9FE0080F9FE0080F9
      FE0080F9FE0080F9FE008F61300000000000000000008F6130008F6130008F61
      30008F6130008F6130008F6130008F6130000000000000000000000000000000
      000000000000000000008F613000FF56C400FF56C400FF56C400FF56C400FF56
      C400FF56C400FF56C40077500E00000000000000000000000000000000000000
      000000000000000000008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F6130008F61300000000000000000008F6130008F6130008F61
      30008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F6130008F613000000000008F6130008F6130008F6130008F61
      30008F6130008F6130008F613000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F61300077500E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000895D2700895D2700895D2700895D
      2700895D2700895D2700895D2700000000000000000000000000000000000000
      000000000000000000000000000000000000895D2700895D2700895D2700895D
      2700895D2700895D2700895D2700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008F6130008F61
      30008F6130008F6130000000000000000000895D270080F9FE0080F9FE0080F9
      FE0080F9FE0080F9FE00895D27000000000000000000000000008F6130008F61
      30008F6130008F6130000000000000000000895D270080F9FE0080F9FE0080F9
      FE0080F9FE0080F9FE00895D2700000000000000000000000000000000000000
      000000000000000000008F613000CB9D6C00CB9D6C007F512000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C99B6A000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008F613000CB9D
      6C00CB9D6C008F6130000000000000000000895D270080F9FE006A9355006A93
      55006A93550080F9FE00895D27000000000000000000000000008F613000CB9D
      6C00CB9D6C008F6130000000000000000000895D270080F9FE006A9355006A93
      55006A93550080F9FE00895D2700000000000000000000000000000000000000
      000000000000000000008F613000CB9D6C00C395640073451400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C99B6A000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008F613000CB9D
      6C008F6130008F613000CB9D6C006DF1FF00895D270080F9FE0080F9FE0080F9
      FE0080F9FE0080F9FE00895D27000000000000000000000000008F613000CB9D
      6C008F6130008F613000CB9D6C006DF1FF00895D270080F9FE0080F9FE0080F9
      FE0080F9FE0080F9FE00895D2700000000000000000000000000000000000000
      000000000000000000008F613000CB9D6C00B688570071431200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C99B6A00C99B6A00C99B6A00C0926100BA8D5A00000000000000
      00000000000000000000000000000000000000000000000000008F613000CB9D
      6C008F6130006DF1FF006DF1FF006DF1FF00895D270080F9FE0080F9FE0080F9
      FE006A93550080F9FE00895D27000000000000000000000000008F613000CB9D
      6C008F6130006DF1FF006DF1FF006DF1FF00895D270080F9FE0080F9FE0080F9
      FE006A93550080F9FE00895D2700000000000000000000000000000000000000
      000000000000000000008F613000CB9D6C00BD915F00794B1A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C89A69000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008F613000CB9D
      6C008F6130006DF1FF006DF1FF006DF1FF00895D270080F9FE0080F9FE0080F9
      FE0080F9FE0080F9FE00895D27000000000000000000000000008F613000CB9D
      6C008F6130006DF1FF006DF1FF006DF1FF00895D270080F9FE0080F9FE0080F9
      FE0080F9FE0080F9FE00895D2700000000000000000000000000000000000000
      0000000000008F6130008F6130008F6130008F61300084562500815322000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C69867000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008F613000CB9D
      6C008F6130006DF1FF006DF1FF008F613000895D270080F9FE0080F9FE006A93
      55006A93550080F9FE00895D27000000000000000000000000008F613000CB9D
      6C008F6130006DF1FF006DF1FF008F613000895D270080F9FE0080F9FE006A93
      55006A93550080F9FE00895D2700000000000000000000000000000000000000
      00008F6130008F61300041A7FF0041A7FF0041A7FF0041A7FF00875928008355
      2400000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C89A6900C0926100BA8D5A0000000000000000000000
      00000000000000000000000000000000000000000000000000008F613000CB9D
      6C008F6130006DF1FF006DF1FF008F613000895D270080F9FE0080F9FE0080F9
      FE0080F9FE0080F9FE00895D27000000000000000000000000008F613000CB9D
      6C008F6130006DF1FF006DF1FF008F613000895D270080F9FE0080F9FE0080F9
      FE0080F9FE0080F9FE00895D2700000000000000000000000000000000008F61
      30008F61300041A7FF0041A7FF0041A7FF0041A7FF0041A7FF0041A7FF007F51
      2000774918000000000000000000000000000000000000000000000000000000
      000000000000C99B6A00000000000000000000000000C0926100000000000000
      00000000000000000000000000000000000000000000000000008F613000CB9D
      6C008F6130006DF1FF006DF1FF006DF1FF00895D270080F9FE006A9355006A93
      55006A93550080F9FE00895D27000000000000000000000000008F613000CB9D
      6C008F6130006DF1FF006DF1FF006DF1FF00895D270080F9FE006A9355006A93
      55006A93550080F9FE00895D2700000000000000000000000000000000008F61
      300041A7FF0041A7FF0041A7FF0041A7FF0041A7FF0041A7FF0041A7FF0041A7
      FF006E400F000000000000000000000000000000000000000000000000000000
      0000C99B6A000000000000000000000000000000000000000000C49665000000
      00000000000000000000000000000000000000000000000000008F613000CB9D
      6C008F6130008F6130008F6130008F613000895D270080F9FE0080F9FE0080F9
      FE0080F9FE0080F9FE00895D27000000000000000000000000008F613000CB9D
      6C008F6130008F6130008F6130008F613000895D270080F9FE0080F9FE0080F9
      FE0080F9FE0080F9FE00895D2700000000000000000000000000000000008F61
      300041A7FF0041A7FF0041A7FF0041A7FF0041A7FF0041A7FF0041A7FF0041A7
      FF00673908000000000000000000000000000000000000000000000000000000
      0000C99B6A000000000000000000000000000000000000000000C39564000000
      00000000000000000000000000000000000000000000000000008F613000CB9D
      6C00C6986700B4865500B4865500B4865500895D2700895D2700895D2700895D
      2700895D2700895D2700895D27000000000000000000000000008F613000CB9D
      6C00C6986700B4865500B4865500B4865500895D2700895D2700895D2700895D
      2700895D2700895D2700895D2700000000000000000000000000000000008F61
      300041A7FF0041A7FF0041A7FF0041A7FF0041A7FF0041A7FF0041A7FF0041A7
      FF00653706000000000000000000000000000000000000000000000000000000
      0000C99B6A000000000000000000000000000000000000000000C09261000000
      00000000000000000000000000000000000000000000000000008F613000B688
      570095673600855726008557260085572600855726008557260085572600784A
      19006537060065370600000000000000000000000000000000008F613000B688
      570095673600855726008557260085572600855726008557260085572600784A
      1900653706006537060000000000000000000000000000000000000000008F61
      30008E602F0041A7FF0041A7FF0041A7FF0041A7FF0041A7FF0041A7FF006537
      0600653706000000000000000000000000000000000000000000000000000000
      000000000000C99B6A00000000000000000000000000C3956400000000000000
      0000000000000000000000000000000000000000000000000000845625007345
      1400673908006537060065370600653706006537060065370600653706006537
      0600653706006537060000000000000000000000000000000000845625007345
      1400673908006537060065370600653706006537060065370600653706006537
      0600653706006537060000000000000000000000000000000000000000000000
      00008254230041A7FF0041A7FF0041A7FF0041A7FF0041A7FF0041A7FF006537
      0600000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C4966500C3956400C092610000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000072441300693B0A00653706006537060065370600653706000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF56
      C4000000000000000000FF56C400FF56C400FF56C400FF56C400000000000000
      0000FF56C4000000000000000000000000000000000077500E0077500E007750
      0E000000000077500E0077500E0077500E0077500E0077500E0077500E007750
      0E0077500E00000000000000000000000000000000000000000077500E007750
      0E0077500E0077500E0077500E0077500E0077500E0077500E00000000007750
      0E0077500E000000000000000000000000000000000077500E0077500E007750
      0E000000000077500E0077500E0077500E0077500E0077500E00000000007750
      0E0077500E000000000000000000000000000000000000000000FF56C400FF56
      C400000000000000000000000000000000000000000000000000000000000000
      0000FF56C400FF56C4000000000000000000000000000000000077500E007750
      0E000000000077500E0077500E000000000077500E0077500E006DF1FF006DF1
      FF0077500E0077500E0000000000000000000000000077500E0077500E006DF1
      FF006DF1FF0077500E0077500E000000000077500E0077500E0077500E006DF1
      FF0077500E0077500E000000000000000000000000000000000077500E007750
      0E000000000077500E0077500E000000000077500E0077500E0077500E006DF1
      FF0077500E0077500E0000000000000000000000000000000000FF56C4000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF56C4000000000000000000000000000000000077500E007750
      0E0077500E0077500E0077500E000000000077500E0077500E006DF1FF006DF1
      FF0077500E0077500E0000000000000000000000000077500E0077500E006DF1
      FF006DF1FF0077500E0077500E000000000077500E0077500E006DF1FF006DF1
      FF0077500E0077500E000000000000000000000000000000000077500E007750
      0E0077500E0077500E0077500E000000000077500E0077500E006DF1FF006DF1
      FF0077500E0077500E0000000000000000000000000000000000FF56C4000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF56C4000000000000000000000000000000000077500E007750
      0E006DF1FF0077500E0077500E000000000077500E0077500E006DF1FF006DF1
      FF0077500E0077500E000000000000000000000000000000000077500E007750
      0E0077500E0077500E0077500E000000000077500E0077500E006DF1FF006DF1
      FF0077500E0077500E000000000000000000000000000000000077500E007750
      0E006DF1FF0077500E0077500E000000000077500E0077500E006DF1FF006DF1
      FF0077500E0077500E0000000000000000000000000000000000FF56C4000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF56C4000000000000000000000000000000000077500E007750
      0E006DF1FF0077500E0077500E000000000077500E0077500E0077500E007750
      0E0077500E000000000000000000000000000000000000000000000000000000
      00000000000077500E0077500E000000000077500E0077500E0077500E006DF1
      FF0077500E0077500E000000000000000000000000000000000077500E007750
      0E006DF1FF0077500E0077500E000000000077500E0077500E0077500E006DF1
      FF0077500E0077500E0000000000000000000000000000000000FF56C4000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF56C40000000000000000000000000000000000000000007750
      0E006DF1FF0077500E00000000000000000077500E0077500E006DF1FF006DF1
      FF0077500E0077500E000000000000000000000000000000000077500E007750
      0E0077500E0077500E00000000000000000077500E0077500E00000000007750
      0E0077500E000000000000000000000000000000000000000000000000007750
      0E006DF1FF0077500E00000000000000000077500E0077500E00000000007750
      0E0077500E000000000000000000000000000000000000000000FF56C4000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF56C40000000000000000000000000000000000000000007750
      0E0077500E0077500E00000000000000000077500E0077500E006DF1FF006DF1
      FF0077500E0077500E0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000077500E0077500E00000000000000
      0000000000000000000000000000000000000000000000000000000000007750
      0E0077500E0077500E00000000000000000077500E0077500E00000000000000
      0000000000000000000000000000000000000000000000000000FF56C4000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF56C40000000000000000000000000077500E0077500E007750
      0E0077500E0077500E000000000077500E0077500E0077500E0077500E007750
      0E0077500E000000000000000000000000000000000000000000000000000000
      000000000000000000000000000077500E0077500E0077500E00000000000000
      0000000000000000000000000000000000000000000077500E0077500E007750
      0E0077500E0077500E000000000077500E0077500E0077500E00000000000000
      0000000000000000000000000000000000000000000000000000FF56C400FF56
      C400000000000000000000000000000000000000000000000000000000000000
      0000FF56C400FF56C40000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF56
      C400000000000000000000000000000000000000000000000000000000000000
      0000FF56C4000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000645131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000073531900645131000000
      0000000000000000000000000000000000000000000077500E0077500E007750
      0E007D5418007D5418007D5418008D602D008D602D008F613000000000000000
      0000000000000000000000000000000000000000000077500E0077500E007750
      0E0077500E0077500E0077500E008B5E2A008B5E2A008B5E2A00000000000000
      0000000000000000000000000000000000000000000091633200C99B6A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000082581D009D713B000000
      00000000000000000000000000000000000077500E0077500E001260C000554F
      4E00275D9A001260C0000064DF00000000000000000077500E0061C5890061C5
      890061C5890061C5890061C5890061C5890061C589008D602D00000000000000
      0000000000000000000000000000000000000000000077500E00ECECEC00ECEC
      EC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC008F613000000000000000
      00000000000000000000000000000000000000000000FCD5AC0091633200C99B
      6A00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D5AC7B00865B2300AE82
      4C0000000000000000000000000000000000554F4E001260C0001260C0001260
      C0000064DF000064DF000064DF00000000000000000077500E0061C5890061C5
      890061C5890061C5890061C5890061C5890061C589008F613000000000000000
      0000000000000000000000000000000000000000000077500E00ECECEC00ECEC
      EC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC008F613000000000000000
      0000000000000000000000000000000000000000000000000000FCD5AC008E60
      2F00C79968000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000ECC49B008A5E
      2900AE824C00000000000000000000000000000000001260C0001260C0000000
      0000000000000000000000000000000000000000000077500E007B5314008358
      1F008A5E29008F6130008F6130008C5F2C008D602D008F613000000000008358
      1F00000000000000000000000000000000000000000077500E007B5314008358
      1F0083581F0083581F008D602D008C5F2C008B5E2A008F613000000000008358
      1F0000000000000000000000000000000000000000000000000000000000ECC4
      9B00916332000000000091633200916332009163320091633200916332000000
      000000000000000000000000000000000000000000000000000000000000E1B7
      89008A5E290000000000865B2300875B2400895D2700895D27001260C0000000
      0000000000000000000000000000000000000000000077500E003F92B0003F92
      B0003F92B0003F92B0008F61300000000000000000000000000000000000875C
      25008B5E2A000000000000000000000000000000000077500E00ECECEC00ECEC
      EC00ECECEC00ECECEC008F61300000000000000000000000000000000000875C
      25008B5E2A000000000000000000000000000000000000000000000000000000
      00000000000091633200C3956400AB7D4C00B0825100C7996800C99B6A008F61
      3000000000000000000000000000000000000000000000000000000000000000
      0000000000008D602D00C99B6A00C99B6A00C99B6A00C99B6A00C99B6A009163
      3200000000000000000000000000000000000000000077500E003F92B0003F92
      B0003F92B0003F92B0008F613000000000008F6130008F6130008F6130008F61
      300080F9FE008F61300000000000000000000000000077500E00ECECEC00ECEC
      EC00ECECEC00ECECEC008F613000000000008F6130008F6130008F6130008F61
      300080F9FE008F61300000000000000000000000000000000000000000000000
      000091633200C0926100805221006DF1FF006DF1FF006DF1FF00C0926100C092
      61007F5120000000000000000000000000000000000000000000000000000000
      0000875B2400C99B6A00C99B6A006DF1FF006DF1FF006DF1FF00C99B6A00C99B
      6A00916332000000000000000000000000000000000077500E007D5418008459
      20008F6130008F6130008F613000000000008F61300080F9FE0080F9FE0080F9
      FE0080F9FE0080F9FE008F613000000000000000000077500E007D5416008459
      200084592000845920008F613000000000008F61300080F9FE0080F9FE0080F9
      FE0080F9FE0080F9FE008F613000000000000000000000000000000000000000
      000091633200AB7D4C006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF00C89A
      69007B4D1C000000000000000000000000000000000000000000000000000000
      0000865B2300C99B6A006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF00C99B
      6A00916332000000000000000000000000000000000078510F001E5FDA001E5F
      DA001E5FDA001E5FDA008F613000000000008F6130008F6130008F6130008F61
      300080F9FE008F61300000000000000000000000000077500E00ECECEC00ECEC
      EC00ECECEC00ECECEC008F613000000000008F6130008F6130008F6130008F61
      300080F9FE008F61300000000000000000000000000000000000000000000000
      000091633200B48655006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF00C99B
      6A00794B1A000000000000000000000000000000000000000000000000000000
      0000865B2300C99B6A006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF00C99B
      6A009163320000000000000000000000000000000000795111001E5FDA001E5F
      DA001E5FDA001E5FDA008F613000000000000000000000000000000000008F61
      30008F6130000000000000000000000000000000000077500E00ECECEC00ECEC
      EC00ECECEC00ECECEC008F613000000000000000000000000000000000008F61
      30008F6130000000000000000000000000000000000000000000000000000000
      000091633200C99B6A006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF00C99B
      6A00734514000000000000000000000000000000000000000000000000000000
      0000865B2300C69867006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF00C99B
      6A0091633200000000000000000000000000000000007D54160081571C00875C
      25008F6130008F6130008F6130008F6130008F6130008F613000000000008F61
      3000000000000000000000000000000000000000000077500E0080561B008F61
      30008F6130008F6130008F6130008F6130008F6130008F613000000000008F61
      3000000000000000000000000000000000000000000000000000000000000000
      000091633200C99B6A00C89A69006DF1FF006DF1FF006DF1FF00C99B6A00AD7F
      4E00693B0A000000000000000000000000000000000000000000000000000000
      0000895D2700C2946300C89A69006DF1FF006DF1FF006DF1FF00BD915F00C99B
      6A009163320000000000000000000000000000000000855A21000D45EF000D45
      EF000D45EF000D45EF000D45EF000D45EF000D45EF008F613000000000000000
      0000000000000000000000000000000000000000000077500E00ECECEC00ECEC
      EC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC008F613000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008A5C2B00BB8D5C00C99B6A00C99B6A00C99B6A00AB7D4C006B3D
      0C00000000000000000000000000000000000000000000000000000000000000
      00000000000090623100C99B6A00C99B6A00C99B6A00C99B6A00C99B6A009163
      320000000000000000000000000000000000000000008C5F2C000D45EF000D45
      EF000D45EF000D45EF000D45EF000D45EF000D45EF008F613000000000000000
      0000000000000000000000000000000000000000000077500E00ECECEC00ECEC
      EC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC008F613000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007A4C1B00774918007648170070421100673908000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000091633200916332009163320091633200916332000000
      000000000000000000000000000000000000000000008F6130008F6130008F61
      30008F6130008F6130008F6130008F6130008F6130008F613000000000000000
      0000000000000000000000000000000000000000000077500E008F6130008F61
      30008F6130008F6130008F6130008F6130008F6130008F613000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000077500E0077500E007750
      0E007D5418008B5E2A008B5E2A008B5E2A008B5E2A008B5E2A008B5E2A008B5E
      2A008B5E2A008B5E2A008B5E2A00000000000000000077500E0077500E007750
      0E007D5418008D602D008D602D008D602D008D602D008D602D008D602D008D60
      2D008D602D008D602D008D602D00000000000000000077500E0077500E007750
      0E007D5418008B5E2A008B5E2A008B5E2A008B5E2A008B5E2A008B5E2A008B5E
      2A008B5E2A008B5E2A008B5E2A00000000000000000077500E0077500E007750
      0E007D5418008D602D008D602D008D602D008D602D008D602D008D602D008D60
      2D008D602D008D602D008D602D00000000000000000077500E00FFD48B00FFD4
      8B00FFD48B00FFD48B00FFD48B00FFD48B00FFD48B00FFD48B00FFD48B00FFD4
      8B00FFD48B00FFD48B008B5E2A00000000000000000077500E00FF56C400FF56
      C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56
      C400FF56C400FF56C4008D602D00000000000000000077500E00ECECEC00ECEC
      EC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC008B5E2A00000000000000000077500E000D45EF000D45
      EF000D45EF000D45EF000D45EF000D45EF000D45EF000D45EF000D45EF000D45
      EF000D45EF000D45EF008D602D00000000000000000077500E00FFD48B00FFD4
      8B00FFD48B00FFD48B00FFD48B00FFD48B00FFD48B00FFD48B00FFD48B00FFD4
      8B00FFD48B00FFD48B008B5E2A00000000000000000077500E00FF56C400FF56
      C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56
      C400FF56C400FF56C4008D602D00000000000000000077500E00ECECEC00ECEC
      EC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC008B5E2A00000000000000000077500E000D45EF000D45
      EF000D45EF000D45EF000D45EF000D45EF000D45EF000D45EF000D45EF000D45
      EF000D45EF000D45EF008D602D00000000000000000077500E007B5314008358
      1F008A5E29008D602D008C5F2C008B5E2A008B5E2A008B5E2A008B5E2A008B5E
      2A008B5E2A008B5E2A008B5E2A00000000000000000077500E007B5314008358
      1F008A5E29008D602D008C5F2C008D602D008D602D008D602D008D602D008D60
      2D008D602D008D602D008D602D00000000000000000077500E007B5314008358
      1F008A5E29008D602D008C5F2C008B5E2A008B5E2A008B5E2A008B5E2A008B5E
      2A008B5E2A008B5E2A008B5E2A00000000000000000077500E007B5314008358
      1F008A5E29008D602D008C5F2C008D602D008D602D008D602D008D602D008D60
      2D008D602D008D602D008D602D00000000000000000077500E00FFD48B00FFD4
      8B00FFD48B00FFD48B00FFD48B00FFD48B00FFD48B00FFD48B00FFD48B00FFD4
      8B00FFD48B00FFD48B008B5E2A00000000000000000077500E00FF56C400FF56
      C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56
      C400FF56C400FF56C4008D602D00000000000000000077500E00ECECEC00ECEC
      EC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC008B5E2A00000000000000000077500E000D45EF000D45
      EF000D45EF000D45EF000D45EF000D45EF000D45EF000D45EF000D45EF000D45
      EF000D45EF000D45EF008D602D00000000000000000077500E00FFD48B00FFD4
      8B00FFD48B00FFD48B00FFD48B00FFD48B00FFD48B00FFD48B00FFD48B00FFD4
      8B00FFD48B00FFD48B008B5E2A00000000000000000077500E00FF56C400FF56
      C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56
      C400FF56C400FF56C4008D602D00000000000000000077500E00ECECEC00ECEC
      EC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC008B5E2A00000000000000000077500E000D45EF000D45
      EF000D45EF000D45EF000D45EF000D45EF000D45EF000D45EF000D45EF000D45
      EF000D45EF000D45EF008D602D00000000000000000077500E007D5416008459
      20008C5F2C008F6130008D602E008A5D2900845920007F5619007E5518007F56
      1A008B5E2A008B5E2A008B5E2A00000000000000000077500E007D5418008459
      20008C5F2C008F6130008D602E008A5D2900845920007F5619007E5518007F56
      1A00845920008D602D008D602D00000000000000000077500E007D5416008459
      20008C5F2C008F6130008D602E008A5D2900845920007F5619007E5518007F56
      1A008B5E2A008B5E2A008B5E2A00000000000000000077500E007D5418008459
      20008C5F2C008F6130008D602E008A5D2900845920007F5619007E5518007F56
      1A00845920008D602D008D602D00000000000000000077500E00FFD48B00FFD4
      8B00FFD48B00FFD48B00FFD48B00FFD48B00FFD48B00FFD48B00FFD48B00FFD4
      8B00FFD48B00FFD48B008B5E2A00000000000000000077500E00FF56C400FF56
      C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56
      C400FF56C400FF56C4008D602D00000000000000000077500E00ECECEC00ECEC
      EC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC008B5E2A00000000000000000077500E000D45EF000D45
      EF000D45EF000D45EF000D45EF000D45EF000D45EF000D45EF000D45EF000D45
      EF000D45EF000D45EF008D602D00000000000000000077500E00FFD48B00FFD4
      8B00FFD48B00FFD48B00FFD48B00FFD48B00FFD48B00FFD48B00FFD48B00FFD4
      8B00FFD48B00FFD48B008B5E2A00000000000000000077500E00FF56C400FF56
      C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56
      C400FF56C400FF56C4008D602D00000000000000000077500E00ECECEC00ECEC
      EC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC008B5E2A00000000000000000077500E000D45EF000D45
      EF000D45EF000D45EF000D45EF000D45EF000D45EF000D45EF000D45EF000D45
      EF000D45EF000D45EF008D602D00000000000000000077500E0080561B00875C
      25008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F6130008B5E2A00000000000000000077500E0081571C00875C
      25008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F6130008D602D00000000000000000077500E0080561B00875C
      25008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F6130008B5E2A00000000000000000077500E0081571C00875C
      25008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F6130008D602D00000000000000000077500E00FFD48B00FFD4
      8B00FFD48B00FFD48B00FFD48B00FFD48B00FFD48B00FFD48B00FFD48B00FFD4
      8B00FFD48B00FFD48B008F613000000000000000000077500E00FF56C400FF56
      C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56
      C400FF56C400FF56C4008F613000000000000000000077500E00ECECEC00ECEC
      EC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC008F613000000000000000000077500E000D45EF000D45
      EF000D45EF000D45EF000D45EF000D45EF000D45EF000D45EF000D45EF000D45
      EF000D45EF000D45EF008F613000000000000000000077500E00FFD48B00FFD4
      8B00FFD48B00FFD48B00FFD48B00FFD48B00FFD48B00FFD48B00FFD48B00FFD4
      8B00FFD48B00FFD48B008F613000000000000000000077500E00FF56C400FF56
      C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56
      C400FF56C400FF56C4008F613000000000000000000077500E00ECECEC00ECEC
      EC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC008F613000000000000000000077500E000D45EF000D45
      EF000D45EF000D45EF000D45EF000D45EF000D45EF000D45EF000D45EF000D45
      EF000D45EF000D45EF008F613000000000000000000077500E008F6130008F61
      30008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F6130008F613000000000000000000077500E008F6130008F61
      30008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F6130008F613000000000000000000077500E008F6130008F61
      30008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F6130008F613000000000000000000077500E008F6130008F61
      30008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F6130008F613000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008F613000CB9D6C00CB9D6C007F512000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007F5619009D713B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008F6130008F6130008F61
      30008F6130000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008F613000CB9D6C00C395640073451400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BB8D5C00865B2300AE824C000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008F613000CB9D6C00CB9D
      6C008F6130000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008F613000CB9D6C00B688570071431200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008F6130008F613000000000000000
      00000000000000000000000000000000000000000000E1B789008A5E2900B085
      4E00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008F613000CB9D6C008F61
      30008F6130008F6130008F6130008F6130000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008F613000CB9D6C00BD915F00794B1A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008F61300000F3FD008F6130000000
      0000000000000000000000000000000000000000000000000000E1B789008A5E
      290000000000855A2200855A21008459200084592000865B2300000000000000
      000000000000000000000000000000000000000000008F613000CB9D6C008F61
      30006DF1FF006DF1FF006DF1FF008F613000000000008F613000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008F6130008F6130008F6130008F61300084562500815322000000
      0000000000000000000000000000000000000000000000000000000000008F61
      30008F6130008F6130008F6130008F6130008F61300000F3FD0000F3FD008F61
      3000000000000000000000000000000000000000000000000000000000000000
      00008D602D00C99B6A00C99B6A00C99B6A00C6986700BD915F008E612D000000
      000000000000000000000000000000000000000000008F613000CB9D6C008F61
      30006DF1FF006DF1FF006DF1FF008F613000000000008F6130008F6130000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008F6130008F6130006DF1FF006DF1FF006DF1FF006DF1FF00875928008355
      2400000000000000000000000000000000000000000000000000000000008F61
      300000F3FD0000F3FD0000F3FD0000F3FD0000F3FD0000F3FD0000F3FD0000F3
      FD008F613000000000000000000000000000000000000000000000000000875B
      2400C99B6A00C99B6A00000000000000000000000000C99B6A00C99B6A009163
      320000000000000000000000000000000000000000008F613000CB9D6C008F61
      30006DF1FF006DF1FF00885A2900895B2A008F6130008F613000815322007648
      1700000000000000000000000000000000000000000000000000000000008F61
      30008F6130006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF007F51
      2000774918000000000000000000000000000000000000000000000000008F61
      300000F3FD0000F3FD0000F3FD0000F3FD0000F3FD0000F3FD0000F3FD0000F3
      FD008F613000000000000000000000000000000000000000000000000000865B
      2300C99B6A000000000000000000000000000000000000000000C99B6A009163
      320000000000000000000000000000000000000000008F613000CB9D6C008F61
      30006DF1FF006DF1FF00845625007E501F007C4E1D00774918006A3C0B006537
      0600000000000000000000000000000000000000000000000000000000008F61
      30006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1
      FF006E400F000000000000000000000000000000000000000000000000008F61
      30008F6130008F6130008F6130008F6130008F61300000F3FD0000F3FD008F61
      300000000000000000000000000000000000000000000000000000000000865B
      2300C99B6A000000000000000000000000000000000000000000C99B6A009163
      320000000000000000000000000000000000000000008F613000CB9D6C008F61
      30006DF1FF006DF1FF006DF1FF00714312000000000065370600653706000000
      0000000000000000000000000000000000000000000000000000000000008F61
      30006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1
      FF00673908000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008F61300000F3FD008F6130000000
      000000000000000000000000000000000000000000000000000000000000865B
      2300C69867000000000000000000000000000000000000000000C99B6A009163
      320000000000000000000000000000000000000000008F613000CB9D6C008F61
      30008F61300087592800794B1A00693B0A000000000065370600000000000000
      0000000000000000000000000000000000000000000000000000000000008F61
      30006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1
      FF00653706000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008F6130008F613000000000000000
      000000000000000000000000000000000000000000000000000000000000895D
      2700C2946300C89A6900000000000000000000000000BD915F00C99B6A009163
      320000000000000000000000000000000000000000008F613000CB9D6C00C698
      6700B4865500A173420080522100653706000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008F61
      30008E602F0088EBFF0088EBFF006DF1FF006DF1FF006DF1FF006DF1FF006537
      0600653706000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000090623100C99B6A00C99B6A00C99B6A00C99B6A00C99B6A00916332000000
      000000000000000000000000000000000000000000008F613000B68857009567
      360085572600784A190065370600653706000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008254230088EBFF0088EBFF0088EBFF006DF1FF006DF1FF006DF1FF006537
      0600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009163320091633200916332009163320091633200000000000000
      0000000000000000000000000000000000000000000084562500734514006739
      0800653706006537060065370600653706000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000072441300693B0A00653706006537060065370600653706000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000077500E005238050000000000000000000000
      000000000000000000000000000000000000000000008F6130008F6130008F61
      30008F6130008D5F2E0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000077500E0077500E007750
      0E007D541800845920008D602D008D602D008D602D008D602D008F6130008D60
      2D008D602D008D602D008D602D00000000000000000000000000000000000000
      000000000000000000008F6130008F6130008F6130008F613000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000077500E007C5413009D713B008B5E2A00000000000000
      000000000000000000000000000000000000000000008F61300061C5890061C5
      890061C589008456250000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000077500E0061C5890061C5
      890061C5890061C5890061C5890061C5890061C5890061C589008F61300061C5
      89008F61300061C589008D602D00000000000000000000000000000000000000
      00008F6130008F61300080F9FE0080F9FE0080F9FE0080F9FE008F6130008F61
      3000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000077500E00845C1D00AB7F49008F613000000000000000
      000000000000000000000000000000000000000000008F61300061C5890061C5
      89005BBD82008355240000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000077500E0061C5890061C5
      890061C5890061C5890061C5890061C5890061C5890061C589008F61300061C5
      890061C5890061C589008D602D00000000000000000000000000000000008F61
      300080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9
      FE00815322000000000000000000000000000000000000000000000000000000
      0000000000000000000077500E008F662900B98B5A008F613000000000000000
      000000000000000000000000000000000000000000008F6130008F6130008F61
      30008C5F2C008759280082542300805221000000000000000000000000000000
      0000000000000000000000000000000000000000000077500E007B5314008358
      1F008A5E29008D602D008C5F2C008D602D008D602D008D602D008F6130008D60
      2D008D602D008D602D008D602D00000000000000000000000000000000008F61
      300080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9
      FE007C4E1D000000000000000000000000000000000000000000000000000000
      0000000000000000000077500E009D713B00BD915F008F613000000000000000
      000000000000000000000000000000000000000000008F61300061C5890061C5
      890061C589006DF1FF006DF1FF00805221000000000000000000000000000000
      0000000000000000000000000000000000000000000077500E003F92B0003F92
      B0003F92B0003F92B0003F92B0003F92B0003F92B0003F92B0008F6130003F92
      B0008F6130003F92B0008D602D000000000000000000000000008F61300080F9
      FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9
      FE0080F9FE007244130000000000000000000000000000000000000000000000
      00000000000077500E0077500E0082581D008B5E2A008F6130008E602F000000
      000000000000000000000000000000000000000000008F61300061C5890061C5
      890061C589006DF1FF006DF1FF00865827000000000000000000000000000000
      0000000000000000000000000000000000000000000077500E003F92B0003F92
      B0003F92B0003F92B0003F92B0003F92B0003F92B0003F92B0008F6130003F92
      B0003F92B0003F92B0008D602D000000000000000000000000008F61300080F9
      FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9
      FE0080F9FE006A3C0B0000000000000000000000000000000000000000000000
      000077500E0077500E00000000000000000000000000000000008D602E008D60
      2D0000000000000000000000000000000000000000008F6130008F6130008F61
      30008F6130008E602F008C5F2C008E602F008F6130008F6130008F6130008F61
      30008D5F2E000000000000000000000000000000000077500E007D5418008459
      20008C5F2C008F6130008D602E008A5D2900845920008D602D008F6130008D60
      2D008D602D008D602D008D602D000000000000000000000000008F61300080F9
      FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9
      FE0080F9FE006537060000000000000000000000000000000000000000007750
      0E0077500E000000000000000000000000000000000000000000000000008F61
      30008F613000000000000000000000000000000000008F61300061C5890061C5
      890061C5890061C5890061C5890061C5890061C5890061C5890061C5890061C5
      8900845625000000000000000000000000000000000078510F001E5FDA001E5F
      DA001E5FDA001E5FDA001E5FDA001E5FDA001E5FDA001E5FDA008F6130001E5F
      DA008F6130001E5FDA008D602D000000000000000000000000008F61300080F9
      FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9
      FE0080F9FE006537060000000000000000000000000000000000000000007750
      0E00000000000000000000000000000000000000000000000000000000000000
      00008F613000000000000000000000000000000000008F61300061C5890061C5
      890061C5890061C5890061C5890061C5890061C5890061C5890061C589005BBD
      82008355240000000000000000000000000000000000795111001E5FDA001E5F
      DA001E5FDA001E5FDA001E5FDA001E5FDA001E5FDA001E5FDA008F6130001E5F
      DA001E5FDA001E5FDA008D602D00000000000000000000000000000000008F61
      300080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9
      FE00653706000000000000000000000000000000000000000000000000007750
      0F00000000000000000000000000000000000000000000000000000000000000
      00008F613000000000000000000000000000000000008F6130008F6130008F61
      30008F6130008F6130008F6130008F6130008F6130008F6130008E602F008C5F
      2C0087592800815322008557260000000000000000007D54160081571C00875C
      25008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F6130008D602E0000000000000000000000000000000000895B
      2A0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9
      FE00653706000000000000000000000000000000000000000000000000007D54
      1600000000000000000000000000000000000000000000000000000000000000
      00008F613000000000000000000000000000000000008F61300061C5890061C5
      890061C5890061C5890061C5890061C5890061C5890061C589006DF1FF006DF1
      FF006DF1FF006DF1FF00774918000000000000000000855A21000D45EF000D45
      EF000D45EF000D45EF000D45EF000D45EF000D45EF000D45EF008F6130000D45
      EF008F6130000D45EF008F613000000000000000000000000000000000000000
      00007B4D1C007648170080F9FE0080F9FE0080F9FE0080F9FE00653706006537
      0600000000000000000000000000000000000000000000000000000000008258
      1D00875B24000000000000000000000000000000000000000000000000008F61
      30008F613000000000000000000000000000000000008F61300061C5890061C5
      890061C5890061C5890061C5890061C5890061C5890061C589006DF1FF006DF1
      FF006DF1FF006DF1FF006638070000000000000000008C5F2C000D45EF000D45
      EF000D45EF000D45EF000D45EF000D45EF000D45EF000D45EF008F6130000D45
      EF000D45EF000D45EF008F613000000000000000000000000000000000000000
      000000000000000000006C3E0D00653706006537060065370600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008B5E2A000000000000000000000000000000000000000000000000008F61
      3000000000000000000000000000000000000000000084562500734514006739
      0800653706006537060065370600653706006537060065370600653706006537
      060065370600653706006537060000000000000000008F6130008F6130008F61
      30008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F6130008F613000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008F6130008F6130008F6130008F6130008F6130008F6130000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008F6130008F6130008F61
      30008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F6130008F61300000000000000000008F6130008F6130008F61
      30008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F6130008F61300000000000000000008F6130008F6130008F61
      30008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F6130008C5F2C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008F6130000AD7FF000AD7
      FF000AD7FF000AD7FF000AD7FF000AD7FF000AD7FF000AD7FF000AD7FF000AD7
      FF000AD7FF000AD7FF008153220000000000000000008F613000FF56C400FF56
      C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56
      C400FF56C400FF56C4008153220000000000000000008F613000FF56C400FF56
      C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56
      C400FF56C400FF56C4007A4C1B000000000000000000000000008F6130008F61
      30008F6130008F61300000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008F6130000AD7FF000AD7
      FF000AD7FF000AD7FF000AD7FF000AD7FF000AD7FF000AD7FF000AD7FF000AD7
      FF000AD7FF000AD7FF007446150000000000000000008F613000FF56C400FF56
      C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56
      C400FF56C400FF56C4007446150000000000000000008F613000FF56C400FF56
      C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56
      C400FF56C400FF56C4006C3E0D000000000000000000000000008F613000CB9D
      6C00CB9D6C008F61300000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008F6130000AD7FF000AD7
      FF000AD7FF000AD7FF008F6130008F6130000AD7FF000AD7FF000AD7FF000AD7
      FF000AD7FF000AD7FF006E400F0000000000000000008F613000FF56C400FF56
      C400FF56C400FF56C400FF56C400FF56C4008F6130008F613000FF56C400FF56
      C400FF56C400FF56C4006E400F0000000000000000008F613000FF56C400FF56
      C400FF56C400FF56C4008F6130008F613000FF56C400FF56C400FF56C400FF56
      C400FF56C400FF56C400673908000000000000000000000000008F613000CB9D
      6C008F6130008F6130008F6130008F6130008F61300000000000000000000000
      000000000000000000000000000000000000000000008F6130000AD7FF000AD7
      FF000AD7FF008F61300000F3FD008F6130000AD7FF000AD7FF000AD7FF000AD7
      FF000AD7FF000AD7FF006E400F0000000000000000008F613000FF56C400FF56
      C400FF56C400FF56C400FF56C400FF56C4008F61300080F9FE008F613000FF56
      C400FF56C400FF56C4006E400F0000000000000000008F613000FF56C400FF56
      C400FF56C4008F61300080F9FE008F613000FF56C400FF56C400FF56C400FF56
      C400FF56C400FF56C400673908000000000000000000000000008F613000CB9D
      6C008F6130006DF1FF006DF1FF006DF1FF008F613000000000008F6130000000
      000000000000000000000000000000000000000000008F6130000AD7FF000AD7
      FF008F61300000F3FD0000F3FD008F6130008F6130008F6130008F6130008F61
      30008F6130000AD7FF006E400F0000000000000000008F613000FF56C4008F61
      30008F6130008F6130008F6130008F6130008F61300080F9FE0080F9FE008F61
      3000FF56C400FF56C4006E400F0000000000000000008F613000FF56C400FF56
      C4008F61300080F9FE0080F9FE008F6130008F6130008F6130008F6130008F61
      30008F613000FF56C400673908000000000000000000000000008F613000CB9D
      6C008F6130006DF1FF006DF1FF006DF1FF008F613000000000008F6130008F61
      300000000000000000000000000000000000000000008F6130000AD7FF008F61
      300000F3FD0000F3FD0000F3FD0000F3FD0000F3FD0000F3FD0000F3FD0000F3
      FD008F6130000AD7FF006E400F0000000000000000008F613000FF56C4008F61
      300080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9
      FE008F613000FF56C4006E400F0000000000000000008F613000FF56C4008F61
      300080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9
      FE008F613000FF56C400673908000000000000000000000000008F613000CB9D
      6C008F6130006DF1FF006DF1FF00885A2900895B2A008F6130008F6130008153
      220076481700000000000000000000000000000000008F6130000AD7FF008F61
      300000F3FD0000F3FD0000F3FD0000F3FD0000F3FD0000F3FD0000F3FD0000F3
      FD008F6130000AD7FF006E400F0000000000000000008F613000FF56C4008F61
      300080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9
      FE008F613000FF56C4006E400F0000000000000000008F613000FF56C4008F61
      300080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9
      FE008F613000FF56C400673908000000000000000000000000008F613000CB9D
      6C008F6130006DF1FF006DF1FF00845625007E501F007C4E1D00774918006A3C
      0B0065370600000000000000000000000000000000008F6130000AD7FF000AD7
      FF008F61300000F3FD0000F3FD008F6130008F6130008F6130008F6130008F61
      30008F6130000AD7FF006E400F0000000000000000008F613000FF56C4008F61
      30008F6130008F6130008F6130008F6130008F61300080F9FE0080F9FE008F61
      3000FF56C400FF56C4006E400F0000000000000000008F613000FF56C400FF56
      C4008F61300080F9FE0080F9FE008F6130008F6130008F6130008F6130008F61
      30008F613000FF56C400673908000000000000000000000000008F613000CB9D
      6C008F6130006DF1FF006DF1FF006DF1FF007143120000000000653706006537
      060000000000000000000000000000000000000000008F6130000AD7FF000AD7
      FF000AD7FF008F61300000F3FD008F6130000AD7FF000AD7FF000AD7FF000AD7
      FF000AD7FF000AD7FF006E400F0000000000000000008F613000FF56C400FF56
      C400FF56C400FF56C400FF56C400FF56C4008F61300080F9FE008F613000FF56
      C400FF56C400FF56C4006E400F0000000000000000008F613000FF56C400FF56
      C400FF56C4008F61300080F9FE008F613000FF56C400FF56C400FF56C400FF56
      C400FF56C400FF56C400673908000000000000000000000000008F613000CB9D
      6C008F6130008F61300087592800794B1A00693B0A0000000000653706000000
      000000000000000000000000000000000000000000008F6130000AD7FF000AD7
      FF000AD7FF000AD7FF008F6130008F6130000AD7FF000AD7FF000AD7FF000AD7
      FF000AD7FF000AD7FF006E400F0000000000000000008F613000FF56C400FF56
      C400FF56C400FF56C400FF56C400FF56C4008F6130008F613000FF56C400FF56
      C400FF56C400FF56C4006E400F0000000000000000008F613000FF56C400FF56
      C400FF56C400FF56C4008F6130008F613000FF56C400FF56C400FF56C400FF56
      C400FF56C400FF56C400673908000000000000000000000000008F613000CB9D
      6C00C6986700B4865500A1734200805221006537060000000000000000000000
      000000000000000000000000000000000000000000008F6130000AD7FF000AD7
      FF000AD7FF000AD7FF000AD7FF000AD7FF000AD7FF000AD7FF000AD7FF000AD7
      FF000AD7FF000AD7FF00693B0A0000000000000000008F613000FF56C400FF56
      C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56
      C400FF56C400FF56C400693B0A0000000000000000008F613000FF56C400FF56
      C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56
      C400FF56C400FF56C400653706000000000000000000000000008F613000B688
      57009567360085572600784A1900653706006537060000000000000000000000
      000000000000000000000000000000000000000000008F6130000AD7FF000AD7
      FF000AD7FF000AD7FF000AD7FF000AD7FF000AD7FF000AD7FF000AD7FF000AD7
      FF000AD7FF000AD7FF006537060000000000000000008F613000FF56C400FF56
      C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56
      C400FF56C400FF56C4006537060000000000000000008F613000FF56C400FF56
      C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56C400FF56
      C400FF56C400FF56C40065370600000000000000000000000000845625007345
      1400673908006537060065370600653706006537060000000000000000000000
      000000000000000000000000000000000000000000007F512000734514006739
      0800653706006537060065370600653706006537060065370600653706006537
      060065370600653706006537060000000000000000007F512000734514006739
      0800653706006537060065370600653706006537060065370600653706006537
      060065370600653706006537060000000000000000007F512000734514006739
      0800653706006537060065370600653706006537060065370600653706006537
      0600653706006537060065370600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CB9D6C00CB9D
      6C00CB9D6C00CB9D6C00CB9D6C00CB9D6C00CB9D6C00CB9D6C00CB9D6C00CB9D
      6C00CB9D6C00B98B5A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008F6130008F6130008F61
      30008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F6130008F613000000000000000000000000000CB9D6C008F61
      30008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      3000825423008A5C2B0000000000000000000000000000000000855A2100895D
      2700895D2700895D2700895D2700895D2700895D27008D602D008B5E2A008D60
      2D008B5E2A008A5E29008D602E000000000000000000000000008F6130008F61
      30008F6130008F613000000000000000000000000000000000008F6130008F61
      30008F6130008A5C2B000000000000000000000000008F6130000AD7FF000AD7
      FF000AD7FF000AD7FF000AD7FF000AD7FF000AD7FF000AD7FF000AD7FF000AD7
      FF000AD7FF000AD7FF0081532200000000000000000000000000CB9D6C00CB9D
      6C00CB9D6C00CB9D6C00CB9D6C008F6130008F613000CB9D6C00BA8D5A00A173
      42008355240071431200000000000000000000000000000000008A5D290080F9
      FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9
      FE0080F9FE0080F9FE00895D27000000000000000000000000008F613000E4B6
      4C00E4B64C008F613000000000000000000000000000000000008F613000E4B6
      4C00E4B64C00794B1A000000000000000000000000008F6130000AD7FF000AD7
      FF000AD7FF000AD7FF000AD7FF000AD7FF000AD7FF000AD7FF000AD7FF000AD7
      FF000AD7FF000AD7FF0074461500000000000000000000000000000000000000
      000000000000CB9D6C00CB9D6C008F6130008D5F2E00BB8D5C00B08251000000
      00000000000000000000000000000000000000000000000000008D602D0080F9
      FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9
      FE0080F9FE0080F9FE00895D27000000000000000000000000008F613000E4B6
      4C008F6130008F613000CB9D6C006DF1FF006DF1FF00CB9D6C008F6130009062
      3100AE872F006C3E0D000000000000000000000000008F6130000AD7FF000AD7
      FF000AD7FF000AD7FF000AD7FF000AD7FF008F6130008F6130000AD7FF000AD7
      FF000AD7FF000AD7FF006E400F00000000000000000000000000CB9D6C00CB9D
      6C00CB9D6C00CB9D6C00CB9D6C008F6130008E602F00C4966500C4966500BB8D
      5C00A67847008D5F2E00000000000000000000000000000000008D602E0080F9
      FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9
      FE0080F9FE0080F9FE00895D27000000000000000000000000008F613000E4B6
      4C008F6130006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF008E60
      2F0095722200673908000000000000000000000000008F6130000AD7FF000AD7
      FF000AD7FF000AD7FF000AD7FF000AD7FF008F61300000F3FD008F6130000AD7
      FF000AD7FF000AD7FF006E400F00000000000000000000000000CB9D6C008F61
      30008F6130008F6130008F6130008F6130008F6130008F6130008F6130008D5F
      2E00805221008557260000000000000000000000000000000000895D270080F9
      FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9
      FE0080F9FE0080F9FE008E602F000000000000000000000000008F613000E4B6
      4C008F6130006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF00895B
      2A0095722200673908000000000000000000000000008F6130000AD7FF008F61
      30008F6130008F6130008F6130008F6130008F61300000F3FD0000F3FD008F61
      30000AD7FF000AD7FF006E400F00000000000000000000000000CB9D6C008F61
      3000CB9D6C006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1
      FF007B4D1C00764817000000000000000000000000000000000082581D0080F9
      FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9
      FE0080F9FE0080F9FE008B5E2A000000000000000000000000008F613000E4B6
      4C008F6130006DF1FF006DF1FF008F6130008F6130006DF1FF006DF1FF008759
      280087651A00673908000000000000000000000000008F6130000AD7FF008F61
      300000F3FD0000F3FD0000F3FD0000F3FD0000F3FD0000F3FD0000F3FD0000F3
      FD008F6130000AD7FF006E400F00000000000000000000000000CB9D6C008F61
      30006DF1FF00CB9D6C006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1
      FF0075471600693B0A000000000000000000000000000000000082581D0080F9
      FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9
      FE0080F9FE0080F9FE008B5E2A000000000000000000000000008F613000E4B6
      4C008F6130006DF1FF006DF1FF008F6130008F6130006DF1FF006DF1FF008759
      280087651A00673908000000000000000000000000008F6130000AD7FF008F61
      300000F3FD0000F3FD0000F3FD0000F3FD0000F3FD0000F3FD0000F3FD0000F3
      FD008F6130000AD7FF006E400F00000000000000000000000000CB9D6C008F61
      30006DF1FF006DF1FF00CB9D6C006DF1FF006DF1FF006DF1FF006DF1FF006DF1
      FF00754716006A3C0B000000000000000000000000000000000082581D0080F9
      FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9
      FE0080F9FE0080F9FE008B5E2A000000000000000000000000008F613000E4B6
      4C008F6130006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF008759
      280087651A00673908000000000000000000000000008F6130000AD7FF008F61
      30008F6130008F6130008F6130008F6130008F61300000F3FD0000F3FD008F61
      30000AD7FF000AD7FF006E400F00000000000000000000000000CB9D6C008F61
      30006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1
      FF00774918006B3D0C00000000000000000000000000000000007D54180080F9
      FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9
      FE0080F9FE0080F9FE008D602E000000000000000000000000008F613000E4B6
      4C008F6130008F6130008F6130008F6130008F6130008F6130008E602F008557
      260087651A00673908000000000000000000000000008F6130000AD7FF000AD7
      FF000AD7FF000AD7FF000AD7FF000AD7FF008F61300000F3FD008F6130000AD7
      FF000AD7FF000AD7FF006E400F00000000000000000000000000CB9D6C008F61
      30006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF00000000006DF1
      FF007A4C1B006C3E0D00000000000000000000000000000000007E5518008157
      1C0081571C0081571C0080561B007E5518007E5518007E5518007F561A0080F9
      FE0080F9FE0080F9FE008F6130000000000000000000000000008F613000E4B6
      4C00DCAF4800C39A3B00C39A3B00C39A3B00C39A3B00C39A3B00C39A3B00AE87
      2F00795A1300653706000000000000000000000000008F6130000AD7FF000AD7
      FF000AD7FF000AD7FF000AD7FF000AD7FF008F6130008F6130000AD7FF000AD7
      FF000AD7FF000AD7FF006E400F00000000000000000000000000CB9D6C008F61
      30006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1
      FF0074461500663807000000000000000000000000000000000084592000AB7D
      4C00AD7F4E00AD7F4E008F613000AD7F4E00AD7F4E00AD7F4E008F61300080F9
      FE0080F9FE0080F9FE008F6130000000000000000000000000008F613000C39A
      3B009572220087651A0087651A0087651A0087651A0087651A0087651A007152
      0F0052380500653706000000000000000000000000008F6130000AD7FF000AD7
      FF000AD7FF000AD7FF000AD7FF000AD7FF000AD7FF000AD7FF000AD7FF000AD7
      FF000AD7FF000AD7FF00693B0A00000000000000000000000000CB9D6C008658
      2700794B1A007244130072441300724413007345140074461500774918007345
      14006739080065370600000000000000000000000000000000008C5F2B008F61
      30008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F6130008F613000000000000000000000000000845625007345
      1400673908006537060065370600653706006537060065370600653706006537
      060065370600653706000000000000000000000000008F6130000AD7FF000AD7
      FF000AD7FF000AD7FF000AD7FF000AD7FF000AD7FF000AD7FF000AD7FF000AD7
      FF000AD7FF000AD7FF0065370600000000000000000000000000AD7F4E00885A
      29006B3D0C006537060065370600653706006537060065370600653706006537
      0600653706006537060000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007F5120008F6130008F61
      30008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F61300065370600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008D602D008D602D008D60
      2D008D602D008D602D008D602D008D602D008D602D00000000008D602D008D60
      2D008D602D00000000008D602D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000077500E0077500E007750
      0E007D5418008D602D008D602D008D602D008D602D008D602D008D602D008D60
      2D008D602D008D602D008D602D0000000000000000008D602D008D602D008D60
      2D008D602D008D602D008D602D008D602D008D602D00000000008D602D008D60
      2D008D602D00000000008D602D00000000000000000000000000000000000000
      000000000000000000008F613000CB9D6C00CB9D6C007F512000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000077500E0080F9FE0080F9
      FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9
      FE0080F9FE0080F9FE008D602D0000000000000000008D602D008D602D000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008F613000CB9D6C00C395640073451400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000080808000000000000000000000000000000000077500E0080F9FE0080F9
      FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9
      FE0080F9FE0080F9FE008D602D0000000000000000008D602D008D602D000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008F613000CB9D6C00B688570071431200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CB9D6C00CB9D6C00CB9D6C00CB9D6C00CB9D6C00CB9D6C00CB9D6C00C395
      6400151515000000000000000000000000000000000077500E007B5314008358
      1F008A5E29008D602D008C5F2C008D602D008D602D008D602D008D602D008D60
      2D008D602D008D602D008D602D0000000000000000008D602D008D602D000000
      0000000000008D602D008D602D008D602D008D602D00000000008D602D008D60
      2D008D602D00000000008D602D00000000000000000000000000000000000000
      000000000000000000008F613000CB9D6C00BD915F00794B1A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CB9D6C00CB9D6C008F6130008F6130008F6130008F613000CB9D6C009D71
      3B002A2A2A000000000000000000000000000000000077500E0080F9FE0080F9
      FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9
      FE0080F9FE0080F9FE008D602D0000000000000000008D602D008D602D000000
      0000000000008D602D008D602D008D602D008D602D00000000008D602D008D60
      2D008D602D00000000008D602D00000000000000000000000000000000000000
      0000000000008F6130008F6130008F6130008F61300084562500815322000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CB9D6C00CB9D6C008F6130006DF1FF006DF1FF008F613000B78958008D5F
      2E002A2A2A000000000000000000000000000000000077500E0080F9FE0080F9
      FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9
      FE0080F9FE0080F9FE008D602D0000000000000000008D602D008D602D000000
      0000000000008D602D008D602D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008F6130008F6130006DF1FF006DF1FF006DF1FF006DF1FF00875928008355
      2400000000000000000000000000000000000000000000000000000000000000
      0000CB9D6C00CB9D6C008F6130006DF1FF006DF1FF008F613000B78958008D5F
      2E002A2A2A000000000000000000000000000000000077500E007D5418008459
      20008C5F2C008F6130008D602E008A5D2900845920007F5619007E5518007F56
      1A00845920008D602D008D602D0000000000000000008D602D008D602D000000
      0000000000008D602D008D602D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008F61
      30008F6130006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF007F51
      2000774918000000000000000000000000000000000000000000000000000000
      0000CB9D6C00CB9D6C00885A290087592800885A29008A5C2B00AD7F4E008658
      27002A2A2A000000000000000000000000000000000077500E0080F9FE0080F9
      FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9
      FE0080F9FE0080F9FE008D602D0000000000000000008D602D008D602D008D60
      2D008D602D008D602D008D602D008D602D008D602D00000000008D602D008D60
      2D008D602D00000000008D602D00000000000000000000000000000000008F61
      30006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1
      FF006E400F000000000000000000000000000000000000000000000000000000
      0000CB9D6C00B3855400916332008C5F2C0095673600A67847009D713B007A4C
      1B002A2A2A000000000000000000000000000000000077500E0080F9FE0080F9
      FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9
      FE0080F9FE0080F9FE008D602D0000000000000000008D602D008D602D008D60
      2D008D602D008D602D008D602D008D602D008D602D00000000008D602D008D60
      2D008D602D00000000008D602D00000000000000000000000000000000008F61
      30006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1
      FF00673908000000000000000000000000000000000000000000000000000000
      000003030300151515002A2A2A002A2A2A002A2A2A0015151500151515002A2A
      2A002A2A2A000000000000000000000000000000000077500E0081571C00875C
      25008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F6130008D602D0000000000000000008D602D008D602D000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008F61
      30006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1
      FF00653706000000000000000000000000000000000000000000000000000000
      0000080808001515150000000000000000000000000000000000151515002A2A
      2A00000000000000000000000000000000000000000077500E006DF8FE0080F9
      FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9
      FE0080F9FE0080F9FE008F61300000000000000000008D602D008D602D000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008F61
      30008E602F0088EBFF0088EBFF006DF1FF006DF1FF006DF1FF006DF1FF006537
      0600653706000000000000000000000000000000000000000000000000000000
      0000080808001515150000000000000000000000000000000000151515002A2A
      2A00000000000000000000000000000000000000000077500E006DF8FE0080F9
      FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9FE0080F9
      FE0080F9FE0080F9FE008F61300000000000000000008D602D008D602D008D60
      2D008D602D008D602D008D602D008D602D008D602D00000000008D602D008D60
      2D008D602D00000000008D602D00000000000000000000000000000000000000
      00008254230088EBFF0088EBFF0088EBFF006DF1FF006DF1FF006DF1FF006537
      0600000000000000000000000000000000000000000000000000000000000000
      00000000000015151500080808000000000000000000080808002A2A2A000000
      0000000000000000000000000000000000000000000077500E008F6130008F61
      30008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F6130008F61300000000000000000008D602D008D602D008D60
      2D008D602D008D602D008D602D008D602D008D602D00000000008D602D008D60
      2D008D602D00000000008D602D00000000000000000000000000000000000000
      00000000000072441300693B0A00653706006537060065370600653706000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000015151500151515001515150015151500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000064DF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000091633200916332009163
      3200916332000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000064DF000064DF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000091633200C99B6A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000091633200C99B6A000000
      00000000000000000000000000000000000091633200916332000064DF000064
      DF00916332008C5F2C0000000000000000000000000091633200C99B6A000000
      0000000000000000000000000000000000000064DF000064DF000064DF000064
      DF000064DF000059C600023B8800000000000000000000000000000000008F61
      30008F6130000000000000000000000000000000000000000000000000008F61
      30008D5F2E0000000000000000000000000000000000FCD5AC0091633200C99B
      6A00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FCD5AC0091633200C99B
      6A0000000000000000000000000091633200916332000064DF000062D9000064
      DF000064DF00855726007C4E1D000000000000000000FCD5AC0091633200C99B
      6A00000000000000000000000000000000000064DF000064DF000064DF000064
      DF000052B600022C6600022C6600FBFAF7000000000000000000000000008F61
      30008F6130008F613000000000000000000000000000000000008F6130008F61
      3000764817000000000000000000000000000000000000000000FCD5AC008E60
      2F00C79968000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FCD5AC008E60
      2F00C99B6A000000000000000000916332000064DF000064DF006DF1FF006DF1
      FF000064DF000052B60071431200000000000000000000000000FCD5AC008E60
      2F00C79968000000000000000000000000000000000000000000000000000000
      0000022C6600022C660000000000000000000000000000000000000000000000
      00008F6130008F6130008F61300000000000000000008F6130008F6130007042
      110000000000000000000000000000000000000000000000000000000000ECC4
      9B00916332000000000091633200916332009163320091633200916332000000
      000000000000000000000000000000000000000000000000000000000000ECC4
      9B00916332000000000091633200916332000064DF000062D900916332006DF1
      FF000064DF00014497006638070000000000000000000000000000000000ECC4
      9B00916332000000000091633200916332009163320091633200916332000000
      0000022C66000000000000000000000000000000000000000000000000000000
      0000000000008F6130008F6130008F6130008F6130008F613000724413000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000091633200C3956400AB7D4C00B0825100C7996800C99B6A008F61
      3000000000000000000000000000000000000000000000000000000000000000
      00000000000091633200C99B6A008D6030008A5C2B00005ED1000064DF000064
      DF000052B6006B3D0C0065370600000000000000000000000000000000000000
      00000000000091633200C2946300A87B4A00A6784700B7895800C49665008658
      2700000000000000000000000000000000000000000000000000000000000000
      000000000000000000008F6130008F6130008F613000794B1A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000091633200C0926100805221006DF1FF006DF1FF006DF1FF00C0926100C092
      61007F5120000000000000000000000000000000000000000000000000000000
      000091633200C3956400906231006DF1FF00794B1A00845625000059C6000052
      B600714312006537060000000000000000000000000000000000000000000000
      000091633200C0926100805221006DF1FF006DF1FF006DF1FF00BD915F00B688
      5700784A19000000000000000000000000000000000000000000000000000000
      000000000000000000008F6130008D5F2E007F51200075471600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000091633200AB7D4C006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF00C89A
      69007B4D1C000000000000000000000000000000000000000000000000000000
      000091633200B08251006DF1FF006DF1FF006DF1FF0080522100855828007C4E
      1D00673908000000000000000000000000000000000000000000000000000000
      000091633200AB7D4C006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF00C496
      6500794B1A000000000000000000000000000000000000000000000000000000
      0000000000008F6130008C5F2C007648170072441300794B1A00805221000000
      0000000000000000000000000000000000000000000000000000000000000000
      000091633200B48655006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF00C99B
      6A00794B1A000000000000000000000000000000000000000000000000000000
      000091633200B48655006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF00A87B
      4A00693B0A000000000000000000000000000000000000000000000000000000
      000091633200B48655006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF00C99B
      6A00794B1A000000000000000000000000000000000000000000000000000000
      00008F6130008E602F007042110000000000000000007C4E1D00865827008456
      2500000000000000000000000000000000000000000000000000000000000000
      000091633200C99B6A006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF00C99B
      6A00734514000000000000000000000000000000000000000000000000000000
      000091633200C99B6A006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF00BD91
      5F006C3E0D000000000000000000000000000000000000000000000000000000
      000091633200C99B6A006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF00C99B
      6A00734514000000000000000000000000000000000000000000000000008F61
      30008C5F2C006F41100000000000000000000000000000000000805221007B4D
      1C00754716000000000000000000000000000000000000000000000000000000
      000091633200C99B6A00C89A69006DF1FF006DF1FF006DF1FF00C99B6A00AD7F
      4E00693B0A000000000000000000000000000000000000000000000000000000
      000091633200C99B6A00C89A69006DF1FF006DF1FF006DF1FF00C99B6A00A173
      4200673908000000000000000000000000000000000000000000000000000000
      000091633200C99B6A00C89A69006DF1FF006DF1FF006DF1FF00C99B6A00AD7F
      4E00693B0A00000000000000000000000000000000000000000000000000885A
      2900734514000000000000000000000000000000000000000000000000007244
      13006B3D0C000000000000000000000000000000000000000000000000000000
      0000000000008A5C2B00BB8D5C00C99B6A00C99B6A00C99B6A00AB7D4C006B3D
      0C00000000000000000000000000000000000000000000000000000000000000
      0000000000008A5C2B00BB8D5C00C99B6A00C99B6A00C99B6A00AB7D4C006B3D
      0C00000000000000000000000000000000000000000000000000000000000000
      0000000000008A5C2B00BB8D5C00C99B6A00C99B6A00C99B6A00AB7D4C006B3D
      0C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007A4C1B00774918007648170070421100673908000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007A4C1B00774918007648170070421100673908000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007A4C1B00774918007648170070421100673908000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000895D2700895D2700895D2700895D
      2700895D2700895D2700895D2700000000000000000000000000000000000000
      000000000000000000000000000000000000895D2700895D2700895D2700895D
      2700895D2700895D2700895D2700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000895D27006DF1FF006DF1FF006DF1
      FF006DF1FF006DF1FF00895D2700000000000000000000000000000000000000
      000000000000000000000000000000000000895D27006DF1FF006DF1FF006DF1
      FF006DF1FF006DF1FF00895D27000000000000000000000000008F6130008F61
      30008F61300084562500000000000000000000000000000000008F6130008F61
      30008F6130008D5F2E00000000000000000000000000000000008F6130008F61
      30008F6130008F613000000000000000000000000000000000008F6130008F61
      30008F6130008A5C2B00000000000000000000000000000000008F6130008F61
      30008F6130008F6130000000000000000000895D27006DF1FF001260C0001260
      C0001260C0006DF1FF00895D27000000000000000000000000008F6130008F61
      30008F6130008F6130000000000000000000895D27006DF1FF001260C0001260
      C0001260C0006DF1FF00895D27000000000000000000000000008F6130000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007C4E1D00000000000000000000000000000000008F613000CB9D
      6C00CB9D6C008F613000000000000000000000000000000000008F613000CB9D
      6C00CB9D6C00794B1A00000000000000000000000000000000008F613000CB9D
      6C00CB9D6C008F6130000000000000000000895D27006DF1FF006DF1FF006DF1
      FF006DF1FF006DF1FF00895D27000000000000000000000000008F613000CB9D
      6C00CB9D6C008F6130000000000000000000895D27006DF1FF006DF1FF006DF1
      FF006DF1FF006DF1FF00895D27000000000000000000000000008B5D2C000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000071431200000000000000000000000000000000008F613000CB9D
      6C008F6130008F613000CB9D6C006DF1FF006DF1FF00CB9D6C008F6130008F61
      3000A87B4A006C3E0D00000000000000000000000000000000008F613000CB9D
      6C008F6130008F613000CB9D6C006DF1FF00895D27006DF1FF001260C0001260
      C0001260C0006DF1FF00895D27000000000000000000000000008F613000CB9D
      6C008F6130008F613000CB9D6C006DF1FF00895D27006DF1FF001260C0001260
      C0001260C0006DF1FF00895D2700000000000000000000000000805221000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000070421100000000000000000000000000000000008F613000CB9D
      6C008F6130006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF008E60
      2F009264330067390800000000000000000000000000000000008F613000CB9D
      6C008F6130006DF1FF006DF1FF006DF1FF00895D27006DF1FF006DF1FF006DF1
      FF006DF1FF006DF1FF00895D27000000000000000000000000008F613000CB9D
      6C008F6130006DF1FF006DF1FF006DF1FF00895D27006DF1FF006DF1FF006DF1
      FF006DF1FF006DF1FF00895D2700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008F613000CB9D
      6C008F6130006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF00895B
      2A008E602F0067390800000000000000000000000000000000008F613000CB9D
      6C008F6130006DF1FF006DF1FF006DF1FF00895D27006DF1FF001260C0001260
      C0001260C0006DF1FF00895D27000000000000000000000000008F613000CB9D
      6C008F6130006DF1FF006DF1FF006DF1FF00895D27006DF1FF001260C0001260
      C0001260C0006DF1FF00895D2700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008F613000CB9D
      6C008F6130006DF1FF006DF1FF008F6130008F6130006DF1FF006DF1FF008759
      28008D5F2E0067390800000000000000000000000000000000008F613000CB9D
      6C008F6130006DF1FF006DF1FF008F613000895D27006DF1FF006DF1FF006DF1
      FF006DF1FF006DF1FF00895D27000000000000000000000000008F613000CB9D
      6C008F6130006DF1FF006DF1FF008F613000895D27006DF1FF006DF1FF006DF1
      FF006DF1FF006DF1FF00895D2700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008F613000CB9D
      6C008F6130006DF1FF006DF1FF008F6130008F6130006DF1FF006DF1FF008759
      28008D5F2E0067390800000000000000000000000000000000008F613000CB9D
      6C008F6130006DF1FF006DF1FF008F613000895D2700895D2700895D2700895D
      2700895D2700895D2700895D27000000000000000000000000008F613000CB9D
      6C008F6130006DF1FF006DF1FF008F613000895D2700895D2700895D2700895D
      2700895D2700895D2700895D2700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008F613000CB9D
      6C008F6130006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF008759
      28008D5F2E0067390800000000000000000000000000000000008F613000CB9D
      6C008F6130006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF008759
      28008D5F2E0067390800000000000000000000000000000000008F613000CB9D
      6C008F6130006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF006DF1FF008759
      28008D5F2E0067390800000000000000000000000000000000008F6130000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008F613000000000000000000000000000000000008F613000CB9D
      6C008F6130008F6130008F6130008F6130008F6130008F6130008F6130008759
      28008D5F2E0067390800000000000000000000000000000000008F613000CB9D
      6C008F6130008F6130008F6130008F6130008F6130008F6130008F6130008759
      28008D5F2E0067390800000000000000000000000000000000008F613000CB9D
      6C008F6130008F6130008F6130008F6130008F6130008F6130008F6130008759
      28008D5F2E0067390800000000000000000000000000000000008F6130000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008D5F2E00000000000000000000000000000000008F613000CB9D
      6C00C6986700B4865500B4865500B4865500B4865500B4865500B4865500A173
      42007C4E1D0065370600000000000000000000000000000000008F613000CB9D
      6C00C6986700B4865500B4865500B4865500B4865500B4865500B4865500A173
      42007C4E1D0065370600000000000000000000000000000000008F613000CB9D
      6C00C6986700B4865500B4865500B4865500B4865500B4865500B4865500A173
      42007C4E1D0065370600000000000000000000000000000000008F6130000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007C4E1D00000000000000000000000000000000008F613000B688
      570095673600855726008557260085572600855726008557260085572600784A
      19006537060065370600000000000000000000000000000000008F613000B688
      570095673600855726008557260085572600855726008557260085572600784A
      19006537060065370600000000000000000000000000000000008F613000B688
      570095673600855726008557260085572600855726008557260085572600784A
      1900653706006537060000000000000000000000000000000000895B2A007A4C
      1B007143120071431200000000000000000000000000000000008F613000895B
      2A00794B1A006C3E0D0000000000000000000000000000000000845625007345
      1400673908006537060065370600653706006537060065370600653706006537
      0600653706006537060000000000000000000000000000000000845625007345
      1400673908006537060065370600653706006537060065370600653706006537
      0600653706006537060000000000000000000000000000000000845625007345
      1400673908006537060065370600653706006537060065370600653706006537
      0600653706006537060000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C99B6A00C99B6A00C99B6A00C99B6A00C99B6A00C99B6A000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C99B6A00C99B6A00C99B6A00C99B6A00C99B6A00C99B6A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008F6130008F61
      30000000000000000000000000000000000000000000000000008F6130008F61
      3000000000000000000000000000000000000000000000000000000000000000
      0000C99B6A008F6130008F6130008F6130008F6130008F6130008F613000C496
      6500000000000000000000000000000000000000000000000000000000000000
      0000C99B6A008F6130008F6130008F6130008F6130008F6130008F613000C395
      64000000000000000000000000000000000000000000000000008F6130008F61
      30008F6130008E602F008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008F613000000000000000000000000000000000008F6130006DF1
      FF008F613000000000000000000000000000000000008F6130006DF1FF006DF1
      FF00794B1A00000000000000000000000000000000000000000000000000C99B
      6A008F6130008F613000845625007C4E1D00875928008F6130008F6130008D5F
      2E00B0825100000000000000000000000000000000000000000000000000C99B
      6A008F6130008E602F00865827008A5C2B008F6130008F6130008F6130008A5C
      2B00B082510000000000000000000000000000000000000000008F6130000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008658270000000000000000000000000000000000000000008F61
      30006DF1FF008E602F000000000000000000000000008F6130006DF1FF006DF1
      FF00663807000000000000000000000000000000000000000000C99B6A008F61
      30008F613000855726006F4110006DF1FF006DF1FF008F6130008F6130008E60
      2F007F5120009163320000000000000000000000000000000000C99B6A008F61
      30008F6130006DF1FF006DF1FF007B4D1C008052210083552400885A29008759
      28008052210092643300000000000000000000000000000000008F6130000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008658270000000000000000000000000000000000000000000000
      00008A5C2B006DF1FF008F613000000000000000000000000000764817006537
      0600000000000000000000000000000000000000000000000000C99B6A008F61
      30008F6130007B4D1C006E400F006DF1FF006DF1FF008F6130008F6130008F61
      30007A4C1B007B4D1C0000000000000000000000000000000000C99B6A008F61
      3000895B2A006DF1FF006DF1FF006DF1FF007C4E1D007A4C1B00815322008557
      26007C4E1D007E501F00000000000000000000000000000000008D5F2E000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008A5C2B0000000000000000000000000000000000000000000000
      000000000000895B2A006DF1FF008F6130000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C99B6A008F61
      30008F6130007B4D1C00754716006DF1FF006DF1FF008F6130008F6130008F61
      3000764817006E400F0000000000000000000000000000000000C99B6A008F61
      30008E602F00805221006DF1FF006DF1FF006DF1FF007B4D1C006DF1FF00895B
      2A007E501F0074461500000000000000000000000000000000008F6130000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008F61300000000000000000000000000000000000000000000000
      000000000000000000008C5F2C006DF1FF008D5F2E0000000000000000000000
      0000000000000000000000000000000000000000000000000000C99B6A008F61
      30008F613000805221007E501F006DF1FF006DF1FF008F6130008F6130008C5F
      2C00734514006537060000000000000000000000000000000000C99B6A008F61
      30008F61300085572600825423006DF1FF006DF1FF006DF1FF006DF1FF008F61
      30008254230070421100000000000000000000000000000000008F6130000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008F61300000000000000000000000000000000000000000000000
      00000000000000000000000000008D5F2E006DF1FF008C5F2C00000000000000
      0000000000000000000000000000000000000000000000000000C99B6A008F61
      30008F61300084562500835524008F6130008F6130008F6130008F6130008456
      25006B3D0C006537060000000000000000000000000000000000C99B6A008F61
      30008F6130008658270080522100815322006DF1FF006DF1FF006DF1FF008F61
      30008052210067390800000000000000000000000000000000008F6130000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008E602F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008A5C2B006DF1FF008E602F000000
      0000000000000000000000000000000000000000000000000000C99B6A008F61
      30008D5F2E00885A29008A5C2B006DF1FF006DF1FF008F6130008F6130007547
      1600653706006537060000000000000000000000000000000000C99B6A008F61
      30008E602F00895B2A00855726006DF1FF006DF1FF006DF1FF006DF1FF008F61
      30007345140065370600000000000000000000000000000000008F6130008F61
      30008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130007F51200000000000000000000000000000000000000000000000
      00008F6130008F613000000000000000000000000000895B2A006DF1FF008D5F
      2E0000000000000000000000000000000000000000000000000000000000B486
      55008557260085572600885A29008F6130008F6130008F6130007A4C1B006537
      060065370600000000000000000000000000000000000000000000000000B486
      55008557260085572600865827008D5F2E008F6130008F6130008F6130007E50
      1F006537060000000000000000000000000000000000000000008F6130008F61
      30008F6130008D5F2E008F6130008F6130008F6130008F6130008F613000895B
      2A00794B1A006B3D0C0000000000000000000000000000000000000000008F61
      30006DF1FF006DF1FF00794B1A00000000000000000000000000895B2A006DF1
      FF00865827000000000000000000000000000000000000000000000000000000
      0000A17342007A4C1B00794B1A007A4C1B007A4C1B0072441300653706006537
      0600000000000000000000000000000000000000000000000000000000000000
      0000A17342007A4C1B00794B1A007C4E1D008254230080522100724413006537
      060000000000000000000000000000000000000000000000000086582700784A
      19006C3E0D00693B0A006A3C0B006A3C0B006A3C0B006A3C0B00693B0A006638
      0700653706006537060000000000000000000000000000000000000000008F61
      30006DF1FF006DF1FF0065370600000000000000000000000000000000008254
      23006DF1FF007547160000000000000000000000000000000000000000000000
      0000000000008456250072441300693B0A006537060065370600653706000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084562500724413006A3C0B006739080065370600653706000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000744615006537060000000000000000000000000000000000000000000000
      0000724413006B3D0C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008F6130008F61
      30008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008B5D2C00000000000000000000000000000000008F6130008F61
      30008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008B5D2C00000000000000000000000000000000008F6130008F61
      30008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008B5D2C00000000000000000000000000000000008F6130008F61
      30008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F6130008B5D2C00000000000000000000000000000000008F613000C99B
      6A00C2946300B0825100BA8D5A00C4966500C4966500C89A6900C99B6A00C99B
      6A00C89A69007C4E1D00000000000000000000000000000000008F613000C99B
      6A00C99B6A00C99B6A00C99B6A00C99B6A00C99B6A00C99B6A00C99B6A00C99B
      6A00C99B6A007C4E1D00000000000000000000000000000000008F6130008F61
      30008F613000C99B6A00B4865500A67847009D713B00A6784700C0926100C99B
      6A00C99B6A007C4E1D00000000000000000000000000000000008F613000C99B
      6A00C99B6A00C99B6A00C99B6A00C99B6A00C99B6A00C99B6A00C99B6A00C99B
      6A00C09261007B4D1C00000000000000000000000000000000008F613000C092
      6100000000000000000000000000000000000000000000000000000000006DF1
      FF00B385540074461500000000000000000000000000000000008F613000C99B
      6A00000000000000000000000000000000000000000000000000000000006DF1
      FF00B385540073451400000000000000000000000000000000008F6130008F61
      30000062D9007C4E1D0000000000000000000000000000000000000000000000
      0000BB8D5C0075471600000000000000000000000000000000008F613000C99B
      6A0000000000B98B5A00815322007F5120008052210085572600B38554000000
      0000A173420072441300000000000000000000000000000000008F613000AB7D
      4C0000000000023B8800000000000059C6000052B6000052B6000059C6006DF1
      FF00B98B5A0074461500000000000000000000000000000000008F613000C99B
      6A0000000000D7C17B00D7C17B00D7C17B00C4AF6A00C4AF6A00D7C17B006DF1
      FF00B789580073451400000000000000000000000000000000008F613000C496
      65007B4D1C00023B8800784A1900000000000000000000000000000000000000
      0000C99B6A0076481700000000000000000000000000000000008F613000C99B
      6A0000000000A6784700754716006DF1FF006DF1FF0081532200AB7D4C000000
      0000A173420070421100000000000000000000000000000000008F613000B284
      53000000000000000000000000000000000000000000000000006DF1FF006DF1
      FF00C99B6A00784A1900000000000000000000000000000000008F613000C99B
      6A0000000000D7C17B00A6533300D7C17B000000000000000000D7C17B006DF1
      FF00C294630075471600000000000000000000000000000000008F613000AD7F
      4E0000000000774918000052B600895B2A000000000000000000000000000000
      0000C99B6A00784A1900000000000000000000000000000000008F613000C99B
      6A0000000000AD7F4E00784A19006DF1FF006DF1FF008F613000C49665000000
      0000AD7F4E0074461500000000000000000000000000000000008F613000B486
      5500000000000052B600000000000064DF000064DF000064DF000064DF006DF1
      FF00C99B6A007A4C1B00000000000000000000000000000000008F613000C99B
      6A0000000000D7C17B00D7C17B00C4AF6A00A48F4D00C4AF6A00D7C17B006DF1
      FF00C395640076481700000000000000000000000000000000008F613000A173
      42000000000000000000865827000059C600855726000064DF000064DF008F61
      3000C99B6A0075471600000000000000000000000000000000008F613000C99B
      6A0000000000BA8D5A00805221006DF1FF006DF1FF008F613000C99B6A000000
      0000B486550075471600000000000000000000000000000000008F613000BD91
      5F0000000000000000000000000000000000000000006DF1FF006DF1FF006DF1
      FF00C99B6A007A4C1B00000000000000000000000000000000008F613000C99B
      6A0000000000D7C17B00A6533300A48F4D00000000006DF1FF00D7C17B006DF1
      FF00C294630076481700000000000000000000000000000000008F613000AB7D
      4C0000000000000000000000000085572600023B88006DF1FF006DF1FF000064
      DF008C5F2C0072441300000000000000000000000000000000008F613000C99B
      6A0000000000C4966500885A29006DF1FF006DF1FF008F613000C99B6A000000
      0000B789580076481700000000000000000000000000000000008F613000C99B
      6A00000000000064DF00000000000064DF000064DF000064DF000064DF006DF1
      FF00C99B6A007A4C1B00000000000000000000000000000000008F613000C99B
      6A0000000000D7C17B00C4AF6A00B59F5C00AE995600C4AF6A00D7C17B006DF1
      FF00C99B6A0077491800000000000000000000000000000000008F613000C698
      67000000000000000000000000000064DF006DF1FF006DF1FF006DF1FF006DF1
      FF000064DF0073451400000000000000000000000000000000008F613000C99B
      6A0000000000C99B6A008F6130006DF1FF006DF1FF008F613000C99B6A000000
      0000BB8D5C0075471600000000000000000000000000000000008F613000C99B
      6A00000000000000000000000000000000006DF1FF006DF1FF006DF1FF006DF1
      FF00C99B6A0077491800000000000000000000000000000000008F613000C99B
      6A00000000000000000000000000000000006DF1FF006DF1FF006DF1FF006DF1
      FF00C99B6A0076481700000000000000000000000000000000008F613000C99B
      6A000000000000000000000000000064DF006DF1FF006DF1FF006DF1FF006DF1
      FF000064DF0076481700000000000000000000000000000000008F613000C99B
      6A0000000000C99B6A008F6130008F6130008F6130008F613000C99B6A000000
      0000BB8D5C0074461500000000000000000000000000000000008F6130008F61
      30008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008F61300073451400000000000000000000000000000000008F6130008F61
      30008F6130008F6130008F6130008F6130008F6130008F6130008F6130008F61
      30008D5F2E0072441300000000000000000000000000000000008F6130008F61
      30008F6130008F6130008F6130008F6130000064DF006DF1FF006DF1FF000064
      DF008F61300075471600000000000000000000000000000000008F6130008F61
      30008F6130008F6130008F6130006DF1FF006DF1FF008F6130008F6130008F61
      30008557260070421100000000000000000000000000000000008F613000C99B
      6A00C99B6A00C99B6A00C99B6A00C99B6A00C99B6A00C99B6A00C99B6A00C99B
      6A00AB7D4C006C3E0D00000000000000000000000000000000008F613000C99B
      6A00C99B6A00C99B6A00C99B6A00C99B6A00C99B6A00C99B6A00C99B6A00C99B
      6A00AB7D4C006C3E0D00000000000000000000000000000000008F613000C99B
      6A00C99B6A00C99B6A00C99B6A00C99B6A008F6130000064DF000064DF008F61
      3000C49665006F411000000000000000000000000000000000008F613000C99B
      6A00C99B6A00C99B6A008F6130008F6130008F6130008F613000C99B6A00C99B
      6A009D713B006B3D0C00000000000000000000000000000000008F613000C99B
      6A00C99B6A00C4966500C7996800C99B6A00C99B6A00C99B6A00C89A6900B284
      5300885A290065370600000000000000000000000000000000008F613000C99B
      6A00C99B6A00C4966500C7996800C99B6A00C99B6A00C99B6A00C89A6900B284
      5300885A290065370600000000000000000000000000000000008F613000C99B
      6A00C99B6A00C3956400C4966500C4966500C89A6900C99B6A00C99B6A00C99B
      6A009567360066380700000000000000000000000000000000008F613000C99B
      6A00C99B6A00B98B5A00BD915F00C4966500C99B6A00C99B6A00C3956400AB7D
      4C008355240065370600000000000000000000000000000000008F6130008658
      2700794B1A007244130072441300724413007244130072441300724413006C3E
      0D006537060065370600000000000000000000000000000000008F6130008658
      2700794B1A007244130072441300724413007244130072441300724413006C3E
      0D006537060065370600000000000000000000000000000000008F6130008658
      2700794B1A007244130072441300734514007446150076481700774918007143
      12006537060065370600000000000000000000000000000000008F6130008658
      2700794B1A007345140074461500764817007749180076481700744615006E40
      0F00653706006537060000000000000000000000000000000000845625007345
      1400673908006537060065370600653706006537060065370600653706006537
      0600653706006537060000000000000000000000000000000000845625007345
      1400673908006537060065370600653706006537060065370600653706006537
      0600653706006537060000000000000000000000000000000000845625007345
      1400673908006537060065370600653706006537060065370600653706006537
      0600653706006537060000000000000000000000000000000000845625007345
      1400673908006537060065370600653706006537060065370600653706006537
      0600653706006537060000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000600100000100010000000000000B00000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFFFFFFFC3FFC3F8001FFFF
      F42FF42F8001FFFFE007E0078001FFFFC003C0038001FFFFE007E0078001FFFF
      800180018001FFFF800180018001FFFF800180018001FFFF800180018001FFFF
      E007E0078001FFFFC003C0038001FFFFE007E0078001FFFFF42FF42F8001FFFF
      FC3FFC3F8001FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3F
      800180018001F42F80018001BC01E007C003C003BC01C003C003C003B401E007
      E007E007E7818001E007E007C0818001F00FF00F80818001F00FF00FC0818001
      F81FF81FE781E007F81FF81FB401C003FC3FFC3FBC01E007FC3FFC3FBC01F42F
      FE7FFE7F8001FC3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0038001FC7FFE7F
      C0038001FC7FFE7FC0038001FC7FFC3FC0038001FC7FFC3FC0038001FC7FF81F
      E0078001FC7FF81FE0078001FC7FF00FF00F8001FC7FF00FFC3F8001FC7FE007
      F81F8001FC73C003F81F8001D803F81FF81F8001C003FC3FF81F8001E003FE7F
      FC3F8001FC33FE7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80458045FC3F8C63
      80458045F42F8C639FFF9FFFE007DEF79FFF9FFFC003C00798459845E007FEFF
      984598458001800399FF99FF8001800399FF99FF800180038045804580018003
      80458045E00780039FFF9FFFC00380039FFF9FFFE007800380458045F42F8003
      80458045FC3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3FFC3FFF01FC3F
      F42FF42FC301F5AFE007E007C301E997C003C003C001DFFBE007E007C001EFF7
      80018001C0018FF180018001C001BFFD80018001C001BFFD80018001C0018FF1
      E007E007C001EFF7C003C003C001DFFBE007E007C003E997F42FF42FC003F5AF
      FC3FFC3FFFFFFC3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3F
      80010000FFBFF42F80010000FF3FE007C0030000FE2FC003C0030000E037E007
      E0070000E0378001E0070000E0378001F00F0000E0378001F00F0000E0378001
      F81F0000E037E007F81F0000FE2FC003FC3F0000FF3FE007FC3F0000FFBFF42F
      FE7F0000FFFFFC3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF777FFFFFFFFFFFF
      E223FFFF8001FF9FC889E7F38001FF1FDDDDCFF9C003F81FFFFFDFFDC003E007
      E013D9FDE007C003CC89D9DDE0078001CC99DFDDF00F8001E099DF05F00F8001
      FC89DFDDF81F8001E193CFD9F81FC003FF9FE7F3FC3FE007FF1FFFFFFC3FF81F
      FFFFFFFFFE7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8001FF80FFFF
      FC0180010180FC01FC0180010180FC01FC0180010180FC01F40180010000F401
      E60180010180E781C00180010180C0818001800101808081C00180010180C081
      E60180010000E781F40180010180F401FC0180010180FC01FC0180010180FC01
      FC01800101FFFC01FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF01FF01FE7F
      FFFFC301C301FC3FFEFFC301C301FC3FFEFFC001C001FC3FF83FC001C001FC3F
      FEFFC001C001F81FFEFFC001C001F00FFC7FC001C001E007FBBFC001C001E007
      F7DFC001C001E007F7DFC001C001E007F7DFC003C003E007FBBFC003C003F00F
      FC7FFFFFFFFFF81FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFEC378807C0278827CFF3C9038103C903DFFB
      C1038103C103DFFBC103C103C103DFFBC107F903C103DFFBE303C327E327DFFB
      E303FF3FE33FDFFB8207FE3F823FCFF3FFFFFFFFFFFFEFF7FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFFFFFFFFFFFFFFF9F
      803F803F9FFF9F01803F803F8FFF8F01803F803FC7FFC79F802F802FE41FE41F
      81E781E7F80FF80F81038103F007F00781018101F007F00781038103F007F007
      81E781E7F007F007802F802FF007F007803F803FF80FF80F803F803FFC1FFC1F
      803F803FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      8001800180018001800180018001800180018001800180018001800180018001
      8001800180018001800180018001800180018001800180018001800180018001
      8001800180018001800180018001800180018001800180018001800180018001
      8001800180018001FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7FFFFFFFFFFFFF
      FC3FFFFF3FFF87FFFC3FFFFF1FFF87FFFC3FFF3F8FFF80FFFC3FFF1FC83F80BF
      F81FE00FF01F809FF00FE007E38F800FE007E007E7CF800FE007E00FE7CF809F
      E007FF1FE7CF80BFE007FF3FE38F80FFE007FFFFF01F80FFF00FFFFFF83F80FF
      F81FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7F
      83FF8001FC3FFC3F83FF8001F00FFC3F83FF8001E007FC3F80FF8001E007FC3F
      80FF8001C003F81F80FF8001C003F3CF80078001C003E7E780078001C003EFF7
      80078001E007EFF780018001E007EFF780018001F00FE7E780018001FC3FF7EF
      80018001FFFFF81FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF800180018001FFFF
      800180018001C3FF800180018001C3FF800180018001C07F800180018001C05F
      800180018001C04F800180018001C007800180018001C007800180018001C04F
      800180018001C05F800180018001C07F800180018001C07F800180018001C07F
      800180018001FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC003FFFFFFFF8001
      C003C001C3C38001C003C001C3C38001F81FC001C0038001C003C001C0038001
      C003C001C0038001C003C001C0038001C003C001C0038001C003C001C0038001
      C003C001C0038001C023C001C0038001C003C001C0038001C003C001C0038001
      C003FFFFFFFF8001FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8045FE7FFFFF
      80018045FC3FFFFF80019FFFFC3FE00780019FFFFC3FE00780019845FC3FE007
      80019845F81FE007800199FFF00FE007800199FFE007E00780018045E007E007
      80018045E007E00780019FFFE007F3CF80019FFFE007F3CF80018045F00FF99F
      80018045F81FFC3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFFFFFFF87FFF3
      FFFF9FFF9F039F01E7E78FFF8E018F00E3C7C7FFC601C7F3F18FE41FE401E417
      F81FF80FF801F80FFC3FF007F003F007FC3FF007F007F007F81FF007F007F007
      F18FF007F007F007E3C7F007F007F007E7E7F80FF80FF80FFFFFFC1FFC1FFC1F
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF01FF01FFFFFFFFFF01FF01
      C3C3C3C3C301C301DFFBC3C3C301C301DFFBC003C001C001DFFBC003C001C001
      FFFFC003C001C001FFFFC003C001C001FFFFC003C001C001FFFFC003C003C003
      DFFBC003C003C003DFFBC003C003C003DFFBC003C003C003C3C3C003C003C003
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      F81FF81FFFFFCFCFF00FF00FC003C787E007E007DFFBE387C003C003DFFBF1CF
      C003C003DFFBF8FFC003C003DFFBFC7FC003C003DFFBFE3FC003C003DFFBFF1F
      C003C003C003F38FE007E007C003E1C7F00FF00FC003E1E3F81FF81FFFFFF3F3
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC003C003C003C003
      C003C003C003C003CFE3CFE3C3F3C813CA03C803C1F3C813CFC3C8C3C8F3C813
      CA03C803CC03C813CF83C883CE03C813CA03C803CE03C813CF03CF03CE03C813
      C003C003C003C003C003C003C003C003C003C003C003C003C003C003C003C003
      C003C003C003C003FFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object LocalTimerSearch: TTimer
    Enabled = False
    Interval = 200
    OnTimer = LocalTimerSearchTimer
    Left = 56
    Top = 184
  end
  object PopupMenu3: TPopupMenu
    Images = ImageList1
    Left = 760
    Top = 128
    object ExpandAll1: TMenuItem
      Caption = 'Menu_ExpandAll'
      ImageIndex = 17
      OnClick = ExpandAll1Click
    end
    object CollapseAll1: TMenuItem
      Caption = 'Menu_CollapseAll'
      ImageIndex = 17
      OnClick = CollapseAll1Click
    end
    object N13: TMenuItem
      Caption = '-'
    end
    object ShowRecStruct1: TMenuItem
      Caption = 'ShowRecStruct'
      OnClick = ShowRecStruct1Click
    end
  end
  object TimerLD: TTimer
    Enabled = False
    Interval = 250
    OnTimer = TimerLDTimer
    Left = 208
    Top = 152
  end
  object PopupMenu4: TPopupMenu
    Images = ImageList1
    OnPopup = PopupMenu4Popup
    Left = 856
    Top = 128
    object menueditsst1: TMenuItem
      Caption = 'menu_editsst'
      Enabled = False
      ImageIndex = 52
      OnClick = menueditsst1Click
    end
    object menuApplysst1: TMenuItem
      Caption = 'menu_Applysst'
      Enabled = False
      ImageIndex = 55
      OnClick = ToolButton35Click
    end
    object N23: TMenuItem
      Caption = '-'
    end
    object menuReverseSST1: TMenuItem
      Caption = 'menu_ReverseSST'
      Enabled = False
      ImageIndex = 74
      OnClick = menuReverseSST1Click
    end
    object N10: TMenuItem
      Caption = '-'
    end
    object MenuAddFolder1: TMenuItem
      Caption = 'menu_AddFolder'
      ImageIndex = 21
      OnClick = MenuAddFolder1Click
    end
    object MenurenameFolder1: TMenuItem
      Caption = 'menu_renameFolder'
      ImageIndex = 21
      OnClick = MenurenameFolder1Click
    end
    object MenuDeleteEmpty1: TMenuItem
      Caption = 'menu_DeleteEmptyFolder'
      ImageIndex = 21
      OnClick = MenuDeleteEmpty1Click
    end
    object N32: TMenuItem
      Caption = '-'
    end
    object MenuExpandAll1: TMenuItem
      Caption = 'Menu_ExpandAll'
      ImageIndex = 17
      OnClick = MenuExpandAll1Click
    end
    object MenuCollapseAll1: TMenuItem
      Caption = 'Menu_CollapseAll'
      ImageIndex = 17
      OnClick = MenuCollapseAll1Click
    end
    object N31: TMenuItem
      Caption = '-'
    end
    object menuDelete1: TMenuItem
      Caption = 'menu_deletesst'
      Enabled = False
      ImageIndex = 12
      OnClick = menuDelete1Click
    end
  end
  object SynEditSearch1: TSynEditSearch
    Left = 312
    Top = 120
  end
  object TimerSearchPex: TTimer
    Enabled = False
    Interval = 300
    OnTimer = TimerSearchPexTimer
    Left = 144
    Top = 192
  end
  object ImageList3: TImageList
    BlendColor = clWhite
    DrawingStyle = dsTransparent
    Left = 208
    Top = 96
    Bitmap = {
      494C01010100DC09040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008F6130008F613000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008F61300000F3FD008F6130000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008F61
      30008F6130008F6130008F6130008F6130008F61300000F3FD0000F3FD008F61
      3000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008F61
      300000F3FD0000F3FD0000F3FD0000F3FD0000F3FD0000F3FD0000F3FD0000F3
      FD008F6130000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008F61
      300000F3FD0000F3FD0000F3FD0000F3FD0000F3FD0000F3FD0000F3FD0000F3
      FD008F6130000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008F61
      30008F6130008F6130008F6130008F6130008F61300000F3FD0000F3FD008F61
      3000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008F61300000F3FD008F6130000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008F6130008F613000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFF000000000000FFFF000000000000
      FFFF000000000000FFFF000000000000FF3F000000000000FF1F000000000000
      E00F000000000000E007000000000000E007000000000000E00F000000000000
      FF1F000000000000FF3F000000000000FFFF000000000000FFFF000000000000
      FFFF000000000000FFFF00000000000000000000000000000000000000000000
      000000000000}
  end
  object SearchMenu: TPopupMenu
    Images = ImageList1
    Left = 296
    Top = 192
    object Menu_Search_Source: TMenuItem
      Caption = 'Search_Source'
      ImageIndex = 26
      OnClick = Menu_Search_SourceClick
    end
    object Menu_Search_Dest: TMenuItem
      Tag = 1
      Caption = 'Search_Dest'
      ImageIndex = 25
      OnClick = Menu_Search_SourceClick
    end
    object Menu_Search_Edid: TMenuItem
      Tag = 2
      Caption = 'Search_Edid'
      ImageIndex = 17
      OnClick = Menu_Search_SourceClick
    end
    object Menu_Search_Rec: TMenuItem
      Tag = 3
      Caption = 'Search_Rec'
      ImageIndex = 68
      OnClick = Menu_Search_SourceClick
    end
  end
  object TimerPageControl2: TTimer
    Enabled = False
    Interval = 75
    OnTimer = TimerPageControl2Timer
    Left = 768
    Top = 192
  end
  object PopupMenu5: TPopupMenu
    Images = ImageList1
    Left = 592
    Top = 176
    object N22: TMenuItem
      Tag = -1
      Caption = '-'
    end
    object addPreset2: TMenuItem
      Tag = -1
      Caption = 'addPreset'
      ImageIndex = 73
      OnClick = addPreset1Click
    end
    object clearPreset2: TMenuItem
      Tag = -1
      Caption = 'clearPreset'
      ImageIndex = 73
      OnClick = clearPreset1Click
    end
  end
  object PopupMenu7: TPopupMenu
    Left = 440
    Top = 112
    object ClearLog1: TMenuItem
      Caption = 'ClearLog'
      OnClick = ClearLog1Click
    end
  end
  object TimerFeedback: TTimer
    Enabled = False
    OnTimer = TimerFeedbackTimer
    Left = 984
    Top = 344
  end
  object TimerFontResize: TTimer
    Enabled = False
    Interval = 500
    OnTimer = TimerFontResizeTimer
    Left = 984
    Top = 416
  end
  object TimerTheme: TTimer
    Enabled = False
    OnTimer = TimerThemeTimer
    Left = 572
    Top = 443
  end
  object Timer_AutoSave: TTimer
    Enabled = False
    Interval = 10000
    OnTimer = Timer_AutoSaveTimer
    Left = 348
    Top = 422
  end
  object PopupWarning: TPopupMenu
    Images = ImageList1
    Left = 980
    Top = 171
    object MenuWarn1: TMenuItem
      Tag = 1
      Caption = 'wDialFuzFileMissing'
      Checked = True
      OnClick = MenuWarn1Click
    end
    object MenuWarn2: TMenuItem
      Tag = 2
      Caption = 'wDialNpcMissing'
      Checked = True
      OnClick = MenuWarn1Click
    end
    object MenuWarn3: TMenuItem
      Tag = 3
      Caption = 'wLowWarning'
      Checked = True
      OnClick = MenuWarn1Click
    end
    object MenuWarn4: TMenuItem
      Tag = 4
      Caption = 'wWarning'
      Checked = True
      OnClick = MenuWarn1Click
    end
    object MenuWarn5: TMenuItem
      Tag = 5
      Caption = 'wHighWarning'
      Checked = True
      OnClick = MenuWarn1Click
    end
    object MenuWarn6: TMenuItem
      Tag = 6
      Caption = 'wOrphanStrings'
      Checked = True
      OnClick = MenuWarn1Click
    end
    object MenuWarn7: TMenuItem
      Tag = 7
      Caption = 'wSharedIDStrings'
      Checked = True
      OnClick = MenuWarn1Click
    end
    object MenuWarn8: TMenuItem
      Tag = 8
      Caption = 'wAliasWarning'
      Checked = True
      OnClick = MenuWarn1Click
    end
    object MenuWarn9: TMenuItem
      Tag = 9
      Caption = 'wStringSizeWarning'
      Checked = True
      OnClick = MenuWarn1Click
    end
    object MenuWarnA: TMenuItem
      Tag = 10
      Caption = 'wLineBreakWarning'
      Checked = True
      OnClick = MenuWarn1Click
    end
    object MenuWarnB: TMenuItem
      Tag = 11
      Caption = 'wUnusedInSST'
      Checked = True
      OnClick = MenuWarn1Click
    end
    object N28: TMenuItem
      Caption = '-'
    end
    object MenuWarnCheck: TMenuItem
      Caption = 'Hint_VocabSel'
      OnClick = MenuWarnCheckClick
    end
    object MenuWarnUnCheck: TMenuItem
      Caption = 'Hint_VocabUnSel'
      OnClick = MenuWarnUnCheckClick
    end
  end
  object TimerVocabSearch: TTimer
    Enabled = False
    Interval = 200
    OnTimer = TimerVocabSearchTimer
    Left = 724
    Top = 415
  end
end
