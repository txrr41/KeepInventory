unit PredioService;

interface

uses
PredioModel, PredioRepository;

Type
  TPredioService = class
  private
  FRepository: TPredioRepository;
  public
  procedure AdicionarPredio(APredioConfig: TPredioConfig);
  constructor Create;
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

end.
