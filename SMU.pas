unit SMU;

interface

uses System.SysUtils, System.Classes, System.Json,
    DataSnap.DSProviderDataModuleAdapter,
    Datasnap.DSServer, Datasnap.DSAuth, REST.Json;

type
  TServerMethods1 = class(TDSServerModule)
  private
    { Private declarations }
  public
    { Public declarations }
    function Getpeso : TJSONObject;
  end;

implementation


{$R *.dfm}

uses peso, Servidor;


{ TServerMethods1 }

function TServerMethods1.Getpeso: TJSONObject;
var
  Vpeso: Tpeso;
begin
  Vpeso := Tpeso.Create;
try
  Vpeso.peso := server.peso.text;
  result := Tjson.ObjectToJsonObject(Vpeso);
finally
Vpeso.free
end;
end;

end.

