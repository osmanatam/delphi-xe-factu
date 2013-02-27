program ProyectoFacturacionXE;

uses
  ExceptionLog,
  Forms,
  frmPrincipal in 'frmPrincipal.pas' {frmMenuPrincipal},
  frmLogin in 'frmLogin.pas' {FLogin},
  DataModule in 'DataModule.pas' {DataModule1: TDataModule},
  frmModeloFormulario in 'frmModeloFormulario.pas' {frmBaseTM},
  frmPaisUlt in 'frmPaisUlt.pas' {frmBaseTMPais},
  frmEmpresa in 'frmEmpresa.pas' {frmBaseTMEmpresa},
  frmAgencia in 'frmAgencia.pas' {frmBaseTMAgencia},
  frmArticulos in 'frmArticulos.pas' {frmArticulosUt},
  Utilidades in 'Utilidades.pas',
  frmCiudad in 'frmCiudad.pas' {frmCiudad2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TFLogin, FLogin);
  Application.CreateForm(TfrmMenuPrincipal, frmMenuPrincipal);
  Application.Run;
end.
