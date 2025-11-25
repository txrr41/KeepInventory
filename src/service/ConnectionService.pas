unit ConnectionService;

interface

uses
  FireDAC.Comp.Client, ConnectionModel, ConnectionRepository, Vcl.Forms, DB, System.SysUtils, dialogs;

type
  TConnectionService = class
  private
    FConnection: TFDConnection;
    FRepository: IConfigRepository;
    FOwnsConnection: Boolean;
  public
    constructor Create;
    destructor Destroy; override;
    function TestConnection(const Config: TConnectionConfig; out Msg: string): Boolean;
    function SaveConfig(const Config: TConnectionConfig; out Msg: string): Boolean;
    function LoadConfig: TConnectionConfig;
  end;

implementation


{ TConnectionService }

constructor TConnectionService.Create;
begin
  inherited Create;

  // TEMPORÁRIO: Sempre criar conexão própria para evitar Access Violation
  FConnection := TFDConnection.Create(nil);
  FOwnsConnection := True;

  // Configura o driver PostgreSQL
  FConnection.DriverName := 'PG';

  // Cria o Repository internamente
  FRepository := TIniConfigRepository.Create(ExtractFilePath(Application.ExeName) + 'conexao.ini');
end;

destructor TConnectionService.Destroy;
begin
  // Libera a conexão apenas se foi criada localmente
  if FOwnsConnection and Assigned(FConnection) then
    FConnection.Free;

  inherited Destroy;
end;

function TConnectionService.TestConnection(const Config: TConnectionConfig; out Msg: string): Boolean;
begin
  Result := False;
  try
    FConnection.Close;
    FConnection.Params.Clear;

    // Configura os parâmetros de conexão
    FConnection.Params.Values['DriverID'] := 'PG';
    FConnection.Params.Values['Server'] := Config.Server;
    FConnection.Params.Values['Port'] := Config.Port;
    FConnection.Params.Values['Database'] := Config.Database;
    FConnection.Params.Values['User_Name'] := Config.UserName;
    FConnection.Params.Values['Password'] := Config.Password;

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

