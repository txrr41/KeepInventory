unit UsuarioController;

interface

uses
  UsuarioModel, UsuarioDTO, UsuarioService, System.SysUtils, Data.DB;

type
  TUsuarioController = class
  public
    procedure AdicionarUsuario(AUsuarioDTO: TUsuarioDTO);
    procedure EditarUsuario(AUsuarioDTO: TUsuarioDTO);
    procedure ExcluirUsuario(AId: Integer);
    function ListarUsuarios: TDataSet;
    function PesquisarUsuario(const ASearch: String): TDataSet;
    function DtoForModel(AUsuarioDTO: TUsuarioDTO): TUsuarioModel;
    function ObterPermissoes(AIdUsuario: Integer): TUsuarioModel;
  end;

var
  FUsuarioController: TUsuarioController;

implementation

{ TUsuarioController }

procedure TUsuarioController.AdicionarUsuario(AUsuarioDTO: TUsuarioDTO);
var
  UsuarioModel: TUsuarioModel;
begin
  UsuarioModel := DtoForModel(AUsuarioDTO);
  try
    FUsuarioService.AdicionarUsuario(UsuarioModel);
  finally
    UsuarioModel.Free;
  end;
end;

procedure TUsuarioController.EditarUsuario(AUsuarioDTO: TUsuarioDTO);
var
  UsuarioModel: TUsuarioModel;
begin
  UsuarioModel := DtoForModel(AUsuarioDTO);
  try
    FUsuarioService.EditarUsuario(UsuarioModel);
  finally
    UsuarioModel.Free;
  end;
end;

procedure TUsuarioController.ExcluirUsuario(AId: Integer);
begin
  FUsuarioService.ExcluirUsuario(AId);
end;

function TUsuarioController.ListarUsuarios: TDataSet;
begin
  Result := FUsuarioService.ListarUsuarios;
end;

function TUsuarioController.PesquisarUsuario(const ASearch: String): TDataSet;
begin
  Result := FUsuarioService.PesquisarUsuario(ASearch);
end;

function TUsuarioController.DtoForModel(AUsuarioDTO: TUsuarioDTO): TUsuarioModel;
var
  UsuarioModel: TUsuarioModel;
begin
  UsuarioModel := TUsuarioModel.Create;

  UsuarioModel.Id := AUsuarioDTO.FId;
  UsuarioModel.Nome := AUsuarioDTO.FNome;
  UsuarioModel.Cpf := AUsuarioDTO.FCpf;
  UsuarioModel.Rg := AUsuarioDTO.FRg;
  UsuarioModel.Telefone := AUsuarioDTO.FTelefone;
  UsuarioModel.DataNascimento := AUsuarioDTO.FDataNascimento;
  UsuarioModel.Funcao := AUsuarioDTO.FFuncao;

  // Se a senha foi informada, gera o hash
  if Trim(AUsuarioDTO.FSenha) <> '' then
    UsuarioModel.SenhaHash := FUsuarioService.GerarHashSenha(AUsuarioDTO.FSenha)
  else
    UsuarioModel.SenhaHash := '';

  // Permissões Cadastros
  UsuarioModel.PermCadastros := AUsuarioDTO.FPermCadastros;
  UsuarioModel.PermCadEmpresa := AUsuarioDTO.FPermCadEmpresa;
  UsuarioModel.PermCadPredio := AUsuarioDTO.FPermCadPredio;
  UsuarioModel.PermCadSala := AUsuarioDTO.FPermCadSala;
  UsuarioModel.PermCadPatrimonio := AUsuarioDTO.FPermCadPatrimonio;

  // Permissões Movimentações
  UsuarioModel.PermMovimentacoes := AUsuarioDTO.FPermMovimentacoes;
  UsuarioModel.PermMovAnalisar := AUsuarioDTO.FPermMovAnalisar;
  UsuarioModel.PermMovAdicionar := AUsuarioDTO.FPermMovAdicionar;
  UsuarioModel.PermMovExcluir := AUsuarioDTO.FPermMovExcluir;

  // Permissões Ocorrências
  UsuarioModel.PermOcorrencias := AUsuarioDTO.FPermOcorrencias;
  UsuarioModel.PermOcorAnalisar := AUsuarioDTO.FPermOcorAnalisar;
  UsuarioModel.PermOcorAdicionar := AUsuarioDTO.FPermOcorAdicionar;
  UsuarioModel.PermOcorExcluir := AUsuarioDTO.FPermOcorExcluir;

  // Permissões Usuários
  UsuarioModel.PermUsuarios := AUsuarioDTO.FPermUsuarios;
  UsuarioModel.PermUserCadastrar := AUsuarioDTO.FPermUserCadastrar;
  UsuarioModel.PermUserPermissao := AUsuarioDTO.FPermUserPermissao;

  Result := UsuarioModel;
end;

function TUsuarioController.ObterPermissoes(AIdUsuario: Integer): TUsuarioModel;
begin
  Result := FUsuarioService.ObterPermissoes(AIdUsuario);
end;

end.
