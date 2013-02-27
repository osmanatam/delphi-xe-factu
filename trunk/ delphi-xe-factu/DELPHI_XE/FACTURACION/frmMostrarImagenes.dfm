object frmImagenes: TfrmImagenes
  Left = 192
  Top = 107
  Caption = 'JvDBImage Demo'
  ClientHeight = 309
  ClientWidth = 985
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    985
    309)
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TJvDBGrid
    Left = 16
    Top = 7
    Width = 385
    Height = 295
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Anchors = [akLeft, akTop, akBottom]
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    MultiSelect = True
    AutoSizeColumns = True
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.RealNamesOption = '[With the real field name]'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'FILENAME'
        Width = 301
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FILETYPE'
        Width = 66
        Visible = True
      end>
  end
  object btnAdd: TButton
    Left = 1067
    Top = 373
    Width = 75
    Height = 25
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Anchors = [akRight, akBottom]
    Caption = 'Add...'
    TabOrder = 1
    OnClick = btnAddClick
  end
  object btnClear: TButton
    Left = 939
    Top = 373
    Width = 115
    Height = 25
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Anchors = [akRight, akBottom]
    Caption = 'Clear DB'
    TabOrder = 2
    OnClick = btnClearClick
  end
  object chkTransparent: TCheckBox
    Left = 16
    Top = 381
    Width = 80
    Height = 17
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Anchors = [akLeft, akBottom]
    Caption = '&Transparent'
    TabOrder = 3
    OnClick = chkTransparentClick
  end
  object chkStretch: TCheckBox
    Left = 99
    Top = 381
    Width = 56
    Height = 17
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Anchors = [akLeft, akBottom]
    Caption = '&Stretch'
    TabOrder = 4
    OnClick = chkStretchClick
  end
  object chkProportional: TCheckBox
    Left = 160
    Top = 381
    Width = 80
    Height = 17
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Anchors = [akLeft, akBottom]
    Caption = '&Proportional'
    TabOrder = 5
    OnClick = chkProportionalClick
  end
  object chkAutoDisplay: TCheckBox
    Left = 247
    Top = 381
    Width = 87
    Height = 17
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Anchors = [akLeft, akBottom]
    Caption = '&AutoDisplay'
    TabOrder = 6
    OnClick = chkAutoDisplayClick
  end
  object chkAutoSize: TCheckBox
    Left = 345
    Top = 381
    Width = 87
    Height = 17
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Anchors = [akLeft, akBottom]
    Caption = 'AutoSi&ze'
    TabOrder = 7
    OnClick = chkAutoSizeClick
  end
  object ScrollBox1: TScrollBox
    Left = 568
    Top = 27
    Width = 321
    Height = 222
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Anchors = [akLeft, akTop, akRight, akBottom]
    BorderStyle = bsNone
    TabOrder = 8
  end
  object JvDBImage1: TJvDBImage
    Left = 584
    Top = 32
    Width = 289
    Height = 209
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Align = alCustom
    DataField = 'IMAGEN'
    DataSource = DataSource1
    Stretch = True
    TabOrder = 9
  end
  object btn1: TButton
    Left = 432
    Top = 160
    Width = 75
    Height = 25
    Caption = 'btn1'
    TabOrder = 10
    OnClick = btn1Click
  end
  object DataSource1: TDataSource
    DataSet = qry1
    Left = 56
    Top = 48
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofEnableSizing]
    Left = 224
    Top = 48
  end
  object qry1: TIBQuery
    Database = DataModule1.DMBaseDatos
    Transaction = DataModule1.DMTransaction
    Active = True
    SQL.Strings = (
      'select IMAGEN, FILENAME, FILETYPE  FROM IMAGEN')
    Left = 440
    Top = 40
    object qry1IMAGEN: TBlobField
      FieldName = 'IMAGEN'
      Origin = '"IMAGEN"."IMAGEN"'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object ibstrngfldqry1FILENAME: TIBStringField
      FieldName = 'FILENAME'
      Origin = '"IMAGEN"."FILENAME"'
      FixedChar = True
    end
    object ibstrngfldqry1FILETYPE: TIBStringField
      FieldName = 'FILETYPE'
      Origin = '"IMAGEN"."FILETYPE"'
      FixedChar = True
    end
  end
end
