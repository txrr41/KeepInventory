unit PendenciaRepository;

interface

uses
MovimentacaoModel;

type
TPendenciaRepository = class
  procedure AlterarStatus (AId: Integer);
end;

var
FPendenciaRepository: TPendenciaRepository;

implementation

{ TPendenciaRepository }

procedure TPendenciaRepository.AlterarStatus(AId: Integer);
begin

end;

end.
