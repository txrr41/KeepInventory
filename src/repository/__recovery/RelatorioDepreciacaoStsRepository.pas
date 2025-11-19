unit RelatorioDepreciacaoStsRepository;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Comp.Client, frxClass, frxDBSet,
  Data.DB;

type
  TRelatorioDepreciacaoStsRepository = class
  private
    FFDConnection: TFDConnection;
    FQueryRelatorio: TFDQuery;
    FQueryResumo: TFDQuery;
    FfrxDBDatasetRelatorio: TfrxDBDataset;
    FfrxDBDatasetResumo: TfrxDBDataset;

    procedure ConfigurarQuerys;
  public
    constructor Create(AConnection: TFDConnection);
    destructor Destroy; override;

    procedure PrepararRelatorio(AfrxReport: TfrxReport);
    procedure PrepararDatasets(AfrxDBDatasetRelatorio, AfrxDBDatasetResumo: TfrxDBDataset);
  end;

implementation

constructor TRelatorioDepreciacaoStsRepository.Create(AConnection: TFDConnection);
begin
  FFDConnection := AConnection;
  FQueryRelatorio := TFDQuery.Create(nil);
  FQueryResumo := TFDQuery.Create(nil);
  FfrxDBDatasetRelatorio := TfrxDBDataset.Create(nil);
  FfrxDBDatasetResumo := TfrxDBDataset.Create(nil);

  FQueryRelatorio.Connection := FFDConnection;
  FQueryResumo.Connection := FFDConnection;

  FfrxDBDatasetRelatorio.DataSet := FQueryRelatorio;
  FfrxDBDatasetResumo.DataSet := FQueryResumo;
end;

destructor TRelatorioDepreciacaoStsRepository.Destroy;
begin
  FfrxDBDatasetRelatorio.Free;
  FfrxDBDatasetResumo.Free;
  FQueryRelatorio.Free;
  FQueryResumo.Free;
  inherited;
end;

