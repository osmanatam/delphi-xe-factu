unit frmModeloFormulario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, DATAMODULE, DB, IBCustomDataSet, IBTable, Grids,
  DBGrids, Mask, DBCtrls, ExtCtrls, IBQuery, DBClient, Provider,
  DBGridEhGrouping, GridsEh, DBGridEh;

type
  TfrmBaseTM = class(TForm)
    pgc1: TPageControl;
    tsABM: TTabSheet;
    tsCONSULTA: TTabSheet;
    dbedtClave: TDBEdit;
    dbnvgr1: TDBNavigator;
    dbedtNombre: TDBEdit;
    pnl1: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    qryGrilla: TIBQuery;
    dsGrilla: TDataSource;
    qryTablaModelo: TIBQuery;
    dspvTablaModelo: TDataSetProvider;
    cdsTablaModelo: TClientDataSet;
    qryMaxCodigo: TIBQuery;
    DBGridEh1: TDBGridEh;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBaseTM: TfrmBaseTM;

implementation
 Uses
   Utilidades;

{$R *.dfm}

procedure TfrmBaseTM.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  cdsTablaModelo.Close;
  qryGrilla.Close;
end;

procedure TfrmBaseTM.FormShow(Sender: TObject);
begin
  cdsTablaModelo.Open;
  qryGrilla.Open;
end;

end.
