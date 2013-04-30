program ProyectoXE;

uses
  ExceptionLog,
  Forms,
  frmPrincipalMain in 'frmPrincipalMain.pas' {frmMain},
  about in 'about.pas' {AboutBox},
  frmBase in 'frmBase.pas' {frmBaseUt},
  frmArticulos in 'frmArticulos.pas' {frmBaseArticulo};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
