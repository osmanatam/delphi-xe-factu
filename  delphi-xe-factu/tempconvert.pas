// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://www.w3schools.com/webservices/tempconvert.asmx?wsdl
//  >Import : http://www.w3schools.com/webservices/tempconvert.asmx?wsdl>0
// Encoding : utf-8
// Version  : 1.0
// (10/04/2013 10:57:16 - - $Rev: 34800 $)
// ************************************************************************ //

unit tempconvert;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns;

const
  IS_OPTN = $0001;
  IS_REF  = $0080;


type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Embarcadero types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"[Gbl]


  string_         =  type string;      { "http://tempuri.org/"[GblElm] }

  // ************************************************************************ //
  // Namespace : http://tempuri.org/
  // soapAction: http://tempuri.org/%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : document
  // use       : literal
  // binding   : TempConvertSoap12
  // service   : TempConvert
  // port      : TempConvertSoap12
  // URL       : http://www.w3schools.com/webservices/tempconvert.asmx
  // ************************************************************************ //
  TempConvertSoap = interface(IInvokable)
  ['{81CE30A8-1CDF-D7ED-011F-33FC9C611B99}']
    function  FahrenheitToCelsius(const Fahrenheit: string): string; stdcall;
    function  CelsiusToFahrenheit(const Celsius: string): string; stdcall;
  end;


  // ************************************************************************ //
  // Namespace : http://tempuri.org/
  // style     : ????
  // use       : ????
  // binding   : TempConvertHttpPost
  // service   : TempConvert
  // port      : TempConvertHttpPost
  // ************************************************************************ //
  TempConvertHttpPost = interface(IInvokable)
  ['{D9ABBDC3-0588-B4C0-4187-66B2FBCACCF0}']
    function  FahrenheitToCelsius(const Fahrenheit: string): string_; stdcall;
    function  CelsiusToFahrenheit(const Celsius: string): string_; stdcall;
  end;

function GetTempConvertSoap(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): TempConvertSoap;
function GetTempConvertHttpPost(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): TempConvertHttpPost;


implementation
  uses SysUtils;

function GetTempConvertSoap(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): TempConvertSoap;
const
  defWSDL = 'http://www.w3schools.com/webservices/tempconvert.asmx?wsdl';
  defURL  = 'http://www.w3schools.com/webservices/tempconvert.asmx';
  defSvc  = 'TempConvert';
  defPrt  = 'TempConvertSoap12';
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
    Result := (RIO as TempConvertSoap);
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


function GetTempConvertHttpPost(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): TempConvertHttpPost;
const
  defWSDL = 'http://www.w3schools.com/webservices/tempconvert.asmx?wsdl';
  defURL  = '';
  defSvc  = 'TempConvert';
  defPrt  = 'TempConvertHttpPost';
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
    Result := (RIO as TempConvertHttpPost);
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
  { TempConvertSoap }
  InvRegistry.RegisterInterface(TypeInfo(TempConvertSoap), 'http://tempuri.org/', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(TempConvertSoap), 'http://tempuri.org/%operationName%');
  InvRegistry.RegisterInvokeOptions(TypeInfo(TempConvertSoap), ioDocument);
  InvRegistry.RegisterInvokeOptions(TypeInfo(TempConvertSoap), ioSOAP12);
  { TempConvertSoap.FahrenheitToCelsius }
  InvRegistry.RegisterMethodInfo(TypeInfo(TempConvertSoap), 'FahrenheitToCelsius', '',
                                 '[ReturnName="FahrenheitToCelsiusResult"]', IS_OPTN);
  { TempConvertSoap.CelsiusToFahrenheit }
  InvRegistry.RegisterMethodInfo(TypeInfo(TempConvertSoap), 'CelsiusToFahrenheit', '',
                                 '[ReturnName="CelsiusToFahrenheitResult"]', IS_OPTN);
  { TempConvertHttpPost }
  InvRegistry.RegisterInterface(TypeInfo(TempConvertHttpPost), 'http://tempuri.org/', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(TempConvertHttpPost), '');
  RemClassRegistry.RegisterXSInfo(TypeInfo(string_), 'http://tempuri.org/', 'string_', 'string');

end.