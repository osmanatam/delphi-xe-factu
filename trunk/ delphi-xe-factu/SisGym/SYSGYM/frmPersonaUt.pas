unit frmPersonaUt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frmBaseUt, FMTBcd, StdCtrls, DBCtrls, Buttons, DBCtrlsEh, Mask, DB,
  DBClient, Provider, SqlExpr, ExtCtrls;

type
  TfrmPersona = class(TfrmBase)
    pnl1: TPanel;
    pnl2: TPanel;
    qryPersona: TSQLQuery;
    pvdPersona: TDataSetProvider;
    cdsPersona: TClientDataSet;
    dsPersona: TDataSource;
    qryPersonaID_PERSONA: TIntegerField;
    cdsPersonaCEDULA: TIntegerField;
    cdsPersonaRUC: TStringField;
    cdsPersonaNOMBRE: TStringField;
    cdsPersonaAPELLIDO: TStringField;
    cdsPersonaSEXO: TStringField;
    cdsPersonaFECHA_NAC: TDateField;
    cdsPersonaCONTACO: TStringField;
    cdsPersonaDIRECCION_PARTICULAR: TStringField;
    qryPersonaFOTO_PERSONA: TBlobField;
    qryPersonaFECHA_REGISTRO: TSQLTimeStampField;
    cdsPersonaACTIVO: TStringField;
    cdsPersonaID_PERSONA: TIntegerField;
    cdsPersonaCEDULA2: TIntegerField;
    cdsPersonaRUC2: TStringField;
    cdsPersonaNOMBRE2: TStringField;
    cdsPersonaAPELLIDO2: TStringField;
    cdsPersonaSEXO2: TStringField;
    cdsPersonaFECHA_NAC2: TDateField;
    cdsPersonaCONTACO2: TStringField;
    cdsPersonaDIRECCION_PARTICULAR2: TStringField;
    cdsPersonaFOTO_PERSONA: TBlobField;
    cdsPersonaFECHA_REGISTRO: TSQLTimeStampField;
    cdsPersonaACTIVO2: TStringField;
    dbIDPersona: TDBEdit;
    dbCedula: TDBEdit;
    dbRuc: TDBEdit;
    btnPrimero: TSpeedButton;
    btnAnterior: TSpeedButton;
    btnSiguiente: TSpeedButton;
    btnUltimo: TSpeedButton;
    dbNombre: TDBEdit;
    dbApellido: TDBEdit;
    dbmmoDireccionPart: TDBMemo;
    btnNuevoGrabar: TButton;
    btnEditar: TButton;
    btnEliminaCancela: TButton;
    ed1: TLabel;
    ed2: TLabel;
    ed3: TLabel;
    ed4: TLabel;
    ed5: TLabel;
    dbrgrpSEXO: TDBRadioGroup;
    btnLimpiar: TSpeedButton;
    ed6: TLabel;
    btnOk: TSpeedButton;
    btnCanel: TSpeedButton;
    procedure btnAcciones(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnMoverRegistros(Sender: TObject);
    procedure dsPersonaStateChange(Sender: TObject);
    procedure btnLimpiarClick(Sender: TObject);
    procedure ResultModal(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPersona: TfrmPersona;

implementation
  uses dmIniDatosUt,UtilidadesGlobales;
{$R *.dfm}

procedure TfrmPersona.btnAcciones(Sender: TObject);
begin
  inherited;
 if Sender=btnNuevoGrabar then
   begin

    if btnNuevoGrabar.Caption='Nuevo' then
     begin
        if cdsPersona.State=dsBrowse then
         cdsPersona.Append
        else
         cdsPersona.Insert;
        cdsPersonaSEXO2.AsString:='M';
        dbIDPersona.Text:='Gneración Automática';
        btnNuevoGrabar.Caption:='Guardar';
        btnEliminaCancela.Caption:='Cancelar';
        btnEditar.Enabled:=False;
        btnEliminaCancela.Enabled:=True;
     end
    else
     begin
        if dbIDPersona.Text='Gneración Automática' then
           cdsPersonaID_PERSONA.AsInteger:=0;
        if not GrabarEnBD(cdsPersona) then
         begin
          msgError('Ocurrio algun imprevisto, verifique','Error en Grabar');
          Exit;
         end;
        btnNuevoGrabar.Caption:='Nuevo';
        btnEliminaCancela.Caption:='Eliminar';
        btnEditar.Enabled:=True;
        btnEliminaCancela.Enabled:=True;
     end;
   end;
  ///////
  if Sender=btnEliminaCancela then
  begin
    if btnEliminaCancela.Caption='Cancelar' then
     begin
      cdsPersona.Cancel;
      btnEditar.Enabled:=True;
      btnNuevoGrabar.Caption:='Nuevo';
      btnEliminaCancela.Caption:='Eliminar';
     end
    else
    begin
      if UtilidadesGlobales.msgSi('Seguro que desea eliminar el Articulo?','Borrar Articulo') = true then
      begin
       if BorrarEnBD(cdsPersona) then
         cdsPersona.Refresh;
      end
    end;
  end;
  //////
  if sender=btnEditar then
   begin
    cdsPersona.Edit;
   end;
end;

procedure TfrmPersona.btnLimpiarClick(Sender: TObject);
begin
  inherited;
  dbCedula.Text:=''; dbRuc.Text:=''; dbNombre.Text:=''; dbApellido.Text:='';
  dbmmoDireccionPart.Text:='';
end;

procedure TfrmPersona.btnMoverRegistros(Sender: TObject);
begin
  inherited;
   MoviendoRegistro(cdsPersona,Sender,[btnPrimero,btnAnterior,btnSiguiente,btnUltimo]);
end;

procedure TfrmPersona.ResultModal(Sender: TObject);
begin
  inherited;
   if Sender = btnOk then
    ModalResult:= mrOk
   else
    ModalResult:= mrCancel;
   CloseModal;
end;

procedure TfrmPersona.dsPersonaStateChange(Sender: TObject);
begin
  inherited;
  if dsPersona.State=dsEdit then
   begin
    btnNuevoGrabar.Caption:='Guardar';
    btnEliminaCancela.Caption:='Cancelar';
    btnEditar.Enabled:=False;
   end;
  btnLimpiar.Enabled:=dsPersona.State=dsInsert;
end;

procedure TfrmPersona.FormCreate(Sender: TObject);
begin
  inherited;
  ConsultaBD(cdsPersona);
  dmIniDatos.ilImagenes.GetBitmap(9,btnOk.Glyph);
  dmIniDatos.ilImagenes.GetBitmap(2,btnCanel.Glyph);
  btnOk.Glyph
end;

end.
