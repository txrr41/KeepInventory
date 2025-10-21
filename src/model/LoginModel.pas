unit LoginModel;

interface

Type TLoginConfig = class
private
  FUser : String;
  FSenha : String;
  FUserID : Integer;
public

  property User: string read FUser write FUser;
  property Senha: String read FSenha write FSenha;
  property Id: integer read FUserID write FUserID;

end;

implementation

end.
