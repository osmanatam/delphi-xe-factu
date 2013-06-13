unit frmPrincipalMain;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, Menus,
  StdCtrls, Dialogs, Buttons, Messages, ExtCtrls, ComCtrls, StdActns,
  ActnList, ToolWin, ImgList, dsTaskBar;

type
  TfrmMain = class(TForm)
    mnuMainMenu: TMainMenu;
    File1: TMenuItem;
    Window1: TMenuItem;
    Help1: TMenuItem;
    N1: TMenuItem;
    WindowCascadeItem: TMenuItem;
    WindowTileItem: TMenuItem;
    HelpAboutItem: TMenuItem;
    Edit1: TMenuItem;
    mnuArticulo: TMenuItem;
    mnuUnidadMedida: TMenuItem;
    mnuSecciones: TMenuItem;
    WindowMinimizeItem: TMenuItem;
    StatusBar: TStatusBar;
    WindowTileItem2: TMenuItem;
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
    procedure mnuMantenerAgenciaClick(Sender: TObject);
    procedure AlCerrar( Sender: TObject; var Action: TCloseAction );
    procedure HelpAboutItemClick(Sender: TObject);
    procedure mnuArticuloClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure dsTaskBar1AddButton(Sender: TObject; Button: TTaskBarButton);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses Utilidades, about, frmArticulo, frmAgencia, frmLogin;




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

procedure TfrmMain.AlCerrar( Sender: TObject; var Action: TCloseAction );
begin
  Action := caFree;
end;
end.
