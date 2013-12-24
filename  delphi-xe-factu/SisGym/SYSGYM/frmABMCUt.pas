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
    pgcBase: TPageControl;
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dsCabeceraStateChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbGrillaConsultaDblClick(Sender: TObject);
    procedure pgcBaseChange(Sender: TObject);
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
var BookMarkCab,BookMarkDet: TBookmark;
begin
  inherited;
  BookMarkCab:=cdsCabecera.Bookmark;
  BookMarkDet:=cdsDetalle.Bookmark;
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

        if not GrabarEnBD(cdsCabecera) then
         begin
          msgError('Ocurrio algun imprevisto, verifique','Error en Grabar');
          Exit;
         end;
        btnNuevoGrabar.Caption:='Nuevo';
        btnEliminar.Caption:='Eliminar';
        btnEditar.Enabled:=True;
        btnEliminar.Enabled:=True;
        cdsCabecera.Refresh; cdsDetalle.Refresh;

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
       begin
         btnMostrar.Click;
         ConsultaBD([cdsCabecera,cdsDetalle]);
         cdsCabecera.Bookmark:=BookMarkCab;
         cdsDetalle.Bookmark:=BookMarkDet;
       end;
    end;
  end;
  //////
  if sender=btnEditar then
    cdsCabecera.Edit;

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

procedure TfrmBaseABMC.dbGrillaConsultaDblClick(Sender: TObject);
begin
  inherited;
  pgcBase.ActivePageIndex:=1;
  btnNuevoGrabar.Visible:=True;
  btnEditar.Visible:=True;
  btnEliminar.Visible:=True;
end;

procedure TfrmBaseABMC.dsCabeceraStateChange(Sender: TObject);
begin
  inherited;
  if cdsCabecera.State = dsEdit then
   begin
    btnNuevoGrabar.Caption:='Guardar';
    btnEliminar.Caption:='Cancelar';
    btnEditar.Enabled:=False;
   end;
end;

procedure TfrmBaseABMC.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
   Action:= caFree;
end;

procedure TfrmBaseABMC.FormCreate(Sender: TObject);
begin
  inherited;
  pgcBase.ActivePageIndex:=0;
end;

procedure TfrmBaseABMC.pgcBaseChange(Sender: TObject);
begin
  inherited;
  btnNuevoGrabar.Visible:=pgcBase.ActivePageIndex=1;
  btnEditar.Visible:=pgcBase.ActivePageIndex=1;
  btnEliminar.Visible:=pgcBase.ActivePageIndex=1;

end;

end.
