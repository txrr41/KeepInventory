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
var
  Repo: TLoginRepository;
  UserID: Integer;
begin
  Repo := TLoginRepository.Create;
  try
    Result := Repo.UsuarioExiste(ALoginConfig.User, ALoginConfig.Senha, UserID);

    if Result then
      ALoginConfig.ID := UserID; // armazenar no model
  finally
    Repo.Free;
  end;
end;
end.

