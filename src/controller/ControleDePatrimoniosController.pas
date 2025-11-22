unit ControleDePatrimoniosController;

interface

uses
  ControlePatrimonioDTO, ControleDePatrimoniosService, Vcl.StdCtrls,
  Vcl.ComCtrls, Data.DB, System.Classes, Vcl.Forms, System.SysUtils, dialogs,
  FireDAC.Comp.Client;

type
  TControleDePatrimoniosController = class
  private
    FService: TControleDePatrimoniosService;
  public
    constructor Create;
    destructor Destroy; override;

    procedure AtualizarEstatisticas(
      var ALabelTotalItens: TLabel;
      var ALabelValorTotal: TLabel;
      var ALabelPatrimoniosAtivos: TLabel;
      var ALabelEmManutencao: TLabel;
      var ALabelOcorrencias: TLabel
    );

    procedure CarregarDadosGrid(AQuery: TFDQuery; AFiltro: TControlePatrimonioFiltroDTO);

    function GetSQLFromFiltro(AFiltro: TControlePatrimonioFiltroDTO): string;
    procedure SetParamsFromFiltro(AQuery: TFDQuery; AFiltro: TControlePatrimonioFiltroDTO);

    procedure CarregarPredios(AComboBox: TComboBox);
    procedure CarregarSalas(AComboBox: TComboBox; AIdPredio: Integer = 0);

    function FiltrarPatrimonios(AFiltro: TControlePatrimonioFiltroDTO): TDataSet;
    function ExtrairIdDoItem(AItem: string): Integer;
  end;

var
  FControleDePatrimoniosController: TControleDePatrimoniosController;

implementation

{ TControleDePatrimoniosController }

constructor TControleDePatrimoniosController.Create;
begin
  FService := TControleDePatrimoniosService.Create;
end;

destructor TControleDePatrimoniosController.Destroy;
begin
  FreeAndNil(FService);
  inherited;
end;

procedure TControleDePatrimoniosController.AtualizarEstatisticas(
  var ALabelTotalItens: TLabel;
  var ALabelValorTotal: TLabel;
  var ALabelPatrimoniosAtivos: TLabel;
  var ALabelEmManutencao: TLabel;
  var ALabelOcorrencias: TLabel);
var
  Estatisticas: TControlePatrimonioDTO;
begin
  Estatisticas := FService.ObterEstatisticas;

  ALabelTotalItens.Caption := IntToStr(Estatisticas.TotalItens);
  ALabelValorTotal.Caption := FormatCurr('R$ ,0.00', Estatisticas.ValorTotal);
  ALabelPatrimoniosAtivos.Caption := IntToStr(Estatisticas.PatrimoniosAtivos);
  ALabelEmManutencao.Caption := IntToStr(Estatisticas.EmManutencao);
  ALabelOcorrencias.Caption := IntToStr(Estatisticas.TotalOcorrencias);
end;

procedure TControleDePatrimoniosController.CarregarDadosGrid(
  AQuery: TFDQuery; AFiltro: TControlePatrimonioFiltroDTO);
begin
  // O Service já retorna uma query configurada, apenas usamos diretamente
  AQuery.Close;
  AQuery.SQL.Text := GetSQLFromFiltro(AFiltro);
  SetParamsFromFiltro(AQuery, AFiltro);
  AQuery.Open;
end;

function TControleDePatrimoniosController.GetSQLFromFiltro(
  AFiltro: TControlePatrimonioFiltroDTO): string;
var
  SQL: string;
begin
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
    'WHERE 1=1';

  if AFiltro.TextoBusca <> '' then
    SQL := SQL + ' AND (p.nome ILIKE :texto_busca OR p.tipo ILIKE :texto_busca OR p.numero_serie ILIKE :texto_busca OR pred.nome ILIKE :texto_busca OR s.nome ILIKE :texto_busca)';

  if (AFiltro.DataInicio > 0) and (AFiltro.DataFim > 0) then
    SQL := SQL + ' AND p.data_aquisicao BETWEEN :data_inicio AND :data_fim';

  if AFiltro.IdPredio > 0 then
    SQL := SQL + ' AND pred.id = :id_predio';

  if AFiltro.IdSala > 0 then
    SQL := SQL + ' AND s.id = :id_sala';

  SQL := SQL + ' ORDER BY p.id';
  Result := SQL;
end;

procedure TControleDePatrimoniosController.SetParamsFromFiltro(
  AQuery: TFDQuery; AFiltro: TControlePatrimonioFiltroDTO);
begin
  if AFiltro.TextoBusca <> '' then
    AQuery.ParamByName('texto_busca').AsString := '%' + AFiltro.TextoBusca + '%';

  if (AFiltro.DataInicio > 0) and (AFiltro.DataFim > 0) then
  begin
    AQuery.ParamByName('data_inicio').AsDate := AFiltro.DataInicio;
    AQuery.ParamByName('data_fim').AsDate := AFiltro.DataFim;
  end;

  if AFiltro.IdPredio > 0 then
    AQuery.ParamByName('id_predio').AsInteger := AFiltro.IdPredio;

  if AFiltro.IdSala > 0 then
    AQuery.ParamByName('id_sala').AsInteger := AFiltro.IdSala;
end;

procedure TControleDePatrimoniosController.CarregarPredios(AComboBox: TComboBox);
var
  Lista: TStringList;
begin
  Lista := FService.ObterPredios;
  try
    AComboBox.Items.Clear;
    AComboBox.Items.Add('Todos os prédios');
    AComboBox.Items.Assign(Lista);
    AComboBox.ItemIndex := 0;
  finally
    Lista.Free;
  end;
end;

procedure TControleDePatrimoniosController.CarregarSalas(
  AComboBox: TComboBox; AIdPredio: Integer = 0);
var
  Lista: TStringList;
begin
  Lista := FService.ObterSalas(AIdPredio);
  try
    AComboBox.Items.Clear;
    AComboBox.Items.Add('Todas as salas');
    AComboBox.Items.Assign(Lista);
    AComboBox.ItemIndex := 0;
  finally
    Lista.Free;
  end;
end;

function TControleDePatrimoniosController.FiltrarPatrimonios(
  AFiltro: TControlePatrimonioFiltroDTO): TDataSet;
begin
  Result := FService.FiltrarPatrimonios(AFiltro);
end;

function TControleDePatrimoniosController.ExtrairIdDoItem(AItem: string): Integer;
begin
  Result := FService.ExtrairIdDoItem(AItem);
end;

end.