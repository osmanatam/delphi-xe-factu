unit frmAgencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frmModeloFormulario, IBQuery, DB, IBCustomDataSet, IBTable, Grids,
  DBGrids, ExtCtrls, DBCtrls, StdCtrls, Mask, ComCtrls, DBClient, Provider,
  DBGridEhGrouping, GridsEh, DBGridEh;

type
  TfrmBaseTMAgencia = class(TfrmBaseTM)
    dbedtCodEmpresa: TDBEdit;
    lbl3: TLabel;
    intgrfldGrillaId_Agencia: TIntegerField;
    qryGrillaNombre_Agencia: TIBStringField;
    intgrfldGrillaId_Empresa: TIntegerField;
    qryGrillaNombre_Empresa: TIBStringField;
    lblAcciones: TLabel;
    dblkcbbCODAGENCIA: TDBLookupComboBox;
    procedure dbnvgr1Click(Sender: TObject; Button: TNavigateBtn);
    procedure dbnvgr1BeforeAction(Sender: TObject; Button: TNavigateBtn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBaseTMAgencia: TfrmBaseTMAgencia;
    codagencia1:string;
    nomagencia1:string;
    codempresa1:string;
    nomempresa1:string;

implementation

{$R *.dfm}

procedure TfrmBaseTMAgencia.dbnvgr1BeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  inherited;
  case Button of
    nbPost:
        begin

        end;
    nbEdit:
        begin

        end;
  end;
end;

procedure TfrmBaseTMAgencia.dbnvgr1Click(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  case Button of
    nbEdit:
        begin

        end;
    nbPost:
        BEGIN

        END;
    nbInsert:
        BEGIN

        END;
    nbCancel:
        begin
        
        end;
   end;
end;

end.
