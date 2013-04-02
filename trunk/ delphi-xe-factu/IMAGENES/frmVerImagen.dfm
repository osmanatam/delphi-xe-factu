object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 222
  ClientWidth = 189
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 8
    Top = 8
    Width = 164
    Height = 145
    Stretch = True
  end
  object dbnvgr1: TDBNavigator
    Left = -4
    Top = 190
    Width = 176
    Height = 27
    DataSource = ds1
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
    TabOrder = 0
  end
  object btn1: TButton
    Left = 8
    Top = 159
    Width = 49
    Height = 25
    Caption = 'Ver'
    TabOrder = 1
    OnClick = btn1Click
  end
  object dbeID: TDBEdit
    Left = 63
    Top = 163
    Width = 109
    Height = 21
    DataField = 'ID'
    DataSource = ds1
    TabOrder = 2
  end
  object qry1: TIBQuery
    Database = Form1.bd1
    Transaction = Form1.IBTransaction1
    SQL.Strings = (
      'select id,imagen from tabla')
    Left = 56
    Top = 96
    object cdsqry1ID: TIntegerField
      FieldName = 'ID'
      Origin = '"TABLA"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qry1IMAGEN: TBlobField
      FieldName = 'IMAGEN'
      Origin = '"TABLA"."IMAGEN"'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
  end
  object ds1: TDataSource
    DataSet = qry1
    Left = 24
    Top = 96
  end
  object qry2: TIBQuery
    Database = Form1.bd1
    Transaction = Form1.IBTransaction1
    SQL.Strings = (
      'select id,imagen from tabla')
    Left = 104
    Top = 96
    object cdsqry2ID: TIntegerField
      FieldName = 'ID'
      Origin = '"TABLA"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qry2IMAGEN: TBlobField
      FieldName = 'IMAGEN'
      Origin = '"TABLA"."IMAGEN"'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
  end
end
