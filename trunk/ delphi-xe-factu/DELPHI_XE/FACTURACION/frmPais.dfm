inherited frmTablaMenorPais: TfrmTablaMenorPais
  Caption = 'Pais'
  ClientHeight = 244
  ClientWidth = 541
  OnClose = FormClose
  OnShow = FormShow
  ExplicitWidth = 557
  ExplicitHeight = 282
  PixelsPerInch = 96
  TextHeight = 13
  object lbl2: TLabel [2]
    Left = 24
    Top = 129
    Width = 46
    Height = 13
    Caption = 'Gentilicio:'
  end
  object lbl3: TLabel [3]
    Left = 282
    Top = 129
    Width = 72
    Height = 16
    Caption = 'Color Bandera:'
  end
  inherited dbedtEdNombre: TDBEdit
    DataField = 'NOMBREPAIS'
    DataSource = dsTablaMenor
  end
  object dbedtBANDERA: TDBEdit [16]
    Left = 360
    Top = 126
    Width = 121
    Height = 21
    DataField = 'BANDERA'
    DataSource = dsTablaMenor
    TabOrder = 2
  end
  object dbedtGENTILICIO: TDBEdit [17]
    Left = 71
    Top = 126
    Width = 121
    Height = 21
    DataField = 'GENTILICIO'
    DataSource = dsTablaMenor
    TabOrder = 3
  end
  inherited dbnvgr1: TDBNavigator
    Left = 31
    DataSource = dsTablaMenor
    Hints.Strings = ()
    TabOrder = 4
    ExplicitLeft = 31
  end
  inherited dbedt1: TDBEdit
    DataField = 'CODPAIS'
    TabOrder = 5
  end
  inherited dsTablaMenor: TDataSource
    DataSet = TablaMenor
  end
  inherited TablaMenor: TIBTable
    FieldDefs = <
      item
        Name = 'CODPAIS'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NOMBREPAIS'
        Attributes = [faRequired, faFixed]
        DataType = ftWideString
        Size = 20
      end
      item
        Name = 'BANDERA'
        Attributes = [faFixed]
        DataType = ftWideString
        Size = 20
      end
      item
        Name = 'GENTILICIO'
        Attributes = [faFixed]
        DataType = ftWideString
        Size = 20
      end>
    IndexDefs = <
      item
        Name = 'PK_PAIS'
        Fields = 'CODPAIS'
        Options = [ixUnique]
      end>
    IndexName = 'PK_PAIS'
    TableName = 'PAIS'
  end
end
