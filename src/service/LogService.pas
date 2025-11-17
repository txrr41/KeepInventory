unit LogService;

interface

uses
  AuditoriaModel, AuditoriaService, PermissoesHelper, System.SysUtils, UsuarioModel;

type
  TLogService = class
  private
    class var FInstance: TLogService;
    class function GetInstance: TLogService; static;
  public
    class property Instance: TLogService read GetInstance;

    // Métodos de logging
    procedure LogCadastro(Entidade: string; NomeEntidade: string; IdEntidade: Integer; Operacao: string);
    procedure LogAlteracao(Entidade: string; NomeEntidade: string; IdEntidade: Integer);
    procedure LogExclusao(Entidade: string; NomeEntidade: string; IdEntidade: Integer);
    procedure LogMovimentacao(Descricao: string; IdPatrimonio: Integer = 0);
    procedure LogOcorrencia(Descricao: string; IdPatrimonio: Integer = 0);
    procedure LogLogin(Sucesso: Boolean; TentativaUsuario: string = '');
    procedure LogAcesso(Modulo: string);
    procedure LogPesquisa(TipoEntidade: string; Termo: string);
    procedure LogRelatorio(TipoRelatorio: string; Parametros: string = '');
    procedure LogImportacao(TipoEntidade: string; Quantidade: Integer; Erros: Integer = 0);
    procedure LogSistema(Mensagem: string; Nivel: string = 'INFO');

    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TLogService }

class function TLogService.GetInstance: TLogService;
begin
  if FInstance = nil then
    FInstance := TLogService.Create;
  Result := FInstance;
end;

constructor TLogService.Create;
begin
  inherited Create;
  FAuditoriaService := TAuditoriaService.Create;
end;

destructor TLogService.Destroy;
begin
  FreeAndNil(FAuditoriaService);
  inherited Destroy;
end;

procedure TLogService.LogCadastro(Entidade: string; NomeEntidade: string; IdEntidade: Integer; Operacao: string);
var
  Usuario: TUsuarioModel;
  UserLog: TUserLog;
begin
  Usuario := TPermissoesHelper.GetUsuarioLogado;

  if Usuario <> nil then
  begin
    UserLog := TUserLog.Create(
      Format('%s (ID: %d)', [Usuario.Nome, Usuario.Id]),
      Usuario.Id,
      Format('%s %s - %s (ID: %d)', [Operacao, Entidade, NomeEntidade, IdEntidade])
    );
    try
      FAuditoriaService.RegAuditoria(UserLog);
    finally
      UserLog.Free;
    end;
  end;
end;

procedure TLogService.LogAlteracao(Entidade: string; NomeEntidade: string; IdEntidade: Integer);
var
  Usuario: TUsuarioModel;
  UserLog: TUserLog;
begin
  Usuario := TPermissoesHelper.GetUsuarioLogado;

  if Usuario <> nil then
  begin
    UserLog := TUserLog.Create(
      Format('%s (ID: %d)', [Usuario.Nome, Usuario.Id]),
      Usuario.Id,
      Format('Alterou %s - %s (ID: %d)', [Entidade, NomeEntidade, IdEntidade])
    );
    try
      FAuditoriaService.RegAuditoria(UserLog);
    finally
      UserLog.Free;
    end;
  end;
end;

procedure TLogService.LogExclusao(Entidade: string; NomeEntidade: string; IdEntidade: Integer);
var
  Usuario: TUsuarioModel;
  UserLog: TUserLog;
begin
  Usuario := TPermissoesHelper.GetUsuarioLogado;

  if Usuario <> nil then
  begin
    UserLog := TUserLog.Create(
      Format('%s (ID: %d)', [Usuario.Nome, Usuario.Id]),
      Usuario.Id,
      Format('Excluiu %s - %s (ID: %d)', [Entidade, NomeEntidade, IdEntidade])
    );
    try
      FAuditoriaService.RegAuditoria(UserLog);
    finally
      UserLog.Free;
    end;
  end;
end;

procedure TLogService.LogMovimentacao(Descricao: string; IdPatrimonio: Integer = 0);
var
  Usuario: TUsuarioModel;
  UserLog: TUserLog;
begin
  Usuario := TPermissoesHelper.GetUsuarioLogado;

  if Usuario <> nil then
  begin
    UserLog := TUserLog.Create(
      Format('%s (ID: %d)', [Usuario.Nome, Usuario.Id]),
      Usuario.Id,
      Format('Movimentação - %s', [Descricao])
    );
    try
      FAuditoriaService.RegAuditoria(UserLog);
    finally
      UserLog.Free;
    end;
  end;
end;

procedure TLogService.LogOcorrencia(Descricao: string; IdPatrimonio: Integer = 0);
var
  Usuario: TUsuarioModel;
  UserLog: TUserLog;