procedure TRelatorioDepreciacaoStsRepository.ConfigurarQuerys;
begin
  // ==================== QUERY PRINCIPAL ====================

  FQueryRelatorio.Close;
  FQueryRelatorio.SQL.Clear;

  FQueryRelatorio.SQL.Text :=
    'SELECT ' +
    '  p.id, ' +
    '  p.nome, ' +
    '  COALESCE(p.modelo, ''N/I'') as modelo, ' +
    '  COALESCE(p.tipo, ''N/I'') as tipo, ' +
    '  COALESCE(p.numero_serie, ''S/N'') as numero_serie, ' +
    '  p.valor_aquisicao, ' +
    '  COALESCE(p.valor_atual, 0) as valor_atual, ' +
    '  p.data_aquisicao, ' +

    // Percentual Depreciação
    '  ROUND( ((p.valor_aquisicao - COALESCE(p.valor_atual,0)) / NULLIF(p.valor_aquisicao,0)) * 100, 2 ) AS percentual_depreciacao, ' +

    // Meses Restantes
    '  CASE ' +
    '    WHEN p.vida_util_meses IS NOT NULL AND p.vida_util_meses > 0 THEN ' +
    '      GREATEST( 0, p.vida_util_meses - ( ' +
    '        EXTRACT(YEAR FROM AGE(CURRENT_DATE,p.data_aquisicao))::integer * 12 + ' +
    '        EXTRACT(MONTH FROM AGE(CURRENT_DATE,p.data_aquisicao))::integer ) ) ' +
    '    ELSE 0 ' +
    '  END as meses_restantes, ' +

    // Status Ordem (STRING)
    '  CASE ' +
    '    WHEN ((p.valor_aquisicao - COALESCE(p.valor_atual,0)) / NULLIF(p.valor_aquisicao,0)) * 100 >= 100 THEN ''1'' ' +
    '    WHEN ((p.valor_aquisicao - COALESCE(p.valor_atual,0)) / NULLIF(p.valor_aquisicao,0)) * 100 >= 95 THEN ''2'' ' +
    '    WHEN ((p.valor_aquisicao - COALESCE(p.valor_atual,0)) / NULLIF(p.valor_aquisicao,0)) * 100 >= 85 THEN ''3'' ' +
    '    WHEN ((p.valor_aquisicao - COALESCE(p.valor_atual,0)) / NULLIF(p.valor_aquisicao,0)) * 100 >= 75 THEN ''4'' ' +
    '    ELSE ''5'' ' +
    '  END AS status_ordem, ' +

    // Status Texto
    '  CASE ' +
    '    WHEN ((p.valor_aquisicao - COALESCE(p.valor_atual,0)) / NULLIF(p.valor_aquisicao,0)) * 100 >= 100 THEN ''JÁ DEPRECIADOS 100%'' ' +
    '    WHEN ((p.valor_aquisicao - COALESCE(p.valor_atual,0)) / NULLIF(p.valor_aquisicao,0)) * 100 >= 95 THEN ''URGENTE - PRÓXIMOS 3 MESES (95%+)'' ' +
    '    WHEN ((p.valor_aquisicao - COALESCE(p.valor_atual,0)) / NULLIF(p.valor_aquisicao,0)) * 100 >= 85 THEN ''ATENÇÃO - 3 A 6 MESES (85-94%)'' ' +
    '    WHEN ((p.valor_aquisicao - COALESCE(p.valor_atual,0)) / NULLIF(p.valor_aquisicao,0)) * 100 >= 75 THEN ''PLANEJAMENTO - 6 A 12 MESES (75-84%)'' ' +
    '    ELSE ''NORMAL'' ' +
    '  END as status_texto ' +

    'FROM patrimonios p ' +
    'WHERE p.ativo = true ' +
    '  AND p.valor_aquisicao > 0 ' +
    '  AND p.valor_atual IS NOT NULL ' +

    'ORDER BY ' +
    '  CASE ' +
    '    WHEN ((p.valor_aquisicao - COALESCE(p.valor_atual,0)) / NULLIF(p.valor_aquisicao,0)) * 100 >= 100 THEN 1 ' +
    '    WHEN ((p.valor_aquisicao - COALESCE(p.valor_atual,0)) / NULLIF(p.valor_aquisicao,0)) * 100 >= 95 THEN 2 ' +
    '    WHEN ((p.valor_aquisicao - COALESCE(p.valor_atual,0)) / NULLIF(p.valor_aquisicao,0)) * 100 >= 85 THEN 3 ' +
    '    WHEN ((p.valor_aquisicao - COALESCE(p.valor_atual,0)) / NULLIF(p.valor_aquisicao,0)) * 100 >= 75 THEN 4 ' +
    '    ELSE 5 ' +
    '  END, ' +
    '  percentual_depreciacao DESC';

  try
    FQueryRelatorio.Open;
  except
    on E: Exception do
    begin
      raise Exception.Create('Erro ao abrir query do relatório: ' + E.Message);
    end;
  end;

  // ==================== QUERY RESUMO ====================

  FQueryResumo.Close;
  FQueryResumo.SQL.Clear;

  FQueryResumo.SQL.Text :=
    'SELECT ' +
    '  COALESCE(COUNT(*) FILTER ( WHERE perc >= 100 ), 0) as qtd_depreciado, ' +
    '  COALESCE(SUM(valor_aquisicao) FILTER ( WHERE perc >= 100 ), 0) as valor_depreciado, ' +

    '  COALESCE(COUNT(*) FILTER ( WHERE perc >= 95 AND perc < 100 ), 0) as qtd_urgente, ' +
    '  COALESCE(SUM(valor_aquisicao) FILTER ( WHERE perc >= 95 AND perc < 100 ), 0) as valor_urgente, ' +

    '  COALESCE(COUNT(*) FILTER ( WHERE perc >= 85 AND perc < 95 ), 0) as qtd_atencao, ' +
    '  COALESCE(SUM(valor_aquisicao) FILTER ( WHERE perc >= 85 AND perc < 95 ), 0) as valor_atencao, ' +

    '  COALESCE(COUNT(*) FILTER ( WHERE perc >= 75 AND perc < 85 ), 0) as qtd_planejamento, ' +
    '  COALESCE(SUM(valor_aquisicao) FILTER ( WHERE perc >= 75 AND perc < 85 ), 0) as valor_planejamento, ' +

    '  COALESCE(COUNT(*), 0) as total_itens, ' +
    '  COALESCE(SUM(valor_aquisicao), 0) as investimento_total ' +

    'FROM ( ' +
    '  SELECT ' +
    '    valor_aquisicao, ' +
    '    ROUND( ((valor_aquisicao - COALESCE(valor_atual,0)) / NULLIF(valor_aquisicao,0)) * 100, 2 ) as perc ' +
    '  FROM patrimonios ' +
    '  WHERE ativo = true ' +
    '    AND valor_aquisicao > 0 ' +
    '    AND valor_atual IS NOT NULL ' +
    ') sub';

  try
    FQueryResumo.Open;
  except
    on E: Exception do
    begin
      raise Exception.Create('Erro ao abrir query de resumo: ' + E.Message);
    end;
  end;
end;

procedure TRelatorioDepreciacaoStsRepository.PrepararRelatorio(AfrxReport: TfrxReport);
begin
  try
    ConfigurarQuerys;

    // Associar os datasets ao relatório
    AfrxReport.DataSets.Clear;
    AfrxReport.DataSets.Add(FfrxDBDatasetRelatorio);
    AfrxReport.DataSets.Add(FfrxDBDatasetResumo);

  except
    on E: Exception do
    begin
      raise Exception.Create('Erro ao preparar relatório: ' + E.Message);
    end;
  end;
end;

procedure TRelatorioDepreciacaoStsRepository.PrepararDatasets(
  AfrxDBDatasetRelatorio, AfrxDBDatasetResumo: TfrxDBDataset);
begin
  try
    ConfigurarQuerys;

    // Associar os datasets aos parâmetros
    if Assigned(AfrxDBDatasetRelatorio) then
      AfrxDBDatasetRelatorio.DataSet := FQueryRelatorio;

    if Assigned(AfrxDBDatasetResumo) then
      AfrxDBDatasetResumo.DataSet := FQueryResumo;

  except
    on E: Exception do
    begin
      raise Exception.Create('Erro ao preparar datasets: ' + E.Message);
    end;
  end;
end;

end.