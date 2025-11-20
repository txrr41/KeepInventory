unit RelatorioMovimentacaoModel;

interface

type
  TRelatorioMovimentacaoModel = class
  private
    FId: Integer;
    FDataMovimentacao: TDate;
    FUsuario: string;
    FPatrimonio: string;
    FTipoPatrimonio: string;
    FNumeroSerie: string;
    FSalaOrigem: string;
    FPredioOrigem: string;
    FSalaDestino: string;
    FPredioDestino: string;
    FQuantidade: Integer;
    FStatus: string;
    FObservacoes: string;

  public
    property Id: Integer read FId write FId;
    property DataMovimentacao: TDate read FDataMovimentacao write FDataMovimentacao;
    property Usuario: string read FUsuario write FUsuario;
    property Patrimonio: string read FPatrimonio write FPatrimonio;
    property TipoPatrimonio: string read FTipoPatrimonio write FTipoPatrimonio;
    property NumeroSerie: string read FNumeroSerie write FNumeroSerie;
    property SalaOrigem: string read FSalaOrigem write FSalaOrigem;
    property PredioOrigem: string read FPredioOrigem write FPredioOrigem;
    property SalaDestino: string read FSalaDestino write FSalaDestino;
    property PredioDestino: string read FPredioDestino write FPredioDestino;
    property Quantidade: Integer read FQuantidade write FQuantidade;
    property Status: string read FStatus write FStatus;
    property Observacoes: string read FObservacoes write FObservacoes;
  end;

  TRelatorioMovimentacaoEstatisticasModel = class
  private
    FTotalMovimentacoes: Integer;
    FItensDistintos: Integer;
    FLocaisDistintos: Integer;
    FTotalQuantidade: Integer;
    FItemMaisMovimentado: string;
    FLocalMaisRecebeu: string;

  public
    property TotalMovimentacoes: Integer read FTotalMovimentacoes write FTotalMovimentacoes;
    property ItensDistintos: Integer read FItensDistintos write FItensDistintos;
    property LocaisDistintos: Integer read FLocaisDistintos write FLocaisDistintos;
    property TotalQuantidade: Integer read FTotalQuantidade write FTotalQuantidade;
    property ItemMaisMovimentado: string read FItemMaisMovimentado write FItemMaisMovimentado;
    property LocalMaisRecebeu: string read FLocalMaisRecebeu write FLocalMaisRecebeu;
  end;

implementation

end.