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
   Qry := TFDQuery.Create(nil);
  Qry.Connection := DataModule2.FDConnection;
  Qry.SQL.Text := 'SELECT id, nome, ativo FROM usuarios LIMIT 1';
  Qry.Open;
    if not Qry.IsEmpty then
    begin
      Result := True;
      AUserID := Qry.FieldByName('id').AsInteger; // <-- CORRETO AGORA
    end;
  finally
    Qry.Free;
  end;
end;
end.

