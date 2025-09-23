unit AuditoriaService;

interface

uses
AuditoriaModel, AuditoriaRepository;

type
 TLogService = class
 private
 FRepository: TLogRepository;
 public
 function RegAuditoria(UsuarioLog: TUserLog): String;
 end;

implementation

{ TLogService }

function TLogService.RegAuditoria(UsuarioLog: TUserLog): String;
begin
Result := FRepository.RegAuditoria(UsuarioLog)
end;

end.
