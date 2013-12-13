unit frmEstudiosCorporeosUt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frmBaseUt, ComCtrls, ExtCtrls, StdCtrls;

type
  TfrmEstudiosCorporeos = class(TfrmBase)
    pnl1: TPanel;
    pgc1: TPageControl;
    tsContexturaCorporal: TTabSheet;
    edtTallaAltura: TEdit;
    edtCincunfMunheca: TEdit;
    ed1: TLabel;
    ed2: TLabel;
    rgSexo: TRadioGroup;
    btnCalcularContextura: TButton;
    edtResContexturaValor: TEdit;
    edtResContextura: TEdit;
    pnl2: TPanel;
    imgHP: TImage;
    imgMM: TImage;
    imgHM: TImage;
    imgMP: TImage;
    imgGH: TImage;
    imgGM: TImage;
    pnl3: TPanel;
    procedure btnCalcularContexturaClick(Sender: TObject);
    procedure edtTallaAlturaKeyPress(Sender: TObject; var Key: Char);
    procedure edtCincunfMunhecaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    Xpos, Ypos: integer;
    { Public declarations }
  end;

var
  frmEstudiosCorporeos: TfrmEstudiosCorporeos;

implementation

{$R *.dfm}

procedure TfrmEstudiosCorporeos.btnCalcularContexturaClick(Sender: TObject);
 var resul: Double;
  procedure desHabilitaImg;
   begin
     imgGH.Visible:=false;
     imgGM.Visible:=false;
     imgMM.Visible:=false;
     imgMP.Visible:=false;
     imgMP.Visible:=false;
     imgHP.Visible:=false;
   end;
begin
  inherited;
  Xpos := (Self{SDIAppForm}.Width Div 2) + Self{SDIAppForm}.Left - 120;
  Ypos := (Self{SDIAppForm}.Height Div 2) + Self{SDIAppForm}.Top - 50;
  if Trim(edtTallaAltura.Text)='' then
   begin
    MessageDlgPos('Complete el dato de Talla', mtWarning, [mbOK], 0, Xpos, Ypos);
    edtTallaAltura.SetFocus;
    Exit;
   end;
  if Trim(edtCincunfMunheca.Text)='' then
   begin
    MessageDlgPos('Cargar circunferencia de muñeca para el cálculo', mtWarning, [mbOK], 0, Xpos, Ypos);
    edtCincunfMunheca.SetFocus;
    Exit;
   end;

  resul:= (StrToFloat(edtTallaAltura.Text) / StrToFloat(edtCincunfMunheca.Text));
  edtResContextura.Text:= FloatToStr(resul);
  desHabilitaImg;
  if ((resul>10.4) and (rgSexo.ItemIndex=0)) or
     ((resul>11.0)and (rgSexo.ItemIndex=1)) then
   begin
    edtResContexturaValor.Text:='Persona de Contextura Pequeña';
    imgMP.Visible:=rgSexo.ItemIndex=1;
    imgHP.Visible:=rgSexo.ItemIndex=0;

   end
  else if ((resul<=10.4) and (resul>=9.6) and (rgSexo.ItemIndex=0)) or
          ((resul<=11.0) and (resul>=10.1) and (rgSexo.ItemIndex=1)) then
   begin
    edtResContexturaValor.Text:='Persona de Contextura Mediana';
    imgMM.Visible:=rgSexo.ItemIndex=1;
    imgHM.Visible:=rgSexo.ItemIndex=0;
   end
  else if ((resul<9.6) and (rgSexo.ItemIndex=0)) or
          ((resul<10.1)and (rgSexo.ItemIndex=1)) then
   begin
    edtResContexturaValor.Text:='Persona de Contextura Grande';
    imgGH.Visible:=rgSexo.ItemIndex=0;
    imgGM.Visible:=rgSexo.ItemIndex=1;
   end;

end;

procedure TfrmEstudiosCorporeos.edtCincunfMunhecaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key=#13 then
   rgSexo.SetFocus;
end;

procedure TfrmEstudiosCorporeos.edtTallaAlturaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key=#13 then
   edtCincunfMunheca.SetFocus;
end;

end.
