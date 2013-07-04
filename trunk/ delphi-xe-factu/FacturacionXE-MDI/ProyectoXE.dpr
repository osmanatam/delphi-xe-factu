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
  frmLogin in 'frmLogin.pas' {FLogin},
  frmBaseAll in 'frmBaseAll.pas' {Form1},
  frmProveedorUt in 'frmProveedorUt.pas' {frmProveedor};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
