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
  procedure ExcluirPredio (AId: Integer);
  function ListarPredio: TDataSet;
  destructor destroy; override;
end;

var
PService : TPredioService;

implementation

{ TPredioService }

procedure TPredioService.AdicionarPredio(APredioConfig: TPredioConfig);
begin
  FRepository.AdicionarPredio(APredioConfig);
end;


destructor TPredioService.destroy;
begin

  FRepository.Free;
  inherited;

end;

procedure TPredioService.EditarPredio(APredioConfig: TPredioConfig);
begin
 FRepository.EditarPredio(APredioConfig);
end;

procedure TPredioService.ExcluirPredio(AId: Integer);
begin
FRepository.ExcluirPredio(AId);
end;

function TPredioService.ListarPredio: TDataSet;
begin
   Result := FRepository.ListarPredio;
end;

end.
