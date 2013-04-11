object frmModificacion: TfrmModificacion
  Left = 0
  Top = 0
  Caption = 'Modificacion'
  ClientHeight = 267
  ClientWidth = 448
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
  object dtpEvento: TDateTimePicker
    Left = 8
    Top = 24
    Width = 153
    Height = 21
    Date = 41302.000000000000000000
    Format = 'dd/MM/yyyy HH:mm:ss'
    Time = 41302.000000000000000000
    DateFormat = dfLong
    TabOrder = 0
  end
  object rg1: TRadioGroup
    Left = 8
    Top = 104
    Width = 369
    Height = 113
    Caption = 'EVENTOS A SELECCIONAR'
    TabOrder = 1
  end
  object rbiNGRESO: TRadioButton
    Left = 48
    Top = 128
    Width = 113
    Height = 17
    Caption = 'INGRESO'
    Checked = True
    TabOrder = 2
    TabStop = True
  end
  object rbeGRESOaLM: TRadioButton
    Left = 48
    Top = 151
    Width = 145
    Height = 17
    Caption = 'EGRESO ALMUERZO'
    TabOrder = 3
  end
  object rbINGRESOALM: TRadioButton
    Left = 48
    Top = 174
    Width = 161
    Height = 17
    Caption = 'INGRESO ALMUERZO'
    TabOrder = 4
  end
  object rbEGRESO: TRadioButton
    Left = 190
    Top = 128
    Width = 113
    Height = 17
    Caption = 'EGRESO'
    TabOrder = 5
  end
  object rbTAREAEXT: TRadioButton
    Left = 190
    Top = 151
    Width = 113
    Height = 17
    Caption = 'TAREA EXTERNA'
    TabOrder = 6
  end
  object rbRETORNOTAREAEX: TRadioButton
    Left = 190
    Top = 174
    Width = 169
    Height = 17
    Caption = 'RETORNO TAREA EXTERNA'
    TabOrder = 7
  end
  object btnAceptar: TButton
    Left = 312
    Top = 232
    Width = 57
    Height = 33
    Caption = 'ACEPTAR'
    TabOrder = 8
    OnClick = btnAceptarClick
  end
  object cbxNOMBRE: TDBLookupComboboxEh
    Left = 208
    Top = 24
    Width = 209
    Height = 21
    EditButtons = <>
    KeyField = 'CODIGOUSUARIO'
    ListField = 'NOMBRE'
    ListSource = ds1
    TabOrder = 9
    Visible = True
  end
  object ibqry1: TIBQuery
    Database = frmPrincipal.IBDatabase1
    Transaction = frmPrincipal.IBTransaction1
    SQL.Strings = (
      
        'SELECT codigousuario,nombreusuario||'#39' '#39'||APELLIDOUAURIO as nombr' +
        'e FROM USUARIO;')
    Left = 400
    Top = 56
    object ibqry1CODIGOUSUARIO: TIntegerField
      FieldName = 'CODIGOUSUARIO'
      Origin = '"USUARIO"."CODIGOUSUARIO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ibqry1NOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      ProviderFlags = []
      Size = 41
    end
  end
  object ds1: TDataSource
    DataSet = ibqry1
    Left = 400
    Top = 104
  end
end
