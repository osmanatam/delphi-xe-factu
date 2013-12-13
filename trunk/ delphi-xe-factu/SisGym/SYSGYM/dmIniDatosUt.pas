unit dmIniDatosUt;

interface

uses
  SysUtils, Classes, DBXFirebird, DB, SqlExpr, IniFiles, Dialogs;

type
  TdmIniDatos = class(TDataModule)
    conAccesoBD: TSQLConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmIniDatos: TdmIniDatos;

implementation
  uses  UtilidadesGlobales;
{$R *.dfm}

procedure TdmIniDatos.DataModuleCreate(Sender: TObject);
var MyIniFile, ini : TIniFile;
    BBDDName : String;
begin
 MyIniFile := TIniFile.Create(ExtractFilePath(ParamStr(0)) +'\SisGym.ini');
 Try
  if FileExists((ExtractFilePath(ParamStr(0)) +'\SisGym.ini')) then
   begin
    vOKConexion:=True;
    BBDDName:=MyIniFile.ReadString('Configuración','BD','');
    conAccesoBD.Params.Values['Database']:=BBDDName;
    try
     conAccesoBD.Connected:=True;
     conAccesoBD.Connected:=False;
    except
     ShowMessage('Error: Verifique el acceso de la Base de Datos');
     vOKConexion:=False;
    end;
   end
  else
   begin
    ShowMessage('Error: No existe el archivo de configuracion inicial');
    vOKConexion:=False;
    ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) +'\SisGym.ini');
    ini.WriteString('Configuración', 'BD', '');
    ini.free;
   end;
 Finally
  MyIniFile.Free;
 End;
end;

end.
