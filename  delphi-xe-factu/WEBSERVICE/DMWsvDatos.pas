Unit DMWsvDatos;

interface

uses SysUtils, Classes, InvokeRegistry, Midas, SOAPMidas, SOAPDm, FMTBcd,
  DBXFirebird, DB, SqlExpr, Provider, DBClient, IBCustomDataSet, IBDatabase,
  IBQuery;

type
  IDMWsDatos = interface(IAppServerSOAP)
    ['{E1815252-6FCF-48FB-B0F6-C69E5A57FD33}']
  end;

  TDMWsDatos = class(TSoapDataModule, IDMWsDatos, IAppServerSOAP, IAppServer)
    qry1: TSQLQuery;
    FBCONNECTION: TSQLConnection;
    qry1O_PROD_ACUM: TLargeintField;
    qry1O_PROD_MES: TLargeintField;
    qry1O_PROD_META: TLargeintField;
    qry1O_PROD_SUC: TStringField;
    qryAseg: TSQLQuery;
    ProvAsegurado: TDataSetProvider;
    qryAsegurado: TClientDataSet;
    qryAsegO_CODIGO: TStringField;
    qryAsegO_NOMBRE: TStringField;
    qryAsegO_CI: TIntegerField;
    qryAsegO_RUC: TStringField;
    qryAsegO_COMERCIAL: TStringField;
    qryAseguradoO_CODIGO1: TStringField;
    qryAseguradoO_NOMBRE1: TStringField;
    qryAseguradoO_CI1: TIntegerField;
    qryAseguradoO_RUC1: TStringField;
    qryAseguradoO_COMERCIAL1: TStringField;
    procedure SoapDataModuleCreate(Sender: TObject);
  private
  
  public
  
  end;

implementation

{$R *.DFM}

procedure TDMWsDatosCreateInstance(out obj: TObject);
begin
 obj := TDMWsDatos.Create(nil);
end;

procedure TDMWsDatos.SoapDataModuleCreate(Sender: TObject);
begin
 FBCONNECTION.Close;
end;

initialization
   InvRegistry.RegisterInvokableClass(TDMWsDatos, TDMWsDatosCreateInstance);
   InvRegistry.RegisterInterface(TypeInfo(IDMWsDatos));
end.
