unit CepService;

interface

uses
  System.Classes, System.JSON, System.SysUtils, System.Types, IdHTTP, IdSSLOpenSSL, IdComponent, dialogs;

type
  TEndereco = record
    Cep: string;
    Logradouro: string;
    Complemento: string;
    Bairro: string;
    Cidade: string;
    Estado: string;
    IBGE: string;
    Gia: string;
    DDD: string;
    Siafi: string;
    Erro: string;
  end;

  TCepService = class
  private
    FHTTP: TIdHTTP;
    class var FInstance: TCepService;
  public
    constructor Create;
    destructor Destroy; override;

    class function GetInstance: TCepService;
    class function BuscarCep(const Cep: string): TEndereco;
    class function FormatCep(const Cep: string): string;
    class function ValidarCep(const Cep: string): Boolean;

    procedure BuscarCepAsync(const Cep: string; const OnComplete: TProc<TEndereco>);
  end;

implementation

{ TCepService }

constructor TCepService.Create;
var
  SSLIOHandler: TIdSSLIOHandlerSocketOpenSSL;
begin
  inherited;
  FHTTP := TIdHTTP.Create(nil);
  FHTTP.HandleRedirects := True;
  FHTTP.Request.UserAgent := 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)';
  FHTTP.Request.ContentType := 'application/json';
  FHTTP.Request.CharSet := 'UTF-8';
  FHTTP.HTTPOptions := [hoForceEncodeParams];

  // Configura SSL para HTTPS
  SSLIOHandler := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  SSLIOHandler.SSLOptions.Method := sslvTLSv1_2;
  SSLIOHandler.SSLOptions.SSLVersions := [sslvTLSv1_2];
  SSLIOHandler.SSLOptions.Mode := sslmClient;
  FHTTP.IOHandler := SSLIOHandler;
end;

destructor TCepService.Destroy;
begin
  FHTTP.Free;
  inherited;
end;

class function TCepService.GetInstance: TCepService;
begin
  if not Assigned(FInstance) then
    FInstance := TCepService.Create;
  Result := FInstance;
end;

class function TCepService.BuscarCep(const Cep: string): TEndereco;
var
  Instance: TCepService;
  URL: string;
  Response: string;
  Json: TJSONObject;
  CepFormatado: string;
begin
  Result.Cep := '';
  Result.Logradouro := '';
  Result.Complemento := '';
  Result.Bairro := '';
  Result.Cidade := '';
  Result.Estado := '';
  Result.IBGE := '';
  Result.Gia := '';
  Result.DDD := '';
  Result.Siafi := '';
  Result.Erro := '';

  if not ValidarCep(Cep) then
  begin
    Result.Erro := 'CEP inválido';
    Exit;
  end;

  CepFormatado := FormatCep(Cep);
  URL := Format('https://viacep.com.br/ws/%s/json/', [CepFormatado]);

  Instance := GetInstance;
  try
    Response := Instance.FHTTP.Get(URL);

    if Response.Trim = '' then
    begin
      Result.Erro := 'Resposta vazia da API';
      Exit;
    end;

    Json := TJSONObject.ParseJSONValue(Response) as TJSONObject;
    try
      if Assigned(Json) then
      begin
        if Json.GetValue('erro') <> nil then
        begin
          Result.Erro := 'CEP não encontrado';
        end
        else
        begin
          if Json.GetValue('cep') <> nil then
            Result.Cep := Json.GetValue('cep').Value;
          if Json.GetValue('logradouro') <> nil then
            Result.Logradouro := Json.GetValue('logradouro').Value;
          if Json.GetValue('complemento') <> nil then
            Result.Complemento := Json.GetValue('complemento').Value;
          if Json.GetValue('bairro') <> nil then
            Result.Bairro := Json.GetValue('bairro').Value;
          if Json.GetValue('localidade') <> nil then
            Result.Cidade := Json.GetValue('localidade').Value;
          if Json.GetValue('uf') <> nil then
            Result.Estado := Json.GetValue('uf').Value;
          if Json.GetValue('ibge') <> nil then
            Result.IBGE := Json.GetValue('ibge').Value;
          if Json.GetValue('gia') <> nil then
            Result.Gia := Json.GetValue('gia').Value;
          if Json.GetValue('ddd') <> nil then
            Result.DDD := Json.GetValue('ddd').Value;
          if Json.GetValue('siafi') <> nil then
            Result.Siafi := Json.GetValue('siafi').Value;
        end;
      end
      else
      begin
        Result.Erro := 'Erro ao processar JSON';
      end;
    finally
      Json.Free;
    end;
  except
    on E: Exception do
    begin
      Result.Erro := 'Erro na requisição: ' + E.Message;
      ShowMessage('Erro na requisição CEP: ' + E.Message + #13#10 +
                 'URL: ' + URL + #13#10 +
                 'Resposta: ' + Response);
    end;
  end;
end;

class function TCepService.FormatCep(const Cep: string): string;
var
  CepLimpo: string;
  i: Integer;
begin
  Result := '';

  // Remove todos os caracteres não numéricos
  for i := 1 to Length(Cep) do
    if Cep[i] in ['0'..'9'] then
      Result := Result + Cep[i];

  // Garante que tenha 8 dígitos
  if Length(Result) < 8 then
    Result := StringOfChar('0', 8 - Length(Result)) + Result
  else if Length(Result) > 8 then
    Result := Copy(Result, 1, 8);

  // Formata como 00000-000
  if Length(Result) = 8 then
    Result := Copy(Result, 1, 5) + '-' + Copy(Result, 6, 3);
end;

class function TCepService.ValidarCep(const Cep: string): Boolean;
var
  CepLimpo: string;
  i: Integer;
begin
  Result := False;

  // Remove todos os caracteres não numéricos
  CepLimpo := '';
  for i := 1 to Length(Cep) do
    if Cep[i] in ['0'..'9'] then
      CepLimpo := CepLimpo + Cep[i];

  // Verifica se tem 8 dígitos
  Result := Length(CepLimpo) = 8;
end;

procedure TCepService.BuscarCepAsync(const Cep: string; const OnComplete: TProc<TEndereco>);
var
  Thread: TThread;
begin
  Thread := TThread.CreateAnonymousThread(procedure
  var
    Endereco: TEndereco;
  begin
    try
      Endereco := BuscarCep(Cep);

      TThread.Synchronize(nil, procedure
      begin
        if Assigned(OnComplete) then
          OnComplete(Endereco);
      end);
    except
      TThread.Synchronize(nil, procedure
      begin
        if Assigned(OnComplete) then
        begin
          Endereco.Erro := 'Erro na busca do CEP';
          OnComplete(Endereco);
        end;
      end);
    end;
  end);

  Thread.FreeOnTerminate := True;
  Thread.Start;
end;

initialization
  // Garante que a instância seja liberada ao final
finalization
  if Assigned(TCepService.FInstance) then
    TCepService.FInstance.Free;

end.