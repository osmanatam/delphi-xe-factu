unit frmTipoIVA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frmTablaMenor, DB, IBCustomDataSet, IBTable, DBCtrls, StdCtrls, Mask,
  ExtCtrls, IBQuery;

type
  TfrmTablaMenorIVA = class(TfrmTablaMenorPadre)
    dbedtDESCIVA: TDBEdit;
    lbl2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbnvgr1Click(Sender: TObject; Button: TNavigateBtn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTablaMenorIVA: TfrmTablaMenorIVA;

implementation

{$R *.dfm}

procedure TfrmTablaMenorIVA.dbnvgr1Click(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  case Button of
    nbInsert:
      begin
        qryMaxCodigo.Active:=true;
        dbedt1.Text:= qryMaxCodigo.FieldByName('Codtipoiva').AsString;
        qryMaxCodigo.Active:=false;
      end;
  end;
end;

procedure TfrmTablaMenorIVA.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  TablaMenor.Active:=FALSE;
end;

procedure TfrmTablaMenorIVA.FormShow(Sender: TObject);
begin
  inherited;
  TablaMenor.Active:=TRUE;
end;

end.
