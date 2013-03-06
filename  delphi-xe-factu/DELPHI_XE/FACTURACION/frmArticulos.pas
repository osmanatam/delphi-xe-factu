unit frmArticulos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DBCtrls, IBQuery, DB, IBCustomDataSet, IBTable, StdCtrls,
  Mask, ExtCtrls, Grids, DBGrids, JvDBImage, ExtDlgs,
  jpeg, JvGIF, JvPCX, JvAni, JvExDBGrids, JvDBGrid, JvJVCLUtils,
  Buttons, DBClient, JvExExtCtrls, JvImage, DBGridEhGrouping, Provider, GridsEh,
  DBGridEh, DBCtrlsEh, DBLookupEh, IBStoredProc;

type
  TfrmArticulosUt = class(TForm)
    pgcConsulta: TPageControl;
    tsDatos: TTabSheet;
    tsConsulta: TTabSheet;
    pnl1: TPanel;
    dbnvgr1: TDBNavigator;
    grp1: TGroupBox;
    dbedtCodArt: TDBEdit;
    dbedtNombreArt: TDBEdit;
    grp2: TGroupBox;
    dbedtPrecioCompra: TDBEdit;
    dbedtExistencia: TDBEdit;
    dbedtExistenciaMin: TDBEdit;
    dbchkPRECIO_MODIFICABLE: TDBCheckBox;
    dbchkAVISAR_EXIST_MIN: TDBCheckBox;
    dbmmoOBSERVACION: TDBMemo;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    dsArticulo: TDataSource;
    qryUnidadMedida: TIBQuery;
    qryTipoIva: TIBQuery;
    qryRamo: TIBQuery;
    qryProveedor: TIBQuery;
    dsUM: TDataSource;
    dsIVA: TDataSource;
    dsPROVEE: TDataSource;
    dsRAMO: TDataSource;
    qryGrillaArticulos: TIBQuery;
    dsGrillaArt: TDataSource;
    qryAux: TIBQuery;
    image: TJvDBImage;
    SQLQRY: TIBQuery;
    DBGridEh1: TDBGridEh;
    qryArticulo: TIBQuery;
    qryArticuloCODARTICULO: TLargeintField;
    tbArticuloAVISAR_EXIST_MIN: TIBStringField;
    cdsArticuloCODPROVEEDOR: TIntegerField;
    cdsArticuloCODRAMO: TIntegerField;
    cdsArticuloCODTIPOIVA: TIntegerField;
    cdsArticuloCODUNIDADMEDIDA: TIntegerField;
    tbArticuloDESCRIPCION: TIBStringField;
    cdsArticuloEXISTENCIA: TIntegerField;
    cdsArticuloEXISTENCIA_MIN: TIntegerField;
    tbArticuloEXT_IMG: TIBStringField;
    qryArticuloIMAGEN: TWideMemoField;
    tbArticuloNOM_IMG: TIBStringField;
    tbArticuloOBSERVACION: TIBStringField;
    tbArticuloPRECIO_MODIFICABLE: TIBStringField;
    qryArticuloPRECIOCOMPRA: TLargeintField;
    dspvArticulo: TDataSetProvider;
    cdsArticulo: TClientDataSet;
    cbxUM: TDBLookupComboboxEh;
    cbxIVA: TDBLookupComboboxEh;
    cbxRAMO: TDBLookupComboboxEh;
    cbxPROVEEDOR: TDBLookupComboboxEh;
    sp: TIBStoredProc;
    OpenPictureDialog1: TOpenPictureDialog;
    btn1: TBitBtn;
    btn2: TButton;
    imgFoto: TImage;
    cdsArticuloCODARTICULO: TLargeintField;
    cdsArticuloAVISAR_EXIST_MIN: TWideStringField;
    cdsArticuloCODPROVEEDOR2: TIntegerField;
    cdsArticuloCODRAMO2: TIntegerField;
    cdsArticuloCODTIPOIVA2: TIntegerField;
    cdsArticuloCODUNIDADMEDIDA2: TIntegerField;
    cdsArticuloDESCRIPCION: TWideStringField;
    cdsArticuloEXISTENCIA2: TIntegerField;
    cdsArticuloEXISTENCIA_MIN2: TIntegerField;
    cdsArticuloEXT_IMG: TWideStringField;
    cdsArticuloIMAGEN: TMemoField;
    cdsArticuloNOM_IMG: TWideStringField;
    cdsArticuloOBSERVACION: TWideStringField;
    cdsArticuloPRECIO_MODIFICABLE: TWideStringField;
    cdsArticuloPRECIOCOMPRA: TLargeintField;
    sp1: TIBStoredProc;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tsConsultaEnter(Sender: TObject);
    procedure tsConsultaExit(Sender: TObject);
    procedure dbnvgr1Click(Sender: TObject; Button: TNavigateBtn);
    procedure imageClick(Sender: TObject);

    procedure DBGridEh1DblClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmArticulosUt: TfrmArticulosUt;
  CODIGOART: STRING;

implementation
 uses DataModule;
{$R *.dfm}


procedure TfrmArticulosUt.btn1Click(Sender: TObject);
  var
  BlobField: TField;
 BS: TStream;
