unit AuditoriaRepository;

interface

uses
AuditoriaModel;

Type
TLogRepository = class
  private
  public
  function RegAuditoria(const UsuarioLog: TUserLog): String;
end;

implementation

{ TLogRepository }

function TLogRepository.RegAuditoria(const UsuarioLog: TUserLog): String;
begin

end;

end.
