object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consumidores de Web Services'
  ClientHeight = 386
  ClientWidth = 623
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
    Left = 14
    Top = 11
    Width = 38
    Height = 13
    Caption = 'Valor A:'
  end
  object lbl2: TLabel
    Left = 15
    Top = 38
    Width = 37
    Height = 13
    Caption = 'Valor B:'
  end
  object lbl3: TLabel
    Left = 15
    Top = 65
    Width = 52
    Height = 13
    Caption = 'Resultado:'
  end
  object Edit1: TEdit
    Left = 70
    Top = 8
    Width = 121
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Text = '0'
  end
  object Edit2: TEdit
    Left = 70
    Top = 35
    Width = 121
    Height = 21
    TabOrder = 1
    Text = '0'
  end
  object Edit3: TEdit
    Left = 70
    Top = 62
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object btn1: TButton
    Left = 193
    Top = 22
    Width = 50
    Height = 21
    Caption = 'Suma'
    TabOrder = 3
    OnClick = btn1Click
  end
  object btn2: TButton
    Left = 193
    Top = 49
    Width = 50
    Height = 21
    Caption = 'Resta'
    TabOrder = 4
    OnClick = btn2Click
  end
  object Edit4: TEdit
    Left = 354
    Top = 26
    Width = 56
    Height = 21
    TabOrder = 5
  end
  object Edit5: TEdit
    Left = 535
    Top = 26
    Width = 56
    Height = 21
    Color = clInactiveCaption
    TabOrder = 6
    Text = 'Result'
  end
  object btn3: TButton
    Left = 416
    Top = 12
    Width = 113
    Height = 25
    Caption = 'Celsius a Fahrenheit'
    TabOrder = 7
    OnClick = btn3Click
  end
  object btn4: TButton
    Left = 416
    Top = 38
    Width = 113
    Height = 25
    Caption = 'Fahrenheit a Celsius'
    TabOrder = 8
    OnClick = btn4Click
  end
  object StringGrid1: TStringGrid
    Left = 8
    Top = 146
    Width = 607
    Height = 232
    ColCount = 4
    FixedCols = 0
    RowCount = 200
    TabOrder = 9
    ColWidths = (
      127
      233
      113
      110)
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
    Left = 46
    Top = 115
    Width = 145
    Height = 25
    Caption = 'Consulta Produccion'
    TabOrder = 10
    OnClick = btn5Click
  end
  object pb1: TProgressBar
    Left = 46
    Top = 97
    Width = 145
    Height = 17
    TabOrder = 11
  end
  object btn6: TButton
    Left = 230
    Top = 115
    Width = 115
    Height = 25
    Caption = 'Consulta Asegurado'
    TabOrder = 12
    OnClick = btn6Click
  end
  object Edit6: TEdit
    Left = 351
    Top = 115
    Width = 250
    Height = 21
    TabOrder = 13
  end
end