begin

   SQLQRY.SQL.Clear;
    SQLQRY.SQL.Add('SELECT IMAGEN FROM articulo WHERE codarticulo=:COD');
    SQLQRY.ParamByName('COD').AsInteger:= StrToInt(Trim(dbedtCodArt.Text));
    SQLQRY.Open;
    SQLQRY.First;
  with SQLQRY do

    begin
       BlobField := FieldByName('IMAGEN'); {'Pic' is name of column with photo}
       BS := CreateBlobStream(BlobField,bmRead);
       Image.Picture.Graphic:= TJpegImage.Create; {assume is Jpeg}
    Try
       Image.Picture.Graphic.LoadFromStream(BS); {error if not Jpeg}
      Except {repeat steps for BitMap}
         BS.Free;
         Image.Picture.Graphic:= nil; {empty}
         BlobField := FieldByName('IMAGEN'); {'Pic' is name of column with photo}
         BS := CreateBlobStream(BlobField,bmRead);
         Image.Picture.Graphic:= TBitMap.Create; {bitmap}
         Image.Picture.Graphic.LoadFromStream(BS);
      end; {Try}
      BS.Free;
    end; {with SQLQuery}
end;

procedure TfrmArticulosUt.btn2Click(Sender: TObject);
var
    Jpeg:TJpegImage;
    Corriente:TMemoryStream;
begin
  imgFoto.Picture := nil;
  if cdsArticuloIMAGEN.BlobSize > 0  then begin
    Jpeg:=TJpegImage.create;
    Corriente:=TMemoryStream.create;
    try
      cdsArticulo.SaveToStream(Corriente);
      Corriente.Seek(0,soFromBeginning);
      Jpeg.LoadFromStream(Corriente);
      //Jpeg.LoadFromStream(Corriente, ftBlob);
      imgFoto.Picture.Assign(Jpeg);
      imgFoto.Visible:=TRUE;
      imgFoto.Stretch:=TRUE;
    finally
      Jpeg.Free;
      Corriente.Free;
    end;
  end;

end;

procedure TfrmArticulosUt.DBGridEh1DblClick(Sender: TObject);
begin
       pgcConsulta.ActivePage:= tsDatos;
       cdsArticulo.Close;
       qryArticulo.SQL.Clear;
       qryArticulo.SQL.Add('SELECT * FROM articulo WHERE codarticulo=:COD');
       qryArticulo.ParamByName('COD').AsInteger:= StrToInt(Trim(DBGridEh1.Columns[0].Field.Text));
       cdsArticulo.Open;
       cdsArticulo.First;
end;

procedure TfrmArticulosUt.dbnvgr1Click(Sender: TObject; Button: TNavigateBtn);
begin
 case Button of
    nbEdit:
        begin

        end;
    nbPost:
        BEGIN



        END;
    nbInsert:
        BEGIN
          qryAux.SQL.Clear;
          qryAux.SQL.Add('select MAX(CODARTICULO)+1 FROM ARTICULO');
          qryAux.Open;
          CODIGOART:= qryAux.Fields[0].AsString;
          qryAux.Close;
        END;
    nbCancel:
        BEGIN

        END;
   end;

   with SQLQRY do
   begin
        SQL.Clear;
        SQL.Add('SELECT DIR_IMAGENES FROM PARAMETROS');
        Open;
        try
         if  image.Picture.LoadFromFile(TRIM(FieldByName('DIR_IMAGENES').AsString)+TRIM(dbedtCodArt.Text)+'.JPG');


        except
         image.Picture.LoadFromFile(TRIM(FieldByName('DIR_IMAGENES').AsString)+TRIM(dbedtCodArt.Text)+'.JPG');
        END;
       Close;
    END






end;

procedure TfrmArticulosUt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  cdsArticulo.Close;
  qryUnidadMedida.Active:=false;
  qryTipoIva.Active:=false;
  qryRamo.Active:=false;
  qryProveedor.Active:=false;
  qryGrillaArticulos.Active:=false;

end;

procedure TfrmArticulosUt.FormShow(Sender: TObject);
begin
  cdsArticulo.Open;
  qryUnidadMedida.Active:=true;
  qryTipoIva.Active:=true;
  qryRamo.Active:=true;
  qryProveedor.Active:=true;
  qryGrillaArticulos.Active:=true;
  pgcConsulta.ActivePage:= tsConsulta;


   with SQLQRY do
   begin
        SQL.Clear;
        SQL.Add('SELECT DIR_IMAGENES FROM PARAMETROS');
        Open;
        try
         image.Picture.LoadFromFile(TRIM(FieldByName('DIR_IMAGENES').AsString)+TRIM(dbedtCodArt.Text)+'.JPG');
        except
         image.Picture.LoadFromFile(TRIM(FieldByName('DIR_IMAGENES').AsString)+TRIM(dbedtCodArt.Text)+'.JPG');
        Close;
        END
    END

end;

procedure TfrmArticulosUt.imageClick(Sender: TObject);
var
 i:integer;
 S: TMemoryStream;
begin
  if OpenPictureDialog1.Execute then
  begin
    Image.Picture.LoadFromFile(OpenPictureDialog1.FileName);
    S := TMemoryStream.Create;
    try
      Image.Picture.Graphic.SaveToStream(S);
      sp.Params[1].LoadFromStream(S, ftBlob);
      sp.Params[0].AsInteger := StrToInt(dbedtCodArt.Text);
      sp.ExecProc;
    finally
      S.Free;
    end;
  end;
end;

procedure TfrmArticulosUt.tsConsultaEnter(Sender: TObject);
begin
  // qryGrillaArticulos.Active:=true;
  dbedtCodArt.text:=CODIGOART;
  keybd_event(VK_TAB, 0, 0, 0);
end;

procedure TfrmArticulosUt.tsConsultaExit(Sender: TObject);
begin
   //qryGrillaArticulos.Active:=false;
end;

end.

