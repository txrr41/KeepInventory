unit RastreioController;

interface

uses
  System.SysUtils, System.Generics.Collections, FireDAC.Comp.Client,
  RastreioModel, RastreioService;

type
  TRastreioController = class
  private
    FService: TRastreioService;
  public
    constructor Create(AConnection: TFDConnection);
    destructor Destroy; override;

    function CarregarPatrimonios: TObjectList<TRastreioModel>;
    function LocalizarPatrimonio(APatrimonioId: Integer;
      out Latitude, Longitude: Double; out Descricao: string): Boolean;
    function BuscarDetalhesPatrimonio(AId: Integer): TRastreioModel;
  end;

implementation

constructor TRastreioController.Create(AConnection: TFDConnection);
begin
  FService := TRastreioService.Create(AConnection);
end;

destructor TRastreioController.Destroy;
begin
  FService.Free;
  inherited;
end;

function TRastreioController.CarregarPatrimonios: TObjectList<TRastreioModel>;
begin
  Result := FService.ObterTodosPatrimonios;
end;

function TRastreioController.LocalizarPatrimonio(APatrimonioId: Integer;
  out Latitude, Longitude: Double; out Descricao: string): Boolean;
var
  Rastreio: TRastreioModel;
begin
  Result := False;
  Rastreio := FService.BuscarPorId(APatrimonioId);
  try
    if Rastreio <> nil then
    begin
      Result := FService.ObterLocalizacao(Rastreio, Latitude, Longitude, Descricao);
    end
    else
    begin
      Descricao := 'Patrim�nio n�o encontrado!';
    end;
  finally
    Rastreio.Free;
  end;
end;

function TRastreioController.BuscarDetalhesPatrimonio(AId: Integer): TRastreioModel;
begin
  Result := FService.BuscarDetalhesPorId(AId);
end;

end.
