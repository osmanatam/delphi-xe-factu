inherited frmTablaMenorUM: TfrmTablaMenorUM
  Caption = 'Unidad de Medida'
  PixelsPerInch = 96
  TextHeight = 13
  object lbl2: TLabel [12]
    Left = 24
    Top = 129
    Width = 92
    Height = 13
    Caption = 'Unidad x Embalaje:'
  end
  inherited dbedtEdNombre: TDBEdit
    DataField = 'DESCRIPCION'
    DataSource = dsTablaMenor
  end
  inherited dbnvgr1: TDBNavigator
    DataSource = dsTablaMenor
    Hints.Strings = ()
  end
  inherited dbedt1: TDBEdit
    DataField = 'CODUNIDADMEDIDA'
  end
  object dbedtDESCRIPCION: TDBEdit [17]
    Left = 122
    Top = 126
    Width = 87
    Height = 21
    DataField = 'UNIDADXEMBALAGE'
    DataSource = dsTablaMenor
    TabOrder = 4
  end
  inherited dsTablaMenor: TDataSource
    DataSet = TablaMenor
  end
  inherited TablaMenor: TIBTable
    FieldDefs = <
      item
        Name = 'CODUNIDADMEDIDA'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DESCRIPCION'
        Attributes = [faFixed]
        DataType = ftWideString
        Size = 18
      end
      item
        Name = 'UNIDADXEMBALAGE'
        DataType = ftSmallint
      end>
    IndexDefs = <
      item
        Name = 'PK_UNIDADMEDIDA'
        Fields = 'CODUNIDADMEDIDA'
        Options = [ixUnique]
      end>
    TableName = 'UNIDADMEDIDA'
  end
end
