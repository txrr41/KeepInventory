unit UsuarioRepository;

interface

uses
  UsuarioModel, DB, FireDAC.Comp.Client, Data.DB, System.SysUtils, System.Classes;

Type
  TUsuarioRepository = class
  public
    procedure AdicionarUsuario(AUsuarioModel: TUsuarioModel);
    procedure EditarUsuario(AUsuarioModel: TUsuarioModel);
    procedure ExcluirUsuario(AId: Integer);
    function ListarUsuarios: TDataSet;
    function PesquisarUsuario(const ASearch: String): TDataSet;
    function ObterPermissoes(AIdUsuario: Integer): TUsuarioModel;
  end;

var
  FUsuarioRepository: TUsuarioRepository;

implementation

{ TUsuarioRepository }

procedure TUsuarioRepository.AdicionarUsuario(AUsuarioModel: TUsuarioModel);
var
  Q: TFDQuery;
begin
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := DataModule2.FDConnection;
    Q.SQL.Text :=
      'INSERT INTO usuarios ( ' +
      '  nome, cpf, rg, telefone, data_nascimento, funcao, senha, ' +
      '  perm_cadastros, perm_cad_empresa, perm_cad_predio, perm_cad_sala, perm_cad_patrimonio, ' +
      '  perm_movimentacoes, perm_mov_analisar, perm_mov_adicionar, perm_mov_excluir, ' +
      '  perm_ocorrencias, perm_ocor_analisar, perm_ocor_adicionar, perm_ocor_excluir, ' +
      '  perm_usuarios, perm_user_cadastrar, perm_user_permissao ' +
      ') VALUES ( ' +
      '  :nome, :cpf, :rg, :telefone, :data_nascimento, :funcao, :senha, ' +
      '  :perm_cadastros, :perm_cad_empresa, :perm_cad_predio, :perm_cad_sala, :perm_cad_patrimonio, ' +
      '  :perm_movimentacoes, :perm_mov_analisar, :perm_mov_adicionar, :perm_mov_excluir, ' +
      '  :perm_ocorrencias, :perm_ocor_analisar, :perm_ocor_adicionar, :perm_ocor_excluir, ' +
      '  :perm_usuarios, :perm_user_cadastrar, :perm_user_permissao ' +
      ')';

    Q.ParamByName('nome').AsString := AUsuarioModel.Nome;
    Q.ParamByName('cpf').AsString := AUsuarioModel.Cpf;
    Q.ParamByName('rg').AsString := AUsuarioModel.Rg;
    Q.ParamByName('telefone').AsString := AUsuarioModel.Telefone;
    Q.ParamByName('data_nascimento').AsDate := AUsuarioModel.DataNascimento;
    Q.ParamByName('funcao').AsString := AUsuarioModel.Funcao;
    Q.ParamByName('senha').AsString := AUsuarioModel.SenhaHash;

    // Permiss�es Cadastros
    Q.ParamByName('perm_cadastros').AsBoolean := AUsuarioModel.PermCadastros;
    Q.ParamByName('perm_cad_empresa').AsBoolean := AUsuarioModel.PermCadEmpresa;
    Q.ParamByName('perm_cad_predio').AsBoolean := AUsuarioModel.PermCadPredio;
    Q.ParamByName('perm_cad_sala').AsBoolean := AUsuarioModel.PermCadSala;
    Q.ParamByName('perm_cad_patrimonio').AsBoolean := AUsuarioModel.PermCadPatrimonio;

    // Permiss�es Movimenta��es
    Q.ParamByName('perm_movimentacoes').AsBoolean := AUsuarioModel.PermMovimentacoes;
    Q.ParamByName('perm_mov_analisar').AsBoolean := AUsuarioModel.PermMovAnalisar;
    Q.ParamByName('perm_mov_adicionar').AsBoolean := AUsuarioModel.PermMovAdicionar;
    Q.ParamByName('perm_mov_excluir').AsBoolean := AUsuarioModel.PermMovExcluir;

    // Permiss�es Ocorr�ncias
    Q.ParamByName('perm_ocorrencias').AsBoolean := AUsuarioModel.PermOcorrencias;
    Q.ParamByName('perm_ocor_analisar').AsBoolean := AUsuarioModel.PermOcorAnalisar;
    Q.ParamByName('perm_ocor_adicionar').AsBoolean := AUsuarioModel.PermOcorAdicionar;
    Q.ParamByName('perm_ocor_excluir').AsBoolean := AUsuarioModel.PermOcorExcluir;

    // Permiss�es Usu�rios
    Q.ParamByName('perm_usuarios').AsBoolean := AUsuarioModel.PermUsuarios;
    Q.ParamByName('perm_user_cadastrar').AsBoolean := AUsuarioModel.PermUserCadastrar;
    Q.ParamByName('perm_user_permissao').AsBoolean := AUsuarioModel.PermUserPermissao;

    Q.ExecSQL;
  finally
    Q.Free;
  end;
end;

procedure TUsuarioRepository.EditarUsuario(AUsuarioModel: TUsuarioModel);
var
  Q: TFDQuery;
  SQL: string;
