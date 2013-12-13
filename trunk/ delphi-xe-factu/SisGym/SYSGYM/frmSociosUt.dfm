inherited frmSocios: TfrmSocios
  Caption = 'Socios'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlPie: TPanel
    inherited btnAnterior: TSpeedButton
      OnClick = nil
    end
    inherited btnSiguiente: TSpeedButton
      OnClick = nil
    end
    inherited btnUltimo: TSpeedButton
      OnClick = nil
    end
  end
  inherited pgc1: TPageControl
    inherited tsConsulta: TTabSheet
      inherited pnlPnlParametrosBus: TPanel
        Height = 57
        ExplicitTop = 0
        ExplicitHeight = 57
      end
      inherited pnlBuscar: TPanel
        Top = 57
      end
      inherited dbGrillaConsulta: TDBGridEh
        Top = 101
        Height = 171
        OnDblClick = nil
      end
    end
    inherited tsMantenimiento: TTabSheet
      ExplicitHeight = 272
    end
  end
end
