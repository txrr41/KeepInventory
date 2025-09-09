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
    // Fecha conex�o caso esteja aberta
    FConnection.Close;
    // Limpa par�metros anteriores
    FConnection.Params.Clear;

    // Configura par�metros para PostgreSQL
    FConnection.Params.DriverID := 'PG';
    FConnection.Params.Database := Config.Database;
    FConnection.Params.UserName := Config.UserName;
    FConnection.Params.Password := Config.Password;
    FConnection.Params.Add('Server=' + Config.Server);
    FConnection.Params.Add('Port=' + Config.Port);

    // Tenta abrir a conex�o
    FConnection.Open;

    // Se chegou aqui, conex�o foi bem sucedida
    Result := True;
    Msg := 'Conex�o realizada com sucesso!';
  except
    on E: Exception do
    begin
      // Em caso de erro, retorna falso e mensagem com o erro
      Msg := 'Erro ao conectar: ' + E.Message;
    end;
  end;
end;
end.
