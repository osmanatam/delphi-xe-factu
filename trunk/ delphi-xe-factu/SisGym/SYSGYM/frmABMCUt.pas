unit frmABMCUt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frmBaseUt, ExtCtrls, FMTBcd, StdCtrls, DB, DBClient, Provider,
  SqlExpr, Buttons, DBGridEhGrouping, GridsEh, DBGridEh, ComCtrls;

type
  TfrmBaseABMC = class(TfrmBase)
    pnlCabecera: TPanel;
    pnlPie: TPanel;
    qryCabecera: TSQLQuery;
    pvdCabecera: TDataSetProvider;
    cdsCabecera: TClientDataSet;
    dsCabecera: TDataSource;
    btnNuevoGrabar: TButton;
    btnEditar: TButton;
    btnEliminar: TButton;
    btnPrimero: TSpeedButton;
    btnAnterior: TSpeedButton;
    btnSiguiente: TSpeedButton;
    btnUltimo: TSpeedButton;
    pgc1: TPageControl;
    tsConsulta: TTabSheet;
    tsMantenimiento: TTabSheet;
    pnlPnlParametrosBus: TPanel;
    pnlBuscar: TPanel;
    btnMostrar: TBitBtn;
    dbGrillaConsulta: TDBGridEh;
    qryDetalle: TSQLQuery;
    pvdDetalle: TDataSetProvider;
    cdsDetalle: TClientDataSet;
    dsDetalle: TDataSource;
    procedure btnAcciones(Sender: TObject);
    procedure btnMoverRegistros(Sender: TObject);
    procedure btnMostrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    function ObtenerCondicionWhere :String; virtual; abstract;
  end;

var
  frmBaseABMC: TfrmBaseABMC;

implementation
  uses dmIniDatosUt, UtilidadesGlobales;
{$R *.dfm}

procedure TfrmBaseABMC.btnAcciones(Sender: TObject);
begin
  inherited;
  if Sender=btnNuevoGrabar then
   begin
    if btnNuevoGrabar.Caption='Nuevo' then
     begin
        cdsCabecera.Insert;
        btnNuevoGrabar.Caption:='Guardar';
        btnEliminar.Caption:='Cancelar';
        btnEditar.Enabled:=False;
        btnEliminar.Enabled:=True;
     end
    else
     begin
        btnNuevoGrabar.Caption:='Nuevo';
        btnEliminar.Caption:='Eliminar';
        btnEditar.Enabled:=True;
        btnEliminar.Enabled:=True;
     end;
   end;
  ///////
  if Sender=btnEliminar then
  begin
    if btnEliminar.Caption='Cancelar' then
     begin
      cdsCabecera.Cancel;
      btnEditar.Enabled:=True;
      btnNuevoGrabar.Caption:='Nuevo';
      btnEliminar.Caption:='Eliminar';
     end
    else
    begin
      if BorrarEnBD(CdsCabecera) then
         btnMostrar.Click;
    end;

  end;
  //////
  if sender=btnEditar then
   begin
    cdsCabecera.Edit;
    btnNuevoGrabar.Caption:='Guardar';
    btnEliminar.Caption:='Cancelar';
    btnEditar.Enabled:=False;
   end;
end;

procedure TfrmBaseABMC.btnMostrarClick(Sender: TObject);
begin
  inherited;
  RemplazarWhere(QryCabecera, ObtenerCondicionWhere);
  ConsultaBD(CdsCabecera);
  pnlBuscar.Visible := False;
end;

procedure TfrmBaseABMC.btnMoverRegistros(Sender: TObject);
begin
  inherited;
  MoviendoRegistro(cdsCabecera, Sender,
    [btnprimero, btnanterior, btnsiguiente, btnultimo]);
end;

end.
