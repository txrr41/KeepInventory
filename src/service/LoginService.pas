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

    procedure SalvarLogin(const ALoginConfig: TLoginConfig);
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

procedure TLoginService.SalvarLogin(const ALoginConfig: TLoginConfig);
begin
  if FRepository.UsuarioExiste(ALoginConfig.User, ALoginConfig.Senha) then
    ShowMessage('Login realizado com sucesso!')
  else
    ShowMessage('Usuário ou senha inválidos!');
end;

end.

