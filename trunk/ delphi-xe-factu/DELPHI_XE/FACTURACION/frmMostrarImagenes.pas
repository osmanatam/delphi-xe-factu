{******************************************************************

                       JEDI-VCL Demo

 Copyright (C) 2002 Project JEDI

 Original author:

 Contributor(s):

 You may retrieve the latest version of this file at the JEDI-JVCL
 home page, located at http://jvcl.delphi-jedi.org

 The contents of this file are used with permission, subject to
 the Mozilla Public License Version 1.1 (the "License"); you may
 not use this file except in compliance with the License. You may
 obtain a copy of the License at
 http://www.mozilla.org/MPL/MPL-1_1Final.html

 Software distributed under the License is distributed on an
 "AS IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or
 implied. See the License for the specific language governing
 rights and limitations under the License.

******************************************************************}

unit frmMostrarImagenes;

{$I jvcl.inc}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvDBImage, ExtCtrls, DBCtrls, Grids, DBGrids, DB, DBClient,
  jpeg, JvGIF, JvPCX, JvAni, ExtDlgs, StdCtrls, JvExDBGrids, JvDBGrid, JvJVCLUtils,
  IBCustomDataSet, IBQuery;

type
  TfrmImagenes = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TJvDBGrid;
    btnAdd: TButton;
    OpenPictureDialog1: TOpenPictureDialog;
    btnClear: TButton;
    chkTransparent: TCheckBox;
    chkStretch: TCheckBox;
    chkProportional: TCheckBox;
    chkAutoDisplay: TCheckBox;
    chkAutoSize: TCheckBox;
    ScrollBox1: TScrollBox;
    JvDBImage1: TJvDBImage;
    btn1: TButton;
    qry1: TIBQuery;
    qry1IMAGEN: TBlobField;
    ibstrngfldqry1FILENAME: TIBStringField;
    ibstrngfldqry1FILETYPE: TIBStringField;
    procedure FormCreate(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure chkTransparentClick(Sender: TObject);
    procedure chkStretchClick(Sender: TObject);
    procedure chkProportionalClick(Sender: TObject);
    procedure chkAutoDisplayClick(Sender: TObject);
    procedure chkAutoSizeClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    procedure AddImage(const Filename: string);
  end;

var
  frmImagenes: TfrmImagenes;

implementation
  uses DataModule;
{$R *.dfm}

procedure TfrmImagenes.FormCreate(Sender: TObject);
begin
 qry1.Open;

 chkProportional.Checked := JvDBImage1.Proportional;
  chkStretch.Checked := JvDBImage1.Stretch;
  chkTransparent.Checked := JvDBImage1.Transparent;
  chkAutoDisplay.Checked := JvDBImage1.AutoDisplay;
  chkAutoSize.Checked := JvDBImage1.AutoSize;
end;

procedure TfrmImagenes.AddImage(const Filename:string);
begin
  qry1.Append;
  JvDBImage1.Picture.LoadFromFile(Filename);
  //qry1IMAGEN.LoadFromFile(Filename);
  //qry1.FieldByName('Filename').AsString := ExtractFileName(Filename);
  //qry1.FieldByName('FileType').AsString := AnsiUpperCase(Copy(ExtractFileExt(Filename), 2, MaxInt));
  //qry1.Post;
end;

procedure TfrmImagenes.btn1Click(Sender: TObject);
var i:integer;
begin
  with OpenPictureDialog1 do
  if Execute then
  begin

    try
      for i := 0 to Files.Count - 1 do
        AddImage(Files[i]);
    finally

    end;
  end;
end;

procedure TfrmImagenes.btnAddClick(Sender: TObject);
var i:integer;
begin
  with OpenPictureDialog1 do
  if Execute then
  begin
    // don't disable the db controls! the actual loading of the image into
    // the control is what stores it in the table!
      //qry1.DisableControls;
    try
      //for i := 0 to Files.Count - 1 do
        AddImage(Files[0]);
    finally
      //qry1.EnableControls;
    end;
  end;
end;

procedure TfrmImagenes.btnClearClick(Sender: TObject);
begin
  while not qry1.EOF do
    qry1.Delete;
end;

procedure TfrmImagenes.chkTransparentClick(Sender: TObject);
begin
  JvDBImage1.Transparent := chkTransparent.Checked;
end;

procedure TfrmImagenes.chkStretchClick(Sender: TObject);
begin
  JvDBImage1.Stretch := chkStretch.Checked;
end;

procedure TfrmImagenes.chkProportionalClick(Sender: TObject);
begin
  JvDBImage1.Proportional := chkProportional.Checked;
end;

procedure TfrmImagenes.chkAutoDisplayClick(Sender: TObject);
begin
  JvDBImage1.AutoDisplay := chkAutoDisplay.Checked;
end;

procedure TfrmImagenes.chkAutoSizeClick(Sender: TObject);
begin
  JvDBImage1.AutoSize := chkAutoSize.Checked;
  if not JvDBImage1.AutoSize then
    JvDBImage1.Align := alClient
  else
    JvDBImage1.Align := alNone;
end;

initialization
  // we register the JVCL image support components so
  // we can store them in the database:
  RegisterGraphicSignature([$0A], 0, TJvPcx);
  RegisterGraphicSignature('ACON', 8, TJvAni);
  RegisterGraphicSignature('GIF', 0, TJvGIFImage);

end.
