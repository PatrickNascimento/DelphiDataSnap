unit Servidor;

interface

uses
  Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.AppEvnts, Vcl.StdCtrls, IdHTTPWebBrokerBridge, Web.HTTPApp, CPort,
  MtsCompatibilidade,StrUtils;

type
  Tserver = class(TForm)
    ApplicationEvents1: TApplicationEvents;
    ComPort1: TComPort;
    GroupBox1: TGroupBox;
    ButtonOpenBrowser: TButton;
    Label1: TLabel;
    ButtonStart: TButton;
    ButtonStop: TButton;
    EditPort: TEdit;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    txpeso: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    peso: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure ApplicationEvents1Idle(Sender: TObject; var Done: Boolean);
    procedure ButtonStartClick(Sender: TObject);
    procedure ButtonStopClick(Sender: TObject);
    procedure ButtonOpenBrowserClick(Sender: TObject);
    procedure ComPort1RxChar(Sender: TObject; Count: Integer);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure pesoChange(Sender: TObject);
  private
    FServer: TIdHTTPWebBrokerBridge;
    procedure StartServer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  server: Tserver;

implementation

{$R *.dfm}

uses
  WinApi.Windows, Winapi.ShellApi, Datasnap.DSSession;

procedure Tserver.ApplicationEvents1Idle(Sender: TObject; var Done: Boolean);
begin
  ButtonStart.Enabled := not FServer.Active;
  ButtonStop.Enabled := FServer.Active;
  EditPort.Enabled := not FServer.Active;
end;

procedure Tserver.Button1Click(Sender: TObject);
begin
 ComPort1.open;
end;

procedure Tserver.Button2Click(Sender: TObject);
begin
ComPort1.close;
end;

procedure Tserver.Button3Click(Sender: TObject);
begin
txpeso.Text :='';
end;

procedure Tserver.Button4Click(Sender: TObject);
var
count : integer;
begin

end;

procedure Tserver.ButtonOpenBrowserClick(Sender: TObject);
var
  LURL: string;
begin
  StartServer;
end;

procedure Tserver.ButtonStartClick(Sender: TObject);
begin
  StartServer;
end;

procedure TerminateThreads;
begin
  if TDSSessionManager.Instance <> nil then
    TDSSessionManager.Instance.TerminateAllSessions;
end;

procedure Tserver.ButtonStopClick(Sender: TObject);
begin
  TerminateThreads;
  FServer.Active := False;
  FServer.Bindings.Clear;
end;

procedure Tserver.ComPort1RxChar(Sender: TObject; Count: Integer);
var
  s: Mtsstring;
  x: Mtsstring;
begin
  ComPort1.ReadStr(s, Count);
  txpeso.Text := txpeso.Text  + s + #10;
  peso.Text := RightStr(txpeso.Text, 7);
end;


procedure Tserver.FormCreate(Sender: TObject);
begin
  FServer := TIdHTTPWebBrokerBridge.Create(Self);
end;

procedure Tserver.pesoChange(Sender: TObject);
begin
ButtonOpenBrowser.Click;
end;

procedure Tserver.StartServer;
begin
  if not FServer.Active then
  begin
    FServer.Bindings.Clear;
    FServer.DefaultPort := StrToInt(EditPort.Text);
    FServer.Active := True;
  end;
end;

end.
