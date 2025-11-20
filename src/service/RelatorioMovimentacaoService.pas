unit RelatorioMovimentacaoService;

interface

uses
  System.SysUtils, RelatorioMovimentacaoRepository, frxClass, Data.DB, FireDAC.Comp.Client, frxDBSet, Classes;

type
  TRelatorioMovimentacaoService = class
  private
    FRepository: TRelatorioMovimentacaoRepository;
  public
    constructor Create(AConnection: TFDConnection);
    destructor Destroy; override;

    function VerificarDadosExistentes(AItemFilter: string = ''; ADataInicio: TDate = 0; ADataFim: TDate = 0): Boolean;
    function CarregarItens: TStringList;
    procedure GerarRelatorio(AfrxReport: TfrxReport; AItemFilter: string = ''; ADataInicio: TDate = 0; ADataFim: TDate = 0);
    procedure PrepararDatasets(AfrxDBDatasetMovimentacao, AfrxDBDatasetEstatisticas: TfrxDBDataset; AItemFilter: string = ''; ADataInicio: TDate = 0; ADataFim: TDate = 0);
  end;

implementation

{ TRelatorioMovimentacaoService }

constructor TRelatorioMovimentacaoService.Create(AConnection: TFDConnection);
begin
  FRepository := TRelatorioMovimentacaoRepository.Create(AConnection);
end;

destructor TRelatorioMovimentacaoService.Destroy;
begin
  FRepository.Free;
  inherited;
end;

function TRelatorioMovimentacaoService.VerificarDadosExistentes(AItemFilter: string = ''; ADataInicio: TDate = 0; ADataFim: TDate = 0): Boolean;
begin
  Result := FRepository.VerificarDadosExistentes(AItemFilter, ADataInicio, ADataFim);
end;

function TRelatorioMovimentacaoService.CarregarItens: TStringList;
begin
  try
    Result := FRepository.CarregarItens;
  except
    on E: Exception do
    begin
      raise Exception.Create('Erro ao carregar itens: ' + E.Message);
    end;
  end;
end;

procedure TRelatorioMovimentacaoService.GerarRelatorio(AfrxReport: TfrxReport; AItemFilter: string = ''; ADataInicio: TDate = 0; ADataFim: TDate = 0);
begin
  try
    FRepository.PrepararRelatorio(AfrxReport, AItemFilter, ADataInicio, ADataFim);
  except
    on E: Exception do
    begin
      raise Exception.Create('Erro ao gerar relatório de movimentação: ' + E.Message);
    end;
  end;
end;

procedure TRelatorioMovimentacaoService.PrepararDatasets(
  AfrxDBDatasetMovimentacao, AfrxDBDatasetEstatisticas: TfrxDBDataset; AItemFilter: string = ''; ADataInicio: TDate = 0; ADataFim: TDate = 0);
begin
  try
    FRepository.PrepararDatasets(AfrxDBDatasetMovimentacao, AfrxDBDatasetEstatisticas, AItemFilter, ADataInicio, ADataFim);
  except
    on E: Exception do
    begin
      raise Exception.Create('Erro ao preparar datasets do relatório: ' + E.Message);
    end;
  end;
end;

end.