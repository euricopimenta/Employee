object frmEmpregados: TfrmEmpregados
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsNone
  Caption = 'Eurico Pimenta'
  ClientHeight = 565
  ClientWidth = 845
  Color = clActiveCaption
  TransparentColor = True
  TransparentColorValue = clActiveCaption
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
    845
    565)
  PixelsPerInch = 96
  TextHeight = 23
  object Shape1: TShape
    AlignWithMargins = True
    Left = 21
    Top = 6
    Width = 805
    Height = 55
    Margins.Left = 0
    Margins.Top = 15
    Margins.Right = 0
    Margins.Bottom = 0
    Anchors = [akLeft, akTop, akRight]
    Brush.Color = 6572072
    Pen.Style = psClear
    Shape = stRoundRect
    ExplicitWidth = 613
  end
  object shpFooter: TShape
    Left = 20
    Top = 498
    Width = 806
    Height = 62
    Margins.Left = 0
    Margins.Top = 15
    Margins.Right = 0
    Margins.Bottom = 0
    Anchors = [akLeft, akRight, akBottom]
    Brush.Color = 6572072
    Pen.Style = psClear
    Shape = stRoundRect
    ExplicitTop = 408
    ExplicitWidth = 614
  end
  object LBTNSalvar: TLabel
    Left = 657
    Top = 505
    Width = 150
    Height = 53
    Cursor = crHandPoint
    Alignment = taCenter
    Anchors = [akRight, akBottom]
    AutoSize = False
    Caption = 'Salvar'
    Color = 5912075
    Font.Charset = ANSI_CHARSET
    Font.Color = 11908777
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
    ExplicitTop = 415
  end
  object LBTNExcluir: TLabel
    Left = 506
    Top = 506
    Width = 150
    Height = 52
    Cursor = crHandPoint
    Alignment = taCenter
    Anchors = [akRight, akBottom]
    AutoSize = False
    Caption = 'Exclu'#237'r'
    Color = 5912075
    Font.Charset = ANSI_CHARSET
    Font.Color = 11908777
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
    ExplicitTop = 416
  end
  object pnlClient: TPanel
    AlignWithMargins = True
    Left = 20
    Top = 15
    Width = 805
    Height = 490
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
      805
      490)
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
      Width = 41
      Height = 18
      Caption = 'Nome'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
    end
    object Shape3: TShape
      Left = 127
      Top = 32
      Width = 507
      Height = 46
      Brush.Color = 15789546
      Pen.Style = psClear
      Shape = stRoundRect
    end
    object Label4: TLabel
      Left = 640
      Top = 8
      Width = 68
      Height = 18
      Caption = 'Admiss'#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
    end
    object Shape4: TShape
      Left = 640
      Top = 32
      Width = 148
      Height = 46
      Brush.Color = 15789546
      Pen.Style = psClear
      Shape = stRoundRect
    end
    object Label3: TLabel
      Left = 21
      Top = 85
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
    object Shape5: TShape
      Left = 24
      Top = 109
      Width = 226
      Height = 46
      Brush.Color = 15789546
      Pen.Style = psClear
      Shape = stRoundRect
    end
    object Label5: TLabel
      Left = 256
      Top = 85
      Width = 51
      Height = 18
      Caption = 'Fun'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
    end
    object Shape6: TShape
      Left = 256
      Top = 109
      Width = 229
      Height = 46
      Brush.Color = 15789546
      Pen.Style = psClear
      Shape = stRoundRect
    end
    object Label6: TLabel
      Left = 491
      Top = 85
      Width = 47
      Height = 18
      Caption = 'Sal'#225'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
    end
    object Shape7: TShape
      Left = 491
      Top = 109
      Width = 153
      Height = 46
      Brush.Color = 15789546
      Pen.Style = psClear
      Shape = stRoundRect
    end
    object Label7: TLabel
      Left = 650
      Top = 85
      Width = 68
      Height = 18
      Caption = 'Comiss'#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
    end
    object Shape8: TShape
      Left = 650
      Top = 109
      Width = 135
      Height = 46
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
      Left = 149
      Top = 42
      Width = 477
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
    object dbgEmpregados: TDBGrid
      Left = 24
      Top = 184
      Width = 761
      Height = 289
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dtsEmpregados
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
      OnDblClick = dbgEmpregadosDblClick
    end
    object dtEditAdmissao: TDateTimePicker
      Left = 650
      Top = 42
      Width = 128
      Height = 25
      Cursor = crHandPoint
      BevelInner = bvNone
      BevelOuter = bvNone
      CalColors.BackColor = 15856108
      CalColors.TextColor = clBlack
      Date = 44613.000000000000000000
      Time = 0.157420486109913300
      Checked = False
      Color = clWhite
      DoubleBuffered = False
      ParentDoubleBuffered = False
      TabOrder = 3
    end
    object dblDepartamentos: TDBLookupComboBox
      Left = 29
      Top = 118
      Width = 215
      Height = 27
      Color = 15856108
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = []
      ListField = 'Departamento'
      ListSource = dtsDepto
      ParentFont = False
      TabOrder = 4
    end
    object dblFuncao: TDBLookupComboBox
      Left = 264
      Top = 118
      Width = 212
      Height = 27
      Color = 15856108
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = []
      ListSource = dtsFuncao
      ParentFont = False
      TabOrder = 5
    end
    object edtSalario: TEdit
      Left = 501
      Top = 120
      Width = 131
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
      TabOrder = 6
    end
    object edtComissao: TEdit
      Left = 650
      Top = 120
      Width = 131
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
      TabOrder = 7
    end
  end
  object dtsEmpregados: TDataSource
    Left = 740
    Top = 199
  end
  object dtsDepto: TDataSource
    Left = 188
    Top = 103
  end
  object dtsFuncao: TDataSource
    Left = 436
    Top = 103
  end
end
