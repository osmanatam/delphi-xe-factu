inherited frmBaseTMEmpresa: TfrmBaseTMEmpresa
  Caption = 'frmBaseTMEmpresa'
  ExplicitWidth = 491
  ExplicitHeight = 301
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgc1: TPageControl
    inherited tsABM: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 461
      ExplicitHeight = 229
      inherited dbedtClave: TDBEdit
        DataField = 'CODEMPRESA'
        DataSource = dsTablaModelo
      end
      inherited dbnvgr1: TDBNavigator
        Hints.Strings = ()
      end
      inherited dbedtNombre: TDBEdit
        DataField = 'NOMBREMPRESA'
        DataSource = dsTablaModelo
      end
    end
    inherited tsCONSULTA: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 461
      ExplicitHeight = 229
      inherited dbgrd1: TDBGrid
        DataSource = dsGrilla
      end
    end
  end
  inherited TablaModelo: TIBTable
    FieldDefs = <
      item
        Name = 'CODEMPRESA'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NOMBREMPRESA'
        DataType = ftString
        Size = 30
      end>
    TableName = 'EMPRESA'
  end
  inherited qryGrilla: TIBQuery
    SQL.Strings = (
      
        'select  CODEMPRESA AS "Id_Empresa", NOMBREMPRESA as "Razon" from' +
        ' EMPRESA ORDER BY 1')
    object qryGrillaId_Empresa: TIntegerField
      FieldName = 'Id_Empresa'
      Origin = '"EMPRESA"."CODEMPRESA"'
      Required = True
    end
    object qryGrillaRazon: TIBStringField
      FieldName = 'Razon'
      Origin = '"EMPRESA"."NOMBREMPRESA"'
      FixedChar = True
      Size = 30
    end
  end
end
