program ImagenesToBD;

uses
  ExceptionLog,
  Forms,
  frmImagen in 'frmImagen.pas' {Form1},
  frmVerImagen in 'frmVerImagen.pas' {Form2},
  frmPersona in 'frmPersona.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
