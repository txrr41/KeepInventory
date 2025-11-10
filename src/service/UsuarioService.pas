unit UsuarioService;

interface

uses
  UsuarioModel, UsuarioRepository, Data.DB, System.SysUtils, System.Hash;

Type
  TUsuarioService = class
  public
    procedure AdicionarUsuario(AUsuarioModel: TUsuarioModel);
    procedure EditarUsuario(AUsuarioModel: TUsuarioModel);
    procedure ExcluirUsuario(AId: Integer);
    function ListarUsuarios: TDataSet;
    function PesquisarUsuario(const ASearch: String): TDataSet;
    function GerarHashSenha(const ASenha: String): String;
    function ObterPermissoes(AIdUsuario: Integer): TUsuarioModel;
  end;

var
  FUsuarioService: TUsuarioService;

implementation

{ TUsuarioService }

procedure TUsuarioService.AdicionarUsuario(AUsuarioModel: TUsuarioModel);
begin
  FUsuarioRepository.AdicionarUsuario(AUsuarioModel);
end;

procedure TUsuarioService.EditarUsuario(AUsuarioModel: TUsuarioModel);
begin
  FUsuarioRepository.EditarUsuario(AUsuarioModel);
end;

procedure TUsuarioService.ExcluirUsuario(AId: Integer);
begin
  FUsuarioRepository.ExcluirUsuario(AId);
end;

function TUsuarioService.ListarUsuarios: TDataSet;
begin
  Result := FUsuarioRepository.ListarUsuarios;
end;

function TUsuarioService.PesquisarUsuario(const ASearch: String): TDataSet;
begin
  Result := FUsuarioRepository.PesquisarUsuario(ASearch);
end;

function TUsuarioService.GerarHashSenha(const ASenha: String): String;
begin
  // Gera hash SHA256 da senha
  Result := THashSHA2.GetHashString(ASenha);
end;

function TUsuarioService.ObterPermissoes(AIdUsuario: Integer): TUsuarioModel;
begin
  Result := FUsuarioRepository.ObterPermissoes(AIdUsuario);
end;

end.
