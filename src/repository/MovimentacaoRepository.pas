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
    function ListarPatrimonios: TStringList;
    function ListarSalas: TStringList;
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
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := DataModule2.FDConnection;
    Q.SQL.Text :=
      'INSERT INTO movimentacoes (fk_id_patrimonios, fk_id_origem, fk_id_destino, ' +
      'quantidade, status, fk_id_usuarios, data_movimentacao) ' +
      'VALUES (:fk_id_patrimonios, :fk_id_origem, :fk_id_destino, :quantidade, :status, :fk_id_usuarios, :data_movimentacao)';

    Q.ParamByName('fk_id_patrimonios').AsInteger := AMovimentacaoModel.IdPatrimonio;
    Q.ParamByName('fk_id_origem').AsInteger := AMovimentacaoModel.IdOrigem;
    Q.ParamByName('fk_id_destino').AsInteger := AMovimentacaoModel.IdDestino;
    Q.ParamByName('quantidade').AsInteger := AMovimentacaoModel.Quantidade;
    Q.ParamByName('status').AsString := AMovimentacaoModel.Status;
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
      'fk_id_bens = :fk_id_bens, ' +
      'fk_id_origem = :fk_id_origem, ' +
      'fk_id_destino = :fk_id_destino, ' +
      'quantidade = :quantidade, ' +
      'status = :status, ' +
      'fk_id_usuarios = :fk_id_usuarios, ' +
      'data_movimentacao = :data_movimentacao ' +
      'WHERE id = :id';

    Q.ParamByName('fk_id_bens').AsInteger := AMovimentacaoModel.IdPatrimonio;
    Q.ParamByName('fk_id_origem').AsInteger := AMovimentacaoModel.IdOrigem;
    Q.ParamByName('fk_id_destino').AsInteger := AMovimentacaoModel.IdDestino;
    Q.ParamByName('quantidade').AsInteger := AMovimentacaoModel.Quantidade;
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
    '  u.nome AS usuario, ' +
    '  p.nome AS bens, ' +
    '  so.nome AS sala_origem, ' +
    '  sd.nome AS sala_destino, ' +
    '  m.quantidade, ' +
    '  m.status, ' +
    '  m.fk_id_patrimonio, ' +
    '  m.fk_id_origem, ' +
    '  m.fk_id_destino, ' +
    '  m.fk_id_usuarios ' +
    'FROM movimentacoes m ' +
    'INNER JOIN usuarios u ON m.fk_id_usuarios = u.id ' +
    'INNER JOIN patrimonios p ON m.fk_id_bens = p.id ' +
    'INNER JOIN salas so ON m.fk_id_origem = so.id ' +
    'INNER JOIN salas sd ON m.fk_id_destino = sd.id ' +
    'WHERE m.ativo = true ' +
    'ORDER BY m.data_movimentacao DESC, m.id DESC';

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
      '  p.nome AS bens, ' +
      '  so.nome AS sala_origem, ' +
      '  sd.nome AS sala_destino, ' +
      '  m.quantidade, ' +
      '  m.status, ' +
      '  m.fk_id_patrimonio, ' +
      '  m.fk_id_origem, ' +
      '  m.fk_id_destino, ' +
      '  m.fk_id_usuarios ' +
      'FROM movimentacoes m ' +
      'INNER JOIN usuarios u ON m.fk_id_usuarios = u.id ' +
      'INNER JOIN patrimonios p ON m.fk_id_bens = p.id ' +
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

    // Verificar se conexão está ativa
    if not Query.Connection.Connected then
      raise Exception.Create('Banco de dados não está conectado!');

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

end.
