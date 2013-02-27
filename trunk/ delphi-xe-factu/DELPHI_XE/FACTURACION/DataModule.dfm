object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 282
  Width = 370
  object DMBaseDatos: TIBDatabase
    Connected = True
    DatabaseName = 'localhost:C:\PROYECTO_PATRIA\BD\FACTURACION.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=whitelion')
    LoginPrompt = False
    DefaultTransaction = DMTransaction
    AllowStreamedConnected = False
    Left = 128
    Top = 64
  end
  object dsDMDataSourse: TDataSource
    DataSet = DMQuery
    Left = 128
    Top = 16
  end
  object DMQuery: TIBQuery
    Database = DMBaseDatos
    Transaction = DMTransaction
    Left = 72
    Top = 64
  end
  object DMTransaction: TIBTransaction
    Active = True
    Left = 48
    Top = 16
  end
  object SQLConnection1: TSQLConnection
    ConnectionName = 'Facturacion'
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
      'Database=localhost:C:\PROYECTO_PATRIA\BD\FACTURACION.FDB'
      'User_Name=sysdba'
      'Password=whitelion'
      'Role=RoleName'
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'IsolationLevel=ReadCommitted'
      'SQLDialect=3'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'TrimChar=False'
      'BlobSize=-1'
      'ErrorResourceFile='
      'RoleName=RoleName'
      'ServerCharSet=ISO8859_1'
      'Trim Char=False')
    VendorLib = 'fbclient.DLL'
    Connected = True
    Left = 232
    Top = 16
  end
end
