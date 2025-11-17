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

  // Novos m�todos para importa��o
  function NumeroSerieExiste(const NumeroSerie: string): Boolean;
  function GetNomePatrimonioById(AId: Integer): string;
  procedure ImportarPatrimonios(const Itens: TArray<TPatrimonioDTO>;
    var TotalImportados, TotalErros: Integer; Erros: TStringList);
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
    Q.ParamByName('valor_aquisicao').AsCurrency := APatrimonioModel.ValorAquisicao;
    Q.ParamByName('valor_atual').AsCurrency:= APatrimonioModel.ValorAtual;
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
    Q.ParamByName('valor_aquisicao').AsCurrency := APatrimonioModel.ValorAquisicao;
    Q.ParamByName('valor_atual').AsCurrency := APatrimonioModel.ValorAtual;
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

function TPatrimonioRepository.NumeroSerieExiste(const NumeroSerie: string): Boolean;
var
  Q: TFDQuery;
begin
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := DataModule2.FDConnection;
    Q.SQL.Text := 'SELECT COUNT(*) as Total FROM patrimonios WHERE numero_serie = :numero_serie';
    Q.ParamByName('numero_serie').AsString := NumeroSerie;
    Q.Open;
    Result := Q.FieldByName('Total').AsInteger > 0;
  finally
    Q.Free;
  end;
end;

function TPatrimonioRepository.GetNomePatrimonioById(AId: Integer): string;
var
  Q: TFDQuery;
begin
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := DataModule2.FDConnection;
    Q.SQL.Text := 'SELECT nome FROM patrimonios WHERE id = :id AND ativo = true';
    Q.ParamByName('id').AsInteger := AId;
    Q.Open;

    if not Q.Eof then
      Result := Q.FieldByName('nome').AsString
    else
      Result := '';
  finally
    Q.Free;
  end;
end;

procedure TPatrimonioRepository.ImportarPatrimonios(const Itens: TArray<TPatrimonioDTO>;
  var TotalImportados, TotalErros: Integer; Erros: TStringList);
var
  Q: TFDQuery;
  i: Integer;
  Item: TPatrimonioDTO;
begin
  TotalImportados := 0;
  TotalErros := 0;

  Q := TFDQuery.Create(nil);
  try
    Q.Connection := DataModule2.FDConnection;
    Q.SQL.Text :=
      'INSERT INTO patrimonios (nome, tipo, situacao, modelo, valor_aquisicao, ' +
      'valor_atual, quantidade, data_aquisicao, numero_serie, fk_id_salas) ' +
      'VALUES (:nome, :tipo, :situacao, :modelo, :valor_aquisicao, ' +
      ':valor_atual, :quantidade, :data_aquisicao, :numero_serie, :fk_id_salas)';

    DataModule2.FDConnection.StartTransaction;
    try
      for i := 0 to High(Itens) do
      begin
        Item := Itens[i];

        try
          // Verifica se n�mero de s�rie j� existe
          if NumeroSerieExiste(Item.FNumeroSerie) then
          begin
            Erros.Add(Format('Item %d: N�mero de s�rie %s j� existe no sistema',
              [i + 1, Item.FNumeroSerie]));
            Inc(TotalErros);
            Continue;
          end;

          Q.ParamByName('nome').AsString := Item.FNome;
          Q.ParamByName('tipo').AsString := Item.FTipo;
          Q.ParamByName('situacao').AsString := Item.FSituacao;
          Q.ParamByName('modelo').AsString := Item.FModelo;
          Q.ParamByName('valor_aquisicao').AsCurrency := Item.FValorAquisicao;
          Q.ParamByName('valor_atual').AsCurrency := Item.FValorAtual;
          Q.ParamByName('quantidade').AsInteger := Item.FQuantidade;
          Q.ParamByName('data_aquisicao').AsDate := Item.FDataAquisicao;
          Q.ParamByName('numero_serie').AsString := Item.FNumeroSerie;
          Q.ParamByName('fk_id_salas').AsInteger := Item.FIdSala;

          Q.ExecSQL;
          Inc(TotalImportados);

        except
          on E: Exception do
          begin
            Erros.Add(Format('Item %d: Erro ao importar - %s', [i + 1, E.Message]));
            Inc(TotalErros);
          end;
        end;
      end;

      DataModule2.FDConnection.Commit;

    except
      on E: Exception do
      begin
        DataModule2.FDConnection.Rollback;
        Erros.Add('Erro geral na importa��o: ' + E.Message);
        raise;
      end;
    end;
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
