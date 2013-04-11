program ClientWS;

uses
  ExceptionLog,
  Forms,
  frmClienteWS in 'frmClienteWS.pas' {Form1},
  tempconvert in 'tempconvert.pas',
  IWsPrueba1 in 'IWsPrueba1.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
