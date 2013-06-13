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
    qryArticulo: TIBQuery;
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
    lbl1: TLabel;
    btnEditar: TBitBtn;
    btnEliminar: TBitBtn;
    btnNuevo: TBitBtn;
    edt1: TEdit;
    dsGrilla: TDataSource;
    qryGrilla: TIBQuery;
    DBGridEh1: TDBGridEh;
    btn1: TButton;
    cdsArticuloCODARTICULO: TLargeintField;
    cdsArticuloAVISAR_EXIST_MIN: TWideStringField;
    cdsArticuloCODPROVEEDOR: TIntegerField;
    cdsArticuloCODRAMO: TIntegerField;
    cdsArticuloCODTIPOIVA: TIntegerField;
    cdsArticuloCODUNIDADMEDIDA: TIntegerField;
    cdsArticuloDESCRIPCION: TWideStringField;
    cdsArticuloEXISTENCIA: TIntegerField;
    cdsArticuloEXISTENCIA_MIN: TIntegerField;
    cdsArticuloIMG_EXT: TWideStringField;
    cdsArticuloIMAGEN: TBlobField;
    cdsArticuloNOM_IMG: TWideStringField;
    cdsArticuloOBSERVACION: TWideStringField;
    cdsArticuloES_MODIFICABLE_PRECIO: TWideStringField;
    cdsArticuloPRECIOCOMPRA: TLargeintField;
    cdsArticuloPRECIOVTA: TLargeintField;
    procedure Image1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dsArticuloDataChange(Sender: TObject; Field: TField);
    procedure btnAccionesClick(Sender: TObject);
    procedure coloreo(SN: Boolean);
    procedure btn1Click(Sender: TObject);
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

procedure TfrmArticuloUt.btn1Click(Sender: TObject);
begin
  inherited;
  if btn1.Caption='Cambiar' then
   begin
     dbeCodArt.Enabled:=True;
     dbeCodArt.Enabled:=True;
     btn1.Caption:='Ok'
   end
  else
   begin
     dbeCodArt.Enabled:=False;
     cdsArticuloCODARTICULO.AsInteger:=StrToInt(dbeCodArt.Text);
     btn1.Caption:='Cambiar'
   end;
end;

procedure TfrmArticuloUt.btnAccionesClick(Sender: TObject);
begin
  inherited;
  if Sender=btnNuevo then
   begin
    coloreo(False);
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
        btnEliminar.Caption:='Cancelar';
        btnEditar.Enabled:=False;
        btnEliminar.Enabled:=True;
     end
    else
     begin
        cdsArticulo.ApplyUpdates(0);
        btnNuevo.Caption:='Nuevo';
        btnEliminar.Caption:='Eliminar';
        btnEditar.Enabled:=True;
        btnEliminar.Enabled:=True;
        grpArticulo.Enabled:=False;
     end;
   end;
  ///////
  if Sender=btnEliminar then
  begin
    coloreo(False);
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
      if Utilidades.msSi('Seguro que desea eliminar el Articulo?','Borrar Articulo') = true then
      begin
        cdsArticulo.Delete;
        cdsArticulo.ApplyUpdates(0);
        cdsArticulo.Close;
        cdsArticulo.Open;
      end
    end;
    grpArticulo.Enabled:=False;
  end;
  //////
  if sender=btnEditar then
   begin
    cdsArticulo.Edit;
    btnNuevo.Caption:='Guardar';
    btnEliminar.Caption:='Cancelar';
    btnEditar.Enabled:=False;
    coloreo(True);
    grpArticulo.Enabled:=True;
   end;

end;

procedure TfrmArticuloUt.coloreo(SN: Boolean);
   begin
     if SN=True then
      begin
       shp1.Brush.Color:=$009EA4FE;
       dbeDescArt.Color:=$009EA4FE;
       dblUnidadMedida.Color:=$009EA4FE;
       dblTipoIva.Color:=$009EA4FE;
       dblRamo.Color:=$009EA4FE;
       dblProveedor.Color:=$009EA4FE;
       dbedtPRECIOVTA.Color:=$009EA4FE;
       dbedtPRECIOCOMPRA.Color:=$009EA4FE;
       dbedtEXISTENCIA.Color:=$009EA4FE;
       dbedtEXISTENCIA_MIN.Color:=$009EA4FE;
      end
     else
      begin
       shp1.Brush.Color:=clWhite;
        dbeDescArt.Color:=clWhite;
       dblUnidadMedida.Color:=clWhite;
       dblTipoIva.Color:=clWhite;
       dblRamo.Color:=clWhite;
       dblProveedor.Color:=clWhite;
       dbedtPRECIOVTA.Color:=clWhite;
       dbedtPRECIOCOMPRA.Color:=clWhite;
       dbedtEXISTENCIA.Color:=clWhite;
       dbedtEXISTENCIA_MIN.Color:=clWhite;
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
  cdsArticulo.Active:=false;
  qryUnidadMedida.Active:=false;
  qryTipoIva.Active:=false;
  qryRamo.Active:=false;
  qryProveedor.Active:=false;
  qryGrilla.Active:=False;
  Action := caFree;
end;

procedure TfrmArticuloUt.FormShow(Sender: TObject);
begin
  inherited;
  cdsArticulo.Active:=true;
  qryUnidadMedida.Active:=true;
  qryTipoIva.Active:=true;
  qryRamo.Active:=true;
  qryProveedor.Active:=true;
  PageControl1.ActivePageIndex:=0;
  qryGrilla.Active:=True;
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
