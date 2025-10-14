unit PatrimonioRepository;

interface

uses
PatrimonioDTO, PatrimonioModel, DB, FireDAC.Comp.Client, Data.DB,
System.SysUtils, System.Classes;

Type
TPatrimonioRepository = class
public
  procedure AdicionarPatrimonio(APatrimonioModel: TPatrimonioConfig);
  procedure ExcluirPatrimonio(AId: Integer);
  procedure EditarPatrimonio(APatrimonioModel: TPatrimonioConfig);
  function ListarNomesSalas: TStringList;
  function ListarPatrimonio: TDataSet;
  function PesquisarPatrimonio(const aSearch: String): TDataSet;
end;

var
FPatrimonioRepository: TPatrimonioRepository;

implementation

{ TPatrimonioRepository }

procedure TPatrimonioRepository.AdicionarPatrimonio(APatrimonioModel: TPatrimonioConfig);
var
  Q: TFDQuery;
begin
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := DataModule2.FDConnection;
    Q.SQL.Text :=
      'INSERT INTO patrimonios (nome, tipo, situacao, modelo, valor_aquisicao, ' +
      'valor_atual, quantidade, data_aquisicao, numero_serie, fk_id_salas) ' +
      'VALUES (:nome, :tipo, :situacao, :modelo, :valor_aquisicao, ' +
      ':valor_atual, :quantidade, :data_aquisicao, :numero_serie, :fk_id_salas)';

    Q.ParamByName('nome').AsString := APatrimonioModel.Nome;
    Q.ParamByName('tipo').AsString := APatrimonioModel.Tipo;
    Q.ParamByName('situacao').AsString := APatrimonioModel.Situacao;
    Q.ParamByName('modelo').AsString := APatrimonioModel.Modelo;
    Q.ParamByName('valor_aquisicao').AsFloat := APatrimonioModel.ValorAquisicao;
    Q.ParamByName('valor_atual').AsFloat := APatrimonioModel.ValorAtual;
    Q.ParamByName('quantidade').AsInteger := APatrimonioModel.Quantidade;
    Q.ParamByName('data_aquisicao').AsDate := APatrimonioModel.DataAquisicao;
    Q.ParamByName('numero_serie').AsString := APatrimonioModel.NumeroSerie;
    Q.ParamByName('fk_id_salas').AsInteger := APatrimonioModel.IdSala;

    Q.ExecSQL;
    Q.Close;
  finally
    Q.Free;
  end;
end;

procedure TPatrimonioRepository.EditarPatrimonio(APatrimonioModel: TPatrimonioConfig);
var
  Q: TFDQuery;
begin
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := DataModule2.FDConnection;
    Q.SQL.Text :=
      'UPDATE patrimonios SET ' +
      'nome = :nome, tipo = :tipo, situacao = :situacao, modelo = :modelo, ' +
      'valor_aquisicao = :valor_aquisicao, valor_atual = :valor_atual, ' +
      'quantidade = :quantidade, data_aquisicao = :data_aquisicao, ' +
      'numero_serie = :numero_serie, fk_id_salas = :fk_id_salas ' +
      'WHERE id = :id';

    Q.ParamByName('nome').AsString := APatrimonioModel.Nome;
    Q.ParamByName('tipo').AsString := APatrimonioModel.Tipo;
    Q.ParamByName('situacao').AsString := APatrimonioModel.Situacao;
    Q.ParamByName('modelo').AsString := APatrimonioModel.Modelo;
    Q.ParamByName('valor_aquisicao').AsFloat := APatrimonioModel.ValorAquisicao;
    Q.ParamByName('valor_atual').AsFloat := APatrimonioModel.ValorAtual;
    Q.ParamByName('quantidade').AsInteger := APatrimonioModel.Quantidade;
    Q.ParamByName('data_aquisicao').AsDate := APatrimonioModel.DataAquisicao;
    Q.ParamByName('numero_serie').AsString := APatrimonioModel.NumeroSerie;
    Q.ParamByName('fk_id_salas').AsInteger := APatrimonioModel.IdSala;
    Q.ParamByName('id').AsInteger := APatrimonioModel.Id;

    Q.ExecSQL;
    Q.Close;
  finally
    Q.Free;
  end;
end;

procedure TPatrimonioRepository.ExcluirPatrimonio(AId: Integer);
var
  Q: TFDQuery;
begin
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := DataModule2.FDConnection;
    Q.SQL.Text := 'UPDATE patrimonios SET ativo = false WHERE id = :id';
    Q.ParamByName('id').AsInteger := AId;
    Q.ExecSQL;
    Q.Close;
  finally
    Q.Free;
  end;
end;

function TPatrimonioRepository.ListarNomesSalas: TStringList;
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

function TPatrimonioRepository.ListarPatrimonio: TDataSet;
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  Query.Connection := DataModule2.FDConnection;

  Query.SQL.Text :=
    'SELECT ' +
    '  p.id, ' +
    '  p.nome, ' +
    '  p.tipo, ' +
    '  p.situacao, ' +
    '  p.modelo, ' +
    '  p.valor_aquisicao, ' +
    '  p.valor_atual, ' +
    '  p.quantidade, ' +
    '  p.data_aquisicao, ' +
    '  p.numero_serie, ' +
    '  s.nome AS nome_sala, ' +
    '  p.fk_id_salas ' +
    'FROM patrimonios p ' +
    'INNER JOIN salas s ON p.fk_id_salas = s.id ' +
    'WHERE p.ativo = true ' +
    'ORDER BY p.id';

  Query.Open;
  Result := Query;
end;

function TPatrimonioRepository.PesquisarPatrimonio(const aSearch: String): TDataSet;
var
  Q: TFDQuery;
begin
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := DataModule2.FDConnection;
    Q.SQL.Text :=
      'SELECT ' +
      '  p.id, ' +
      '  p.nome, ' +
      '  p.tipo, ' +
      '  p.situacao, ' +
      '  p.modelo, ' +
      '  p.valor_aquisicao, ' +
      '  p.valor_atual, ' +
      '  p.quantidade, ' +
      '  p.data_aquisicao, ' +
      '  p.numero_serie, ' +
      '  s.nome AS nome_sala, ' +
      '  p.fk_id_salas ' +
      'FROM patrimonios p ' +
      'INNER JOIN salas s ON p.fk_id_salas = s.id ' +
      'WHERE p.ativo = true ' +
      '  AND (p.nome ILIKE :search ' +
      '       OR p.tipo ILIKE :search ' +
      '       OR p.situacao ILIKE :search ' +
      '       OR p.modelo ILIKE :search ' +
      '       OR p.numero_serie ILIKE :search) ' +
      'ORDER BY p.id';

    Q.ParamByName('search').AsString := '%' + Trim(aSearch) + '%';
    Q.Open;
    Result := Q;
  except
    Q.Free;
    raise;
  end;
end;

end.
