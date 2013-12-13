unit frmSociosUt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frmBaseUt, StdCtrls;

type
  TfrmSocios = class(TfrmBase)
    edt1: TEdit;
    edt2: TEdit;
    cbb1: TComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSocios: TfrmSocios;

implementation

{$R *.dfm}

end.
