unit MovimentacaoRepository;

interface

uses
  MovimentacaoModel, DB, FireDAC.Comp.Client, Data.DB, System.SysUtils,
  System.Classes;

type
  TMovimentacaoRepository = class
  public
    procedure AdicionarMovimentacao(AMovimentacaoModel: TMovimentacaoConfig);
    procedure ExcluirMovimentacao(AId: Integer);
    procedure EditarMovimentacao(AMovimentacaoModel: TMovimentacaoConfig);
    function ListarMovimentacoes: TDataSet;
    function PesquisarMovimentacao(const aSearch: String): TDataSet;
    function ListarSalasDoPatrimonio(AIdPatrimonio: Integer): TStringList;
    function ListarPatrimonios: TStringList;
    function ListarSalas: TStringList;
    function ObterLocalizacaoAtualPatrimonio(AIdPatrimonio: Integer): String;
  end;

var
  FMovimentacaoRepository: TMovimentacaoRepository;

implementation

{ TMovimentacaoRepository }

procedure TMovimentacaoRepository.AdicionarMovimentacao(
  AMovimentacaoModel: TMovimentacaoConfig);
var
  Q: TFDQuery;
begin
  // Validação antes de inserir no banco
  if AMovimentacaoModel.IdUsuario <= 0 then
    raise Exception.Create('ID de usuário inválido: ' + IntToStr(AMovimentacaoModel.IdUsuario));

  Q := TFDQuery.Create(nil);
  try
    Q.Connection := DataModule2.FDConnection;
    Q.SQL.Text :=
      'INSERT INTO movimentacoes (fk_id_patrimonios, fk_id_origem, fk_id_destino, ' +
      'quantidade, fk_id_usuarios, data_movimentacao) ' +
      'VALUES (:fk_id_patrimonios, :fk_id_origem, :fk_id_destino, :quantidade, :fk_id_usuarios, :data_movimentacao)';

    Q.ParamByName('fk_id_patrimonios').AsInteger := AMovimentacaoModel.IdPatrimonio;
    Q.ParamByName('fk_id_origem').AsInteger := AMovimentacaoModel.IdOrigem;
    Q.ParamByName('fk_id_destino').AsInteger := AMovimentacaoModel.IdDestino;
    Q.ParamByName('quantidade').AsInteger := 1;
    Q.ParamByName('fk_id_usuarios').AsInteger := AMovimentacaoModel.IdUsuario;
    Q.ParamByName('data_movimentacao').AsDateTime := AMovimentacaoModel.DataMovimentacao;

    Q.ExecSQL;
    Q.Close;
  finally
    Q.Free;
  end;
end;

procedure TMovimentacaoRepository.EditarMovimentacao(
  AMovimentacaoModel: TMovimentacaoConfig);
var
  Q: TFDQuery;
begin
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := DataModule2.FDConnection;
    Q.SQL.Text :=
      'UPDATE movimentacoes SET ' +
      'fk_id_patrimonios = :fk_id_patrimonios, ' +
      'fk_id_origem = :fk_id_origem, ' +
      'fk_id_destino = :fk_id_destino, ' +
      'quantidade = :quantidade, ' +
      'status = :status, ' +
      'fk_id_usuarios = :fk_id_usuarios, ' +
      'data_movimentacao = :data_movimentacao ' +
      'WHERE id = :id';

    Q.ParamByName('fk_id_patrimonios').AsInteger := AMovimentacaoModel.IdPatrimonio;
    Q.ParamByName('fk_id_origem').AsInteger := AMovimentacaoModel.IdOrigem;
    Q.ParamByName('fk_id_destino').AsInteger := AMovimentacaoModel.IdDestino;
    Q.ParamByName('quantidade').AsInteger := 1;
    Q.ParamByName('status').AsString := AMovimentacaoModel.Status;
    Q.ParamByName('fk_id_usuarios').AsInteger := AMovimentacaoModel.IdUsuario;
    Q.ParamByName('data_movimentacao').AsDateTime := AMovimentacaoModel.DataMovimentacao;
    Q.ParamByName('id').AsInteger := AMovimentacaoModel.Id;

    Q.ExecSQL;
    Q.Close;
  finally
    Q.Free;
  end;
end;

procedure TMovimentacaoRepository.ExcluirMovimentacao(AId: Integer);
var
  Q: TFDQuery;
