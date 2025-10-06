unit PredioRepository;

interface

uses
PredioModel, DB, FireDAC.Comp.Client, Data.DB;

Type
TPredioRepository = class
private
public
procedure AdicionarPredio(PrModel: TPredioConfig);
function ListarPredio: TDataSet;
end;


implementation

{ TPredioRepository }

procedure TPredioRepository.AdicionarPredio(PrModel: TPredioConfig);
var
  Q: TFDQuery;
begin
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := DataModule2.FDConnection;
    Q.SQL.Text :=
      'INSERT INTO predios (nome, situacao, telefone, rua, numero, estado, cidade, bairro, cep) ' +
      'VALUES (:nome, :situacao, :telefone, :rua, :numero, :estado, :cidade, :bairro, :cep)';

    Q.ParamByName('nome').AsString := PrModel.Nome;
    Q.ParamByName('situacao').AsString := PrModel.Situacao;
    Q.ParamByName('telefone').AsString := PrModel.Telefone;
    Q.ParamByName('rua').AsString := PrModel.Rua;
    Q.ParamByName('numero').AsInteger := PrModel.Numero;
    Q.ParamByName('estado').AsString := PrModel.Estado;
    Q.ParamByName('cidade').AsString := PrModel.Cidade;
    Q.ParamByName('bairro').AsString := PrModel.Bairro;
    Q.ParamByName('cep').AsString := PrModel.Cep;

    Q.ExecSQL;
    Q.Close;
  finally
    Q.Free;
  end;
end;

function TPredioRepository.ListarPredio: TDataSet;
var
Q: TFDQuery;
begin
Q := TFDQuery.Create(nil);
try
  Q.Connection := DataModule2.FDConnection;
  Q.Sql.Text := 'SELECT * FROM predios WHERE ativo = true ORDER BY id ';
  Q.Open;

  Result := Q;
finally

end;
end;

end.
