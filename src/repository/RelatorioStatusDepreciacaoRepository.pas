unit RelatorioStatusDepreciacaoRepository;

interface

uses
  System.SysUtils, System.Generics.Collections, FireDAC.Comp.Client,
  FireDAC.Stan.Param, RelatorioStatusDepreciacaoModel, Data.DB, System.Classes;

type
  TRelatorioStatusDepreciacaoRepository = class
  private
    FConnection: TFDConnection;
  public
    constructor Create(AConnection: TFDConnection);
    function ObterPatrimoniosStatusDepreciacao: TObjectList<TRelatorioStatusDepreciacaoModel>;
    function ObterResumoDashboard: TResumoDashboardDepreciacaoDTO;
    procedure PreencherQueryStatusDepreciacao(AQuery: TFDQuery);
  end;

implementation

constructor TRelatorioStatusDepreciacaoRepository.Create(AConnection: TFDConnection);
begin
  FConnection := AConnection;
end;

function TRelatorioStatusDepreciacaoRepository.ObterPatrimoniosStatusDepreciacao: TObjectList<TRelatorioStatusDepreciacaoModel>;
var
  Query: TFDQuery;
  Item: TRelatorioStatusDepreciacaoModel;
  SQL: string;
begin
  Result := TObjectList<TRelatorioStatusDepreciacaoModel>.Create;
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := FConnection;

    SQL := 'SELECT ' +
           '    p.id, ' +
           '    p.nome, ' +
           '    p.modelo, ' +
           '    p.tipo, ' +
           '    p.situacao, ' +
           '    p.numero_serie, ' +
           '    p.valor_aquisicao, ' +
           '    p.valor_atual, ' +
           '    p.data_aquisicao, ' +
           '    ' +
           '    -- Percentual atual de depreciação ' +
           '    ROUND(((p.valor_aquisicao - p.valor_atual)::numeric / NULLIF(p.valor_aquisicao, 0)::numeric) * 100, 2) as percentual_depreciacao, ' +
           '    ' +
           '    -- Quanto já depreciou em reais ' +
           '    (p.valor_aquisicao - p.valor_atual) as valor_depreciado, ' +
           '    ' +
           '    -- Idade do bem em meses ' +
           '    EXTRACT(YEAR FROM AGE(CURRENT_DATE, p.data_aquisicao))::integer * 12 + ' +
           '    EXTRACT(MONTH FROM AGE(CURRENT_DATE, p.data_aquisicao))::integer as idade_meses, ' +
           '    ' +
           '    -- Taxa média de depreciação por mês ' +
           '    CASE ' +
           '        WHEN (EXTRACT(YEAR FROM AGE(CURRENT_DATE, p.data_aquisicao)) * 12 + ' +
           '              EXTRACT(MONTH FROM AGE(CURRENT_DATE, p.data_aquisicao))) > 0 ' +
           '        THEN ROUND( ' +
           '            (((p.valor_aquisicao - p.valor_atual)::numeric / NULLIF(p.valor_aquisicao, 0)::numeric) * 100) / ' +
           '            (EXTRACT(YEAR FROM AGE(CURRENT_DATE, p.data_aquisicao)) * 12 + ' +
           '             EXTRACT(MONTH FROM AGE(CURRENT_DATE, p.data_aquisicao)))::numeric, 2 ' +
           '        ) ' +
           '        ELSE 0 ' +
           '    END as taxa_depreciacao_mensal, ' +
           '    ' +
           '    -- Meses restantes estimado ' +
           '    CASE ' +
           '        -- Se já está 100% depreciado ' +
           '        WHEN ((p.valor_aquisicao - p.valor_atual)::numeric / NULLIF(p.valor_aquisicao, 0)::numeric) * 100 >= 100 ' +
           '        THEN 0 ' +
           '        -- Se tem vida útil definida ' +
           '        WHEN p.vida_util_meses IS NOT NULL THEN ' +
           '            GREATEST(0, p.vida_util_meses - ( ' +
           '                EXTRACT(YEAR FROM AGE(CURRENT_DATE, p.data_aquisicao))::integer * 12 + ' +
           '                EXTRACT(MONTH FROM AGE(CURRENT_DATE, p.data_aquisicao))::integer ' +
           '            )) ' +
           '        -- Senão, estima pela taxa atual ' +
           '        WHEN (EXTRACT(YEAR FROM AGE(CURRENT_DATE, p.data_aquisicao)) * 12 + ' +
           '              EXTRACT(MONTH FROM AGE(CURRENT_DATE, p.data_aquisicao))) > 0 ' +
           '        THEN CEILING( ' +
           '            (100 - ((p.valor_aquisicao - p.valor_atual)::numeric / NULLIF(p.valor_aquisicao, 0)::numeric) * 100) / ' +
           '            NULLIF( ' +
           '                ((((p.valor_aquisicao - p.valor_atual)::numeric / NULLIF(p.valor_aquisicao, 0)::numeric) * 100) / ' +
           '                 (EXTRACT(YEAR FROM AGE(CURRENT_DATE, p.data_aquisicao)) * 12 + ' +
           '                  EXTRACT(MONTH FROM AGE(CURRENT_DATE, p.data_aquisicao)))::numeric) ' +
           '            , 0) ' +
           '        )::integer ' +
           '        ELSE 999 ' +
           '    END as meses_restantes, ' +
           '    ' +
           '    -- Data prevista para depreciação 100% ' +
           '    CASE ' +
           '        WHEN ((p.valor_aquisicao - p.valor_atual)::numeric / NULLIF(p.valor_aquisicao, 0)::numeric) * 100 >= 100 ' +
           '        THEN p.data_aquisicao -- já está depreciado ' +
           '        WHEN p.vida_util_meses IS NOT NULL THEN ' +
           '            p.data_aquisicao + (p.vida_util_meses || '' months'')::interval ' +
           '        ELSE NULL ' +
           '    END as data_prevista_100, ' +
           '    ' +
           '    -- Status da depreciação ' +
           '    CASE ' +
           '        WHEN ((p.valor_aquisicao - p.valor_atual)::numeric / NULLIF(p.valor_aquisicao, 0)::numeric) * 100 >= 100 ' +
           '        THEN ''DEPRECIADO 100%'' ' +
           '        WHEN ((p.valor_aquisicao - p.valor_atual)::numeric / NULLIF(p.valor_aquisicao, 0)::numeric) * 100 >= 95 ' +
           '        THEN ''URGENTE (95%+)'' ' +
           '        WHEN ((p.valor_aquisicao - p.valor_atual)::numeric / NULLIF(p.valor_aquisicao, 0)::numeric) * 100 >= 85 ' +
           '        THEN ''ATENÇÃO (85%+)'' ' +
           '        WHEN ((p.valor_aquisicao - p.valor_atual)::numeric / NULLIF(p.valor_aquisicao, 0)::numeric) * 100 >= 75 ' +
           '        THEN ''PLANEJAMENTO (75%+)'' ' +
           '        ELSE ''MONITORAR'' ' +
           '    END as status_depreciacao, ' +
           '    ' +
           '    -- Prioridade numérica para ordenação ' +
           '    CASE ' +
           '        WHEN ((p.valor_aquisicao - p.valor_atual)::numeric / NULLIF(p.valor_aquisicao, 0)::numeric) * 100 >= 100 THEN 1 ' +
           '        WHEN ((p.valor_aquisicao - p.valor_atual)::numeric / NULLIF(p.valor_aquisicao, 0)::numeric) * 100 >= 95 THEN 2 ' +
           '        WHEN ((p.valor_aquisicao - p.valor_atual)::numeric / NULLIF(p.valor_aquisicao, 0)::numeric) * 100 >= 85 THEN 3 ' +
           '        WHEN ((p.valor_aquisicao - p.valor_atual)::numeric / NULLIF(p.valor_aquisicao, 0)::numeric) * 100 >= 75 THEN 4 ' +
           '        ELSE 5 ' +
           '    END as prioridade_ordem, ' +
           '    ' +
           '    -- Cor para o relatório ' +
           '    CASE ' +
           '        WHEN ((p.valor_aquisicao - p.valor_atual)::numeric / NULLIF(p.valor_aquisicao, 0)::numeric) * 100 >= 100 ' +
           '        THEN ''#8B0000''  -- Vermelho escuro (já depreciado) ' +
           '        WHEN ((p.valor_aquisicao - p.valor_atual)::numeric / NULLIF(p.valor_aquisicao, 0)::numeric) * 100 >= 95 ' +
           '        THEN ''#FF0000''  -- Vermelho ' +
           '        WHEN ((p.valor_aquisicao - p.valor_atual)::numeric / NULLIF(p.valor_aquisicao, 0)::numeric) * 100 >= 85 ' +
           '        THEN ''#FFA500''  -- Laranja ' +
           '        WHEN ((p.valor_aquisicao - p.valor_atual)::numeric / NULLIF(p.valor_aquisicao, 0)::numeric) * 100 >= 75 ' +
           '        THEN ''#FFD700''  -- Amarelo/Dourado ' +
           '        ELSE ''#008000''  -- Verde ' +
           '    END as cor_status ' +
           ' ' +
           'FROM patrimonios p ' +
           'WHERE p.ativo = true ' +
           '  AND p.valor_aquisicao > 0 ' +
           '  AND ((p.valor_aquisicao - p.valor_atual)::numeric / NULLIF(p.valor_aquisicao, 0)::numeric) * 100 >= 75 ' +
           'ORDER BY ' +
           '    prioridade_ordem ASC, ' +
           '    percentual_depreciacao DESC, ' +
           '    p.valor_aquisicao DESC';

    Query.SQL.Text := SQL;
    Query.Open;

    while not Query.Eof do
    begin
      Item := TRelatorioStatusDepreciacaoModel.Create;
      Item.Id := Query.FieldByName('id').AsInteger;
      Item.Nome := Query.FieldByName('nome').AsString;
      Item.Modelo := Query.FieldByName('modelo').AsString;
      Item.Tipo := Query.FieldByName('tipo').AsString;
      Item.Situacao := Query.FieldByName('situacao').AsString;
      Item.NumeroSerie := Query.FieldByName('numero_serie').AsString;
      Item.ValorAquisicao := Query.FieldByName('valor_aquisicao').AsCurrency;
      Item.ValorAtual := Query.FieldByName('valor_atual').AsCurrency;
      Item.DataAquisicao := Query.FieldByName('data_aquisicao').AsDateTime;
      Item.PercentualDepreciacao := Query.FieldByName('percentual_depreciacao').AsFloat;
      Item.ValorDepreciado := Query.FieldByName('valor_depreciado').AsCurrency;
      Item.IdadeMeses := Query.FieldByName('idade_meses').AsInteger;
      Item.TaxaDepreciacaoMensal := Query.FieldByName('taxa_depreciacao_mensal').AsFloat;
      Item.MesesRestantes := Query.FieldByName('meses_restantes').AsInteger;

      if not Query.FieldByName('data_prevista_100').IsNull then
        Item.DataPrevista100 := Query.FieldByName('data_prevista_100').AsDateTime;

      Item.StatusDepreciacao := Query.FieldByName('status_depreciacao').AsString;
      Item.PrioridadeOrdem := Query.FieldByName('prioridade_ordem').AsInteger;
      Item.CorStatus := Query.FieldByName('cor_status').AsString;

      Result.Add(Item);
      Query.Next;
    end;
  finally
    Query.Free;
  end;
