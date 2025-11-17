unit AnaliseOcorrenciaController;

interface

uses
  OcorrenciaModel, OcorrenciaDTO, AnaliseOcorrenciaService, OcorrenciaRepository,
  System.SysUtils, Vcl.StdCtrls, System.Classes, Data.DB, FireDAC.Comp.Client;

type
  TAnaliseOcorrenciaController = class
  public
    function ListarOcorrenciasPendentes: TDataSet;
    function PesquisarOcorrencia(const aSearch: String): TDataSet;
    procedure AvaliarOcorrencia(AAvaliacaoDTO: TAvaliacaoOcorrenciaDTO);
    function ObterDetalhesOcorrencia(AIdOcorrencia: Integer): TOcorrenciaModel;
    function ObterValorPatrimonio(AIdPatrimonio: Integer): Currency;
    function CalcularDepreciacaoAcumulada(AIdPatrimonio: Integer): Currency;
    function ObterHistoricoDepreciacoes(AIdPatrimonio: Integer): TFDQuery;
    function CalcularNovoValor(AValorAtual: Currency; APercentualDepreciacao: Currency): Currency;
  end;

var
  FAnaliseOcorrenciaController: TAnaliseOcorrenciaController;

implementation

{ TAnaliseOcorrenciaController }

procedure TAnaliseOcorrenciaController.AvaliarOcorrencia(
  AAvaliacaoDTO: TAvaliacaoOcorrenciaDTO);
begin
  FAnaliseOcorrenciaService.AvaliarOcorrencia(AAvaliacaoDTO);
end;

function TAnaliseOcorrenciaController.CalcularDepreciacaoAcumulada(
  AIdPatrimonio: Integer): Currency;
begin
  Result := FOcorrenciaRepository.CalcularDepreciacaoAcumulada(AIdPatrimonio);
end;

function TAnaliseOcorrenciaController.ObterHistoricoDepreciacoes(
  AIdPatrimonio: Integer): TFDQuery;
begin
  Result := FOcorrenciaRepository.ObterHistoricoDepreciacoes(AIdPatrimonio);
end;

function TAnaliseOcorrenciaController.CalcularNovoValor(AValorAtual,
  APercentualDepreciacao: Currency): Currency;
begin
  Result := AValorAtual - (AValorAtual * (APercentualDepreciacao / 100));
end;

function TAnaliseOcorrenciaController.ListarOcorrenciasPendentes: TDataSet;
begin
  Result := FAnaliseOcorrenciaService.ListarOcorrenciasPendentes;
end;

function TAnaliseOcorrenciaController.ObterDetalhesOcorrencia(
  AIdOcorrencia: Integer): TOcorrenciaModel;
begin
  Result := FAnaliseOcorrenciaService.ObterDetalhesOcorrencia(AIdOcorrencia);
end;

function TAnaliseOcorrenciaController.ObterValorPatrimonio(
  AIdPatrimonio: Integer): Currency;
begin
  Result := FAnaliseOcorrenciaService.ObterValorPatrimonio(AIdPatrimonio);
end;

function TAnaliseOcorrenciaController.PesquisarOcorrencia(
  const aSearch: String): TDataSet;
begin
  Result := FAnaliseOcorrenciaService.PesquisarOcorrencia(aSearch);
end;

end.
