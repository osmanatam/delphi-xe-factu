object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'SisGym'
  ClientHeight = 384
  ClientWidth = 703
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = mm1
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object mm1: TMainMenu
    Left = 16
    Top = 16
    object mnuPersonas: TMenuItem
      Caption = 'Personas'
      object mnuPEMantenimientodePersonas: TMenuItem
        Caption = 'Mantenimiento de Socios'
        OnClick = mnuPEMantenimientodePersonasClick
      end
    end
    object mnuChequeos: TMenuItem
      Caption = 'Chequeos'
      object mnuContexturaCorporal: TMenuItem
        Caption = 'Contextura corporal'
        OnClick = mnuContexturaCorporalClick
      end
    end
    object mnuAcercaDe: TMenuItem
      Caption = 'Acerca De'
      object mnuCreditos: TMenuItem
        Caption = 'Creditos'
        OnClick = mnuCreditosClick
      end
    end
  end
end