end;

function TRelatorioStatusDepreciacaoRepository.ObterResumoDashboard: TResumoDashboardDepreciacaoDTO;
var
  Query: TFDQuery;
  SQL: string;
begin
  // Inicializa com valores zerados
  Result.TotalPatrimonios := 0;
  Result.MediaDepreciacao := 0;
  Result.TotalDepreciado := 0;
  Result.TotalValorAtual := 0;
  Result.ContagemMonitorar := 0;
  Result.ContagemPlanejamento := 0;
  Result.ContagemAtencao := 0;
  Result.ContagemUrgente := 0;
  Result.ContagemDepreciado := 0;

  Query := TFDQuery.Create(nil);
  try
    Query.Connection := FConnection;

    SQL := 'SELECT ' +
           '    COUNT(*) as total_patrimonios, ' +
           '    AVG(((p.valor_aquisicao - p.valor_atual)::numeric / NULLIF(p.valor_aquisicao, 0)::numeric) * 100) as media_depreciacao, ' +
           '    SUM(p.valor_aquisicao - p.valor_atual) as total_depreciado, ' +
           '    SUM(p.valor_atual) as total_valor_atual, ' +
           '    SUM(CASE WHEN ((p.valor_aquisicao - p.valor_atual)::numeric / NULLIF(p.valor_aquisicao, 0)::numeric) * 100 >= 100 THEN 1 ELSE 0 END) as depreciado, ' +
           '    SUM(CASE WHEN ((p.valor_aquisicao - p.valor_atual)::numeric / NULLIF(p.valor_aquisicao, 0)::numeric) * 100 >= 95 AND ((p.valor_aquisicao - p.valor_atual)::numeric / NULLIF(p.valor_aquisicao, 0)::numeric) * 100 < 100 THEN 1 ELSE 0 END) as urgente, ' +
           '    SUM(CASE WHEN ((p.valor_aquisicao - p.valor_atual)::numeric / NULLIF(p.valor_aquisicao, 0)::numeric) * 100 >= 85 AND ((p.valor_aquisicao - p.valor_atual)::numeric / NULLIF(p.valor_aquisicao, 0)::numeric) * 100 < 95 THEN 1 ELSE 0 END) as atencao, ' +
           '    SUM(CASE WHEN ((p.valor_aquisicao - p.valor_atual)::numeric / NULLIF(p.valor_aquisicao, 0)::numeric) * 100 >= 75 AND ((p.valor_aquisicao - p.valor_atual)::numeric / NULLIF(p.valor_aquisicao, 0)::numeric) * 100 < 85 THEN 1 ELSE 0 END) as planejamento, ' +
           '    SUM(CASE WHEN ((p.valor_aquisicao - p.valor_atual)::numeric / NULLIF(p.valor_aquisicao, 0)::numeric) * 100 < 75 THEN 1 ELSE 0 END) as monitorar ' +
           'FROM patrimonios p ' +
           'WHERE p.ativo = true ' +
           '  AND p.valor_aquisicao > 0 ' +
           '  AND ((p.valor_aquisicao - p.valor_atual)::numeric / NULLIF(p.valor_aquisicao, 0)::numeric) * 100 >= 75';

    Query.SQL.Text := SQL;
    Query.Open;

    if not Query.IsEmpty then
    begin
      Result.TotalPatrimonios := Query.FieldByName('total_patrimonios').AsInteger;
      Result.MediaDepreciacao := Query.FieldByName('media_depreciacao').AsFloat;
      Result.TotalDepreciado := Query.FieldByName('total_depreciado').AsCurrency;
      Result.TotalValorAtual := Query.FieldByName('total_valor_atual').AsCurrency;
      Result.ContagemDepreciado := Query.FieldByName('depreciado').AsInteger;
      Result.ContagemUrgente := Query.FieldByName('urgente').AsInteger;
      Result.ContagemAtencao := Query.FieldByName('atencao').AsInteger;
      Result.ContagemPlanejamento := Query.FieldByName('planejamento').AsInteger;
      Result.ContagemMonitorar := Query.FieldByName('monitorar').AsInteger;
    end;
  finally
    Query.Free;
  end;
