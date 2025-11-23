unit RastreioService;

interface

uses
  System.SysUtils, System.Generics.Collections, FireDAC.Comp.Client,
  RastreioModel, RastreioRepository;

type
  TRastreioService = class
  private
    FRepository: TRastreioRepository;
  public
    constructor Create(AConnection: TFDConnection);
    destructor Destroy; override;

    function ObterTodosPatrimonios: TObjectList<TRastreioModel>;
    function BuscarPorId(AId: Integer): TRastreioModel;
    function ObterLocalizacao(ARastreio: TRastreioModel;
      out Latitude, Longitude: Double; out Mensagem: string): Boolean;
    function BuscarDetalhesPorId(AId: Integer): TRastreioModel;
  end;

implementation

constructor TRastreioService.Create(AConnection: TFDConnection);
begin
  FRepository := TRastreioRepository.Create(AConnection);
end;

destructor TRastreioService.Destroy;
begin
  FRepository.Free;
  inherited;
end;

function TRastreioService.ObterTodosPatrimonios: TObjectList<TRastreioModel>;
begin
  Result := FRepository.ListarTodos;
end;

function TRastreioService.BuscarPorId(AId: Integer): TRastreioModel;
begin
  Result := FRepository.BuscarPorId(AId);
end;

function TRastreioService.ObterLocalizacao(ARastreio: TRastreioModel;
  out Latitude, Longitude: Double; out Mensagem: string): Boolean;
begin
  Result := False;
  Mensagem := '';

  // Validação: Patrimônio existe?
  if ARastreio = nil then
  begin
    Mensagem := 'Nenhum patrimônio selecionado!';
    Exit;
  end;

  // ✅ VERIFICA SE TEM COORDENADAS
  if (ARastreio.Latitude = 0) and (ARastreio.Longitude = 0) then
  begin
    Mensagem := 'Este patrimônio não possui localização cadastrada!';
    Exit;
  end;

  // Retorna as coordenadas
  Latitude := ARastreio.Latitude;
  Longitude := ARastreio.Longitude;
  Result := True;
  Mensagem := Format('%s - %s', [ARastreio.Nome, ARastreio.Tipo]);
end;

function TRastreioService.BuscarDetalhesPorId(AId: Integer): TRastreioModel;
begin
  Result := FRepository.BuscarDetalhesPorId(AId);
end;

end.
