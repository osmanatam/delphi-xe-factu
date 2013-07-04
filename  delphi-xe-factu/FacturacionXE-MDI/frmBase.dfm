object frmBaseUt: TfrmBaseUt
  Left = 0
  Top = 0
  Caption = 'frmBase'
  ClientHeight = 324
  ClientWidth = 634
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Scaled = False
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 634
    Height = 33
    Align = alTop
    Caption = 'Titulo Base'
    Color = clMoneyGreen
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 33
    Width = 634
    Height = 291
    ActivePage = tgDatos
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object tgDatos: TTabSheet
      Caption = 'Datos'
      object DBNavigator1: TDBNavigator
        Left = 0
        Top = 224
        Width = 626
        Height = 39
        ParentCustomHint = False
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
        Align = alBottom
        Hints.Strings = (
          'Primero'
          'Anterior'
          'Siguiente'
          'Ultimo'
          'Insertar'
          'Eliminar'
          'Editar'
          'Guardar'
          'Cancelar'
          'Refrescar')
        ParentShowHint = False
        ConfirmDelete = False
        ShowHint = False
        TabOrder = 0
      end
    end
    object tgConsulta: TTabSheet
      Caption = 'Consulta'
      ImageIndex = 1
    end
  end
end
