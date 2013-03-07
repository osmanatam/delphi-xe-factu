unit frmProveedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEh, DBGridEhGrouping, GridsEh, StdCtrls, DBCtrls, DBCtrlsEh,
  DBLookupEh, Mask, ExtCtrls, ComCtrls, DB, IBCustomDataSet, IBQuery, DBClient,
  Provider;

type
  TfrmProveedoresUt = class(TForm)
    dsProveedor: TDataSource;
    pvProveedor: TDataSetProvider;
    cdsProveedor: TClientDataSet;
    qryProveedor: TIBQuery;
    cdsSQLProveedorCODPROVEEDOR: TIntegerField;
    tbSQLProveedorNOMBREPROVEEDOR: TIBStringField;
    tbSQLProveedorTELEFONO: TIBStringField;
    tbSQLProveedorRUC: TIBStringField;
    tbSQLProveedorMAIL: TIBStringField;
    tbSQLProveedorWEB: TIBStringField;
    tbSQLProveedorDIRECCION: TIBStringField;
    cdsSQLProveedorCODCIUDADPRO: TIntegerField;
    pgc1: TPageControl;
    ts1: TTabSheet;
    pnl2: TPanel;
    dbnvgr2: TDBNavigator;
    grp3: TGroupBox;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    dbedtCodArt: TDBEdit;
    dbeNomProv: TDBEdit;
    cbxCiudad: TDBLookupComboboxEh;
    ts2: TTabSheet;
    DBGridEh2: TDBGridEh;
    qryCiudad: TIBQuery;
    dsCiudad: TDataSource;
    dbeDireccion: TDBEdit;
    lbl15: TLabel;
    dbeTel: TDBEdit;
    lbl16: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProveedoresUt: TfrmProveedoresUt;

implementation
  Uses
    DataModule;
{$R *.dfm}

procedure TfrmProveedoresUt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  cdsProveedor.Close;
  qryCiudad.Close;
end;

procedure TfrmProveedoresUt.FormShow(Sender: TObject);
begin
  cdsProveedor.Open;
  qryCiudad.Open;
end;

end.
