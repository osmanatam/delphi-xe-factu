unit frmPrincipalUt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus;

type
  TfrmPrincipal = class(TForm)
    mm1: TMainMenu;
    mnuPersonas: TMenuItem;
    mnuChequeos: TMenuItem;
    mnuPEMantenimientodePersonas: TMenuItem;
    mnuContexturaCorporal: TMenuItem;
    mnuAcercaDe: TMenuItem;
    mnuCreditos: TMenuItem;
    procedure mnuPEMantenimientodePersonasClick(Sender: TObject);
    procedure mnuContexturaCorporalClick(Sender: TObject);
    procedure mnuCreditosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation
  uses frmSociosUt,frmEstudiosCorporeosUt, frmAcercaDeUt, UtilidadesGlobales;
{$R *.dfm}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  if not vOKConexion then
    Application.Terminate;
end;

procedure TfrmPrincipal.mnuContexturaCorporalClick(Sender: TObject);
begin
  if not Assigned(frmEstudiosCorporeos) then
    frmEstudiosCorporeos:= tfrmEstudiosCorporeos.Create(Self);
  frmEstudiosCorporeos.Show;
end;

procedure TfrmPrincipal.mnuCreditosClick(Sender: TObject);
begin
  if not Assigned(frmAcercaDe) then
    frmAcercaDe:=TfrmAcercaDe.Create(Self);
  frmAcercaDe.Show;
end;

procedure TfrmPrincipal.mnuPEMantenimientodePersonasClick(Sender: TObject);
begin
  if not Assigned(frmSocios) then
    frmSocios:=TfrmSocios.Create(Self);
  frmSocios.Show;
end;

end.
