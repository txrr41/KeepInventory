unit SalaRepository;

interface

uses
SalaDTO, SalaModel, DB, FireDAC.Comp.Client, Data.DB, System.SysUtils, System.Classes;

Type
TSalaRepository = class
public
procedure AdicionarSala (ASalaModel: TSalaConfig);
function ListarNomesPredios: TStringList;
function ListarSala: TDataSet;

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

function TSalaRepository.ListarNomesPredios: TStringList;
var
  Query: TFDQuery;
  ID: Integer;
begin
  Result := TStringList.Create;
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := DataModule2.FDConnection;
    Query.SQL.Text := 'SELECT id, nome FROM predios ORDER BY nome';
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
    '  s.nome AS nome, ' +        // <-- ALIAS para nome da sala
    '  p.nome AS nome_predio, ' +      // <-- ALIAS para nome do prédio
    '  s.situacao, ' +
    '  s.tipo, ' +
    '  s.observacao, ' +
    '  s.fk_id_predios ' +
    'FROM salas s ' +
    'INNER JOIN predios p ON s.fk_id_predios = p.id ' +
    'ORDER BY s.nome';

  Query.Open;
  Result := Query;
end;
{ TSalaRepository }



end.
