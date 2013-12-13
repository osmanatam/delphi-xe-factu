unit frmAgencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frmBase, ExtCtrls, DBCtrls, ComCtrls, DBGridEh, DB, Provider,
  DBClient, IBCustomDataSet, IBQuery, StdCtrls, DBCtrlsEh, DBLookupEh, Mask,
  DBGridEhGrouping, GridsEh, Buttons, DBActns, ActnList;

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
    qryAux: TIBQuery;
    dsAux: TDataSource;
    DBGridEh1: TDBGridEh;
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
  frmAgenciaUt: TfrmAgenciaUt;

implementation
    uses Utilidades;
{$R *.dfm}

procedure TfrmAgenciaUt.DBGridEh1DblClick(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePageIndex:=0;
  cdsAgencia.Edit;
  cdsAgenciaCODAGENCIA.Value:=DBGridEh1.Columns[0].Field.AsInteger;
end;

procedure TfrmAgenciaUt.DBNavigator1Click(Sender: TObject;
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
       dbedtCodAgencia.Text:= qryAux.Fields[0].AsString;
       qryAux.Close;
     end;
    nbDelete:
     begin
       if msSin('Desea eliminar la Agencia?','Eliminar Agencia') then
         cdsAgencia.ApplyUpdates(0);
       cdsAgencia.Close;
       cdsAgencia.Open;
     end;
    nbEdit: ;
    nbPost: cdsAgencia.ApplyUpdates(0);
    nbCancel: ;
    nbRefresh: ;
  end;
end;

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
