unit WsPruebaMain;

interface

uses
 Windows, Messages, SysUtils, Classes, Graphics, Controls, SvcMgr, Dialogs,
  IdHTTPWebBrokerBridge, HTTPApp, Registry;

type
  TWSPruebasMain = class(TService)
    procedure ServiceCreate(Sender: TObject);
    procedure ServiceDestroy(Sender: TObject);
    procedure ServiceAfterInstall(Sender: TService);
    procedure ServiceStart(Sender: TService; var Started: Boolean);
  private
    { Private declarations }
    FServer: TIdHTTPWebBrokerBridge;
    procedure StartServer;
  public
    function GetServiceController: TServiceController; override;
    { Public declarations }
  end;

var
  WSPruebasMain: TWSPruebasMain;

implementation
       uses WsServer;
{$R *.DFM}

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  WSPruebasMain.Controller(CtrlCode);
end;

function TWSPruebasMain.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

procedure TWSPruebasMain.ServiceAfterInstall(Sender: TService);
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create(KEY_READ or KEY_WRITE);
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    if Reg.OpenKey('\SYSTEM\CurrentControlSet\Services\' + Name, false) then
    begin
      Reg.WriteString('Description', 'Clauxs Test WS  Vers-1.0');
      Reg.CloseKey;
    end;
  finally
    Reg.Free;
  end;
end;

procedure TWSPruebasMain.ServiceCreate(Sender: TObject);
begin
   FServer := TIdHTTPWebBrokerBridge.Create(Self);
   FServer.RegisterWebModuleClass(TWebModule2);
   FServer.KeepAlive := True;
end;

procedure TWSPruebasMain.ServiceDestroy(Sender: TObject);
begin
  FServer.Active := False;
  FServer.Free;
end;

procedure TWSPruebasMain.ServiceStart(Sender: TService; var Started: Boolean);
begin
StartServer;
end;

procedure TWSPruebasMain.StartServer;
begin
  if not FServer.Active then
  begin
    FServer.Bindings.Clear;
    FServer.DefaultPort := StrToIntDef('8033',8088);
    FServer.Active := True;
  end;
end;
end.
