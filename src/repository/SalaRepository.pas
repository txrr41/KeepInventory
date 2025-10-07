unit SalaRepository;

interface

uses
SalaDTO, SalaModel, DB, FireDAC.Comp.Client, Data.DB, System.SysUtils, System.Classes;

Type
TSalaRepository = class
public
procedure AdicionarSala (ASalaModel: TSalaConfig);
function ListarNomesPredios: TStringList;

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
      'INSERT INTO salas (nome, situacao, predio, observacao, tipo) ' +
      'VALUES (:nome, :situacao, :predio, :observacao, :tipo)';

    Q.ParamByName('nome').AsString := ASalaModel.Nome;
    Q.ParamByName('situacao').AsString := ASalaModel.Situacao;
    Q.ParamByName('predio').AsString := ASalaModel.Predio;
    Q.ParamByName('tipo').AsString := ASalaModel.Tipo;
    Q.ParamByName('observacao').AsString := ASalaModel.Observacao;

    Q.ExecSQL;
    Q.Close;
  finally
    Q.Free;
  end;
end;

function TSalaRepository.ListarNomesPredios: TStringList;
var
  Query: TFDQuery;
begin
  Result := TStringList.Create;
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := DataModule2.FDConnection;
    Query.SQL.Text := 'SELECT nome FROM predios ORDER BY nome';
    Query.Open;

    while not Query.Eof do
    begin
      Result.Add(Query.FieldByName('nome').AsString);
      Query.Next;
    end;
  finally
    Query.Free;
  end;
end;

{ TSalaRepository }



end.
