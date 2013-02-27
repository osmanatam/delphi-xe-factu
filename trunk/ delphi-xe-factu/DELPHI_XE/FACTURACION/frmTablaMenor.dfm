object frmTablaMenorPadre: TfrmTablaMenorPadre
  Left = 0
  Top = 0
  Caption = 'TablaMenor'
  ClientHeight = 242
  ClientWidth = 542
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblClave: TLabel
    Left = 24
    Top = 75
    Width = 31
    Height = 13
    Caption = 'Clave:'
  end
  object lbl1: TLabel
    Left = 24
    Top = 102
    Width = 41
    Height = 13
    Caption = 'Nombre:'
  end
  object lbl4: TLabel
    Left = 35
    Top = 181
    Width = 36
    Height = 13
    Caption = 'Primero'
  end
  object lbl5: TLabel
    Left = 90
    Top = 181
    Width = 16
    Height = 13
    Caption = 'Pre'
  end
  object lbl6: TLabel
    Left = 135
    Top = 181
    Width = 17
    Height = 13
    Caption = 'Pos'
  end
  object lbl7: TLabel
    Left = 171
    Top = 181
    Width = 29
    Height = 13
    Caption = 'Ultimo'
  end
  object lbl8: TLabel
    Left = 214
    Top = 181
    Width = 39
    Height = 13
    Caption = 'Agregar'
  end
  object lbl9: TLabel
    Left = 267
    Top = 181
    Width = 30
    Height = 13
    Caption = 'Borrar'
  end
  object lbl10: TLabel
    Left = 310
    Top = 181
    Width = 28
    Height = 13
    Caption = 'Editar'
  end
  object lbl11: TLabel
    Left = 348
    Top = 181
    Width = 39
    Height = 13
    Caption = 'Guardar'
  end
  object lbl12: TLabel
    Left = 397
    Top = 181
    Width = 30
    Height = 13
    Caption = 'Borrar'
  end
  object lbl13: TLabel
    Left = 437
    Top = 181
    Width = 47
    Height = 13
    Caption = 'Actualizar'
  end
  object pnlTablaMenor: TPanel
    Left = 8
    Top = 8
    Width = 526
    Height = 41
    Caption = 'pnlTablaMenor'
    TabOrder = 0
  end
  object dbedtEdNombre: TDBEdit
    Left = 71
    Top = 99
    Width = 410
    Height = 21
    TabOrder = 1
  end
  object dbnvgr1: TDBNavigator
    Left = 30
    Top = 195
    Width = 450
    Height = 41
    TabOrder = 2
    OnClick = dbnvgr1Click
  end
  object dbedt1: TDBEdit
    Left = 71
    Top = 72
    Width = 90
    Height = 21
    DataSource = dsTablaMenor
    Enabled = False
    TabOrder = 3
  end
  object dsTablaMenor: TDataSource
    Left = 280
    Top = 48
  end
  object TablaMenor: TIBTable
    Database = DataModule1.DMBaseDatos
    Transaction = DataModule1.DMTransaction
    StoreDefs = True
    Left = 336
    Top = 48
  end
  object qryMaxCodigo: TIBQuery
    Database = DataModule1.DMBaseDatos
    Transaction = DataModule1.DMTransaction
    Left = 176
    Top = 56
  end
end
