{ Invokable interface IWsPrueba }

unit WsPruebaIntf;

interface

uses InvokeRegistry, Types, XSBuiltIns;

type
  //----------------------------------------------------------------------------
  TArrayAsegurado = Class;
  TArrayDetAsegurado = array of TArrayAsegurado;
  TArrayAsegurado = class(TRemotable)
  Private
       FDET_Codigo:    WideString;
       FDET_Nombre:    WideString;
       FDET_DOC:       WideString;
       FDET_Comercial: WideString;
  Published
       property  DET_Codigo:    WideString read FDET_Codigo write FDET_Codigo;
       property  DET_Nombre:    WideString read FDET_Nombre write FDET_Nombre;
       property  DET_DOC:       WideString read FDET_DOC write FDET_DOC;
       property  DET_Comercial: WideString read FDET_Comercial write FDET_Comercial;
  end;

  trParametroConsAsegurado = class(TRemotable) {}
    private
       FNombreAsegurado : WideString;
    published
      property NombreAsegurado : WideString read FNombreAsegurado write FNombreAsegurado;
    end;

  trRet_Asegurado = class(TRemotable) {}
    private
       FCAB_CantFilas : Integer;
       FDetAsegurado  : TArrayDetAsegurado;
    published
      property CAB_CantFilas : Integer read FCAB_CantFilas write FCAB_CantFilas;
      property DetAsegurado : TArrayDetAsegurado read FDetAsegurado write FDetAsegurado;
    end;
  //----------------------------------------------------------------------------
  TArrayProduccion = class;
  TArrayDetProduccion = array of TarrayProduccion;
  TarrayProduccion = class(TRemotable)
  private
       FDET_Prod_Acumulada : Double;
       FDet_Prod_MES : Double;
       FDet_Prod_Meta: Double;
       FDet_Prod_Sucursal: WideString;
  published
       property DET_Prod_Acumulada : double read FDET_Prod_Acumulada write FDET_Prod_Acumulada;
       property DET_Prod_Mes : Double read FDet_Prod_MES write FDet_Prod_MES;
       property DET_Prod_Meta : double read FDet_Prod_Meta write FDet_Prod_Meta;
       property DET_Prod_Sucursal : WideString read FDet_Prod_Sucursal write FDet_Prod_Sucursal;
   end;
   trRet_Produccion = class(TRemotable) {}
    private
       FCAB_CantFilas : Integer;
       FDetProduccion  : TArrayDetProduccion;
    published
      property CAB_CantFilas : Integer read FCAB_CantFilas write FCAB_CantFilas;
      property DET_produccion : TArrayDetProduccion read FDetProduccion write FDetProduccion;
    end;
  //----------------------------------------------------------------------------
  { Invokable interfaces must derive from IInvokable }
  IWsPrueba = interface(IInvokable)
  ['{6ECA274D-3522-4079-8796-9FDE7F11CF37}']

    { Methods of Invokable interface must not use the default }
    { calling convention; stdcall is recommended }
    Procedure Suma(a,b: integer; out result: integer); stdcall;
    Procedure Resta(a,b: integer; out result: integer); stdcall;
    function ConsultaProduccion: trRet_Produccion ;stdcall;
    function ConsultaAsegurado(ParametroPedido: trParametroConsAsegurado): trRet_Asegurado ;stdcall;
  end;

implementation

initialization
  { Invokable interfaces must be registered }
  InvRegistry.RegisterInterface(TypeInfo(IWsPrueba));

end.
