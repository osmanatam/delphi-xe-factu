unit frmVerImagen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, ExtCtrls, DBCtrls, StdCtrls, ExtDlgs,
  ImgList, JvDBImage, Mask;

type
  TForm2 = class(TForm)
    dbnvgr1: TDBNavigator;
    qry1: TIBQuery;
    ds1: TDataSource;
    cdsqry1ID: TIntegerField;
    qry1IMAGEN: TBlobField;
    Image1: TImage;
    btn1: TButton;
    dbeID: TDBEdit;
    qry2: TIBQuery;
    cdsqry2ID: TIntegerField;
    qry2IMAGEN: TBlobField;
    procedure btn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation
 uses frmImagen, jpeg,pngimage, GIFImg;
{$R *.dfm}

procedure TForm2.btn1Click(Sender: TObject);
  Var
  M  : TStream;
  FirstBytes: AnsiString;
begin
    qry2.Active:=false;
    qry2.SQL.Clear;
    qry2.SQL.Add('select id,imagen from tabla where id=:cod');
    qry2.ParamByName('cod').AsInteger:=StrToInt(dbeID.Text);
    qry2.Active:=True;
     if qry2IMAGEN.BlobSize > 0 then
      begin
         m := TStream.Create;

         m := qry2.CreateBlobStream(qry2.FieldByName('IMAGEN'), bmRead);
          if m <> nil then
           begin
                SetLength(FirstBytes, 8);
                m.Read(FirstBytes[1], 8);
                if Copy(FirstBytes, 1, 2) = 'BM' then
                  Image1.Picture.Graphic := TBitmap.Create
               else
               if FirstBytes = #137'PNG'#13#10#26#10 then
                  //Image1.Picture.Graphic := TPngImage.Create
               else
               if Copy(FirstBytes, 1, 3) = 'GIF' then
                  Image1.Picture.Graphic := TGIFImage.Create
               else
               if Copy(FirstBytes, 1, 2) = #$FF#$D8 then
                  Image1.Picture.Graphic := TJPEGImage.Create;
               try
                 m.Seek(0,0);
                 Image1.Picture.Graphic.LoadFromStream(m);
               finally
                 m.Free;
               end;
           end;
       end;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 qry1.Active:=false;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
 qry1.Active:=true;
end;

end.
