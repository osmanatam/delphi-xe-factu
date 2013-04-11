// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://localhost:8033/wsdl/IWsPrueba
//  >Import : http://localhost:8033/wsdl/IWsPrueba>0
// Version  : 1.0
// (10/04/2013 16:47:30 - - $Rev: 34800 $)
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
  // !:double          - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:string          - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:int             - "http://www.w3.org/2001/XMLSchema"[Gbl]

  TArrayProduccion     = class;                 { "urn:WsPruebaIntf"[GblCplx] }
  trRet_Produccion     = class;                 { "urn:WsPruebaIntf"[GblCplx] }



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
  RemClassRegistry.RegisterXSClass(TArrayProduccion, 'urn:WsPruebaIntf', 'TArrayProduccion');
  RemClassRegistry.RegisterXSInfo(TypeInfo(TArrayDetProduccion), 'urn:WsPruebaIntf', 'TArrayDetProduccion');
  RemClassRegistry.RegisterXSClass(trRet_Produccion, 'urn:WsPruebaIntf', 'trRet_Produccion');

end.