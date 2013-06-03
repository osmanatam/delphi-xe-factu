unit frmBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, DBCtrls;

type
  TfrmBaseUt = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    tgDatos: TTabSheet;
    tgConsulta: TTabSheet;
    DBNavigator1: TDBNavigator;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBaseUt: TfrmBaseUt;

implementation

{$R *.dfm}

procedure TfrmBaseUt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:= caFree;
end;

procedure TfrmBaseUt.FormShow(Sender: TObject);
begin
 PageControl1.ActivePageIndex:=0;
end;

end.
