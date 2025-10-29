unit PendenciaController;



interface

uses
PendenciaService, Data.DB;

type
TPendenciaController = class
public
procedure AlterarStatus(Aid: Integer);
function ListarMovimentacoes: TDataSet;
procedure AlterarStatusRecusado (AId: Integer);
end;

var
FPendenciaController: TPendenciaController;

implementation

{ TMoviController }

procedure TPendenciaController.AlterarStatus(Aid: Integer);
begin
  FPendenciaService.AlterarStatus(Aid);
end;

procedure TPendenciaController.AlterarStatusRecusado(AId: Integer);
begin
 FPendenciaService.AlterarStatusRecusado(AId);
end;

function TPendenciaController.ListarMovimentacoes: TDataSet;
begin
  Result := FPendenciaService.ListarMovimentacoes;
end;

end.
