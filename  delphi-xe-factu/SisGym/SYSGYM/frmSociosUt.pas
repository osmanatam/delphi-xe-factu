unit frmSociosUt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frmABMCUt, DBGridEhGrouping, FMTBcd, DB, DBClient, Provider, SqlExpr,
  GridsEh, DBGridEh, Buttons, ComCtrls, StdCtrls, ExtCtrls;

type
  TfrmSocios = class(TfrmBaseABMC)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSocios: TfrmSocios;

implementation
  uses UtilidadesGlobales;
{$R *.dfm}

procedure TfrmSocios.FormCreate(Sender: TObject);
begin
  inherited;
  ConsultaBD(cdsCabecera);
end;

end.