end;

procedure TRelatorioStatusDepreciacaoRepository.PreencherQueryStatusDepreciacao(AQuery: TFDQuery);
var
  SQL: string;
begin
  if AQuery.Active then
    AQuery.Close;

  SQL := 'SELECT ' +
         '    p.id, ' +
         '    p.nome, ' +
         '    p.modelo, ' +
         '    p.tipo, ' +
         '    p.situacao, ' +
         '    p.numero_serie, ' +
         '    p.valor_aquisicao, ' +
         '    p.valor_atual, ' +
         '    p.data_aquisicao, ' +
         '    ' +
         '    -- Percentual atual de depreciação ' +
         '    ROUND(((p.valor_aquisicao - p.valor_atual)::numeric / NULLIF(p.valor_aquisicao, 0)::numeric) * 100, 2) as percentual_depreciacao, ' +
         '    ' +
         '    -- Quanto já depreciou em reais ' +
         '    (p.valor_aquisicao - p.valor_atual) as valor_depreciado, ' +
         '    ' +
         '    -- Idade do bem em meses ' +
         '    EXTRACT(YEAR FROM AGE(CURRENT_DATE, p.data_aquisicao))::integer * 12 + ' +
         '    EXTRACT(MONTH FROM AGE(CURRENT_DATE, p.data_aquisicao))::integer as idade_meses, ' +
         '    ' +
         '    -- Taxa média de depreciação por mês ' +
         '    CASE ' +
         '        WHEN (EXTRACT(YEAR FROM AGE(CURRENT_DATE, p.data_aquisicao)) * 12 + ' +
         '              EXTRACT(MONTH FROM AGE(CURRENT_DATE, p.data_aquisicao))) > 0 ' +
         '        THEN ROUND( ' +
         '            (((p.valor_aquisicao - p.valor_atual)::numeric / NULLIF(p.valor_aquisicao, 0)::numeric) * 100) / ' +
         '            (EXTRACT(YEAR FROM AGE(CURRENT_DATE, p.data_aquisicao)) * 12 + ' +
         '             EXTRACT(MONTH FROM AGE(CURRENT_DATE, p.data_aquisicao)))::numeric, 2 ' +
         '        ) ' +
         '        ELSE 0 ' +
         '    END as taxa_depreciacao_mensal, ' +
         '    ' +
         '    -- Meses restantes estimado ' +
         '    CASE ' +
         '        -- Se já está 100% depreciado ' +
         '        WHEN ((p.valor_aquisicao - p.valor_atual)::numeric / NULLIF(p.valor_aquisicao, 0)::numeric) * 100 >= 100 ' +
         '        THEN 0 ' +
         '        -- Se tem vida útil definida ' +
         '        WHEN p.vida_util_meses IS NOT NULL THEN ' +
         '            GREATEST(0, p.vida_util_meses - ( ' +
         '                EXTRACT(YEAR FROM AGE(CURRENT_DATE, p.data_aquisicao))::integer * 12 + ' +
         '                EXTRACT(MONTH FROM AGE(CURRENT_DATE, p.data_aquisicao))::integer ' +
         '            )) ' +
         '        -- Senão, estima pela taxa atual ' +
         '        WHEN (EXTRACT(YEAR FROM AGE(CURRENT_DATE, p.data_aquisicao)) * 12 + ' +
         '              EXTRACT(MONTH FROM AGE(CURRENT_DATE, p.data_aquisicao))) > 0 ' +
         '        THEN CEILING( ' +
         '            (100 - ((p.valor_aquisicao - p.valor_atual)::numeric / NULLIF(p.valor_aquisicao, 0)::numeric) * 100) / ' +
         '            NULLIF( ' +
         '                ((((p.valor_aquisicao - p.valor_atual)::numeric / NULLIF(p.valor_aquisicao, 0)::numeric) * 100) / ' +
         '                 (EXTRACT(YEAR FROM AGE(CURRENT_DATE, p.data_aquisicao)) * 12 + ' +
         '                  EXTRACT(MONTH FROM AGE(CURRENT_DATE, p.data_aquisicao)))::numeric) ' +
         '            , 0) ' +
         '        )::integer ' +
         '        ELSE 999 ' +
         '    END as meses_restantes, ' +
         '    ' +
         '    -- Data prevista para depreciação 100% ' +
         '    CASE ' +
         '        WHEN ((p.valor_aquisicao - p.valor_atual)::numeric / NULLIF(p.valor_aquisicao, 0)::numeric) * 100 >= 100 ' +
         '        THEN p.data_aquisicao -- já está depreciado ' +
         '        WHEN p.vida_util_meses IS NOT NULL THEN ' +
         '            p.data_aquisicao + (p.vida_util_meses || '' months'')::interval ' +
         '        ELSE NULL ' +
         '    END as data_prevista_100, ' +
         '    ' +
         '    -- Status da depreciação ' +
         '    CASE ' +
         '        WHEN ((p.valor_aquisicao - p.valor_atual)::numeric / NULLIF(p.valor_aquisicao, 0)::numeric) * 100 >= 100 ' +
         '        THEN ''DEPRECIADO 100%'' ' +
         '        WHEN ((p.valor_aquisicao - p.valor_atual)::numeric / NULLIF(p.valor_aquisicao, 0)::numeric) * 100 >= 95 ' +
         '        THEN ''URGENTE (95%+)'' ' +
         '        WHEN ((p.valor_aquisicao - p.valor_atual)::numeric / NULLIF(p.valor_aquisicao, 0)::numeric) * 100 >= 85 ' +
         '        THEN ''ATENÇÃO (85%+)'' ' +
         '        WHEN ((p.valor_aquisicao - p.valor_atual)::numeric / NULLIF(p.valor_aquisicao, 0)::numeric) * 100 >= 75 ' +
         '        THEN ''PLANEJAMENTO (75%+)'' ' +
         '        ELSE ''MONITORAR'' ' +
         '    END as status_depreciacao, ' +
         '    ' +
         '    -- Prioridade numérica para ordenação ' +
         '    CASE ' +
         '        WHEN ((p.valor_aquisicao - p.valor_atual)::numeric / NULLIF(p.valor_aquisicao, 0)::numeric) * 100 >= 100 THEN 1 ' +
         '        WHEN ((p.valor_aquisicao - p.valor_atual)::numeric / NULLIF(p.valor_aquisicao, 0)::numeric) * 100 >= 95 THEN 2 ' +
         '        WHEN ((p.valor_aquisicao - p.valor_atual)::numeric / NULLIF(p.valor_aquisicao, 0)::numeric) * 100 >= 85 THEN 3 ' +
         '        WHEN ((p.valor_aquisicao - p.valor_atual)::numeric / NULLIF(p.valor_aquisicao, 0)::numeric) * 100 >= 75 THEN 4 ' +
         '        ELSE 5 ' +
         '    END as prioridade_ordem, ' +
         '    ' +
         '    -- Cor para o relatório ' +
         '    CASE ' +
         '        WHEN ((p.valor_aquisicao - p.valor_atual)::numeric / NULLIF(p.valor_aquisicao, 0)::numeric) * 100 >= 100 ' +
         '        THEN ''#8B0000''  -- Vermelho escuro (já depreciado) ' +
         '        WHEN ((p.valor_aquisicao - p.valor_atual)::numeric / NULLIF(p.valor_aquisicao, 0)::numeric) * 100 >= 95 ' +
         '        THEN ''#FF0000''  -- Vermelho ' +
         '        WHEN ((p.valor_aquisicao - p.valor_atual)::numeric / NULLIF(p.valor_aquisicao, 0)::numeric) * 100 >= 85 ' +
         '        THEN ''#FFA500''  -- Laranja ' +
         '        WHEN ((p.valor_aquisicao - p.valor_atual)::numeric / NULLIF(p.valor_aquisicao, 0)::numeric) * 100 >= 75 ' +
         '        THEN ''#FFD700''  -- Amarelo/Dourado ' +
         '        ELSE ''#008000''  -- Verde ' +
         '    END as cor_status ' +
         ' ' +
         'FROM patrimonios p ' +
         'WHERE p.ativo = true ' +
         '  AND p.valor_aquisicao > 0 ' +
         '  AND ((p.valor_aquisicao - p.valor_atual)::numeric / NULLIF(p.valor_aquisicao, 0)::numeric) * 100 >= 75 ' +
         'ORDER BY ' +
         '    prioridade_ordem ASC, ' +
         '    percentual_depreciacao DESC, ' +
         '    p.valor_aquisicao DESC';

  AQuery.SQL.Text := SQL;

  try
    AQuery.Open;
  except
    on E: Exception do
      raise Exception.Create('Erro ao executar consulta de status de depreciação: ' + E.Message);
  end;
end;

end.