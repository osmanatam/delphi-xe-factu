object frmMenuPrincipal: TfrmMenuPrincipal
  Left = 0
  Top = 0
  Caption = 'Menu'
  ClientHeight = 311
  ClientWidth = 813
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object img1: TImage
    Left = 0
    Top = 0
    Width = 812
    Height = 313
  end
  object MainMenu1: TMainMenu
    Left = 40
    object mnuClientes: TMenuItem
      Caption = 'Clientes'
      object mnuMantClientes: TMenuItem
        Caption = 'Mantenimiento'
      end
    end
    object mniProveedores: TMenuItem
      Caption = 'Proveedores'
      object mniMantProveedores: TMenuItem
        Caption = 'Mantenimiento'
        OnClick = mniMantProveedoresClick
      end
    end
    object mnuArticulos: TMenuItem
      Caption = 'Articulos'
      object mnuManArticulos: TMenuItem
        Caption = 'Mantenimiento'
        OnClick = mnuManArticulosClick
      end
      object PEEImagenes: TMenuItem
        Caption = 'Imagenes'
        OnClick = PEEImagenesClick
      end
    end
    object mniFacturacion: TMenuItem
      Caption = 'Facturacion'
      object mniFacturar: TMenuItem
        Caption = 'Facturar'
      end
    end
    object mniReportes: TMenuItem
      Caption = 'Reportes'
      object mniFacturarpt: TMenuItem
        Caption = 'Re-Impr. Factura'
      end
    end
    object mniTablasMenores: TMenuItem
      Caption = 'Tablas Menores'
      object mniPais: TMenuItem
        Caption = 'Pais'
        OnClick = mniPaisClick
      end
      object mniCiudad: TMenuItem
        Caption = 'Ciudad'
        OnClick = mniCiudadClick
      end
      object mniTipoIva: TMenuItem
        Caption = 'Tipo IVA'
        OnClick = mniTipoIvaClick
      end
      object mniEmpresa: TMenuItem
        Caption = 'Empresa'
        OnClick = mniEmpresaClick
      end
      object mniSucursal: TMenuItem
        Caption = 'Sucursal'
        OnClick = mniSucursalClick
      end
      object mniUnidadMed: TMenuItem
        Caption = 'Unidad de Medida'
        OnClick = mniUnidadMedClick
      end
    end
  end
  object TrayIcon1: TTrayIcon
    Left = 416
    Top = 56
  end
end
