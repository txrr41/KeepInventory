unit SalaService;

interface

uses
SalaDTO, SalaModel, SalaRepository, System.Classes, Data.DB;

Type
TSalaService = class
private
  FRepository: TSalaRepository;
public
  constructor Create;
  procedure AdicionarSala (ASalaModel: TSalaConfig);
  procedure ExcluirSala (AId: Integer);
  procedure RecuperarSala (AId: Integer);
  procedure EditarSala (ASalaModel: TSalaConfig);
  function PesquisarSala (const aSearch: String): TDataSet;
  Function ObterNomesPredios: TStringList;
  function ListarSala: TDataSet;
  function ListarSalasInativas: TDataSet;
  function ContarPatrimoniosPorSala(IdSala: Integer): Integer;
end;

var
FSalaService: TSalaService;

implementation

{ TSalaService }

constructor TSalaService.Create;
begin
  FRepository := TSalaRepository.Create;
end;

{ TSalaService }

procedure TSalaService.AdicionarSala(ASalaModel: TSalaConfig);
begin
    FRepository.AdicionarSala(ASalaModel);
end;

procedure TSalaService.EditarSala(ASalaModel: TSalaConfig);
begin
FRepository.EditarSala(ASalaModel);
end;

procedure TSalaService.ExcluirSala(AId: Integer);
begin
FRepository.ExcluirSala(AId);
end;

procedure TSalaService.RecuperarSala(AId: Integer);
begin
FRepository.RecuperarSala(AId);
end;

function TSalaService.ListarSala: TDataSet;
begin
       Result := FRepository.ListarSala;
end;

function TSalaService.ListarSalasInativas: TDataSet;
begin
       Result := FRepository.ListarSalasInativas;
end;

function TSalaService.ObterNomesPredios: TStringList;

begin
  Result := FRepository.ListarNomesPredios;
end;

function TSalaService.PesquisarSala(const aSearch: String): TDataSet;
begin
result := FRepository.PesquisarSala(aSearch);
end;

function TSalaService.ContarPatrimoniosPorSala(IdSala: Integer): Integer;
begin
  Result := FRepository.ContarPatrimoniosPorSala(IdSala);
end;

end.
