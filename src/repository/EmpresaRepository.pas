unit EmpresaRepository;

interface
uses
  EmpresaModel, DB, FireDAC.Comp.Client, System.SysUtils, Data.DB;

type
  TEmpresaRepository = class
  private
    function ApenasNumeros(const ATexto: string): string;
  public
    procedure AdicionarEmpresa(EmpModel: TEmpresaConfig);
    procedure EditarEmpresa(EmpModel: TEmpresaConfig);
    procedure ExcluirEmpresa(AId: Integer);
    function PesquisarEmpresa(const aSearch: String): TDataSet;
  end;

implementation

{ TEmpresaRepository }

function TEmpresaRepository.ApenasNumeros(const ATexto: string): string;
var
  I: Integer;
begin
  Result := '';
  for I := 1 to Length(ATexto) do
    if CharInSet(ATexto[I], ['0'..'9']) then
      Result := Result + ATexto[I];
end;

procedure TEmpresaRepository.EditarEmpresa(EmpModel: TEmpresaConfig);
var
Q: TFDQuery;
begin
Q := TFDQuery.Create(nil);
try
  Q.Connection := DataModule2.FDConnection;
  Q.SQL.Text := 'UPDATE empresas SET nome_fantasia = :Nome, razao_social = :Razao, telefone = :Telefone, cnpj = :Cnpj, rua = :Rua, numero = :Numero, estado = :Estado, cidade = :Cidade, cep = :Cep, bairro = :Bairro WHERE id = :Id';
  Q.ParamByName('Nome').AsString := EmpModel.NomeFan;
  Q.ParamByName('Razao').AsString := EmpModel.Razao;
  Q.ParamByName('Telefone').AsString := EmpModel.Telefone;
  Q.ParamByName('Cnpj').AsString := EmpModel.Cnpj;
  Q.ParamByName('Rua').AsString := EmpModel.Rua;
  Q.ParamByName('Numero').AsInteger := EmpModel.Numero;
  Q.ParamByName('Estado').AsString := EmpModel.Estado;
  Q.ParamByName('Cidade').AsString := EmpModel.Cidade;
  Q.ParamByName('Cep').AsString := EmpModel.Cep;
  Q.ParamByName('Bairro').AsString := EmpModel.Bairro;
  Q.ParamByName('Id').AsInteger := EmpModel.Id;

  Q.ExecSQL;
  Q.Close;

finally
  Q.Free;
end;
end;

procedure TEmpresaRepository.ExcluirEmpresa(AId: Integer);
var
 Q: TFDQuery;
begin
 Q := TFDQuery.Create(nil);
 try
   Q.Connection := DataModule2.FDConnection;
   Q.SQL.Text := 'UPDATE empresas SET ativo = false WHERE id = :id';
   Q.ParamByName('id').AsInteger := AId;
   Q.ExecSQL;
   Q.Close;
 finally
  Q.Free;
 end;
end;

function TEmpresaRepository.PesquisarEmpresa(const aSearch: String): TDataSet;
var
  Q: TFDQuery;
begin
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := DataModule2.FDConnection;
    Q.SQL.Text :=
      'SELECT id, nome_fantasia, cnpj, estado, ativo ' +
      'FROM empresas ' +
      'WHERE ativo = true ' +
      '  AND (nome_fantasia ILIKE :fantasia ' +
      '       OR cnpj LIKE :cnpj ' +
      '       OR estado ILIKE :estado) ' +
      'ORDER BY id';

    Q.ParamByName('fantasia').AsString := '%' + Trim(aSearch) + '%';
    Q.ParamByName('cnpj').AsString     := '%' + Trim(aSearch) + '%';
    Q.ParamByName('estado').AsString   := '%' + Trim(aSearch) + '%';

    Q.Open;

    Result := Q;
  except
    // garante que não fica pendurado em caso de erro
    raise;
  end;
end;


procedure TEmpresaRepository.AdicionarEmpresa(EmpModel: TEmpresaConfig);
var
  Q: TFDQuery;
begin
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := DataModule2.FDConnection;
    Q.SQL.Text :=
      'INSERT INTO empresas (nome_fantasia, razao_social, telefone, cnpj, rua, numero, estado, cidade, bairro, cep) ' +
      'VALUES (:fantasia, :razao, :telefone, :cnpj, :rua, :numero, :estado, :cidade, :bairro, :cep)';

    Q.ParamByName('fantasia').AsString := EmpModel.NomeFan;
    Q.ParamByName('razao').AsString := EmpModel.Razao;
    Q.ParamByName('telefone').AsString := EmpModel.Telefone;
    Q.ParamByName('cnpj').AsString := EmpModel.Cnpj;
    Q.ParamByName('rua').AsString := EmpModel.Rua;
    Q.ParamByName('numero').AsInteger := EmpModel.Numero;
    Q.ParamByName('estado').AsString := EmpModel.Estado;
    Q.ParamByName('cidade').AsString := EmpModel.Cidade;
    Q.ParamByName('bairro').AsString := EmpModel.Bairro;
    Q.ParamByName('cep').AsString := EmpModel.Cep;

    Q.ExecSQL;
    Q.Close;
  finally
    Q.Free;
  end;
end;

end.

