unit ControleDePatrimoniosService;

interface

uses
  ControlePatrimonioDTO, PatrimonioRepository, PredioRepository, SalaRepository,
  Data.DB, FireDAC.Comp.Client, System.SysUtils, System.Classes, Vcl.Dialogs;

type
  TControleDePatrimoniosService = class
  private
    FPatrimonioRepository: TPatrimonioRepository;
    FPredioRepository: TPredioRepository;
    FSalaRepository: TSalaRepository;
  public
    constructor Create;
    destructor Destroy; override;

    function ObterEstatisticas: TControlePatrimonioDTO;
    function ObterPatrimoniosParaGrid(AFiltro: TControlePatrimonioFiltroDTO): TDataSet;
    function FiltrarPatrimonios(AFiltro: TControlePatrimonioFiltroDTO): TDataSet;
    function ObterPredios: TStringList;
    function ObterSalas(AIdPredio: Integer = 0): TStringList;
    function ExtrairIdDoItem(AItem: string): Integer;
    procedure CarregarDadosParaQuery(AQuery: TFDQuery; AFiltro: TControlePatrimonioFiltroDTO);
  end;

var
  FControleDePatrimoniosService: TControleDePatrimoniosService;

implementation

{ TControleDePatrimoniosService }

constructor TControleDePatrimoniosService.Create;
begin
  FPatrimonioRepository := TPatrimonioRepository.Create;
  FPredioRepository := TPredioRepository.Create;
  FSalaRepository := TSalaRepository.Create;
end;

destructor TControleDePatrimoniosService.Destroy;
begin
  FreeAndNil(FPatrimonioRepository);
  FreeAndNil(FPredioRepository);
  FreeAndNil(FSalaRepository);
  inherited;
end;

function TControleDePatrimoniosService.ExtrairIdDoItem(AItem: string): Integer;
var
  PosAbre, PosFecha: Integer;
  IdStr: string;
begin
  Result := 0;

  if Trim(AItem) = '' then
    Exit;

  // Se for "Todos os prédios" ou "Todas as salas", retorna 0
  if (Pos('Todos', AItem) > 0) or (Pos('Todas', AItem) > 0) then
    Exit;

  // Extrair ID entre colchetes: [123] Nome do Item
  PosAbre := Pos('[', AItem);
  PosFecha := Pos(']', AItem);

  if (PosAbre > 0) and (PosFecha > PosAbre) then
  begin
    IdStr := Copy(AItem, PosAbre + 1, PosFecha - PosAbre - 1);
    Result := StrToIntDef(Trim(IdStr), 0);
  end;
end;

function TControleDePatrimoniosService.ObterEstatisticas: TControlePatrimonioDTO;
begin
  Result := FPatrimonioRepository.ObterEstatisticas;
end;

function TControleDePatrimoniosService.ObterPatrimoniosParaGrid(
  AFiltro: TControlePatrimonioFiltroDTO): TDataSet;
begin
  Result := FPatrimonioRepository.ObterPatrimoniosParaGrid(AFiltro);
end;

function TControleDePatrimoniosService.FiltrarPatrimonios(
  AFiltro: TControlePatrimonioFiltroDTO): TDataSet;
begin
  Result := FPatrimonioRepository.ObterPatrimoniosParaGrid(AFiltro);
end;

function TControleDePatrimoniosService.ObterPredios: TStringList;
begin
  Result := FPatrimonioRepository.ObterPredios;
end;

function TControleDePatrimoniosService.ObterSalas(AIdPredio: Integer = 0): TStringList;
begin
  Result := FPatrimonioRepository.ObterSalas(AIdPredio);
end;

procedure TControleDePatrimoniosService.CarregarDadosParaQuery(
  AQuery: TFDQuery; AFiltro: TControlePatrimonioFiltroDTO);
var
  SQL: string;
begin
  // Montar SQL dinamicamente sem usar parâmetros do repository
  SQL :=
    'SELECT ' +
    '  p.id, ' +
    '  p.nome, ' +
    '  p.tipo, ' +
    '  p.situacao, ' +
    '  p.modelo, ' +
    '  p.valor_atual, ' +
    '  p.numero_serie, ' +
    '  p.data_aquisicao, ' +
    '  pred.nome AS nome_predio, ' +
    '  s.nome AS nome_sala, ' +
    '  (SELECT MAX(data_movimentacao) FROM movimentacoes WHERE fk_id_patrimonios = p.id) AS ultima_movimentacao, ' +
    '  (SELECT COUNT(*) FROM ocorrencias WHERE fk_id_patrimonios = p.id AND status IN (''ANALISADA'', ''PENDENTE'')) AS total_ocorrencias ' +
    'FROM patrimonios p ' +
    'INNER JOIN salas s ON p.fk_id_salas = s.id ' +
    'INNER JOIN predios pred ON s.fk_id_predios = pred.id ' +
    'WHERE p.ativo = true';

  // Adicionar filtros
  if AFiltro.TextoBusca <> '' then
    SQL := SQL + ' AND (p.nome ILIKE :texto_busca OR p.tipo ILIKE :texto_busca OR p.numero_serie ILIKE :texto_busca OR pred.nome ILIKE :texto_busca OR s.nome ILIKE :texto_busca)';

  if (AFiltro.DataInicio > 0) and (AFiltro.DataFim > 0) then
    SQL := SQL + ' AND p.data_aquisicao BETWEEN :data_inicio AND :data_fim';

  if AFiltro.IdPredio > 0 then
    SQL := SQL + ' AND pred.id = :id_predio';

  if AFiltro.IdSala > 0 then
    SQL := SQL + ' AND s.id = :id_sala';

  SQL := SQL + ' ORDER BY p.id';

  // Limpar e configurar query
  AQuery.Close;
  AQuery.SQL.Text := SQL;

  // Adicionar parâmetros apenas se necessários
  if AFiltro.TextoBusca <> '' then
  begin
    AQuery.ParamByName('texto_busca').AsString := '%' + AFiltro.TextoBusca + '%';
  end;

  if (AFiltro.DataInicio > 0) and (AFiltro.DataFim > 0) then
  begin
    AQuery.ParamByName('data_inicio').AsDate := AFiltro.DataInicio;
    AQuery.ParamByName('data_fim').AsDate := AFiltro.DataFim;
  end;

  if AFiltro.IdPredio > 0 then
    AQuery.ParamByName('id_predio').AsInteger := AFiltro.IdPredio;

  if AFiltro.IdSala > 0 then
    AQuery.ParamByName('id_sala').AsInteger := AFiltro.IdSala;

  // Executar query
  try
    AQuery.Open;
  except
    on E: Exception do
    begin
      // Detalhar o erro para debug
      raise Exception.Create('Erro ao executar query de filtro: ' + E.Message +
        '. SQL: ' + SQL +
        '. IdPredio: ' + IntToStr(AFiltro.IdPredio) +
        '. IdSala: ' + IntToStr(AFiltro.IdSala));
    end;
  end;
end;

end.