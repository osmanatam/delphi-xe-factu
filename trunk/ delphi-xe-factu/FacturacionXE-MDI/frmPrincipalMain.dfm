object frmMain: TfrmMain
  Left = 194
  Top = 111
  Caption = 'Facturacion XE - V1.0.0'
  ClientHeight = 338
  ClientWidth = 710
  Color = clAppWorkSpace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Default'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDefault
  WindowMenu = Window1
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar: TStatusBar
    Left = 0
    Top = 319
    Width = 710
    Height = 19
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    AutoHint = True
    Panels = <
      item
        Width = 50
      end
      item
        Text = 'Sistema de Facuracion'
        Width = 50
      end>
    SimplePanel = True
  end
  object MainMenu1: TMainMenu
    Left = 16
    Top = 16
    object File1: TMenuItem
      Caption = 'Agencia'
      Hint = 'Sistema de la Agencia '
      object mnuMantenerAgencia: TMenuItem
        Caption = 'Mantener Agencia'
        OnClick = mnuMantenerAgenciaClick
      end
      object ConsultaAgencia1: TMenuItem
        Caption = 'Consulta Agencia'
      end
      object N1: TMenuItem
        Caption = '-'
      end
    end
    object Edit1: TMenuItem
      Caption = 'Articulos'
      Hint = 'Seccion Articulos'
      object mnuMantenimientoArt: TMenuItem
        Caption = 'Mantenimiento'
        ImageIndex = 0
        OnClick = mnuMantenimientoArtClick
      end
      object CopyItem: TMenuItem
        Caption = 'Consulta'
        Hint = 'Copy|Copies the selection and puts it on the Clipboard'
        ImageIndex = 1
      end
      object PasteItem: TMenuItem
        Caption = 'Inventario'
        Hint = 'Paste|Inserts Clipboard contents'
        ImageIndex = 2
        ShortCut = 16470
      end
    end
    object Window1: TMenuItem
      Caption = 'Clientes'
      Hint = 'Seccion Cliente'
      object WindowCascadeItem: TMenuItem
        Caption = 'Mantenimiento'
        Hint = 'Cascade'
        ImageIndex = 17
      end
      object WindowTileItem: TMenuItem
        Caption = 'Consulta Cliente'
        Hint = 'Tile Horizontally'
        ImageIndex = 15
      end
      object WindowTileItem2: TMenuItem
        Caption = 'Limite de Credito'
        Hint = 'Tile Vertically'
        ImageIndex = 16
      end
      object WindowMinimizeItem: TMenuItem
        Caption = 'Lista Negra'
        Hint = 'Minimize All'
      end
    end
    object Help1: TMenuItem
      Caption = 'Ayuda'
      Hint = 'Acerca del Sistema'
      object HelpAboutItem: TMenuItem
        Caption = '&About...'
        Hint = 
          'About|Displays program information, version number, and copyrigh' +
          't'
        OnClick = HelpAboutItemClick
      end
    end
  end
end
