object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Imagenes'
  ClientHeight = 256
  ClientWidth = 334
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 5
    Top = 73
    Width = 236
    Height = 173
    Stretch = True
  end
  object dbeID_PERSONA: TDBEdit
    Left = 5
    Top = 46
    Width = 81
    Height = 21
    DataField = 'ID_PERSONA'
    DataSource = DataSource
    TabOrder = 0
  end
  object dbeNOMBRE: TDBEdit
    Left = 92
    Top = 46
    Width = 236
    Height = 21
    DataField = 'NOMBRE'
    DataSource = DataSource
    TabOrder = 1
  end
  object btn1: TButton
    Left = 251
    Top = 100
    Width = 75
    Height = 25
    Caption = 'Cargar'
    Enabled = False
    TabOrder = 2
    OnClick = btn1Click
  end
  object dbeFormato_Foto: TDBEdit
    Left = 247
    Top = 73
    Width = 81
    Height = 21
    Color = clSilver
    DataField = 'FORMATO_FOTO'
    DataSource = DataSource
    Enabled = False
    ReadOnly = True
    TabOrder = 3
  end
  object btn2: TButton
    Left = 251
    Top = 223
    Width = 75
    Height = 25
    Caption = 'SAVE'
    Enabled = False
    TabOrder = 4
    OnClick = btn2Click
  end
  object dbnvgr1: TDBNavigator
    Left = 5
    Top = 6
    Width = 322
    Height = 34
    DataSource = DataSource
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbCancel]
    ConfirmDelete = False
    TabOrder = 5
    OnClick = dbnvgr1Click
  end
  object IBDatabase: TIBDatabase
    Connected = True
    DatabaseName = 'localhost:C:\PROYECTO_PATRIA\BD\MARCACION.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=whitelion'
      'sql_role_name=3')
    LoginPrompt = False
    DefaultTransaction = IBTransaction
    Left = 85
    Top = 94
  end
  object IBTransaction: TIBTransaction
    Active = True
    Left = 37
    Top = 190
  end
  object DataSource: TDataSource
    DataSet = cds1
    OnDataChange = DataSourceDataChange
    Left = 85
    Top = 190
  end
  object OpenPictureDialog: TOpenPictureDialog
    Left = 157
    Top = 134
  end
  object cds1: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'Prov1'
    Left = 85
    Top = 142
    object cds1ID_PERSONA: TIntegerField
      FieldName = 'ID_PERSONA'
      Origin = '"PERSONA"."ID_PERSONA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds1NOMBRE: TWideStringField
      FieldName = 'NOMBRE'
      Origin = '"PERSONA"."NOMBRE"'
      Required = True
      Size = 30
    end
    object cds1FOTO: TBlobField
      FieldName = 'FOTO'
      Origin = '"PERSONA"."FOTO"'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object cds1FORMATO_FOTO: TWideStringField
      FieldName = 'FORMATO_FOTO'
      Origin = '"PERSONA"."FORMATO_FOTO"'
      Size = 3
    end
  end
  object Prov1: TDataSetProvider
    DataSet = quer1
    Left = 37
    Top = 142
  end
  object quer1: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      
        'select ID_PERSONA, NOMBRE, FOTO, FORMATO_FOTO from PERSONA order' +
        ' by ID_PERSONA')
    Left = 37
    Top = 94
    object cdsquer1ID_PERSONA: TIntegerField
      FieldName = 'ID_PERSONA'
      Origin = '"PERSONA"."ID_PERSONA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object tbquer1NOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = '"PERSONA"."NOMBRE"'
      Required = True
      Size = 30
    end
    object quer1FOTO: TBlobField
      FieldName = 'FOTO'
      Origin = '"PERSONA"."FOTO"'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object tbquer1FORMATO_FOTO: TIBStringField
      FieldName = 'FORMATO_FOTO'
      Origin = '"PERSONA"."FORMATO_FOTO"'
      Size = 3
    end
  end
  object qryMaxID: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'select  MAX(ID_PERSONA)+1 from PERSONA')
    Left = 160
    Top = 200
    object qryMaxIDF_1: TLargeintField
      FieldName = 'F_1'
      ProviderFlags = []
    end
  end
end
