unit RelatorioMovimentacaoRepository;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Comp.Client, frxClass, frxDBSet,
  Data.DB, DB;

type
  TRelatorioMovimentacaoRepository = class
  private
    FFDConnection: TFDConnection;
    FQueryMovimentacao: TFDQuery;
    FQueryEstatisticas: TFDQuery;
    FfrxDBDatasetMovimentacao: TfrxDBDataset;
    FfrxDBDatasetEstatisticas: TfrxDBDataset;

    procedure ConfigurarQuerys(AItemFilter: string = ''; ADataInicio: TDate = 0; ADataFim: TDate = 0);
  public
    constructor Create(AConnection: TFDConnection);
    destructor Destroy; override;

    function VerificarDadosExistentes(AItemFilter: string = ''; ADataInicio: TDate = 0; ADataFim: TDate = 0): Boolean;
    function CarregarItens: TStringList;
    procedure PrepararRelatorio(AfrxReport: TfrxReport; AItemFilter: string = ''; ADataInicio: TDate = 0; ADataFim: TDate = 0);
    procedure PrepararDatasets(AfrxDBDatasetMovimentacao, AfrxDBDatasetEstatisticas: TfrxDBDataset; AItemFilter: string = ''; ADataInicio: TDate = 0; ADataFim: TDate = 0);
  end;

implementation

constructor TRelatorioMovimentacaoRepository.Create(AConnection: TFDConnection);
begin
  FFDConnection := AConnection;
  FQueryMovimentacao := TFDQuery.Create(nil);
  FQueryEstatisticas := TFDQuery.Create(nil);
  FfrxDBDatasetMovimentacao := TfrxDBDataset.Create(nil);
  FfrxDBDatasetEstatisticas := TfrxDBDataset.Create(nil);

  FQueryMovimentacao.Connection := FFDConnection;
  FQueryEstatisticas.Connection := FFDConnection;

  FfrxDBDatasetMovimentacao.DataSet := FQueryMovimentacao;
  FfrxDBDatasetEstatisticas.DataSet := FQueryEstatisticas;
end;

destructor TRelatorioMovimentacaoRepository.Destroy;
begin
  FfrxDBDatasetMovimentacao.Free;
  FfrxDBDatasetEstatisticas.Free;
  FQueryMovimentacao.Free;
  FQueryEstatisticas.Free;
  inherited;
end;

procedure TRelatorioMovimentacaoRepository.ConfigurarQuerys(AItemFilter: string = ''; ADataInicio: TDate = 0; ADataFim: TDate = 0);

var
  WhereClause: string;
  SQLBase: string;
