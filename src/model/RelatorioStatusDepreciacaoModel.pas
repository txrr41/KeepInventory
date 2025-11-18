unit RelatorioStatusDepreciacaoModel;

interface

type
  TRelatorioStatusDepreciacaoModel = class
  private
    FId: Integer;
    FNome: string;
    FModelo: string;
    FTipo: string;
    FSituacao: string;
    FNumeroSerie: string;
    FValorAquisicao: Currency;
    FValorAtual: Currency;
    FDataAquisicao: TDateTime;
    FPercentualDepreciacao: Double;
    FValorDepreciado: Currency;
    FIdadeMeses: Integer;
    FTaxaDepreciacaoMensal: Double;
    FMesesRestantes: Integer;
    FDataPrevista100: TDateTime;
    FStatusDepreciacao: string;
    FPrioridadeOrdem: Integer;
    FCorStatus: string;
  public
    property Id: Integer read FId write FId;
    property Nome: string read FNome write FNome;
    property Modelo: string read FModelo write FModelo;
    property Tipo: string read FTipo write FTipo;
    property Situacao: string read FSituacao write FSituacao;
    property NumeroSerie: string read FNumeroSerie write FNumeroSerie;
    property ValorAquisicao: Currency read FValorAquisicao write FValorAquisicao;
    property ValorAtual: Currency read FValorAtual write FValorAtual;
    property DataAquisicao: TDateTime read FDataAquisicao write FDataAquisicao;
    property PercentualDepreciacao: Double read FPercentualDepreciacao write FPercentualDepreciacao;
    property ValorDepreciado: Currency read FValorDepreciado write FValorDepreciado;
    property IdadeMeses: Integer read FIdadeMeses write FIdadeMeses;
    property TaxaDepreciacaoMensal: Double read FTaxaDepreciacaoMensal write FTaxaDepreciacaoMensal;
    property MesesRestantes: Integer read FMesesRestantes write FMesesRestantes;
    property DataPrevista100: TDateTime read FDataPrevista100 write FDataPrevista100;
    property StatusDepreciacao: string read FStatusDepreciacao write FStatusDepreciacao;
    property PrioridadeOrdem: Integer read FPrioridadeOrdem write FPrioridadeOrdem;
    property CorStatus: string read FCorStatus write FCorStatus;
  end;

  // DTO para resumo do dashboard
  TResumoDashboardDepreciacaoDTO = record
    TotalPatrimonios: Integer;
    MediaDepreciacao: Double;
    TotalDepreciado: Currency;
    TotalValorAtual: Currency;
    ContagemMonitorar: Integer;
    ContagemPlanejamento: Integer;
    ContagemAtencao: Integer;
    ContagemUrgente: Integer;
    ContagemDepreciado: Integer;
  end;

implementation

end.