begin
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := DataModule2.FDConnection;

    // Se a senha foi alterada, incluir no UPDATE
    if AUsuarioModel.SenhaHash <> '' then
    begin
      SQL :=
        'UPDATE usuarios SET ' +
        '  nome = :nome, cpf = :cpf, rg = :rg, telefone = :telefone, ' +
        '  data_nascimento = :data_nascimento, funcao = :funcao, senha = :senha, ' +
        '  perm_cadastros = :perm_cadastros, perm_cad_empresa = :perm_cad_empresa, ' +
        '  perm_cad_predio = :perm_cad_predio, perm_cad_sala = :perm_cad_sala, ' +
        '  perm_cad_patrimonio = :perm_cad_patrimonio, ' +
        '  perm_movimentacoes = :perm_movimentacoes, perm_mov_analisar = :perm_mov_analisar, ' +
        '  perm_mov_adicionar = :perm_mov_adicionar, perm_mov_excluir = :perm_mov_excluir, ' +
        '  perm_ocorrencias = :perm_ocorrencias, perm_ocor_analisar = :perm_ocor_analisar, ' +
        '  perm_ocor_adicionar = :perm_ocor_adicionar, perm_ocor_excluir = :perm_ocor_excluir, ' +
        '  perm_usuarios = :perm_usuarios, perm_user_cadastrar = :perm_user_cadastrar, ' +
        '  perm_user_permissao = :perm_user_permissao ' +
        'WHERE id = :id';
    end
    else
    begin
      SQL :=
        'UPDATE usuarios SET ' +
        '  nome = :nome, cpf = :cpf, rg = :rg, telefone = :telefone, ' +
        '  data_nascimento = :data_nascimento, funcao = :funcao, ' +
        '  perm_cadastros = :perm_cadastros, perm_cad_empresa = :perm_cad_empresa, ' +
        '  perm_cad_predio = :perm_cad_predio, perm_cad_sala = :perm_cad_sala, ' +
        '  perm_cad_patrimonio = :perm_cad_patrimonio, ' +
        '  perm_movimentacoes = :perm_movimentacoes, perm_mov_analisar = :perm_mov_analisar, ' +
        '  perm_mov_adicionar = :perm_mov_adicionar, perm_mov_excluir = :perm_mov_excluir, ' +
        '  perm_ocorrencias = :perm_ocorrencias, perm_ocor_analisar = :perm_ocor_analisar, ' +
        '  perm_ocor_adicionar = :perm_ocor_adicionar, perm_ocor_excluir = :perm_ocor_excluir, ' +
        '  perm_usuarios = :perm_usuarios, perm_user_cadastrar = :perm_user_cadastrar, ' +
        '  perm_user_permissao = :perm_user_permissao ' +
        'WHERE id = :id';
    end;

    Q.SQL.Text := SQL;

    Q.ParamByName('nome').AsString := AUsuarioModel.Nome;
    Q.ParamByName('cpf').AsString := AUsuarioModel.Cpf;
    Q.ParamByName('rg').AsString := AUsuarioModel.Rg;
    Q.ParamByName('telefone').AsString := AUsuarioModel.Telefone;
    Q.ParamByName('data_nascimento').AsDate := AUsuarioModel.DataNascimento;
    Q.ParamByName('funcao').AsString := AUsuarioModel.Funcao;

    if AUsuarioModel.SenhaHash <> '' then
      Q.ParamByName('senha').AsString := AUsuarioModel.SenhaHash;

    Q.ParamByName('perm_cadastros').AsBoolean := AUsuarioModel.PermCadastros;
    Q.ParamByName('perm_cad_empresa').AsBoolean := AUsuarioModel.PermCadEmpresa;
    Q.ParamByName('perm_cad_predio').AsBoolean := AUsuarioModel.PermCadPredio;
    Q.ParamByName('perm_cad_sala').AsBoolean := AUsuarioModel.PermCadSala;
    Q.ParamByName('perm_cad_patrimonio').AsBoolean := AUsuarioModel.PermCadPatrimonio;

    Q.ParamByName('perm_movimentacoes').AsBoolean := AUsuarioModel.PermMovimentacoes;
    Q.ParamByName('perm_mov_analisar').AsBoolean := AUsuarioModel.PermMovAnalisar;
    Q.ParamByName('perm_mov_adicionar').AsBoolean := AUsuarioModel.PermMovAdicionar;
    Q.ParamByName('perm_mov_excluir').AsBoolean := AUsuarioModel.PermMovExcluir;

    Q.ParamByName('perm_ocorrencias').AsBoolean := AUsuarioModel.PermOcorrencias;
    Q.ParamByName('perm_ocor_analisar').AsBoolean := AUsuarioModel.PermOcorAnalisar;
    Q.ParamByName('perm_ocor_adicionar').AsBoolean := AUsuarioModel.PermOcorAdicionar;
    Q.ParamByName('perm_ocor_excluir').AsBoolean := AUsuarioModel.PermOcorExcluir;

    Q.ParamByName('perm_usuarios').AsBoolean := AUsuarioModel.PermUsuarios;
    Q.ParamByName('perm_user_cadastrar').AsBoolean := AUsuarioModel.PermUserCadastrar;
    Q.ParamByName('perm_user_permissao').AsBoolean := AUsuarioModel.PermUserPermissao;

    Q.ParamByName('id').AsInteger := AUsuarioModel.Id;

    Q.ExecSQL;
  finally
    Q.Free;
  end;
