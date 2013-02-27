inherited frmTablaMenorIVA: TfrmTablaMenorIVA
  Caption = 'IVA'
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl2: TLabel [12]
    Left = 24
    Top = 129
    Width = 49
    Height = 13
    Caption = 'Porc. IVA:'
  end
  inherited dbedtEdNombre: TDBEdit
    DataField = 'DESCIVA'
    DataSource = dsTablaMenor
  end
  inherited dbnvgr1: TDBNavigator
    DataSource = dsTablaMenor
    Hints.Strings = ()
  end
  inherited dbedt1: TDBEdit
    DataField = 'CODTIPOIVA'
  end
  object dbedtDESCIVA: TDBEdit [17]
    Left = 71
    Top = 126
    Width = 90
    Height = 21
    DataField = 'PORCIVA'
    DataSource = dsTablaMenor
    TabOrder = 4
  end
  inherited dsTablaMenor: TDataSource
    DataSet = TablaMenor
  end
  inherited TablaMenor: TIBTable
    FieldDefs = <
      item
        Name = 'CODTIPOIVA'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DESCIVA'
        Attributes = [faRequired]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PORCIVA'
        Attributes = [faRequired]
        DataType = ftInteger
      end>
    TableName = 'TIPOIVA'
  end
  inherited qryMaxCodigo: TIBQuery
    SQL.Strings = (
      'select max(CODTIPOIVA)+1 as codtipoiva from TIPOIVA')
  end
end
