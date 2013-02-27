unit frmEmpresa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frmModeloFormulario, IBQuery, DB, IBCustomDataSet, IBTable, Grids,
  DBGrids, ExtCtrls, DBCtrls, StdCtrls, Mask, ComCtrls;

type
  TfrmBaseTMEmpresa = class(TfrmBaseTM)
    qryGrillaRazon: TIBStringField;
    qryGrillaId_Empresa: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBaseTMEmpresa: TfrmBaseTMEmpresa;

implementation

{$R *.dfm}

procedure TfrmBaseTMEmpresa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryGrilla.Active:=FALSE;
end;

procedure TfrmBaseTMEmpresa.FormShow(Sender: TObject);
begin
  inherited;
   qryGrilla.Active:=TRUE;
end;

end.
