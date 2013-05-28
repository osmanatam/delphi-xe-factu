inherited frmArticuloUt: TfrmArticuloUt
  BorderStyle = bsSingle
  Caption = 'Articulos'
  ClientHeight = 396
  ClientWidth = 705
  Position = poMainFormCenter
  OnShow = FormShow
  ExplicitTop = -35
  ExplicitWidth = 711
  ExplicitHeight = 424
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 705
    Caption = 'Articulos'
    ExplicitWidth = 705
  end
  inherited PageControl1: TPageControl
    Width = 705
    Height = 339
    ExplicitWidth = 705
    ExplicitHeight = 339
    inherited tgDatos: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 697
      ExplicitHeight = 311
      inherited DBNavigator1: TDBNavigator
        Top = 272
        Width = 697
        DataSource = dsArticulo
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Hints.Strings = ()
        ExplicitTop = 272
        ExplicitWidth = 697
      end
      object grpArticulo: TGroupBox
        Left = 0
        Top = 0
        Width = 697
        Height = 272
        Align = alClient
        Caption = 'Datos Rapidos'
        Color = cl3DLight
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentColor = False
        ParentFont = False
        TabOrder = 1
        object Label1: TLabel
          Left = 7
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
          Left = 7
          Top = 51
          Width = 58
          Height = 13
          Align = alCustom
          Caption = 'Descripcion:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          Left = 7
          Top = 78
          Width = 74
          Height = 13
          Align = alCustom
          Caption = 'Unidad Medida:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label4: TLabel
          Left = 7
          Top = 105
          Width = 72
          Height = 13
          Align = alCustom
          Caption = 'Tipo Impuesto:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label5: TLabel
          Left = 7
          Top = 132
          Width = 73
          Height = 13
          Align = alCustom
          Caption = 'Ramo Principal:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label6: TLabel
          Left = 7
          Top = 159
          Width = 54
          Height = 13
          Align = alCustom
          Caption = 'Proveedor:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label7: TLabel
          Left = 7
          Top = 186
          Width = 73
          Height = 13
          Align = alCustom
          Caption = 'Precio Compra:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label8: TLabel
          Left = 7
          Top = 213
          Width = 64
          Height = 13
          Align = alCustom
          Caption = 'Precio Venta:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label9: TLabel
          Left = 234
          Top = 186
          Width = 52
          Height = 13
          Align = alCustom
          Caption = 'Existencia:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label10: TLabel
          Left = 234
          Top = 213
          Width = 75
          Height = 13
          Align = alCustom
          Caption = 'Existencia Min.:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object shp1: TShape
          Left = 513
          Top = 13
          Width = 165
          Height = 140
        end
        object lbl1: TLabel
          Left = 522
          Top = 76
          Width = 146
          Height = 13
          Caption = 'Click aqui para insertar imagen'
        end
        object Image1: TImage
          Left = 517
          Top = 16
          Width = 157
          Height = 133
          Stretch = True
          OnClick = Image1Click
        end
        object dbeCodArt: TDBEdit
          Left = 140
          Top = 16
          Width = 169
          Height = 24
          Align = alCustom
          DataField = 'CODARTICULO'
          DataSource = dsArticulo
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object dbeDescArt: TDBEdit
          Left = 71
          Top = 48
          Width = 298
          Height = 21
          Align = alCustom
          Color = clWhite
          DataField = 'DESCRIPCION'
          DataSource = dsArticulo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object dblUnidadMedida: TDBLookupComboboxEh
          Left = 87
          Top = 75
          Width = 282
          Height = 21
          DataField = 'CODUNIDADMEDIDA'
          DataSource = dsArticulo
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          KeyField = 'CODUNIDADMEDIDA'
          ListField = 'DESCRIPCION'
          ListSource = dsUM
          ParentFont = False
          TabOrder = 2
          Visible = True
        end
        object dblTipoIva: TDBLookupComboboxEh
          Left = 85
          Top = 102
          Width = 284
          Height = 21
          DataField = 'CODTIPOIVA'
          DataSource = dsArticulo
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          KeyField = 'CODTIPOIVA'
          ListField = 'DESCIVA'
          ListSource = dsIVA
          ParentFont = False
          TabOrder = 3
          Visible = True
        end
        object dblRamo: TDBLookupComboboxEh
          Left = 85
          Top = 129
          Width = 284
          Height = 21
          DataField = 'CODRAMO'
          DataSource = dsArticulo
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          KeyField = 'CODRAMO'
          ListField = 'DESCRIPCIONRAMO'
          ListSource = dsRAMO
          ParentFont = False
          TabOrder = 4
          Visible = True
        end
        object dblProveedor: TDBLookupComboboxEh
          Left = 85
          Top = 156
          Width = 284
          Height = 21
          DataField = 'CODPROVEEDOR'
          DataSource = dsArticulo
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          KeyField = 'CODPROVEEDOR'
          ListField = 'NOMBREPROVEEDOR'
          ListSource = dsPROVEE
          ParentFont = False
          TabOrder = 5
          Visible = True
        end
        object dbedtPRECIOCOMPRA: TDBEdit
          Left = 85
          Top = 183
          Width = 133
          Height = 21
          Align = alCustom
          DataField = 'PRECIOCOMPRA'
          DataSource = dsArticulo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
        end
        object dbedtPRECIOVTA: TDBEdit
          Left = 85
          Top = 210
          Width = 133
          Height = 21
          Align = alCustom
          DataField = 'PRECIOVTA'
          DataSource = dsArticulo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
        end
        object dbedtEXISTENCIA: TDBEdit
          Left = 309
          Top = 183
          Width = 60
          Height = 21
          Align = alCustom
          DataField = 'EXISTENCIA'
          DataSource = dsArticulo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
        end
        object dbedtEXISTENCIA_MIN: TDBEdit
          Left = 309
          Top = 210
          Width = 60
          Height = 21
          Align = alCustom
          DataField = 'EXISTENCIA_MIN'
          DataSource = dsArticulo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
        end
        object dbchkPRECIO_MODIFICABLE: TDBCheckBox
          Left = 7
          Top = 239
          Width = 211
          Height = 17
          Caption = 'Permitir Modificar Precio en Facturacion?'
          DataField = 'PRECIO_MODIFICABLE'
          DataSource = dsArticulo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object dbchkAVISAR_EXIST_MIN: TDBCheckBox
          Left = 234
          Top = 239
          Width = 146
          Height = 17
          Caption = 'Avisar Existencia Minima?'
          DataField = 'AVISAR_EXIST_MIN'
          DataSource = dsArticulo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 11
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object Button2: TButton
          Left = 370
          Top = 77
          Width = 20
          Height = 17
          Caption = '+'
          TabOrder = 12
        end
        object Button3: TButton
          Left = 370
          Top = 104
          Width = 20
          Height = 17
          Caption = '+'
          TabOrder = 13
        end
        object Button4: TButton
          Left = 370
          Top = 131
          Width = 20
          Height = 17
          Caption = '+'
          TabOrder = 14
        end
        object Button5: TButton
          Left = 370
          Top = 158
          Width = 20
          Height = 17
          Caption = '+'
          TabOrder = 15
        end
        object btn1: TButton
          Left = 315
          Top = 17
          Width = 54
          Height = 25
          Caption = 'Cambiar'
          TabOrder = 16
          OnClick = btn1Click
        end
      end
      object btnEditar: TBitBtn
        Left = 513
        Top = 232
        Width = 84
        Height = 34
        Caption = 'Editar'
        DoubleBuffered = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 2
        OnClick = btnAccionesClick
      end
      object btnEliminar: TBitBtn
        Left = 606
        Top = 232
        Width = 84
        Height = 34
        Caption = 'Eliminar'
        DoubleBuffered = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 3
        OnClick = btnAccionesClick
      end
      object btnNuevo: TBitBtn
        Left = 418
        Top = 231
        Width = 84
        Height = 35
        Caption = 'Nuevo'
        DoubleBuffered = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 4
        OnClick = btnAccionesClick
      end
    end
    inherited tgConsulta: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 697
      ExplicitHeight = 311
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 697
        Height = 81
        Align = alTop
        TabOrder = 0
        object Button1: TButton
          Left = 16
          Top = 16
          Width = 57
          Height = 21
          Caption = 'Buscar:'
          TabOrder = 0
        end
        object edt1: TEdit
          Left = 79
          Top = 18
          Width = 330
          Height = 21
          TabOrder = 1
          Text = 'edt1'
        end
      end
      object DBGridEh1: TDBGridEh
        Left = 0
        Top = 81
        Width = 697
        Height = 230
        Align = alClient
        DataGrouping.GroupLevels = <>
        DataSource = dsGrilla
        Flat = False
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clRed
        FooterFont.Height = -11
        FooterFont.Name = 'Tahoma'
        FooterFont.Style = [fsBold]
        IndicatorOptions = [gioShowRowIndicatorEh]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clRed
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            EditButtons = <>
            FieldName = 'CODARTICULO'
            Footers = <>
            Title.Caption = 'Codigo'
            Width = 69
          end
          item
            EditButtons = <>
            FieldName = 'DESCRIPCION'
            Footers = <>
            Title.Caption = 'Articulo'
            Width = 163
          end
          item
            EditButtons = <>
            FieldName = 'DESCRIPCION1'
            Footers = <>
            Title.Caption = 'Unidad Medida'
          end
          item
            EditButtons = <>
            FieldName = 'NOMBREPROVEEDOR'
            Footers = <>
            Title.Caption = 'Proveedor'
            Width = 134
          end
          item
            EditButtons = <>
            FieldName = 'PRECIOVTA'
            Footers = <>
            Title.Caption = 'Precio Venta'
            Width = 79
          end
          item
            EditButtons = <>
            FieldName = 'DESCRIPCIONRAMO'
            Footers = <>
            Title.Caption = 'Ramo'
            Width = 106
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
  end
  object OpenPictureDialog: TOpenPictureDialog
    Left = 480
    Top = 184
  end
  object dspvArticulo: TDataSetProvider
    DataSet = qryArticulo
    Left = 256
    Top = 24
  end
  object cdsArticulo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspvArticulo'
    Left = 224
    Top = 24
    object cdsArticuloCODARTICULO: TLargeintField
      FieldName = 'CODARTICULO'
      Origin = '"ARTICULO"."CODARTICULO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsArticuloAVISAR_EXIST_MIN: TWideStringField
      FieldName = 'AVISAR_EXIST_MIN'
      Origin = '"ARTICULO"."AVISAR_EXIST_MIN"'
      FixedChar = True
      Size = 1
    end
    object cdsArticuloCODPROVEEDOR2: TIntegerField
      FieldName = 'CODPROVEEDOR'
      Origin = '"ARTICULO"."CODPROVEEDOR"'
    end
    object cdsArticuloCODRAMO2: TIntegerField
      FieldName = 'CODRAMO'
      Origin = '"ARTICULO"."CODRAMO"'
    end
    object cdsArticuloCODTIPOIVA2: TIntegerField
      FieldName = 'CODTIPOIVA'
      Origin = '"ARTICULO"."CODTIPOIVA"'
      Required = True
    end
    object cdsArticuloCODUNIDADMEDIDA2: TIntegerField
      FieldName = 'CODUNIDADMEDIDA'
      Origin = '"ARTICULO"."CODUNIDADMEDIDA"'
      Required = True
    end
    object cdsArticuloDESCRIPCION: TWideStringField
      FieldName = 'DESCRIPCION'
      Origin = '"ARTICULO"."DESCRIPCION"'
      Required = True
      FixedChar = True
    end
    object cdsArticuloEXISTENCIA2: TIntegerField
      FieldName = 'EXISTENCIA'
      Origin = '"ARTICULO"."EXISTENCIA"'
      Required = True
    end
    object cdsArticuloEXISTENCIA_MIN2: TIntegerField
      FieldName = 'EXISTENCIA_MIN'
      Origin = '"ARTICULO"."EXISTENCIA_MIN"'
    end
    object cdsArticuloIMG_EXT: TWideStringField
      FieldName = 'IMG_EXT'
      Origin = '"ARTICULO"."IMG_EXT"'
      FixedChar = True
      Size = 3
    end
    object cdsArticuloIMAGEN: TBlobField
      FieldName = 'IMAGEN'
      Origin = '"ARTICULO"."IMAGEN"'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object cdsArticuloNOM_IMG: TWideStringField
      FieldName = 'NOM_IMG'
      Origin = '"ARTICULO"."NOM_IMG"'
      FixedChar = True
      Size = 33
    end
    object cdsArticuloOBSERVACION: TWideStringField
      FieldName = 'OBSERVACION'
      Origin = '"ARTICULO"."OBSERVACION"'
      Size = 50
    end
    object cdsArticuloPRECIO_MODIFICABLE: TWideStringField
      FieldName = 'PRECIO_MODIFICABLE'
      Origin = '"ARTICULO"."PRECIO_MODIFICABLE"'
      FixedChar = True
      Size = 1
    end
    object cdsArticuloPRECIOCOMPRA: TLargeintField
      FieldName = 'PRECIOCOMPRA'
      Origin = '"ARTICULO"."PRECIOCOMPRA"'
      Required = True
    end
    object cdsArticuloPRECIOVTA: TLargeintField
      FieldName = 'PRECIOVTA'
      Origin = '"ARTICULO"."PRECIOVTA"'
      Required = True
    end
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
      'IMG_EXT, '
      'IMAGEN, '
      'NOM_IMG, '
      'OBSERVACION,'
      'PRECIO_MODIFICABLE, '
      'PRECIOCOMPRA, PRECIOVTA '
      'from ARTICULO'
      'order by 1')
    Left = 192
    Top = 24
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
    object tbArticuloIMG_EXT: TIBStringField
      FieldName = 'IMG_EXT'
      Origin = '"ARTICULO"."IMG_EXT"'
      FixedChar = True
      Size = 3
    end
    object qryArticuloIMAGEN: TBlobField
      FieldName = 'IMAGEN'
      Origin = '"ARTICULO"."IMAGEN"'
      ProviderFlags = [pfInUpdate]
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
    object qryArticuloPRECIOVTA: TLargeintField
      FieldName = 'PRECIOVTA'
      Origin = '"ARTICULO"."PRECIOVTA"'
      Required = True
    end
  end
  object dsArticulo: TDataSource
    DataSet = cdsArticulo
    OnDataChange = dsArticuloDataChange
    Left = 160
    Top = 24
  end
  object dsUM: TDataSource
    DataSet = qryUnidadMedida
    Left = 348
    Top = 8
  end
  object qryUnidadMedida: TIBQuery
    Database = DataModule1.DMBaseDatos
    Transaction = DataModule1.DMTransaction
    SQL.Strings = (
      'select CODUNIDADMEDIDA, DESCRIPCION from UNIDADMEDIDA')
    Left = 384
    Top = 8
  end
  object dsIVA: TDataSource
    DataSet = qryTipoIva
    Left = 440
  end
  object qryTipoIva: TIBQuery
    Database = DataModule1.DMBaseDatos
    Transaction = DataModule1.DMTransaction
    SQL.Strings = (
      'select CODTIPOIVA, DESCIVA from TIPOIVA')
    Left = 456
    Top = 8
  end
  object dsPROVEE: TDataSource
    DataSet = qryProveedor
    Left = 528
  end
  object qryProveedor: TIBQuery
    Database = DataModule1.DMBaseDatos
    Transaction = DataModule1.DMTransaction
    SQL.Strings = (
      'select CODPROVEEDOR, NOMBREPROVEEDOR from PROVEEDOR')
    Left = 544
    Top = 8
  end
  object dsRAMO: TDataSource
    DataSet = qryRamo
    Left = 608
  end
  object qryRamo: TIBQuery
    Database = DataModule1.DMBaseDatos
    Transaction = DataModule1.DMTransaction
    SQL.Strings = (
      'select CODRAMO, DESCRIPCIONRAMO from RAMO')
    Left = 624
    Top = 8
  end
  object IBQuery1: TIBQuery
    Database = DataModule1.DMBaseDatos
    Transaction = DataModule1.DMTransaction
    Left = 712
    Top = 144
  end
  object qryAux: TIBQuery
    Database = DataModule1.DMBaseDatos
    Transaction = DataModule1.DMTransaction
    Left = 632
    Top = 112
  end
  object dsGrilla: TDataSource
    DataSet = qryGrilla
    Left = 516
    Top = 56
  end
  object qryGrilla: TIBQuery
    Database = DataModule1.DMBaseDatos
    Transaction = DataModule1.DMTransaction
    SQL.Strings = (
      'select a.codarticulo,'
      '   a.descripcion,'
      '   p.nombreproveedor,'
      '   r.descripcionramo,'
      '   u.descripcion,'
      '   A.preciovta'
      '   from articulo a'
      '   join proveedor p on a.codproveedor=p.codproveedor'
      '   join ramo r on a.codramo=r.codramo'
      
        '   INNER join unidadmedida u on a.codunidadmedida=u.codunidadmed' +
        'ida')
    Left = 560
    Top = 56
  end
end
