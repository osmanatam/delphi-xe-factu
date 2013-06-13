unit frmAgencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frmBase, ExtCtrls, DBCtrls, ComCtrls, DBGridEh, DB, Provider,
  DBClient, IBCustomDataSet, IBQuery, StdCtrls, DBCtrlsEh, DBLookupEh, Mask;

type
  TfrmAgenciaUt = class(TfrmBaseUt)
    grpAgencia: TGroupBox;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    dbedtCodAgencia: TDBEdit;
    dbedtNombreAgencia: TDBEdit;
    dbeEmpresa: TDBLookupComboboxEh;
    btn2: TButton;
    btn1: TButton;
    dsAgencia: TDataSource;
    qryAgencia: TIBQuery;
    cdsAgencia: TClientDataSet;
    dspvAgencia: TDataSetProvider;
    dbedtUC: TDBEdit;
    lbl1: TLabel;
    cdsAgenciaCODAGENCIA: TIntegerField;
    cdsAgenciaNOMBREAGENCIA: TWideStringField;
    cdsAgenciaCODEMPRESA: TIntegerField;
    cdsAgenciaRUC: TWideStringField;
    dsEmpresa: TDataSource;
    qryeMPRESA: TIBQuery;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAgenciaUt: TfrmAgenciaUt;

implementation

{$R *.dfm}

procedure TfrmAgenciaUt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  qryeMPRESA.Active:=False;
  cdsAgencia.Active:=False;
  Action := caFree;
end;

procedure TfrmAgenciaUt.FormShow(Sender: TObject);
begin
  inherited;
  qryeMPRESA.Active:=True;
  cdsAgencia.Active:=True;
end;

end.
