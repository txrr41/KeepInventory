unit ConnectionController;

interface

uses
  System.SysUtils, ConnectionService, ConnectionModel, FireDAC.Comp.Client;

type
  TConnectionController = class
  private
    FService: TConnectionService;
  public
    constructor Create(AConnection: TFDConnection);
    destructor Destroy; override;

    // Declarar os métodos publicamente aqui
    function SaveConfig(const Config: TConnectionConfig; out Msg: string): Boolean;
    function LoadConfig: TConnectionConfig;
  end;

implementation

{ TConnectionController }

constructor TConnectionController.Create(AConnection: TFDConnection);
begin
  inherited Create;
  // Cria apenas o Service; o Service cuidará do Repository
  FService := TConnectionService.Create(AConnection);
end;

destructor TConnectionController.Destroy;
begin
  FService.Free;
  inherited;
end;

function TConnectionController.SaveConfig(const Config: TConnectionConfig; out Msg: string): Boolean;
begin
  Result := FService.SaveConfig(Config, Msg);
end;

function TConnectionController.LoadConfig: TConnectionConfig;
begin
  Result := FService.LoadConfig;
end;

end.

