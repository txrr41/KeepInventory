unit PendenciaService;

interface

uses
PendenciaRepository;

type
TPendenciaService = class
procedure AlterarStatus(Aid: Integer);
procedure AlterarStatusRecusado(Aid: Integer);
end;

var
FPendenciaService: TPendenciaService;

implementation

{ TPendenciaService }

procedure TPendenciaService.AlterarStatus(Aid: Integer);
begin
   FPendenciaRepository.AlterarStatus(Aid);
end;

procedure TPendenciaService.AlterarStatusRecusado(Aid: Integer);
begin
 FPendenciaRepository.AlterarStatusRecusado(AId);
end;

end.
