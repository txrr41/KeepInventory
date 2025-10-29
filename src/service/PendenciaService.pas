unit PendenciaService;

interface

uses
PendenciaRepository, Data.DB;

type
TPendenciaService = class
procedure AlterarStatus(Aid: Integer);
function ListarMovimentacoes: TDataSet;
procedure AlterarStatusRecusado (AId: Integer);
end;

var
FPendenciaService: TPendenciaService;

implementation

{ TPendenciaService }

procedure TPendenciaService.AlterarStatus(Aid: Integer);
begin
   FPendenciaRepository.AlterarStatus(Aid);
end;

procedure TPendenciaService.AlterarStatusRecusado(AId: Integer);
begin
 FPendenciaRepository.AlterarStatusRecusado(AId);
end;

function TPendenciaService.ListarMovimentacoes: TDataSet;
begin
   Result := FPendenciaRepository.ListarMovimentacoes;
end;

end.
