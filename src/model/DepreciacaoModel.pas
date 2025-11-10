unit DepreciacaoModel;

interface

type
  TDepreciacaoTipoModel = class
  private
    FTipoOcorrencia: string;
    FValorDepreciado: Currency;
    FQuantidadeOcorrencias: Integer;
    FPercentualTotal: Double;
  public
    property TipoOcorrencia: string read FTipoOcorrencia write FTipoOcorrencia;
    property ValorDepreciado: Currency read FValorDepreciado write FValorDepreciado;
    property QuantidadeOcorrencias: Integer read FQuantidadeOcorrencias write FQuantidadeOcorrencias;
    property PercentualTotal: Double read FPercentualTotal write FPercentualTotal;
  end;

  TResumoDepreciacaoModel = class
  private
    FValorOriginalTotal: Currency;
    FValorAtualTotal: Currency;
    FValorDepreciadoTotal: Currency;
    FTaxaDepreciacaoMedia: Double;
  public
    property ValorOriginalTotal: Currency read FValorOriginalTotal write FValorOriginalTotal;
    property ValorAtualTotal: Currency read FValorAtualTotal write FValorAtualTotal;
    property ValorDepreciadoTotal: Currency read FValorDepreciadoTotal write FValorDepreciadoTotal;
    property TaxaDepreciacaoMedia: Double read FTaxaDepreciacaoMedia write FTaxaDepreciacaoMedia;
  end;

implementation

end.
