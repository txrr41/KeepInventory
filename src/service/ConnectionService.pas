unit ConnectionService;

interface

uses
  FireDAC.Comp.Client, ConnectionModel, ConnectionRepository, Vcl.Forms;

type
  TConnectionService = class
  private
    FConnection: TFDConnection;
    FRepository: IConfigRepository;
  public
    constructor Create(AConnection: TFDConnection);
    function TestConnection(const Config: TConnectionConfig; out Msg: string): Boolean;
    function SaveConfig(const Config: TConnectionConfig; out Msg: string): Boolean;
    function LoadConfig: TConnectionConfig;
  end;

implementation

uses
  System.SysUtils;

{ TConnectionService }

constructor TConnectionService.Create(AConnection: TFDConnection);
begin
  inherited Create;
  FConnection := AConnection;

  // Cria o Repository internamente
  FRepository := TIniConfigRepository.Create(ExtractFilePath(Application.ExeName) + 'conexao.ini');
end;

function TConnectionService.TestConnection(const Config: TConnectionConfig; out Msg: string): Boolean;
begin
  Result := False;
  try
    FConnection.Close;
    FConnection.Params.Clear;

    FConnection.Params.DriverID := 'PG';
    FConnection.Params.Database := Config.Database;
    FConnection.Params.UserName := Config.UserName;
    FConnection.Params.Password := Config.Password;
    FConnection.Params.Add('Server=' + Config.Server);
    FConnection.Params.Add('Port=' + Config.Port);

    FConnection.Open;

    Result := True;
    Msg := 'Conexão realizada com sucesso!';
  except
    on E: Exception do
      Msg := 'Erro ao conectar: ' + E.Message;
  end;
end;

function TConnectionService.SaveConfig(const Config: TConnectionConfig; out Msg: string): Boolean;
begin
  Result := TestConnection(Config, Msg);
  if Result then
    FRepository.SaveConfig(Config);
end;

function TConnectionService.LoadConfig: TConnectionConfig;
begin
  Result := FRepository.LoadConfig;
end;

end.

