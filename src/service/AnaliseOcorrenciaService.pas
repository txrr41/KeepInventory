unit AnaliseOcorrenciaService;

interface

uses
  OcorrenciaModel, AnaliseOcorrenciaRepository, OcorrenciaDTO, System.Classes, Data.DB;

type
  TAnaliseOcorrenciaService = class
  public
    function ListarOcorrenciasPendentes: TDataSet;
    function PesquisarOcorrencia(const aSearch: String): TDataSet;
    procedure AvaliarOcorrencia(AAvaliacaoDTO: TAvaliacaoOcorrenciaDTO);
    function ObterDetalhesOcorrencia(AIdOcorrencia: Integer): TOcorrenciaModel;
    function ObterValorPatrimonio(AIdPatrimonio: Integer): Currency;
  end;

var
  FAnaliseOcorrenciaService: TAnaliseOcorrenciaService;

implementation

{ TOcorrenciaService }

procedure TAnaliseOcorrenciaService.AvaliarOcorrencia(
  AAvaliacaoDTO: TAvaliacaoOcorrenciaDTO);
begin
  FAnaliseOcorrenciaRepository.AvaliarOcorrencia(AAvaliacaoDTO);
end;

function TAnaliseOcorrenciaService.ListarOcorrenciasPendentes: TDataSet;
begin
  Result := FAnaliseOcorrenciaRepository.ListarOcorrenciasPendentes;
end;

function TAnaliseOcorrenciaService.ObterDetalhesOcorrencia(
  AIdOcorrencia: Integer): TOcorrenciaModel;
begin
  Result := FAnaliseOcorrenciaRepository.ObterDetalhesOcorrencia(AIdOcorrencia);
end;

function TAnaliseOcorrenciaService.ObterValorPatrimonio(
  AIdPatrimonio: Integer): Currency;
begin
  Result := FAnaliseOcorrenciaRepository.ObterValorPatrimonio(AIdPatrimonio);
end;

function TAnaliseOcorrenciaService.PesquisarOcorrencia(const aSearch: String): TDataSet;
begin
  Result := FAnaliseOcorrenciaRepository.PesquisarOcorrencia(aSearch);
end;

end.
