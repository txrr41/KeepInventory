unit AuditoriaService;

interface

uses
AuditoriaModel, AuditoriaRepository;

type
 TAuditoriaService = class
 private
 FRepository: TLogRepository;
 public
 function RegAuditoria(UsuarioLog: TUserLog): String;
 end;

 var
 FAuditoriaService: TAuditoriaService;

implementation

{ TLogService }

function TAuditoriaService.RegAuditoria(UsuarioLog: TUserLog): String;
begin
Result := FRepository.RegAuditoria(UsuarioLog)
end;

end.
