program ProyectoSysGym;

uses
  ExceptionLog,
  Forms,
  frmPrincipalUt in 'frmPrincipalUt.pas' {frmPrincipal},
  frmBaseUt in 'frmBaseUt.pas' {frmBase},
  frmEstudiosCorporeosUt in 'frmEstudiosCorporeosUt.pas' {frmEstudiosCorporeos},
  dmIniDatosUt in 'dmIniDatosUt.pas' {dmIniDatos: TDataModule},
  frmAcercaDeUt in 'frmAcercaDeUt.pas' {frmAcercaDe},
  UtilidadesGlobales in 'UtilidadesGlobales.pas',
  frmABMCUt in 'frmABMCUt.pas' {frmBaseABMC},
  frmSociosUt in 'frmSociosUt.pas' {frmSocios};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmIniDatos, dmIniDatos);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
