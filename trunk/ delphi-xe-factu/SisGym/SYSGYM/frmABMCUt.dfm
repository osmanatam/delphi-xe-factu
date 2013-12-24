inherited frmBaseABMC: TfrmBaseABMC
  BorderStyle = bsDialog
  Caption = 'frmBaseABMC'
  ClientHeight = 383
  ClientWidth = 758
  OnClose = FormClose
  OnCreate = FormCreate
  ExplicitWidth = 764
  ExplicitHeight = 411
  PixelsPerInch = 96
  TextHeight = 13
  object pnlCabecera: TPanel
    Left = 0
    Top = 0
    Width = 758
    Height = 33
    Align = alTop
    TabOrder = 0
  end
  object pnlPie: TPanel
    Left = 0
    Top = 343
    Width = 758
    Height = 40
    Align = alBottom
    Color = clInactiveCaption
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      758
      40)
    object btnPrimero: TSpeedButton
      Left = 423
      Top = 10
      Width = 74
      Height = 25
      Cursor = crHandPoint
      Hint = 'Al primer registro'
      Anchors = [akTop]
      Caption = '&Primero'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = btnMoverRegistros
      ExplicitLeft = 417
    end
    object btnAnterior: TSpeedButton
      Left = 500
      Top = 10
      Width = 74
      Height = 25
      Cursor = crHandPoint
      Hint = 'Registro anterior'
      Anchors = [akTop]
      Caption = '&Anterior'
      Flat = True
      ParentShowHint = False
      ShowHint = True
      OnClick = btnMoverRegistros
      ExplicitLeft = 493
    end
    object btnSiguiente: TSpeedButton
      Left = 576
      Top = 10
      Width = 74
      Height = 25
      Cursor = crHandPoint
      Hint = 'Registro siguiente'
      Anchors = [akTop]
      Caption = '&Siguiente'
      Flat = True
      ParentShowHint = False
      ShowHint = True
      OnClick = btnMoverRegistros
      ExplicitLeft = 568
    end
    object btnUltimo: TSpeedButton
      Left = 653
      Top = 10
      Width = 74
      Height = 25
      Cursor = crHandPoint
      Hint = 'Al '#250'ltimo registro'
      Anchors = [akTop]
      Caption = '&Ultimo'
      Flat = True
      ParentShowHint = False
      ShowHint = True
      OnClick = btnMoverRegistros
      ExplicitLeft = 644
    end
    object btnNuevoGrabar: TButton
      Left = 21
      Top = 8
      Width = 96
      Height = 26
      Caption = 'Nuevo'
      TabOrder = 0
      Visible = False
      OnClick = btnAcciones
    end
    object btnEditar: TButton
      Left = 119
      Top = 8
      Width = 96
      Height = 26
      Caption = 'Editar'
      TabOrder = 1
      Visible = False
      OnClick = btnAcciones
    end
    object btnEliminar: TButton
      Left = 217
      Top = 8
      Width = 96
      Height = 26
      Caption = 'Elininar'
      TabOrder = 2
      Visible = False
      OnClick = btnAcciones
    end
  end
  object pgcBase: TPageControl
    Left = 0
    Top = 33
    Width = 758
    Height = 310
    ActivePage = tsConsulta
    Align = alClient
    TabOrder = 2
    OnChange = pgcBaseChange
    object tsConsulta: TTabSheet
      Caption = '&Consulta'
      object pnlPnlParametrosBus: TPanel
        Left = 0
        Top = 0
        Width = 750
        Height = 77
        Align = alTop
        ParentBackground = False
        TabOrder = 0
      end
      object pnlBuscar: TPanel
        Left = 0
        Top = 77
        Width = 750
        Height = 44
        Align = alTop
        Color = clMoneyGreen
        ParentBackground = False
        TabOrder = 1
        Visible = False
        DesignSize = (
          750
          44)
        object btnMostrar: TBitBtn
          Left = 87
          Top = 4
          Width = 614
          Height = 35
          Anchors = [akLeft, akTop, akRight]
          Caption = '&Buscar'
          DoubleBuffered = True
          ParentDoubleBuffered = False
          TabOrder = 0
          OnClick = btnMostrarClick
        end
      end
      object dbGrillaConsulta: TDBGridEh
        Left = 0
        Top = 121
        Width = 750
        Height = 161
        Align = alClient
        AllowedOperations = []
        DataGrouping.GroupLevels = <>
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        FooterColor = clMoneyGreen
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clBlack
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = [fsBold]
        IndicatorOptions = [gioShowRowIndicatorEh]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        SortLocal = True
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clMaroon
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        UseMultiTitle = True
        VTitleMargin = 6
        OnDblClick = dbGrillaConsultaDblClick
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
    object tsMantenimiento: TTabSheet
      Caption = '&Mantenimiento'
      ImageIndex = 1
    end
  end
  object qryCabecera: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmIniDatos.conAccesoBD
    Left = 400
    Top = 48
  end
  object pvdCabecera: TDataSetProvider
    DataSet = qryCabecera
    Left = 424
    Top = 48
  end
  object cdsCabecera: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pvdCabecera'
    Left = 448
    Top = 48
  end
  object dsCabecera: TDataSource
    DataSet = cdsCabecera
    OnStateChange = dsCabeceraStateChange
    Left = 472
    Top = 48
  end
  object qryDetalle: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmIniDatos.conAccesoBD
    Left = 400
    Top = 200
  end
  object pvdDetalle: TDataSetProvider
    DataSet = qryDetalle
    Left = 424
    Top = 200
  end
  object cdsDetalle: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pvdDetalle'
    Left = 448
    Top = 200
  end
  object dsDetalle: TDataSource
    DataSet = cdsDetalle
    Left = 472
    Top = 200
  end
end
