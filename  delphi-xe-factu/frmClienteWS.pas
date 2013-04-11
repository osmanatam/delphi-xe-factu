unit frmClienteWS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ComCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    btn1: TButton;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    btn2: TButton;
    Edit4: TEdit;
    Edit5: TEdit;
    btn3: TButton;
    btn4: TButton;
    StringGrid1: TStringGrid;
    btn5: TButton;
    pb1: TProgressBar;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
       uses  IWsPrueba1, tempconvert;
{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
begin
  try
    Edit3.Text:=IntToStr(GetIWsPrueba.Suma(StrToInt(Edit1.Text),StrToInt(Edit2.Text)));
  except
    ShowMessage('Error en el Servicio');
  end;
 end;
procedure TForm1.btn2Click(Sender: TObject);
begin
  try
    Edit3.Text:=IntToStr(GetIWsPrueba.Resta(StrToInt(Edit1.Text),StrToInt(Edit2.Text)));
  except
    ShowMessage('Error en el Servicio');
  end;
end;

procedure TForm1.btn3Click(Sender: TObject);
begin
 Edit5.Text:=GetTempConvertSoap.CelsiusToFahrenheit(Edit4.Text);
end;

procedure TForm1.btn4Click(Sender: TObject);
begin
  Edit5.Text:=GetTempConvertSoap.FahrenheitToCelsius(Edit4.Text);
end;

procedure TForm1.btn5Click(Sender: TObject);
 var
    ParamResp : trRet_Produccion;
    I,j : Integer;
    Deta : TArrayProduccion;
begin
   ParamResp := GetIWsPrueba.ConsultaProduccion();
  //Vacia los datos de las tablas
  for I := 1 to 200 do
    for j := 0 to 3 do
      StringGrid1.Cells[j,i] := '';
  //Cabeceras
  With StringGrid1 do
   Begin
     Cells[0,0] := 'Sucursal';
     Cells[1,0] := 'Produccion Acumulada';
     Cells[2,0] := 'Produccion Mes';
     Cells[3,0] := 'Meta Produccion';
   End;
   //Rellena con los datos que arroja el WebSerice
   pb1.Step := 10;
   for I := 0  to High(ParamResp.DET_produccion) do
   begin
      pb1.StepIt;
      sleep(300);
      Deta := ParamResp.DET_produccion[I];
      if Deta <> nil then
      begin
       With StringGrid1 do
         Begin
           Cells[0,i+1] := ParamResp.DET_produccion[i].DET_Prod_Sucursal;
           Cells[1,i+1] := FloatToStr(ParamResp.DET_produccion[i].DET_Prod_Acumulada);
           Cells[2,i+1] := FloatToStr(ParamResp.DET_produccion[i].DET_Prod_Mes );
           Cells[3,i+1] := FloatToStr(ParamResp.DET_produccion[i].DET_Prod_Meta);
         End;
      end;
   end;
   pb1.Position:=100;
   ParamResp.Free;
end;

end.
