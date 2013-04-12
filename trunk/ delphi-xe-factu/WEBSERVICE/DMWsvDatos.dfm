object DMWsDatos: TDMWsDatos
  OldCreateOrder = False
  OnCreate = SoapDataModuleCreate
  Height = 388
  Width = 666
  object qry1: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      ' select * from WS_TRAER_PRODUCCION')
    SQLConnection = FBCONNECTION
    Left = 104
    Top = 81
    object qry1O_PROD_ACUM: TLargeintField
      FieldName = 'O_PROD_ACUM'
    end
    object qry1O_PROD_MES: TLargeintField
      FieldName = 'O_PROD_MES'
    end
    object qry1O_PROD_META: TLargeintField
      FieldName = 'O_PROD_META'
    end
    object qry1O_PROD_SUC: TStringField
      FieldName = 'O_PROD_SUC'
      FixedChar = True
      Size = 100
    end
  end
  object FBCONNECTION: TSQLConnection
    ConnectionName = 'FBCONNECTION'
    DriverName = 'Firebird'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbxfb.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=DBXFirebird'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver150.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=15.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXFirebirdMetaDataCommandFactory,DbxFire' +
        'birdDriver150.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXFirebirdMetaDataCommandF' +
        'actory,Borland.Data.DbxFirebirdDriver,Version=15.0.0.0,Culture=n' +
        'eutral,PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverINTERBASE'
      'LibraryName=dbxfb.dll'
      'VendorLib=fbclient.DLL'
      'MaxBlobSize=-1'
      'TrimChar=False'
      'ErrorResourceFile='
      ';DelegateConnection=DBXTraceConnection'
      'drivername=Firebird'
      'Database=localhost:C:\PROYECTO_PATRIA\BD\SEBAOT_PRUEBAS.FDB'
      'rolename=RoleName'
      'user_name=sysdba'
      'Password=whitelion'
      'sqldialect=3'
      'localecode=0000'
      'blobsize=-1'
      'commitretain=False'
      'waitonlocks=True'
      'isolationlevel=ReadCommitted'
      'trim char=True'
      'ServerCharSet=ISO8859_1'
      'Role=OPERADOR')
    VendorLib = 'fbclient.DLL'
    Connected = True
    Left = 40
    Top = 17
  end
  object qryAseg: TSQLQuery
    Active = True
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftWideString
        Name = 'aseg'
        ParamType = ptInput
        Value = 'claudio'
      end>
    SQL.Strings = (
      ''
      'select a.* from ws_cons_aseg(:aseg) a')
    SQLConnection = FBCONNECTION
    Left = 224
    Top = 113
    object qryAsegO_CODIGO: TStringField
      FieldName = 'O_CODIGO'
      FixedChar = True
      Size = 15
    end
    object qryAsegO_NOMBRE: TStringField
      FieldName = 'O_NOMBRE'
      FixedChar = True
      Size = 100
    end
    object qryAsegO_CI: TIntegerField
      FieldName = 'O_CI'
    end
    object qryAsegO_RUC: TStringField
      FieldName = 'O_RUC'
      FixedChar = True
      Size = 11
    end
    object qryAsegO_COMERCIAL: TStringField
      FieldName = 'O_COMERCIAL'
      FixedChar = True
      Size = 50
    end
  end
  object ProvAsegurado: TDataSetProvider
    DataSet = qryAseg
    Left = 222
    Top = 85
  end
  object qryAsegurado: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftWideString
        Name = 'aseg'
        ParamType = ptInput
        Value = 'claudio'
      end>
    ProviderName = 'ProvAsegurado'
    Left = 223
    Top = 42
    object qryAseguradoO_CODIGO1: TStringField
      FieldName = 'O_CODIGO'
      FixedChar = True
      Size = 15
    end
    object qryAseguradoO_NOMBRE1: TStringField
      FieldName = 'O_NOMBRE'
      FixedChar = True
      Size = 100
    end
    object qryAseguradoO_CI1: TIntegerField
      FieldName = 'O_CI'
    end
    object qryAseguradoO_RUC1: TStringField
      FieldName = 'O_RUC'
      FixedChar = True
      Size = 11
    end
    object qryAseguradoO_COMERCIAL1: TStringField
      FieldName = 'O_COMERCIAL'
      FixedChar = True
      Size = 50
    end
  end
end
