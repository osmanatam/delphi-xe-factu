unit frmCiudad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEhGrouping, GridsEh, DBGridEh, DBCtrls, ExtCtrls, StdCtrls,
  Mask, ComCtrls,DataModule, FMTBcd, SqlExpr, DB, DBClient, Provider, DBCtrlsEh,
  DBLookupEh, PrViewEh, JvExControls, JvDBLookupTreeView, IBCustomDataSet,
  IBQuery,frmpaisult, JvDBControls;

type
  TfrmCiudad2 = class(TForm)
    pgc1: TPageControl;
    tsABM: TTabSheet;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lblAcciones: TLabel;
    dbedtCODCIUDAD: TDBEdit;
    dbedtNOMBRECIUDAD: TDBEdit;
    pnl1: TPanel;
    dbedtCODPAIS: TDBEdit;
    tsCONSULTA: TTabSheet;
    DBGridEh1: TDBGridEh;
    dbnvgr2: TDBNavigator;
    dsTablaRelacion: TDataSource;
    cbxCODPAIS: TDBLookupComboBox;
    qryTablaRelacion: TIBQuery;
    dsTablaReal: TDataSource;
    dsGrilla: TDataSource;
    qryGrilla: TIBQuery;
    cdsSQ2CODCIUDAD: TIntegerField;
    tbSQ2NOMBRECIUDAD: TIBStringField;
    cdsSQ2CODPAIS: TIntegerField;
    tbSQ2NOMBREPAIS: TIBStringField;
    qryTablaReal: TIBQuery;
    cds1: TIntegerField;
    tb1: TIBStringField;
    cds2: TIntegerField;
    cdsTablaReal: TClientDataSet;
    dspvTablaReal: TDataSetProvider;
    cdsTablaRealCODCIUDAD: TIntegerField;
    cdsTablaRealNOMBRECIUDAD: TWideStringField;
    cdsTablaRealCODPAIS: TIntegerField;
    dbnvgr1: TDBNavigator;
    qryMaxCodigo: TIBQuery;
    btn1: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbxCODPAISCloseUp(Sender: TObject);
    procedure dbnvgr1Click(Sender: TObject; Button: TNavigateBtn);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure tsCONSULTAEnter(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCiudad2: TfrmCiudad2;

implementation
  Uses
    Utilidades;
{$R *.dfm}

procedure TfrmCiudad2.btn1Click(Sender: TObject);
begin
    frmBaseTMPais:=TfrmBaseTMPais.Create(SELF);
    frmBaseTMPais.pnl1.Caption:='Mantenimiento Pais';
    frmBaseTMPais.Show;
end;

procedure TfrmCiudad2.cbxCODPAISCloseUp(Sender: TObject);
begin
   dbedtCODPAIS.Text:=TRIM(cbxCODPAIS.KeyValue);
end;

procedure TfrmCiudad2.DBGridEh1DblClick(Sender: TObject);
begin
       pgc1.ActivePage:= tsABM;
       cdsTablaReal.Close;
       qryTablaReal.SQL.Clear;
       qryTablaReal.SQL.Add('SELECT CODCIUDAD, NOMBRECIUDAD, CODPAIS FROM CIUDAD WHERE CODCIUDAD=:COD');
       qryTablaReal.ParamByName('COD').AsInteger:= StrToInt(Trim(DBGridEh1.Columns[0].Field.Text));
       cdsTablaReal.Open;
       cdsTablaReal.First;
end;


procedure TfrmCiudad2.dbnvgr1Click(Sender: TObject; Button: TNavigateBtn);
begin
     case Button of
    nbPost:
        begin

         if (trim(dbedtCODCIUDAD.Text)='') or (trim(dbedtNOMBRECIUDAD.Text)='') or (trim(dbedtCODPAIS.Text)='') then
             BEGIN
              dbedtNOMBRECIUDAD.SetFocus;
             // dvnvgr1.btn1Click(nbCancel);
             END
         ELSE
             BEGIN
              cdsTablaReal.ApplyUpdates(0);
              cdsTablaReal.Close;
              qryTablaReal.SQL.Clear;
              qryTablaReal.SQL.Add('SELECT CODCIUDAD, NOMBRECIUDAD, CODPAIS FROM CIUDAD ORDER BY 1');
              cdsTablaReal.Open;
             END;
        end;
    nbNext:
        begin

        end;
    nbCancel:
        begin

        end;
    nbInsert:
        begin
          qryMaxCodigo.Active:=true;
          dbedtCODCIUDAD.Text:= qryMaxCodigo.FieldByName('CodCiudad').AsString;
          cbxCODPAIS.KeyValue:=1;
          dbedtCODPAIS.Text:='1';
          qryMaxCodigo.Active:=false;
        end;
    nbDelete:
        begin
           if Utilidades.msSi('Esta Seguro Borrar Ciudad?','Borrar Ciudad') = true then
              cdsTablaReal.ApplyUpdates(0);
           cdsTablaReal.Close;
           qryTablaReal.SQL.Clear;
           qryTablaReal.SQL.Add('SELECT CODCIUDAD, NOMBRECIUDAD, CODPAIS FROM CIUDAD ORDER BY 1');
           cdsTablaReal.Open;
        end;
  end;
  qryGrilla.Close;
  qryGrilla.Open;
  DBGridEh1.Refresh;
end;

procedure TfrmCiudad2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    qryTablaRelacion.Close;
    cdsTablaReal.Close;
    qryTablaReal.Close;
end;

procedure TfrmCiudad2.FormShow(Sender: TObject);
begin
    qryTablaRelacion.Open;
    cdsTablaReal.Open;
    qryTablaReal.Open;
    pgc1.ActivePage:= tsCONSULTA;
end;

procedure TfrmCiudad2.tsCONSULTAEnter(Sender: TObject);
begin
   cdsTablaReal.Cancel;
end;

end.
