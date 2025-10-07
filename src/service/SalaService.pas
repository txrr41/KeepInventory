unit SalaService;

interface

uses
SalaDTO, SalaModel, SalaRepository, System.Classes;

Type
TSalaService = class
public
procedure AdicionarSala (ASalaModel: TSalaConfig);
Function ObterNomesPredios: TStringList;
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

function TSalaService.ObterNomesPredios: TStringList;

begin
  Result := FSalaRepository.ListarNomesPredios;
end;

end.
