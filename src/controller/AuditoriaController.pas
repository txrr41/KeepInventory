unit AuditoriaController;

interface

uses
System.SysUtils, AuditoriaService,  AuditoriaModel;

type
 TLogController = class
 private
 FService: TAuditoriaService;
 public
 constructor Create;
 function RegAuditoria(UsuarioLog: TUserLog): String;
 end;



implementation

{ TLogController }

constructor TLogController.Create;
begin
FService := TAuditoriaService.Create;
end;

function TLogController.RegAuditoria(UsuarioLog: TUserLog): String;
begin
 Result := FService.RegAuditoria(UsuarioLog);
end;

end.
