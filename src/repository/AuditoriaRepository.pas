unit AuditoriaRepository;

interface

uses
AuditoriaModel, System.SysUtils;

Type
TLogRepository = class
  private
  public
  function RegAuditoria(const UsuarioLog: TUserLog): String;
end;

implementation

{ TLogRepository }

function TLogRepository.RegAuditoria(const UsuarioLog: TUserLog): String;
var
  Arq: TextFile;
  FileName: String;
begin
  FileName := ExtractFilePath(ParamStr(0)) + 'log.txt';

  AssignFile(arq, FileName);

  if FileExists(FileName) then
    Append(Arq)
  else
    Rewrite(Arq);

  try
    Writeln(Arq, DateTimeToStr(UsuarioLog.Date) + ' ' + 'Usuário: ' + UsuarioLog.UserName + ' - ' + UsuarioLog.Msg);
  finally
    CloseFile(Arq);
  end;
end;
end.
