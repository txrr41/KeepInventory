unit RelatorioDepreciacaoRepository;

interface

uses
  System.SysUtils, System.Generics.Collections, FireDAC.Comp.Client,
  FireDAC.Stan.Param, OcorrenciaModel, RelatorioDepreciacaoItemModel, Data.DB, System.Classes;

type
  TRelatorioDepreciacaoRepository = class
  private
    FConnection: TFDConnection;
  public
    constructor Create(AConnection: TFDConnection);
    function ObterOcorrenciasDepreciacao(ADataInicio, ADataFim: TDate;
      const ATipoOcorrencia: string): TObjectList<TRelatorioDepreciacaoItemModel>;
    function ObterTiposOcorrencia: TStringList;
    procedure PreencherQueryRelatorio(AQuery: TFDQuery; ADataInicio, ADataFim: TDate;
      const ATipoOcorrencia: string);
      function ObterMaiorImpacto(ADataInicio, ADataFim: TDate;
      const ATipoOcorrencia: string): TMaiorImpactoDTO;
  end;

implementation

constructor TRelatorioDepreciacaoRepository.Create(AConnection: TFDConnection);
begin
  FConnection := AConnection;
end;

function TRelatorioDepreciacaoRepository.ObterMaiorImpacto(ADataInicio,
  ADataFim: TDate; const ATipoOcorrencia: string): TMaiorImpactoDTO;
var
  Query: TFDQuery;
  SQL: string;
begin
  // Inicializa com valores zerados
  Result.Nome := '';
  Result.TipoOcorrencia := '';
  Result.Valor := 0;
  Result.Percentual := 0;

  Query := TFDQuery.Create(nil);
  try
    Query.Connection := FConnection;

    SQL :=
      'SELECT ' +
      '  p.nome AS nome_patrimonio, ' +
      '  o.tipo_ocorrencia, ' +
      '  (o.valor_antes - o.valor_depois) AS valor_depreciado, ' +
      '  o.percentual_depreciacao ' +
      'FROM ocorrencias o ' +
      'INNER JOIN patrimonios p ON p.id = o.fk_id_patrimonios ' +
      'WHERE o.valor_antes > o.valor_depois ';

    // Filtros (mesma lógica da query principal)
    if ADataInicio > 0 then
      SQL := SQL + '  AND o.data_ocorrencia >= :data_inicio ';

    if ADataFim > 0 then
      SQL := SQL + '  AND o.data_ocorrencia <= :data_fim ';

    if Trim(ATipoOcorrencia) <> '' then
      SQL := SQL + '  AND o.tipo_ocorrencia = :tipo_ocorrencia ';

    // Ordena pelo maior valor e pega só o primeiro
    SQL := SQL + 'ORDER BY valor_depreciado DESC LIMIT 1';

    Query.SQL.Text := SQL;

    // Define parâmetros
    if ADataInicio > 0 then
      Query.ParamByName('data_inicio').AsDate := ADataInicio;

    if ADataFim > 0 then
      Query.ParamByName('data_fim').AsDate := ADataFim;

    if Trim(ATipoOcorrencia) <> '' then
      Query.ParamByName('tipo_ocorrencia').AsString := ATipoOcorrencia;

    Query.Open;

    // Preenche o resultado se houver dados
    if not Query.IsEmpty then
    begin
      Result.Nome := Query.FieldByName('nome_patrimonio').AsString;
      Result.TipoOcorrencia := Query.FieldByName('tipo_ocorrencia').AsString;
      Result.Valor := Query.FieldByName('valor_depreciado').AsCurrency;
      Result.Percentual := Query.FieldByName('percentual_depreciacao').AsCurrency;
    end;
  finally
    Query.Free;
  end;
end;

function TRelatorioDepreciacaoRepository.ObterOcorrenciasDepreciacao(
  ADataInicio, ADataFim: TDate;
  const ATipoOcorrencia: string): TObjectList<TRelatorioDepreciacaoItemModel>;
var
  Query: TFDQuery;
  Item: TRelatorioDepreciacaoItemModel;
  SQL: string;
