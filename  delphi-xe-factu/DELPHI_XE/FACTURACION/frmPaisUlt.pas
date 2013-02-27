unit frmPaisUlt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frmModeloFormulario, ExtCtrls, DB, IBCustomDataSet, IBTable, Grids,
  DBGrids, DBCtrls, StdCtrls, Mask, ComCtrls, IBQuery, DBGridEhGrouping,
  GridsEh, DBGridEh, DBClient, Provider;

type
  TfrmBaseTMPais = class(TfrmBaseTM)
    dbedtBANDERA: TDBEdit;
    dbedtBANDERA1: TDBEdit;
    lbl3: TLabel;
    lbl4: TLabel;
    cdsGrillaCODPAIS: TIntegerField;
    tbGrillaNOMBREPAIS: TIBStringField;
    tbGrillaBANDERA: TIBStringField;
    tbGrillaGENTILICIO: TIBStringField;
    procedure dbnvgr1Click(Sender: TObject; Button: TNavigateBtn);
    procedure DBGridEh1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBaseTMPais: TfrmBaseTMPais;

implementation

uses Utilidades;



{$R *.dfm}

procedure TfrmBaseTMPais.DBGridEh1DblClick(Sender: TObject);
begin
  inherited;
  pgc1.ActivePage:= tsABM;
 cdsTablaModelo.Close;
 qryTablaModelo.SQL.Clear;
 qryTablaModelo.SQL.Add('SELECT CODPAIS, NOMBREPAIS, BANDERA, GENTILICIO FROM PAIS WHERE CODPAIS=:COD');
 qryTablaModelo.ParamByName('COD').AsInteger:= StrToInt(Trim(DBGridEh1.Columns[0].Field.Text));
 cdsTablaModelo.Open;
 cdsTablaModelo.First;
end;

procedure TfrmBaseTMPais.dbnvgr1Click(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
   case Button of
    nbInsert:
      begin
         qryMaxCodigo.Active:=true;
         dbedtClave.Text:= qryMaxCodigo.FieldByName('CODPAIS').AsString;
         qryMaxCodigo.Active:=false;
      end;
    nbPost:
      begin
         cdsTablaModelo.ApplyUpdates(0);
         cdsTablaModelo.Close;
         qryTablaModelo.SQL.Clear;
         qryTablaModelo.SQL.Add('SELECT CODPAIS, NOMBREPAIS, BANDERA, GENTILICIO FROM PAIS order by 1');
         cdsTablaModelo.Open;
         pgc1.ActivePage:= tsCONSULTA;
      end;
    nbDelete:
      begin
         if Utilidades.msSi('Esta Seguro Borrar Pais?','Borrar Ciudad') = true then
              cdsTablaModelo.ApplyUpdates(0);
         cdsTablaModelo.Close;
         qryTablaModelo.SQL.Clear;
         qryTablaModelo.SQL.Add('SELECT CODPAIS, NOMBREPAIS, BANDERA, GENTILICIO FROM PAIS order by 1');
         cdsTablaModelo.Open;
         pgc1.ActivePage:= tsCONSULTA;
      end;

   end;
   qryGrilla.Close;
   qryGrilla.Open;
   DBGridEh1.Refresh;
end;
end.
