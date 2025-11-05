unit LoginController;


interface

uses
LoginModel, LoginService, UsuarioModel;

type
 TLoginController = class
 private
  FService: TLoginService;
 public
  constructor Create;
  function SalvarLogin (const AUsuarioModel: TUsuarioModel): boolean;


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

end.
