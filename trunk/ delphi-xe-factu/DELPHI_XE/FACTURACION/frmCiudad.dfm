object frmCiudad2: TfrmCiudad2
  Left = 0
  Top = 0
  Caption = 'Ciudad'
  ClientHeight = 244
  ClientWidth = 474
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgc1: TPageControl
    Left = 8
    Top = 8
    Width = 465
    Height = 233
    ActivePage = tsCONSULTA
    TabOrder = 0
    object tsABM: TTabSheet
      Caption = 'DATOS'
      object lbl1: TLabel
        Left = 30
        Top = 57
        Width = 37
        Height = 13
        Caption = 'Codigo:'
      end
      object lbl2: TLabel
        Left = 30
        Top = 92
        Width = 41
        Height = 13
        Caption = 'Nombre:'
      end
      object lbl3: TLabel
        Left = 30
        Top = 132
        Width = 23
        Height = 13
        Caption = 'Pais:'
      end
      object lblAcciones: TLabel
        Left = 173
        Top = 144
        Width = 3
        Height = 13
        Color = clRed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object dbedtCODCIUDAD: TDBEdit
        Left = 73
        Top = 57
        Width = 121
        Height = 21
        DataField = 'CODCIUDAD'
        DataSource = dsTablaReal
        ReadOnly = True
        TabOrder = 5
      end
      object dbedtNOMBRECIUDAD: TDBEdit
        Left = 77
        Top = 89
        Width = 282
        Height = 21
        DataField = 'NOMBRECIUDAD'
        DataSource = dsTablaReal
        TabOrder = 0
      end
      object pnl1: TPanel
        Left = 3
        Top = 0
        Width = 452
        Height = 41
        Caption = 'pnl1'
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 2
      end
      object dbedtCODPAIS: TDBEdit
        Left = 77
        Top = 129
        Width = 41
        Height = 21
        DataField = 'CODPAIS'
        DataSource = dsTablaReal
        ReadOnly = True
        TabOrder = 3
      end
      object cbxCODPAIS: TDBLookupComboBox
        Left = 124
        Top = 129
        Width = 235
        Height = 21
        DataField = 'CODPAIS'
        DataSource = dsTablaReal
        KeyField = 'CODPAIS'
        ListField = 'NOMBREPAIS'
        ListSource = dsTablaRelacion
        TabOrder = 1
        OnCloseUp = cbxCODPAISCloseUp
      end
      object dbnvgr1: TDBNavigator
        Left = 2
        Top = 163
        Width = 448
        Height = 42
        DataSource = dsTablaReal
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel]
        ConfirmDelete = False
        TabOrder = 4
        OnClick = dbnvgr1Click
      end
      object btn1: TButton
        Left = 362
        Top = 127
        Width = 23
        Height = 25
        Caption = '+'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
        OnClick = btn1Click
      end
    end
    object tsCONSULTA: TTabSheet
      Caption = 'CONSULTAS'
      ImageIndex = 1
      OnEnter = tsCONSULTAEnter
      object DBGridEh1: TDBGridEh
        Left = 0
        Top = 3
        Width = 454
        Height = 199
        DataGrouping.GroupLevels = <>
        DataSource = dsGrilla
        Flat = False
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'Tahoma'
        FooterFont.Style = []
        IndicatorOptions = [gioShowRowIndicatorEh]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = DBGridEh1DblClick
        Columns = <
          item
            EditButtons = <>
            FieldName = 'CODCIUDAD'
            Footers = <>
            Title.Caption = 'Cod. Ciudad'
          end
          item
            EditButtons = <>
            FieldName = 'NOMBRECIUDAD'
            Footers = <>
            Title.Caption = 'Nom. Pais'
            Width = 128
          end
          item
            EditButtons = <>
            FieldName = 'CODPAIS'
            Footers = <>
            Title.Caption = 'Cod. Pais'
            Width = 86
          end
          item
            EditButtons = <>
            FieldName = 'NOMBREPAIS'
            Footers = <>
          end>
        object RowDetailData: TRowDetailPanelControlEh
          object dbnvgr2: TDBNavigator
            Left = -120
            Top = -8
            Width = 240
            Height = 25
            TabOrder = 0
          end
        end
      end
    end
  end
  object dsTablaRelacion: TDataSource
    DataSet = qryTablaRelacion
    Left = 64
    Top = 48
  end
  object qryTablaRelacion: TIBQuery
    Database = DataModule1.DMBaseDatos
    Transaction = DataModule1.DMTransaction
    SQL.Strings = (
      'select CODPAIS, NOMBREPAIS from PAIS')
    Left = 88
    Top = 48
  end
  object dsTablaReal: TDataSource
    DataSet = cdsTablaReal
    Left = 408
    Top = 104
  end
  object dsGrilla: TDataSource
    DataSet = qryGrilla
    Left = 344
    Top = 16
  end
  object qryGrilla: TIBQuery
    Database = DataModule1.DMBaseDatos
    Transaction = DataModule1.DMTransaction
    SQL.Strings = (
      'select CODCIUDAD, NOMBRECIUDAD,CIUDAD.CODPAIS,'
      'PAIS.NOMBREPAIS from CIUDAD JOIN PAIS'
      'ON CIUDAD.CODPAIS=PAIS.CODPAIS'
      'ORDER BY 1')
    Left = 320
    Top = 16
    object cdsSQ2CODCIUDAD: TIntegerField
      FieldName = 'CODCIUDAD'
      Origin = '"CIUDAD"."CODCIUDAD"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object tbSQ2NOMBRECIUDAD: TIBStringField
      FieldName = 'NOMBRECIUDAD'
      Origin = '"CIUDAD"."NOMBRECIUDAD"'
      FixedChar = True
      Size = 15
    end
    object cdsSQ2CODPAIS: TIntegerField
      FieldName = 'CODPAIS'
      Origin = '"CIUDAD"."CODPAIS"'
    end
    object tbSQ2NOMBREPAIS: TIBStringField
      FieldName = 'NOMBREPAIS'
      Origin = '"PAIS"."NOMBREPAIS"'
      Required = True
      FixedChar = True
    end
  end
  object qryTablaReal: TIBQuery
    Database = DataModule1.DMBaseDatos
    Transaction = DataModule1.DMTransaction
    SQL.Strings = (
      'SELECT CODCIUDAD, NOMBRECIUDAD, CODPAIS FROM CIUDAD'
      'ORDER BY 1')
    UniDirectional = True
    Left = 336
    Top = 104
    object cds1: TIntegerField
      FieldName = 'CODCIUDAD'
      Origin = '"CIUDAD"."CODCIUDAD"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object tb1: TIBStringField
      FieldName = 'NOMBRECIUDAD'
      Origin = '"CIUDAD"."NOMBRECIUDAD"'
      FixedChar = True
      Size = 15
    end
    object cds2: TIntegerField
      FieldName = 'CODPAIS'
      Origin = '"CIUDAD"."CODPAIS"'
    end
  end
  object cdsTablaReal: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspvTablaReal'
    Left = 384
    Top = 104
    object cdsTablaRealCODCIUDAD: TIntegerField
      FieldName = 'CODCIUDAD'
      Required = True
    end
    object cdsTablaRealNOMBRECIUDAD: TWideStringField
      FieldName = 'NOMBRECIUDAD'
      FixedChar = True
      Size = 15
    end
    object cdsTablaRealCODPAIS: TIntegerField
      FieldName = 'CODPAIS'
    end
  end
  object dspvTablaReal: TDataSetProvider
    DataSet = qryTablaReal
    Left = 360
    Top = 104
  end
  object qryMaxCodigo: TIBQuery
    Database = DataModule1.DMBaseDatos
    Transaction = DataModule1.DMTransaction
    SQL.Strings = (
      'select max(CODCIUDAD)+1 as codciudad from CIUDAD')
    Left = 208
    Top = 56
  end
end
