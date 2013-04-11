unit frmMarcacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, IBCustomDataSet, IBQuery, IBDatabase, Grids,
  DBGrids, pngimage, JvExControls, JvgButton, ppPrnabl, ppClass, ppCtrls,
  ppBands, ppCache, ppDesignLayer, ppParameter, ppComm, ppRelatv, ppProd,
  ppReport, ppDB, ppDBPipe;

//funcion para is numeric
  function IsNumeric(sBuffer : String) :boolean;
type
  TfrmPrincipal = class(TForm)
    Timer1: TTimer;
    Label4: TLabel;
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    IBQuery1: TIBQuery;
    DataSource1: TDataSource;
    grpHORAACT: TGroupBox;
    lblHora: TLabel;
    grpeVENTOS: TGroupBox;
    lstEventos: TListBox;
    grpUSUARIOS: TGroupBox;
    txtNombre: TEdit;
    txtCodigo: TEdit;
    img2: TImage;
    TrayIcon1: TTrayIcon;
    rptReporte: TppReport;
    ppParameterList1: TppParameterList;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    btnReporte: TButton;
    titulo: TppParameter;
    nombre: TppParameter;
    ppDBPipeline1: TppDBPipeline;
    IBQuery2: TIBQuery;
    DataSource2: TDataSource;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppDBText3: TppDBText;
    ppLabel1: TppLabel;
    ppDBText5: TppDBText;
    ppLabel4: TppLabel;
    ppDBText4: TppDBText;
    plbl1: TppLabel;
    ppLabel5: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    btnInsertaReg: TButton;

    procedure llenagrilla(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure lstEventosKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure txtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure btnReporteClick(Sender: TObject);
    procedure btnInsertaRegClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;
  evento: string;
//uso de archivos de texto
  Archivotxt: TextFile;
  sArchivo: string;
  sLinea: String;

//PARA INSERTAR
  CODUSER: Integer;
  CODEVENTO: Integer;

implementation
//uso del 2ndo form
uses frmmodifica;
{$R *.dfm}

procedure TfrmPrincipal.llenaGrilla(Sender: TObject);
//Permite la carga de la grilla de opciones para el usuario
//que quiere registrar un evento
begin


IF NOT isnumeric(txtcodigo.Text) THEN

  BEGIN
   ShowMessage('INGRESAR CODIGO NUMERICO!!!');
   txtcodigo.SetFocus;
   txtNombre.Text:='';
          lstEventos.Clear;
  END
 ELSE
  BEGIN
   if txtCodigo.Text='' then

       begin
        ShowMessage('INGRESAR CODIGO!!!');
        txtcodigo.SetFocus;
        txtNombre.Text:='';
          lstEventos.Clear;
       end
   else
     begin
            GRPEVENTOS.Visible:=TRUE;
            BTNREPORTE.Visible:=TRUE;
            BTNINSERTAREG.Visible:=TRUE;
            with ibquery1 do
               BEGIN
                  SQL.Clear;
                  //Añado la consulta al query
                  SQL.Add('SELECT * FROM USUARIO WHERE CODIGOUSUARIO = :codigouser');
                  ParamByName('codigouser').asinteger := StrToInt(Trim(txtCodigo.Text));
                  //La ejecuto
                  Open;
                  First;
                  if FieldValues['CODIGOUSUARIO']=null then
                      begin
                          showmessage('USUARIO NO REGISTRADO!!!');
                          txtcodigo.Text:='';
                          txtcodigo.SetFocus;
                      end
                  else
                      begin
                          CODUSER := StrToInt( FieldValues['CODIGOUSUARIO']);
                          txtnombre.Text:=UpperCase((FieldValues['NOMBREUSUARIO'])+' '+(FieldValues['APELLIDOUAURIO']));
                          lstEventos.Clear;
                          LSTEVENTOS.SETFOCUS;
                          //ING registro en base de datos   0
                          lstEventos.Items.Add('INGRESO');
                          //EGA registro en base de datos   1
                          lstEventos.Items.Add('EGRESO ALMUERZO');
                          //INA registro en base de datos   2
                          lstEventos.Items.Add('INGRESO ALMUERZO');
                          //EGR registro en base de datos   3
                          lstEventos.Items.Add('EGRESO');
                          //TAE registro en base de datos   4
                          lstEventos.Items.Add('TAREA EXTERNA');
                          //RTE registro en base de datos   5
                          lstEventos.Items.Add('RETORNO TAREA EXTERNA');
                      end;
               END;
           end;
  END;
end;
Function IsNumeric(sBuffer : String) :boolean;
var
i : Integer;
    begin
          if sBuffer = '' then begin
          Result := False;
          exit;
          end;

          Result := True;

          for i:=1 to Length(sBuffer) do begin
          if (NOT (sBuffer[i] in ['0'..'9'])) and (sBuffer[i] <> '.') then
          begin
          Result := False;
          exit;
          end;
          end;

    end;

procedure TfrmPrincipal.btnInsertaRegClick(Sender: TObject);
begin
      frmModificacion.showmodal;
end;

procedure TfrmPrincipal.btnReporteClick(Sender: TObject);
begin
    rptReporte.Parameters['titulo'].AsString := 'PATRIA SA DE SEGUROS';
    rptReporte.Print;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     IBQUERY1.Close;
end;
procedure TfrmPrincipal.lstEventosKeyPress(Sender: TObject; var Key: Char);
begin
//Evento Key press ENTER para registrar el evento y mosrarlo
if key =#27 then
     begin
             txtcodigo.Text:='';
             txtcodigo.SetFocus;
             txtNombre.Text:='';
             lstEventos.Clear;
             ShowMessage('NO REGISTRO NINGUN EVENTO!!!');
     end
else
    begin
      if lstEventos.ItemIndex=-1 then
            begin
                ShowMessage('SELECCIONE UN EVENTO!!!');

            end
      else
            begin
                 if key =#13 then
                  begin
                     //PARA INSERTAR EVENTOS
                   CODEVENTO := lstEventos.ItemIndex;
                   with ibquery1 do
                    begin
                      SQL.Clear;
                      SQL.Add( 'execute PROCEDURE insdetallevento ');
                      SQL.Add('(:CODUSER1,:CODEVENTO1,:FECHAEVENTO1,:MODIFICA)');
                      ParamByName('CODUSER1').asinteger := CODUSER;
                      parambyname('CODEVENTO1').asinteger := CODEVENTO;
                      parambyname('FECHAEVENTO1').asdatetime := now;
                      parambyname('MODIFICA').AsString := 'N';
                      try
                        Prepare;
                        ExecSQL;
                        Transaction.Commit;
                        /////////////
                        evento:=lstEventos.Items[lstEventos.ItemIndex];
                        //ShowMessage(evento+' A LAS: '+DateTimeToStr(now()));
                        Application.MessageBox( PChar(evento+' A LAS: '+DateTimeToStr(now())), PChar(txtNombre.Text), mb_iconinformation );
                        GRPEVENTOS.Visible:=false;
                        BTNREPORTE.Visible:=false;
                        BTNINSERTAREG.Visible:=false;
                        /////////////
                      except
                        on E: Exception do
                        begin
                             Application.MessageBox( PChar( UPPERCASE(E.Message) ), 'ERROR MARCACION', MB_ICONSTOP );
                             GRPEVENTOS.Visible:=false;


                        //  Application.MessageBox( 'YA HA MARCADO ESTA OPCION EL DIA DE HOY', 'ERROR', MB_ICONSTOP );
                          Transaction.Rollback;
                        end;
                      end;
                    end;
                    txtCodigo.Text:='';
                    txtNombre.Text:='';
                    lstEventos.Clear;
                    txtcodigo.SetFocus;
                  end;
            end;
    end;
end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
begin
       lblHora.Caption:=DateTimeToStr (now());
       {StrToDate :Convierte de texto a Data
        STrToTime :Convierte de texto a Hora
        StrToDateTime :Convierte de texto a Data y Hora}
end;


procedure TfrmPrincipal.txtCodigoKeyPress(Sender: TObject; var Key: Char);
begin
//Al presionar enter en el control txtcodigo actua como tabulador
  if key =#13 then
    begin
       Keybd_event(VK_TAB, 0, 0, 0);
    end;
end;

end.


