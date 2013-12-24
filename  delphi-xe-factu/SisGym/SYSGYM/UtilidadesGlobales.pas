unit UtilidadesGlobales;

interface



 uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frmBaseUt, ExtCtrls, FMTBcd, StdCtrls, DB, DBClient, Provider,
  SqlExpr, DBXCommon, Buttons;
type
 vShowStyle = (vShow, vShowModal);

 //funciones para consultar a la bd
 function ConsultaBD(FuenteDeDato: TDataSet):Boolean; overload;
 function ConsultaBD(FuentesDeDatos: array of TDataSet):Boolean; overload;
 //funcion que permite grabar datos
 function GrabarEnBD(DatosAGrabar: TDataSet; ProgramaActivo:TObject=nil;
  Refrescar:Boolean=True; MostrarMensajeError:Boolean=false):Boolean; overload;
 function GrabarEnBD(DatosAGrabar : array of TDataSet):Boolean; overload;
 // funcion que borra registros
 function BorrarEnBD(DatosABorrar: TDataSet):Boolean;

 {Controla el desplazamiento de registros con los botones de mov.}
procedure MoviendoRegistro(QryMante:TClientDataSet; Sender:TObject; const Botones: array of TSpeedButton);
 {Reemplazar where de condicione en los queris}
procedure RemplazarWhere(QrySQL:TSQLQuery; TxtWhere:string=''); overload;
procedure RemplazarWhere(QrySQL: TSQLQuery; PosicionWhere: Integer; TxtWhere: string=''); overload;
procedure msgError (mensaje, titulo : String);
procedure msgInfo (mensaje, titulo : String);
procedure msgAtencion (mensaje, titulo : String);
function msgOKn (mensaje, titulo : String) : boolean;
function msgSi (mensaje, titulo : String) : boolean;
function msgSin (mensaje, titulo : String) : boolean;
function msgOK (mensaje, titulo : String) : boolean;

procedure CrearFormulario(TvForm: TFormClass; vEstiloShow: vShowStyle = vShow);

var
 vOKConexion: Boolean; //el datamodule setea para iniciar el frmPrincipal

implementation
 uses dmIniDatosUt;


function ConsultaBD(FuenteDeDato: TDataSet):Boolean;
  begin
    Result:= False;
    try
      FuenteDeDato.Close;
      FuenteDeDato.Open;
      Result:= true;
    except
      on E: Exception do
      begin
        ShowMessage( E.Message);
      end;
    end;
  end;

function ConsultaBD(FuentesDeDatos: array of TDataSet):Boolean;
  var
    i: Shortint;
  begin
    Result:= false;
    for i:= Low(FuentesDeDatos) to High(FuentesDeDatos) do
    begin
      FuentesDeDatos[i].Close;
      if not ConsultaBD( FuentesDeDatos[i] ) then
        Exit;
      Result:= True;
    end;
  end;

function GrabarEnBD(DatosAGrabar: TDataSet; ProgramaActivo:TObject=nil;
         Refrescar: Boolean=True; MostrarMensajeError:Boolean=false):Boolean;
var
  TD: TDBXTransaction;
begin
  Result:= false;

  TD := dmIniDatos.conAccesoBD.BeginTransaction;
  try
    if TClientDataSet(DatosAGrabar).ApplyUpdates(0) > 0 then
      Abort
    else
     begin
      dmIniDatos.conAccesoBD.CommitFreeAndNil(TD);
      if Refrescar then
        TClientDataSet(DatosAGrabar).Refresh;
      Result:= true;
     end;
  except
    if dmIniDatos.conAccesoBD.InTransaction then
      dmIniDatos.conAccesoBD.RollbackFreeAndNil(TD);
      if MostrarMensajeError then
        ShowMessage('Error, Verifique');
      Exit;
    TClientDataSet(DatosAGrabar).CancelUpdates;
    TClientDataSet(DatosAGrabar).Refresh;
    if MostrarMensajeError then
      ShowMessage('Error, Verifique ');
  end;
end;

function GrabarEnBD(DatosAGrabar : array of TDataSet):Boolean; overload;
var
  i: Shortint;
  TD: TDBXTransaction;
begin
  Result:= false;

  TD := dmIniDatos.conAccesoBD.BeginTransaction;
  try
    for i:= Low(DatosAGrabar) to High(DatosAGrabar) do
    begin
      if TClientDataSet(DatosAGrabar[i]).ApplyUpdates(0) > 0 then
        Abort;
    end;
    dmIniDatos.conAccesoBD.CommitFreeAndNil(TD);
    Result:= true;

    for i:= Low(DatosAGrabar) to High(DatosAGrabar) do
      TClientDataSet(DatosAGrabar[i]).Refresh;
  except
    if dmIniDatos.conAccesoBD.InTransaction then
      dmIniDatos.conAccesoBD.RollbackFreeAndNil(TD);
    for i:= Low(DatosAGrabar) to High(DatosAGrabar) do
      TClientDataSet(DatosAGrabar[i]).CancelUpdates;
    for i:= Low(DatosAGrabar) to High(DatosAGrabar) do
      TClientDataSet(DatosAGrabar[i]).Refresh;
  end;
