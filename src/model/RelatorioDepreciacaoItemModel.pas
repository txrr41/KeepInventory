unit RelatorioDepreciacaoItemModel;

interface

type
  TRelatorioDepreciacaoItemModel = class
  private
    FNomePatrimonio: string;
    FTipoPatrimonio: string;
    FModeloPatrimonio: string;
    FSituacaoPatrimonio: string;
    FTipoOcorrencia: string;
    FGravidade: string;
    FValorAntes: Currency;
    FValorDepois: Currency;
    FValorDepreciado: Currency;
    FPercentualDepreciacao: Currency;
    FDataOcorrencia: TDateTime;
    FNomeSala: string;
    FNomePredio: string;
  public
    property NomePatrimonio: string read FNomePatrimonio write FNomePatrimonio;
    property TipoPatrimonio: string read FTipoPatrimonio write FTipoPatrimonio;
    property ModeloPatrimonio: string read FModeloPatrimonio write FModeloPatrimonio;
    property SituacaoPatrimonio: string read FSituacaoPatrimonio write FSituacaoPatrimonio;
    property TipoOcorrencia: string read FTipoOcorrencia write FTipoOcorrencia;
    property Gravidade: string read FGravidade write FGravidade;
    property ValorAntes: Currency read FValorAntes write FValorAntes;
    property ValorDepois: Currency read FValorDepois write FValorDepois;
    property ValorDepreciado: Currency read FValorDepreciado write FValorDepreciado;
    property PercentualDepreciacao: Currency read FPercentualDepreciacao write FPercentualDepreciacao;
    property DataOcorrencia: TDateTime read FDataOcorrencia write FDataOcorrencia;
    property NomeSala: string read FNomeSala write FNomeSala;
    property NomePredio: string read FNomePredio write FNomePredio;
  end;

    TMaiorImpactoDTO = record
    Nome: string;
    TipoOcorrencia: string;
    Valor: Currency;
    Percentual: Currency;
  end;

implementation

end.

