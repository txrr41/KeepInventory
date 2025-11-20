unit RelatorioStatusDepreciacaoService;

interface

uses
  System.SysUtils, System.Generics.Collections, System.Classes,
  FireDAC.Comp.Client, RelatorioStatusDepreciacaoModel,
  RelatorioStatusDepreciacaoRepository;

type
  TRelatorioStatusDepreciacaoService = class
  private
    FRepository: TRelatorioStatusDepreciacaoRepository;
  public
    constructor Create(AConnection: TFDConnection);
    destructor Destroy; override;
    function GerarRelatorioStatus: TObjectList<TRelatorioStatusDepreciacaoModel>;
    function ObterResumoDashboard: TResumoDashboardDepreciacaoDTO;
  end;

implementation

constructor TRelatorioStatusDepreciacaoService.Create(AConnection: TFDConnection);
begin
  FRepository := TRelatorioStatusDepreciacaoRepository.Create(AConnection);
end;

destructor TRelatorioStatusDepreciacaoService.Destroy;
begin
  FRepository.Free;
  inherited;
end;

function TRelatorioStatusDepreciacaoService.GerarRelatorioStatus: TObjectList<TRelatorioStatusDepreciacaoModel>;
begin
  Result := FRepository.ObterPatrimoniosStatusDepreciacao;
end;

function TRelatorioStatusDepreciacaoService.ObterResumoDashboard: TResumoDashboardDepreciacaoDTO;
begin
  Result := FRepository.ObterResumoDashboard;
end;


end.