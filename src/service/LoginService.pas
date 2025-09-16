unit LoginService;

interface

uses
LoginModel, vcl.Dialogs;

Type TLoginService = class
  public
  procedure SalvarLogin (const ALoginConfig: TLoginConfig);
end;

implementation

{ TLoginService }

procedure TLoginService.SalvarLogin(const ALoginConfig: TLoginConfig);
begin
 if ALoginConfig.User = '' then begin
  ShowMessage('O campo Usuário é obrigatorio, preencha antes de continuar');



end else if ALoginConfig.Senha = '' then begin

   ShowMessage('O campo senha é obrigatorio, preencha antes de continuar');
end else begin
    ShowMessage('Login realizado com sucesso');
end;


end;


end.
