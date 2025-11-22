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

    procedure CarregarDadosParaQuery(AQuery: TFDQuery; AFiltro: TControlePatrimonioFiltroDTO);

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

  // ✅ CORREÇÃO: Formato correto do FormatCurr
  // Debug temporário para verificar o valor bruto
  ShowMessage('Valor total bruto do banco: ' + CurrToStr(Estatisticas.ValorTotal));
  ALabelValorTotal.Caption := FormatCurr('R$ #,##0.00', Estatisticas.ValorTotal);  // Era: 'R$ ,0.00'

  ALabelPatrimoniosAtivos.Caption := IntToStr(Estatisticas.PatrimoniosAtivos);
  ALabelEmManutencao.Caption := IntToStr(Estatisticas.EmManutencao);
  ALabelOcorrencias.Caption := IntToStr(Estatisticas.TotalOcorrencias);
end;


procedure TControleDePatrimoniosController.CarregarDadosGrid(
  AQuery: TFDQuery; AFiltro: TControlePatrimonioFiltroDTO);
begin
  FService.CarregarDadosParaQuery(AQuery, AFiltro);
end;

procedure TControleDePatrimoniosController.CarregarDadosParaQuery(
  AQuery: TFDQuery; AFiltro: TControlePatrimonioFiltroDTO);
begin
  // Usa o novo método que configura a query diretamente sem copiar parâmetros
  FService.CarregarDadosParaQuery(AQuery, AFiltro);
end;

procedure TControleDePatrimoniosController.CarregarPredios(AComboBox: TComboBox);
var
  Lista: TStringList;
begin
  Lista := FService.ObterPredios;
  try
    AComboBox.Items.Clear;
    // Adicionar "Todos os prédios" manualmente como primeira opção (index 0)
    AComboBox.Items.Add('Todos os prédios');
    // Adicionar os prédios do banco de dados
    if Lista.Count > 0 then
      AComboBox.Items.AddStrings(Lista);
    // Sempre selecionar a primeira opção
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
    // Adicionar "Todas as salas" manualmente como primeira opção (index 0)
    AComboBox.Items.Add('Todas as salas');
    // Adicionar as salas do banco de dados
    if Lista.Count > 0 then
      AComboBox.Items.AddStrings(Lista);
    // Sempre selecionar a primeira opção
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