unit frmModifica;

interface


uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdTime, IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl,
  IWCompEdit, IWCompTimeEdit, StdCtrls, Mask, DBCtrlsEh, JvExMask, JvSpin, DB,
  IBDatabase, IBCustomDataSet, IBQuery, dblookup, DBCtrls, ExtCtrls, DBGridEh,
  DBLookupEh;

type
  TfrmModificacion = class(TForm)
    dtpEvento: TDateTimePicker;
    ibqry1: TIBQuery;
    ds1: TDataSource;
    rg1: TRadioGroup;
    rbiNGRESO: TRadioButton;
    rbeGRESOaLM: TRadioButton;
    rbINGRESOALM: TRadioButton;
    rbEGRESO: TRadioButton;
    rbTAREAEXT: TRadioButton;
    rbRETORNOTAREAEX: TRadioButton;
    btnAceptar: TButton;
    ibqry1CODIGOUSUARIO: TIntegerField;
    ibqry1NOMBRE: TIBStringField;
    cbxNOMBRE: TDBLookupComboboxEh;
    procedure btnAceptarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmModificacion: TfrmModificacion;
   CODEVENTO1: Integer;
   horafecha: string;
   horafecha1: string;
implementation
        uses frmmarcacion;
{$R *.dfm}

procedure TfrmModificacion.btnAceptarClick(Sender: TObject);
begin
        IF RBINGRESO.Checked=TRUE THEN
                CODEVENTO1:=0;
        IF RBEGRESOALM.Checked=TRUE THEN
                CODEVENTO1:=1;
         IF RBINGRESOALM.Checked=TRUE THEN
                CODEVENTO1:=2;
        IF RBEGRESO.Checked=TRUE THEN
                CODEVENTO1:=3;
        IF RBTAREAEXT.Checked=TRUE THEN
                CODEVENTO1:=4;
        IF RBRETORNOTAREAEX.Checked=TRUE THEN
                CODEVENTO1:=5;

        horafecha:=  DatetimeToStr(dtpEvento.DateTime);

          with ibqry1 do
                    begin
                      SQL.Clear;
                      SQL.Add( 'execute PROCEDURE insdetallevento ');
                      SQL.Add('(:CODUSER1,:CODEVENTO1,:FECHAEVENTO1,:MODIFICA)');
                      ParamByName('CODUSER1').asinteger := STRTOINT(cbxNOMBRE.KeyValue);
                      parambyname('CODEVENTO1').asinteger := CODEVENTO1;
                      parambyname('FECHAEVENTO1').asdatetime := StrToDateTime(HORAFECHA);
                      parambyname('MODIFICA').AsString := 'S';
                      try
                        Prepare;
                        ExecSQL;
                        Transaction.Commit;
                        ShowMessage('OK');
                      except
                        on E: Exception do
                        begin
                          Application.MessageBox( PChar( UPPERCASE(E.Message) ), 'ERROR MARCACION', MB_ICONSTOP );
                          Transaction.Rollback;
                        end;
                      end;
                    end;
end;

procedure TfrmModificacion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ibqry1.Close;
end;

procedure TfrmModificacion.FormShow(Sender: TObject);
begin
 ibqry1.Open;

 dtpEvento.DateTime := now();
end;

end.
