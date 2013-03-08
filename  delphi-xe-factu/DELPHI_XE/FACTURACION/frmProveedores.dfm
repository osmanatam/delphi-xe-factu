object frmProveedoresUt: TfrmProveedoresUt
  Left = 0
  Top = 0
  Caption = 'Proveedores'
  ClientHeight = 386
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
    Height = 384
    ActivePage = ts1
    TabOrder = 0
    object ts1: TTabSheet
      Caption = 'Datos Proveedor'
      ExplicitHeight = 340
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
        Top = 311
        Width = 472
        Height = 42
        DataSource = dsProveedor
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel]
        ConfirmDelete = False
        TabOrder = 1
      end
      object grp3: TGroupBox
        Left = 0
        Top = 50
        Width = 478
        Height = 255
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
        object lbl1: TLabel
          Left = 14
          Top = 168
          Width = 25
          Height = 13
          Caption = 'RUC:'
        end
        object lbl2: TLabel
          Left = 14
          Top = 195
          Width = 32
          Height = 13
          Caption = 'E-mail:'
        end
        object lbl3: TLabel
          Left = 14
          Top = 223
          Width = 53
          Height = 13
          Caption = 'Web Page:'
        end
        object lbl4: TLabel
          Left = 228
          Top = 169
          Width = 17
          Height = 13
          Caption = 'DV:'
        end
        object cbxCiudad: TDBLookupComboboxEh
          Left = 117
          Top = 82
          Width = 158
          Height = 21
          DataField = 'CODCIUDADPRO'
          DataSource = dsProveedor
          EditButtons = <>
          KeyField = 'CODCIUDAD'
          ListField = 'NOMBRECIUDAD'
          ListSource = dsCiudad
          TabOrder = 0
          Visible = True
        end
        object edtMailMAIL: TDBEditEh
          Left = 117
          Top = 193
          Width = 272
          Height = 21
          DataField = 'MAIL'
          DataSource = dsProveedor
          EditButtons = <>
          TabOrder = 1
          Visible = True
        end
        object edtMailMAIL1: TDBEditEh
          Left = 117
          Top = 220
          Width = 272
          Height = 21
          DataField = 'WEB'
          DataSource = dsProveedor
          EditButtons = <>
          TabOrder = 2
          Visible = True
        end
        object edtMailMAIL2: TDBEditEh
          Left = 251
          Top = 166
          Width = 33
          Height = 21
          DataField = 'RUC_DV'
          DataSource = dsProveedor
          EditButtons = <>
          TabOrder = 3
          Visible = True
        end
        object edtMailMAIL3: TDBEditEh
          Left = 117
          Top = 166
          Width = 105
          Height = 21
          DataField = 'RUC'
          DataSource = dsProveedor
          EditButtons = <>
          TabOrder = 4
          Visible = True
        end
        object edtMailMAIL4: TDBEditEh
          Left = 120
          Top = 138
          Width = 272
          Height = 21
          DataField = 'TELEFONO'
          DataSource = dsProveedor
          EditButtons = <>
          TabOrder = 5
          Visible = True
        end
        object edtMailMAIL5: TDBEditEh
          Left = 117
          Top = 111
          Width = 272
          Height = 21
          DataField = 'DIRECCION'
          DataSource = dsProveedor
          EditButtons = <>
          TabOrder = 6
          Visible = True
        end
        object edtMailMAIL6: TDBEditEh
          Left = 120
          Top = 55
          Width = 272
          Height = 21
          DataField = 'NOMBREPROVEEDOR'
          DataSource = dsProveedor
          EditButtons = <>
          TabOrder = 7
          Visible = True
        end
        object edtMailNOMBREPROVEEDOR: TDBEditEh
          Left = 186
          Top = 25
          Width = 89
          Height = 24
          DataField = 'CODPROVEEDOR'
          DataSource = dsProveedor
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 8
          Visible = True
        end
      end
    end
    object ts2: TTabSheet
      Caption = 'Consulta Proveedor'
      ImageIndex = 1
      ExplicitHeight = 340
      object DBGridEh2: TDBGridEh
        Left = 3
        Top = 0
        Width = 489
        Height = 353
        DataGrouping.GroupLevels = <>
        DataSource = dsGrillaProveedor
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
            FieldName = 'CODPROVEEDOR'
            Footers = <>
            Title.Caption = 'CODIGO'
          end
          item
            EditButtons = <>
            FieldName = 'NOMBREPROVEEDOR'
            Footers = <>
            Title.Caption = 'PROVEEDOR'
            Width = 151
          end
          item
            EditButtons = <>
            FieldName = 'CONCATENATION'
            Footers = <>
            Title.Caption = 'R.U.C.'
          end
          item
            EditButtons = <>
            FieldName = 'NOMBRECIUDAD'
            Footers = <>
            Title.Caption = 'CIUDAD'
          end
          item
            EditButtons = <>
            FieldName = 'TELEFONO'
            Footers = <>
            Width = 66
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
    object cdsProveedorCODPROVEEDOR2: TIntegerField
      FieldName = 'CODPROVEEDOR'
      Origin = '"PROVEEDOR"."CODPROVEEDOR"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsProveedorNOMBREPROVEEDOR: TWideStringField
      FieldName = 'NOMBREPROVEEDOR'
      Origin = '"PROVEEDOR"."NOMBREPROVEEDOR"'
      FixedChar = True
      Size = 30
    end
    object cdsProveedorTELEFONO: TWideStringField
      FieldName = 'TELEFONO'
      Origin = '"PROVEEDOR"."TELEFONO"'
      FixedChar = True
      Size = 10
    end
    object cdsProveedorRUC: TWideStringField
      FieldName = 'RUC'
      Origin = '"PROVEEDOR"."RUC"'
      FixedChar = True
      Size = 10
    end
    object cdsProveedorRUC_DV: TWideStringField
      FieldName = 'RUC_DV'
      Origin = '"PROVEEDOR"."RUC_DV"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsProveedorMAIL: TWideStringField
      FieldName = 'MAIL'
      Origin = '"PROVEEDOR"."MAIL"'
      FixedChar = True
      Size = 10
    end
    object cdsProveedorWEB: TWideStringField
      FieldName = 'WEB'
      Origin = '"PROVEEDOR"."WEB"'
      FixedChar = True
      Size = 30
    end
    object cdsProveedorDIRECCION: TWideStringField
      FieldName = 'DIRECCION'
      Origin = '"PROVEEDOR"."DIRECCION"'
      FixedChar = True
    end
    object cdsProveedorCODCIUDADPRO2: TIntegerField
      FieldName = 'CODCIUDADPRO'
      Origin = '"PROVEEDOR"."CODCIUDADPRO"'
    end
  end
  object qryProveedor: TIBQuery
    Database = DataModule1.DMBaseDatos
    Transaction = DataModule1.DMTransaction
    SQL.Strings = (
      'select * from PROVEEDOR order by CODPROVEEDOR')
    Left = 72
    Top = 32
    object cdsProveedorCODPROVEEDOR: TIntegerField
      FieldName = 'CODPROVEEDOR'
      Origin = '"PROVEEDOR"."CODPROVEEDOR"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object tbProveedorNOMBREPROVEEDOR: TIBStringField
      FieldName = 'NOMBREPROVEEDOR'
      Origin = '"PROVEEDOR"."NOMBREPROVEEDOR"'
      FixedChar = True
      Size = 30
    end
    object tbProveedorTELEFONO: TIBStringField
      FieldName = 'TELEFONO'
      Origin = '"PROVEEDOR"."TELEFONO"'
      FixedChar = True
      Size = 10
    end
    object tbProveedorRUC: TIBStringField
      FieldName = 'RUC'
      Origin = '"PROVEEDOR"."RUC"'
      FixedChar = True
      Size = 10
    end
    object tbProveedorRUC_DV: TIBStringField
      FieldName = 'RUC_DV'
      Origin = '"PROVEEDOR"."RUC_DV"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object tbProveedorMAIL: TIBStringField
      FieldName = 'MAIL'
      Origin = '"PROVEEDOR"."MAIL"'
      FixedChar = True
      Size = 10
    end
    object tbProveedorWEB: TIBStringField
      FieldName = 'WEB'
      Origin = '"PROVEEDOR"."WEB"'
      FixedChar = True
      Size = 30
    end
    object tbProveedorDIRECCION: TIBStringField
      FieldName = 'DIRECCION'
      Origin = '"PROVEEDOR"."DIRECCION"'
      FixedChar = True
    end
    object cdsProveedorCODCIUDADPRO: TIntegerField
      FieldName = 'CODCIUDADPRO'
      Origin = '"PROVEEDOR"."CODCIUDADPRO"'
    end
  end
  object qryGrillaProv: TIBQuery
    Database = DataModule1.DMBaseDatos
    Transaction = DataModule1.DMTransaction
    SQL.Strings = (
      'SELECT P.CODPROVEEDOR,'
      '        P.NOMBREPROVEEDOR,'
      '        P.TELEFONO,'
      '        P.RUC||'#39'- '#39'||P.RUC_DV,'
      '        C.NOMBRECIUDAD'
      ' FROM PROVEEDOR P JOIN'
      '      CIUDAD C ON P.CODCIUDADPRO=C.CODCIUDAD'
      ' ORDER BY P.CODPROVEEDOR')
    Left = 344
    Top = 32
    object cdsGrillaProvCODPROVEEDOR: TIntegerField
      FieldName = 'CODPROVEEDOR'
      Origin = '"PROVEEDOR"."CODPROVEEDOR"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object tbGrillaProvNOMBREPROVEEDOR: TIBStringField
      FieldName = 'NOMBREPROVEEDOR'
      Origin = '"PROVEEDOR"."NOMBREPROVEEDOR"'
      FixedChar = True
      Size = 30
    end
    object tbGrillaProvTELEFONO: TIBStringField
      FieldName = 'TELEFONO'
      Origin = '"PROVEEDOR"."TELEFONO"'
      FixedChar = True
      Size = 10
    end
    object tbGrillaProvCONCATENATION: TIBStringField
      FieldName = 'CONCATENATION'
      ProviderFlags = []
      Size = 13
    end
    object tbGrillaProvNOMBRECIUDAD: TIBStringField
      FieldName = 'NOMBRECIUDAD'
      Origin = '"CIUDAD"."NOMBRECIUDAD"'
      FixedChar = True
      Size = 15
    end
  end
  object dsGrillaProveedor: TDataSource
    DataSet = qryGrillaProv
    Left = 388
    Top = 24
  end
  object dsCiudad: TDataSource
    DataSet = qryCiudad
    Left = 340
    Top = 152
  end
  object qryCiudad: TIBQuery
    Database = DataModule1.DMBaseDatos
    Transaction = DataModule1.DMTransaction
    SQL.Strings = (
      'select * from CIUDAD order by codciudad')
    Left = 304
    Top = 152
    object cdsCiudadCODCIUDAD: TIntegerField
      FieldName = 'CODCIUDAD'
      Origin = '"CIUDAD"."CODCIUDAD"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object tbCiudadNOMBRECIUDAD: TIBStringField
      FieldName = 'NOMBRECIUDAD'
      Origin = '"CIUDAD"."NOMBRECIUDAD"'
      FixedChar = True
      Size = 15
    end
    object cdsCiudadCODPAIS: TIntegerField
      FieldName = 'CODPAIS'
      Origin = '"CIUDAD"."CODPAIS"'
    end
  end
end
