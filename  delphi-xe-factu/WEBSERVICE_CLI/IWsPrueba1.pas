// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://localhost:8033/wsdl/IWsPrueba
//  >Import : http://localhost:8033/wsdl/IWsPrueba>0
// Version  : 1.0
// (12/04/2013 10:12:07 - - $Rev: 34800 $)
// ************************************************************************ //

unit IWsPrueba1;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns;

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Embarcadero types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:int             - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:double          - "http://www.w3.org/2001/XMLSchema"[Gbl]

  trParametroConsAsegurado = class;             { "urn:WsPruebaIntf"[GblCplx] }
  TArrayAsegurado      = class;                 { "urn:WsPruebaIntf"[GblCplx] }
  trRet_Asegurado      = class;                 { "urn:WsPruebaIntf"[GblCplx] }
  trRet_Produccion     = class;                 { "urn:WsPruebaIntf"[GblCplx] }
  TArrayProduccion     = class;                 { "urn:WsPruebaIntf"[GblCplx] }



  // ************************************************************************ //
  // XML       : trParametroConsAsegurado, global, <complexType>
  // Namespace : urn:WsPruebaIntf
  // ************************************************************************ //
  trParametroConsAsegurado = class(TRemotable)
  private
    FNombreAsegurado: string;
  published
    property NombreAsegurado: string  read FNombreAsegurado write FNombreAsegurado;
  end;



  // ************************************************************************ //
  // XML       : TArrayAsegurado, global, <complexType>
  // Namespace : urn:WsPruebaIntf
  // ************************************************************************ //
  TArrayAsegurado = class(TRemotable)
  private
    FDET_Codigo: string;
    FDET_Nombre: string;
    FDET_DOC: string;
    FDET_Comercial: string;
  published
    property DET_Codigo:    string  read FDET_Codigo write FDET_Codigo;
    property DET_Nombre:    string  read FDET_Nombre write FDET_Nombre;
    property DET_DOC:       string  read FDET_DOC write FDET_DOC;
    property DET_Comercial: string  read FDET_Comercial write FDET_Comercial;
  end;

  TArrayDetAsegurado = array of TArrayAsegurado;   { "urn:WsPruebaIntf"[GblCplx] }


  // ************************************************************************ //
  // XML       : trRet_Asegurado, global, <complexType>
  // Namespace : urn:WsPruebaIntf
  // ************************************************************************ //
  trRet_Asegurado = class(TRemotable)
  private
    FCAB_CantFilas: Integer;
    FDetAsegurado: TArrayDetAsegurado;
  public
    destructor Destroy; override;
  published
    property CAB_CantFilas: Integer             read FCAB_CantFilas write FCAB_CantFilas;
    property DetAsegurado:  TArrayDetAsegurado  read FDetAsegurado write FDetAsegurado;
  end;

  TArrayDetProduccion = array of TArrayProduccion;   { "urn:WsPruebaIntf"[GblCplx] }


  // ************************************************************************ //
  // XML       : trRet_Produccion, global, <complexType>
  // Namespace : urn:WsPruebaIntf
  // ************************************************************************ //
  trRet_Produccion = class(TRemotable)
  private
    FCAB_CantFilas: Integer;
    FDET_produccion: TArrayDetProduccion;
  public
    destructor Destroy; override;
  published
    property CAB_CantFilas:  Integer              read FCAB_CantFilas write FCAB_CantFilas;
    property DET_produccion: TArrayDetProduccion  read FDET_produccion write FDET_produccion;
  end;



  // ************************************************************************ //
  // XML       : TArrayProduccion, global, <complexType>
  // Namespace : urn:WsPruebaIntf
  // ************************************************************************ //
  TArrayProduccion = class(TRemotable)
  private
    FDET_Prod_Acumulada: Double;
    FDET_Prod_Mes: Double;
    FDET_Prod_Meta: Double;
    FDET_Prod_Sucursal: string;
  published
    property DET_Prod_Acumulada: Double  read FDET_Prod_Acumulada write FDET_Prod_Acumulada;
    property DET_Prod_Mes:       Double  read FDET_Prod_Mes write FDET_Prod_Mes;
    property DET_Prod_Meta:      Double  read FDET_Prod_Meta write FDET_Prod_Meta;
    property DET_Prod_Sucursal:  string  read FDET_Prod_Sucursal write FDET_Prod_Sucursal;
  end;


  // ************************************************************************ //
  // Namespace : urn:WsPruebaIntf-IWsPrueba
  // soapAction: urn:WsPruebaIntf-IWsPrueba#%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // use       : encoded
  // binding   : IWsPruebabinding
  // service   : IWsPruebaservice
  // port      : IWsPruebaPort
  // URL       : http://localhost:8033/soap/IWsPrueba
  // ************************************************************************ //
  IWsPrueba = interface(IInvokable)
  ['{C8FD372F-2AED-00B5-EA75-C02325172573}']
    function  Suma(const a: Integer; const b: Integer): Integer; stdcall;
    function  Resta(const a: Integer; const b: Integer): Integer; stdcall;
    function  ConsultaProduccion: trRet_Produccion; stdcall;
    function  ConsultaAsegurado(const ParametroPedido: trParametroConsAsegurado): trRet_Asegurado; stdcall;
  end;

function GetIWsPrueba(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): IWsPrueba;


implementation
  uses SysUtils;

function GetIWsPrueba(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): IWsPrueba;
const
  defWSDL = 'http://localhost:8033/wsdl/IWsPrueba';
  defURL  = 'http://localhost:8033/soap/IWsPrueba';
  defSvc  = 'IWsPruebaservice';
  defPrt  = 'IWsPruebaPort';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as IWsPrueba);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


destructor trRet_Asegurado.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FDetAsegurado)-1 do
    SysUtils.FreeAndNil(FDetAsegurado[I]);
  System.SetLength(FDetAsegurado, 0);
  inherited Destroy;
end;

destructor trRet_Produccion.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FDET_produccion)-1 do
    SysUtils.FreeAndNil(FDET_produccion[I]);
  System.SetLength(FDET_produccion, 0);
  inherited Destroy;
end;

initialization
  { IWsPrueba }
  InvRegistry.RegisterInterface(TypeInfo(IWsPrueba), 'urn:WsPruebaIntf-IWsPrueba', '');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(IWsPrueba), 'urn:WsPruebaIntf-IWsPrueba#%operationName%');
  RemClassRegistry.RegisterXSClass(trParametroConsAsegurado, 'urn:WsPruebaIntf', 'trParametroConsAsegurado');
  RemClassRegistry.RegisterXSClass(TArrayAsegurado, 'urn:WsPruebaIntf', 'TArrayAsegurado');
  RemClassRegistry.RegisterXSInfo(TypeInfo(TArrayDetAsegurado), 'urn:WsPruebaIntf', 'TArrayDetAsegurado');
  RemClassRegistry.RegisterXSClass(trRet_Asegurado, 'urn:WsPruebaIntf', 'trRet_Asegurado');
  RemClassRegistry.RegisterXSInfo(TypeInfo(TArrayDetProduccion), 'urn:WsPruebaIntf', 'TArrayDetProduccion');
  RemClassRegistry.RegisterXSClass(trRet_Produccion, 'urn:WsPruebaIntf', 'trRet_Produccion');
  RemClassRegistry.RegisterXSClass(TArrayProduccion, 'urn:WsPruebaIntf', 'TArrayProduccion');

end.