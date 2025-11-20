unit RelatorioMovimentacaoController;

interface

uses
  System.SysUtils, RelatorioMovimentacaoService, frxClass, Data.DB, FireDAC.Comp.Client, frxDBSet, Classes;

type
  TRelatorioMovimentacaoController = class
  private
    FService: TRelatorioMovimentacaoService;
  public
    constructor Create(AConnection: TFDConnection);
    destructor Destroy; override;

    function VerificarDadosExistentes(AItemFilter: string = ''; ADataInicio: TDate = 0; ADataFim: TDate = 0): Boolean;
    function CarregarItens: TStringList;
    procedure GerarRelatorio(AfrxReport: TfrxReport; AItemFilter: string = ''; ADataInicio: TDate = 0; ADataFim: TDate = 0);
    procedure PrepararDatasets(AfrxDBDatasetMovimentacao, AfrxDBDatasetEstatisticas: TfrxDBDataset; AItemFilter: string = ''; ADataInicio: TDate = 0; ADataFim: TDate = 0);
  end;

implementation

{ TRelatorioMovimentacaoController }

constructor TRelatorioMovimentacaoController.Create(AConnection: TFDConnection);
begin
  FService := TRelatorioMovimentacaoService.Create(AConnection);
end;

destructor TRelatorioMovimentacaoController.Destroy;
begin
  FService.Free;
  inherited;
end;

function TRelatorioMovimentacaoController.VerificarDadosExistentes(AItemFilter: string = ''; ADataInicio: TDate = 0; ADataFim: TDate = 0): Boolean;
begin
  Result := FService.VerificarDadosExistentes(AItemFilter, ADataInicio, ADataFim);
end;

function TRelatorioMovimentacaoController.CarregarItens: TStringList;
begin
  try
    Result := FService.CarregarItens;
  except
    on E: Exception do
    begin
      raise Exception.Create('Erro no controller ao carregar itens: ' + E.Message);
    end;
  end;
end;

procedure TRelatorioMovimentacaoController.GerarRelatorio(AfrxReport: TfrxReport; AItemFilter: string = ''; ADataInicio: TDate = 0; ADataFim: TDate = 0);
begin
  try
    FService.GerarRelatorio(AfrxReport, AItemFilter, ADataInicio, ADataFim);
  except
    on E: Exception do
    begin
      raise Exception.Create('Erro no controller do relatório de movimentação: ' + E.Message);
    end;
  end;
end;

procedure TRelatorioMovimentacaoController.PrepararDatasets(
  AfrxDBDatasetMovimentacao, AfrxDBDatasetEstatisticas: TfrxDBDataset; AItemFilter: string = ''; ADataInicio: TDate = 0; ADataFim: TDate = 0);
begin
  try
    FService.PrepararDatasets(AfrxDBDatasetMovimentacao, AfrxDBDatasetEstatisticas, AItemFilter, ADataInicio, ADataFim);
  except
    on E: Exception do
    begin
      raise Exception.Create('Erro no controller ao preparar datasets: ' + E.Message);
    end;
  end;
end;

end.