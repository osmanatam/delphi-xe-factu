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
    qry1PROD_ACUM: TLargeintField;
    qry1PROD_MES: TLargeintField;
    qry1PROD_META: TLargeintField;
    qry1PROD_SUC: TStringField;
    FBCONNECTION: TSQLConnection;
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
