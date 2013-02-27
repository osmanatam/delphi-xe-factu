object JvDBImageDemoMainFrm: TJvDBImageDemoMainFrm
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
    Left = 112
    Top = 32
    Width = 305
    Height = 232
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
        FieldName = 'Filename'
        Width = 230
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FileType'
        Width = 57
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
    ExplicitLeft = 616
    ExplicitTop = 328
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
    ExplicitLeft = 488
    ExplicitTop = 328
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
    ExplicitTop = 336
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
    ExplicitTop = 336
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
    ExplicitTop = 336
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
    ExplicitTop = 336
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
    ExplicitTop = 336
  end
  object ScrollBox1: TScrollBox
    Left = 496
    Top = 8
    Width = 654
    Height = 358
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Anchors = [akLeft, akTop, akRight, akBottom]
    BorderStyle = bsNone
    TabOrder = 8
    ExplicitWidth = 203
    ExplicitHeight = 313
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
    DataField = 'Image'
    DataSource = DataSource1
    Stretch = True
    TabOrder = 9
  end
  object btn1: TButton
    Left = 464
    Top = 160
    Width = 75
    Height = 25
    Caption = 'btn1'
    TabOrder = 10
    OnClick = btn1Click
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 56
    Top = 48
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    FileName = 'Data\images.xml'
    FieldDefs = <
      item
        Name = 'Filename'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'FileType'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 12
      end
      item
        Name = 'Image'
        Attributes = [faUnNamed]
        DataType = ftGraphic
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    BeforeOpen = ClientDataSet1BeforeOpen
    Left = 136
    Top = 48
    object ClientDataSet1Filename: TStringField
      FieldName = 'Filename'
      Size = 255
    end
    object ClientDataSet1FileType: TStringField
      FieldName = 'FileType'
      Size = 12
    end
    object ClientDataSet1Image: TGraphicField
      FieldName = 'Image'
      BlobType = ftGraphic
    end
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofEnableSizing]
    Left = 224
    Top = 48
  end
end
