object frmProveedoresUt: TfrmProveedoresUt
  Left = 0
  Top = 0
  Caption = 'Proveedores'
  ClientHeight = 371
  ClientWidth = 507
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
    Left = 2
    Top = 1
    Width = 503
    Height = 368
    ActivePage = ts1
    TabOrder = 0
    object ts1: TTabSheet
      Caption = 'Datos Proveedor'
      ExplicitWidth = 413
      ExplicitHeight = 297
      object pnl2: TPanel
        Left = 3
        Top = 3
        Width = 478
        Height = 41
        Caption = 'MANTENIMIENTO DE PROVEEDORES'
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
      end
      object dbnvgr2: TDBNavigator
        Left = 3
        Top = 294
        Width = 472
        Height = 42
        DataSource = dsProveedor
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel]
        ConfirmDelete = False
        TabOrder = 1
      end
      object grp3: TGroupBox
        Left = 3
        Top = 50
        Width = 478
        Height = 238
        Caption = 'Datos Rapidos'
        TabOrder = 2
        object lbl12: TLabel
          Left = 14
          Top = 28
          Width = 90
          Height = 13
          Caption = 'Codigo Proveedor:'
        end
        object lbl13: TLabel
          Left = 14
          Top = 58
          Width = 94
          Height = 13
          Caption = 'Nombre Proveedor:'
        end
        object lbl14: TLabel
          Left = 14
          Top = 85
          Width = 85
          Height = 13
          Caption = 'Ciudad Ubicacion:'
        end
        object lbl15: TLabel
          Left = 15
          Top = 114
          Width = 47
          Height = 13
          Caption = 'Direccion:'
        end
        object lbl16: TLabel
          Left = 14
          Top = 141
          Width = 70
          Height = 13
          Caption = 'Nro. Telefono:'
        end
        object dbedtCodArt: TDBEdit
          Left = 163
          Top = 21
          Width = 138
          Height = 26
          DataField = 'CODPROVEEDOR'
          DataSource = dsProveedor
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object dbeNomProv: TDBEdit
          Left = 114
          Top = 55
          Width = 275
          Height = 21
          CharCase = ecUpperCase
          DataField = 'NOMBREPROVEEDOR'
          DataSource = dsProveedor
          TabOrder = 1
        end
        object cbxCiudad: TDBLookupComboboxEh
          Left = 117
          Top = 82
          Width = 158
          Height = 23
          DataField = 'CODCIUDADPRO'
          DataSource = dsProveedor
          EditButtons = <>
          KeyField = 'CODCIUDAD'
          ListField = 'NOMBRECIUDAD'
          ListSource = dsCiudad
          TabOrder = 2
          Visible = True
        end
        object dbeDireccion: TDBEdit
          Left = 117
          Top = 111
          Width = 275
          Height = 21
          DataField = 'DIRECCION'
          DataSource = dsProveedor
          TabOrder = 3
        end
        object dbeTel: TDBEdit
          Left = 117
          Top = 138
          Width = 137
          Height = 21
          DataField = 'TELEFONO'
          DataSource = dsProveedor
          TabOrder = 4
        end
      end
    end
    object ts2: TTabSheet
      Caption = 'Consulta Proveedor'
      ImageIndex = 1
      ExplicitWidth = 769
      ExplicitHeight = 293
      object DBGridEh2: TDBGridEh
        Left = 3
        Top = 3
        Width = 763
        Height = 287
        DataGrouping.GroupLevels = <>
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
        Columns = <
          item
            EditButtons = <>
            FieldName = 'ID'
            Footers = <>
            Title.Caption = 'Cod. Articulo'
            Width = 70
          end
          item
            EditButtons = <>
            FieldName = 'PRODUCTO'
            Footers = <>
            Title.Caption = 'Articulo'
          end
          item
            EditButtons = <>
            FieldName = 'U_MEDIDA'
            Footers = <>
            Title.Caption = 'Unid. Medida'
          end
          item
            EditButtons = <>
            FieldName = 'RAMOS'
            Footers = <>
            Title.Caption = 'Ramos'
          end
          item
            EditButtons = <>
            FieldName = 'PROVEE'
            Footers = <>
            Title.Caption = 'Proveedor'
          end
          item
            EditButtons = <>
            FieldName = 'PRECIO_COMPRA'
            Footers = <>
            Title.Caption = 'Precio Compra'
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
  end
  object dsProveedor: TDataSource
    DataSet = cdsProveedor
    Left = 48
    Top = 32
  end
  object pvProveedor: TDataSetProvider
    DataSet = qryProveedor
    Left = 112
    Top = 32
  end
  object cdsProveedor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pvProveedor'
    Left = 144
    Top = 32
  end
  object qryProveedor: TIBQuery
    Database = DataModule1.DMBaseDatos
    Transaction = DataModule1.DMTransaction
    SQL.Strings = (
      'select * from PROVEEDOR order by CODPROVEEDOR')
    Left = 72
    Top = 32
    object cdsSQLProveedorCODPROVEEDOR: TIntegerField
      FieldName = 'CODPROVEEDOR'
      Origin = '"PROVEEDOR"."CODPROVEEDOR"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object tbSQLProveedorNOMBREPROVEEDOR: TIBStringField
      FieldName = 'NOMBREPROVEEDOR'
      Origin = '"PROVEEDOR"."NOMBREPROVEEDOR"'
      FixedChar = True
      Size = 30
    end
    object tbSQLProveedorTELEFONO: TIBStringField
      FieldName = 'TELEFONO'
      Origin = '"PROVEEDOR"."TELEFONO"'
      FixedChar = True
      Size = 10
    end
    object tbSQLProveedorRUC: TIBStringField
      FieldName = 'RUC'
      Origin = '"PROVEEDOR"."RUC"'
      FixedChar = True
      Size = 10
    end
    object tbSQLProveedorMAIL: TIBStringField
      FieldName = 'MAIL'
      Origin = '"PROVEEDOR"."MAIL"'
      FixedChar = True
      Size = 10
    end
    object tbSQLProveedorWEB: TIBStringField
      FieldName = 'WEB'
      Origin = '"PROVEEDOR"."WEB"'
      FixedChar = True
      Size = 30
    end
    object tbSQLProveedorDIRECCION: TIBStringField
      FieldName = 'DIRECCION'
      Origin = '"PROVEEDOR"."DIRECCION"'
      FixedChar = True
    end
    object cdsSQLProveedorCODCIUDADPRO: TIntegerField
      FieldName = 'CODCIUDADPRO'
      Origin = '"PROVEEDOR"."CODCIUDADPRO"'
    end
  end
  object qryCiudad: TIBQuery
    Database = DataModule1.DMBaseDatos
    Transaction = DataModule1.DMTransaction
    SQL.Strings = (
      'select *  from CIUDAD order by CODCIUDAD')
    Left = 312
    Top = 8
  end
  object dsCiudad: TDataSource
    DataSet = qryCiudad
    Left = 300
  end
end
