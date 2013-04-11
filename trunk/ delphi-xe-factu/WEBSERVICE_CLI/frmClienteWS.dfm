object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Consumidores de Web Services'
  ClientHeight = 376
  ClientWidth = 604
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 72
    Top = 35
    Width = 38
    Height = 13
    Caption = 'Valor A:'
  end
  object lbl2: TLabel
    Left = 72
    Top = 75
    Width = 37
    Height = 13
    Caption = 'Valor B:'
  end
  object lbl3: TLabel
    Left = 70
    Top = 115
    Width = 52
    Height = 13
    Caption = 'Resultado:'
  end
  object Edit1: TEdit
    Left = 128
    Top = 32
    Width = 121
    Height = 21
    TabOrder = 0
    Text = '0'
  end
  object Edit2: TEdit
    Left = 128
    Top = 72
    Width = 121
    Height = 21
    TabOrder = 1
    Text = '0'
  end
  object Edit3: TEdit
    Left = 128
    Top = 112
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object btn1: TButton
    Left = 255
    Top = 70
    Width = 50
    Height = 25
    Caption = 'Suma'
    TabOrder = 3
    OnClick = btn1Click
  end
  object btn2: TButton
    Left = 255
    Top = 101
    Width = 50
    Height = 25
    Caption = 'Resta'
    TabOrder = 4
    OnClick = btn2Click
  end
  object Edit4: TEdit
    Left = 416
    Top = 31
    Width = 113
    Height = 21
    TabOrder = 5
  end
  object Edit5: TEdit
    Left = 426
    Top = 120
    Width = 89
    Height = 21
    Color = clInactiveCaption
    TabOrder = 6
    Text = 'Result'
  end
  object btn3: TButton
    Left = 416
    Top = 58
    Width = 113
    Height = 25
    Caption = 'Celsius a Fahrenheit'
    TabOrder = 7
    OnClick = btn3Click
  end
  object btn4: TButton
    Left = 416
    Top = 89
    Width = 113
    Height = 25
    Caption = 'Fahrenheit a Celsius'
    TabOrder = 8
    OnClick = btn4Click
  end
  object StringGrid1: TStringGrid
    Left = 16
    Top = 208
    Width = 588
    Height = 160
    ColCount = 4
    FixedCols = 0
    RowCount = 200
    TabOrder = 9
    ColWidths = (
      197
      120
      113
      126)
    RowHeights = (
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24)
  end
  object btn5: TButton
    Left = 255
    Top = 177
    Width = 145
    Height = 25
    Caption = 'Consulta Produccion'
    TabOrder = 10
    OnClick = btn5Click
  end
  object pb1: TProgressBar
    Left = 255
    Top = 154
    Width = 145
    Height = 17
    TabOrder = 11
  end
end