begin
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := DataModule2.FDConnection;
    Q.SQL.Text := 'UPDATE movimentacoes SET ativo = false WHERE id = :id';
    Q.ParamByName('id').AsInteger := AId;
    Q.ExecSQL;
    Q.Close;
  finally
    Q.Free;
  end;
end;

function TMovimentacaoRepository.ListarMovimentacoes: TDataSet;
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  Query.Connection := DataModule2.FDConnection;

Query.SQL.Text :=
  'SELECT ' +
  '  m.id, ' +
  '  m.data_movimentacao, ' +
  '  u.nome AS usuario, ' +              // ? MOSTRA O NOME
  '  p.nome AS patrimonio, ' +            // ? MOSTRA O NOME
  '  so.nome AS sala_origem, ' +          // ? MOSTRA O NOME
  '  sd.nome AS sala_destino, ' +         // ? MOSTRA O NOME
  '  1 as quantidade, ' +
  '  m.status, ' +
  '  m.fk_id_patrimonios, ' +             // ? SALVA O ID (oculto)
  '  m.fk_id_origem, ' +                  // ? SALVA O ID (oculto)
  '  m.fk_id_destino, ' +                 // ? SALVA O ID (oculto)
  '  m.fk_id_usuarios ' +                 // ? SALVA O ID (oculto)
  'FROM movimentacoes m ' +
  'INNER JOIN usuarios u ON m.fk_id_usuarios = u.id ' +
  'INNER JOIN patrimonios p ON m.fk_id_patrimonios = p.id ' +
  'INNER JOIN salas so ON m.fk_id_origem = so.id ' +
  'INNER JOIN salas sd ON m.fk_id_destino = sd.id ' +
  'WHERE m.status = ''Pendente'' AND m.ativo = true';

  Query.Open;
  Result := Query;
end;

function TMovimentacaoRepository.PesquisarMovimentacao(
  const aSearch: String): TDataSet;
var
  Q: TFDQuery;
begin
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := DataModule2.FDConnection;
    Q.SQL.Text :=
      'SELECT ' +
      '  m.id, ' +
      '  m.data_movimentacao, ' +
      '  u.nome AS usuario, ' +
      '  p.nome AS patrimonio, ' +
      '  so.nome AS sala_origem, ' +
      '  sd.nome AS sala_destino, ' +
      '  1 as quantidade, ' +
      '  m.status, ' +
      '  m.fk_id_patrimonios, ' +
      '  m.fk_id_origem, ' +
      '  m.fk_id_destino, ' +
      '  m.fk_id_usuarios ' +
      'FROM movimentacoes m ' +
      'INNER JOIN usuarios u ON m.fk_id_usuarios = u.id ' +
      'INNER JOIN patrimonios p ON m.fk_id_patrimonios = p.id ' +
      'INNER JOIN salas so ON m.fk_id_origem = so.id ' +
      'INNER JOIN salas sd ON m.fk_id_destino = sd.id ' +
      'WHERE m.ativo = true ' +
      '  AND (p.nome ILIKE :search ' +
      '       OR u.nome ILIKE :search ' +
      '       OR so.nome ILIKE :search ' +
      '       OR sd.nome ILIKE :search ' +
      '       OR m.status ILIKE :search) ' +
      'ORDER BY m.data_movimentacao DESC, m.id DESC';
    Q.ParamByName('search').AsString := '%' + Trim(aSearch) + '%';
    Q.Open;
    Result := Q;
  except
    Q.Free;
    raise;
  end;
end;

function TMovimentacaoRepository.ListarPatrimonios: TStringList;
var
  Query: TFDQuery;
  ID: Integer;
begin
  Result := TStringList.Create;
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := DataModule2.FDConnection;

    Query.SQL.Text := 'SELECT id, nome FROM patrimonios WHERE ativo = true ORDER BY nome';

    try
      Query.Open;

      if Query.IsEmpty then
        raise Exception.Create('Nenhum patrimônio encontrado na tabela!');

      while not Query.Eof do
      begin
        Result.Add(Query.FieldByName('nome').AsString);
        ID := Query.FieldByName('id').AsInteger;
        Result.Objects[Result.Count - 1] := Pointer(ID);
        Query.Next;
      end;

    except
      on E: Exception do
      begin
        Result.Free;
        raise Exception.Create('Erro ao buscar patrimônios: ' + E.Message);
      end;
    end;
  finally
    Query.Free;
  end;
