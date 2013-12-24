unit frmSociosUt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frmABMCUt, DBGridEhGrouping, FMTBcd, DB, DBClient, Provider, SqlExpr,
  GridsEh, DBGridEh, Buttons, ComCtrls, StdCtrls, ExtCtrls, Mask, DBCtrlsEh,
  DBLookupEh, DBCtrls;

type
  TfrmSocios = class(TfrmBaseABMC)
    qryCabeceraID_PERSONA: TIntegerField;
    cdsCabeceraNRO_SOCIO: TIntegerField;
    cdsCabeceraALIAS_SOCIO: TStringField;
    cdsCabeceraTELEFONO: TStringField;
    cdsCabeceraCELULAR: TStringField;
    cdsCabeceraEMAIL: TStringField;
    qryCabeceraFECHA_REGISTRO: TSQLTimeStampField;
    cdsCabeceraACTIVO: TStringField;
    cdsCabeceraCEDULA: TIntegerField;
    cdsCabeceraRUC: TStringField;
    cdsCabeceraNOMBRE: TStringField;
    cdsCabeceraAPELLIDO: TStringField;
    cdsCabeceraSEXO: TStringField;
    cdsCabeceraFECHA_NAC: TDateField;
    cdsCabeceraCONTACO: TStringField;
    cdsCabeceraDIRECCION_PARTICULAR: TStringField;
    qryCabeceraFOTO_PERSONA: TBlobField;
    qryCabeceraFECHA_REGISTRO_1: TSQLTimeStampField;
    cdsCabeceraACTIVO_1: TStringField;
    cdsCabeceraID_PERSONA: TIntegerField;
    cdsCabeceraNRO_SOCIO2: TIntegerField;
    cdsCabeceraALIAS_SOCIO2: TStringField;
    cdsCabeceraTELEFONO2: TStringField;
    cdsCabeceraCELULAR2: TStringField;
    cdsCabeceraEMAIL2: TStringField;
    cdsCabeceraFECHA_REGISTRO: TSQLTimeStampField;
    cdsCabeceraACTIVO2: TStringField;
    cdsCabeceraCEDULA2: TIntegerField;
    cdsCabeceraRUC2: TStringField;
    cdsCabeceraNOMBRE2: TStringField;
    cdsCabeceraAPELLIDO2: TStringField;
    cdsCabeceraSEXO2: TStringField;
    cdsCabeceraFECHA_NAC2: TDateField;
    cdsCabeceraCONTACO2: TStringField;
    cdsCabeceraDIRECCION_PARTICULAR2: TStringField;
    cdsCabeceraFOTO_PERSONA: TBlobField;
    cdsCabeceraFECHA_REGISTRO_1: TSQLTimeStampField;
    cdsCabeceraACTIVO_12: TStringField;
    btn1: TButton;
    edtIdSocio: TEdit;
    ed1: TLabel;
    edtCedulaSocio: TEdit;
    ed2: TLabel;
    cbbID_PERSONA: TDBLookupComboboxEh;
    cdsDetalleID_PERSONA: TIntegerField;
    cdsDetalleCEDULA: TIntegerField;
    cdsDetalleRUC: TStringField;
    cdsDetalleNOMBRE: TStringField;
    cdsDetalleAPELLIDO: TStringField;
    DBEditEh5: TDBEditEh;
    ed3: TLabel;
    ed5: TLabel;
    DBEditEh6: TDBEditEh;
    cdsCabeceraNOM_APELL: TStringField;
    cdsDetalleNOM_APELL: TStringField;
    DBEditEh7: TDBEditEh;
    ed6: TLabel;
    ed7: TLabel;
    DBEditEh8: TDBEditEh;
    ed8: TLabel;
    dbNroSocio: TDBEdit;
    btn2: TBitBtn;
    dbCedula: TEdit;
    dbNombreApe: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure edtIdSocioChange(Sender: TObject);
    procedure btnMostrarClick(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure cdsDetalleCalcFields(DataSet: TDataSet);
    procedure dsCabeceraStateChange(Sender: TObject);
    procedure btnAcciones(Sender: TObject);
    procedure cdsCabeceraCalcFields(DataSet: TDataSet);
    procedure dsDetalleDataChange(Sender: TObject; Field: TField);
    procedure dbCedulaKeyPress(Sender: TObject; var Key: Char);
    procedure dsCabeceraDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    function ObtenerCondicionWhere :String; override;
    { Public declarations }
  end;

var
  frmSocios: TfrmSocios;

implementation
  uses UtilidadesGlobales, frmPersonaUt;
{$R *.dfm}

procedure TfrmSocios.btn1Click(Sender: TObject);
begin
  inherited;
  CrearFormulario(TfrmPersona,vShowModal);
  if frmPersona.ModalResult=mrOk then
     edtIdSocio.Text:=frmPersona.dbIDPersona.Text;
end;

procedure TfrmSocios.btn2Click(Sender: TObject);
begin
  inherited;
  RemplazarWhere(qryDetalle,'');
  RemplazarWhere(qryCabecera,'');
  ConsultaBD([cdsDetalle,cdsCabecera]);
  edtIdSocio.Text:='';
  edtCedulaSocio.Text:='';
  pnlBuscar.Visible:=False;
end;

procedure TfrmSocios.btnAcciones(Sender: TObject);
begin
 if btnNuevoGrabar.Caption='Guardar' then
  begin
   if dbNroSocio.Text='Generación Automática' then
     cdsCabeceraNRO_SOCIO2.AsInteger:=0;
   cdsCabeceraID_PERSONA.AsInteger:=cdsDetalleID_PERSONA.AsInteger;

   cdsCabeceraCEDULA2.AsInteger:=StrToInt(dbCedula.Text);
   cdsCabeceraNOMBRE2.AsString:=cdsDetalleNOMBRE.AsString;
   cdsCabeceraAPELLIDO2.AsString:=cdsDetalleAPELLIDO.AsString;
  end
 else
  begin

  end;
  inherited;
  if dsCabecera.State=dsInsert then
    dbNroSocio.Text:='Generación Automática';
end;

procedure TfrmSocios.btnMostrarClick(Sender: TObject);
begin
  pnlBuscar.Visible:=False;
  inherited;
  if (Trim(edtIdSocio.Text)<>'') and (Trim(edtCedulaSocio.Text)<>'') then
  RemplazarWhere(qryCabecera,' s.id_persona='+Trim(edtIdSocio.Text)+
  ' and p.cedula='+Trim(edtCedulaSocio.Text)+' ');

  if (Trim(edtIdSocio.Text)<>'') and (Trim(edtCedulaSocio.Text)='') then
  RemplazarWhere(qryCabecera,' s.id_persona='+Trim(edtIdSocio.Text));

  if (Trim(edtIdSocio.Text)='') and (Trim(edtCedulaSocio.Text)<>'') then
  RemplazarWhere(qryCabecera,' P.cedula='+Trim(edtCedulaSocio.Text)+' ');

  ConsultaBD(cdsCabecera);

end;

procedure TfrmSocios.cdsCabeceraCalcFields(DataSet: TDataSet);
begin
  inherited;
  cdsCabeceraNOM_APELL.Value:=
   Trim(cdsCabeceraNOMBRE2.AsString)+', '+Trim(cdsCabeceraAPELLIDO2.AsString);
end;

procedure TfrmSocios.cdsDetalleCalcFields(DataSet: TDataSet);
begin
  inherited;
  cdsDetalleNOM_APELL.Value:=
   Trim(cdsDetalleNOMBRE.AsString)+', '+Trim(cdsDetalleAPELLIDO.AsString);
end;

procedure TfrmSocios.dbCedulaKeyPress(Sender: TObject; var Key: Char);
var book: TBookmark;
begin
  inherited;
  if Key=#13 then
  begin

   if Trim(dbCedula.Text)<>'' then
     RemplazarWhere(qryDetalle,' a.cedula='+StringReplace(Trim(dbCedula.Text),
                    '.','',[rfReplaceAll,rfIgnoreCase])+
                    ' and a.id_persona not in (select socio.id_persona from socio )')
   else
     RemplazarWhere(qryDetalle,' a.id_persona not in (select socio.id_persona from socio )');
   ConsultaBD(cdsDetalle);
   book:=cdsDetalle.Bookmark;
   RemplazarWhere(qryDetalle,' a.id_persona not in (select socio.id_persona from socio )');
   ConsultaBD(cdsDetalle);
   cdsDetalle.Bookmark:=book;
  end;
end;

procedure TfrmSocios.dsCabeceraDataChange(Sender: TObject; Field: TField);
begin
  inherited;
   if dsCabecera.State= dsBrowse then begin
    dbCedula.Text:=cdsCabeceraCEDULA2.AsString;
    dbNombreApe.Text:=cdsCabeceraNOM_APELL.AsString;
  end;
end;

procedure TfrmSocios.dsCabeceraStateChange(Sender: TObject);
begin
  inherited;
  if dsCabecera.State=dsEdit then
   begin
    btnNuevoGrabar.Caption:='Guardar';
    btnEliminar.Caption:='Cancelar';
    btnEditar.Enabled:=False;
   end;

  if dsCabecera.State in [dsEdit,dsInsert] then
   begin
    cdsCabeceraID_PERSONA.AsInteger:=cdsDetalleID_PERSONA.AsInteger;
    cdsCabeceraCEDULA2.AsInteger:=cdsDetalleCEDULA.AsInteger;
    cdsCabeceraAPELLIDO2.AsString:=cdsDetalleAPELLIDO.AsString;
    cdsCabeceraNOMBRE2.AsString:=cdsDetalleNOMBRE.AsString;
   end;



   cbbID_PERSONA.Enabled:=cdsCabecera.State in [dsEdit,dsInsert];
end;

procedure TfrmSocios.dsDetalleDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  dbCedula.Text:= cdsDetalleCEDULA.AsString;
  dbNombreApe.Text:=cdsDetalleNOM_APELL.AsString;
end;

procedure TfrmSocios.edtIdSocioChange(Sender: TObject);
begin
  inherited;
  pnlBuscar.Visible:=True;
end;

procedure TfrmSocios.FormCreate(Sender: TObject);
begin
  inherited;
  ConsultaBD([cdsCabecera,cdsDetalle]);
end;

function TfrmSocios.ObtenerCondicionWhere: String;
begin
   if Trim(edtIdSocio.Text)<>'' then
     RemplazarWhere(qryCabecera,' s.id_persona='+edtIdSocio.Text);
end;

end.
