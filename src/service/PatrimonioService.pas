unit PatrimonioService;

interface

uses
PatrimonioDTO, PatrimonioModel, PatrimonioRepository, System.Classes, Data.DB, LogService;

Type
TPatrimonioService = class
private
  FRepository: TPatrimonioRepository;
public
  constructor Create;
  procedure AdicionarPatrimonio(APatrimonioModel: TPatrimonioConfig);
  procedure ExcluirPatrimonio(AId: Integer);
  procedure RecuperarPatrimonio(AId: Integer);
  procedure EditarPatrimonio(APatrimonioModel: TPatrimonioConfig);
  function PesquisarPatrimonio(const aSearch: String): TDataSet;
  function ObterNomesSalas: TStringList;
  function ListarPatrimonio: TDataSet;
  function ListarPatrimoniosInativos: TDataSet;
  function GetNomePatrimonioById(AId: Integer): string;

  // Novos m�todos para importa��o
  procedure ImportarPatrimonios(const Itens: TArray<TPatrimonioDTO>;
    var TotalImportados, TotalErros: Integer; Erros: TStringList);
end;

var
FPatrimonioService: TPatrimonioService;

implementation

{ TPatrimonioService }

constructor TPatrimonioService.Create;
begin
  FRepository := TPatrimonioRepository.Create;
end;

procedure TPatrimonioService.AdicionarPatrimonio(APatrimonioModel: TPatrimonioConfig);
begin
  FRepository.AdicionarPatrimonio(APatrimonioModel);

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
  FRepository.EditarPatrimonio(APatrimonioModel);

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
  FRepository.ExcluirPatrimonio(AId);

  // Log da operação
  TLogService.Instance.LogExclusao(
    'Patrimônio',
    NomePatrimonio,
    AId
  );
end;

procedure TPatrimonioService.RecuperarPatrimonio(AId: Integer);
begin
  FRepository.RecuperarPatrimonio(AId);
end;

function TPatrimonioService.ListarPatrimonio: TDataSet;
begin
  Result := FRepository.ListarPatrimonio;
end;

function TPatrimonioService.ListarPatrimoniosInativos: TDataSet;
begin
  Result := FRepository.ListarPatrimoniosInativos;
end;

function TPatrimonioService.ObterNomesSalas: TStringList;
begin
  Result := FRepository.ListarNomesSalas;
end;

function TPatrimonioService.PesquisarPatrimonio(const aSearch: String): TDataSet;
begin
  Result := FRepository.PesquisarPatrimonio(aSearch);
end;

procedure TPatrimonioService.ImportarPatrimonios(const Itens: TArray<TPatrimonioDTO>;
  var TotalImportados, TotalErros: Integer; Erros: TStringList);
begin
  FRepository.ImportarPatrimonios(Itens, TotalImportados, TotalErros, Erros);
end;

function TPatrimonioService.GetNomePatrimonioById(AId: Integer): string;
begin
  Result := FRepository.GetNomePatrimonioById(AId);
end;

end.
