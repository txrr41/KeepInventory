unit SalaService;

interface

uses
SalaDTO, SalaModel, SalaRepository, System.Classes, Data.DB;

Type
TSalaService = class
public
procedure AdicionarSala (ASalaModel: TSalaConfig);
procedure ExcluirSala (AId: Integer);
procedure EditarSala (ASalaModel: TSalaConfig);
function PesquisarSala (const aSearch: String): TDataSet;
Function ObterNomesPredios: TStringList;
function ListarSala: TDataSet;
end;

var
FSalaService: TSalaService;

implementation

{ TSalaService }


{ TSalaService }

procedure TSalaService.AdicionarSala(ASalaModel: TSalaConfig);
begin
    FSalaRepository.AdicionarSala(ASalaModel);
end;

procedure TSalaService.EditarSala(ASalaModel: TSalaConfig);
begin
FSalaRepository.EditarSala(ASalaModel);
end;

procedure TSalaService.ExcluirSala(AId: Integer);
begin
FSalaRepository.ExcluirSala(AId);
end;

function TSalaService.ListarSala: TDataSet;
begin
       Result := FSalaRepository.ListarSala;
end;

function TSalaService.ObterNomesPredios: TStringList;

begin
  Result := FSalaRepository.ListarNomesPredios;
end;

function TSalaService.PesquisarSala(const aSearch: String): TDataSet;
begin
result := FSalaRepository.PesquisarSala(aSearch);
end;

end.
