unit ControleDePatrimoniosService;

interface

uses
  ControlePatrimonioDTO, PatrimonioRepository, PredioRepository, SalaRepository,
  Data.DB, FireDAC.Comp.Client, System.SysUtils, System.Classes, Vcl.Dialogs;

type
  TControleDePatrimoniosService = class
  private
    FPatrimonioRepository: TPatrimonioRepository;
    FPredioRepository: TPredioRepository;
    FSalaRepository: TSalaRepository;
  public
    constructor Create;
    destructor Destroy; override;

    function ObterEstatisticas: TControlePatrimonioDTO;
    function ObterPatrimoniosParaGrid(AFiltro: TControlePatrimonioFiltroDTO): TDataSet;
    function FiltrarPatrimonios(AFiltro: TControlePatrimonioFiltroDTO): TDataSet;
    function ObterPredios: TStringList;
    function ObterSalas(AIdPredio: Integer = 0): TStringList;
    function ExtrairIdDoItem(AItem: string): Integer;
  end;

var
  FControleDePatrimoniosService: TControleDePatrimoniosService;

implementation

{ TControleDePatrimoniosService }

constructor TControleDePatrimoniosService.Create;
begin
  FPatrimonioRepository := TPatrimonioRepository.Create;
  FPredioRepository := TPredioRepository.Create;
  FSalaRepository := TSalaRepository.Create;
end;

destructor TControleDePatrimoniosService.Destroy;
begin
  FreeAndNil(FPatrimonioRepository);
  FreeAndNil(FPredioRepository);
  FreeAndNil(FSalaRepository);
  inherited;
end;

function TControleDePatrimoniosService.ExtrairIdDoItem(AItem: string): Integer;
var
  Partes: TArray<string>;
begin
  Result := 0;

  if Trim(AItem) = '' then
    Exit;

  // Se for "Todos os prédios" ou "Todas as salas", retorna 0
  if (Pos('Todos', AItem) > 0) then
    Exit;

  Partes := AItem.Split([' ']);
  if Length(Partes) > 0 then
    Result := StrToIntDef(Partes[0].Replace('[', '').Replace(']', ''), 0);
end;

function TControleDePatrimoniosService.ObterEstatisticas: TControlePatrimonioDTO;
begin
  Result := FPatrimonioRepository.ObterEstatisticas;
end;

function TControleDePatrimoniosService.ObterPatrimoniosParaGrid(
  AFiltro: TControlePatrimonioFiltroDTO): TDataSet;
begin
  Result := FPatrimonioRepository.ObterPatrimoniosParaGrid(AFiltro);
end;

function TControleDePatrimoniosService.FiltrarPatrimonios(
  AFiltro: TControlePatrimonioFiltroDTO): TDataSet;
begin
  Result := ObterPatrimoniosParaGrid(AFiltro);
end;

function TControleDePatrimoniosService.ObterPredios: TStringList;
begin
  Result := FPatrimonioRepository.ObterPredios;
end;

function TControleDePatrimoniosService.ObterSalas(AIdPredio: Integer = 0): TStringList;
begin
  Result := FPatrimonioRepository.ObterSalas(AIdPredio);
end;

end.