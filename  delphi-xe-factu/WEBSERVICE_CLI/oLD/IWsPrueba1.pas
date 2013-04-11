// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://localhost:8033/wsdl/IWsPrueba
// Version  : 1.0
// (10/04/2013 10:05:58 - - $Rev: 34800 $)
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
  // !:int             - "http://www.w3.org/2001/XMLSchema"[]


  // ************************************************************************ //
  // Namespace : urn:WsPruebaIntf-IWsPrueba
  // soapAction: urn:WsPruebaIntf-IWsPrueba#Suma
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


initialization
  { IWsPrueba }
  InvRegistry.RegisterInterface(TypeInfo(IWsPrueba), 'urn:WsPruebaIntf-IWsPrueba', '');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(IWsPrueba), 'urn:WsPruebaIntf-IWsPrueba#Suma');

end.