unit PredioService;

interface

uses
PredioModel, PredioRepository, Data.DB;

Type
  TPredioService = class
  private

  public
  procedure AdicionarPredio(APredioConfig: TPredioConfig);
  procedure EditarPredio (APredioConfig: TPredioConfig);
  constructor Create;
  function ListarPredio: TDataSet;
end;

var
PService : TPredioService;

implementation

{ TPredioService }

procedure TPredioService.AdicionarPredio(APredioConfig: TPredioConfig);
begin
  FRepository.AdicionarPredio(APredioConfig);
end;

constructor TPredioService.Create;
begin

end;

procedure TPredioService.EditarPredio(APredioConfig: TPredioConfig);
begin
 FRepository.EditarPredio(APredioConfig);
end;

function TPredioService.ListarPredio: TDataSet;
begin
   Result := FRepository.ListarPredio;
end;

end.
