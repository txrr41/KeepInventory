unit LoginModel;

interface

Type TLoginConfig = class
private
  FUser : String;
  FSenha : String;
public

  property User: string read FUser write FUser;
  property Senha: String read FSenha write FSenha;

end;

implementation

end.
