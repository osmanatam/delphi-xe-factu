inherited frmAgenciaUt: TfrmAgenciaUt
  Caption = 'Agencias'
  ClientHeight = 311
  ClientWidth = 615
  ExplicitWidth = 631
  ExplicitHeight = 349
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 615
    Caption = 'Agencia'
    ExplicitWidth = 615
  end
  inherited PageControl1: TPageControl
    Width = 615
    Height = 254
    ExplicitWidth = 615
    ExplicitHeight = 254
    inherited tgDatos: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 607
      ExplicitHeight = 226
      inherited DBNavigator1: TDBNavigator
        Top = 187
        Width = 607
        Hints.Strings = ()
        ExplicitTop = 187
        ExplicitWidth = 607
      end
    end
    inherited tgConsulta: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 607
      ExplicitHeight = 226
    end
  end
end
