unit frmLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, IBCustomDataSet, IBQuery, jpeg, ExtCtrls;

type
  TFLogin = class(TForm)
    dsLogin: TDataSource;
    qryLogin: TIBQuery;
    grp1: TGroupBox;
    lbl1: TLabel;
    edtEUsuario: TEdit;
    edtEClave: TEdit;
    lbl2: TLabel;
    pnl1: TPanel;
    btnBtnOk: TButton;
    btnBtnCancel: TButton;
    img1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure btnBtnOkClick(Sender: TObject);
    procedure btnBtnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    LoginOK : boolean;
  end;

var
  FLogin: TFLogin;
  Cuenta : integer;
  Usuario, Nombre : String;

    
implementation

uses DataModule, Utilidades, frmPrincipalMain;

{$R *.dfm}

procedure TFLogin.FormCreate(Sender: TObject);
begin
   Cuenta := 0;
   Usuario := '';
   Nombre := '';
   //Se actualiza el horario de la PC acorde al servidor
   Utilidades.HoraDelServidor;
end;

procedure TFLogin.btnBtnOkClick(Sender: TObject);
begin
   LoginOK := False;
   qryLogin.SQL.Clear;
   qryLogin.SQL.Add('SELECT CodUser, Nombreuser, Clave  FROM Usuario where nombreuser=:nom');
   qryLogin.ParamByName('nom').asstring:= trim(edtEUsuario.Text);
   qryLogin.Open;
   qryLogin.First;
   If qryLogin.RecordCount < 1 then
    Begin
       Cuenta := Cuenta + 1;
       MessageDlg('Usuario no encontrado',mtError, [mbOK], 0);
       edtEUsuario.Text := '';
       edtEClave.Text := '';
       qryLogin.Active := False;
       If Cuenta = 3 then
         begin
           MessageDlg('3 intentos erroneos!!! bye',mtError, [mbOK], 0);
           Close;
         end;
    end
   else
       If trim(qryLogin.FieldValues['CLAVE']) = trim(edtEClave.Text) then
        Begin
           LoginOk := True;
           Nombre := TRIM(qryLogin.FieldValues['NOMBREUSER']);
           qryLogin.Active := False;
           try
           FLogin.Visible:= False;
           FLogin.Close;
        finally
           //frmMain.Free;
           end;
           //Close;
        end
     else
         Begin
           Cuenta := Cuenta + 1;
           MessageDlg('Clave Inválida',mtError, [mbOK], 0);
           edtEClave.Text := '';
           qryLogin.Active := False;
           If Cuenta = 3 then Close;
         end;

end;

procedure TFLogin.btnBtnCancelClick(Sender: TObject);
begin
   LoginOK :=False;
   Application.Terminate;
   Exit;
end;

end.
