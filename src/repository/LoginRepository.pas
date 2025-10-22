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
    Qry.SQL.Text :=
      'SELECT id FROM usuarios WHERE nome = :nome AND senha = :senha';

    Qry.ParamByName('nome').AsString := ALogin;
    Qry.ParamByName('senha').AsString := ASenha;

    Qry.Open;

    if not Qry.IsEmpty then
    begin
      Result := True;
      TGlobal.FUserID := Qry.FieldByName('id').AsInteger;
    end;
  finally
    Qry.Free;
  end;
end;

end.

