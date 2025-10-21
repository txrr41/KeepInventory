unit MovimentacaoService;

interface

uses
  MovimentacaoModel, MovimentacaoRepository, System.Classes, Data.DB;

type
  TMovimentacaoService = class
  public
    procedure AdicionarMovimentacao(AMovimentacaoModel: TMovimentacaoConfig);
    procedure ExcluirMovimentacao(AId: Integer);
    procedure EditarMovimentacao(AMovimentacaoModel: TMovimentacaoConfig);
    function PesquisarMovimentacao(const aSearch: String): TDataSet;
    function ObterNomesPatrimonios: TStringList;
    function ObterNomesSalas: TStringList;
    function ListarMovimentacoes: TDataSet;
  end;

var
  FMovimentacaoService: TMovimentacaoService;

implementation

{ TMovimentacaoService }

procedure TMovimentacaoService.AdicionarMovimentacao(
  AMovimentacaoModel: TMovimentacaoConfig);
begin
  FMovimentacaoRepository.AdicionarMovimentacao(AMovimentacaoModel);
end;

procedure TMovimentacaoService.EditarMovimentacao(
  AMovimentacaoModel: TMovimentacaoConfig);
begin
  FMovimentacaoRepository.EditarMovimentacao(AMovimentacaoModel);
end;

procedure TMovimentacaoService.ExcluirMovimentacao(AId: Integer);
begin
  FMovimentacaoRepository.ExcluirMovimentacao(AId);
end;

function TMovimentacaoService.ListarMovimentacoes: TDataSet;
begin
  Result := FMovimentacaoRepository.ListarMovimentacoes;
end;

function TMovimentacaoService.ObterNomesPatrimonios: TStringList;
begin
  Result := FMovimentacaoRepository.ListarPatrimonios;
end;

function TMovimentacaoService.ObterNomesSalas: TStringList;
begin
  Result := FMovimentacaoRepository.ListarSalas;
end;

function TMovimentacaoService.PesquisarMovimentacao(
  const aSearch: String): TDataSet;
begin
  Result := FMovimentacaoRepository.PesquisarMovimentacao(aSearch);
end;

end.
