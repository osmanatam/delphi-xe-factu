unit frmImagen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, FMTBcd, DB, IBDatabase, SqlExpr, IBCustomDataSet,
  IBStoredProc, jpeg, IBQuery, Provider, DBClient, ExtDlgs, IBTable;

type
  TForm1 = class(TForm)
    Image: TImage;
    btn1: TButton;
    OpenDialog: TOpenDialog;
    bd1: TIBDatabase;
    sp1: TIBStoredProc;
    IBTransaction1: TIBTransaction;
    Edit1: TEdit;
    btn2: TButton;
    qry1: TIBQuery;
    qry1F_1: TLargeintField;
    btn3: TButton;
    query: TIBQuery;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn3Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
   uses frmverimagen, pngimage, GIFImg;
{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
var
  S: TMemoryStream;
  fs : TFileStream;
begin
  if OpenDialog.Execute then
  begin
    Image.Picture.LoadFromFile(OpenDialog.FileName);
    S := TMemoryStream.Create;
    try
      Image.Picture.Graphic.SaveToStream(S);
      sp1.Params[1].LoadFromFile(OpenDialog.FileName, ftBlob);
      //sp1.Params[1].LoadFromStream(S, ftBlob);
      sp1.Params[0].AsInteger := strToInt(Edit1.Text);
      sp1.ExecProc;
    finally
      S.Free;
    end;

  end;
  qry1.Active:=true;
  Edit1.Text:=qry1F_1.Text;
  qry1.Active:=false;
end;
procedure TForm1.btn2Click(Sender: TObject);
begin
     Form2.Show;
end;

procedure TForm1.btn3Click(Sender: TObject);
begin
   if OpenDialog.Execute then
  begin
    Image.Picture.LoadFromFile(OpenDialog.FileName);


  end;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  qry1.Active:=true;
  Edit1.Text:=qry1F_1.Text;
  qry1.Active:=false;
end;

end.
