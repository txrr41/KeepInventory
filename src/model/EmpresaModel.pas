unit EmpresaModel;

interface

type
TEmpresaConfig = class
  private
  FNomeFan: String;
  FRazao: String;
  FCnpj: String;
  FTelefone: String;
  FCep: String;
  FRua: String;
  FNumero: Integer;
  FBairro: String;
  FCidade: String;
  FEstado: String;
  public
  property NomeFan: string read FNomeFan write FNomeFan;
  property Razao: string read FRazao write FRazao;
  property Cnpj: string read FCnpj write FCnpj;
  property Telefone: string read FTelefone write FTelefone;
  property Cep: string read FCep write FCep;
  property Rua: string read FRua write FRua;
  property Numero: integer read FNumero write FNumero;
  property Bairro: string read FBairro write FBairro;
  property Cidade: string read FCidade write FCidade;
  property Estado: string read FEstado write FEstado;

end;

implementation

end.
