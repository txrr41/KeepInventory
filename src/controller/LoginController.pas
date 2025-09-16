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
  procedure SalvarLogin (const ALoginConfig: TLoginConfig);


end;

implementation

{ TLoginController }

constructor TLoginController.Create;
begin
FService := TLoginService.Create;
end;

procedure TLoginController.SalvarLogin(const ALoginConfig: TLoginConfig);
begin
  FService.SalvarLogin(ALoginConfig);
end;

end.
