unit frmUnidadMedida;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frmTablaMenor, DB, IBCustomDataSet, IBTable, DBCtrls, StdCtrls, Mask,
  ExtCtrls, IBQuery;

type
  TfrmTablaMenorUM = class(TfrmTablaMenorPadre)
    dbedtDESCRIPCION: TDBEdit;
    lbl2: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTablaMenorUM: TfrmTablaMenorUM;

implementation

{$R *.dfm}

end.
