unit DataModule;

interface

uses
  SysUtils, Classes, IBDatabase, DB, IBCustomDataSet, IBQuery, DBXFirebird,
  SqlExpr;

type
  TDataModule1 = class(TDataModule)
    DMBaseDatos: TIBDatabase;
    dsDMDataSourse: TDataSource;
    DMQuery: TIBQuery;
    DMTransaction: TIBTransaction;
    SQLConnection1: TSQLConnection;


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;




implementation

{$R *.dfm}


end.
