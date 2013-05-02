unit frmPrincipalMain;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, Menus,
  StdCtrls, Dialogs, Buttons, Messages, ExtCtrls, ComCtrls, StdActns,
  ActnList, ToolWin, ImgList;

type
  TfrmMain = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Window1: TMenuItem;
    Help1: TMenuItem;
    N1: TMenuItem;
    WindowCascadeItem: TMenuItem;
    WindowTileItem: TMenuItem;
    HelpAboutItem: TMenuItem;
    Edit1: TMenuItem;
    mnuMantenimientoArt: TMenuItem;
    CopyItem: TMenuItem;
    PasteItem: TMenuItem;
    WindowMinimizeItem: TMenuItem;
    StatusBar: TStatusBar;
    WindowTileItem2: TMenuItem;
    mnuMantenerAgencia: TMenuItem;
    ConsultaAgencia1: TMenuItem;
    procedure mnuMantenerAgenciaClick(Sender: TObject);
    procedure AlCerrar( Sender: TObject; var Action: TCloseAction );
    procedure HelpAboutItemClick(Sender: TObject);
    procedure mnuMantenimientoArtClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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

procedure TfrmMain.mnuMantenimientoArtClick(Sender: TObject);
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
