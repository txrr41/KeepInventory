unit AuditoriaModel;

interface

uses
System.SysUtils;

Type
TUserLog = class
  private
  FUsuario: String;
  FUsuarioId: Integer;
  FDate:   TDateTime;
  FMsg: String;
  FId: Integer;
  public
  property UserName: string read FUsuario write FUsuario;
  property UsuarioId: integer read FUsuarioId write FUsuarioId;
  property Date: TDateTime read FDate write FDate;
  property Msg: string read FMsg write FMsg;
  property Id: integer read FId write FId;
  public
  constructor Create(ANomeUsuario: string; AUsuarioId: Integer; AMensagem: string);
end;

implementation

constructor TUserLog.Create(ANomeUsuario: string; AUsuarioId: Integer; AMensagem: string);
begin
  FUsuario := ANomeUsuario;
  FUsuarioId := AUsuarioId;
  FDate := Now;
  FMsg := AMensagem;
  FId := 0;
end;

end.