end;

function TMovimentacaoRepository.ListarSalas: TStringList;
var
  Query: TFDQuery;
  ID: Integer;
begin
  Result := TStringList.Create;
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := DataModule2.FDConnection;
    Query.SQL.Text := 'SELECT id, nome FROM salas WHERE ativo = true ORDER BY nome';
    Query.Open;

    while not Query.Eof do
    begin
      Result.Add(Query.FieldByName('nome').AsString);
      ID := Query.FieldByName('id').AsInteger;
      Result.Objects[Result.Count - 1] := Pointer(ID);
      Query.Next;
    end;
  finally
    Query.Free;
  end;
end;

function TMovimentacaoRepository.ListarSalasDoPatrimonio(
  AIdPatrimonio: Integer): TStringList;
var
  Query: TFDQuery;
  SalaID: Integer;
  SalaNome: string;
begin
  Result := TStringList.Create;
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := DataModule2.FDConnection;

    // Tenta obter a ÚLTIMA sala destino do patrimônio (última movimentação)
    Query.SQL.Text :=
      'SELECT s.id, s.nome ' +
      'FROM movimentacoes m ' +
      'INNER JOIN salas s ON s.id = m.fk_id_destino ' +
      'WHERE m.fk_id_patrimonios = :IdPatrimonio ' +
      'ORDER BY m.data_movimentacao DESC, m.id DESC ' +
      'LIMIT 1';

    Query.ParamByName('IdPatrimonio').AsInteger := AIdPatrimonio;
    Query.Open;

    if not Query.IsEmpty then
    begin
      SalaID := Query.FieldByName('id').AsInteger;
      SalaNome := Query.FieldByName('nome').AsString;
    end
    else
    begin
      // Caso o patrimônio nunca tenha sido movimentado, busca a sala atual do cadastro
      Query.Close;
      Query.SQL.Text :=
        'SELECT s.id, s.nome ' +
        'FROM patrimonios p ' +
        'INNER JOIN salas s ON s.id = p.fk_id_salas ' + // 👈 CORRIGIDO AQUI
        'WHERE p.id = :IdPatrimonio';
      Query.ParamByName('IdPatrimonio').AsInteger := AIdPatrimonio;
      Query.Open;

      if not Query.IsEmpty then
      begin
        SalaID := Query.FieldByName('id').AsInteger;
        SalaNome := Query.FieldByName('nome').AsString;
      end
      else
      begin
        // Caso não tenha nenhuma sala cadastrada
        SalaID := 0;
        SalaNome := 'Sem Localização';
      end;
    end;

    // Adiciona APENAS a sala atual do patrimônio
    Result.AddObject(SalaNome, TObject(SalaID));

  finally
    Query.Free;
  end;
end;

function TMovimentacaoRepository.ObterLocalizacaoAtualPatrimonio(AIdPatrimonio: Integer): String;
var
  Query: TFDQuery;
begin
  Result := 'Sem localização definida';
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := DataModule2.FDConnection;

    // Primeiro verifica se há movimentações para o patrimônio
    Query.SQL.Text :=
      'SELECT s.nome ' +
      'FROM movimentacoes m ' +
      'INNER JOIN salas s ON s.id = m.fk_id_destino ' +
      'WHERE m.fk_id_patrimonios = :IdPatrimonio ' +
      'ORDER BY m.data_movimentacao DESC, m.id DESC ' +
      'LIMIT 1';

    Query.ParamByName('IdPatrimonio').AsInteger := AIdPatrimonio;
    Query.Open;

    if not Query.IsEmpty then
    begin
      Result := Query.FieldByName('nome').AsString;
    end
    else
    begin
      // Caso não tenha movimentações, busca a sala do cadastro do patrimônio
      Query.Close;
      Query.SQL.Text :=
        'SELECT s.nome ' +
        'FROM patrimonios p ' +
        'INNER JOIN salas s ON s.id = p.fk_id_salas ' +
        'WHERE p.id = :IdPatrimonio';

      Query.ParamByName('IdPatrimonio').AsInteger := AIdPatrimonio;
      Query.Open;

      if not Query.IsEmpty then
        Result := Query.FieldByName('nome').AsString
      else
        Result := 'Sem localização definida';
    end;
  finally
    Query.Free;
  end;
end;

end.
