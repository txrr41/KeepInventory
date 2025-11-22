unit PredioService;

interface

uses
PredioModel, PredioRepository, Data.DB;

Type
  TPredioService = class
  private
    FRepository: TPredioRepository;

  public
  constructor Create;
  procedure AdicionarPredio(APredioConfig: TPredioConfig);
  procedure EditarPredio (APredioConfig: TPredioConfig);
  procedure ExcluirPredio (AId: Integer);
  procedure RecuperarPredio (AId: Integer);
  function ListarPredio: TDataSet;
  function ListarPredioInativos: TDataSet;
  function PesquisarPredio (const aSearch: String): TDataSet;
  function ContarSalasPorPredio(IdPredio: Integer): Integer;
  function ContarPatrimoniosPorPredio(IdPredio: Integer): Integer;
  destructor destroy; override;
end;

var
PService : TPredioService;

implementation

{ TPredioService }

constructor TPredioService.Create;
begin
  FRepository := TPredioRepository.Create;
end;

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

procedure TPredioService.RecuperarPredio(AId: Integer);
begin
FRepository.RecuperarPredio(AId);
end;

function TPredioService.ListarPredio: TDataSet;
begin
   Result := FRepository.ListarPredio;
end;

function TPredioService.ListarPredioInativos: TDataSet;
begin
   Result := FRepository.ListarPredioInativos;
end;

function TPredioService.PesquisarPredio(const aSearch: String): TDataSet;
begin
Result := FRepository.PesquisarPredio(aSearch);
end;

function TPredioService.ContarSalasPorPredio(IdPredio: Integer): Integer;
begin
  Result := FRepository.ContarSalasPorPredio(IdPredio);
end;

function TPredioService.ContarPatrimoniosPorPredio(IdPredio: Integer): Integer;
begin
  Result := FRepository.ContarPatrimoniosPorPredio(IdPredio);
end;

end.
