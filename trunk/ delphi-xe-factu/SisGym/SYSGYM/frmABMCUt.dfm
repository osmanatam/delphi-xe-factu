inherited frmBaseABMC: TfrmBaseABMC
  Caption = 'frmBaseABMC'
  ClientHeight = 373
  ClientWidth = 748
  ExplicitWidth = 764
  ExplicitHeight = 411
  PixelsPerInch = 96
  TextHeight = 13
  object pnlCabecera: TPanel
    Left = 0
    Top = 0
    Width = 748
    Height = 33
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 553
  end
  object pnlPie: TPanel
    Left = 0
    Top = 333
    Width = 748
    Height = 40
    Align = alBottom
    Color = clInactiveCaption
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 320
    ExplicitWidth = 553
    DesignSize = (
      748
      40)
    object btnPrimero: TSpeedButton
      Left = 417
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
    end
    object btnAnterior: TSpeedButton
      Left = 493
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
    end
    object btnSiguiente: TSpeedButton
      Left = 568
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
    end
    object btnUltimo: TSpeedButton
      Left = 644
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
    end
    object btnNuevoGrabar: TButton
      Left = 21
      Top = 8
      Width = 96
      Height = 26
      Caption = 'Nuevo'
      TabOrder = 0
      OnClick = btnAcciones
    end
    object btnEditar: TButton
      Left = 119
      Top = 8
      Width = 96
      Height = 26
      Caption = 'Editar'
      TabOrder = 1
    end
    object btnEliminar: TButton
      Left = 217
      Top = 8
      Width = 96
      Height = 26
      Caption = 'Elininar'
      TabOrder = 2
    end
  end
  object pgc1: TPageControl
    Left = 0
    Top = 33
    Width = 748
    Height = 300
    ActivePage = tsConsulta
    Align = alClient
    TabOrder = 2
    ExplicitHeight = 287
    object tsConsulta: TTabSheet
      Caption = '&Consulta'
      ExplicitHeight = 259
      object pnlPnlParametrosBus: TPanel
        Left = 0
        Top = 0
        Width = 740
        Height = 77
        Align = alTop
        ParentBackground = False
        TabOrder = 0
        ExplicitTop = 39
      end
      object pnlBuscar: TPanel
        Left = 0
        Top = 77
        Width = 740
        Height = 44
        Align = alTop
        Color = clMoneyGreen
        ParentBackground = False
        TabOrder = 1
        Visible = False
        DesignSize = (
          740
          44)
        object btnMostrar: TBitBtn
          Left = 87
          Top = 4
          Width = 604
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
        Width = 740
        Height = 151
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
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
    object tsMantenimiento: TTabSheet
      Caption = '&Mantenimiento'
      ImageIndex = 1
      ExplicitHeight = 259
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
