{ Ejemplo de utilización de Google Maps en Delphi.
  by  Neftalí  -Germán Estévez-  2009
  http://neftali.clubdelphi.com

  NOTA: Este ejemplo y su código es de libre distribución. Si te es de utilidad,
  tienes sugerencias, comentarios o errores puedes escribirlos en mi web.
  Todos ellos serán bienvenidos.  ;-D
  http://neftali.clubdelphi.com

  NOTE: This sampole and its code is freely distributed. If you are useful,
   have suggestions, comments or errors can post it to my website.
   All of them are welcome. ;-D
   http://neftali.clubdelphi.com
}
unit FVerMapa;
{=========================================================================

  FVerMapa

  Unit

  Propósito : Unit que define el Formulario para visualizar un MAPA de google Maps.

//=========================================================================
//
// I N T E R F A C E
//
//=========================================================================}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ActnList, ImgList,
  ComCtrls, ToolWin, ExtCtrls, StdCtrls,
  OleCtrls, SHDocVw, Buttons,
  UConstantes, UTGeoCode;

type

  {: Array de cadenas}
  TArrString = array of string;

  //: Estructura para la búsqueda de recurso
  PResFinder = ^TResFinder;
  TResFinder = record
      ResName:PChar;      // Nombre de recurso que se está buscando.
      ResType:PChar;      // Tipo de recurso que se está buscando.
      Instance:THandle;   // Instancia donde se ha encontrado.
    end;

  {: Formulario del Mapa de Google Maps. }
  TFormVerMapa = class(TForm)
    timerNew: TTimer;
    PanelTitulo: TPanel;
    PanelCentral: TPanel;
    pnlExpandirColapsar: TPanel;
    lblBarra: TLabel;
    pnlOPciones: TPanel;
    lblDir: TLabel;
    label1: TLabel;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    edtDir: TEdit;
    edtLat: TEdit;
    edtLon: TEdit;
    pnl1: TPanel;
    img1: TImage;
    pnl3: TPanel;
    lbl1: TLabel;
    pnlMapa: TPanel;
    webBrowser1: TWebBrowser;
    pnlPos: TPanel;
    Image2: TImage;
    ActionList1: TActionList;
    ActionAceptar: TAction;
    ActionCancelar: TAction;
    ActionAyuda: TAction;
    ActionImprimir: TAction;
    ImageList1: TImageList;
    ActionBuscar: TAction;
    edtZoom: TEdit;
    lblZoom: TLabel;
    cbLugares: TComboBox;
    Label3: TLabel;
    edtTipoMapa: TEdit;
    lblTipo: TLabel;
    StatusBar1: TStatusBar;
    Label4: TLabel;
    sbCerrar: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActionAceptarExecute(Sender: TObject);
    procedure ActionCancelarExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure webBrowser1DocumentComplete(Sender: TObject;
      const pDisp: IDispatch; var URL: OleVariant);
    procedure timerNewTimer(Sender: TObject);
    procedure ActionImprimirMapaExecute(Sender: TObject);
    procedure ActionAbrirGoogleMapsExecute(Sender: TObject);
    procedure ActionBuscarExecute(Sender: TObject);
    procedure ActionRestaurarInicialExecute(Sender: TObject);
    procedure edtDirKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormResize(Sender: TObject);
    procedure cbLugaresChange(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure tbCancelarClick(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure StatusBar1Click(Sender: TObject);
  private
    TSWeb:TStrings;
    FNameWeb:String;
    FDireccion: string;
    FLatitud: string;
    FLongitud: string;
    arr:TArrString;
    FIsAccepted: Boolean;
    DoneVisualization:Boolean;
    FZoom: integer;
    FLugares: TStringList;
    _userZoom:integer;
    _userType:string;

    // Cargar loslugares que hay en disco
    procedure _LoadLugares();
    procedure _SaveLugares();
    // Capturar el mensaje de AfterShow
    procedure _CMAfterShow(var Msg: TMessage); message CM_AFTERSHOW;
    // Visualizar el mapa
    procedure VisualizarMapa(th:TGeoCode;
                             AUserZoom:integer=14;
                             AUserType:string=G_NORMAL_MAP);
    procedure LoadMapa(H, W:integer; AControls:TArrString;
                       Lat,Lon:string; AZoom:Integer;
                       AVisibleMark, AVisibleWindow:Boolean;
                       AMapType:string=STR_EMPTY);
    // devuelve la constante para un tipo de mapa
    function _GetMapTypeConst(ATipoMapa:string):string;

  public
    // Aceptado
    property IsAccepted:Boolean read FIsAccepted write FIsAccepted;
    // Lugares prefijados
    property Lugares:TStringList read FLugares write FLugares;
    
  published
    // direccion a buscar, visualizar
    property Direccion:string read FDireccion write FDireccion;
    // propiedades de posicionamiento
    property Latitud:string read FLatitud write FLatitud;
    property Longitud:string read FLongitud write FLongitud;
    property Zoom:integer read FZoom write FZoom;
  end;

var
  FormVerMapa: TFormVerMapa;

// constantes privadas
const
  FILENAME_MAP = 'Mapa.html';

// Buscar la instancia donde está un determinado recurso.  
function FindInstanceOfResource ( ResourceName:string;
                                  ResourceType:PChar;
                                  out Instance:THandle):Boolean;


//=========================================================================
//
// I M P L E M E N T A T I O N
//
//=========================================================================
implementation

{$R *.dfm}

uses
  {Generales} MSHTML, ShellAPI, StrUtils;

//:Rutina callback para la enumeración de módulos cargados.
function _MyEnumResourceModules (Instance:Longint; Data:Pointer):Boolean;
begin
  // Existe el recursos en esta instancia ?
  if FindResource(Instance, PResFinder(Data).ResName, PResFinder(Data).ResType) <> 0 then begin
    // Apuntarse la instancia donde se ha encontrado
    PResFinder(Data).Instance := Instance;
    // Devolver False para detener la enumeración de instancias
    Result := False;
  end
  else begin
    // Devolver True para continuar la enumeración
    Result := True;
  end;

end;

function FindInstanceOfResource ( ResourceName:string;
                                  ResourceType:PChar;
                                  out Instance:THandle):Boolean;
var
  ResFinder:TResFinder;
begin

  // Inicializar estructura de búsqueda de recurso
  ResFinder.ResName := PChar(ResourceName);
  ResFinder.ResType := ResourceType;
  ResFinder.Instance := 0;

  // Para cada módulo cargado, llamar a '_MyEnumResourceModules'
  EnumResourceModules (_MyEnumResourceModules, @ResFinder);

  // Se ha encontrado alguna instancia ?
  if ResFinder.Instance <> 0 then begin
    // Asignar la instancia encontrada
    Instance := ResFinder.Instance;
    // Devolver True
    Result := True;
  end
  else begin
    // Por seguridad, asignar 0
    Instance := 0;
    // Devolver False
    Result := False;
  end;
end;

procedure TFormVerMapa._LoadLugares();
var
  Str:string;
  i, j:integer;
begin
  // Cargar el fichero de luageres
  if not Assigned(Self.FLugares) then begin
    Self.FLugares := TStringlist.Create();
  end;
  Str := ExtractFilePath(Application.ExeName) + FILENAME_LUGARES;
  // Existe?=
  if FileExists(Str) then begin
    Self.FLugares.Clear;
    Self.FLugares.LoadFromFile(Str);
  end;

   cbLugares.Items.Clear;

  // Cargar al combo
  for i := 0 to (FLugares.Count - 1) do begin
    Str := FLugares[i];
    j := AnsiPos('|', Str);
    if (j > 0) then begin
      Str := Copy(Str, 1, j - 1);
    end;
    cbLugares.Items.Add(Str);
  end;

end;

procedure TFormVerMapa._SaveLugares();
var
  Str:string;
begin
  // Cargar el fichero de luageres
  if not Assigned(Self.FLugares) then begin
    Self.FLugares := TStringlist.Create();
  end;
  Str := ExtractFilePath(Application.ExeName) + FILENAME_LUGARES;
  // Existe?=
  if FileExists(Str) then begin
    Self.FLugares.SaveToFile(Str);
  end;
end;


// evento Show.
procedure TFormVerMapa.FormShow(Sender: TObject);
var
  Str:string;
  i, j:Integer;
begin

//  // INI (Está desplazado para que npo MOLESTE en el diseño)
//  pnlAyuda.Left := 24;
//  pnlAyuda.Visible := False;

  // ini
  TSWeb := TStringList.Create();
  Self.FIsAccepted := False;

  // inicial
  FNameWeb := IncludeTrailingBackslash(ExtractFilePath(Application.ExeName)) +
              FILENAME_MAP;
  // Elementos a visualizar en el mapa
  SetLength(arr, 2);
  arr[0] := MAP_LARGE_CONTROL;
  arr[1] := MAP_TYPE_CONTROL;

  // Cargar el fichero de luageres
  _LoadLugares;

//  // Cargar al combo
//  for i := 0 to (FLugares.Count - 1) do begin
//    Str := FLugares[i];
//    j := AnsiPos('|Zoom', Str);
//    if (j > 0) then begin
//      Str := Copy(Str, 1, j - 1);
//    end
//    else begin
//      j := AnsiPos('|Type', Str);
//      if (j > 0) then begin
//        Str := Copy(Str, 1, j - 1);
//      end
//    end;
//    cbLugares.Items.Add(Str);
//  end;


end;

procedure TFormVerMapa.FormCreate(Sender: TObject);
begin
  inherited;
  // Ini
  DoneVisualization := False;
end;

//: Carga el mapa en el formulario.
procedure TFormVerMapa.LoadMapa(H, W: integer; AControls: TArrString;
                                Lat, Lon: string; AZoom:Integer;
                                AVisibleMark, AVisibleWindow: Boolean;
                                AMapType: string);
const
  EBLOCK = 'TFormVerMapa._LoadMapa';
var
  Str:string;
  i:Integer;

  //············································································
  procedure _AddMarca();
  const
    STR_PREFIX_MARCA = '##MARCA##';
    STR_MARCA1 = '        var point = new GLatLng(%s,%s);';
    STR_MARCA2 = '        var marker = new GMarker(point, {draggable: true});';
    STR_MARCA3 = '        map.addOverlay(marker);';
  var
    i, j:Integer;
    str, line:string;
  begin

    // Buscar la cadena
    for i := 0 to (TSWeb.Count - 1) do begin
      line := Self.TSWeb[i];
      j := AnsiPos(STR_PREFIX_MARCA, line);
      // Es la línea
      if (j > 0) then begin
        if (AVisibleMark) then begin
          Str := Format(STR_MARCA1,[Lat, Lon]);
          Self.TSWeb[i] := Str;
          Self.TSWeb.Insert(i+1, STR_MARCA3);
          Self.TSWeb.Insert(i+1, STR_MARCA2);
        end
        else begin
          Self.TSWeb[i] := STR_EMPTY;
        end;

        // Grabar
        Self.TSWeb.SaveToFile(Self.FNameWeb);

        Break;
      end;
    end;
  end;
  //············································································
  procedure _AddVentana();
  const
    STR_PREFIX_VENTANA = '##VENTANA##';
    STR_VENTANA = '       marker.openInfoWindowHtml(html);';
  var
    i, j:Integer;
    str, line:string;
  begin

    // Buscar la cadena
    for i := 0 to (TSWeb.Count - 1) do begin
      line := Self.TSWeb[i];
      j := AnsiPos(STR_PREFIX_VENTANA, line);
      // Es la línea
      if (j > 0) then begin
        if (AVisibleWindow) then begin
          Self.TSWeb[i] := STR_VENTANA;
        end
        else begin
          Self.TSWeb[i] := STR_EMPTY;
        end;

        // Grabar
        Self.TSWeb.SaveToFile(Self.FNameWeb);

        Break;
      end;
    end;
  end;
  //············································································
  procedure _ChangeSize();
  const
    STR_PREFIX_TAM = '##TAMANYO##';
    STR_TAM = '<div id="map" style="width: %dpx; height: %dpx"></div>';
  var
    i, j:Integer;
    str, line:string;
  begin

    // Buscar la cadena
    for i := 0 to (TSWeb.Count - 1) do begin
      line := Self.TSWeb[i];
      j := AnsiPos(STR_PREFIX_TAM, line);
      // Es la línea
      if (j > 0) then begin
        Str := Format(STR_TAM,[W, H]);
        Self.TSWeb[i] := Str;


        Self.TSWeb.SaveToFile(Self.FNameWeb);

        Break;
      end;
    end;
  end;
  //············································································
  procedure _ChangeMapType();
  const
    STR_PREFIX_TYPE = '##MAPTYPE##';
    STR_TYPE = '        map.setMapType(%s);';
  var
    i, j:Integer;
    str, line:string;
  begin

    // Buscar la cadena
    for i := 0 to (TSWeb.Count - 1) do begin
      line := Self.TSWeb[i];
      j := AnsiPos(STR_PREFIX_TYPE, line);
      // Es la línea
      if (j > 0) then begin
        Str := Format(STR_TYPE,[AMapTYpe]);
        Self.TSWeb[i] := Str;
        Self.TSWeb.SaveToFile(Self.FNameWeb);

        Break;
      end;
    end;
  end;
  //············································································
  procedure _SetCenter();
  const
    STR_PREFIX_TYPE = '##SETCENTER##';
    STR_TYPE = '        map.setCenter(new GLatLng(%s,%s),%d);';
  var
    i, j:Integer;
    str, line:string;
  begin

    // Buscar la cadena
    for i := 0 to (TSWeb.Count - 1) do begin
      line := Self.TSWeb[i];
      j := AnsiPos(STR_PREFIX_TYPE, line);
      // Es la línea
      if (j > 0) then begin
        Str := Format(STR_TYPE,[Lat, Lon, AZoom]);
        Self.TSWeb[i] := Str;
        Self.TSWeb.SaveToFile(Self.FNameWeb);

        Break;
      end;
    end;
  end;
  //············································································
  procedure _AddControls();
  const
    STR_PREFIX_CONTROLS = '##CONTROLS##';
    STR_CONTROL_STRING = '        map.addControl(new %s());';
  var
    i, j, k:Integer;
    str, line:string;
  begin
    // Buscar la cadena
    for i := 0 to (TSWeb.Count - 1) do begin
      line := Self.TSWeb[i];
      j := AnsiPos(STR_PREFIX_CONTROLS, line);
      // Es la línea
      if (j > 0) then begin
        // Eliminar
        Self.TSWeb.Delete(i);

        // Añadir los controles
        for k := 0 to (Length(AControls)-1) do begin
          Str := AControls[k];
          Self.TSWeb.Insert(i, Format(STR_CONTROL_STRING,[Str]));
        end;

        // Grabar
        Self.TSWeb.SaveToFile(Self.FNameWeb);

        Break;
      end;
    end;
  end;
  //············································································
  //: Recupera el texto de la página desde el recurso.
  function _RetrievePageText():string;
  const
    EBLOCK = '_RetrievePageText';
  var
    rs: TResourceStream;
    tf: TStrings;
    b:Boolean;
    resName:String;
  begin
    // Se trata de seguridad de Visualizacion?
    resName := RES_HTML_PAGEMAP;

    // Llamar a la búsqueda de recurso
    b := FindInstanceOfResource(resName, RT_RCDATA, HInstance);

    if not b then begin
      // Error de recurso no encontrado
      raise Exception.Create(EMAP_MSG_ERRORGETRES);
      Application.Terminate;
    end;

    // Crear el StringList
    tf := TStringList.Create;
    // proteccion para liberar
    try
      // proteccion
      try
        // Cargar el recurso
        rs := TResourceStream.Create(HInstance, resName, RT_RCDATA);
        tf.LoadFromStream(rs);
      except
        // Error recurso no encontrado (al recuperar)
        raise Exception.Create(EMAP_MSG_ERRORGETRES);
        Application.Terminate;
      end;
      Result := tf.Text;
    // liberar
    finally
      rs.Free;
      tf.Free;
    end;
  end;
  //············································································

begin

  // desactivar el Timer
  timerNew.Enabled := False;

  // Crgar la página en memoria
  //--TSWeb.LoadFromFile(ExtractFilePath(ParamStr(0)) + '_Mapa.html');
  try
    TSWeb.Text := _RetrievePageText();
  except
    MessageDlg('No se ha podido acceder a la página para mostrar el mapa.', mtError, [mbOK], 0);
    Exit;
  end;

  // proteccion para guardar el fichero
  try

    // Ajustar tamaño
    _ChangeSize();
    _AddControls();
    _ChangeMapTYpe();
    // no añadimos marca
    //_AddMarca();
    _AddVentana();
    _SetCenter();

    // Load the HTML page
    webBrowser1.Navigate(FNameWeb);

  except
    on E:EFCreateError do begin
      MessageDlg(Format('Se ha producido un error crear el mapa. Consulta con el Administrador del sistema. '+ CHAR_CRLF + 'Error: %s',[E.Message]), mtError, [mbOK], 0);
      Self.Close;
    end;
    on E:Exception do begin
      MessageDlg(Format('Se ha producido un error crear al generar el mapa. Consulta con el Administrador del sistema. '+ CHAR_CRLF + 'Error: %s',[E.Message]), mtError, [mbOK], 0);
      Self.Close;
    end;
  end;

end;

procedure TFormVerMapa.ActionAceptarExecute(Sender: TObject);
begin
  inherited;

  // Se han modificado las posiicones?
  Self.FLatitud := edtLat.Text;
  Self.FLongitud := edtLon.Text;
  Self.FZoom := StrToInt(edtZoom.Text);
  // Aceptado
  Self.FIsAccepted := True;

  // cerrar
  Self.Close;

end;

procedure TFormVerMapa.ActionCancelarExecute(Sender: TObject);
begin
  inherited;
  
  // acncelado
  Self.FIsAccepted := False;

  // Cerrar
  Self.Close;
end;

procedure TFormVerMapa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  inherited;

  // Liberar
  if Assigned(Self.TSWeb) then begin
    FreeAndNil(TSWeb);
  end;
  // cerrar
  Action := caHide;

end;

procedure TFormVerMapa.webBrowser1DocumentComplete(Sender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
var
  Doc: IHTMLDocument2;      // current HTML document
begin

  // ocultar barras de desplazamiento
  Doc := WebBrowser1.Document as IHTMLDocument2;
  Doc.Body.Style.overflow := 'hidden';

  // Activar Timer
  timerNew.Enabled := True;

end;

procedure TFormVerMapa._CMAfterShow(var Msg: TMessage);
begin

  // Cargar valores iniciales
  edtDir.Text := Self.Direccion;
  edtLat.Text := Self.Latitud;
  edtLon.Text := Self.Longitud;

  // Zoom a cero?
  if (Self.Zoom = 0) then begin
    Self.Zoom := 14;  // Valor por defecto
  end;
  edtZoom.Text := IntToStr(Self.Zoom);
  
  DoneVisualization := True;

  // Cargar mapa inicial
  LoadMapa(pnlMapa.Height - 25, pnlMapa.Width - 25, arr,
           Self.Latitud, Self.Longitud, Self.Zoom, True, False{True});

end;

procedure TFormVerMapa.timerNewTimer(Sender: TObject);
var
  Document: IHTMLDocument3;
  Collection: IHTMLElementCollection;
  Element: IHTMLElement;
  InputElement: IHTMLInputElement;
  _LastLat:String;
begin

  _LastLat := edtLat.Text;

  Document := (WebBrowser1.Document as IHTMLDocument3);
  Collection := Document.getElementsByName('y');

  if (Collection.length >= 0) then
  begin
    Element := Collection.item(0, 0) as IHTMLElement;
    Element.QueryInterface(IHTMLInputElement, InputElement);

    if Assigned(InputElement) and (InputElement.type_ = 'text') then begin
      Label1.Caption := (InputElement.value);
      if (Label1.Caption <> STR_EMPTY) then begin
        edtLat.Text := Label1.Caption;
      end;
    end;
  end;
  Collection := Document.getElementsByName('x');

  if (Collection.length >= 0) then
  begin
    Element := Collection.item(0, 0) as IHTMLElement;
    Element.QueryInterface(IHTMLInputElement, InputElement);

    if Assigned(InputElement) and (InputElement.type_ = 'text') then begin
      Label2.Caption := (InputElement.value);
      if (Label2.Caption <> STR_EMPTY) then begin
        edtLon.Text := Label2.Caption;
      end;
    end;
  end;

  Collection := Document.getElementsByName('z');
  if (Collection.length >= 0) then begin
    Element := Collection.item(0, 0) as IHTMLElement;

    // No asignado el elemento
    if not Assigned(Element) then begin
      Exit;
    end;

    Element.QueryInterface(IHTMLInputElement, InputElement);

    if Assigned(InputElement) and (InputElement.type_ = 'text') then begin
      lblZoom.Caption := (InputElement.value);
      if (lblZoom.Caption <> STR_EMPTY) then begin
        edtZoom.Text := lblZoom.Caption;
      end;
    end;
  end;

  // Tipo de mapa
  Collection := Document.getElementsByName('t');
  if (Collection.length >= 0) then begin
    Element := Collection.item(0, 0) as IHTMLElement;

    // No asignado el elemento
    if not Assigned(Element) then begin
      Exit;
    end;

    Element.QueryInterface(IHTMLInputElement, InputElement);

    if Assigned(InputElement) and (InputElement.type_ = 'text') then begin
      lblTipo.Caption := (InputElement.value);
      if (lblTipo.Caption <> STR_EMPTY) then begin
        edtTipoMapa.Text := lblTipo.Caption;
      end;
    end;
  end;

  // Status
  StatusBar1.Panels[1].Text := edtLat.Text;
  StatusBar1.Panels[2].Text := edtLon.Text;
  StatusBar1.Panels[3].Text := 'Zoom: ' + edtZoom.Text;
  StatusBar1.Panels[4].Text := edtTipoMapa.Text;

end;

procedure TFormVerMapa.ActionImprimirMapaExecute(Sender: TObject);
var
   vIn, vOut: OleVariant;
begin

//  // ocultyar
//  pnlAyuda.Visible := False;
  // dialogo de impresion
  WebBrowser1.ControlInterface.ExecWB(OLECMDID_PRINT,
                                       OLECMDEXECOPT_PROMPTUSER, vIn, vOut) ;
end;

procedure TFormVerMapa.ActionAbrirGoogleMapsExecute(Sender: TObject);
var
  str:string;
begin

//  // ocultyar
//  pnlAyuda.Visible := False;

  // Visualizar en Google Maps
  Str := Format('http://maps.google.es/maps?&q=%s,%s&z=15',
      [edtLat.Text, edtLon.Text]);
  // Abrir
  ShellExecute(Handle,
       'open',
       PChar(Str),
       nil,
       nil,
       SW_SHOW);

end;



//: Visualizar el mapa segun los datos.
procedure TFormVerMapa.VisualizarMapa(th:TGeoCode;
                                      AUserZoom:integer=14;
                                      AUserType:string=G_NORMAL_MAP);
const
  COLOR_VERDE = $00D2E6D2;
  COLOR_ROJO  = $00CACAFF;
var
  code:integer;
begin

  // Panel
  pnlPos.Visible := False;
  pnlPos.Repaint;
  Application.ProcessMessages;
  code := 0;

  // Ini
  if (AUserZoom = 0) then begin
    AUserZoom := 14;
  end;

  // Asignado?
  if Assigned(th) then begin
    // Código de retorno
    code := th.GeoStatusCode;
  end
  else begin
    // algo de info
    if (Self.edtLat.Text <> STR_EMPTY) and (Self.edtLon.Text <> STR_EMPTY) then begin
      Code := 200;
    end;
  end;

  Self.edtLat.Text := th.GeoLatitud;
  Self.edtLon.Text := th.GeoLongitud;
  Self.edtZoom.Text := IntToStr(AUserZoom); // Valor por defecto

  // Vacio?
  if (edtZoom.Text = STR_EMPTY) then begin
    Self.edtZoom.Text := IntToStr(AUserZoom); // Valor por defecto
  end;

  // código válido?
  if (th.GeoStatusCode = 200) then begin
    // Cargar mapa inicial
    LoadMapa(pnlMapa.Height - 25, pnlMapa.Width - 25, arr,
              Self.edtLat.Text, Self.edtLon.Text, AuserZoom,
              True, False{True}, AuserType);
    // correcto
    edtDir.Color := COLOR_VERDE;
  end
  else begin
    // incorrecto
    edtDir.Color := COLOR_ROJO;
  end;


end;

procedure TFormVerMapa.ActionBuscarExecute(Sender: TObject);
var
  th:TGeoCode;
  Str:string;
begin

  // Panel
  pnlPos.Visible := True;
  pnlPos.Repaint;
  Application.ProcessMessages;

  // Instruciones
 // mmInstrucciones.Visible := False;

  // Desactivar el Timer
  timerNew.Enabled := False;
  // posicion + Visualizar
  pnlPos.Left := ((Self.Width - pnlPos.Width) div 2);
  pnlPos.Top := ((Self.Height - pnlMapa.Height) div 2) + pnlMapa.Top;
  pnlPos.Visible := True;
  pnlPos.Repaint;
  Application.ProcessMessages;

  // Calcular lat y long
  th := TGeoCode.Create(Str);
  // proteccion
  try
    th.Direccion := edtDir.Text;
    th.Execute;
   // Visulizar el mapa
    VisualizarMapa(th, _userZoom, _userType);
  finally
    FreeAndNil(th);
  end;

end;

// restaurar los valores iniciales.
procedure TFormVerMapa.ActionRestaurarInicialExecute(Sender: TObject);
begin

  // Cargar mapa inicial
  LoadMapa(pnlMapa.Height - 25, pnlMapa.Width - 25, arr,
            Self.Latitud, Self.Longitud, Self.Zoom, True, False{True});

end;

// Modificar la posicion en el mapa.
procedure TFormVerMapa.edtDirKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  // Tecla ENTER
  if (key = VK_RETURN) then begin
    ActionBuscar.Execute;
  end;
end;

procedure TFormVerMapa.FormResize(Sender: TObject);
begin
  // No asignado?
  if (not (DoneVisualization))then begin
    Exit
  end;

  // Visulizar el mapa
  VisualizarMapa(nil);

end;

procedure TFormVerMapa.cbLugaresChange(Sender: TObject);
var
  th:TGeoCode;

  //············································································
  procedure _GetTypeAndZoom(var AType:string; var AZoom:integer);
  var
    Str:string;
    i,j, k:integer;
    TS:TStringList;
  begin
    AType := G_NORMAL_MAP;
    AZoom := 14;
    edtLat.Text := STR_EMPTY;
    edtLon.Text := STR_EMPTY;

    for i := 0 to (Self.FLugares.Count - 1) do begin
      Str := FLugares[i];
      // es esta
      j := AnsiPos(edtDir.Text, Str);
      if (j <> 0) then begin
        Str := Copy(Str, Length(edtDir.Text) + 1, Length(Str));

        // queda algo?
        if (Trim(Str) <> '') then begin
          TS := TStringList.Create();
          try
            TS.Delimiter := '|';
            TS.DelimitedText := Str;

            // Buscar ZOOM y Tipo
            for j := 0 to (TS.Count - 1) do begin
              Str := TS[j];
              k := AnsiPos('Zoom=', Str);
              if (k <> 0) then begin
                Str := AnsiReplaceText(Str, 'Zoom=', '');
                _userZoom := StrToIntDef(Str, 14);
                edtZoom.Text := IntToStr(_userZoom);
              end;
              k := AnsiPos('MapType=', Str);
              if (k <> 0) then begin
                Str := AnsiReplaceText(Str, 'MapType=', '');
                _userType := Str;
                edtTipoMapa.Text := _userType;
              end;
              k := AnsiPos('Lat=', Str);
              if (k <> 0) then begin
                Str := AnsiReplaceText(Str, 'Lat=', '');
                edtLat.text := Str;
              end;
              k := AnsiPos('Long=', Str);
              if (k <> 0) then begin
                Str := AnsiReplaceText(Str, 'Long=', '');
                edtLon.Text := Str;
              end;
            end;

            Break;

          finally
            FreeAndNil(TS);
          end;
        end;

      end;
    end;


  end;
  //············································································
begin

  // Instruciones
  //mmInstrucciones.Visible := False;

  // ini
  edtDir.Text := cbLugares.Items[cbLugares.ItemIndex];
  _GetTypeAndZoom(_userType, _userZoom);
  th := TGeoCode.Create(STR_EMPTY);
  th.GeoLatitud := edtLat.Text;
  th.GeoLongitud := edtLon.Text;

  // proteccion
  try

    // Ya tiene coordenadas
    if (edtLat.Text <> STR_EMPTY) and (edtLon.Text <> STR_EMPTY) then begin
      th.GeoStatusCode := 200;
      VisualizarMapa(th, _userZoom, _userType);
    end
    else begin
      // que busque las coordenadas
      ActionBuscar.Execute;
    end;
  finally
    _userZoom := 14;
    _userType := G_NORMAL_MAP;
    FreeAndNil(th);
  end;

end;

procedure TFormVerMapa.Label3Click(Sender: TObject);
var
  Str, line:string;
  i, j:integer;
begin

  // Grabar
  //...
  Str := InputBox('Nueva ubicación', 'Introduzca una descripción para esta ubicación.',
                  edtDir.Text);
  // Algo
  if (Str <> '') then begin
    Line := Str + '|Lat=' + edtLat.Text + '|Long=' + edtLon.Text +
            '|Zoom=' + edtZoom.Text + '|MapType=' +
            _GetMapTypeConst(edtTipoMapa.Text);
  end;

  // Buscar si ya existe?
  for i := 0 to (Self.FLugares.Count - 1) do begin
    j := AnsiPos(Str, Self.FLugares[i]);
    // encontrado?
    if (j=1) then begin
      Break;
    end;
  end;

  // encontrado?
  if (j <> 0) and (i <> Self.FLugares.Count) then begin
    Self.FLugares[i] := Line;
  end
  else begin
    Self.FLugares.Add(Line);
  end;

  // Grabar
  _SaveLugares();
  // recargar los lugares
  _LoadLugares();

end;

// devuelve la constante para un tipo de mapa
function TFormVerMapa._GetMapTypeConst(ATipoMapa: string): string;
var
  j:integer;
begin

  Result := G_NORMAL_MAP;

  j := AnsiPos('Map', ATipoMapa);
  if (j <> 0) then begin
    Result := G_NORMAL_MAP;
    Exit;
  end;

  j := AnsiPos('Hib', ATipoMapa);
  if (j <> 0) then begin
    Result := G_HYBRID_MAP;
    Exit;
  end;

  j := AnsiPos('Sat', ATipoMapa);
  if (j <> 0) then begin
    Result := G_SATELLITE_MAP;
    Exit;
  end;
end;

procedure TFormVerMapa.tbCancelarClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFormVerMapa.Label4Click(Sender: TObject);
var
  Str:string;
begin
  Str := ExtractFilePath(Application.ExeName) + FILENAME_LUGARES;
  // Existe?
  if FileExists(Str) then begin
    ShellExecute(Handle, 'open', PChar(str), nil, nil, SW_Show);
  end;
end;

procedure TFormVerMapa.StatusBar1Click(Sender: TObject);
begin
    ShellExecute(Handle,
             'open',
             'http://neftali.clubdelphi.com',
             nil,
             nil,
             SW_SHOW);
end;

end.
