unit frmArticulos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DBCtrls, IBQuery, DB, IBCustomDataSet, IBTable, StdCtrls,
  Mask, ExtCtrls, Grids, DBGrids, JvDBImage, ExtDlgs,
  jpeg, JvGIF, JvPCX, JvAni, JvExDBGrids, JvDBGrid, JvJVCLUtils,
  Buttons, DBClient, JvExExtCtrls, JvImage, DBGridEhGrouping, Provider, GridsEh,
  DBGridEh, DBCtrlsEh, DBLookupEh;

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
    OpenPictureDialog1: TOpenPictureDialog;
    JvDBImage1: TJvDBImage;
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
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tsConsultaEnter(Sender: TObject);
    procedure tsConsultaExit(Sender: TObject);
    procedure dbnvgr1Click(Sender: TObject; Button: TNavigateBtn);
    procedure JvDBImage1Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);

  private
     procedure AddImage(const Filename: string);
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
  imgJPG:TJpegImage;
  blobF:TBlobField;
  Corriente:TMemoryStream;
  fs : TMemoryStream;

  xSQl:String;
begin
   imgJPG := TJpegImage.create;
  with SQLQRY do begin

    SQL.Clear;
    SQL.Add('SELECT IMAGEN FROM ARTICULO WHERE' +
          ' CODARTICULO=1001');
    Open;
    if RecordCount = 1 then begin
      (Fields[0] as TBlobField).SaveToStream(fs);
      imgJPG.LoadFromStream(fs);
      //with DM1.TableRepositorioImagen do begin
        //imgFoto.Picture.Assign(imgJPG);   // imgFOTO es un componente TImage
        //imgFoto.Visible := True;
        //ImgFoto.Refresh;
      //end;
    end;
 //   Close;   //Evito cerrar el query que recupera la consulta pensado que se cerraba y que la imagen ya no se visualizaba
  end;
  fs.Free;
  imgJPG.Free;
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

end;

procedure TfrmArticulosUt.JvDBImage1Click(Sender: TObject);
var i:integer;
begin
     with OpenPictureDialog1 do
  if Execute then
  begin
    try
        AddImage(Files[0]);
    finally

    end;
  end;
end;

procedure TfrmArticulosUt.AddImage(const Filename:string);
begin
  // ClientDataSet1ima.Text:=tbTablaArticulo.FieldByName('IMAGEN').AsString;
  //tbTablaArticulo.Append;
  JvDBImage1.Picture.LoadFromFile(Filename);
  //tbTablaArticuloIMAGEN.LoadFromFile(Filename);
  //tbTablaArticulo.FieldByName('NOM_IMG').AsString := ExtractFileName(Filename);
 // tbTablaArticulo.FieldByName('EXT_IMG').AsString := AnsiUpperCase(Copy(ExtractFileExt(Filename), 2, MaxInt));

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

