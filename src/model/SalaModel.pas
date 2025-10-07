unit SalaModel;

interface

Type
TSalaConfig = class
  private
  FNome: String;
  FPredio: String;
  FSituacao: String;
  FObservacao: String;
  FTipo: String;
  FId: Integer;
  public
  property Predio: string read FPredio write FPredio;
  property Nome: string read FNome write FNome;
  property Situacao: string read FSituacao write FSituacao;
  property Observacao: string read FObservacao write FObservacao;
  property Tipo: string read FTipo write FTipo;
  property Id: integer read FId write FId;


end;



implementation

end.
