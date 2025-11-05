unit UsuarioDTO;

interface

Type
  TUsuarioDTO = record
    FId: Integer;
    FNome: String;
    FCpf: String;
    FRg: String;
    FTelefone: String;
    FDataNascimento: TDate;
    FFuncao: String;
    FSenha: String;

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
  end;

implementation

end.
