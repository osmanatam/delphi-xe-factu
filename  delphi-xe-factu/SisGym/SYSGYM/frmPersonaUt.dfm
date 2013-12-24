inherited frmPersona: TfrmPersona
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'frmPersona'
  ClientHeight = 301
  ClientWidth = 651
  OnCreate = FormCreate
  ExplicitWidth = 657
  ExplicitHeight = 329
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 651
    Height = 260
    Align = alClient
    TabOrder = 0
    object ed1: TLabel
      Left = 63
      Top = 43
      Width = 60
      Height = 13
      Caption = 'Id. Persona:'
    end
    object ed2: TLabel
      Left = 32
      Top = 70
      Width = 91
      Height = 13
      Caption = 'Cedula, Otro Doc.:'
    end
    object ed3: TLabel
      Left = 69
      Top = 99
      Width = 54
      Height = 13
      Caption = 'Nombre(s):'
    end
    object ed4: TLabel
      Left = 69
      Top = 128
      Width = 54
      Height = 13
      Caption = 'Apellido(s):'
    end
    object ed5: TLabel
      Left = 49
      Top = 154
      Width = 74
      Height = 13
      Caption = 'Direcci'#243'n Part.:'
    end
    object ed6: TLabel
      Left = 263
      Top = 70
      Width = 25
      Height = 13
      Caption = 'RUC:'
    end
    object btnOk: TSpeedButton
      Left = 472
      Top = 184
      Width = 73
      Height = 57
      Caption = 'OK'
      OnClick = ResultModal
    end
    object btnCanel: TSpeedButton
      Left = 551
      Top = 184
      Width = 73
      Height = 57
      Caption = 'NO'
      OnClick = ResultModal
    end
    object dbIDPersona: TDBEdit
      Left = 128
      Top = 40
      Width = 121
      Height = 21
      Color = clGradientInactiveCaption
      DataField = 'ID_PERSONA'
      DataSource = dsPersona
      Enabled = False
      TabOrder = 0
    end
    object dbCedula: TDBEdit
      Left = 128
      Top = 67
      Width = 121
      Height = 21
      DataField = 'CEDULA'
      DataSource = dsPersona
      TabOrder = 1
    end
    object dbRuc: TDBEdit
      Left = 290
      Top = 67
      Width = 95
      Height = 21
      DataField = 'RUC'
      DataSource = dsPersona
      TabOrder = 2
    end
    object dbNombre: TDBEdit
      Left = 128
      Top = 96
      Width = 257
      Height = 21
      CharCase = ecUpperCase
      DataField = 'NOMBRE'
      DataSource = dsPersona
      TabOrder = 3
    end
    object dbApellido: TDBEdit
      Left = 128
      Top = 125
      Width = 257
      Height = 21
      CharCase = ecUpperCase
      DataField = 'APELLIDO'
      DataSource = dsPersona
      TabOrder = 4
    end
    object dbmmoDireccionPart: TDBMemo
      Left = 128
      Top = 151
      Width = 257
      Height = 43
      DataField = 'DIRECCION_PARTICULAR'
      DataSource = dsPersona
      TabOrder = 5
    end
    object dbrgrpSEXO: TDBRadioGroup
      Left = 392
      Top = 67
      Width = 80
      Height = 79
      Caption = 'Sexo'
      DataField = 'SEXO'
      DataSource = dsPersona
      Items.Strings = (
        'Masculino'
        'Femenino')
      ParentBackground = True
      TabOrder = 6
      Values.Strings = (
        'M'
        'F')
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 260
    Width = 651
    Height = 41
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      651
      41)
    object btnPrimero: TSpeedButton
      Left = 353
      Top = 6
      Width = 74
      Height = 25
      Cursor = crHandPoint
      Hint = 'Al primer registro'
      Anchors = [akTop]
      Caption = '&Primero'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = btnMoverRegistros
    end
    object btnAnterior: TSpeedButton
      Left = 426
      Top = 6
      Width = 74
      Height = 25
      Cursor = crHandPoint
      Hint = 'Registro anterior'
      Anchors = [akTop]
      Caption = '&Anterior'
      Flat = True
      ParentShowHint = False
      ShowHint = True
      OnClick = btnMoverRegistros
    end
    object btnSiguiente: TSpeedButton
      Left = 499
      Top = 6
      Width = 74
      Height = 25
      Cursor = crHandPoint
      Hint = 'Registro siguiente'
      Anchors = [akTop]
      Caption = '&Siguiente'
      Flat = True
      ParentShowHint = False
      ShowHint = True
      OnClick = btnMoverRegistros
    end
    object btnUltimo: TSpeedButton
      Left = 572
      Top = 6
      Width = 74
      Height = 25
      Cursor = crHandPoint
      Hint = 'Al '#250'ltimo registro'
      Anchors = [akTop]
      Caption = '&Ultimo'
      Flat = True
      ParentShowHint = False
      ShowHint = True
      OnClick = btnMoverRegistros
    end
    object btnLimpiar: TSpeedButton
      Left = 251
      Top = 6
      Width = 77
      Height = 25
      Caption = 'Limpiar'
      Enabled = False
      OnClick = btnLimpiarClick
    end
    object btnNuevoGrabar: TButton
      Left = 8
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Nuevo'
      TabOrder = 0
      OnClick = btnAcciones
    end
    object btnEditar: TButton
      Left = 89
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Editar'
      TabOrder = 1
      OnClick = btnAcciones
    end
    object btnEliminaCancela: TButton
      Left = 170
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 2
      OnClick = btnAcciones
    end
  end
  object qryPersona: TSQLQuery
    MaxBlobSize = 1
    Params = <>
    SQL.Strings = (
      'select * from persona order by 1')
    SQLConnection = dmIniDatos.conAccesoBD
    Left = 424
    Top = 8
    object qryPersonaID_PERSONA: TIntegerField
      FieldName = 'ID_PERSONA'
      ProviderFlags = []
      Visible = False
    end
    object cdsPersonaCEDULA: TIntegerField
      FieldName = 'CEDULA'
      Required = True
    end
    object cdsPersonaRUC: TStringField
      FieldName = 'RUC'
      FixedChar = True
      Size = 11
    end
    object cdsPersonaNOMBRE: TStringField
      FieldName = 'NOMBRE'
      Required = True
      FixedChar = True
      Size = 70
    end
    object cdsPersonaAPELLIDO: TStringField
      FieldName = 'APELLIDO'
      Required = True
      FixedChar = True
      Size = 70
    end
    object cdsPersonaSEXO: TStringField
      FieldName = 'SEXO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsPersonaFECHA_NAC: TDateField
      FieldName = 'FECHA_NAC'
      ProviderFlags = []
    end
    object cdsPersonaCONTACO: TStringField
      FieldName = 'CONTACO'
      ProviderFlags = []
      FixedChar = True
      Size = 100
    end
    object cdsPersonaDIRECCION_PARTICULAR: TStringField
      FieldName = 'DIRECCION_PARTICULAR'
      FixedChar = True
      Size = 150
    end
    object qryPersonaFOTO_PERSONA: TBlobField
      FieldName = 'FOTO_PERSONA'
      ProviderFlags = []
      Size = 1
    end
    object qryPersonaFECHA_REGISTRO: TSQLTimeStampField
      FieldName = 'FECHA_REGISTRO'
      ProviderFlags = []
    end
    object cdsPersonaACTIVO: TStringField
      FieldName = 'ACTIVO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
  end
  object pvdPersona: TDataSetProvider
    DataSet = qryPersona
    Left = 440
    Top = 8
  end
  object cdsPersona: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pvdPersona'
    Left = 464
    Top = 8
    object cdsPersonaID_PERSONA: TIntegerField
      FieldName = 'ID_PERSONA'
      ProviderFlags = []
    end
    object cdsPersonaCEDULA2: TIntegerField
      FieldName = 'CEDULA'
      Required = True
    end
    object cdsPersonaRUC2: TStringField
      FieldName = 'RUC'
      FixedChar = True
      Size = 11
    end
    object cdsPersonaNOMBRE2: TStringField
      FieldName = 'NOMBRE'
      Required = True
      FixedChar = True
      Size = 70
    end
    object cdsPersonaAPELLIDO2: TStringField
      FieldName = 'APELLIDO'
      Required = True
      FixedChar = True
      Size = 70
    end
    object cdsPersonaSEXO2: TStringField
      FieldName = 'SEXO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsPersonaFECHA_NAC2: TDateField
      FieldName = 'FECHA_NAC'
    end
    object cdsPersonaCONTACO2: TStringField
      FieldName = 'CONTACO'
      ProviderFlags = []
      FixedChar = True
      Size = 100
    end
    object cdsPersonaDIRECCION_PARTICULAR2: TStringField
      FieldName = 'DIRECCION_PARTICULAR'
      FixedChar = True
      Size = 150
    end
    object cdsPersonaFOTO_PERSONA: TBlobField
      FieldName = 'FOTO_PERSONA'
      ProviderFlags = []
      Size = 1
    end
    object cdsPersonaFECHA_REGISTRO: TSQLTimeStampField
      FieldName = 'FECHA_REGISTRO'
      ProviderFlags = []
    end
    object cdsPersonaACTIVO2: TStringField
      FieldName = 'ACTIVO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
  end
  object dsPersona: TDataSource
    DataSet = cdsPersona
    OnStateChange = dsPersonaStateChange
    Left = 488
    Top = 8
  end
end
