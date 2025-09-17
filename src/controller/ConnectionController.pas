unit ConnectionController;

interface

uses
  System.SysUtils,
  FireDAC.Comp.Client,
  ConnectionService,
  ConnectionModel,
  Vcl.Dialogs,
  ConnectionVerificationService,
  DB;


type
  TConnectionController = class
  private

    FService: TConnectionService;
    FIniService: TIniVerification;
  public
    constructor Create;
    destructor Destroy; override;

    // Verifica se o arquivo INI existe
    function IniExist: Boolean;

    // Carrega configuração do INI ou outro repositório
    function LoadConfig: TConnectionConfig;

    // Salva configuração via service
    function SaveConfig(const Config: TConnectionConfig; out Msg: string): Boolean;
  end;

implementation

{ TConnectionController }

constructor TConnectionController.Create;

begin
  inherited Create;
  FService := TConnectionService.Create;
  FIniService := TIniVerification.Create; // service de verificação do INI
end;

destructor TConnectionController.Destroy;
begin
  FService.Free;
  FIniService.Free;
  inherited;
end;

function TConnectionController.IniExist: Boolean;

begin

  Result := FIniService.Verification;
end;

function TConnectionController.LoadConfig: TConnectionConfig;
begin
  Result := FService.LoadConfig;
end;

function TConnectionController.SaveConfig(const Config: TConnectionConfig; out Msg: string): Boolean;
begin
  Result := FService.SaveConfig(Config, Msg);
end;

end.

