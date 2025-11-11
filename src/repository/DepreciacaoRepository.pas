  unit DepreciacaoRepository;

interface

uses
  DepreciacaoModel, System.Generics.Collections, FireDAC.Comp.Client,
  System.SysUtils, Data.DB, DB;

type
  TDepreciacaoRepository = class
  public
    function ObterDepreciacaoPorTipo: TObjectList<TDepreciacaoTipoModel>;
    function ObterResumoDepreciacao: TResumoDepreciacaoModel;
  end;

implementation


{ TDepreciacaoRepository }

function TDepreciacaoRepository.ObterDepreciacaoPorTipo: TObjectList<TDepreciacaoTipoModel>;
var
  Query: TFDQuery;
  Item: TDepreciacaoTipoModel;
  TotalGeral: Currency;
begin
  Result := TObjectList<TDepreciacaoTipoModel>.Create;
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := DataModule2.FDConnection;

    // Total geral depreciado
    Query.SQL.Text :=
      'SELECT COALESCE(SUM(o.valor_antes - o.valor_depois), 0) AS total_geral ' +
      'FROM ocorrencias o ' +
      'WHERE o.status = ''analisada'' ' +
      '  AND o.valor_antes > 0 ' +
      '  AND o.valor_depois >= 0';

    Query.Open;
    TotalGeral := Query.FieldByName('total_geral').AsCurrency;
    Query.Close;

    // Depreciação agrupada por tipo
    Query.SQL.Text :=
      'SELECT ' +
      '  o.tipo_ocorrencia, ' +
      '  COALESCE(SUM(o.valor_antes - o.valor_depois), 0) AS valor_depreciado, ' +
      '  COUNT(o.id) AS quantidade ' +
      'FROM ocorrencias o ' +
      'WHERE o.status = ''analisada'' ' +
      '  AND o.valor_antes > 0 ' +
      '  AND o.valor_depois >= 0 ' +
      'GROUP BY o.tipo_ocorrencia ' +
      'ORDER BY valor_depreciado DESC';

    Query.Open;

    while not Query.Eof do
    begin
      Item := TDepreciacaoTipoModel.Create;
      Item.TipoOcorrencia := Query.FieldByName('tipo_ocorrencia').AsString;
      Item.ValorDepreciado := Query.FieldByName('valor_depreciado').AsCurrency;
      Item.QuantidadeOcorrencias := Query.FieldByName('quantidade').AsInteger;

      if TotalGeral > 0 then
        Item.PercentualTotal := (Item.ValorDepreciado / TotalGeral) * 100
      else
        Item.PercentualTotal := 0;

      Result.Add(Item);
      Query.Next;
    end;
  finally
    Query.Free;
  end;
end;

function TDepreciacaoRepository.ObterResumoDepreciacao: TResumoDepreciacaoModel;
var
  Query: TFDQuery;
begin
  Result := TResumoDepreciacaoModel.Create;
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := DataModule2.FDConnection;

    Query.SQL.Text :=
      'SELECT ' +
      '  COALESCE(SUM(p.valor_aquisicao), 0) AS valor_original, ' +
      '  COALESCE(SUM(p.valor_atual), 0) AS valor_atual, ' +
      '  COALESCE(SUM(p.valor_aquisicao - p.valor_atual), 0) AS valor_depreciado ' +
      'FROM patrimonios p ' +
      'WHERE p.ativo = TRUE';

    Query.Open;

    Result.ValorOriginalTotal := Query.FieldByName('valor_original').AsCurrency;
    Result.ValorAtualTotal := Query.FieldByName('valor_atual').AsCurrency;
    Result.ValorDepreciadoTotal := Query.FieldByName('valor_depreciado').AsCurrency;

    if Result.ValorOriginalTotal > 0 then
      Result.TaxaDepreciacaoMedia := (Result.ValorDepreciadoTotal / Result.ValorOriginalTotal) * 100
    else
      Result.TaxaDepreciacaoMedia := 0;

  finally
    Query.Free;
  end;
end;

end.

