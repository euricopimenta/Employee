object frmDepartamentos: TfrmDepartamentos
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsNone
  Caption = 'Eurico Pimenta'
  ClientHeight = 475
  ClientWidth = 754
  Color = clMoneyGreen
  TransparentColor = True
  TransparentColorValue = clMoneyGreen
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Roboto'
  Font.Style = []
  Padding.Left = 20
  Padding.Top = 15
  Padding.Right = 20
  Padding.Bottom = 30
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    754
    475)
  PixelsPerInch = 96
  TextHeight = 23
  object Shape1: TShape
    AlignWithMargins = True
    Left = 21
    Top = 6
    Width = 714
    Height = 55
    Margins.Left = 0
    Margins.Top = 15
    Margins.Right = 0
    Margins.Bottom = 0
    Anchors = [akLeft, akTop, akRight]
    Brush.Color = 8490063
    Pen.Style = psClear
    Shape = stRoundRect
    ExplicitWidth = 613
  end
  object shpFooter: TShape
    Left = 20
    Top = 408
    Width = 715
    Height = 62
    Margins.Left = 0
    Margins.Top = 15
    Margins.Right = 0
    Margins.Bottom = 0
    Anchors = [akLeft, akRight, akBottom]
    Brush.Color = 8490063
    Pen.Style = psClear
    Shape = stRoundRect
    ExplicitWidth = 614
  end
  object LBTNSalvar: TLabel
    Left = 566
    Top = 415
    Width = 150
    Height = 53
    Cursor = crHandPoint
    Alignment = taCenter
    Anchors = [akRight, akBottom]
    AutoSize = False
    Caption = 'Salvar'
    Color = 7241761
    Font.Charset = ANSI_CHARSET
    Font.Color = 14869462
    Font.Height = -19
    Font.Name = 'Roboto'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Layout = tlCenter
    OnClick = LBTNSalvarClick
    OnMouseEnter = addEffects
    OnMouseLeave = addEffects
    ExplicitLeft = 465
  end
  object LBTNExcluir: TLabel
    Left = 415
    Top = 416
    Width = 150
    Height = 52
    Cursor = crHandPoint
    Alignment = taCenter
    Anchors = [akRight, akBottom]
    AutoSize = False
    Caption = 'Exclu'#237'r'
    Color = 7307553
    Font.Charset = ANSI_CHARSET
    Font.Color = 14869462
    Font.Height = -19
    Font.Name = 'Roboto'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = True
    Layout = tlCenter
    OnClick = LBTNExcluirClick
    OnMouseEnter = addEffects
    OnMouseLeave = addEffects
    ExplicitLeft = 314
  end
  object pnlClient: TPanel
    AlignWithMargins = True
    Left = 20
    Top = 15
    Width = 714
    Height = 400
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 30
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      714
      400)
    object Label1: TLabel
      Left = 24
      Top = 8
      Width = 27
      Height = 18
      Caption = 'Cod'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
    end
    object Shape2: TShape
      Left = 24
      Top = 32
      Width = 97
      Height = 46
      Brush.Color = 15789546
      Pen.Style = psClear
      Shape = stRoundRect
    end
    object Label2: TLabel
      Left = 136
      Top = 8
      Width = 97
      Height = 18
      Caption = 'Departamento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
    end
    object Shape3: TShape
      Left = 136
      Top = 32
      Width = 321
      Height = 46
      Brush.Color = 15789546
      Pen.Style = psClear
      Shape = stRoundRect
    end
    object Label4: TLabel
      Left = 469
      Top = 8
      Width = 37
      Height = 18
      Caption = 'Local'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
    end
    object Shape4: TShape
      Left = 469
      Top = 32
      Width = 212
      Height = 46
      Anchors = [akLeft, akTop, akRight]
      Brush.Color = 15789546
      Pen.Style = psClear
      Shape = stRoundRect
    end
    object edtCod: TEdit
      Left = 40
      Top = 42
      Width = 65
      Height = 25
      Cursor = crIBeam
      Alignment = taCenter
      AutoSize = False
      BorderStyle = bsNone
      Color = 15855852
      Ctl3D = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Roboto'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object edtNome: TEdit
      Left = 152
      Top = 42
      Width = 289
      Height = 25
      Cursor = crIBeam
      AutoSize = False
      BorderStyle = bsNone
      Color = 15856108
      Ctl3D = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Roboto'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
    end
    object dbgDepto: TDBGrid
      Left = 24
      Top = 104
      Width = 670
      Height = 281
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dtsDepto
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = []
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      TabOrder = 2
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -16
      TitleFont.Name = 'Roboto'
      TitleFont.Style = []
      OnDblClick = dbgDeptoDblClick
    end
    object edtLocal: TEdit
      Left = 483
      Top = 42
      Width = 180
      Height = 25
      Cursor = crIBeam
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      BorderStyle = bsNone
      Color = 15856108
      Ctl3D = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Roboto'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 3
    end
  end
  object dtsDepto: TDataSource
    Left = 652
    Top = 127
  end
end
