unit DashboardRepository;

interface

uses
  DashboardModel, System.Generics.Collections, FireDAC.Comp.Client,
  System.SysUtils, Data.DB, DB;

type
  TDashboardRepository = class
  public
    function ObterPatrimoniosPorPredio: TObjectList<TDashboardItemModel>;
    function ObterPatrimoniosPorSala(ALimit: Integer = 10): TObjectList<TDashboardItemModel>;
  end;

var
  FDashboardRepository: TDashboardRepository;

implementation

{ TDashboardRepository }

function TDashboardRepository.ObterPatrimoniosPorPredio: TObjectList<TDashboardItemModel>;
var
  Query: TFDQuery;
  Item: TDashboardItemModel;
begin
  Result := TObjectList<TDashboardItemModel>.Create;
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := DataModule2.FDConnection;
    Query.SQL.Text :=
      'SELECT ' +
      '  p.nome AS predio, ' +
      '  COUNT(pat.id) AS quantidade ' +
      'FROM predios p ' +
      'LEFT JOIN salas s ON s.fk_id_predios = p.id ' +
      'LEFT JOIN patrimonios pat ON pat.fk_id_salas = s.id ' +
      'WHERE p.ativo = true ' +
      'GROUP BY p.nome ' +
      'ORDER BY quantidade DESC';

    Query.Open;

    while not Query.Eof do
    begin
      Item := TDashboardItemModel.Create;
      Item.Nome := Query.FieldByName('predio').AsString;
      Item.Quantidade := Query.FieldByName('quantidade').AsInteger;
      Result.Add(Item);
      Query.Next;
    end;
  finally
    Query.Free;
  end;
end;

function TDashboardRepository.ObterPatrimoniosPorSala(ALimit: Integer): TObjectList<TDashboardItemModel>;
var
  Query: TFDQuery;
  Item: TDashboardItemModel;
begin
  Result := TObjectList<TDashboardItemModel>.Create;
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := DataModule2.FDConnection;
    Query.SQL.Text :=
      'SELECT ' +
      '  s.nome AS sala, ' +
      '  p.nome AS predio, ' +
      '  COUNT(pat.id) AS quantidade ' +
      'FROM salas s ' +
      'LEFT JOIN predios p ON p.id = s.fk_id_predios ' +
      'LEFT JOIN patrimonios pat ON pat.fk_id_salas = s.id ' +
      'WHERE s.ativo = true ' +
      'GROUP BY s.nome, p.nome ' +
      'ORDER BY quantidade DESC ' +
      'LIMIT :limit';

    Query.ParamByName('limit').AsInteger := ALimit;
    Query.Open;

    while not Query.Eof do
    begin
      Item := TDashboardItemModel.Create;
      Item.Nome := Query.FieldByName('sala').AsString + ' - ' +
                   Query.FieldByName('predio').AsString;
      Item.Quantidade := Query.FieldByName('quantidade').AsInteger;
      Result.Add(Item);
      Query.Next;
    end;
  finally
    Query.Free;
  end;
end;

end.
