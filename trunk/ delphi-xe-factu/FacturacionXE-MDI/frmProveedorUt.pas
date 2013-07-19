unit frmProveedorUt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frmBase, DBCtrls, ComCtrls, ExtCtrls, StdCtrls, DBGridEh, DB,
  Provider, DBClient, IBCustomDataSet, IBQuery, DBCtrlsEh, DBLookupEh, Mask,
  DBGridEhGrouping, GridsEh, Buttons;

type
  TfrmProveedor = class(TfrmBaseUt)
    GroupBox1: TGroupBox;
    dbeCodProveedor: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    dbeNombreProveedor: TDBEdit;
    dblCiudad: TDBLookupComboboxEh;
    Label3: TLabel;
    dsProveedor: TDataSource;
    qryProveedor: TIBQuery;
    cdsProveedor: TClientDataSet;
    pvProveedor: TDataSetProvider;
    cdsProveedorCODPROVEEDOR: TIntegerField;
    cdsProveedorNOMBREPROVEEDOR: TWideStringField;
    cdsProveedorTELEFONO: TWideStringField;
    cdsProveedorRUC: TWideStringField;
    cdsProveedorRUC_DV: TWideStringField;
    cdsProveedorMAIL: TWideStringField;
    cdsProveedorWEB: TWideStringField;
    cdsProveedorDIRECCION: TWideStringField;
    cdsProveedorCODCIUDADPRO: TIntegerField;
    cdsProveedorOBSERVACION: TWideStringField;
    dbeDireccion: TDBEdit;
    dbeMail: TDBEdit;
    dbePaginaWeb: TDBEdit;
    dbeRuc: TDBEdit;
    dbeRUCdv: TDBEdit;
    dbmmoOBSERVACION: TDBMemo;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    dbeTelefono: TDBEdit;
    lbl5: TLabel;
    lbl6: TLabel;
    dbeTELEFONO2: TDBEdit;
    lbl7: TLabel;
    cdsProveedorTEFEFONO2: TWideStringField;
    cdsProveedorCONTACTO: TWideStringField;
    dbeContacto: TDBEdit;
    qryCiudad: TIBQuery;
    ds1: TDataSource;
    dsAux: TDataSource;
    qryAux: TIBQuery;
    DBGridEh1: TDBGridEh;
    pnl1: TPanel;
    pnl2: TPanel;
    lbl8: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure DBGridEh1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProveedor: TfrmProveedor;

implementation
  uses Utilidades;
{$R *.dfm}

procedure TfrmProveedor.DBGridEh1DblClick(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePageIndex:=0;
  cdsProveedor.Edit;
  cdsProveedorCODPROVEEDOR.AsInteger:=DBGridEh1.Columns[0].Field.AsInteger;
end;

procedure TfrmProveedor.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
  inherited;
  case Button of
    nbFirst: ;
    nbPrior: ;
    nbNext: ;
    nbLast: ;
    nbInsert:
    begin
     qryAux.Open;
     dbeCodProveedor.Text:= qryAux.Fields[0].AsString;
     qryAux.Close;
    end;
    nbDelete:
    begin
       if msSin('Desea eliminar Proveedor?, No se eliminara si ya se tienen compras relacionadas','Eliminar Proveedor') then
         cdsProveedor.ApplyUpdates(0);
       cdsProveedor.Close;
       cdsProveedor.Open;
     end;
    nbEdit: ;
    nbPost: cdsProveedor.ApplyUpdates(0);
    nbCancel: ;
    nbRefresh: ;
  end;
end;

procedure TfrmProveedor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  cdsProveedor.Close;
  qryCiudad.Close;
end;

procedure TfrmProveedor.FormShow(Sender: TObject);
begin
  inherited;
  cdsProveedor.Open;
  qryCiudad.Open;
end;

end.