end;

function BorrarEnBD(DatosABorrar: TDataSet):Boolean;
var
  TransaControl: TDBXTransaction;
begin
  Result:= false;
  try
    TransaControl := dmIniDatos.conAccesoBD.BeginTransaction;
    DatosABorrar.Delete;
    if TClientDataSet(DatosABorrar).ApplyUpdates(0) = 0 then
    begin
      dmIniDatos.conAccesoBD.CommitFreeAndNil(TransaControl);
      Result:= True;
    end
    else
      Abort;
  except
    if dmIniDatos.conAccesoBD.InTransaction then
      dmIniDatos.conAccesoBD.RollbackFreeAndNil(TransaControl);
    TClientDataSet(DatosABorrar).CancelUpdates;
    TClientDataSet(DatosABorrar).Refresh;
  end;
end;

procedure MoviendoRegistro(QryMante: TClientDataSet; Sender: TObject; const Botones: array of TSpeedButton);
var
  i: integer;
  NombreBtn: string;

begin
  if QryMante.IsEmpty then
    Exit;
  NombreBtn := UpperCase((Sender as TSpeedButton).Name);
  if NombreBtn = 'BTNPRIMERO' then        QryMante.First
  else if NombreBtn = 'BTNANTERIOR' then  QryMante.Prior
  else if NombreBtn = 'BTNSIGUIENTE' then QryMante.Next
  else QryMante.Last;
  for i:= Low(Botones) to High(Botones) do
  begin
    NombreBtn:= UpperCase((Botones[i] as TSpeedButton).Name);
    if (NombreBtn = 'BTNPRIMERO') or (NombreBtn = 'BTNANTERIOR') then
      (Botones[i] as TSpeedButton).Enabled := not QryMante.Bof
    else
      (Botones[i] as TSpeedButton).Enabled := not QryMante.Eof
  end;
end;

procedure RemplazarWhere(QrySQL: TSQLQuery; TxtWhere: string='');
var
  TextoSql, Txt2: string;
  posi, posi2, i, x: integer;

begin
  posi2 := AnsiPos('ORDER BY', UpperCase(Trim(QrySQL.Sql.Text)));
  Posi:= 0;
  i:= AnsiPos('WHERE', UpperCase(Trim(QrySQL.Sql.Text)));
  Txt2 := Trim(QrySQL.Sql.Text);
  while i > 0 do
  begin
    posi:= posi + i+5;
    x := AnsiPos('(', Copy(Txt2, 1, i-1));
    if x=0 then
    begin
      i:=0;
      Posi:= Posi-6;
    end
    else
    begin
      x := AnsiPos('SELECT', Copy(Txt2, 1, i-1));
      if (x<=1) then
      begin
        if AnsiPos('SELECT', Copy(Txt2, x+6, i-1))=0 then
          i:=0;
        Posi:= Posi-6;
        Txt2 := Trim(Copy(Txt2, i+5, Length(Txt2)));
      end
      else
      begin
        Txt2 := Trim(Copy(Txt2, i+5, Length(Txt2)));
        i:= AnsiPos('WHERE', Txt2);
        if i=0 then
          Posi:= Posi2-1;
      end;
    end;
  end;
  if posi > 0 then//ya tiene where
  begin
    if TxtWhere <> '' then
      TextoSql:= Copy(QrySQL.SQl.Text ,1 ,posi) +' WHERE '+ TxtWhere
    else
      TextoSql:= Copy(QrySQL.Sql.Text ,1 ,posi-1);
  end
  else
  begin
    TextoSql := Trim(QrySQL.Sql.Text);
    if TxtWhere <> '' then
    begin
      if Posi2 > 0 then
        Insert(' WHERE '+ TxtWhere, TextoSql, Posi2-1)
      else
        TextoSql:= Trim(TextoSql) + ' WHERE '+ TxtWhere;
    end;
  end;
  if (posi2 > 0) and (Posi > 0) then
    TextoSql:= Trim(TextoSql) +' '+ Copy(QrySQL.Sql.Text, posi2, Length(QrySQL.SQL.Text) - posi2);
  QrySQL.SQL.Text:= Trim(TextoSql);
end;

procedure RemplazarWhere(QrySQL: TSQLQuery; PosicionWhere: Integer; TxtWhere: string='');
var
  TextoCompletoSQL,
  TextoTrabajoSQL,
  TextoOrderBySQL: string;
  PosicionOrderBy,
  LargoTextoCompletoSQL,
  Inicial,
  Contador,
  x: integer;
  Salir: Boolean;

