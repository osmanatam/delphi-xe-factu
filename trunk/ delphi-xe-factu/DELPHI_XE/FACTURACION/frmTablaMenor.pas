unit frmTablaMenor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,datamodule, DB, IBCustomDataSet, IBQuery, DBCtrls,
  Mask, IBTable;

type
  TfrmTablaMenorPadre = class(TForm)
    pnlTablaMenor: TPanel;
    lblClave: TLabel;
    lbl1: TLabel;
    dsTablaMenor: TDataSource;
    dbedtEdNombre: TDBEdit;
    TablaMenor: TIBTable;
    dbnvgr1: TDBNavigator;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    dbedt1: TDBEdit;
    qryMaxCodigo: TIBQuery;
    procedure FormCreate(Sender: TObject);
    procedure dbnvgr1Click(Sender: TObject; Button: TNavigateBtn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTablaMenorPadre: TfrmTablaMenorPadre;

implementation

{$R *.dfm}

procedure TfrmTablaMenorPadre.dbnvgr1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
   case Button of
    nbPrior:
        begin
          dbedt1.Enabled:=FALSE;
        end;
    nbNext:
        begin
          dbedt1.Enabled:=FALSE;
        end;
    nbEdit:
        begin
          dbedt1.Enabled:=FALSE;
        end;
    nbRefresh:
        BEGIN
          dbedt1.Enabled:=FALSE;
        END;
    nbPost:
        BEGIN
          dbedt1.Enabled:=FALSE;
        END;
    nbInsert:
        BEGIN
         dbedt1.Enabled:=TRUE;
        END;
   end;
end;

procedure TfrmTablaMenorPadre.FormCreate(Sender: TObject);
begin
       //qrytablaMenor.sql.clear;
end;

end.
