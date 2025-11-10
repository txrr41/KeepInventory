unit LoginRepository;

interface

uses
  FireDAC.Comp.Client, System.SysUtils, DB, GlobalUserDTO;

type
  TLoginRepository = class
  public
    function UsuarioExiste(const ALogin, ASenha: string; out AUserID: Integer): Boolean;
  end;

implementation

function TLoginRepository.UsuarioExiste(const ALogin, ASenha: string; out AUserID: Integer): Boolean;
var
  Qry: TFDQuery;
begin
  Result := False;
  AUserID := -1;

  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := DataModule2.FDConnection;

    // *** CORRIGIDO: Verifica login e senha corretamente ***
    Qry.SQL.Text :=
      'SELECT id, nome FROM usuarios ' +
      'WHERE nome = :nome ' +
      '  AND senha = :senha ' +  // ou senha_hash se for o campo de hash
      '  AND ativo = true';

    Qry.ParamByName('nome').AsString := ALogin;
    Qry.ParamByName('senha').AsString := ASenha; // Se usar hash: THashSHA2.GetHashString(ASenha)

    Qry.Open;

    if not Qry.IsEmpty then
    begin
      Result := True;
      AUserID := Qry.FieldByName('id').AsInteger;
    end;
  finally
    Qry.Free;
  end;
end;

end.
