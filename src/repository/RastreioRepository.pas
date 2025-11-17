unit RastreioRepository;

interface

uses
  System.SysUtils, System.Generics.Collections, FireDAC.Comp.Client,
  FireDAC.Stan.Param, RastreioModel, DB;

type
  TRastreioRepository = class
  private
    FConnection: TFDConnection;
  public
    constructor Create(AConnection: TFDConnection);
    function ListarTodos: TObjectList<TRastreioModel>;
    function BuscarPorId(AId: Integer): TRastreioModel;
  end;

implementation

constructor TRastreioRepository.Create(AConnection: TFDConnection);
begin
  FConnection := AConnection;
end;

function TRastreioRepository.ListarTodos: TObjectList<TRastreioModel>;
var
  Query: TFDQuery;
  Rastreio: TRastreioModel;
begin
  Result := TObjectList<TRastreioModel>.Create;
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := FConnection;
    Query.SQL.Text :=
      'SELECT id, nome, tipo, situacao, modelo, ' +
      '       latitude, longitude ' + // ✅ ADICIONADO
      'FROM patrimonios ' +
      'WHERE ativo = true ' + // ✅ MUDEI DE 1 PARA TRUE
      'ORDER BY nome';

    Query.Open;

    while not Query.Eof do
    begin
      Rastreio := TRastreioModel.Create;
      Rastreio.Id := Query.FieldByName('id').AsInteger;
      Rastreio.Nome := Query.FieldByName('nome').AsString;
      Rastreio.Tipo := Query.FieldByName('tipo').AsString;
      Rastreio.Situacao := Query.FieldByName('situacao').AsString;
      Rastreio.Modelo := Query.FieldByName('modelo').AsString;

      // ✅ PEGA LATITUDE E LONGITUDE DO BANCO
      if not Query.FieldByName('latitude').IsNull then
        Rastreio.Latitude := Query.FieldByName('latitude').AsFloat
      else
        Rastreio.Latitude := 0;

      if not Query.FieldByName('longitude').IsNull then
        Rastreio.Longitude := Query.FieldByName('longitude').AsFloat
      else
        Rastreio.Longitude := 0;

      Result.Add(Rastreio);
      Query.Next;
    end;
  finally
    Query.Free;
  end;
end;

function TRastreioRepository.BuscarPorId(AId: Integer): TRastreioModel;
var
  Query: TFDQuery;
begin
  Result := nil;
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := FConnection;
    Query.SQL.Text :=
      'SELECT id, nome, tipo, situacao, modelo, ' +
      '       latitude, longitude ' + // ✅ ADICIONADO
      'FROM patrimonios ' +
      'WHERE id = :id AND ativo = true';

    Query.ParamByName('id').AsInteger := AId;
    Query.Open;

    if not Query.IsEmpty then
    begin
      Result := TRastreioModel.Create;
      Result.Id := Query.FieldByName('id').AsInteger;
      Result.Nome := Query.FieldByName('nome').AsString;
      Result.Tipo := Query.FieldByName('tipo').AsString;
      Result.Situacao := Query.FieldByName('situacao').AsString;
      Result.Modelo := Query.FieldByName('modelo').AsString;

      // ✅ PEGA COORDENADAS
      if not Query.FieldByName('latitude').IsNull then
        Result.Latitude := Query.FieldByName('latitude').AsFloat
      else
        Result.Latitude := 0;

      if not Query.FieldByName('longitude').IsNull then
        Result.Longitude := Query.FieldByName('longitude').AsFloat
      else
        Result.Longitude := 0;
    end;
  finally
    Query.Free;
  end;
end;

end.
