unit LoginRepository;

interface

uses
  FireDAC.Comp.Client, System.SysUtils, DB; // DBModule = seu DataModule com FDConnection

type
  TLoginRepository = class
  public
    function UsuarioExiste(const ALogin, ASenha: string): Boolean;
  end;

implementation

{ TLoginRepository }

function TLoginRepository.UsuarioExiste(const ALogin, ASenha: string): Boolean;
var
  Qry: TFDQuery;
begin
  Result := False;

  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := DataModule2.FDConnection; // usa a conexão do seu DataModule
    Qry.SQL.Text :=
    'SELECT 1 FROM usuarios WHERE nome = :nome AND senha = :senha';
    Qry.ParamByName('nome').AsString := ALogin;
    Qry.ParamByName('senha').AsString := ASenha;

    Qry.Open;

    // se a consulta trouxe pelo menos 1 registro, o usuário existe
    Result := not Qry.IsEmpty;
  finally
    Qry.Free;
  end;
end;

end.

