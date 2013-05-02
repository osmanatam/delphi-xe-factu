program ProyectoXE;

uses
  ExceptionLog,
  Forms,
  frmPrincipalMain in 'frmPrincipalMain.pas' {frmMain},
  about in 'about.pas' {AboutBox},
  frmBase in 'frmBase.pas' {frmBaseUt},
  frmArticulo in 'frmArticulo.pas' {frmArticuloUt},
  frmAgencia in 'frmAgencia.pas' {frmAgenciaUt},
  Utilidades in 'Utilidades.pas',
  DataModule in 'DataModule.pas' {DataModule1: TDataModule},
  frmLogin in 'frmLogin.pas' {FLogin};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
