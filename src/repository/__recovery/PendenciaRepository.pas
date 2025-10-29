unit PendenciaRepository;

interface

uses
MovimentacaoModel, DB, FireDAC.Comp.Client, Data.DB, System.SysUtils;

type
TPendenciaRepository = class
  procedure AlterarStatus (AId: Integer);
  procedure AlterarStatusRecusado(Aid: Integer);
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
  Q.SQL.Text := 'UPDATE movimentacoes SET status = ''Aceito'' WHERE id = :Id';
  Q.ParamByName('Id').AsInteger := AId;

  Q.ExecSQL;
  Q.Close;

finally
  Q.Free;
end;
end;



procedure TPendenciaRepository.AlterarStatusRecusado(Aid: Integer);
var
Q: TFDQuery;
begin
Q := TFDQuery.Create(nil);
try
  Q.Connection := DataModule2.FDConnection;
  Q.SQL.Text := 'UPDATE movimentacoes SET status = ''Recusado'' WHERE id = :Id';
  Q.ParamByName('Id').AsInteger := AId;

  Q.ExecSQL;
  Q.Close;

finally
  Q.Free;
end;
end;

end.
