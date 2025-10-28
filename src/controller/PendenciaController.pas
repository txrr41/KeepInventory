unit PendenciaController;



interface

uses
PendenciaService;

type
TPendenciaController = class
public
procedure AlterarStatus(Aid: Integer);
end;

var
FPendenciaController: TPendenciaController;

implementation

{ TMoviController }

procedure TPendenciaController.AlterarStatus(Aid: Integer);
begin
  FPendenciaService.AlterarStatus(Aid);
end;

end.
