inherited frmBaseTMAgencia: TfrmBaseTMAgencia
  Caption = 'frmBaseTMAgencia'
  ExplicitWidth = 495
  ExplicitHeight = 301
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgc1: TPageControl
    ActivePage = tsABM
    inherited tsABM: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 461
      ExplicitHeight = 229
      object lbl3: TLabel [2]
        Left = 102
        Top = 111
        Width = 45
        Height = 13
        Caption = 'Empresa:'
      end
      object lblAcciones: TLabel [3]
        Left = 189
        Top = 152
        Width = 3
        Height = 13
        Color = clRed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      inherited dbedtClave: TDBEdit
        DataField = 'CODAGENCIA'
        DataSource = dsTablaModelo
      end
      inherited dbnvgr1: TDBNavigator
        Hints.Strings = ()
        BeforeAction = dbnvgr1BeforeAction
        OnClick = dbnvgr1Click
      end
      inherited dbedtNombre: TDBEdit
        DataField = 'NOMBREAGENCIA'
        DataSource = dsTablaModelo
      end
      object dbedtCodEmpresa: TDBEdit
        Left = 173
        Top = 108
        Width = 36
        Height = 21
        DataField = 'CODEMPRESA'
        DataSource = dsTablaModelo
        TabOrder = 4
      end
      object dblkcbbCODAGENCIA: TDBLookupComboBox
        Left = 215
        Top = 108
        Width = 243
        Height = 21
        DataField = 'CODEMPRESA'
        DataSource = dsTablaModelo
        KeyField = 'CODEMPRESA'
        ListField = 'NOMBREMPRESA'
        TabOrder = 5
      end
    end
    inherited tsCONSULTA: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 461
      ExplicitHeight = 229
      inherited DBGridEh1: TDBGridEh
        Columns = <
          item
            EditButtons = <>
            Footers = <>
          end>
      end
    end
  end
  inherited qryGrilla: TIBQuery
    SQL.Strings = (
      ' select a.codagencia as "Id_Agencia",'
      ' a.nombreagencia as "Nombre_Agencia",'
      ' a.codempresa as "Id_Empresa",'
      ' e.nombrempresa as "Nombre_Empresa"'
      ' from agencia a join empresa e on a.codempresa=e.codempresa'
      'order by 1')
    object intgrfldGrillaId_Agencia: TIntegerField
      FieldName = 'Id_Agencia'
      Origin = '"AGENCIA"."CODAGENCIA"'
      Required = True
    end
    object qryGrillaNombre_Agencia: TIBStringField
      FieldName = 'Nombre_Agencia'
      Origin = '"AGENCIA"."NOMBREAGENCIA"'
      FixedChar = True
    end
    object intgrfldGrillaId_Empresa: TIntegerField
      FieldName = 'Id_Empresa'
      Origin = '"AGENCIA"."CODEMPRESA"'
      Required = True
    end
    object qryGrillaNombre_Empresa: TIBStringField
      FieldName = 'Nombre_Empresa'
      Origin = '"EMPRESA"."NOMBREMPRESA"'
      FixedChar = True
      Size = 30
    end
  end
end
