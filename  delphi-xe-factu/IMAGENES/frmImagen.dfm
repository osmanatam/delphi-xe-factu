object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 252
  ClientWidth = 239
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Image: TImage
    Left = 8
    Top = 8
    Width = 226
    Height = 146
    Stretch = True
  end
  object btn1: TButton
    Left = 8
    Top = 160
    Width = 89
    Height = 25
    Caption = 'Carga Imagen'
    TabOrder = 0
    OnClick = btn1Click
  end
  object Edit1: TEdit
    Left = 103
    Top = 162
    Width = 50
    Height = 21
    TabOrder = 1
    Text = '1'
  end
  object btn2: TButton
    Left = 185
    Top = 222
    Width = 49
    Height = 25
    Caption = 'ver'
    TabOrder = 2
    OnClick = btn2Click
  end
  object btn3: TButton
    Left = 156
    Top = 160
    Width = 75
    Height = 25
    Caption = 'btn3'
    TabOrder = 3
    OnClick = btn3Click
  end
  object OpenDialog: TOpenDialog
    Left = 72
    Top = 200
  end
  object bd1: TIBDatabase
    Connected = True
    DatabaseName = 'localhost:C:\PROYECTO_PATRIA\BD\MARCACION.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=whitelion')
    LoginPrompt = False
    Left = 128
    Top = 208
  end
  object sp1: TIBStoredProc
    Database = bd1
    Transaction = IBTransaction1
    StoredProcName = 'TABLA_INS'
    Left = 48
    Top = 192
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftBlob
        Name = 'IMAGEN'
        ParamType = ptInput
      end>
  end
  object IBTransaction1: TIBTransaction
    DefaultDatabase = bd1
    Left = 120
    Top = 168
  end
  object qry1: TIBQuery
    Database = bd1
    Transaction = IBTransaction1
    SQL.Strings = (
      'select  max(ID)+1 from TABLA')
    Left = 8
    Top = 192
    object qry1F_1: TLargeintField
      FieldName = 'F_1'
      ProviderFlags = []
    end
  end
  object query: TIBQuery
    Database = bd1
    Transaction = IBTransaction1
    Left = 104
    Top = 40
  end
end
