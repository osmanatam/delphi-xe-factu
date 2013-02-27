inherited frmBaseTMPais: TfrmBaseTMPais
  Caption = 'Pais'
  ClientHeight = 253
  ClientWidth = 484
  ExplicitWidth = 500
  ExplicitHeight = 291
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgc1: TPageControl
    Top = 3
    Width = 477
    Height = 249
    ActivePage = tsABM
    ExplicitTop = 3
    ExplicitWidth = 477
    ExplicitHeight = 249
    inherited tsABM: TTabSheet
      ExplicitLeft = 0
      ExplicitWidth = 469
      ExplicitHeight = 221
      inherited lbl1: TLabel
        Left = 99
        Top = 53
        ExplicitLeft = 99
        ExplicitTop = 53
      end
      inherited lbl2: TLabel
        Left = 99
        Top = 80
        ExplicitLeft = 99
        ExplicitTop = 80
      end
      object lbl3: TLabel [2]
        Left = 99
        Top = 107
        Width = 44
        Height = 13
        Caption = 'Bandera:'
      end
      object lbl4: TLabel [3]
        Left = 99
        Top = 134
        Width = 46
        Height = 13
        Caption = 'Gentilicio:'
      end
      inherited dbedtClave: TDBEdit
        Left = 170
        Top = 50
        DataField = 'CODPAIS'
        DataSource = dsTablaModelo
        ExplicitLeft = 170
        ExplicitTop = 50
      end
      inherited dbnvgr1: TDBNavigator
        Left = 2
        Top = 175
        Hints.Strings = ()
        OnClick = dbnvgr1Click
        ExplicitLeft = 2
        ExplicitTop = 175
      end
      inherited dbedtNombre: TDBEdit
        Left = 170
        Top = 77
        DataField = 'NOMBREPAIS'
        DataSource = dsTablaModelo
        ExplicitLeft = 170
        ExplicitTop = 77
      end
      inherited pnl1: TPanel
        Left = 0
        Width = 466
        Caption = 'Datos del Pais'
        ExplicitLeft = 0
        ExplicitWidth = 466
      end
      object dbedtBANDERA: TDBEdit
        Left = 170
        Top = 104
        Width = 282
        Height = 21
        DataField = 'BANDERA'
        DataSource = dsTablaModelo
        TabOrder = 4
      end
      object dbedtBANDERA1: TDBEdit
        Left = 170
        Top = 131
        Width = 282
        Height = 21
        DataField = 'GENTILICIO'
        DataSource = dsTablaModelo
        TabOrder = 5
      end
    end
    inherited tsCONSULTA: TTabSheet
      ExplicitWidth = 469
      ExplicitHeight = 221
      inherited DBGridEh1: TDBGridEh
        Top = 1
        Width = 463
        Height = 218
        OnDblClick = DBGridEh1DblClick
        Columns = <
          item
            EditButtons = <>
            FieldName = 'CODPAIS'
            Footers = <>
            Title.Caption = 'COD. PAIS'
          end
          item
            EditButtons = <>
            FieldName = 'NOMBREPAIS'
            Footers = <>
            Title.Caption = 'NOMBRE PAIS'
          end
          item
            EditButtons = <>
            FieldName = 'BANDERA'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'GENTILICIO'
            Footers = <>
            Width = 116
          end>
      end
    end
  end
  inherited dsTablaModelo: TDataSource
    Left = 384
  end
  inherited qryGrilla: TIBQuery
    SQL.Strings = (
      'select CODPAIS, NOMBREPAIS, BANDERA, GENTILICIO from PAIS')
    Left = 280
    object cdsGrillaCODPAIS: TIntegerField
      FieldName = 'CODPAIS'
      Origin = '"PAIS"."CODPAIS"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object tbGrillaNOMBREPAIS: TIBStringField
      FieldName = 'NOMBREPAIS'
      Origin = '"PAIS"."NOMBREPAIS"'
      Required = True
      FixedChar = True
    end
    object tbGrillaBANDERA: TIBStringField
      FieldName = 'BANDERA'
      Origin = '"PAIS"."BANDERA"'
      FixedChar = True
    end
    object tbGrillaGENTILICIO: TIBStringField
      FieldName = 'GENTILICIO'
      Origin = '"PAIS"."GENTILICIO"'
      FixedChar = True
    end
  end
  inherited qryTablaModelo: TIBQuery
    SQL.Strings = (
      'select CODPAIS, NOMBREPAIS, BANDERA, GENTILICIO from PAIS'
      'order by 1')
    Left = 408
  end
  inherited qryMaxCodigo: TIBQuery
    SQL.Strings = (
      'select max(CODPAIS)+1 as CODPAIS from PAIS')
  end
end
