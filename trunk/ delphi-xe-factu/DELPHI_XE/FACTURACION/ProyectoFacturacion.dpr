program ProyectoFacturacion;

uses
  ExceptionLog,
  Forms,
  frmPrincipal in 'frmPrincipal.pas' {frmMenuPrincipal},
  frmLogin in 'frmLogin.pas' {FLogin},
  DataModule in 'DataModule.pas' {DataModule1: TDataModule},
  frmTablaMenor in 'frmTablaMenor.pas' {frmTablaMenorPadre},
  frmPais in 'frmPais.pas' {frmTablaMenorPais},
  frmTipoIVA in 'frmTipoIVA.pas' {frmTablaMenorIVA},
  frmUnidadMedida in 'frmUnidadMedida.pas' {frmTablaMenorUM},
  frmModeloFormulario in 'frmModeloFormulario.pas' {frmBaseTM},
  frmPaisUlt in 'frmPaisUlt.pas' {frmBaseTMPais},
  frmEmpresa in 'frmEmpresa.pas' {frmBaseTMEmpresa},
  frmAgencia in 'frmAgencia.pas' {frmBaseTMAgencia},
  frmArticulos in 'frmArticulos.pas' {frmArticulosUt},
  frmMostrarImagenes in 'frmMostrarImagenes.pas' {frmImagenes},
  frmCiudadUlt2 in 'frmCiudadUlt2.pas' {frmCiudad2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TFLogin, FLogin);
  Application.CreateForm(TfrmMenuPrincipal, frmMenuPrincipal);
  Application.Run;
end.
