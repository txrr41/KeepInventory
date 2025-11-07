unit LoginService;

interface

uses
  LoginModel, Vcl.Dialogs, LoginRepository, UsuarioModel;

type
  TLoginService = class
  private
    FRepository: TLoginRepository;
  public
    constructor Create;
    destructor Destroy; override;

    function SalvarLogin(const AUsuarioModel: TUsuarioModel): boolean;
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

function TLoginService.SalvarLogin(const AUsuarioModel: TUsuarioModel): boolean ;
var
  Repo: TLoginRepository;
  UserID: Integer;
begin
  Repo := TLoginRepository.Create;
  try
    Result := Repo.UsuarioExiste(AUsuarioModel.Nome, AUsuarioModel.SenhaHash, UserID);

    if Result then
      AUsuarioModel.ID := UserID; // <-- AGORA RECEBE O ID CORRETO
  finally
    Repo.Free;
  end;
end;


end.

