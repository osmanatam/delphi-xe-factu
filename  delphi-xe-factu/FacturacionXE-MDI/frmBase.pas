unit frmBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, DBCtrls, StdCtrls, Buttons, DBActns, ActnList;

type
  TfrmBaseUt = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    tgDatos: TTabSheet;
    tgConsulta: TTabSheet;
    DBNavigator1: TDBNavigator;
    pnl3: TPanel;
    btnPrimero: TBitBtn;
    btnAnterior: TBitBtn;
    btnSiguiente: TBitBtn;
    btnUltimo: TBitBtn;
    btnAgregar: TBitBtn;
    btnDelete: TBitBtn;
    btnModificar: TBitBtn;
    btnAceptar: TBitBtn;
    btnCancel: TBitBtn;
    actlst1: TActionList;
    DataSetFirst1: TDataSetFirst;
    DataSetPrior1: TDataSetPrior;
    DataSetNext1: TDataSetNext;
    DataSetLast1: TDataSetLast;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBaseUt: TfrmBaseUt;

implementation
    uses Utilidades;
{$R *.dfm}

procedure TfrmBaseUt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:= caFree;
end;

procedure TfrmBaseUt.FormShow(Sender: TObject);
begin
 PageControl1.ActivePageIndex:=0;
end;

end.
