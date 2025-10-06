unit PredioService;

interface

uses
PredioModel, PredioRepository, Data.DB;

Type
  TPredioService = class
  private
  FRepository: TPredioRepository;
  public
  procedure AdicionarPredio(APredioConfig: TPredioConfig);
  constructor Create;
  function ListarPredio: TDataSet;
end;

implementation

{ TPredioService }

procedure TPredioService.AdicionarPredio(APredioConfig: TPredioConfig);
begin
  FRepository.AdicionarPredio(APredioConfig);
end;

constructor TPredioService.Create;
begin
FRepository := TPredioRepository.Create;
end;

function TPredioService.ListarPredio: TDataSet;
begin

end;

end.
