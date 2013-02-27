object frmBaseTM: TfrmBaseTM
  Left = 0
  Top = 0
  Caption = 'frmBaseTM'
  ClientHeight = 263
  ClientWidth = 479
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgc1: TPageControl
    Left = 4
    Top = 0
    Width = 469
    Height = 257
    ActivePage = tsCONSULTA
    TabOrder = 0
    object tsABM: TTabSheet
      Caption = 'DATOS'
      object lbl1: TLabel
        Left = 102
        Top = 57
        Width = 37
        Height = 13
        Caption = 'Codigo:'
      end
      object lbl2: TLabel
        Left = 102
        Top = 84
        Width = 41
        Height = 13
        Caption = 'Nombre:'
      end
      object dbedtClave: TDBEdit
        Left = 173
        Top = 54
        Width = 121
        Height = 21
        ReadOnly = True
        TabOrder = 0
      end
      object dbnvgr1: TDBNavigator
        Left = 5
        Top = 179
        Width = 448
        Height = 41
        DataSource = dsTablaModelo
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel]
        ConfirmDelete = False
        TabOrder = 1
      end
      object dbedtNombre: TDBEdit
        Left = 173
        Top = 81
        Width = 282
        Height = 21
        TabOrder = 2
      end
      object pnl1: TPanel
        Left = 3
        Top = 3
        Width = 452
        Height = 41
        Caption = 'pnl1'
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 3
      end
    end
    object tsCONSULTA: TTabSheet
      Caption = 'CONSULTAS'
      ImageIndex = 1
      object DBGridEh1: TDBGridEh
        Left = 3
        Top = 3
        Width = 455
        Height = 223
        DataGrouping.GroupLevels = <>
        DataSource = dsGrilla
        Flat = False
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'Tahoma'
        FooterFont.Style = []
        IndicatorOptions = [gioShowRowIndicatorEh]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
  end
  object dsTablaModelo: TDataSource
    DataSet = cdsTablaModelo
    Left = 376
    Top = 144
  end
  object qryGrilla: TIBQuery
    Database = DataModule1.DMBaseDatos
    Transaction = DataModule1.DMTransaction
    SQL.Strings = (
      '')
    Left = 288
    Top = 32
  end
  object dsGrilla: TDataSource
    DataSet = qryGrilla
    Left = 256
    Top = 32
  end
  object qryTablaModelo: TIBQuery
    Database = DataModule1.DMBaseDatos
    Transaction = DataModule1.DMTransaction
    SQL.Strings = (
      '')
    Left = 400
    Top = 144
  end
  object dspvTablaModelo: TDataSetProvider
    DataSet = qryTablaModelo
    Left = 328
    Top = 144
  end
  object cdsTablaModelo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspvTablaModelo'
    Left = 352
    Top = 144
  end
  object qryMaxCodigo: TIBQuery
    Database = DataModule1.DMBaseDatos
    Transaction = DataModule1.DMTransaction
    Left = 64
    Top = 104
  end
end
