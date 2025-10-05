unit PredioModel;

interface

type
TPredioConfig = class
  private
  FNome: String;
  FSituacao: String;
  FTelefone: String;
  FCep: String;
  FRua: String;
  FNumero: Integer;
  FBairro: String;
  FCidade: String;
  FEstado: String;
  FId: Integer;
  public
  property Nome: string read FNome write FNome;
  property Situacao: string read FSituacao write FSituacao;
  property Telefone: string read FTelefone write FTelefone;
  property Cep: string read FCep write FCep;
  property Rua: string read FRua write FRua;
  property Numero: integer read FNumero write FNumero;
  property Bairro: string read FBairro write FBairro;
  property Cidade: string read FCidade write FCidade;
  property Estado: string read FEstado write FEstado;
  property Id: integer read FId write FId;

end;

implementation

end.
