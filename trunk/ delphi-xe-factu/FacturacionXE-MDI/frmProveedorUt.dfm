inherited frmProveedor: TfrmProveedor
  Caption = 'Proveedores'
  ClientHeight = 314
  ClientWidth = 585
  ExplicitWidth = 601
  ExplicitHeight = 352
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 585
    Caption = 'Proveedores'
    ExplicitWidth = 641
  end
  inherited PageControl1: TPageControl
    Width = 585
    Height = 281
    ExplicitWidth = 641
    ExplicitHeight = 346
    inherited tgDatos: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 633
      ExplicitHeight = 318
      inherited DBNavigator1: TDBNavigator
        Top = 214
        Width = 577
        DataSource = dsProveedor
        OnClick = DBNavigator1Click
        ExplicitTop = 285
        ExplicitWidth = 577
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 577
        Height = 214
        Align = alClient
        Caption = 'Datos Proveedor'
        Color = cl3DLight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentColor = False
        ParentFont = False
        TabOrder = 1
        ExplicitLeft = 3
        ExplicitTop = -6
        ExplicitHeight = 279
        object Label1: TLabel
          Left = 97
          Top = 21
          Width = 37
          Height = 13
          Align = alCustom
          Caption = 'Codigo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label2: TLabel
          Left = 24
          Top = 53
          Width = 41
          Height = 13
          Align = alCustom
          Caption = 'Nombre:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          Left = 28
          Top = 78
          Width = 37
          Height = 13
          Align = alCustom
          Caption = 'Ciudad:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lbl1: TLabel
          Left = 380
          Top = 51
          Width = 25
          Height = 13
          Align = alCustom
          Caption = 'RUC:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lbl2: TLabel
          Left = 18
          Top = 187
          Width = 47
          Height = 13
          Align = alCustom
          Caption = 'Direccion:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lbl3: TLabel
          Left = 335
          Top = 78
          Width = 32
          Height = 13
          Align = alCustom
          Caption = 'E-mail:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lbl4: TLabel
          Left = 341
          Top = 105
          Width = 26
          Height = 13
          Align = alCustom
          Caption = 'Web:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lbl5: TLabel
          Left = 19
          Top = 105
          Width = 46
          Height = 13
          Align = alCustom
          Caption = 'Telefono:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lbl6: TLabel
          Left = 28
          Top = 132
          Width = 37
          Height = 13
          Align = alCustom
          Caption = 'Celular:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lbl7: TLabel
          Left = 17
          Top = 159
          Width = 48
          Height = 13
          Align = alCustom
          Caption = 'Contacto:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lbl8: TLabel
          Left = 393
          Top = 129
          Width = 120
          Height = 13
          Align = alCustom
          Caption = 'Referencia/Observacion:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object dbeCodProveedor: TDBEdit
          Left = 140
          Top = 16
          Width = 169
          Height = 24
          Align = alCustom
          DataField = 'CODPROVEEDOR'
          DataSource = dsProveedor
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object dbeNombreProveedor: TDBEdit
          Left = 71
          Top = 50
          Width = 296
          Height = 21
          Align = alCustom
          Color = clWhite
          DataField = 'NOMBREPROVEEDOR'
          DataSource = dsProveedor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object dblCiudad: TDBLookupComboboxEh
          Left = 71
          Top = 75
          Width = 210
          Height = 21
          DataField = 'CODCIUDADPRO'
          DataSource = dsProveedor
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          KeyField = 'CODCIUDAD'
          ListField = 'NOMBRECIUDAD'
          ListSource = ds1
          ParentFont = False
          TabOrder = 2
          Visible = True
        end
        object dbeDireccion: TDBEdit
          Left = 71
          Top = 183
          Width = 296
          Height = 21
          Align = alCustom
          Color = clWhite
          DataField = 'DIRECCION'
          DataSource = dsProveedor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object dbeMail: TDBEdit
          Left = 373
          Top = 102
          Width = 192
          Height = 21
          Align = alCustom
          CharCase = ecLowerCase
          Color = clWhite
          DataField = 'MAIL'
          DataSource = dsProveedor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
        object dbePaginaWeb: TDBEdit
          Left = 373
          Top = 75
          Width = 192
          Height = 21
          Align = alCustom
          CharCase = ecLowerCase
          Color = clWhite
          DataField = 'WEB'
          DataSource = dsProveedor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
        end
        object dbeRuc: TDBEdit
          Left = 407
          Top = 48
          Width = 82
          Height = 21
          Align = alCustom
          CharCase = ecUpperCase
          Color = clWhite
          DataField = 'RUC'
          DataSource = dsProveedor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
        end
        object dbeRUCdv: TDBEdit
          Left = 494
          Top = 48
          Width = 22
          Height = 21
          Align = alCustom
          CharCase = ecUpperCase
          Color = clWhite
          DataField = 'RUC_DV'
          DataSource = dsProveedor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
        end
        object dbmmoOBSERVACION: TDBMemo
          Left = 373
          Top = 145
          Width = 192
          Height = 59
          DataField = 'OBSERVACION'
          DataSource = dsProveedor
          TabOrder = 8
        end
        object dbeTelefono: TDBEdit
          Left = 71
          Top = 102
          Width = 210
          Height = 21
          Align = alCustom
          Color = clWhite
          DataField = 'TELEFONO'
          DataSource = dsProveedor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
        end
        object dbeTELEFONO2: TDBEdit
          Left = 71
          Top = 129
          Width = 210
          Height = 21
          Align = alCustom
          Color = clWhite
          DataField = 'TEFEFONO2'
          DataSource = dsProveedor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
        end
        object dbeContacto: TDBEdit
          Left = 71
          Top = 156
          Width = 296
          Height = 21
          Align = alCustom
          Color = clWhite
          DataField = 'CONTACTO'
          DataSource = dsProveedor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 11
        end
      end
    end
    inherited tgConsulta: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 633
      ExplicitHeight = 318
      object DBGridEh1: TDBGridEh
        Left = 0
        Top = 74
        Width = 577
        Height = 179
        Align = alClient
        DataGrouping.GroupLevels = <>
        DataSource = dsProveedor
        Flat = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clBlack
        FooterFont.Height = -11
        FooterFont.Name = 'Tahoma'
        FooterFont.Style = [fsBold]
        IndicatorOptions = [gioShowRowIndicatorEh]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlue
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = [fsBold]
        OnDblClick = DBGridEh1DblClick
        Columns = <
          item
            EditButtons = <>
            FieldName = 'CODPROVEEDOR'
            Footers = <>
            Title.Caption = 'Id'
            Width = 53
          end
          item
            EditButtons = <>
            FieldName = 'NOMBREPROVEEDOR'
            Footers = <>
            Title.Caption = 'Nombre'
            Width = 189
          end
          item
            EditButtons = <>
            FieldName = 'CONTACTO'
            Footers = <>
            Title.Caption = 'Contacto'
            Width = 171
          end
          item
            EditButtons = <>
            FieldName = 'RUC'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'RUC_DV'
            Footers = <>
            Width = 16
          end
          item
            EditButtons = <>
            FieldName = 'DIRECCION'
            Footers = <>
            Title.Caption = 'Direccion'
          end>
        object RowDetailData: TRowDetailPanelControlEh
          object pnl1: TPanel
            Left = -88
            Top = -16
            Width = 185
            Height = 41
            Caption = 'pnl1'
            TabOrder = 0
          end
        end
      end
      object pnl2: TPanel
        Left = 0
        Top = 0
        Width = 577
        Height = 74
        Align = alTop
        TabOrder = 1
      end
    end
  end
  object dsProveedor: TDataSource
    DataSet = cdsProveedor
    Left = 288
    Top = 24
  end
  object qryProveedor: TIBQuery
    Database = DataModule1.DMBaseDatos
    Transaction = DataModule1.DMTransaction
    SQL.Strings = (
      'select * from PROVEEDOR order by codproveedor')
    Left = 192
    Top = 24
  end
  object cdsProveedor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pvProveedor'
    Left = 256
    Top = 24
    object cdsProveedorCODPROVEEDOR: TIntegerField
      FieldName = 'CODPROVEEDOR'
      Required = True
    end
    object cdsProveedorNOMBREPROVEEDOR: TWideStringField
      FieldName = 'NOMBREPROVEEDOR'
      FixedChar = True
      Size = 100
    end
    object cdsProveedorTELEFONO: TWideStringField
      FieldName = 'TELEFONO'
      FixedChar = True
      Size = 15
    end
    object cdsProveedorRUC: TWideStringField
      FieldName = 'RUC'
      Required = True
      FixedChar = True
      Size = 8
    end
    object cdsProveedorRUC_DV: TWideStringField
      FieldName = 'RUC_DV'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsProveedorMAIL: TWideStringField
      FieldName = 'MAIL'
      FixedChar = True
      Size = 70
    end
    object cdsProveedorWEB: TWideStringField
      FieldName = 'WEB'
      FixedChar = True
      Size = 70
    end
    object cdsProveedorDIRECCION: TWideStringField
      FieldName = 'DIRECCION'
      FixedChar = True
      Size = 100
    end
    object cdsProveedorCODCIUDADPRO: TIntegerField
      FieldName = 'CODCIUDADPRO'
    end
    object cdsProveedorOBSERVACION: TWideStringField
      FieldName = 'OBSERVACION'
      FixedChar = True
      Size = 100
    end
    object cdsProveedorTEFEFONO2: TWideStringField
      FieldName = 'TEFEFONO2'
      FixedChar = True
      Size = 15
    end
    object cdsProveedorCONTACTO: TWideStringField
      FieldName = 'CONTACTO'
      FixedChar = True
      Size = 50
    end
  end
  object pvProveedor: TDataSetProvider
    DataSet = qryProveedor
    Left = 224
    Top = 24
  end
  object qryCiudad: TIBQuery
    Database = DataModule1.DMBaseDatos
    Transaction = DataModule1.DMTransaction
    SQL.Strings = (
      'select *  from CIUDAD order by CODCIUDAD')
    Left = 360
    Top = 48
  end
  object ds1: TDataSource
    DataSet = qryCiudad
    Left = 392
    Top = 48
  end
  object dsAux: TDataSource
    DataSet = qryAux
    Left = 444
    Top = 152
  end
  object qryAux: TIBQuery
    Database = DataModule1.DMBaseDatos
    Transaction = DataModule1.DMTransaction
    SQL.Strings = (
      'select max(CODPROVEEDOR) +1 from PROVEEDOR')
    Left = 480
    Top = 152
  end
end
