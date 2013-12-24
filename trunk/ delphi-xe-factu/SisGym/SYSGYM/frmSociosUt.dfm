inherited frmSocios: TfrmSocios
  Caption = 'Socios'
  ClientWidth = 778
  ExplicitWidth = 784
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlCabecera: TPanel
    Width = 778
    ExplicitWidth = 778
  end
  inherited pnlPie: TPanel
    Width = 778
    ExplicitWidth = 778
    inherited btnPrimero: TSpeedButton
      Left = 435
      ExplicitLeft = 429
    end
    inherited btnAnterior: TSpeedButton
      Left = 514
      ExplicitLeft = 507
    end
    inherited btnSiguiente: TSpeedButton
      Left = 592
      ExplicitLeft = 584
    end
    inherited btnUltimo: TSpeedButton
      Left = 671
      ExplicitLeft = 662
    end
    inherited btnNuevoGrabar: TButton
      Left = 17
      Top = 6
      ExplicitLeft = 17
      ExplicitTop = 6
    end
  end
  inherited pgcBase: TPageControl
    Width = 778
    ActivePage = tsMantenimiento
    ExplicitWidth = 778
    inherited tsConsulta: TTabSheet
      ExplicitWidth = 770
      inherited pnlPnlParametrosBus: TPanel
        Width = 770
        Height = 89
        ExplicitWidth = 770
        ExplicitHeight = 89
        object ed1: TLabel
          Left = 37
          Top = 19
          Width = 56
          Height = 13
          Caption = 'Id Persona:'
        end
        object ed2: TLabel
          Left = 28
          Top = 46
          Width = 65
          Height = 13
          Caption = 'C'#233'dula Socio:'
        end
        object btn1: TButton
          Left = 350
          Top = 27
          Width = 95
          Height = 28
          Caption = 'Personas'
          TabOrder = 0
          OnClick = btn1Click
        end
        object edtIdSocio: TEdit
          Left = 94
          Top = 16
          Width = 117
          Height = 21
          Color = clGradientInactiveCaption
          NumbersOnly = True
          TabOrder = 1
          OnChange = edtIdSocioChange
        end
        object edtCedulaSocio: TEdit
          Left = 94
          Top = 43
          Width = 117
          Height = 21
          NumbersOnly = True
          TabOrder = 2
          OnChange = edtIdSocioChange
        end
        object btn2: TBitBtn
          Left = 350
          Top = 57
          Width = 95
          Height = 28
          Caption = 'limpiar'
          DoubleBuffered = True
          ParentDoubleBuffered = False
          TabOrder = 3
          OnClick = btn2Click
        end
      end
      inherited pnlBuscar: TPanel
        Top = 89
        Width = 770
        ExplicitTop = 89
        ExplicitWidth = 770
        inherited btnMostrar: TBitBtn
          Width = 634
          ExplicitWidth = 634
        end
      end
      inherited dbGrillaConsulta: TDBGridEh
        Top = 133
        Width = 770
        Height = 149
        DataSource = dsCabecera
        Columns = <
          item
            EditButtons = <>
            FieldName = 'CEDULA'
            Footers = <>
            Title.Caption = 'C'#233'dula'
          end
          item
            EditButtons = <>
            FieldName = 'NOMBRE'
            Footers = <>
            Title.Caption = 'Nombre'
            Width = 195
          end
          item
            EditButtons = <>
            FieldName = 'APELLIDO'
            Footers = <>
            Title.Caption = 'Apellido'
            Width = 201
          end
          item
            EditButtons = <>
            FieldName = 'ID_PERSONA'
            Footers = <>
            Title.Caption = 'Id. Persona'
            Width = 78
          end
          item
            EditButtons = <>
            FieldName = 'RUC'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'CELULAR'
            Footers = <>
            Title.Caption = 'Celular'
            Width = 113
          end>
      end
    end
    inherited tsMantenimiento: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 770
      ExplicitHeight = 282
      object ed3: TLabel
        Left = 45
        Top = 84
        Width = 37
        Height = 13
        Caption = 'Celular:'
      end
      object ed5: TLabel
        Left = 13
        Top = 27
        Width = 69
        Height = 13
        Caption = 'Numero Socio:'
      end
      object ed6: TLabel
        Left = 212
        Top = 84
        Width = 26
        Height = 13
        Caption = 'Alias:'
      end
      object ed7: TLabel
        Left = 36
        Top = 111
        Width = 46
        Height = 13
        Caption = 'Telefono:'
      end
      object ed8: TLabel
        Left = 216
        Top = 111
        Width = 22
        Height = 13
        Caption = 'Mail:'
      end
      object cbbID_PERSONA: TDBLookupComboboxEh
        Left = 422
        Top = 50
        Width = 20
        Height = 21
        DataField = 'ID_PERSONA'
        DataSource = dsCabecera
        DropDownBox.Columns = <
          item
            FieldName = 'CEDULA'
            Title.TitleButton = True
            Width = 100
          end
          item
            FieldName = 'NOMBRE'
            Title.TitleButton = True
            Width = 100
          end
          item
            FieldName = 'APELLIDO'
            Title.TitleButton = True
            Width = 100
          end
          item
            FieldName = 'ID_PERSONA'
            Title.SortIndex = 1
            Title.SortMarker = smDownEh
            Title.TitleButton = True
            Width = 100
          end>
        DropDownBox.Options = [dlgColumnResizeEh, dlgColLinesEh, dlgRowLinesEh, dlgAutoSortMarkingEh, dlgMultiSortMarkingEh]
        DropDownBox.SortLocal = True
        DropDownBox.AutoDrop = True
        DropDownBox.ShowTitles = True
        DropDownBox.Sizable = True
        DropDownBox.Width = 400
        EditButton.Style = ebsEllipsisEh
        EditButtons = <>
        KeyField = 'ID_PERSONA'
        ListField = 'NOM_APELL'
        ListSource = dsDetalle
        TabOrder = 0
        Visible = True
      end
      object DBEditEh5: TDBEditEh
        Left = 83
        Top = 81
        Width = 106
        Height = 21
        Alignment = taLeftJustify
        DataField = 'CELULAR'
        DataSource = dsCabecera
        EditButtons = <>
        TabOrder = 1
        Visible = True
      end
      object DBEditEh6: TDBEditEh
        Left = 83
        Top = 108
        Width = 106
        Height = 21
        Alignment = taLeftJustify
        DataField = 'TELEFONO'
        DataSource = dsCabecera
        EditButtons = <>
        TabOrder = 2
        Visible = True
      end
      object DBEditEh7: TDBEditEh
        Left = 241
        Top = 81
        Width = 106
        Height = 21
        Alignment = taLeftJustify
        DataField = 'ALIAS_SOCIO'
        DataSource = dsCabecera
        EditButtons = <>
        TabOrder = 3
        Visible = True
      end
      object DBEditEh8: TDBEditEh
        Left = 241
        Top = 108
        Width = 271
        Height = 21
        Alignment = taLeftJustify
        CharCase = ecLowerCase
        DataField = 'EMAIL'
        DataSource = dsCabecera
        EditButtons = <>
        TabOrder = 4
        Visible = True
      end
      object dbNroSocio: TDBEdit
        Left = 90
        Top = 23
        Width = 145
        Height = 21
        Color = clMoneyGreen
        DataField = 'NRO_SOCIO'
        DataSource = dsCabecera
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
      end
      object dbCedula: TEdit
        Left = 83
        Top = 50
        Width = 106
        Height = 21
        TabOrder = 6
        Text = 'dbCedula'
        OnKeyPress = dbCedulaKeyPress
      end
      object dbNombreApe: TEdit
        Left = 191
        Top = 50
        Width = 230
        Height = 21
        TabOrder = 7
        Text = 'dbCedula'
      end
    end
  end
  inherited qryCabecera: TSQLQuery
    MaxBlobSize = 1
    SQL.Strings = (
      ' SELECT S.*,'
      ' P.cedula,'
      ' p.ruc,'
      ' p.nombre,'
      ' p.apellido,'
      ' p.sexo,'
      ' p.fecha_nac,'
      ' p.contaco,'
      ' p.direccion_particular,'
      ' p.foto_persona,'
      ' p.fecha_registro, p.activo'
      ' from socio s join'
      '      persona p on s.id_persona=p.id_persona'
      'WHERE 1=1'
      ' order by S.id_persona')
    object qryCabeceraID_PERSONA: TIntegerField
      FieldName = 'ID_PERSONA'
    end
    object cdsCabeceraNRO_SOCIO: TIntegerField
      FieldName = 'NRO_SOCIO'
      Required = True
    end
    object cdsCabeceraALIAS_SOCIO: TStringField
      FieldName = 'ALIAS_SOCIO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 15
    end
    object cdsCabeceraTELEFONO: TStringField
      FieldName = 'TELEFONO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
    end
    object cdsCabeceraCELULAR: TStringField
      FieldName = 'CELULAR'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
    end
    object cdsCabeceraEMAIL: TStringField
      FieldName = 'EMAIL'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 100
    end
    object qryCabeceraFECHA_REGISTRO: TSQLTimeStampField
      FieldName = 'FECHA_REGISTRO'
      ProviderFlags = []
    end
    object cdsCabeceraACTIVO: TStringField
      FieldName = 'ACTIVO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object cdsCabeceraCEDULA: TIntegerField
      FieldName = 'CEDULA'
      ProviderFlags = []
    end
    object cdsCabeceraRUC: TStringField
      FieldName = 'RUC'
      ProviderFlags = []
      FixedChar = True
      Size = 11
    end
    object cdsCabeceraNOMBRE: TStringField
      FieldName = 'NOMBRE'
      ProviderFlags = []
      FixedChar = True
      Size = 70
    end
    object cdsCabeceraAPELLIDO: TStringField
      FieldName = 'APELLIDO'
      ProviderFlags = []
      FixedChar = True
      Size = 70
    end
    object cdsCabeceraSEXO: TStringField
      FieldName = 'SEXO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object cdsCabeceraFECHA_NAC: TDateField
      FieldName = 'FECHA_NAC'
      ProviderFlags = []
    end
    object cdsCabeceraCONTACO: TStringField
      FieldName = 'CONTACO'
      ProviderFlags = []
      FixedChar = True
      Size = 100
    end
    object cdsCabeceraDIRECCION_PARTICULAR: TStringField
      FieldName = 'DIRECCION_PARTICULAR'
      ProviderFlags = []
      FixedChar = True
      Size = 150
    end
    object qryCabeceraFOTO_PERSONA: TBlobField
      FieldName = 'FOTO_PERSONA'
      ProviderFlags = []
      Size = 1
    end
    object qryCabeceraFECHA_REGISTRO_1: TSQLTimeStampField
      FieldName = 'FECHA_REGISTRO_1'
      ProviderFlags = []
    end
    object cdsCabeceraACTIVO_1: TStringField
      FieldName = 'ACTIVO_1'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
  end
  inherited cdsCabecera: TClientDataSet
    OnCalcFields = cdsCabeceraCalcFields
    object cdsCabeceraID_PERSONA: TIntegerField
      FieldName = 'ID_PERSONA'
    end
    object cdsCabeceraNRO_SOCIO2: TIntegerField
      FieldName = 'NRO_SOCIO'
    end
    object cdsCabeceraALIAS_SOCIO2: TStringField
      FieldName = 'ALIAS_SOCIO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 15
    end
    object cdsCabeceraTELEFONO2: TStringField
      FieldName = 'TELEFONO'
      ProviderFlags = [pfInUpdate]
      EditMask = '(####) ###-####'
      FixedChar = True
    end
    object cdsCabeceraCELULAR2: TStringField
      FieldName = 'CELULAR'
      ProviderFlags = [pfInUpdate]
      EditMask = '(09##) ###-###'
      FixedChar = True
    end
    object cdsCabeceraEMAIL2: TStringField
      FieldName = 'EMAIL'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 100
    end
    object cdsCabeceraFECHA_REGISTRO: TSQLTimeStampField
      FieldName = 'FECHA_REGISTRO'
      ProviderFlags = []
    end
    object cdsCabeceraACTIVO2: TStringField
      FieldName = 'ACTIVO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object cdsCabeceraCEDULA2: TIntegerField
      FieldName = 'CEDULA'
      ProviderFlags = []
    end
    object cdsCabeceraRUC2: TStringField
      FieldName = 'RUC'
      ProviderFlags = []
      FixedChar = True
      Size = 11
    end
    object cdsCabeceraNOMBRE2: TStringField
      FieldName = 'NOMBRE'
      ProviderFlags = []
      FixedChar = True
      Size = 70
    end
    object cdsCabeceraAPELLIDO2: TStringField
      FieldName = 'APELLIDO'
      ProviderFlags = []
      FixedChar = True
      Size = 70
    end
    object cdsCabeceraSEXO2: TStringField
      FieldName = 'SEXO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object cdsCabeceraFECHA_NAC2: TDateField
      FieldName = 'FECHA_NAC'
      ProviderFlags = []
    end
    object cdsCabeceraCONTACO2: TStringField
      FieldName = 'CONTACO'
      ProviderFlags = []
      FixedChar = True
      Size = 100
    end
    object cdsCabeceraDIRECCION_PARTICULAR2: TStringField
      FieldName = 'DIRECCION_PARTICULAR'
      ProviderFlags = []
      FixedChar = True
      Size = 150
    end
    object cdsCabeceraFOTO_PERSONA: TBlobField
      FieldName = 'FOTO_PERSONA'
      ProviderFlags = []
      Size = 1
    end
    object cdsCabeceraFECHA_REGISTRO_1: TSQLTimeStampField
      FieldName = 'FECHA_REGISTRO_1'
      ProviderFlags = []
    end
    object cdsCabeceraACTIVO_12: TStringField
      FieldName = 'ACTIVO_1'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object cdsCabeceraNOM_APELL: TStringField
      DisplayWidth = 70
      FieldKind = fkCalculated
      FieldName = 'NOM_APELL'
      ProviderFlags = []
      Size = 70
      Calculated = True
    end
  end
  inherited dsCabecera: TDataSource
    OnDataChange = dsCabeceraDataChange
  end
  inherited qryDetalle: TSQLQuery
    SQL.Strings = (
      'SELECT A.id_persona, a.cedula, a.ruc, a.nombre, a.apellido'
      '  FROM persona A'
      'WHERE a.id_persona not in (select socio.id_persona from socio )'
      '  ORDER BY A.id_persona')
  end
  inherited cdsDetalle: TClientDataSet
    OnCalcFields = cdsDetalleCalcFields
    object cdsDetalleID_PERSONA: TIntegerField
      FieldName = 'ID_PERSONA'
      Required = True
    end
    object cdsDetalleCEDULA: TIntegerField
      FieldName = 'CEDULA'
      Required = True
      DisplayFormat = ',0.##'
    end
    object cdsDetalleRUC: TStringField
      FieldName = 'RUC'
      FixedChar = True
      Size = 11
    end
    object cdsDetalleNOMBRE: TStringField
      FieldName = 'NOMBRE'
      Required = True
      FixedChar = True
      Size = 70
    end
    object cdsDetalleNOM_APELL: TStringField
      DisplayWidth = 70
      FieldKind = fkCalculated
      FieldName = 'NOM_APELL'
      Size = 70
      Calculated = True
    end
    object cdsDetalleAPELLIDO: TStringField
      FieldName = 'APELLIDO'
      Required = True
      FixedChar = True
      Size = 70
    end
  end
  inherited dsDetalle: TDataSource
    OnDataChange = dsDetalleDataChange
  end
end