begin
  // ==================== QUERY PRINCIPAL DE MOVIMENTAÇÃO ====================

  FQueryMovimentacao.Close;
  FQueryMovimentacao.SQL.Clear;

  // Construção da consulta principal
  SQLBase :=
    'SELECT ' +
    '  m.id, ' +
    '  m.data_movimentacao, ' +
    '  u.nome AS usuario, ' +
    '  p.nome AS patrimonio, ' +
    '  p.tipo AS tipo_patrimonio, ' +
    '  p.numero_serie, ' +
    '  so.nome AS sala_origem, ' +
    '  po.nome AS predio_origem, ' +
    '  sd.nome AS sala_destino, ' +
    '  pd.nome AS predio_destino, ' +
    '  m.quantidade, ' +
    '  m.status, ' +
    '  COALESCE(m.observacoes, '''') AS observacoes, ' +
    '  m.fk_id_patrimonios, ' +
    '  m.fk_id_origem, ' +
    '  m.fk_id_destino, ' +
    '  m.fk_id_usuarios ' +
    'FROM movimentacoes m ' +
    'INNER JOIN usuarios u ON m.fk_id_usuarios = u.id ' +
    'INNER JOIN patrimonios p ON m.fk_id_patrimonios = p.id ' +
    'INNER JOIN salas so ON m.fk_id_origem = so.id ' +
    'INNER JOIN predios po ON so.fk_id_predios = po.id ' +
    'INNER JOIN salas sd ON m.fk_id_destino = sd.id ' +
    'INNER JOIN predios pd ON sd.fk_id_predios = pd.id ' +
    'WHERE m.ativo = true';

  // Adicionar filtros
  WhereClause := '';

  if Trim(AItemFilter) <> '' then
  begin
    WhereClause := WhereClause + ' AND (p.nome ILIKE :itemFilter OR p.tipo ILIKE :itemFilter OR p.numero_serie ILIKE :itemFilter)';
  end;

  if (ADataInicio > 0) and (ADataFim > 0) then
  begin
    WhereClause := WhereClause + ' AND m.data_movimentacao BETWEEN :dataInicio AND :dataFim';
  end
  else if ADataInicio > 0 then
  begin
    WhereClause := WhereClause + ' AND m.data_movimentacao >= :dataInicio';
  end
  else if ADataFim > 0 then
  begin
    WhereClause := WhereClause + ' AND m.data_movimentacao <= :dataFim';
  end;

  FQueryMovimentacao.SQL.Text := SQLBase + WhereClause + ' ORDER BY m.data_movimentacao DESC, m.id DESC';

  // AGORA SIM: atribuir os valores aos parâmetros APÓS construir o SQL
  if Trim(AItemFilter) <> '' then
    FQueryMovimentacao.ParamByName('itemFilter').AsString := '%' + AItemFilter + '%';

  if (ADataInicio > 0) and (ADataFim > 0) then
  begin
    FQueryMovimentacao.ParamByName('dataInicio').AsDate := ADataInicio;
    FQueryMovimentacao.ParamByName('dataFim').AsDate := ADataFim;
  end
  else if ADataInicio > 0 then
  begin
    FQueryMovimentacao.ParamByName('dataInicio').AsDate := ADataInicio;
  end
  else if ADataFim > 0 then
  begin
    FQueryMovimentacao.ParamByName('dataFim').AsDate := ADataFim;
  end;

  try
    FQueryMovimentacao.Open;
  except
    on E: Exception do
    begin
      raise Exception.Create('Erro ao abrir query de movimentação: ' + E.Message + ' - SQL: ' + FQueryMovimentacao.SQL.Text);
    end;
  end;

  // ==================== QUERY DE ESTATÍSTICAS ====================

  FQueryEstatisticas.Close;
  FQueryEstatisticas.SQL.Clear;

  SQLBase :=
    'SELECT ' +
    '  COUNT(*) as total_movimentacoes, ' +
    '  COUNT(DISTINCT m.fk_id_patrimonios) as itens_distintos, ' +
    '  COUNT(DISTINCT m.fk_id_destino) as locais_distintos, ' +
    '  SUM(m.quantidade) as total_quantidade, ' +
    '  (SELECT p.nome ' +
    '   FROM movimentacoes m2 ' +
    '   INNER JOIN patrimonios p ON m2.fk_id_patrimonios = p.id ' +
    '   WHERE m2.ativo = true';

  WhereClause := '';
  if Trim(AItemFilter) <> '' then
    WhereClause := ' AND (p.nome ILIKE :itemFilter2 OR p.tipo ILIKE :itemFilter2 OR p.numero_serie ILIKE :itemFilter2)';

  if (ADataInicio > 0) and (ADataFim > 0) then
    WhereClause := WhereClause + ' AND m2.data_movimentacao BETWEEN :dataInicio2 AND :dataFim2'
  else if ADataInicio > 0 then
    WhereClause := WhereClause + ' AND m2.data_movimentacao >= :dataInicio2'
  else if ADataFim > 0 then
    WhereClause := WhereClause + ' AND m2.data_movimentacao <= :dataFim2';

  SQLBase := SQLBase + WhereClause +
    '   GROUP BY p.nome ' +
    '   ORDER BY COUNT(*) DESC, SUM(m2.quantidade) DESC ' +
    '   LIMIT 1) as item_mais_movimentado, ' +
    '  (SELECT sd.nome || '' - '' || pd.nome ' +
    '   FROM movimentacoes m3 ' +
    '   INNER JOIN salas sd ON m3.fk_id_destino = sd.id ' +
    '   INNER JOIN predios pd ON sd.fk_id_predios = pd.id ' +
    '   WHERE m3.ativo = true';

  WhereClause := '';
  if Trim(AItemFilter) <> '' then
    WhereClause := ' AND EXISTS (SELECT 1 FROM patrimonios p WHERE p.id = m3.fk_id_patrimonios AND (p.nome ILIKE :itemFilter3 OR p.tipo ILIKE :itemFilter3 OR p.numero_serie ILIKE :itemFilter3))';

  if (ADataInicio > 0) and (ADataFim > 0) then
    WhereClause := WhereClause + ' AND m3.data_movimentacao BETWEEN :dataInicio3 AND :dataFim3'
  else if ADataInicio > 0 then
    WhereClause := WhereClause + ' AND m3.data_movimentacao >= :dataInicio3'
  else if ADataFim > 0 then
    WhereClause := WhereClause + ' AND m3.data_movimentacao <= :dataFim3';

  SQLBase := SQLBase + WhereClause +
    '   GROUP BY sd.nome, pd.nome ' +
    '   ORDER BY COUNT(*) DESC ' +
    '   LIMIT 1) as local_mais_recebeu ' +
    'FROM movimentacoes m ' +
    'WHERE m.ativo = true';

  WhereClause := '';
  if Trim(AItemFilter) <> '' then
    WhereClause := ' AND EXISTS (SELECT 1 FROM patrimonios p WHERE p.id = m.fk_id_patrimonios AND (p.nome ILIKE :itemFilter4 OR p.tipo ILIKE :itemFilter4 OR p.numero_serie ILIKE :itemFilter4))';

  if (ADataInicio > 0) and (ADataFim > 0) then
    WhereClause := WhereClause + ' AND m.data_movimentacao BETWEEN :dataInicio4 AND :dataFim4'
  else if ADataInicio > 0 then
    WhereClause := WhereClause + ' AND m.data_movimentacao >= :dataInicio4'
  else if ADataFim > 0 then
    WhereClause := WhereClause + ' AND m.data_movimentacao <= :dataFim4';

  FQueryEstatisticas.SQL.Text := SQLBase + WhereClause;

  // Configurar parâmetros APÓS construir o SQL
  if Trim(AItemFilter) <> '' then
  begin
    FQueryEstatisticas.ParamByName('itemFilter2').AsString := '%' + AItemFilter + '%';
    FQueryEstatisticas.ParamByName('itemFilter3').AsString := '%' + AItemFilter + '%';
    FQueryEstatisticas.ParamByName('itemFilter4').AsString := '%' + AItemFilter + '%';
  end;

  if (ADataInicio > 0) and (ADataFim > 0) then
  begin
    FQueryEstatisticas.ParamByName('dataInicio2').AsDate := ADataInicio;
    FQueryEstatisticas.ParamByName('dataFim2').AsDate := ADataFim;
    FQueryEstatisticas.ParamByName('dataInicio3').AsDate := ADataInicio;
    FQueryEstatisticas.ParamByName('dataFim3').AsDate := ADataFim;
    FQueryEstatisticas.ParamByName('dataInicio4').AsDate := ADataInicio;
    FQueryEstatisticas.ParamByName('dataFim4').AsDate := ADataFim;
  end
  else if ADataInicio > 0 then
  begin
    FQueryEstatisticas.ParamByName('dataInicio2').AsDate := ADataInicio;
    FQueryEstatisticas.ParamByName('dataInicio3').AsDate := ADataInicio;
    FQueryEstatisticas.ParamByName('dataInicio4').AsDate := ADataInicio;
  end
  else if ADataFim > 0 then
  begin
    FQueryEstatisticas.ParamByName('dataFim2').AsDate := ADataFim;
    FQueryEstatisticas.ParamByName('dataFim3').AsDate := ADataFim;
    FQueryEstatisticas.ParamByName('dataFim4').AsDate := ADataFim;
  end;

  try
    FQueryEstatisticas.Open;
  except
    on E: Exception do
    begin
      raise Exception.Create('Erro ao abrir query de estatísticas: ' + E.Message + ' - SQL: ' + FQueryEstatisticas.SQL.Text);
    end;
  end;
end;

function TRelatorioMovimentacaoRepository.VerificarDadosExistentes(AItemFilter: string = ''; ADataInicio: TDate = 0; ADataFim: TDate = 0): Boolean;
var
  Query: TFDQuery;
  WhereClause: string;
begin
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := FFDConnection;
    Query.SQL.Text :=
      'SELECT COUNT(*) as total FROM movimentacoes m ' +
      'INNER JOIN patrimonios p ON m.fk_id_patrimonios = p.id ' +
      'WHERE m.ativo = true';

    // Adicionar filtros
    WhereClause := '';
    if AItemFilter <> '' then
      WhereClause := WhereClause + ' AND (p.nome ILIKE :itemFilter OR p.tipo ILIKE :itemFilter OR p.numero_serie ILIKE :itemFilter)';

    if (ADataInicio > 0) and (ADataFim > 0) then
      WhereClause := WhereClause + ' AND m.data_movimentacao BETWEEN :dataInicio AND :dataFim'
    else if ADataInicio > 0 then
      WhereClause := WhereClause + ' AND m.data_movimentacao >= :dataInicio'
    else if ADataFim > 0 then
      WhereClause := WhereClause + ' AND m.data_movimentacao <= :dataFim';

    if WhereClause <> '' then
      Query.SQL.Text := Query.SQL.Text + WhereClause;

    // Configurar parâmetros
    if AItemFilter <> '' then
      Query.ParamByName('itemFilter').AsString := '%' + AItemFilter + '%';

    if (ADataInicio > 0) and (ADataFim > 0) then
    begin
      Query.ParamByName('dataInicio').AsDate := ADataInicio;
      Query.ParamByName('dataFim').AsDate := ADataFim;
    end
    else if ADataInicio > 0 then
      Query.ParamByName('dataInicio').AsDate := ADataInicio
    else if ADataFim > 0 then
      Query.ParamByName('dataFim').AsDate := ADataFim;

    Query.Open;
    Result := Query.FieldByName('total').AsInteger > 0;

  finally
    Query.Free;
  end;
end;

function TRelatorioMovimentacaoRepository.CarregarItens: TStringList;
var
  Query: TFDQuery;
begin
  Result := TStringList.Create;
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := FFDConnection;
    Query.SQL.Text := 'SELECT id, nome FROM patrimonios WHERE ativo = true ORDER BY nome';

    try
      Query.Open;
      Result.Add('Todos'); // Adiciona opção padrão
      while not Query.Eof do
      begin
        if Trim(Query.FieldByName('nome').AsString) <> '' then
          Result.Add(Query.FieldByName('nome').AsString);
        Query.Next;
      end;
    except
      on E: Exception do
      begin
        Result.Free;
        Result := TStringList.Create;
        Result.Add('Todos');
        raise Exception.Create('Erro ao carregar itens: ' + E.Message);
      end;
    end;

  finally
    Query.Free;
  end;
end;

procedure TRelatorioMovimentacaoRepository.PrepararRelatorio(AfrxReport: TfrxReport; AItemFilter: string = ''; ADataInicio: TDate = 0; ADataFim: TDate = 0);
var
  SQLMovimentacao: string;
  SQLEstatisticas: string;
  WhereClause: string;
begin
  try
    // ========== QUERY DE MOVIMENTAÇÃO ==========
    SQLMovimentacao :=
      'SELECT ' +
      '  m.id, ' +
      '  m.data_movimentacao, ' +
      '  u.nome AS usuario, ' +
      '  p.nome AS patrimonio, ' +
      '  p.tipo AS tipo_patrimonio, ' +
      '  p.numero_serie, ' +
      '  so.nome AS sala_origem, ' +
      '  po.nome AS predio_origem, ' +
      '  sd.nome AS sala_destino, ' +
      '  pd.nome AS predio_destino, ' +
      '  m.quantidade, ' +
      '  m.status, ' +
      '  COALESCE(m.observacoes, '''') AS observacoes, ' +
      '  m.fk_id_patrimonios, ' +
      '  m.fk_id_origem, ' +
      '  m.fk_id_destino, ' +
      '  m.fk_id_usuarios ' +
      'FROM movimentacoes m ' +
      'INNER JOIN usuarios u ON m.fk_id_usuarios = u.id ' +
      'INNER JOIN patrimonios p ON m.fk_id_patrimonios = p.id ' +
      'INNER JOIN salas so ON m.fk_id_origem = so.id ' +
      'INNER JOIN predios po ON so.fk_id_predios = po.id ' +
      'INNER JOIN salas sd ON m.fk_id_destino = sd.id ' +
      'INNER JOIN predios pd ON sd.fk_id_predios = pd.id ' +
      'WHERE m.ativo = true';

    WhereClause := '';

    if Trim(AItemFilter) <> '' then
      WhereClause := WhereClause +
        ' AND (p.nome ILIKE ' + QuotedStr('%' + AItemFilter + '%') +
        ' OR p.tipo ILIKE ' + QuotedStr('%' + AItemFilter + '%') +
        ' OR p.numero_serie ILIKE ' + QuotedStr('%' + AItemFilter + '%') + ')';

    if ADataInicio > 0 then
      WhereClause := WhereClause + ' AND m.data_movimentacao >= ' + QuotedStr(FormatDateTime('yyyy-mm-dd', ADataInicio));

    if ADataFim > 0 then
      WhereClause := WhereClause + ' AND m.data_movimentacao <= ' + QuotedStr(FormatDateTime('yyyy-mm-dd', ADataFim));

    SQLMovimentacao := SQLMovimentacao + WhereClause + ' ORDER BY m.data_movimentacao DESC, m.id DESC';

    if Assigned(DataModule2.qryMovimentacao) then
    begin
      DataModule2.qryMovimentacao.Close;
      DataModule2.qryMovimentacao.SQL.Text := SQLMovimentacao;
      DataModule2.qryMovimentacao.Open;
    end;

    // ========== QUERY DE ESTATÍSTICAS (SIMPLIFICADA - SEM JOINS) ==========

    SQLEstatisticas := 'SELECT ' +
      // Total de movimentações
      '(SELECT COUNT(*) FROM movimentacoes m WHERE m.ativo = true';

    if Trim(AItemFilter) <> '' then
      SQLEstatisticas := SQLEstatisticas +
        ' AND EXISTS (SELECT 1 FROM patrimonios p WHERE p.id = m.fk_id_patrimonios ' +
        ' AND (p.nome ILIKE ' + QuotedStr('%' + AItemFilter + '%') +
        ' OR p.tipo ILIKE ' + QuotedStr('%' + AItemFilter + '%') +
        ' OR p.numero_serie ILIKE ' + QuotedStr('%' + AItemFilter + '%') + '))';

    if ADataInicio > 0 then
      SQLEstatisticas := SQLEstatisticas + ' AND m.data_movimentacao >= ' + QuotedStr(FormatDateTime('yyyy-mm-dd', ADataInicio));

    if ADataFim > 0 then
      SQLEstatisticas := SQLEstatisticas + ' AND m.data_movimentacao <= ' + QuotedStr(FormatDateTime('yyyy-mm-dd', ADataFim));

    SQLEstatisticas := SQLEstatisticas + ') as total_movimentacoes, ' +

      // Itens distintos
      '(SELECT COUNT(DISTINCT fk_id_patrimonios) FROM movimentacoes m WHERE m.ativo = true';

    if Trim(AItemFilter) <> '' then
      SQLEstatisticas := SQLEstatisticas +
        ' AND EXISTS (SELECT 1 FROM patrimonios p WHERE p.id = m.fk_id_patrimonios ' +
        ' AND (p.nome ILIKE ' + QuotedStr('%' + AItemFilter + '%') +
        ' OR p.tipo ILIKE ' + QuotedStr('%' + AItemFilter + '%') +
        ' OR p.numero_serie ILIKE ' + QuotedStr('%' + AItemFilter + '%') + '))';

    if ADataInicio > 0 then
      SQLEstatisticas := SQLEstatisticas + ' AND m.data_movimentacao >= ' + QuotedStr(FormatDateTime('yyyy-mm-dd', ADataInicio));

    if ADataFim > 0 then
      SQLEstatisticas := SQLEstatisticas + ' AND m.data_movimentacao <= ' + QuotedStr(FormatDateTime('yyyy-mm-dd', ADataFim));

    SQLEstatisticas := SQLEstatisticas + ') as itens_distintos, ' +

      // Locais distintos
      '(SELECT COUNT(DISTINCT fk_id_destino) FROM movimentacoes m WHERE m.ativo = true';

    if Trim(AItemFilter) <> '' then
      SQLEstatisticas := SQLEstatisticas +
        ' AND EXISTS (SELECT 1 FROM patrimonios p WHERE p.id = m.fk_id_patrimonios ' +
        ' AND (p.nome ILIKE ' + QuotedStr('%' + AItemFilter + '%') +
        ' OR p.tipo ILIKE ' + QuotedStr('%' + AItemFilter + '%') +
        ' OR p.numero_serie ILIKE ' + QuotedStr('%' + AItemFilter + '%') + '))';

    if ADataInicio > 0 then
      SQLEstatisticas := SQLEstatisticas + ' AND m.data_movimentacao >= ' + QuotedStr(FormatDateTime('yyyy-mm-dd', ADataInicio));

    if ADataFim > 0 then
      SQLEstatisticas := SQLEstatisticas + ' AND m.data_movimentacao <= ' + QuotedStr(FormatDateTime('yyyy-mm-dd', ADataFim));

    SQLEstatisticas := SQLEstatisticas + ') as locais_distintos, ' +

      // Quantidade total (SEM JOIN - direto da tabela movimentacoes)
      '(SELECT COALESCE(SUM(quantidade), 0) FROM movimentacoes m WHERE m.ativo = true';

    if Trim(AItemFilter) <> '' then
      SQLEstatisticas := SQLEstatisticas +
        ' AND EXISTS (SELECT 1 FROM patrimonios p WHERE p.id = m.fk_id_patrimonios ' +
        ' AND (p.nome ILIKE ' + QuotedStr('%' + AItemFilter + '%') +
        ' OR p.tipo ILIKE ' + QuotedStr('%' + AItemFilter + '%') +
        ' OR p.numero_serie ILIKE ' + QuotedStr('%' + AItemFilter + '%') + '))';

    if ADataInicio > 0 then
      SQLEstatisticas := SQLEstatisticas + ' AND m.data_movimentacao >= ' + QuotedStr(FormatDateTime('yyyy-mm-dd', ADataInicio));

    if ADataFim > 0 then
      SQLEstatisticas := SQLEstatisticas + ' AND m.data_movimentacao <= ' + QuotedStr(FormatDateTime('yyyy-mm-dd', ADataFim));

    SQLEstatisticas := SQLEstatisticas + ') as total_quantidade, ' +

      // Item mais movimentado
      '(SELECT p.nome FROM movimentacoes m ' +
      'INNER JOIN patrimonios p ON m.fk_id_patrimonios = p.id ' +
      'WHERE m.ativo = true';

    if Trim(AItemFilter) <> '' then
      SQLEstatisticas := SQLEstatisticas +
        ' AND (p.nome ILIKE ' + QuotedStr('%' + AItemFilter + '%') +
        ' OR p.tipo ILIKE ' + QuotedStr('%' + AItemFilter + '%') +
        ' OR p.numero_serie ILIKE ' + QuotedStr('%' + AItemFilter + '%') + ')';

    if ADataInicio > 0 then
      SQLEstatisticas := SQLEstatisticas + ' AND m.data_movimentacao >= ' + QuotedStr(FormatDateTime('yyyy-mm-dd', ADataInicio));

    if ADataFim > 0 then
      SQLEstatisticas := SQLEstatisticas + ' AND m.data_movimentacao <= ' + QuotedStr(FormatDateTime('yyyy-mm-dd', ADataFim));

    SQLEstatisticas := SQLEstatisticas +
      ' GROUP BY p.nome ' +
      ' ORDER BY COUNT(*) DESC, SUM(m.quantidade) DESC ' +
      ' LIMIT 1) as item_mais_movimentado, ' +

      // Local que mais recebeu
      '(SELECT sd.nome || '' - '' || pd.nome ' +
      'FROM movimentacoes m ' +
      'INNER JOIN salas sd ON m.fk_id_destino = sd.id ' +
      'INNER JOIN predios pd ON sd.fk_id_predios = pd.id ' +
      'WHERE m.ativo = true';

    if Trim(AItemFilter) <> '' then
      SQLEstatisticas := SQLEstatisticas +
        ' AND EXISTS (SELECT 1 FROM patrimonios p WHERE p.id = m.fk_id_patrimonios ' +
        ' AND (p.nome ILIKE ' + QuotedStr('%' + AItemFilter + '%') +
        ' OR p.tipo ILIKE ' + QuotedStr('%' + AItemFilter + '%') +
        ' OR p.numero_serie ILIKE ' + QuotedStr('%' + AItemFilter + '%') + '))';

    if ADataInicio > 0 then
      SQLEstatisticas := SQLEstatisticas + ' AND m.data_movimentacao >= ' + QuotedStr(FormatDateTime('yyyy-mm-dd', ADataInicio));

    if ADataFim > 0 then
      SQLEstatisticas := SQLEstatisticas + ' AND m.data_movimentacao <= ' + QuotedStr(FormatDateTime('yyyy-mm-dd', ADataFim));

    SQLEstatisticas := SQLEstatisticas +
      ' GROUP BY sd.nome, pd.nome ' +
      ' ORDER BY COUNT(*) DESC ' +
      ' LIMIT 1) as local_mais_recebeu';

    if Assigned(DataModule2.qryEstatisticas) then
    begin
      DataModule2.qryEstatisticas.Close;
      DataModule2.qryEstatisticas.SQL.Text := SQLEstatisticas;
      DataModule2.qryEstatisticas.Open;
    end;

    // Associar os datasets ao relatório
    AfrxReport.DataSets.Clear;
    AfrxReport.DataSets.Add(DataModule2.FfrxDBDatasetMovimentacao);
    AfrxReport.DataSets.Add(DataModule2.FfrxDBDatasetEstatisticas);

  except
    on E: Exception do
      raise Exception.Create('Erro ao preparar relatório: ' + E.Message);
  end;
end;

procedure TRelatorioMovimentacaoRepository.PrepararDatasets(
  AfrxDBDatasetMovimentacao, AfrxDBDatasetEstatisticas: TfrxDBDataset; AItemFilter: string = ''; ADataInicio: TDate = 0; ADataFim: TDate = 0);
begin
  try
    ConfigurarQuerys(AItemFilter, ADataInicio, ADataFim);

    // Associar os datasets aos parâmetros
    if Assigned(AfrxDBDatasetMovimentacao) then
      AfrxDBDatasetMovimentacao.DataSet := FQueryMovimentacao;

    if Assigned(AfrxDBDatasetEstatisticas) then
      AfrxDBDatasetEstatisticas.DataSet := FQueryEstatisticas;

  except
    on E: Exception do
    begin
      raise Exception.Create('Erro ao preparar datasets: ' + E.Message);
    end;
  end;
end;

end.