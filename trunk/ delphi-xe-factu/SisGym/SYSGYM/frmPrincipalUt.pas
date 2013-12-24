unit frmPrincipalUt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus;

type
  TfrmPrincipal = class(TForm)
    mmMenu: TMainMenu;
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
 CrearFormulario(TfrmEstudiosCorporeos);
end;

procedure TfrmPrincipal.mnuCreditosClick(Sender: TObject);
begin
 CrearFormulario(TfrmAcercaDe);
end;

procedure TfrmPrincipal.mnuPEMantenimientodePersonasClick(Sender: TObject);
begin
 CrearFormulario(TfrmSocios);
end;

end.
