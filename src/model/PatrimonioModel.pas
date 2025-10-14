unit PatrimonioModel;

interface

Type
TPatrimonioConfig = class
  private
  FNome: String;
  FTipo: String;
  FSituacao: String;
  FModelo: String;
  FValorAquisicao: Double;
  FValorAtual: Double;
  FQuantidade: Integer;
  FDataAquisicao: TDate;
  FNumeroSerie: String;
  FIdSala: Integer;
  FId: Integer;

  public
  property Id: Integer read FId write FId;
  property Nome: String read FNome write FNome;
  property Tipo: String read FTipo write FTipo;
  property Situacao: String read FSituacao write FSituacao;
  property Modelo: String read FModelo write FModelo;
  property ValorAquisicao: Double read FValorAquisicao write FValorAquisicao;
  property ValorAtual: Double read FValorAtual write FValorAtual;
  property Quantidade: Integer read FQuantidade write FQuantidade;
  property DataAquisicao: TDate read FDataAquisicao write FDataAquisicao;
  property NumeroSerie: String read FNumeroSerie write FNumeroSerie;
  property IdSala: Integer read FIdSala write FIdSala;
end;

implementation

end.
