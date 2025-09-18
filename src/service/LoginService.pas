unit LoginService;

interface

uses
  LoginModel, Vcl.Dialogs, LoginRepository;

type
  TLoginService = class
  private
    FRepository: TLoginRepository;
  public
    constructor Create;
    destructor Destroy; override;

    function SalvarLogin(const ALoginConfig: TLoginConfig): boolean ;
  end;

implementation

{ TLoginService }

constructor TLoginService.Create;
begin
  FRepository := TLoginRepository.Create;
end;

destructor TLoginService.Destroy;
begin
  FRepository.Free;
  inherited;
end;

function TLoginService.SalvarLogin(const ALoginConfig: TLoginConfig): boolean ;
begin
result := false;
  if FRepository.UsuarioExiste(ALoginConfig.User, ALoginConfig.Senha) then
    result := True;
end;

end.

