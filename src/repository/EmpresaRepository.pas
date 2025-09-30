unit EmpresaRepository;

interface
uses
  EmpresaModel, DB, FireDAC.Comp.Client, System.SysUtils;

type
  TEmpresaRepository = class
  private
    function ApenasNumeros(const ATexto: string): string;
  public
    procedure AdicionarEmpresa(EmpModel: TEmpresaConfig);
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
    Q.ParamByName('telefone').AsString := ApenasNumeros(EmpModel.Telefone);
    Q.ParamByName('cnpj').AsString := ApenasNumeros(EmpModel.Cnpj);
    Q.ParamByName('rua').AsString := EmpModel.Rua;
    Q.ParamByName('numero').AsInteger := EmpModel.Numero;
    Q.ParamByName('estado').AsString := EmpModel.Estado;
    Q.ParamByName('cidade').AsString := EmpModel.Cidade;
    Q.ParamByName('bairro').AsString := EmpModel.Bairro;
    Q.ParamByName('cep').AsString := ApenasNumeros(EmpModel.Cep);

    Q.ExecSQL;
  finally
    Q.Free;
  end;
end;

end.

