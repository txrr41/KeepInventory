unit PredioRepository;

interface

uses
PredioModel, DB, FireDAC.Comp.Client, Data.DB, System.SysUtils;

Type
TPredioRepository = class
private
public
procedure AdicionarPredio(PrModel: TPredioConfig);
procedure EditarPredio (APredioConfig: TPredioConfig);
procedure ExcluirPredio (AId: Integer);
procedure RecuperarPredio (AId: Integer);
function ListarPredio: TDataSet;
function ListarPredioInativos: TDataSet;
function PesquisarPredio (const aSearch: String): TDataSet;
function ContarSalasPorPredio(IdPredio: Integer): Integer;
function ContarPatrimoniosPorPredio(IdPredio: Integer): Integer;
end;

 var
 FRepository: TPredioRepository;
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

procedure TPredioRepository.EditarPredio(APredioConfig: TPredioConfig);
var
Q: TFDQuery;
begin
Q := TFDQuery.Create(nil);
try
  Q.Connection := DataModule2.FDConnection;
  Q.SQL.Text := 'UPDATE predios SET nome = :Nome, situacao = :situacao, telefone = :Telefone, rua = :Rua, numero = :Numero, estado = :Estado, cidade = :Cidade, cep = :Cep, bairro = :Bairro WHERE id = :Id';
  Q.ParamByName('Nome').AsString := APredioConfig.Nome;
  Q.ParamByName('Situacao').AsString := APredioConfig.Situacao;
  Q.ParamByName('Telefone').AsString := APredioConfig.Telefone;
  Q.ParamByName('Rua').AsString := APredioConfig.Rua;
  Q.ParamByName('Numero').AsInteger := APredioConfig.Numero;
  Q.ParamByName('Estado').AsString := APredioConfig.Estado;
  Q.ParamByName('Cidade').AsString := APredioConfig.Cidade;
  Q.ParamByName('Cep').AsString := APredioConfig.Cep;
  Q.ParamByName('Bairro').AsString := APredioConfig.Bairro;
  Q.ParamByName('Id').AsInteger := APredioConfig.Id;

  Q.ExecSQL;
  Q.Close;

finally
  Q.Free;
end;
end;

procedure TPredioRepository.ExcluirPredio(AId: Integer);
var
 Q: TFDQuery;
begin
 Q := TFDQuery.Create(nil);
 try
   Q.Connection := DataModule2.FDConnection;
   Q.SQL.Text := 'UPDATE predios SET ativo = false WHERE id = :id';
   Q.ParamByName('id').AsInteger := AId;
   Q.ExecSQL;
   Q.Close;
 finally
  Q.Free;
 end;
end;

procedure TPredioRepository.RecuperarPredio(AId: Integer);
var
 Q: TFDQuery;
begin
 Q := TFDQuery.Create(nil);
 try
   Q.Connection := DataModule2.FDConnection;
   Q.SQL.Text := 'UPDATE predios SET ativo = true WHERE id = :id';
   Q.ParamByName('id').AsInteger := AId;
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

function TPredioRepository.ListarPredioInativos: TDataSet;
var
Q: TFDQuery;
begin
Q := TFDQuery.Create(nil);
try
  Q.Connection := DataModule2.FDConnection;
  Q.Sql.Text := 'SELECT * FROM predios WHERE ativo = false ORDER BY id ';
  Q.Open;

  Result := Q;
finally

end;
end;

function TPredioRepository.PesquisarPredio(const aSearch: String): TDataSet;
var
  Q: TFDQuery;
begin
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := DataModule2.FDConnection;
    Q.SQL.Text :=
      'SELECT id, nome, situacao, telefone, cep, ' +
      '       rua, numero, bairro, cidade, estado ' +
      'FROM predios ' +
      'WHERE ativo = true ' +
      '  AND (nome ILIKE :search ' +
      '       OR estado ILIKE :search ' +
      '       OR situacao ILIKE :search ' +
      '       OR cidade ILIKE :search ' +
      '       OR bairro ILIKE :search) ' +
      'ORDER BY id';
    Q.ParamByName('search').AsString := '%' + Trim(aSearch) + '%';
    Q.Open;
    Result := Q;
  except
    Q.Free;
    raise;
  end;
end;

function TPredioRepository.ContarSalasPorPredio(IdPredio: Integer): Integer;
var
  Q: TFDQuery;
begin
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := DataModule2.FDConnection;
    Q.SQL.Text :=
      'SELECT COUNT(*) as total ' +
      'FROM salas ' +
      'WHERE fk_id_predios = :id_predio AND ativo = true';
    Q.ParamByName('id_predio').AsInteger := IdPredio;
    Q.Open;
    Result := Q.FieldByName('total').AsInteger;
    Q.Close;
  finally
    Q.Free;
  end;
end;

function TPredioRepository.ContarPatrimoniosPorPredio(IdPredio: Integer): Integer;
var
  Q: TFDQuery;
begin
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := DataModule2.FDConnection;
    Q.SQL.Text :=
      'SELECT COUNT(*) as total ' +
      'FROM patrimonios p ' +
      'INNER JOIN salas s ON p.fk_id_salas = s.id ' +
      'WHERE s.fk_id_predios = :id_predio AND p.ativo = true AND s.ativo = true';
    Q.ParamByName('id_predio').AsInteger := IdPredio;
    Q.Open;
    Result := Q.FieldByName('total').AsInteger;
    Q.Close;
  finally
    Q.Free;
  end;
end;

end.
