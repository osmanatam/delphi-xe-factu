unit frmArticulo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frmBase, ExtCtrls, DBGridEhGrouping, GridsEh, DBGridEh, StdCtrls,
  Mask, DBCtrls, ComCtrls, DBCtrlsEh, DBLookupEh, ExtDlgs, DB, IBCustomDataSet,
  IBQuery, DBClient, Provider,
  jpeg,pngimage, GIFImg, Buttons;

type
  TfrmArticuloUt = class(TfrmBaseUt)
    Panel2: TPanel;
    Button1: TButton;
    DBGridEh1: TDBGridEh;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    grpArticulo: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dbeCodArt: TDBEdit;
    dbeDescArt: TDBEdit;
    dblUnidadMedida: TDBLookupComboboxEh;
    dblTipoIva: TDBLookupComboboxEh;
    Label3: TLabel;
    Label4: TLabel;
    dblRamo: TDBLookupComboboxEh;
    Label5: TLabel;
    dblProveedor: TDBLookupComboboxEh;
    dbedtPRECIOCOMPRA: TDBEdit;
    dbedtPRECIOVTA: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    dbedtEXISTENCIA: TDBEdit;
    dbedtEXISTENCIA_MIN: TDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    dbchkPRECIO_MODIFICABLE: TDBCheckBox;
    dbchkAVISAR_EXIST_MIN: TDBCheckBox;
    shp1: TShape;
    Image1: TImage;
    OpenPictureDialog: TOpenPictureDialog;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    dspvArticulo: TDataSetProvider;
    cdsArticulo: TClientDataSet;
    cdsArticuloCODARTICULO: TLargeintField;
    cdsArticuloAVISAR_EXIST_MIN: TWideStringField;
    cdsArticuloCODPROVEEDOR2: TIntegerField;
    cdsArticuloCODRAMO2: TIntegerField;
    cdsArticuloCODTIPOIVA2: TIntegerField;
    cdsArticuloCODUNIDADMEDIDA2: TIntegerField;
    cdsArticuloDESCRIPCION: TWideStringField;
    cdsArticuloEXISTENCIA2: TIntegerField;
    cdsArticuloEXISTENCIA_MIN2: TIntegerField;
    cdsArticuloIMG_EXT: TWideStringField;
    cdsArticuloIMAGEN: TBlobField;
    cdsArticuloNOM_IMG: TWideStringField;
    cdsArticuloOBSERVACION: TWideStringField;
    cdsArticuloPRECIO_MODIFICABLE: TWideStringField;
    cdsArticuloPRECIOCOMPRA: TLargeintField;
    cdsArticuloPRECIOVTA: TLargeintField;
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
    tbArticuloIMG_EXT: TIBStringField;
    qryArticuloIMAGEN: TBlobField;
    tbArticuloNOM_IMG: TIBStringField;
    tbArticuloOBSERVACION: TIBStringField;
    tbArticuloPRECIO_MODIFICABLE: TIBStringField;
    qryArticuloPRECIOCOMPRA: TLargeintField;
    qryArticuloPRECIOVTA: TLargeintField;
    dsArticulo: TDataSource;
    dsUM: TDataSource;
    qryUnidadMedida: TIBQuery;
    dsIVA: TDataSource;
    qryTipoIva: TIBQuery;
    dsPROVEE: TDataSource;
    qryProveedor: TIBQuery;
    dsRAMO: TDataSource;
    qryRamo: TIBQuery;
    IBQuery1: TIBQuery;
    qryAux: TIBQuery;
    btnEliminar: TBitBtn;
    btnNuevo: TBitBtn;
    btnEditar: TBitBtn;
    lbl1: TLabel;
    procedure Image1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dsArticuloDataChange(Sender: TObject; Field: TField);
    procedure btnEditarClick(Sender: TObject);
    procedure btnNuevoClick(Sender: TObject);
    procedure btnEliminarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmArticuloUt: TfrmArticuloUt;

implementation
 uses DataModule,Utilidades;

{$R *.dfm}

