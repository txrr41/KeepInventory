unit EmpresaRepository;

interface
uses
EmpresaModel, DB, FireDAC.Comp.Client, System.SysUtils;
type
TEmpresaRepository = class

  public
  procedure AdicionarEmpresa (EmpModel: TEmpresaConfig);
end;

implementation

{ TEmpresaRepository }

procedure TEmpresaRepository.AdicionarEmpresa(EmpModel: TEmpresaConfig);
var
Q: TFDQuery;
begin
    Q := TFDQuery.Create(nil);
    try
      Q.Connection := DataModule2.FDConnection;
      Q.SQL.Text := 'INSERT INTO empresas (nome_fantasia, razao_social, telefone, cnpj, rua, numero, estado, cidade, bairro, cep) VALUES (:fantasia, :razao, :telefone, :cnpj, :rua,' +
                    ':numero, :estado, :cidade, :bairro, :cep)';
      Q.ParamByName('fantasia').AsString := EmpModel.NomeFan;
      Q.ParamByName('razao').AsString := EmpModel.Razao;
      Q.ParamByName('telefone').AsString := EmpModel.Telefone;
      Q.ParamByName('cnpj').AsString := EmpModel.Cnpj;
      Q.ParamByName('rua').AsString := EmpModel.Rua;
      Q.ParamByName('numero').AsString := IntToStr(EmpModel.Numero);
      Q.ParamByName('estado').AsString := EmpModel.Estado;
      Q.ParamByName('cidade').AsString := EmpModel.Cidade;
      Q.ParamByName('bairro').AsString := EmpModel.Bairro;
      Q.ParamByName('cep').AsString := EmpModel.Cep;
      Q.ExecSQL;
    finally

    end;
end;

end.
