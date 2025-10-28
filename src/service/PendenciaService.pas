unit PendenciaService;

interface

uses
PendenciaRepository;

type
TPendenciaService = class
procedure AlterarStatus(Aid: Integer);
end;

var
FPendenciaService: TPendenciaService;

implementation

{ TPendenciaService }

procedure TPendenciaService.AlterarStatus(Aid: Integer);
begin
   FPendenciaRepository.AlterarStatus(Aid);
end;

end.
