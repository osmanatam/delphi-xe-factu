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
    object qry1PROD_ACUM: TLargeintField
      FieldName = 'PROD_ACUM'
    end
    object qry1PROD_MES: TLargeintField
      FieldName = 'PROD_MES'
    end
    object qry1PROD_META: TLargeintField
      FieldName = 'PROD_META'
    end
    object qry1PROD_SUC: TStringField
      FieldName = 'PROD_SUC'
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
end
