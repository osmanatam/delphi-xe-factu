unit frmPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, frmpais,frmciudad,FRMTIPOIVA,frmunidadmedida,frmpaisult,
  frmempresa,frmAgencia,frmArticulos,frmMostrarImagenes,frmProveedores;

type
  TfrmMenuPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    mnuClientes: TMenuItem;
    mnuMantClientes: TMenuItem;
    mnuArticulos: TMenuItem;
    mnuManArticulos: TMenuItem;
    mniFacturacion: TMenuItem;
    mniFacturar: TMenuItem;
    mniTablasMenores: TMenuItem;
    mniPais: TMenuItem;
    mniCiudad: TMenuItem;
    mniTipoIva: TMenuItem;
    mniReportes: TMenuItem;
    mniFacturarpt: TMenuItem;
    mniEmpresa: TMenuItem;
    mniSucursal: TMenuItem;
    mniProveedores: TMenuItem;
    mniMantProveedores: TMenuItem;
    img1: TImage;
    mniUnidadMed: TMenuItem;
    TrayIcon1: TTrayIcon;
    PEEImagenes: TMenuItem;
    procedure mniCiudadClick(Sender: TObject);
    procedure mniPaisClick(Sender: TObject);
    procedure mniTipoIvaClick(Sender: TObject);
    procedure mniUnidadMedClick(Sender: TObject);
    procedure mniEmpresaClick(Sender: TObject);
    procedure mniSucursalClick(Sender: TObject);
    procedure mnuManArticulosClick(Sender: TObject);
    procedure PEEImagenesClick(Sender: TObject);
    procedure mniMantProveedoresClick(Sender: TObject);
    procedure AlCerrar ( Sender: TObject; var Action: TCloseAction );

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMenuPrincipal: TfrmMenuPrincipal;

implementation

{$R *.dfm}

procedure TfrmMenuPrincipal.mniCiudadClick(Sender: TObject);
begin
   frmciudad2:=Tfrmciudad2.Create(SELF);
   frmciudad2.pnl1.Caption:='Mantenimiento Ciudad';
   frmciudad2.Show;
end;

procedure TfrmMenuPrincipal.AlCerrar( Sender: TObject; var Action: TCloseAction );
begin
  Action := caFree;
end;

procedure TfrmMenuPrincipal.mniEmpresaClick(Sender: TObject);
begin
   frmBaseTMEmpresa:=TfrmBaseTMEmpresa.Create(SELF);
   frmBaseTMEmpresa.pnl1.Caption:='Mantenimiento Empresa';
   frmBaseTMEmpresa.Show;
end;

procedure TfrmMenuPrincipal.mniMantProveedoresClick(Sender: TObject);
begin
    frmProveedoresUt:=TfrmProveedoresUt.Create(SELF);
      frmProveedoresUt.Show;
end;

procedure TfrmMenuPrincipal.mniPaisClick(Sender: TObject);
begin
      frmBaseTMPais:=TfrmBaseTMPais.Create(SELF);
      frmBaseTMPais.pnl1.Caption:='Mantenimiento Pais';
      frmBaseTMPais.Show;
end;

procedure TfrmMenuPrincipal.mniSucursalClick(Sender: TObject);
begin
      frmBaseTMagencia:=TfrmBaseTMAgencia.Create(SELF);
      frmBaseTMagencia.pnl1.Caption:='Mantenimiento Agencias';
      frmBaseTMagencia.Show;
end;

procedure TfrmMenuPrincipal.mniTipoIvaClick(Sender: TObject);
begin
    frmTablaMenorIVA.Create(SELF);
    frmTablaMenorIVA.pnlTablaMenor.Caption:='Mantenimiento IVA';
    frmTablaMenorIVA.Show;
end;

procedure TfrmMenuPrincipal.mniUnidadMedClick(Sender: TObject);
begin
    frmTablaMenorUM.Create(SELF);
    frmTablaMenorUM.pnlTablaMenor.Caption:='Mantenimiento Unidad Medida';
    frmTablaMenorIVA.Show;
end;

procedure TfrmMenuPrincipal.mnuManArticulosClick(Sender: TObject);
begin
   frmArticulosUt:=tfrmArticulosUt.Create(SELF);
   frmArticulosUt.Show;
end;
procedure TfrmMenuPrincipal.PEEImagenesClick(Sender: TObject);
begin
    frmImagenes:=TfrmImagenes.Create(self);
     frmImagenes.Show;

end;

end.