begin
  Result := TObjectList<TRelatorioDepreciacaoItemModel>.Create;
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := FConnection;

    SQL :=
      'SELECT ' +
      '  p.nome AS nome_patrimonio, ' +
      '  p.tipo AS tipo_patrimonio, ' +
      '  p.modelo AS modelo_patrimonio, ' +
      '  p.situacao AS situacao_patrimonio, ' +
      '  o.tipo_ocorrencia, ' +
      '  o.gravidade, ' +
      '  o.valor_antes, ' +
      '  o.valor_depois, ' +
      '  (o.valor_antes - o.valor_depois) AS valor_depreciado, ' +
      '  o.percentual_depreciacao, ' +
      '  o.data_ocorrencia, ' +
      '  COALESCE(s.nome, ''Sem sala'') AS nome_sala, ' +
      '  COALESCE(pr.nome, ''Sem pr�dio'') AS nome_predio ' +
      'FROM ocorrencias o ' +
      'INNER JOIN patrimonios p ON p.id = o.fk_id_patrimonios ' +
      'LEFT JOIN salas s ON s.id = p.fk_id_salas ' +
      'LEFT JOIN predios pr ON pr.id = s.fk_id_predios ' +
      'WHERE o.valor_antes > o.valor_depois ';

    // Filtro por data
    if ADataInicio > 0 then
      SQL := SQL + '  AND o.data_ocorrencia >= :data_inicio ';

    if ADataFim > 0 then
      SQL := SQL + '  AND o.data_ocorrencia <= :data_fim ';

    // Filtro por tipo de ocorr�ncia
    if Trim(ATipoOcorrencia) <> '' then
      SQL := SQL + '  AND o.tipo_ocorrencia = :tipo_ocorrencia ';

    SQL := SQL + 'ORDER BY o.data_ocorrencia DESC, (o.valor_antes - o.valor_depois) DESC';

    Query.SQL.Text := SQL;

    // Define par�metros
    if ADataInicio > 0 then
      Query.ParamByName('data_inicio').AsDate := ADataInicio;

    if ADataFim > 0 then
      Query.ParamByName('data_fim').AsDate := ADataFim;

    if Trim(ATipoOcorrencia) <> '' then
      Query.ParamByName('tipo_ocorrencia').AsString := ATipoOcorrencia;

    Query.Open;

    // Popula a lista de objetos
    while not Query.Eof do
    begin
      Item := TRelatorioDepreciacaoItemModel.Create;
      Item.NomePatrimonio := Query.FieldByName('nome_patrimonio').AsString;
      Item.TipoPatrimonio := Query.FieldByName('tipo_patrimonio').AsString;
      Item.ModeloPatrimonio := Query.FieldByName('modelo_patrimonio').AsString;
      Item.SituacaoPatrimonio := Query.FieldByName('situacao_patrimonio').AsString;
      Item.TipoOcorrencia := Query.FieldByName('tipo_ocorrencia').AsString;
      Item.Gravidade := Query.FieldByName('gravidade').AsString;
      Item.ValorAntes := Query.FieldByName('valor_antes').AsCurrency;
      Item.ValorDepois := Query.FieldByName('valor_depois').AsCurrency;
      Item.ValorDepreciado := Query.FieldByName('valor_depreciado').AsCurrency;
      Item.PercentualDepreciacao := Query.FieldByName('percentual_depreciacao').AsCurrency;
      Item.DataOcorrencia := Query.FieldByName('data_ocorrencia').AsDateTime;
      Item.NomeSala := Query.FieldByName('nome_sala').AsString;
      Item.NomePredio := Query.FieldByName('nome_predio').AsString;

      Result.Add(Item);
      Query.Next;
    end;
  finally
    Query.Free;
  end;
end;

function TRelatorioDepreciacaoRepository.ObterTiposOcorrencia: TStringList;
var
  Query: TFDQuery;
begin
  Result := TStringList.Create;
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := FConnection;
    Query.SQL.Text :=
      'SELECT DISTINCT tipo_ocorrencia ' +
      'FROM ocorrencias ' +
      'WHERE tipo_ocorrencia IS NOT NULL ' +
      'ORDER BY tipo_ocorrencia';
    Query.Open;

    while not Query.Eof do
    begin
      Result.Add(Query.FieldByName('tipo_ocorrencia').AsString);
      Query.Next;
    end;
  finally
    Query.Free;
  end;
end;

procedure TRelatorioDepreciacaoRepository.PreencherQueryRelatorio(
  AQuery: TFDQuery; ADataInicio, ADataFim: TDate; const ATipoOcorrencia: string);
var
  SQL: string;
begin
  if AQuery.Active then
    AQuery.Close;

  SQL :=
    'SELECT ' +
    '  p.nome AS nome_patrimonio, ' +
    '  p.tipo AS tipo_patrimonio, ' +
    '  p.modelo AS modelo_patrimonio, ' +
    '  p.situacao AS situacao_patrimonio, ' +
    '  o.tipo_ocorrencia, ' +
    '  o.gravidade, ' +
    '  o.valor_antes, ' +
    '  o.valor_depois, ' +
    '  (o.valor_antes - o.valor_depois) AS valor_depreciado, ' +
    '  o.percentual_depreciacao, ' +
    '  o.data_ocorrencia, ' +
    '  COALESCE(s.nome, ''Sem sala'') AS nome_sala, ' +
    '  COALESCE(pr.nome, ''Sem pr�dio'') AS nome_predio ' +
    'FROM ocorrencias o ' +
    'INNER JOIN patrimonios p ON p.id = o.fk_id_patrimonios ' +
    'LEFT JOIN salas s ON s.id = p.fk_id_salas ' +
    'LEFT JOIN predios pr ON pr.id = s.fk_id_predios ' +
    'WHERE o.valor_antes > o.valor_depois ';

  // Filtro por data
  if ADataInicio > 0 then
    SQL := SQL + '  AND o.data_ocorrencia >= :data_inicio ';

  if ADataFim > 0 then
    SQL := SQL + '  AND o.data_ocorrencia <= :data_fim ';

  // Filtro por tipo de ocorrência
  if Trim(ATipoOcorrencia) <> '' then
    SQL := SQL + '  AND o.tipo_ocorrencia = :tipo_ocorrencia ';

  SQL := SQL + 'ORDER BY o.data_ocorrencia DESC, (o.valor_antes - o.valor_depois) DESC';

  AQuery.SQL.Text := SQL;

  // Limpa parâmetros anteriores
  AQuery.Params.Clear;

  // Define parâmetros
  if ADataInicio > 0 then
  begin
    AQuery.Params.Add('data_inicio', ftDate);
    AQuery.ParamByName('data_inicio').AsDate := ADataInicio;
  end;

  if ADataFim > 0 then
  begin
    AQuery.Params.Add('data_fim', ftDate);
    AQuery.ParamByName('data_fim').AsDate := ADataFim;
  end;

  if Trim(ATipoOcorrencia) <> '' then
  begin
    AQuery.Params.Add('tipo_ocorrencia', ftString);
    AQuery.ParamByName('tipo_ocorrencia').AsString := ATipoOcorrencia;
  end;

  // Abre a query
  try
    AQuery.Open;
  except
    on E: Exception do
    begin
      raise Exception.Create('Erro ao executar consulta de depreciação: ' + E.Message);
    end;
  end;
end;

end.

