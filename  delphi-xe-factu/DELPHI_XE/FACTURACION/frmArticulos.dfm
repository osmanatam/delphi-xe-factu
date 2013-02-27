object frmArticulosUt: TfrmArticulosUt
  Left = 0
  Top = 0
  Caption = 'Articulos'
  ClientHeight = 331
  ClientWidth = 790
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
  object pgcConsulta: TPageControl
    Left = 8
    Top = 8
    Width = 777
    Height = 321
    ActivePage = tsDatos
    TabOrder = 0
    object tsDatos: TTabSheet
      Caption = 'Datos Articulos'
      object pnl1: TPanel
        Left = 3
        Top = 3
        Width = 761
        Height = 41
        Caption = 'MANTENIMIENTO DE ARTICULOS'
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
      object dbnvgr1: TDBNavigator
        Left = 11
        Top = 248
        Width = 744
        Height = 42
        DataSource = dsArticulo
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel]
        ConfirmDelete = False
        TabOrder = 1
        OnClick = dbnvgr1Click
      end
      object grp1: TGroupBox
        Left = 11
        Top = 50
        Width = 395
        Height = 192
        Caption = 'Datos Rapidos'
        TabOrder = 2
        object lbl6: TLabel
          Left = 14
          Top = 31
          Width = 76
          Height = 13
          Caption = 'Codigo Articulo:'
        end
        object lbl7: TLabel
          Left = 14
          Top = 58
          Width = 97
          Height = 13
          Caption = 'Descripcion Articulo:'
        end
        object lbl8: TLabel
          Left = 14
          Top = 91
          Width = 89
          Height = 13
          Caption = 'Unidad de Medida:'
        end
        object lbl9: TLabel
          Left = 14
          Top = 118
          Width = 59
          Height = 13
          Caption = 'Tipo de IVA:'
        end
        object lbl10: TLabel
          Left = 14
          Top = 145
          Width = 67
          Height = 13
          Caption = 'Familia/Ramo:'
        end
        object dbedtCodArt: TDBEdit
          Left = 175
          Top = 21
          Width = 138
          Height = 26
          DataField = 'CODARTICULO'
          DataSource = dsArticulo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object dbedtNombreArt: TDBEdit
          Left = 117
          Top = 55
          Width = 275
          Height = 21
          CharCase = ecUpperCase
          DataField = 'DESCRIPCION'
          DataSource = dsArticulo
          TabOrder = 1
        end
        object JvDBImage1: TJvDBImage
          Left = 281
          Top = 82
          Width = 111
          Height = 106
          Stretch = True
          TabOrder = 2
          OnClick = JvDBImage1Click
        end
        object cbxUM: TDBLookupComboboxEh
          Left = 117
          Top = 91
          Width = 158
          Height = 21
          DataField = 'CODUNIDADMEDIDA'
          DataSource = dsArticulo
          EditButtons = <>
          KeyField = 'CODUNIDADMEDIDA'
          ListField = 'DESCRIPCION'
          ListSource = dsUM
          TabOrder = 3
          Visible = True
        end
        object cbxIVA: TDBLookupComboboxEh
          Left = 117
          Top = 118
          Width = 158
          Height = 21
          DataField = 'CODTIPOIVA'
          DataSource = dsArticulo
          EditButtons = <>
          KeyField = 'CODTIPOIVA'
          ListField = 'DESCIVA'
          ListSource = dsIVA
          TabOrder = 4
          Visible = True
        end
        object cbxRAMO: TDBLookupComboboxEh
          Left = 117
          Top = 145
          Width = 158
          Height = 21
          DataField = 'CODRAMO'
          DataSource = dsArticulo
          EditButtons = <>
          KeyField = 'CODRAMO'
          ListField = 'DESCRIPCIONRAMO'
          ListSource = dsRAMO
          TabOrder = 5
          Visible = True
        end
      end
      object grp2: TGroupBox
        Left = 412
        Top = 50
        Width = 349
        Height = 192
        Caption = 'Valores'
        TabOrder = 3
        object lbl1: TLabel
          Left = 10
          Top = 21
          Width = 54
          Height = 13
          Caption = 'Proveedor:'
        end
        object lbl2: TLabel
          Left = 10
          Top = 48
          Width = 73
          Height = 13
          Caption = 'Precio Compra:'
        end
        object lbl3: TLabel
          Left = 10
          Top = 75
          Width = 52
          Height = 13
          Caption = 'Existencia:'
        end
        object lbl4: TLabel
          Left = 11
          Top = 102
          Width = 87
          Height = 13
          Caption = 'Existencia Minima:'
        end
        object lbl5: TLabel
          Left = 10
          Top = 150
          Width = 64
          Height = 13
          Caption = 'Observacion:'
        end
        object dbedtPrecioCompra: TDBEdit
          Left = 96
          Top = 45
          Width = 137
          Height = 21
          DataField = 'PRECIOCOMPRA'
          DataSource = dsArticulo
          TabOrder = 0
        end
        object dbedtExistencia: TDBEdit
          Left = 96
          Top = 72
          Width = 137
          Height = 21
          DataField = 'EXISTENCIA'
          DataSource = dsArticulo
          TabOrder = 1
        end
        object dbedtExistenciaMin: TDBEdit
          Left = 104
          Top = 99
          Width = 129
          Height = 21
          DataField = 'EXISTENCIA_MIN'
          DataSource = dsArticulo
          TabOrder = 2
        end
        object dbchkPRECIO_MODIFICABLE: TDBCheckBox
          Left = 239
          Top = 45
          Width = 107
          Height = 25
          Caption = 'Precio Modificable'
          DataField = 'PRECIO_MODIFICABLE'
          DataSource = dsArticulo
          TabOrder = 3
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object dbchkAVISAR_EXIST_MIN: TDBCheckBox
          Left = 239
          Top = 99
          Width = 108
          Height = 25
          Caption = 'Avisar Exist. Min.'
          DataField = 'AVISAR_EXIST_MIN'
          DataSource = dsArticulo
          TabOrder = 4
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object dbmmoOBSERVACION: TDBMemo
          Left = 80
          Top = 126
          Width = 251
          Height = 63
          DataField = 'OBSERVACION'
          DataSource = dsArticulo
          TabOrder = 5
        end
        object cbxPROVEEDOR: TDBLookupComboboxEh
          Left = 96
          Top = 18
          Width = 241
          Height = 21
          DataField = 'CODPROVEEDOR'
          DataSource = dsArticulo
          EditButtons = <>
          KeyField = 'CODPROVEEDOR'
          ListField = 'NOMBREPROVEEDOR'
          ListSource = dsPROVEE
          TabOrder = 6
          Visible = True
        end
      end
    end
    object tsConsulta: TTabSheet
      Caption = 'Consulta Articulos'
      ImageIndex = 1
      OnEnter = tsConsultaEnter
      OnExit = tsConsultaExit
      object DBGridEh1: TDBGridEh
        Left = 3
        Top = 3
        Width = 763
        Height = 287
        DataGrouping.GroupLevels = <>
        DataSource = dsGrillaArt
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
  object dsArticulo: TDataSource
    DataSet = cdsArticulo
    Left = 168
    Top = 48
  end
  object qryUnidadMedida: TIBQuery
    Database = DataModule1.DMBaseDatos
    Transaction = DataModule1.DMTransaction
    SQL.Strings = (
      'select CODUNIDADMEDIDA, DESCRIPCION from UNIDADMEDIDA')
    Left = 384
    Top = 8
  end
  object qryTipoIva: TIBQuery
    Database = DataModule1.DMBaseDatos
    Transaction = DataModule1.DMTransaction
    SQL.Strings = (
      'select CODTIPOIVA, DESCIVA from TIPOIVA')
    Left = 456
    Top = 8
  end
  object qryRamo: TIBQuery
    Database = DataModule1.DMBaseDatos
    Transaction = DataModule1.DMTransaction
    SQL.Strings = (
      'select CODRAMO, DESCRIPCIONRAMO from RAMO')
    Left = 624
    Top = 8
  end
  object qryProveedor: TIBQuery
    Database = DataModule1.DMBaseDatos
    Transaction = DataModule1.DMTransaction
    SQL.Strings = (
      'select CODPROVEEDOR, NOMBREPROVEEDOR from PROVEEDOR')
    Left = 544
    Top = 8
  end
  object dsUM: TDataSource
    DataSet = qryUnidadMedida
    Left = 364
  end
  object dsIVA: TDataSource
    DataSet = qryTipoIva
    Left = 440
  end
  object dsPROVEE: TDataSource
    DataSet = qryProveedor
    Left = 528
  end
  object dsRAMO: TDataSource
    DataSet = qryRamo
    Left = 608
  end
  object qryGrillaArticulos: TIBQuery
    Database = DataModule1.DMBaseDatos
    Transaction = DataModule1.DMTransaction
    Active = True
    SQL.Strings = (
      '  Select'
      ' a.codarticulo AS ID,         --0'
      ' a.descripcion AS PRODUCTO,   --1'
      ' a.preciocompra PRECIO_COMPRA,              --2'
      ' um.descripcion AS U_MEDIDA,--3'
      ' ti.desciva AS IVA,           --4'
      ' a.existencia AS EXISTENCIA,                --5'
      'P.nombreproveedor AS PROVEE,  --6'
      ' r.descripcionramo AS RAMOS,           --7'
      ' um.codunidadmedida AS IDU,   --8'
      ' ti.codtipoiva AS IDI,        --9'
      ' p.codproveedor as IDP,       --10'
      ' r.codramo AS IDR             --11'
      ' FROM'
      
        ' Articulo A join unidadmedida um on um.codunidadmedida=a.codunid' +
        'admedida'
      ' join tipoiva ti on ti.codtipoiva=a.codtipoiva'
      ' join proveedor p on p.codproveedor=a.codproveedor'
      ' join Ramo r on r.codramo=a.codramo'
      ' order by 1')
    Left = 624
    Top = 112
  end
  object dsGrillaArt: TDataSource
    DataSet = qryGrillaArticulos
    Left = 628
    Top = 64
  end
  object qryAux: TIBQuery
    Database = DataModule1.DMBaseDatos
    Transaction = DataModule1.DMTransaction
    Left = 712
    Top = 176
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 328
    Top = 224
  end
  object SQLQRY: TIBQuery
    Database = DataModule1.DMBaseDatos
    Transaction = DataModule1.DMTransaction
    Left = 712
    Top = 224
  end
  object qryArticulo: TIBQuery
    Database = DataModule1.DMBaseDatos
    Transaction = DataModule1.DMTransaction
    SQL.Strings = (
      'select '
      'CODARTICULO, '
      'AVISAR_EXIST_MIN, '
      'CODPROVEEDOR, '
      'CODRAMO, '
      'CODTIPOIVA, '
      'CODUNIDADMEDIDA, '
      'DESCRIPCION, '
      'EXISTENCIA, '
      'EXISTENCIA_MIN, '
      'EXT_IMG, '
      'IMAGEN, '
      'NOM_IMG, '
      'OBSERVACION,'
      'PRECIO_MODIFICABLE, '
      'PRECIOCOMPRA '
      'from ARTICULO'
      'order by 1')
    Left = 192
    Top = 48
    object qryArticuloCODARTICULO: TLargeintField
      FieldName = 'CODARTICULO'
      Origin = '"ARTICULO"."CODARTICULO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object tbArticuloAVISAR_EXIST_MIN: TIBStringField
      FieldName = 'AVISAR_EXIST_MIN'
      Origin = '"ARTICULO"."AVISAR_EXIST_MIN"'
      FixedChar = True
      Size = 1
    end
    object cdsArticuloCODPROVEEDOR: TIntegerField
      FieldName = 'CODPROVEEDOR'
      Origin = '"ARTICULO"."CODPROVEEDOR"'
    end
    object cdsArticuloCODRAMO: TIntegerField
      FieldName = 'CODRAMO'
      Origin = '"ARTICULO"."CODRAMO"'
    end
    object cdsArticuloCODTIPOIVA: TIntegerField
      FieldName = 'CODTIPOIVA'
      Origin = '"ARTICULO"."CODTIPOIVA"'
      Required = True
    end
    object cdsArticuloCODUNIDADMEDIDA: TIntegerField
      FieldName = 'CODUNIDADMEDIDA'
      Origin = '"ARTICULO"."CODUNIDADMEDIDA"'
      Required = True
    end
    object tbArticuloDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = '"ARTICULO"."DESCRIPCION"'
      Required = True
      FixedChar = True
    end
    object cdsArticuloEXISTENCIA: TIntegerField
      FieldName = 'EXISTENCIA'
      Origin = '"ARTICULO"."EXISTENCIA"'
      Required = True
    end
    object cdsArticuloEXISTENCIA_MIN: TIntegerField
      FieldName = 'EXISTENCIA_MIN'
      Origin = '"ARTICULO"."EXISTENCIA_MIN"'
    end
    object tbArticuloEXT_IMG: TIBStringField
      FieldName = 'EXT_IMG'
      Origin = '"ARTICULO"."EXT_IMG"'
      FixedChar = True
      Size = 5
    end
    object qryArticuloIMAGEN: TWideMemoField
      FieldName = 'IMAGEN'
      Origin = '"ARTICULO"."IMAGEN"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object tbArticuloNOM_IMG: TIBStringField
      FieldName = 'NOM_IMG'
      Origin = '"ARTICULO"."NOM_IMG"'
      FixedChar = True
      Size = 33
    end
    object tbArticuloOBSERVACION: TIBStringField
      FieldName = 'OBSERVACION'
      Origin = '"ARTICULO"."OBSERVACION"'
      Size = 50
    end
    object tbArticuloPRECIO_MODIFICABLE: TIBStringField
      FieldName = 'PRECIO_MODIFICABLE'
      Origin = '"ARTICULO"."PRECIO_MODIFICABLE"'
      FixedChar = True
      Size = 1
    end
    object qryArticuloPRECIOCOMPRA: TLargeintField
      FieldName = 'PRECIOCOMPRA'
      Origin = '"ARTICULO"."PRECIOCOMPRA"'
      Required = True
    end
  end
  object dspvArticulo: TDataSetProvider
    DataSet = qryArticulo
    Left = 248
    Top = 48
  end
  object cdsArticulo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspvArticulo'
    Left = 224
    Top = 48
  end
end
