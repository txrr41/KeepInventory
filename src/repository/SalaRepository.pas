unit SalaRepository;

interface

uses
SalaDTO, SalaModel, DB, FireDAC.Comp.Client, Data.DB, System.SysUtils, System.Classes;

Type
TSalaRepository = class
public
procedure AdicionarSala (ASalaModel: TSalaConfig);
procedure ExcluirSala (AId: Integer);
procedure EditarSala (ASalaModel: TSalaConfig);
function ListarNomesPredios: TStringList;
function ListarSala: TDataSet;
function PesquisarSala (const aSearch: String): TDataSet;

end;

var
FSalaRepository: TSalaRepository;

implementation

{ TSalaRepository }



{ TSalaRepository }

procedure TSalaRepository.AdicionarSala(ASalaModel: TSalaConfig);
var
  Q: TFDQuery;
begin
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := DataModule2.FDConnection;
    Q.SQL.Text :=
      'INSERT INTO salas (nome, situacao, observacao, tipo, fk_id_predios) ' +
      'VALUES (:nome, :situacao, :observacao, :tipo, :fk_id_predios)';

    Q.ParamByName('nome').AsString := ASalaModel.Nome;
    Q.ParamByName('situacao').AsString := ASalaModel.Situacao;
    Q.ParamByName('tipo').AsString := ASalaModel.Tipo;
    Q.ParamByName('observacao').AsString := ASalaModel.Observacao;
    Q.ParamByName('fk_id_predios').AsInteger := ASalaModel.IdPredio;

    Q.ExecSQL;
    Q.Close;
  finally
    Q.Free;
  end;
end;

procedure TSalaRepository.EditarSala(ASalaModel: TSalaConfig);
var
Q: TFDQuery;
begin
Q := TFDQuery.Create(nil);
try
  Q.Connection := DataModule2.FDConnection;
  Q.SQL.Text := 'UPDATE salas SET nome = :Nome, situacao = :situacao, Tipo = :tipo, fk_id_predios = :fk_id_predios, observacao = :observacao WHERE id = :Id';
  Q.ParamByName('Nome').AsString := ASalaModel.Nome;
  Q.ParamByName('Situacao').AsString := ASalaModel.Situacao;
  Q.ParamByName('tipo').AsString := ASalaModel.Tipo;
  Q.ParamByName('observacao').AsString := ASalaModel.Observacao;
  Q.ParamByName('fk_id_predios').AsInteger := ASalaModel.IdPredio;
  Q.ParamByName('Id').AsInteger := ASalaModel.Id;

  Q.ExecSQL;
  Q.Close;

finally
  Q.Free;
end;
end;

procedure TSalaRepository.ExcluirSala(AId: Integer);
var
 Q: TFDQuery;
begin
 Q := TFDQuery.Create(nil);
 try
   Q.Connection := DataModule2.FDConnection;
   Q.SQL.Text := 'UPDATE salas SET ativo = false WHERE id = :id';
   Q.ParamByName('id').AsInteger := AId;
   Q.ExecSQL;
   Q.Close;
 finally
  Q.Free;
 end;
end;

function TSalaRepository.ListarNomesPredios: TStringList;
var
  Query: TFDQuery;
  ID: Integer;
begin
  Result := TStringList.Create;
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := DataModule2.FDConnection;
    Query.SQL.Text := 'SELECT id, nome FROM predios WHERE ativo = true ORDER BY nome';
    Query.Open;

    while not Query.Eof do
    begin
      Result.Add(Query.FieldByName('nome').AsString);

      ID := Query.FieldByName('id').AsInteger;
      Result.Objects[Result.Count - 1] := Pointer(ID);

      Query.Next;
    end;
  finally
    Query.Free;
  end;
end;

function TSalaRepository.ListarSala: TDataSet;
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  Query.Connection := DataModule2.FDConnection;

  Query.SQL.Text :=
    'SELECT ' +
    '  s.id, ' +
    '  s.nome AS nome, ' +
    '  p.nome AS nome_predio, ' +
    '  s.situacao, ' +
    '  s.tipo, ' +
    '  s.observacao, ' +
    '  s.fk_id_predios ' +
    'FROM salas s ' +
    'INNER JOIN predios p ON s.fk_id_predios = p.id ' +
     'WHERE s.ativo = true ' +
    'ORDER BY s.id';

  Query.Open;
  Result := Query;
end;
function TSalaRepository.PesquisarSala(const aSearch: String): TDataSet;
var
  Q: TFDQuery;
begin
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := DataModule2.FDConnection;
    Q.SQL.Text :=
      'SELECT id, nome, situacao, fk_id_predios, tipo, ' +
      '       observacao ' +
      'FROM salas ' +
      'WHERE ativo = true ' +
      '  AND (nome ILIKE :search ' +
      '       OR situacao ILIKE :search ' +
      '       OR fk_id_predios::text ILIKE :search ' +
      '       OR tipo ILIKE :search) ' +
      'ORDER BY id';
    Q.ParamByName('search').AsString := '%' + Trim(aSearch) + '%';
    Q.Open;
    Result := Q;
  except
    Q.Free;
    raise;
  end;
end;
{ TSalaRepository }


end.