begin
  Usuario := TPermissoesHelper.GetUsuarioLogado;

  if Usuario <> nil then
  begin
    UserLog := TUserLog.Create(
      Format('%s (ID: %d)', [Usuario.Nome, Usuario.Id]),
      Usuario.Id,
      Format('Ocorrência - %s', [Descricao])
    );
    try
      FAuditoriaService.RegAuditoria(UserLog);
    finally
      UserLog.Free;
    end;
  end;
end;

procedure TLogService.LogLogin(Sucesso: Boolean; TentativaUsuario: string = '');
var
  Usuario: TUsuarioModel;
  UserLog: TUserLog;
  Mensagem: string;
begin
  if Sucesso then
  begin
    Usuario := TPermissoesHelper.GetUsuarioLogado;
    if Usuario <> nil then
    begin
      UserLog := TUserLog.Create(
        Usuario.Nome,
        Usuario.Id,
        'Login realizado com sucesso'
      );
      try
        FAuditoriaService.RegAuditoria(UserLog);
      finally
        UserLog.Free;
      end;
    end;
  end
  else
  begin
    UserLog := TUserLog.Create(
      'Sistema',
      0,
      Format('Tentativa de login falhou - Usuário: %s', [TentativaUsuario])
    );
    try
      FAuditoriaService.RegAuditoria(UserLog);
    finally
      UserLog.Free;
    end;
  end;
end;

procedure TLogService.LogAcesso(Modulo: string);
var
  Usuario: TUsuarioModel;
  UserLog: TUserLog;
begin
  Usuario := TPermissoesHelper.GetUsuarioLogado;

  if Usuario <> nil then
  begin
    UserLog := TUserLog.Create(
      Format('%s (ID: %d)', [Usuario.Nome, Usuario.Id]),
      Usuario.Id,
      Format('Acessou o módulo de %s', [Modulo])
    );
    try
      FAuditoriaService.RegAuditoria(UserLog);
    finally
      UserLog.Free;
    end;
  end;
end;

procedure TLogService.LogPesquisa(TipoEntidade: string; Termo: string);
var
  Usuario: TUsuarioModel;
  UserLog: TUserLog;
begin
  Usuario := TPermissoesHelper.GetUsuarioLogado;

  if Usuario <> nil then
  begin
    UserLog := TUserLog.Create(
      Format('%s (ID: %d)', [Usuario.Nome, Usuario.Id]),
      Usuario.Id,
      Format('Pesquisou %s - Termo: "%s"', [TipoEntidade, Termo])
    );
    try
      FAuditoriaService.RegAuditoria(UserLog);
    finally
      UserLog.Free;
    end;
  end;
end;

procedure TLogService.LogRelatorio(TipoRelatorio: string; Parametros: string = '');
var
  Usuario: TUsuarioModel;
  UserLog: TUserLog;
begin
  Usuario := TPermissoesHelper.GetUsuarioLogado;

  if Usuario <> nil then
  begin
    UserLog := TUserLog.Create(
      Format('%s (ID: %d)', [Usuario.Nome, Usuario.Id]),
      Usuario.Id,
      Format('Gerou relatório - %s %s', [TipoRelatorio, Parametros])
    );
    try
      FAuditoriaService.RegAuditoria(UserLog);
    finally
      UserLog.Free;
    end;
  end;
end;

procedure TLogService.LogImportacao(TipoEntidade: string; Quantidade: Integer; Erros: Integer = 0);
var
  Usuario: TUsuarioModel;
  UserLog: TUserLog;
begin
  Usuario := TPermissoesHelper.GetUsuarioLogado;

  if Usuario <> nil then
  begin
    UserLog := TUserLog.Create(
      Format('%s (ID: %d)', [Usuario.Nome, Usuario.Id]),
      Usuario.Id,
      Format('Importou %d registros de %s (%d erros)', [Quantidade, TipoEntidade, Erros])
    );
    try
      FAuditoriaService.RegAuditoria(UserLog);
    finally
      UserLog.Free;
    end;
  end;
end;

procedure TLogService.LogSistema(Mensagem: string; Nivel: string = 'INFO');
var
  Usuario: TUsuarioModel;
  UserLog: TUserLog;
begin
  Usuario := TPermissoesHelper.GetUsuarioLogado;

  if Usuario <> nil then
  begin
    UserLog := TUserLog.Create(
      Format('%s (ID: %d)', [Usuario.Nome, Usuario.Id]),
      Usuario.Id,
      Format('[%s] %s', [Nivel, Mensagem])
    );
    try
      FAuditoriaService.RegAuditoria(UserLog);
    finally
      UserLog.Free;
    end;
  end
  else
  begin
    UserLog := TUserLog.Create(
      'Sistema',
      0,
      Format('[%s] %s', [Nivel, Mensagem])
    );
    try
      FAuditoriaService.RegAuditoria(UserLog);
    finally
      UserLog.Free;
    end;
  end;
end;

initialization

finalization
  if TLogService.FInstance <> nil then
    TLogService.FInstance.Free;

end.