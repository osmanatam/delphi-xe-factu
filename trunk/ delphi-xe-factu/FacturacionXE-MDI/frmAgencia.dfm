inherited frmAgenciaUt: TfrmAgenciaUt
  Hint = 'Mantenimiento de Agencia'
  Caption = 'Agencias'
  ClientHeight = 254
  ClientWidth = 411
  ExplicitWidth = 427
  ExplicitHeight = 292
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 411
    Caption = 'Agencia'
    ExplicitWidth = 411
  end
  inherited PageControl1: TPageControl
    Width = 411
    Height = 221
    ExplicitWidth = 411
    ExplicitHeight = 221
    inherited tgDatos: TTabSheet
      ExplicitWidth = 403
      ExplicitHeight = 193
      inherited DBNavigator1: TDBNavigator
        Top = 154
        Width = 403
        DataSource = dsAgencia
        OnClick = DBNavigator1Click
        ExplicitTop = 154
        ExplicitWidth = 403
      end
      object grpAgencia: TGroupBox
        Left = 0
        Top = 0
        Width = 403
        Height = 154
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
          Left = 16
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
          Left = 11
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
          Left = 8
          Top = 89
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
          Left = 16
          Top = 124
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
          Left = 60
          Top = 50
          Width = 298
          Height = 21
          Align = alCustom
          CharCase = ecUpperCase
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
          Left = 58
          Top = 81
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
          Left = 357
          Top = 81
          Width = 20
          Height = 21
          Caption = '+'
          TabOrder = 3
        end
        object dbedtUC: TDBEdit
          Left = 58
          Top = 116
          Width = 190
          Height = 21
          Align = alCustom
          CharCase = ecUpperCase
          Color = clWhite
          DataField = 'RUC'
          DataSource = dsAgencia
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
      end
    end
    inherited tgConsulta: TTabSheet
      ExplicitWidth = 403
      ExplicitHeight = 193
      object DBGridEh1: TDBGridEh
        Left = 3
        Top = 16
        Width = 397
        Height = 174
        DataGrouping.GroupLevels = <>
        DataSource = dsAgencia
        Flat = False
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clRed
        FooterFont.Height = -11
        FooterFont.Name = 'Tahoma'
        FooterFont.Style = [fsBold]
        IndicatorOptions = [gioShowRowIndicatorEh]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clRed
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = [fsBold]
        OnDblClick = DBGridEh1DblClick
        Columns = <
          item
            EditButtons = <>
            FieldName = 'CODAGENCIA'
            Footers = <>
            Title.Caption = 'Id'
            Width = 40
          end
          item
            EditButtons = <>
            FieldName = 'NOMBREAGENCIA'
            Footers = <>
            Title.Caption = 'Agencia'
            Width = 209
          end
          item
            EditButtons = <>
            FieldName = 'RUC'
            Footers = <>
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
  end
  object dsAgencia: TDataSource
    DataSet = cdsAgencia
    Left = 64
  end
  object qryAgencia: TIBQuery
    Database = DataModule1.DMBaseDatos
    Transaction = DataModule1.DMTransaction
    SQL.Strings = (
      'select CODAGENCIA, NOMBREAGENCIA, CODEMPRESA, RUC from AGENCIA')
    Left = 104
    Top = 8
  end
  object cdsAgencia: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspvAgencia'
    Left = 136
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
    Left = 160
    Top = 8
  end
  object dsEmpresa: TDataSource
    DataSet = qryeMPRESA
    Left = 300
  end
  object qryeMPRESA: TIBQuery
    Database = DataModule1.DMBaseDatos
    Transaction = DataModule1.DMTransaction
    SQL.Strings = (
      'select CODEMPRESA, NOMBREMPRESA from EMPRESA')
    Left = 336
  end
  object qryAux: TIBQuery
    Database = DataModule1.DMBaseDatos
    Transaction = DataModule1.DMTransaction
    SQL.Strings = (
      'select max( CODAGENCIA) +1 from AGENCIA')
    Left = 320
    Top = 160
  end
  object dsAux: TDataSource
    DataSet = qryAux
    Left = 284
    Top = 160
  end
end
