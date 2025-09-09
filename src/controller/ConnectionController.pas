unit ConnectionController;

interface

uses
  System.SysUtils, ConnectionRepository, ConnectionService, ConnectionModel;

type
  TConnectionController = class
  private
    FService: TConnectionService;
    FRepository: IConfigRepository;
  public
    constructor Create(AService: TConnectionService; ARepository: IConfigRepository);
    function SaveConfig(const Config: TConnectionConfig; out Msg: string): Boolean;
    function LoadConfig: TConnectionConfig;
  end;

implementation

constructor TConnectionController.Create(AService: TConnectionService; ARepository: IConfigRepository);
begin
  inherited Create;
  FService := AService;
  FRepository := ARepository;
end;

function TConnectionController.SaveConfig(const Config: TConnectionConfig; out Msg: string): Boolean;
begin
  Result := FService.TestConnection(Config, Msg);
  if Result then
    FRepository.SaveConfig(Config);
end;

function TConnectionController.LoadConfig: TConnectionConfig;
begin
  Result := FRepository.LoadConfig;
end;

end.
