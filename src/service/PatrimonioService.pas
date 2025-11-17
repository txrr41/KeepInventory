unit PatrimonioService;

interface

uses
PatrimonioDTO, PatrimonioModel, PatrimonioRepository, System.Classes, Data.DB, LogService;

Type
TPatrimonioService = class
public
  procedure AdicionarPatrimonio(APatrimonioModel: TPatrimonioConfig);
  procedure ExcluirPatrimonio(AId: Integer);
  procedure EditarPatrimonio(APatrimonioModel: TPatrimonioConfig);
  function PesquisarPatrimonio(const aSearch: String): TDataSet;
  function ObterNomesSalas: TStringList;
  function ListarPatrimonio: TDataSet;
  function GetNomePatrimonioById(AId: Integer): string;

  // Novos m�todos para importa��o
  procedure ImportarPatrimonios(const Itens: TArray<TPatrimonioDTO>;
    var TotalImportados, TotalErros: Integer; Erros: TStringList);
end;

var
FPatrimonioService: TPatrimonioService;

implementation

{ TPatrimonioService }

procedure TPatrimonioService.AdicionarPatrimonio(APatrimonioModel: TPatrimonioConfig);
begin
  FPatrimonioRepository.AdicionarPatrimonio(APatrimonioModel);

  // Log da operação
  TLogService.Instance.LogCadastro(
    'Patrimônio',
    APatrimonioModel.Nome,
    APatrimonioModel.Id,
    'Cadastrou'
  );
end;

procedure TPatrimonioService.EditarPatrimonio(APatrimonioModel: TPatrimonioConfig);
begin
  FPatrimonioRepository.EditarPatrimonio(APatrimonioModel);

  // Log da operação
  TLogService.Instance.LogAlteracao(
    'Patrimônio',
    APatrimonioModel.Nome,
    APatrimonioModel.Id
  );
end;

procedure TPatrimonioService.ExcluirPatrimonio(AId: Integer);
var
  NomePatrimonio: string;
begin
  // Busca o nome do patrimônio antes de excluir para o log
  NomePatrimonio := GetNomePatrimonioById(AId);
  FPatrimonioRepository.ExcluirPatrimonio(AId);

  // Log da operação
  TLogService.Instance.LogExclusao(
    'Patrimônio',
    NomePatrimonio,
    AId
  );
end;

function TPatrimonioService.ListarPatrimonio: TDataSet;
begin
  Result := FPatrimonioRepository.ListarPatrimonio;
end;

function TPatrimonioService.ObterNomesSalas: TStringList;
begin
  Result := FPatrimonioRepository.ListarNomesSalas;
end;

function TPatrimonioService.PesquisarPatrimonio(const aSearch: String): TDataSet;
begin
  Result := FPatrimonioRepository.PesquisarPatrimonio(aSearch);
end;

procedure TPatrimonioService.ImportarPatrimonios(const Itens: TArray<TPatrimonioDTO>;
  var TotalImportados, TotalErros: Integer; Erros: TStringList);
begin
  FPatrimonioRepository.ImportarPatrimonios(Itens, TotalImportados, TotalErros, Erros);
end;

function TPatrimonioService.GetNomePatrimonioById(AId: Integer): string;
begin
  Result := FPatrimonioRepository.GetNomePatrimonioById(AId);
end;

end.