begin
  TextoOrderBySQL:= EmptyStr;
  LargoTextoCompletoSQL:= Length(Trim(QrySQL.Sql.Text));
  //almacena la Posicion de ORDER BY
  PosicionOrderBy := AnsiPos('ORDER BY', UpperCase(Trim(QrySQL.Sql.Text)));
  TextoCompletoSQL:= Trim(QrySQL.Sql.Text); //se agrego => UpperCase()22/03/04
  if PosicionOrderBy > 0 then
  begin//con ORDER BY
    TextoOrderBySQL:= Trim(Copy(TextoCompletoSQL, PosicionOrderBy, LargoTextoCompletoSQL));
    TextoTrabajoSQL:= Copy(TextoCompletoSQL, 1, PosicionOrderBy-1);
  end
  else//sin ORDER BY
    TextoTrabajoSQL:= TextoCompletoSQL;
  // Control de Ultimo WHERE valido
  if TxtWhere <> EmptyStr then
    TxtWhere:= 'WHERE '+ TxtWhere;
  Salir:= false;
  Contador:=0;
  Inicial:= 0;
  while not Salir do
  begin
    x:= AnsiPos('WHERE', UpperCase(TextoTrabajoSQL));
    Inicial:= Inicial + x + 5;
    if x > 0 then
    begin
      Inc(Contador);
      TextoTrabajoSQL := Trim(Copy(TextoTrabajoSQL, x+5, LargoTextoCompletoSQL));
      if Contador = PosicionWhere then
      begin
        TextoTrabajoSQL := Copy(TextoCompletoSQL,1, Inicial-6);
        Salir:=true;
      end;
    end
    else
    begin//no tiene WHERE
      if PosicionOrderBy > 0 then
      begin//con ORDER BY
        TextoOrderBySQL:= Trim(Copy(TextoCompletoSQL, PosicionOrderBy, LargoTextoCompletoSQL));
        TextoTrabajoSQL:= Copy(TextoCompletoSQL, 1, PosicionOrderBy-1);
      end
      else//sin ORDER BY
        TextoTrabajoSQL:= TextoCompletoSQL;
      Salir:=true;
    end;
  end;
  QrySQL.SQL.Text:= Trim(Trim(TextoTrabajoSQL) + ' '+Trim(TxtWhere) +' '+ Trim(TextoOrderBySQL));
end;


//mensaje de error, con el botón "Aceptar"
procedure msgError (mensaje, titulo : String);
begin
  Application.MessageBox(pchar(mensaje),pchar(titulo), (MB_OK + MB_ICONSTOP));
end;

//mensaje de información, con el botón "Aceptar"
procedure msgInfo (mensaje, titulo : String);
begin
  application.MessageBox(pchar(mensaje),pchar(titulo),(MB_OK + MB_ICONINFORMATION));
end;

//mensaje de confirmación, con los botones Sí/No, devuelve True si se pulsa "Sí"
//el botón por defecto será "Sí"
function msgSi (mensaje, titulo : String) : boolean;
begin
  if application.MessageBox (pchar(mensaje),pchar(titulo), (MB_YESNO + MB_ICONQUESTION)) = IDYES then
    result := true
  else
    result := false;
end;

//mensaje de confirmación, con los botones Sí/No, devuelve True si se pulsa "Sí"
//el botón por defecto será "No"
function msgSin (mensaje, titulo : String) : boolean;
begin
  if application.MessageBox (pchar(mensaje),pchar(titulo), (MB_YESNO + MB_DEFBUTTON2 + MB_ICONQUESTION)) = IDYES then
    result := true
  else
    result := false;
end;


//mensaje de exclamación, con los botones Aceptar/Cancelar, devuelve True si se pulsa "Aceptar"
//el botón por defecto será "Aceptar"
function msgOK (mensaje, titulo : String) : boolean;
begin
  if application.MessageBox (pchar(mensaje),pchar(titulo), (MB_OKCANCEL + MB_ICONWARNING)) = IDOK then
    result := true
  else
    result := false;
end;

//mensaje de exclamación, con los botones Aceptar/Cancelar, devuelve True si se pulsa "Aceptar"
//el botón por defecto será "Cancelar"
function msgOKn (mensaje, titulo : String) : boolean;
begin
  if application.MessageBox (pchar(mensaje),pchar(titulo), (MB_OKCANCEL + MB_DEFBUTTON2 + MB_ICONWARNING)) = IDOK then
    result := true
  else
    result := false;
end;

//mensaje de exclamación, con el botón Aceptar
procedure msgAtencion (mensaje, titulo : String);
begin
  application.MessageBox(pchar(mensaje),pchar(titulo), (MB_OK + MB_ICONWARNING));
end;

procedure CrearFormulario(TvForm: TFormClass; vEstiloShow: vShowStyle);
var i: Integer;
begin
  i:= Screen.FormCount-1;
  while (i > 0) and not (Screen.Forms[i] is TvForm) do Dec(i);
  if Screen.Forms[i] is TvForm then
   if vEstiloShow = vShow then
    Screen.Forms[i].Show
   else
    Screen.Forms[i].ShowModal
  else
   if vEstiloShow = vShow then
    TvForm.Create(Application).Show
   else
    TvForm.Create(Application).ShowModal;
end;

end.