end;

procedure TUsuarioRepository.ExcluirUsuario(AId: Integer);
var
  Q: TFDQuery;
begin
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := DataModule2.FDConnection;
    Q.SQL.Text := 'UPDATE usuarios SET ativo = false WHERE id = :id';
    Q.ParamByName('id').AsInteger := AId;
    Q.ExecSQL;
  finally
    Q.Free;
  end;
end;

function TUsuarioRepository.ListarUsuarios: TDataSet;
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  Query.Connection := DataModule2.FDConnection;

  Query.SQL.Text :=
    'SELECT ' +
    '  id, nome, cpf, rg, telefone, data_nascimento, funcao ' +
    'FROM usuarios ' +
    'WHERE ativo = true ' +
    'ORDER BY nome';

  Query.Open;
  Result := Query;
end;

function TUsuarioRepository.PesquisarUsuario(const ASearch: String): TDataSet;
var
  Q: TFDQuery;
begin
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := DataModule2.FDConnection;
    Q.SQL.Text :=
      'SELECT ' +
      '  id, nome, cpf, rg, telefone, data_nascimento, funcao ' +
      'FROM usuarios ' +
      'WHERE ativo = true ' +
      '  AND (nome ILIKE :search ' +
      '       OR cpf ILIKE :search ' +
      '       OR funcao ILIKE :search) ' +
      'ORDER BY nome';
    Q.ParamByName('search').AsString := '%' + Trim(ASearch) + '%';
    Q.Open;
    Result := Q;
  except
    Q.Free;
    raise;
  end;
end;

function TUsuarioRepository.ObterPermissoes(AIdUsuario: Integer): TUsuarioModel;
var
  Q: TFDQuery;
  Usuario: TUsuarioModel;
begin
  Usuario := TUsuarioModel.Create;
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := DataModule2.FDConnection;
    Q.SQL.Text :=
      'SELECT * FROM usuarios WHERE id = :id AND ativo = true';

    Q.ParamByName('id').AsInteger := AIdUsuario;
    Q.Open;

    if not Q.IsEmpty then
    begin
      // *** IMPORTANTE: Preenche o ID ***
      Usuario.Id := Q.FieldByName('id').AsInteger;
      Usuario.Nome := Q.FieldByName('nome').AsString;
      Usuario.Cpf := Q.FieldByName('cpf').AsString;
      Usuario.Rg := Q.FieldByName('rg').AsString;
      Usuario.Telefone := Q.FieldByName('telefone').AsString;
      Usuario.DataNascimento := Q.FieldByName('data_nascimento').AsDateTime;
      Usuario.Funcao := Q.FieldByName('funcao').AsString;

      // Permiss�es - Cadastros
      Usuario.PermCadastros := Q.FieldByName('perm_cadastros').AsBoolean;
      Usuario.PermCadEmpresa:= Q.FieldByName('perm_cad_empresa').AsBoolean;
      Usuario.PermCadSala := Q.FieldByName('perm_cad_sala').AsBoolean;
      Usuario.PermCadPatrimonio := Q.FieldByName('perm_cad_patrimonio').AsBoolean;
      Usuario.PermCadPredio:= Q.FieldByName('perm_cad_predio').AsBoolean;

      // Permiss�es - Movimenta��es
      Usuario.PermMovimentacoes := Q.FieldByName('perm_movimentacoes').AsBoolean;
      Usuario.PermMovAnalisar := Q.FieldByName('perm_mov_analisar').AsBoolean;
      Usuario.PermMovAdicionar := Q.FieldByName('perm_mov_adicionar').AsBoolean;
      Usuario.PermMovExcluir := Q.FieldByName('perm_mov_excluir').AsBoolean;


      // Permiss�es - Ocorr�ncias
      Usuario.PermOcorrencias:= Q.FieldByName('perm_ocorrencias').AsBoolean;
      Usuario.PermOcorAnalisar := Q.FieldByName('perm_ocor_analisar').AsBoolean;
      Usuario.PermOcorAdicionar := Q.FieldByName('perm_ocor_adicionar').AsBoolean;
      Usuario.PermOcorExcluir := Q.FieldByName('perm_ocor_excluir').AsBoolean;

      // Permiss�es - Usu�rios
      Usuario.PermUsuarios := Q.FieldByName('perm_usuarios').AsBoolean;
      Usuario.PermUserCadastrar := Q.FieldByName('perm_user_cadastrar').AsBoolean;
      Usuario.PermUserPermissao := Q.FieldByName('perm_user_permissao').AsBoolean;
    end
    else
    begin
      // Se n�o encontrou o usu�rio, libera e retorna nil
      Usuario.Free;
      Usuario := nil;
    end;

    Result := Usuario;
  finally
    Q.Free;
  end;
end;

end.
