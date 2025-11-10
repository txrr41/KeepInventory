unit DashboardController;

interface

uses
  DashboardService, DashboardModel, System.Generics.Collections;

type
  TDashboardController = class
  private
    FService: TDashboardService;
  public
    constructor Create;
    destructor Destroy; override;

    function CarregarGraficoPorPredio: TObjectList<TDashboardItemModel>;
    function CarregarGraficoPorSala(ALimit: Integer = 10): TObjectList<TDashboardItemModel>;
  end;

implementation

{ TDashboardController }

constructor TDashboardController.Create;
begin
  FService := TDashboardService.Create;
end;

destructor TDashboardController.Destroy;
begin
  FService.Free;
  inherited;
end;

function TDashboardController.CarregarGraficoPorPredio: TObjectList<TDashboardItemModel>;
begin
  Result := FService.ObterDadosPorPredio;
end;

function TDashboardController.CarregarGraficoPorSala(ALimit: Integer): TObjectList<TDashboardItemModel>;
begin
  Result := FService.ObterDadosPorSala(ALimit);
end;

end.

