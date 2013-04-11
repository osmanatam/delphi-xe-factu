// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://localhost:8080/wsdl/IwsPruebas
// Version  : 1.0
// (09/04/2013 15:48:36 - - $Rev: 34800 $)
// ************************************************************************ //

unit IwsPruebas1;

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
  // Namespace : urn:wsPruebasIntf-IwsPruebas
  // soapAction: urn:wsPruebasIntf-IwsPruebas#Suma
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // use       : encoded
  // binding   : IwsPruebasbinding
  // service   : IwsPruebasservice
  // port      : IwsPruebasPort
  // URL       : http://localhost:8080/soap/IwsPruebas
  // ************************************************************************ //
  IwsPruebas = interface(IInvokable)
  ['{DE2A4029-AAF1-9DE1-EFBD-0463AD6F3D2E}']
    function  Suma(const a: Integer; const b: Integer): Integer; stdcall;
  end;

function GetIwsPruebas(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): IwsPruebas;


implementation
  uses SysUtils;

function GetIwsPruebas(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): IwsPruebas;
const
  defWSDL = 'http://localhost:8080/wsdl/IwsPruebas';
  defURL  = 'http://localhost:8080/soap/IwsPruebas';
  defSvc  = 'IwsPruebasservice';
  defPrt  = 'IwsPruebasPort';
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
    Result := (RIO as IwsPruebas);
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
  { IwsPruebas }
  InvRegistry.RegisterInterface(TypeInfo(IwsPruebas), 'urn:wsPruebasIntf-IwsPruebas', '');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(IwsPruebas), 'urn:wsPruebasIntf-IwsPruebas#Suma');

end.