unit PatrimonioDTO;

interface

Type
 TPatrimonioDTO = record
  FNome: String;
  FTipo: String;
  FSituacao: String;
  FModelo: String;
  FValorAquisicao: Currency;
  FValorAtual: Currency;
  FQuantidade: Integer;
  FDataAquisicao: TDate;
  FNumeroSerie: String;
  FIdSala: Integer;
  FId: Integer;
end;

implementation

end.
