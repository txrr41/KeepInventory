unit RelatorioDepreciacaoController;

interface

uses
  System.SysUtils, System.Generics.Collections, System.Classes,
  FireDAC.Comp.Client, RelatorioDepreciacaoService,
  RelatorioDepreciacaoItemModel, DB;

type
  TRelatorioDepreciacaoController = class
  private
    FService: TRelatorioDepreciacaoService;
  public
    constructor Create(AConnection: TFDConnection);
    destructor Destroy; override;

    function GerarRelatorio(ADataInicio, ADataFim: TDate;
      const ATipoOcorrencia: string;
      out MensagemErro: string): TObjectList<TRelatorioDepreciacaoItemModel>;
    function ObterTiposOcorrencia: TStringList;
    procedure PrepararRelatorioFastReport(ADataInicio, ADataFim: TDate;
      const ATipoOcorrencia: string; out MensagemErro: string);
    function ObterMaiorImpactoParaRelatorio(ADataInicio, ADataFim: TDate;
      const ATipoOcorrencia: string): TMaiorImpactoDTO;
  end;

implementation

constructor TRelatorioDepreciacaoController.Create(AConnection: TFDConnection);
begin
  FService := TRelatorioDepreciacaoService.Create(AConnection);
end;

destructor TRelatorioDepreciacaoController.Destroy;
begin
  FService.Free;
  inherited;
end;

function TRelatorioDepreciacaoController.GerarRelatorio(
  ADataInicio, ADataFim: TDate; const ATipoOcorrencia: string;
  out MensagemErro: string): TObjectList<TRelatorioDepreciacaoItemModel>;
begin
  Result := nil;
  MensagemErro := '';

  if not FService.ValidarDatas(ADataInicio, ADataFim, MensagemErro) then
    Exit;

  try
    Result := FService.GerarRelatorio(ADataInicio, ADataFim, ATipoOcorrencia);
  except
    on E: Exception do
    begin
      MensagemErro := 'Erro ao gerar relat�rio: ' + E.Message;
      if Assigned(Result) then
        Result.Free;
      Result := nil;
    end;
  end;
end;

function TRelatorioDepreciacaoController.ObterMaiorImpactoParaRelatorio(
  ADataInicio, ADataFim: TDate;
  const ATipoOcorrencia: string): TMaiorImpactoDTO;
begin
  Result := FService.ObterMaiorImpacto(ADataInicio, ADataFim, ATipoOcorrencia);
end;

function TRelatorioDepreciacaoController.ObterTiposOcorrencia: TStringList;
begin
  Result := FService.ObterTiposOcorrencia;
end;

procedure TRelatorioDepreciacaoController.PrepararRelatorioFastReport(
  ADataInicio, ADataFim: TDate; const ATipoOcorrencia: string;
  out MensagemErro: string);
begin
  MensagemErro := '';

  if not FService.ValidarDatas(ADataInicio, ADataFim, MensagemErro) then
    Exit;

  try
    // O service vai preencher a QueryDepreciacao do DataModule2
    FService.PreencherQueryRelatorio(DataModule2.QueryDepreciacao, ADataInicio, ADataFim, ATipoOcorrencia);
  except
    on E: Exception do
    begin
      MensagemErro := 'Erro ao preparar relat�rio: ' + E.Message;
    end;
  end;
end;

end.
