inherited frmAgenciaUt: TfrmAgenciaUt
  Caption = 'Agencias'
  ClientHeight = 292
  ClientWidth = 473
  ExplicitWidth = 489
  ExplicitHeight = 330
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 473
    Caption = 'Agencia'
    ExplicitWidth = 473
  end
  inherited PageControl1: TPageControl
    Width = 473
    Height = 235
    ExplicitWidth = 473
    ExplicitHeight = 235
    inherited tgDatos: TTabSheet
      ExplicitWidth = 465
      ExplicitHeight = 207
      inherited DBNavigator1: TDBNavigator
        Top = 168
        Width = 465
        DataSource = dsAgencia
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
        Hints.Strings = ()
        ExplicitTop = 168
        ExplicitWidth = 465
      end
      object grpAgencia: TGroupBox
        Left = 0
        Top = 0
        Width = 465
        Height = 168
        Align = alClient
        Caption = 'Datos Rapidos'
        Color = cl3DLight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentColor = False
        ParentFont = False
        TabOrder = 1
        object lbl2: TLabel
          Left = 7
          Top = 21
          Width = 37
          Height = 13
          Align = alCustom
          Caption = 'Codigo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lbl3: TLabel
          Left = 7
          Top = 58
          Width = 42
          Height = 13
          Align = alCustom
          Caption = 'Agencia:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lbl4: TLabel
          Left = 7
          Top = 97
          Width = 45
          Height = 13
          Align = alCustom
          Caption = 'Empresa:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lbl1: TLabel
          Left = 7
          Top = 132
          Width = 37
          Height = 13
          Align = alCustom
          Caption = 'R.U.C.:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object dbedtCodAgencia: TDBEdit
          Left = 140
          Top = 16
          Width = 169
          Height = 24
          Align = alCustom
          DataField = 'CODAGENCIA'
          DataSource = dsAgencia
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object dbedtNombreAgencia: TDBEdit
          Left = 71
          Top = 55
          Width = 298
          Height = 21
          Align = alCustom
          Color = clWhite
          DataField = 'NOMBREAGENCIA'
          DataSource = dsAgencia
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object dbeEmpresa: TDBLookupComboboxEh
          Left = 71
          Top = 92
          Width = 298
          Height = 21
          DataField = 'CODEMPRESA'
          DataSource = dsAgencia
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          KeyField = 'CODEMPRESA'
          ListField = 'NOMBREMPRESA'
          ListSource = dsEmpresa
          ParentFont = False
          TabOrder = 2
          Visible = True
        end
        object btn2: TButton
          Left = 371
          Top = 96
          Width = 20
          Height = 17
          Caption = '+'
          TabOrder = 3
        end
        object btn1: TButton
          Left = 315
          Top = 17
          Width = 54
          Height = 25
          Caption = 'Cambiar'
          Enabled = False
          TabOrder = 4
        end
        object dbedtUC: TDBEdit
          Left = 71
          Top = 129
          Width = 190
          Height = 21
          Align = alCustom
          Color = clWhite
          DataField = 'RUC'
          DataSource = dsAgencia
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
        end
      end
    end
    inherited tgConsulta: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 465
      ExplicitHeight = 207
    end
  end
  object dsAgencia: TDataSource
    DataSet = cdsAgencia
    Left = 16
    Top = 8
  end
  object qryAgencia: TIBQuery
    Database = DataModule1.DMBaseDatos
    Transaction = DataModule1.DMTransaction
    SQL.Strings = (
      'select CODAGENCIA, NOMBREAGENCIA, CODEMPRESA, RUC from AGENCIA')
    Left = 48
    Top = 8
  end
  object cdsAgencia: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspvAgencia'
    Left = 80
    Top = 8
    object cdsAgenciaCODAGENCIA: TIntegerField
      FieldName = 'CODAGENCIA'
      Required = True
    end
    object cdsAgenciaNOMBREAGENCIA: TWideStringField
      FieldName = 'NOMBREAGENCIA'
      FixedChar = True
    end
    object cdsAgenciaCODEMPRESA: TIntegerField
      FieldName = 'CODEMPRESA'
      Required = True
    end
    object cdsAgenciaRUC: TWideStringField
      FieldName = 'RUC'
      FixedChar = True
      Size = 15
    end
  end
  object dspvAgencia: TDataSetProvider
    DataSet = qryAgencia
    Left = 112
    Top = 8
  end
  object dsEmpresa: TDataSource
    DataSet = qryeMPRESA
    Left = 348
    Top = 8
  end
  object qryeMPRESA: TIBQuery
    Database = DataModule1.DMBaseDatos
    Transaction = DataModule1.DMTransaction
    SQL.Strings = (
      'select CODEMPRESA, NOMBREMPRESA from EMPRESA')
    Left = 384
    Top = 8
  end
end
