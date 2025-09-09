unit ConnectionService;

interface

uses
  FireDAC.Comp.Client, ConnectionModel;

type
  TConnectionService = class
  private
    FConnection: TFDConnection;
  public
    constructor Create(AConnection: TFDConnection);
    function TestConnection(const Config: TConnectionConfig; out Msg: string): Boolean;
  end;

implementation

uses
  System.SysUtils;

constructor TConnectionService.Create(AConnection: TFDConnection);
begin
  inherited Create;
  FConnection := AConnection;
end;

function TConnectionService.TestConnection(const Config: TConnectionConfig; out Msg: string): Boolean;
begin
  Result := False;
  try
    // Fecha conexão caso esteja aberta
    FConnection.Close;
    // Limpa parâmetros anteriores
    FConnection.Params.Clear;

    // Configura parâmetros para PostgreSQL
    FConnection.Params.DriverID := 'PG';
    FConnection.Params.Database := Config.Database;
    FConnection.Params.UserName := Config.UserName;
    FConnection.Params.Password := Config.Password;
    FConnection.Params.Add('Server=' + Config.Server);
    FConnection.Params.Add('Port=' + Config.Port);

    // Tenta abrir a conexão
    FConnection.Open;

    // Se chegou aqui, conexão foi bem sucedida
    Result := True;
    Msg := 'Conexão realizada com sucesso!';
  except
    on E: Exception do
    begin
      // Em caso de erro, retorna falso e mensagem com o erro
      Msg := 'Erro ao conectar: ' + E.Message;
    end;
  end;
end;
end.
