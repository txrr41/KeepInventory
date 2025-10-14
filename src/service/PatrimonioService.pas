unit PatrimonioService;

interface

uses
PatrimonioDTO, PatrimonioModel, PatrimonioRepository, System.Classes, Data.DB;

Type
TPatrimonioService = class
public
  procedure AdicionarPatrimonio(APatrimonioModel: TPatrimonioConfig);
  procedure ExcluirPatrimonio(AId: Integer);
  procedure EditarPatrimonio(APatrimonioModel: TPatrimonioConfig);
  function PesquisarPatrimonio(const aSearch: String): TDataSet;
  function ObterNomesSalas: TStringList;
  function ListarPatrimonio: TDataSet;
end;

var
FPatrimonioService: TPatrimonioService;

implementation

{ TPatrimonioService }

procedure TPatrimonioService.AdicionarPatrimonio(APatrimonioModel: TPatrimonioConfig);
begin
  FPatrimonioRepository.AdicionarPatrimonio(APatrimonioModel);
end;

procedure TPatrimonioService.EditarPatrimonio(APatrimonioModel: TPatrimonioConfig);
begin
  FPatrimonioRepository.EditarPatrimonio(APatrimonioModel);
end;

procedure TPatrimonioService.ExcluirPatrimonio(AId: Integer);
begin
  FPatrimonioRepository.ExcluirPatrimonio(AId);
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

end.
