{ Invokable interface IWsPrueba }

unit WsPruebaIntf;

interface

uses InvokeRegistry, Types, XSBuiltIns;

type

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

  { Invokable interfaces must derive from IInvokable }
  IWsPrueba = interface(IInvokable)
  ['{6ECA274D-3522-4079-8796-9FDE7F11CF37}']

    { Methods of Invokable interface must not use the default }
    { calling convention; stdcall is recommended }
    Procedure Suma(a,b: integer; out result: integer); stdcall;
    Procedure Resta(a,b: integer; out result: integer); stdcall;
    function ConsultaProduccion: trRet_Produccion ;stdcall;
  end;

implementation

initialization
  { Invokable interfaces must be registered }
  InvRegistry.RegisterInterface(TypeInfo(IWsPrueba));

end.