procedure TfrmArticuloUt.btnEditarClick(Sender: TObject);
begin
  inherited;
  cdsArticulo.Edit;
  btnNuevo.Caption:='Guardar';
  btnEliminar.Caption:='Cancelar';
  btnEditar.Enabled:=False;
  grpArticulo.Enabled:=True;
end;

procedure TfrmArticuloUt.btnEliminarClick(Sender: TObject);
begin
  inherited;

  if btnEliminar.Caption='Cancelar' then
   begin
    cdsArticulo.Close;
    cdsArticulo.Open;
    btnEditar.Enabled:=True;
    btnNuevo.Caption:='Nuevo';
    btnEliminar.Caption:='Eliminar';
   end
  else
  begin
    if Utilidades.msSi('Esta Seguro Borrar el Articulo?','Borrar Articulo') = true then
    begin
      cdsArticulo.Delete;
      cdsArticulo.ApplyUpdates(0);
      cdsArticulo.Close;
      cdsArticulo.Open;
    end
  end;
  grpArticulo.Enabled:=False;
end;

procedure TfrmArticuloUt.btnNuevoClick(Sender: TObject);
begin
  inherited;
  if btnNuevo.Caption='Nuevo' then
   begin
      grpArticulo.Enabled:=True;
      cdsArticulo.Insert;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('select MAX(CODARTICULO)+1 FROM ARTICULO');
      qryAux.Open;
      cdsArticuloCODARTICULO.AsInteger:= qryAux.Fields[0].AsInteger;
      qryAux.Close;
      btnNuevo.Caption:='Guardar';
      btnEditar.Enabled:=False;
      btnEliminar.Enabled:=False;
   end
  else
   begin
      cdsArticulo.ApplyUpdates(0);
      btnNuevo.Caption:='Nuevo';
      btnEditar.Enabled:=True;
      btnEliminar.Enabled:=True;
      grpArticulo.Enabled:=False;
   end;
end;

procedure TfrmArticuloUt.dsArticuloDataChange(Sender: TObject; Field: TField);
var
  m, f: TStream;
begin
  inherited;
  if cdsArticuloIMAGEN.IsNull then
    Image1.Picture:= nil
  else
  begin
    if cdsArticuloIMG_EXT.AsString = 'BMP' then
      Image1.Picture.Graphic:= TBitmap.Create
    else if cdsArticuloIMG_EXT.AsString = 'JPG' then
      Image1.Picture.Graphic:= TJpegImage.Create
    else if cdsArticuloIMG_EXT.AsString='GIF' then
      Image1.Picture.Graphic:= TGIFImage.Create
    else
      Exit;
    m:= cdsArticulo.CreateBlobStream(cdsArticuloIMAGEN, bmRead);
    Image1.Picture.Graphic.LoadFromStream(m);
    m.Free;
  end;
end;

procedure TfrmArticuloUt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  cdsArticulo.Close;
  qryUnidadMedida.Active:=false;
  qryTipoIva.Active:=false;
  qryRamo.Active:=false;
  qryProveedor.Active:=false;
end;

procedure TfrmArticuloUt.FormShow(Sender: TObject);
begin
  inherited;
  cdsArticulo.Open;
  qryUnidadMedida.Active:=true;
  qryTipoIva.Active:=true;
  qryRamo.Active:=true;
  qryProveedor.Active:=true;
end;

procedure TfrmArticuloUt.Image1Click(Sender: TObject);
 var
  m, f: TStream;
  mst: TMemoryStream;
  s: string;
begin
  inherited;
   if OpenPictureDialog.Execute then
  begin
    cdsArticulo.Edit; //tendria que dar error sin esto
    cdsArticuloIMAGEN.LoadFromFile(OpenPictureDialog.filename);
    s:= AnsiUpperCase(ExtractFileExt(OpenPictureDialog.FileName)); //Siempre en mayusculas
    if s='.JPEG' then s:= '.JPG'; //un caso especial
    cdsArticuloIMG_EXT.AsString:= Copy(s,2,3); //elimino el punto
    //cds1.Post;
  end;
end;

end.