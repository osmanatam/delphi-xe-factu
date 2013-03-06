object DataModule1: TDataModule1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
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
end
