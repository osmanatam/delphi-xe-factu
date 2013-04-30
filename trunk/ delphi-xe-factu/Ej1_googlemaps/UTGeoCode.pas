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
unit UTGeoCode;

//=========================================================================
//
// I N T E R F A C E
//
//=========================================================================
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, Grids, ValEdit;

type

  //: Clase que define el Objeto para calcular Datos vía GeoCode.
  TGeoCode = class(TObject)
  private
    FDireccion: string;
    FAllText: TStrings;
    FGeoStatusCode: Integer;
    FGeoAddress: string;
    FGeoCountryCode: string;
    FGeoCountryName: string;
    FGeoAdminArea: string;
    FGeoAddressLine: string;
    FGeoLocalityName: string;
    FGeoPostalCode: string;
    FGeoAccuracy: integer;
    FGeoLatitud: string;
    FGeoLongitud: string;

    procedure _ExtractResult();
    function _StatusCodeToStr(ACode:Integer):string;
    function _AccuracyToStr(ACode:integer):string;
  public
    procedure Execute;
    destructor Destroy; override;
    constructor Create(ADireccion:string);
    // dirección de entrada sobre la que se va a interrogar
    property Direccion:string read FDireccion write FDireccion;
    // Salida
    property AllText:TStrings read FAllText write FAllText;
    // Propiedades
    property GeoStatusCode:Integer read FGeoStatusCode write FGeoStatusCode;
    property GeoAddress:string read FGeoAddress write FGeoAddress;
    property GeoCountryName:string read FGeoCountryName write FGeoCountryName;
    property GeoCountryCode:string read FGeoCountryCode write FGeoCountryCode;
    property GeoAdminArea:string read FGeoAdminArea write FGeoAdminArea;
    property GeoAddressLine:string read FGeoAddressLine write FGeoAddressLine;
    property GeoLocalityName:string read FGeoLocalityName write FGeoLocalityName;
    property GeoPostalCode:string read FGeoPostalCode write FGeoPostalCode;
    property GeoAccuracy:integer read FGeoAccuracy write FGeoAccuracy;
    property GeoLatitud:string read FGeoLatitud write FGeoLatitud;
    property GeoLongitud:string read FGeoLongitud write FGeoLongitud;
  published

  end;

// Constantes genéricas relacionadas con mapas
const
  STR_WEB = 'http://maps.google.com/maps/geo?q=';
  STR_KEY = '&key=ABQIAAAAFVb255bTSpn4DC0nkcIz3hTgmueMIh62ahlPS2dC-DIXqzciAxRZItsH3Fy4UcBpz0Q4D8XHzbxt3A';


  // constantes para parsear el mapa
const
  STR_MAP_STATUS            = '"Status":';
  STR_MAP_CODESTATUS        = '"code":';
  STR_MAP_ADDRESS           = '"address":';
  STR_MAP_COUNTRYNAME       = '"CountryNameCode":';
  STR_MAP_COUNTRYCODE       = '"CountryName":';
  STR_MAP_ADMINAREA         = '"AdministrativeAreaName":';
  STR_MAP_ADDRESSLINE       = '"AddressLine":';
  STR_MAP_LOCALITYNAME      = '"LocalityName":';
  STR_MAP_POSTALCODENUMBER  = '"PostalCodeNumber":';
  STR_MAP_ACCURACY          = '"Accuracy":';
  STR_MAP_COORDINATES       = '"coordinates": [';

//=========================================================================
//
// I M P L E M E N T A T I O N
//
//=========================================================================
implementation


uses
  {genericas} IdException,
    StrUtils, UConstantes;

//: Redefinir el constructor de la clase.
constructor TGeoCode.Create(ADireccion:string);
begin
   inherited Create();
   Self.FAllText := TStringList.Create();
   Self.FDireccion := ADireccion;

end;

destructor TGeoCode.Destroy();
begin
  if Assigned(Self.FAllText) then begin
    FreeAndNil(Self.FAllText);
  end;

  inherited;
end;

// Ejecutar la consulta.
procedure TGeoCode.Execute();
var
  Stream: TStringStream;
  Str, res:string;
  IdHTTP1: TIdHTTP;
begin

  // ini
  Stream :=  TStringStream.Create(res);
  IdHTTP1 := TIdHTTP.Create(nil);

  // proteccion para liberar
  try

    // protecccon error
    try
      // eliminar espacios (dan problemas)
      Str := AnsiReplaceText(Self.fDireccion, CHAR_SPACE, CHAR_PLUS);
      // Acceder
      Str := STR_WEB + Str + STR_KEY;
      idhttp1.Get(Str, Stream);
      Self.FAllText.Text := Stream.DataString;

      _ExtractResult();
    except
{$IFDEF DELPHI6}
      on E:EIdProtocolReplyError do begin
        Self.FAllText.Text := STR_EMPTY;
      end;
{$ENDIF}
      on E:Exception do begin
        Self.FAllText.Text := STR_EMPTY;
        MessageDlg(Format('Se ha producido un error en la búsqueda de datos basados geográficos. Error: <%s>',
                          [E.Message]), mtError, [mbOK], 0);
      end;
    end;

  finally
    FreeAndNil(IdHTTP1);
    FreeAndNil(Stream);
  end;
