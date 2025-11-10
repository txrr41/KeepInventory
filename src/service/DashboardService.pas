unit DashboardService;

interface

uses
  DashboardModel, DashboardRepository, System.Generics.Collections;

type
  TDashboardService = class
  private
    FRepository: TDashboardRepository;
  public
    constructor Create;
    destructor Destroy; override;

    function ObterDadosPorPredio: TObjectList<TDashboardItemModel>;
    function ObterDadosPorSala(ALimit: Integer = 10): TObjectList<TDashboardItemModel>;
  end;

var
  FDashboardService: TDashboardService;

implementation

{ TDashboardService }

constructor TDashboardService.Create;
begin
  FRepository := TDashboardRepository.Create;
end;

destructor TDashboardService.Destroy;
begin
  FRepository.Free;
  inherited;
end;

function TDashboardService.ObterDadosPorPredio: TObjectList<TDashboardItemModel>;
begin
  Result := FRepository.ObterPatrimoniosPorPredio;
end;

function TDashboardService.ObterDadosPorSala(ALimit: Integer): TObjectList<TDashboardItemModel>;
begin
  Result := FRepository.ObterPatrimoniosPorSala(ALimit);
end;

end.
