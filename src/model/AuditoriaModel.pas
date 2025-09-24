unit AuditoriaModel;

interface

uses
System.SysUtils;

Type
TUserLog = class
  private
  FUsuario: String;
  FDate:   TDateTime;
  FMsg: String;
  FId: Integer;
  public
  property UserName: string read FUsuario write FUsuario;
  property Date: TDateTime read FDate write FDate;
  property Msg: string read FMsg write FMsg;
  property Id: integer read FId write FId;
  public
end;

implementation

var
UsuarioLog: TUserLog;

end.
