unit frmPrincipalMain;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, Menus,
  StdCtrls, Dialogs, Buttons, Messages, ExtCtrls, ComCtrls, StdActns,
  ActnList, ToolWin, ImgList, dsTaskBar, DSCommonServer, DSTCPServerTransport ;

type
  TfrmMain = class(TForm)
    mnuMainMenu: TMainMenu;
    File1: TMenuItem;
    nmuVentanasAbiertas: TMenuItem;
    Help1: TMenuItem;
    N1: TMenuItem;
    HelpAboutItem: TMenuItem;
    Edit1: TMenuItem;
    mnuArticulo: TMenuItem;
    mnuUnidadMedida: TMenuItem;
    mnuSecciones: TMenuItem;
    StatusBar: TStatusBar;
    mnuMantenerAgencia: TMenuItem;
    mnuConsultaAgencia: TMenuItem;
    mnuInventario: TMenuItem;
    N2: TMenuItem;
    mnuAperturaInventario: TMenuItem;
    mnuCierreInventario: TMenuItem;
    mnuConsultaInventario: TMenuItem;
    Ventas1: TMenuItem;
    VentasalMostrador1: TMenuItem;
    Facturacion1: TMenuItem;
    N3: TMenuItem;
    Pedido1: TMenuItem;
    N4: TMenuItem;
    Presupuestos1: TMenuItem;
    Proveedores1: TMenuItem;
    Facturasdecompra1: TMenuItem;
    RecepciondeMercaderia1: TMenuItem;
    esoreria1: TMenuItem;
    CobrosdeFactura1: TMenuItem;
    Pagos1: TMenuItem;
    PagosVarios1: TMenuItem;
    PagosdeCompra1: TMenuItem;
    N5: TMenuItem;
    CajaDiaria1: TMenuItem;
    LibroDiario1: TMenuItem;
    Reportes1: TMenuItem;
    ablasMenores1: TMenuItem;
    Impuestos1: TMenuItem;
    Pais1: TMenuItem;
    Ciudad1: TMenuItem;
    Bancos1: TMenuItem;
    Cajeros1: TMenuItem;
    Cobradores1: TMenuItem;
    Reportes2: TMenuItem;
    PedidoPendientes1: TMenuItem;
    FacturasAnuladas1: TMenuItem;
    ImageList1: TImageList;
    dsTaskBar1: TdsTaskBar;
    mnuClientes: TMenuItem;
    Mantenimiento1: TMenuItem;
    ConsultaCliente1: TMenuItem;
    LimitesdeCredito1: TMenuItem;
    ListaNegra1: TMenuItem;
    Hola1: TMenuItem;
    mnuProveedores: TMenuItem;
    procedure mnuMantenerAgenciaClick(Sender: TObject);
    procedure AlCerrar( Sender: TObject; var Action: TCloseAction );
    procedure HelpAboutItemClick(Sender: TObject);
    procedure mnuArticuloClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure dsTaskBar1AddButton(Sender: TObject; Button: TTaskBarButton);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mnuProveedoresClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses Utilidades, about, frmArticulo, frmAgencia, frmLogin, frmProveedorUt;




procedure TfrmMain.dsTaskBar1AddButton(Sender: TObject; Button: TTaskBarButton);
begin
  Button.Glyph := nil;
  Button.Hint := Button.Caption;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: integer;
begin
  with Self do//Sale de todos los prg abiertos
      for I:= MDIChildCount-1 downto 0 do
          MDIChildren[I].Close;
    Action := caFree;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
   frmMain.Visible:=False;
   FLogin:=TFLogin.Create(self);
   FLogin.ShowModal;
   if FLogin.LoginOK then
       frmMain.Visible:=True
   else
     begin
       Application.Terminate;
       Exit;
     end;
end;

procedure TfrmMain.HelpAboutItemClick(Sender: TObject);
begin
   AboutBox:=TAboutBox.Create(Self);
   AboutBox.Show;
end;

procedure TfrmMain.Image1Click(Sender: TObject);
var
 I: Integer;
begin

end;

procedure TfrmMain.mnuArticuloClick(Sender: TObject);
begin
  if CrearFormulario(frmArticuloUt) then
     frmArticuloUt := TfrmArticuloUt.Create(Self);
end;
procedure TfrmMain.mnuMantenerAgenciaClick(Sender: TObject);
begin
  if CrearFormulario(frmAgenciaUt) then
     frmAgenciaUt := TfrmAgenciaUt.Create(Self);
end;

procedure TfrmMain.mnuProveedoresClick(Sender: TObject);
begin
  if CrearFormulario(frmProveedor) then
   frmProveedor := TfrmProveedor.Create(Self);
end;

procedure TfrmMain.AlCerrar( Sender: TObject; var Action: TCloseAction );
begin
  Action := caFree;
end;
end.
