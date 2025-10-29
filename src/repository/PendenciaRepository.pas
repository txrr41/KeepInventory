unit PendenciaRepository;

interface

uses
MovimentacaoModel, Data.DB, FireDAC.Comp.Client, DB;

type
TPendenciaRepository = class
  procedure AlterarStatus (AId: Integer);
  function ListarMovimentacoes: TDataSet;
  procedure AlterarStatusRecusado (AId: Integer);
end;

var
FPendenciaRepository: TPendenciaRepository;

implementation

{ TPendenciaRepository }

procedure TPendenciaRepository.AlterarStatus(AId: Integer);
var
  Q: TFDQuery;
begin
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := DataModule2.FDConnection;
    Q.SQL.Text := 'UPDATE movimentacoes SET status = ''Aceito'' WHERE id = :id';
    Q.ParamByName('id').AsInteger := AId;
    Q.ExecSQL;
    Q.Close;
  finally
    Q.Free;
  end;
end;

procedure TPendenciaRepository.AlterarStatusRecusado(AId: Integer);
var
  Q: TFDQuery;
begin
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := DataModule2.FDConnection;
    Q.SQL.Text := 'UPDATE movimentacoes SET status = ''Recusado'' WHERE id = :id';
    Q.ParamByName('id').AsInteger := AId;
    Q.ExecSQL;
    Q.Close;
  finally
    Q.Free;
  end;
end;

function TPendenciaRepository.ListarMovimentacoes: TDataSet;
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  Query.Connection := DataModule2.FDConnection;

Query.SQL.Text :=
  'SELECT ' +
  '  m.id, ' +
  '  m.data_movimentacao, ' +
  '  u.nome AS usuario, ' +              // ? MOSTRA O NOME
  '  p.nome AS patrimonio, ' +            // ? MOSTRA O NOME
  '  so.nome AS sala_origem, ' +          // ? MOSTRA O NOME
  '  sd.nome AS sala_destino, ' +         // ? MOSTRA O NOME
  '  m.quantidade, ' +
  '  m.status, ' +
  '  m.fk_id_patrimonios, ' +             // ? SALVA O ID (oculto)
  '  m.fk_id_origem, ' +                  // ? SALVA O ID (oculto)
  '  m.fk_id_destino, ' +                 // ? SALVA O ID (oculto)
  '  m.fk_id_usuarios ' +                 // ? SALVA O ID (oculto)
  'FROM movimentacoes m ' +
  'INNER JOIN usuarios u ON m.fk_id_usuarios = u.id ' +
  'INNER JOIN patrimonios p ON m.fk_id_patrimonios = p.id ' +
  'INNER JOIN salas so ON m.fk_id_origem = so.id ' +
  'INNER JOIN salas sd ON m.fk_id_destino = sd.id ' +
  'WHERE m.status = ''Aceito''';

  Query.Open;
  Result := Query;

end;

end.
