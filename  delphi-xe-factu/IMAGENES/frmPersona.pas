unit frmPersona;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtDlgs, ExtCtrls, Mask, DBCtrls, DB, IBCustomDataSet,
  IBDatabase, jpeg,pngimage, GIFImg, Provider, DBClient, IBQuery;

type
  TForm3 = class(TForm)
    IBDatabase: TIBDatabase;
    IBTransaction: TIBTransaction;
    DataSource: TDataSource;
    dbeID_PERSONA: TDBEdit;
    dbeNOMBRE: TDBEdit;
    Image1: TImage;
    OpenPictureDialog: TOpenPictureDialog;
    btn1: TButton;
    cds1: TClientDataSet;
    Prov1: TDataSetProvider;
    cds1ID_PERSONA: TIntegerField;
    cds1NOMBRE: TWideStringField;
    cds1FOTO: TBlobField;
    cds1FORMATO_FOTO: TWideStringField;
    dbeFormato_Foto: TDBEdit;
    quer1: TIBQuery;
    cdsquer1ID_PERSONA: TIntegerField;
    tbquer1NOMBRE: TIBStringField;
    quer1FOTO: TBlobField;
    tbquer1FORMATO_FOTO: TIBStringField;
    btn2: TButton;
    dbnvgr1: TDBNavigator;
    qryMaxID: TIBQuery;
    qryMaxIDF_1: TLargeintField;
    shp1: TShape;
    lbl1: TLabel;
    rg1: TRadioGroup;
    procedure btn1Click(Sender: TObject);
    procedure DataSourceDataChange(Sender: TObject; Field: TField);
    procedure btn2Click(Sender: TObject);
    procedure dbnvgr1Click(Sender: TObject; Button: TNavigateBtn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.btn1Click(Sender: TObject);
var
  m, f: TStream;
  mst: TMemoryStream;
  s: string;
  bmp: TBitmap; jpg: TJPEGImage;
begin

 if rg1.ItemIndex =1 then
    begin
      if OpenPictureDialog.Execute then
      begin
        cds1.Edit; //tendria que dar error sin esto
        cds1FOTO.LoadFromFile(OpenPictureDialog.filename);
        s:= AnsiUpperCase(ExtractFileExt(OpenPictureDialog.FileName)); //Siempre en mayusculas
        if s='.JPEG' then s:= '.JPG'; //un caso especial
        cds1FORMATO_FOTO.AsString:= Copy(s,2,3); //elimino el punto
        //cds1.Post;
        btn2.Enabled:=true;
        btn1.Enabled:=false;
      end;
     end
 else if rg1.ItemIndex =0 then
     begin
      if OpenPictureDialog.Execute then
      begin
       try
         jpg:=TJPEGImage.Create;
         jpg.LoadFromFile(OpenPictureDialog.FileName);
         bmp:=TBitmap.Create;
         bmp.Assign(jpg);
         bmp.Width:=Image1.Width;
         bmp.Height:=Image1.Height;
         bmp.Canvas.StretchDraw(bmp.Canvas.Cliprect, jpg);
         jpg.Assign(bmp);
         bmp.Destroy;
         jpg.SaveToFile(ExtractFilePath(ParamStr(0))+'\tempimagen.jpg');
         cds1.Edit; //tendria que dar error sin esto
         cds1FOTO.LoadFromFile(ExtractFilePath(ParamStr(0))+'\tempimagen.jpg');
         cds1FORMATO_FOTO.AsString:='JPG';
        //cds1.Post;
        DeleteFile(ExtractFilePath(ParamStr(0))+'\tempimagen.jpg');
        btn2.Enabled:=true;
        btn1.Enabled:=false;
        except
         BEGIN
          ShowMessage('Para compresion, solo se admiten imagenes del tipo JPG');
          jpg.Destroy;
         END
       end;
      end;
      end
 else
     begin
      ShowMessage('Seleccione formato de guardado');
      rg1.SetFocus;
     end;
 end;

procedure TForm3.btn2Click(Sender: TObject);
begin
 if TRIM(dbeNOMBRE.Text)<>'' then
  BEGIN
    cds1.Post;
    cds1.ApplyUpdates(0);
    btn2.Enabled:=false;
  END
 ELSE
  BEGIN
    ShowMessage('Ingrese alguna descripcion');
    dbeNOMBRE.SetFocus;
  END;
end;

procedure TForm3.DataSourceDataChange(Sender: TObject; Field: TField);
var
  m, f: TStream;
begin
  if cds1FOTO.IsNull then
    Image1.Picture:= nil
  else
  begin
    if cds1FORMATO_FOTO.AsString = 'BMP' then
      Image1.Picture.Graphic:= TBitmap.Create
    else if cds1FORMATO_FOTO.AsString = 'JPG' then
      Image1.Picture.Graphic:= TJpegImage.Create
    else if cds1FORMATO_FOTO.AsString='GIF' then
      Image1.Picture.Graphic:= TGIFImage.Create
    else
      Exit;
    m:= cds1.CreateBlobStream(cds1FOTO, bmRead);
    Image1.Picture.Graphic.LoadFromStream(m);
    m.Free;
  end;
end;

procedure TForm3.dbnvgr1Click(Sender: TObject; Button: TNavigateBtn);
begin
 case Button of
   nbFirst: ;
   nbPrior: ;
   nbNext: ;
   nbLast: ;
   nbInsert:
    begin
      btn1.Enabled:=true;
      qryMaxID.Active:=TRUE;
      dbeID_PERSONA.Text:=qryMaxIDF_1.Text;
      qryMaxID.Active:=FALSE;
      dbeNOMBRE.SetFocus;
    end;
   nbDelete:
    begin
     if application.MessageBox ('Quiere eliminar el Registro??', 'Eliminar', (MB_OKCANCEL + MB_DEFBUTTON2 + MB_ICONWARNING)) = IDOK then
      begin
       cds1.ApplyUpdates(0);
      end
     else
      begin
       cds1.Active:=false;
       cds1.Active:=true;
      end;
    end;
 end;
end;

end.
