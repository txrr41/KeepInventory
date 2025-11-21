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
    '  1 as quantidade, ' +
    '  m.status, ' +
    '  m.ativo, ' +
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
    // Log para depuração
    if FQueryMovimentacao.RecordCount > 0 then
      FQueryMovimentacao.First;
  except
    on E: Exception do
    begin
      raise Exception.Create('Erro ao abrir query de movimentação: ' + E.Message + ' - SQL: ' + FQueryMovimentacao.SQL.Text);
    end;
  end;

  // ==================== QUERY DE ESTATÍSTICAS ====================

  FQueryEstatisticas.Close;
  FQueryEstatisticas.SQL.Clear;

  // Query com estatísticas reais
  SQLBase :=
    'SELECT ' +
    '  COUNT(*) as total_movimentacoes, ' +
    '  COUNT(DISTINCT m.fk_id_patrimonios) as itens_distintos, ' +
    '  COUNT(DISTINCT m.fk_id_destino) as locais_distintos, ' +
    '  COUNT(*) as total_quantidade, ' +
    '  (SELECT p.nome FROM patrimonios p ' +
    '   INNER JOIN movimentacoes m2 ON p.id = m2.fk_id_patrimonios ' +
    '   WHERE m2.ativo = true ' +
    '   GROUP BY p.id, p.nome ' +
    '   ORDER BY COUNT(m2.id) DESC LIMIT 1) as item_mais_movimentado, ' +
    '  (SELECT sd.nome || '' - '' || pd.nome ' +
    '   FROM movimentacoes m3 ' +
    '   INNER JOIN salas sd ON m3.fk_id_destino = sd.id ' +
    '   INNER JOIN predios pd ON sd.fk_id_predios = pd.id ' +
    '   WHERE m3.ativo = true ' +
    '   GROUP BY sd.id, sd.nome, pd.id, pd.nome ' +
    '   ORDER BY COUNT(m3.id) DESC LIMIT 1) as local_mais_recebeu ' +
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
    WhereClause := ' AND (p.nome ILIKE :itemFilter2 OR p.tipo ILIKE :itemFilter2 OR p.numero_serie ILIKE :itemFilter2)';

  if (ADataInicio > 0) and (ADataFim > 0) then
    WhereClause := WhereClause + ' AND m.data_movimentacao BETWEEN :dataInicio2 AND :dataFim2'
  else if ADataInicio > 0 then
    WhereClause := WhereClause + ' AND m.data_movimentacao >= :dataInicio2'
  else if ADataFim > 0 then
    WhereClause := WhereClause + ' AND m.data_movimentacao <= :dataFim2';

  // Atualizar as subqueries para considerar os filtros também
  if Trim(AItemFilter) <> '' then
  begin
    SQLBase := StringReplace(SQLBase,
      'WHERE m2.ativo = true',
      'WHERE m2.ativo = true AND EXISTS (SELECT 1 FROM patrimonios pf WHERE pf.id = m2.fk_id_patrimonios AND (pf.nome ILIKE :itemFilter2 OR pf.tipo ILIKE :itemFilter2 OR pf.numero_serie ILIKE :itemFilter2))',
      [rfReplaceAll]);

    SQLBase := StringReplace(SQLBase,
      'WHERE m3.ativo = true',
      'WHERE m3.ativo = true AND EXISTS (SELECT 1 FROM patrimonios pf2 WHERE pf2.id = m3.fk_id_patrimonios AND (pf2.nome ILIKE :itemFilter2 OR pf2.tipo ILIKE :itemFilter2 OR pf2.numero_serie ILIKE :itemFilter2))',
      [rfReplaceAll]);
  end;

  if (ADataInicio > 0) and (ADataFim > 0) then
  begin
    SQLBase := StringReplace(SQLBase,
      'WHERE m2.ativo = true',
      'WHERE m2.ativo = true AND m2.data_movimentacao BETWEEN :dataInicio2 AND :dataFim2',
      [rfReplaceAll]);
    SQLBase := StringReplace(SQLBase,
      'WHERE m3.ativo = true',
      'WHERE m3.ativo = true AND m3.data_movimentacao BETWEEN :dataInicio2 AND :dataFim2',
      [rfReplaceAll]);
  end
  else if ADataInicio > 0 then
  begin
    SQLBase := StringReplace(SQLBase,
      'WHERE m2.ativo = true',
      'WHERE m2.ativo = true AND m2.data_movimentacao >= :dataInicio2',
      [rfReplaceAll]);
    SQLBase := StringReplace(SQLBase,
      'WHERE m3.ativo = true',
      'WHERE m3.ativo = true AND m3.data_movimentacao >= :dataInicio2',
      [rfReplaceAll]);
  end
  else if ADataFim > 0 then
  begin
    SQLBase := StringReplace(SQLBase,
      'WHERE m2.ativo = true',
      'WHERE m2.ativo = true AND m2.data_movimentacao <= :dataFim2',
      [rfReplaceAll]);
    SQLBase := StringReplace(SQLBase,
      'WHERE m3.ativo = true',
      'WHERE m3.ativo = true AND m3.data_movimentacao <= :dataFim2',
      [rfReplaceAll]);
  end;

  FQueryEstatisticas.SQL.Text := SQLBase + WhereClause;

  // Configurar parâmetros APÓS construir o SQL
  if Trim(AItemFilter) <> '' then
  begin
    FQueryEstatisticas.ParamByName('itemFilter2').AsString := '%' + AItemFilter + '%';
  end;

  if (ADataInicio > 0) and (ADataFim > 0) then
  begin
    FQueryEstatisticas.ParamByName('dataInicio2').AsDate := ADataInicio;
    FQueryEstatisticas.ParamByName('dataFim2').AsDate := ADataFim;
  end
  else if ADataInicio > 0 then
  begin
    FQueryEstatisticas.ParamByName('dataInicio2').AsDate := ADataInicio;
  end
  else if ADataFim > 0 then
  begin
    FQueryEstatisticas.ParamByName('dataFim2').AsDate := ADataFim;
  end;

  try
    FQueryEstatisticas.Open;
    // Log para depuração
    if FQueryEstatisticas.RecordCount > 0 then
    begin
      FQueryEstatisticas.First;
    end;
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
begin
  try
    // Atualiza diretamente as queries do DataModule2
    if Assigned(DataModule2.qryMovimentacao) then
    begin
      DataModule2.qryMovimentacao.Close;

      // Monta a SQL diretamente para movimentação
      DataModule2.qryMovimentacao.SQL.Text :=
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
        '  1 as quantidade, ' +
        '  m.status, ' +
        '  m.ativo, ' +
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

      // Aplica filtros se necessário
      if Trim(AItemFilter) <> '' then
        DataModule2.qryMovimentacao.SQL.Add(' AND (p.nome ILIKE :itemFilter OR p.tipo ILIKE :itemFilter OR p.numero_serie ILIKE :itemFilter)');

      if (ADataInicio > 0) and (ADataFim > 0) then
        DataModule2.qryMovimentacao.SQL.Add(' AND m.data_movimentacao BETWEEN :dataInicio AND :dataFim')
      else if ADataInicio > 0 then
        DataModule2.qryMovimentacao.SQL.Add(' AND m.data_movimentacao >= :dataInicio')
      else if ADataFim > 0 then
        DataModule2.qryMovimentacao.SQL.Add(' AND m.data_movimentacao <= :dataFim');

      DataModule2.qryMovimentacao.SQL.Add(' ORDER BY m.data_movimentacao DESC, m.id DESC');

      // Configura parâmetros
      if Trim(AItemFilter) <> '' then
        DataModule2.qryMovimentacao.ParamByName('itemFilter').AsString := '%' + AItemFilter + '%';

      if (ADataInicio > 0) and (ADataFim > 0) then
      begin
        DataModule2.qryMovimentacao.ParamByName('dataInicio').AsDate := ADataInicio;
        DataModule2.qryMovimentacao.ParamByName('dataFim').AsDate := ADataFim;
      end
      else if ADataInicio > 0 then
        DataModule2.qryMovimentacao.ParamByName('dataInicio').AsDate := ADataInicio
      else if ADataFim > 0 then
        DataModule2.qryMovimentacao.ParamByName('dataFim').AsDate := ADataFim;

      DataModule2.qryMovimentacao.Open;

      // Garantir que o dataset está no primeiro registro
      DataModule2.qryMovimentacao.First;
    end;

    if Assigned(DataModule2.qryEstatisticas) then
    begin
      DataModule2.qryEstatisticas.Close;

      // Monta a SQL completa para estatísticas (com valores reais)
      DataModule2.qryEstatisticas.SQL.Text :=
        'SELECT ' +
        '  COUNT(*) as total_movimentacoes, ' +
        '  COUNT(DISTINCT m.fk_id_patrimonios) as itens_distintos, ' +
        '  COUNT(DISTINCT m.fk_id_destino) as locais_distintos, ' +
        '  COUNT(*) as total_quantidade, ' +
        '  (SELECT p.nome FROM patrimonios p ' +
        '   INNER JOIN movimentacoes m2 ON p.id = m2.fk_id_patrimonios ' +
        '   WHERE m2.ativo = true ' +
        '   GROUP BY p.id, p.nome ' +
        '   ORDER BY COUNT(m2.id) DESC LIMIT 1) as item_mais_movimentado, ' +
        '  (SELECT sd.nome || '' - '' || pd.nome ' +
        '   FROM movimentacoes m3 ' +
        '   INNER JOIN salas sd ON m3.fk_id_destino = sd.id ' +
        '   INNER JOIN predios pd ON sd.fk_id_predios = pd.id ' +
        '   WHERE m3.ativo = true ' +
        '   GROUP BY sd.id, sd.nome, pd.id, pd.nome ' +
        '   ORDER BY COUNT(m3.id) DESC LIMIT 1) as local_mais_recebeu ' +
        'FROM movimentacoes m ' +
        'INNER JOIN usuarios u ON m.fk_id_usuarios = u.id ' +
        'INNER JOIN patrimonios p ON m.fk_id_patrimonios = p.id ' +
        'INNER JOIN salas so ON m.fk_id_origem = so.id ' +
        'INNER JOIN predios po ON so.fk_id_predios = po.id ' +
        'INNER JOIN salas sd ON m.fk_id_destino = sd.id ' +
        'INNER JOIN predios pd ON sd.fk_id_predios = pd.id ' +
        'WHERE m.ativo = true';

      // Prepara a variável SQL para aplicar filtros também nas subqueries
      var SQLText := DataModule2.qryEstatisticas.SQL.Text;

      // Atualizar as subqueries para considerar os filtros também
      if Trim(AItemFilter) <> '' then
      begin
        SQLText := StringReplace(SQLText,
          'WHERE m2.ativo = true',
          'WHERE m2.ativo = true AND EXISTS (SELECT 1 FROM patrimonios pf WHERE pf.id = m2.fk_id_patrimonios AND (pf.nome ILIKE :itemFilter OR pf.tipo ILIKE :itemFilter OR pf.numero_serie ILIKE :itemFilter))',
          [rfReplaceAll]);

        SQLText := StringReplace(SQLText,
          'WHERE m3.ativo = true',
          'WHERE m3.ativo = true AND EXISTS (SELECT 1 FROM patrimonios pf2 WHERE pf2.id = m3.fk_id_patrimonios AND (pf2.nome ILIKE :itemFilter OR pf2.tipo ILIKE :itemFilter OR pf2.numero_serie ILIKE :itemFilter))',
          [rfReplaceAll]);
      end;

      if (ADataInicio > 0) and (ADataFim > 0) then
      begin
        SQLText := StringReplace(SQLText,
          'WHERE m2.ativo = true',
          'WHERE m2.ativo = true AND m2.data_movimentacao BETWEEN :dataInicio AND :dataFim',
          [rfReplaceAll]);
        SQLText := StringReplace(SQLText,
          'WHERE m3.ativo = true',
          'WHERE m3.ativo = true AND m3.data_movimentacao BETWEEN :dataInicio AND :dataFim',
          [rfReplaceAll]);
      end
      else if ADataInicio > 0 then
      begin
        SQLText := StringReplace(SQLText,
          'WHERE m2.ativo = true',
          'WHERE m2.ativo = true AND m2.data_movimentacao >= :dataInicio',
          [rfReplaceAll]);
        SQLText := StringReplace(SQLText,
          'WHERE m3.ativo = true',
          'WHERE m3.ativo = true AND m3.data_movimentacao >= :dataInicio',
          [rfReplaceAll]);
      end
      else if ADataFim > 0 then
      begin
        SQLText := StringReplace(SQLText,
          'WHERE m2.ativo = true',
          'WHERE m2.ativo = true AND m2.data_movimentacao <= :dataFim',
          [rfReplaceAll]);
        SQLText := StringReplace(SQLText,
          'WHERE m3.ativo = true',
          'WHERE m3.ativo = true AND m3.data_movimentacao <= :dataFim',
          [rfReplaceAll]);
      end;

      DataModule2.qryEstatisticas.SQL.Text := SQLText;

      // Aplica os filtros na query principal
      if Trim(AItemFilter) <> '' then
        DataModule2.qryEstatisticas.SQL.Add(' AND (p.nome ILIKE :itemFilter OR p.tipo ILIKE :itemFilter OR p.numero_serie ILIKE :itemFilter)');

      if (ADataInicio > 0) and (ADataFim > 0) then
        DataModule2.qryEstatisticas.SQL.Add(' AND m.data_movimentacao BETWEEN :dataInicio AND :dataFim')
      else if ADataInicio > 0 then
        DataModule2.qryEstatisticas.SQL.Add(' AND m.data_movimentacao >= :dataInicio')
      else if ADataFim > 0 then
        DataModule2.qryEstatisticas.SQL.Add(' AND m.data_movimentacao <= :dataFim');

      // Configura parâmetros
      if Trim(AItemFilter) <> '' then
        DataModule2.qryEstatisticas.ParamByName('itemFilter').AsString := '%' + AItemFilter + '%';

      if (ADataInicio > 0) and (ADataFim > 0) then
      begin
        DataModule2.qryEstatisticas.ParamByName('dataInicio').AsDate := ADataInicio;
        DataModule2.qryEstatisticas.ParamByName('dataFim').AsDate := ADataFim;
      end
      else if ADataInicio > 0 then
        DataModule2.qryEstatisticas.ParamByName('dataInicio').AsDate := ADataInicio
      else if ADataFim > 0 then
        DataModule2.qryEstatisticas.ParamByName('dataFim').AsDate := ADataFim;

      DataModule2.qryEstatisticas.Open;

      // Garantir que o dataset está no primeiro registro
      DataModule2.qryEstatisticas.First;
    end;

    // Associar os datasets ao relatório - método alternativo
    AfrxReport.DataSets.Clear;

    // Configurar o dataset principal primeiro
    DataModule2.FfrxDBDatasetMovimentacao.DataSet := DataModule2.qryMovimentacao;
    DataModule2.FfrxDBDatasetEstatisticas.DataSet := DataModule2.qryEstatisticas;

    // Adicionar datasets na ordem correta
    AfrxReport.DataSets.Add(DataModule2.FfrxDBDatasetMovimentacao);
    AfrxReport.DataSets.Add(DataModule2.FfrxDBDatasetEstatisticas);

    // Forçar reset completo do relatório
    AfrxReport.Clear;
    AfrxReport.LoadFromFile('Reports\RelatorioMovimentacao.fr3');

    // Reconfigurar datasets após carregar
    AfrxReport.DataSets.Clear;
    DataModule2.FfrxDBDatasetMovimentacao.DataSet := DataModule2.qryMovimentacao;
    DataModule2.FfrxDBDatasetEstatisticas.DataSet := DataModule2.qryEstatisticas;
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

    // Debug - mostrar quantos registros retornam


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