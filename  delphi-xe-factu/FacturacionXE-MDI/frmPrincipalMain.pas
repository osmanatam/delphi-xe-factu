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
    CutItem: TMenuItem;
    CopyItem: TMenuItem;
    PasteItem: TMenuItem;
    WindowMinimizeItem: TMenuItem;
    StatusBar: TStatusBar;
    WindowTileItem2: TMenuItem;
    MantenerAgencia1: TMenuItem;
    ConsultaAgencia1: TMenuItem;
    procedure MantenerAgencia1Click(Sender: TObject);
    procedure AlCerrar( Sender: TObject; var Action: TCloseAction );
    procedure HelpAboutItemClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses about, frmArticulos;


procedure TfrmMain.HelpAboutItemClick(Sender: TObject);
begin
   AboutBox:=TAboutBox.Create(Self);
   AboutBox.Show;
end;

procedure TfrmMain.MantenerAgencia1Click(Sender: TObject);
begin
  if not Assigned(frmBaseArticulo) then
    begin
      frmBaseArticulo := TfrmBaseArticulo.Create( Self );
      frmBaseArticulo.FormStyle := fsMDIChild;
      frmBaseArticulo.Caption := 'Articulos Facturables';
      frmBaseArticulo.OnClose := AlCerrar;
      frmBaseArticulo.Show;
    end
  else
    begin
      frmBaseArticulo.Show;
    end;
end;

procedure TfrmMain.AlCerrar( Sender: TObject; var Action: TCloseAction );
begin
  Action := caFree;
end;
end.
