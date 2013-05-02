unit frmBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  TfrmBaseUt = class(TForm)
    Panel1: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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

end.
