unit LoginController;


interface

uses
LoginModel, LoginService;

type
 TLoginController = class
 private
  FService: TLoginService;
 public
  constructor Create;
  function SalvarLogin (const ALoginConfig: TLoginConfig): boolean;


end;

implementation

{ TLoginController }

constructor TLoginController.Create;
begin
FService := TLoginService.Create;
end;

function TLoginController.SalvarLogin(const ALoginConfig: TLoginConfig): boolean;
begin
 result := FService.SalvarLogin(ALoginConfig);
end;

end.
