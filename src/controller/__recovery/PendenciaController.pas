unit PendenciaController;

interface

uses
PendenciaService;

type
TPendenciaController = class
public
procedure AlterarStatus(Aid: Integer);
procedure AlterarStatusRecusado(Aid: Integer);
end;

var
FPendenciaController: TPendenciaController;

implementation

{ TMoviController }

procedure TPendenciaController.AlterarStatus(Aid: Integer);
begin
  FPendenciaService.AlterarStatus(Aid);
end;

procedure TPendenciaController.AlterarStatusRecusado(Aid: Integer);
begin
 FPendenciaService.AlterarStatusRecusado(Aid)
end;

end.
