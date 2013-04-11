program MarcacionPatria;

uses
  ExceptionLog,
  Forms,
  frmMarcacion in 'frmMarcacion.pas' {frmPrincipal},
  frmModifica in 'frmModifica.pas' {frmModificacion};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmModificacion, frmModificacion);
  Application.Run;
end.
