unit RelatorioStatusDepreciacaoController;

interface

uses
  System.SysUtils, System.Generics.Collections, System.Classes,
  FireDAC.Comp.Client, RelatorioStatusDepreciacaoService,
  RelatorioStatusDepreciacaoModel, DB;

type
  TRelatorioStatusDepreciacaoController = class
  private
    FService: TRelatorioStatusDepreciacaoService;
  public
    constructor Create(AConnection: TFDConnection);
    destructor Destroy; override;

    function GerarRelatorioStatus(out MensagemErro: string): TObjectList<TRelatorioStatusDepreciacaoModel>;
    function ObterResumoDashboard(out MensagemErro: string): TResumoDashboardDepreciacaoDTO;
    procedure PrepararRelatorioFastReport(out MensagemErro: string);
  end;

implementation

constructor TRelatorioStatusDepreciacaoController.Create(AConnection: TFDConnection);
begin
  FService := TRelatorioStatusDepreciacaoService.Create(AConnection);
end;

destructor TRelatorioStatusDepreciacaoController.Destroy;
begin
  FService.Free;
  inherited;
end;

function TRelatorioStatusDepreciacaoController.GerarRelatorioStatus(
  out MensagemErro: string): TObjectList<TRelatorioStatusDepreciacaoModel>;
begin
  Result := nil;
  MensagemErro := '';

  try
    Result := FService.GerarRelatorioStatus;
  except
    on E: Exception do
    begin
      MensagemErro := 'Erro ao gerar relatório de status de depreciação: ' + E.Message;
      if Assigned(Result) then
        Result.Free;
      Result := nil;
    end;
  end;
end;

function TRelatorioStatusDepreciacaoController.ObterResumoDashboard(
  out MensagemErro: string): TResumoDashboardDepreciacaoDTO;
begin
  Result.TotalPatrimonios := 0;
  Result.MediaDepreciacao := 0;
  Result.TotalDepreciado := 0;
  Result.TotalValorAtual := 0;
  Result.ContagemMonitorar := 0;
  Result.ContagemPlanejamento := 0;
  Result.ContagemAtencao := 0;
  Result.ContagemUrgente := 0;
  Result.ContagemDepreciado := 0;

  MensagemErro := '';

  try
    Result := FService.ObterResumoDashboard;
  except
    on E: Exception do
    begin
      MensagemErro := 'Erro ao obter resumo do dashboard: ' + E.Message;
    end;
  end;
end;

procedure TRelatorioStatusDepreciacaoController.PrepararRelatorioFastReport(
    out MensagemErro: string);
begin
  MensagemErro := '';

  try
    // Abre as queries diretamente (elas já têm a SQL definida no design time)
    if not DataModule2.qryRelatorio.Active then
      DataModule2.qryRelatorio.Open;

    if not DataModule2.qryResumo.Active then
      DataModule2.qryResumo.Open;
  except
    on E: Exception do
    begin
      MensagemErro := 'Erro ao preparar relatório FastReport: ' + E.Message;
    end;
  end;
end;

end.