unit frmPais;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frmTablaMenor, StdCtrls, ExtCtrls, DB, IBCustomDataSet, IBQuery,
  DBCtrls, Mask, DBTables, IBTable;

type
  TfrmTablaMenorPais = class(TfrmTablaMenorPadre)
    dbedtBANDERA: TDBEdit;
    dbedtGENTILICIO: TDBEdit;
    lbl2: TLabel;
    lbl3: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTablaMenorPais: TfrmTablaMenorPais;

implementation

{$R *.dfm}

procedure TfrmTablaMenorPais.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  TablaMenor.Active:=False;
end;

procedure TfrmTablaMenorPais.FormShow(Sender: TObject);
begin
  inherited;
    TablaMenor.Active:=TRUE;
end;

end.
