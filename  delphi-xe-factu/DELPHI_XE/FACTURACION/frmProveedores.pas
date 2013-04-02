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
    pgc1: TPageControl;
    ts1: TTabSheet;
    pnl2: TPanel;
    dbnvgr2: TDBNavigator;
    grp3: TGroupBox;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    cbxCiudad: TDBLookupComboboxEh;
    ts2: TTabSheet;
    DBGridEh2: TDBGridEh;
    qryGrillaProv: TIBQuery;
    dsGrillaProveedor: TDataSource;
    lbl15: TLabel;
    lbl16: TLabel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    cdsGrillaProvCODPROVEEDOR: TIntegerField;
    tbGrillaProvNOMBREPROVEEDOR: TIBStringField;
    tbGrillaProvTELEFONO: TIBStringField;
    tbGrillaProvCONCATENATION: TIBStringField;
    tbGrillaProvNOMBRECIUDAD: TIBStringField;
    dsCiudad: TDataSource;
    qryCiudad: TIBQuery;
    cdsCiudadCODCIUDAD: TIntegerField;
    tbCiudadNOMBRECIUDAD: TIBStringField;
    cdsCiudadCODPAIS: TIntegerField;
    edtRucDV: TDBEditEh;
    edtMailNOMBREPROVEEDOR: TDBEditEh;
    edtMailNomProveedor: TDBEditEh;
    edtDireccionProveedor: TDBEditEh;
    edtTelefono: TDBEditEh;
    edtRucProv: TDBEditEh;
    edtwebpage: TDBEditEh;
    edtMailProv: TDBEditEh;
    cdsProveedorCODPROVEEDOR: TIntegerField;
    tbProveedorNOMBREPROVEEDOR: TIBStringField;
    tbProveedorTELEFONO: TIBStringField;
    tbProveedorRUC: TIBStringField;
    tbProveedorRUC_DV: TIBStringField;
    tbProveedorMAIL: TIBStringField;
    tbProveedorWEB: TIBStringField;
    tbProveedorDIRECCION: TIBStringField;
    cdsProveedorCODCIUDADPRO: TIntegerField;
    cdsProveedorCODPROVEEDOR2: TIntegerField;
    cdsProveedorNOMBREPROVEEDOR: TWideStringField;
    cdsProveedorTELEFONO: TWideStringField;
    cdsProveedorRUC: TWideStringField;
    cdsProveedorRUC_DV: TWideStringField;
    cdsProveedorMAIL: TWideStringField;
    cdsProveedorWEB: TWideStringField;
    cdsProveedorDIRECCION: TWideStringField;
    cdsProveedorCODCIUDADPRO2: TIntegerField;
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
  qryGrillaProv.Close;
  qryCiudad.Close;
end;

procedure TfrmProveedoresUt.FormShow(Sender: TObject);
begin
  cdsProveedor.Open;
  qryGrillaProv.Open;
  qryCiudad.Open;
end;

end.
