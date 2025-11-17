unit LoginController;


interface

uses
LoginModel, LoginService, UsuarioModel, LogService;

type
 TLoginController = class
 private
  FService: TLoginService;
 public
  constructor Create;
  function SalvarLogin (const AUsuarioModel: TUsuarioModel): boolean;
  procedure LogLoginFalho(const Usuario: string);
  procedure LogLoginSucesso;


end;

implementation

{ TLoginController }

constructor TLoginController.Create;
begin
FService := TLoginService.Create;
end;

function TLoginController.SalvarLogin(const AUsuarioModel: TUsuarioModel): boolean;
begin
 result := FService.SalvarLogin(AUsuarioModel);
end;

procedure TLoginController.LogLoginFalho(const Usuario: string);
begin
  TLogService.Instance.LogLogin(False, Usuario);
end;

procedure TLoginController.LogLoginSucesso;
begin
  TLogService.Instance.LogLogin(True);
end;

end.