end;


//: Obtener el código de retorno como STRING
function TGeoCode._StatusCodeToStr(ACode: integer): string;
begin

  case ACode of
    200: Result := G_GEO_SUCCESS;
    400: Result := G_GEO_BAD_REQUEST;
    500: Result := G_GEO_SERVER_ERROR;
    601: Result := G_GEO_MISSING_QUERY;
    // 601: Result := G_GEO_MISSING_ADDRESS;
    602: Result := G_GEO_UNKNOWN_ADDRESS;
    603: Result := G_GEO_UNAVAILABLE_ADDRESS;
    604: Result := G_GEO_UNKNOWN_DIRECTIONS;
    610: Result := G_GEO_BAD_KEY;
    620: Result := G_GEO_TOO_MANY_QUERIES;
  else
    Result := G_GEO_UNKNOW_CODE;
  end;

end;

//: Obtener la prec´sión como STRING
function TGeoCode._AccuracyToStr(ACode: Integer): string;
begin

  case ACode of
    0: 	Result := STR_PREC_0;
    1:  Result := STR_PREC_1;
    2: 	Result := STR_PREC_2;
    3: 	Result := STR_PREC_3;
    4: 	Result := STR_PREC_4;
    5:  Result := STR_PREC_5;
    6: 	Result := STR_PREC_6;
    7: 	Result := STR_PREC_7;
    8: 	Result := STR_PREC_8;
    9:  Result := STR_PREC_9;
  else
    Result := G_PREC_UNKNOW_CODE;
  end;

end;

procedure TGeoCode._ExtractResult();
var
  value:Integer;
  Str:String;
  TS:TStrings;

  //············································································
  function __GetData(AStr:string; EndChar:string=''):string;
  var
    p:Integer;
    i,j:Integer;
    Str:string;
  begin
    Result := '';
    for i := 0 to (Self.FAllText.Count - 1) do begin
      Str := Self.FAllText[i];
      p := AnsiPos(AStr, Str);

      if (p > 0) then begin
        Result := Copy(Str, p + Length(AStr), Length(Str));
        Break;
      end;
    end;

    if (EndChar <> '') then begin
      j := AnsiPos(EndChar, Result);
      if (j > 0) then begin
        Result := Copy(Result, 1, j-1);
      end;
    end;
  end;
  //············································································

begin

  // Obtener código
  Str := __GetData(STR_MAP_CODESTATUS);
  Str := AnsiReplaceText(Str, ',', '');
  Self.FGeoStatusCode := StrToIntDef(Str, -1);

  // Error
  if (Self.GeoStatusCode <> 200) then begin
    // DEVOLVER EL STRING
    Exit;
  end;

  // Continuar...
  // Obtener direccion
  Str := __GetData(STR_MAP_ADDRESS);
  Str := AnsiReplaceText(Str, '"', '');
  Self.FGeoAddress := Trim(Str);
  // Country Name
  Str := __GetData(STR_MAP_COUNTRYNAME, ',');
  Str := AnsiReplaceText(Str, '"', '');
  Self.FGeoCountryName := Trim(Str);
  // CountryCode
  Str := __GetData(STR_MAP_COUNTRYCODE, ',');
  Str := AnsiReplaceText(Str, '"', '');
  Self.FGeoCountryCode := Trim(Str);
  // AdminArea
  Str := __GetData(STR_MAP_ADMINAREA, ',');
  Str := AnsiReplaceText(Str, '"', '');
  Self.FGeoAdminArea := Trim(Str);
  // addressLine
  Str := __GetData(STR_MAP_ADDRESSLINE, ',');
  Str := AnsiReplaceText(Str, '"', '');
  Str := AnsiReplaceText(Str, '[', '');
  Str := AnsiReplaceText(Str, ']', '');
  Str := AnsiReplaceText(Str, '}', '');
  Self.FGeoAddressLine := Trim(Str);
  // Localidad
  Str := __GetData(STR_MAP_LOCALITYNAME, ',');
  Str := AnsiReplaceText(Str, '"', '');
  Self.FGeoLocalityName := Trim(Str);
  // Cod. Postal
  Str := __GetData(STR_MAP_POSTALCODENUMBER, ',');
  Str := AnsiReplaceText(Str, '"', '');
  Str := AnsiReplaceText(Str, '}', '');
  Self.FGeoPostalCode := Trim(Str);
  // Exactitud
  Str := __GetData(STR_MAP_ACCURACY, '}');
  Str := Trim(Str);
  Self.FGeoAccuracy := StrToIntDef(Str, -1);
  // Coordenadas
  Str := __GetData(STR_MAP_COORDINATES, ']');
  Str := AnsiReplaceText(Str, '"', '');
  TS := TStringList.Create();
  try
    TS.Delimiter := ',';
    TS.DelimitedText := Trim(Str);
    if (TS.Count > 1) then
      Self.FGeoLongitud := TS[0];
    if (TS.Count > 2) then
      Self.FGeoLatitud := TS[1];
  finally
    FreeandNil(TS);
  end;

end;



end.
