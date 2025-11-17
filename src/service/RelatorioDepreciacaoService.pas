unit RelatorioDepreciacaoService;

interface

uses
  System.SysUtils, System.Generics.Collections, System.Classes,
  FireDAC.Comp.Client, RelatorioDepreciacaoItemModel,
  RelatorioDepreciacaoRepository;

type
  TRelatorioDepreciacaoService = class
  private
    FRepository: TRelatorioDepreciacaoRepository;
  public
    constructor Create(AConnection: TFDConnection);
    destructor Destroy; override;

    function GerarRelatorio(ADataInicio, ADataFim: TDate;
      const ATipoOcorrencia: string): TObjectList<TRelatorioDepreciacaoItemModel>;
    function ObterTiposOcorrencia: TStringList;
    function ValidarDatas(ADataInicio, ADataFim: TDate;
      out Mensagem: string): Boolean;
    procedure PreencherQueryRelatorio(AQuery: TFDQuery; ADataInicio, ADataFim: TDate;
      const ATipoOcorrencia: string);
    function ObterMaiorImpacto(ADataInicio, ADataFim: TDate;
      const ATipoOcorrencia: string): TMaiorImpactoDTO;
  end;

implementation

constructor TRelatorioDepreciacaoService.Create(AConnection: TFDConnection);
begin
  FRepository := TRelatorioDepreciacaoRepository.Create(AConnection);
end;

destructor TRelatorioDepreciacaoService.Destroy;
begin
  FRepository.Free;
  inherited;
end;

function TRelatorioDepreciacaoService.ValidarDatas(ADataInicio, ADataFim: TDate;
  out Mensagem: string): Boolean;
begin
  Result := True;
  Mensagem := '';

  if (ADataInicio > 0) and (ADataFim > 0) and (ADataInicio > ADataFim) then
  begin
    Result := False;
    Mensagem := 'Data inicial deve ser menor que data final!';
    Exit;
  end;

  if ADataFim > Date then
  begin
    Result := False;
    Mensagem := 'Data final n�o pode ser futura!';
    Exit;
  end;
end;

function TRelatorioDepreciacaoService.GerarRelatorio(ADataInicio, ADataFim: TDate;
  const ATipoOcorrencia: string): TObjectList<TRelatorioDepreciacaoItemModel>;
begin
  Result := FRepository.ObterOcorrenciasDepreciacao(ADataInicio, ADataFim, ATipoOcorrencia);
end;

function TRelatorioDepreciacaoService.ObterMaiorImpacto(ADataInicio,
  ADataFim: TDate; const ATipoOcorrencia: string): TMaiorImpactoDTO;
begin
  Result := FRepository.ObterMaiorImpacto(ADataInicio, ADataFim, ATipoOcorrencia);
end;

function TRelatorioDepreciacaoService.ObterTiposOcorrencia: TStringList;
begin
  Result := FRepository.ObterTiposOcorrencia;
end;

procedure TRelatorioDepreciacaoService.PreencherQueryRelatorio(
  AQuery: TFDQuery; ADataInicio, ADataFim: TDate; const ATipoOcorrencia: string);
begin
  FRepository.PreencherQueryRelatorio(AQuery, ADataInicio, ADataFim, ATipoOcorrencia);
end;

end.
