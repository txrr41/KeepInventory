unit UsuarioModel;

interface

Type
  TUsuarioModel = class
  private
    FId: Integer;
    FNome: String;
    FCpf: String;
    FRg: String;
    FTelefone: String;
    FDataNascimento: TDate;
    FFuncao: String;
    FSenhaHash: String;
    FAtivo: Boolean;

    // Permissões - Cadastros
    FPermCadastros: Boolean;
    FPermCadEmpresa: Boolean;
    FPermCadPredio: Boolean;
    FPermCadSala: Boolean;
    FPermCadPatrimonio: Boolean;

    // Permissões - Movimentações
    FPermMovimentacoes: Boolean;
    FPermMovAnalisar: Boolean;
    FPermMovAdicionar: Boolean;
    FPermMovExcluir: Boolean;

    // Permissões - Ocorrências
    FPermOcorrencias: Boolean;
    FPermOcorAnalisar: Boolean;
    FPermOcorAdicionar: Boolean;
    FPermOcorExcluir: Boolean;

    // Permissões - Usuários
    FPermUsuarios: Boolean;
    FPermUserCadastrar: Boolean;
    FPermUserPermissao: Boolean;

  public
    property Id: Integer read FId write FId;
    property Nome: String read FNome write FNome;
    property Cpf: String read FCpf write FCpf;
    property Rg: String read FRg write FRg;
    property Telefone: String read FTelefone write FTelefone;
    property DataNascimento: TDate read FDataNascimento write FDataNascimento;
    property Funcao: String read FFuncao write FFuncao;
    property SenhaHash: String read FSenhaHash write FSenhaHash;
    property Ativo: Boolean read FAtivo write FAtivo;

    // Permissões
    property PermCadastros: Boolean read FPermCadastros write FPermCadastros;
    property PermCadEmpresa: Boolean read FPermCadEmpresa write FPermCadEmpresa;
    property PermCadPredio: Boolean read FPermCadPredio write FPermCadPredio;
    property PermCadSala: Boolean read FPermCadSala write FPermCadSala;
    property PermCadPatrimonio: Boolean read FPermCadPatrimonio write FPermCadPatrimonio;

    property PermMovimentacoes: Boolean read FPermMovimentacoes write FPermMovimentacoes;
    property PermMovAnalisar: Boolean read FPermMovAnalisar write FPermMovAnalisar;
    property PermMovAdicionar: Boolean read FPermMovAdicionar write FPermMovAdicionar;
    property PermMovExcluir: Boolean read FPermMovExcluir write FPermMovExcluir;

    property PermOcorrencias: Boolean read FPermOcorrencias write FPermOcorrencias;
    property PermOcorAnalisar: Boolean read FPermOcorAnalisar write FPermOcorAnalisar;
    property PermOcorAdicionar: Boolean read FPermOcorAdicionar write FPermOcorAdicionar;
    property PermOcorExcluir: Boolean read FPermOcorExcluir write FPermOcorExcluir;

    property PermUsuarios: Boolean read FPermUsuarios write FPermUsuarios;
    property PermUserCadastrar: Boolean read FPermUserCadastrar write FPermUserCadastrar;
    property PermUserPermissao: Boolean read FPermUserPermissao write FPermUserPermissao;
  end;

  var UserM: TUsuarioModel;

implementation

end.
