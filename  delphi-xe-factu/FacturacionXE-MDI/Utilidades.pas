unit Utilidades;

interface
   uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Mask,
  Db, StdCtrls, DBCtrls, //BD controles
  dxfLabel, dxfProgressBar, //TdxfLabel
  SqlExpr, DBClient,   //DbExpress
  DBXCommon, //XE
  ppReport, ppCtrls, ppViewr, ppVar, ppArchiv, ppDBPipe, ppTypes, ppFilDev, ppTmplat, ppRegion,//RBuilder, TppDBPipeLine
  Menus, //TMenuItems
  Variants, //Null
  ComCtrls,  Buttons,   // TTreeView
  DBGrids,
  ExtCtrls,   //TPanel
  DateUtils,   //Utilitario para manejo de fecha
  DBCtrlsEh, DBGridEh,  ToolCtrlsEh, DBLookupEh,  //Grilla EhLib
  ScktComp,   //Cambio de Fecha de la Maq. desde el Servidor
  ATexto, dsTaskBar,
  Printers, //por busqueda de Impresora
  dxfOutlookBar, //por barra de outlook CambiarTituloSeleccion(
  dxfCheckBox, //dfxcheckbox
  Registry ,TlHelp32,  Wpdbrich, psapi,
  pngimage,//para png imagen
  //psapi,
   ShellAPI;
   procedure HoraDelServidor;
   procedure msError (mensaje, titulo : String);
   procedure msInfo (mensaje, titulo : String);
   procedure msAtencion (mensaje, titulo : String);
   function msOKn (mensaje, titulo : String) : boolean;
   function msSi (mensaje, titulo : String) : boolean;
   function msSin (mensaje, titulo : String) : boolean;
   function msOK (mensaje, titulo : String) : boolean;
   function CrearFormulario(vPrg: TForm): Boolean;
implementation
  uses
     DataModule, frmPrincipalMain;


//mensaje de error, con el botón "Aceptar"
procedure msError (mensaje, titulo : String);
begin
  Application.MessageBox(pchar(mensaje),pchar(titulo), (MB_OK + MB_ICONSTOP));
end;

//mensaje de información, con el botón "Aceptar"
procedure msInfo (mensaje, titulo : String);
begin
  application.MessageBox(pchar(mensaje),pchar(titulo),(MB_OK + MB_ICONINFORMATION));
end;

//mensaje de confirmación, con los botones Sí/No, devuelve True si se pulsa "Sí"
//el botón por defecto será "Sí"
function msSi (mensaje, titulo : String) : boolean;
begin
  if application.MessageBox (pchar(mensaje),pchar(titulo), (MB_YESNO + MB_ICONQUESTION)) = IDYES then
    result := true
  else
    result := false;
end;

//mensaje de confirmación, con los botones Sí/No, devuelve True si se pulsa "Sí"
//el botón por defecto será "No"
function msSin (mensaje, titulo : String) : boolean;
begin
  if application.MessageBox (pchar(mensaje),pchar(titulo), (MB_YESNO + MB_DEFBUTTON2 + MB_ICONQUESTION)) = IDYES then
    result := true
  else
    result := false;
end;


//mensaje de exclamación, con los botones Aceptar/Cancelar, devuelve True si se pulsa "Aceptar"
//el botón por defecto será "Aceptar"
function msOK (mensaje, titulo : String) : boolean;
begin
  if application.MessageBox (pchar(mensaje),pchar(titulo), (MB_OKCANCEL + MB_ICONWARNING)) = IDOK then
    result := true
  else
    result := false;
end;

//mensaje de exclamación, con los botones Aceptar/Cancelar, devuelve True si se pulsa "Aceptar"
//el botón por defecto será "Cancelar"
function msOKn (mensaje, titulo : String) : boolean;
begin
  if application.MessageBox (pchar(mensaje),pchar(titulo), (MB_OKCANCEL + MB_DEFBUTTON2 + MB_ICONWARNING)) = IDOK then
    result := true
  else
    result := false;
end;

//mensaje de exclamación, con el botón Aceptar
procedure msAtencion (mensaje, titulo : String);
begin
  application.MessageBox(pchar(mensaje),pchar(titulo), (MB_OK + MB_ICONWARNING));
end;

//cambiar fecha y hora de la maquina a la del Servidor
procedure HoraDelServidor;
var
   HoraSistema: TSystemTime;
   NewTime: TDateTime;
begin
  DataModule1.DMQuery.SQL.Add('SELECT CAST (''NOW'' AS TIMESTAMP) as ACTUAL FROM RDB$DATABASE');
  DataModule1.DMQuery.Open;
  NewTime := DataModule1.DMQuery.FieldByName('ACTUAL').AsDateTime;
  DateTimeToSystemTime(NewTime, HoraSistema);
  SetLocalTime(HoraSistema);
  DataModule1.DMQuery.Close;
end;

function CrearFormulario(vPrg: TForm): Boolean;
 var
  I: Integer;
  begin
    for I:= frmMain.MDIChildCount - 1 downto 0 do
    begin
      if frmMain.MDIChildren[I] = vPrg then
      begin
        vPrg.BringToFront;
        Result := False;
        Exit;
      end;
    end;
    Result := True;
  end;
end.
