unit AnaliseOcorrenciaRepository;

interface

uses
  OcorrenciaModel, OcorrenciaDTO, DB, FireDAC.Comp.Client, Data.DB,
  System.SysUtils, System.Classes, Dialogs;

type
  TAnaliseOcorrenciaRepository = class
  public
    function ListarOcorrenciasPendentes: TDataSet;
    function PesquisarOcorrencia(const aSearch: String): TDataSet;
    procedure AvaliarOcorrencia(AAvaliacaoDTO: TAvaliacaoOcorrenciaDTO);
    function ObterDetalhesOcorrencia(AIdOcorrencia: Integer): TOcorrenciaModel;
    function ObterValorPatrimonio(AIdPatrimonio: Integer): Currency;
  end;

var
  FAnaliseOcorrenciaRepository: TAnaliseOcorrenciaRepository;

implementation

{ TAnaliseOcorrenciaRepository }

procedure TAnaliseOcorrenciaRepository.AvaliarOcorrencia(
  AAvaliacaoDTO: TAvaliacaoOcorrenciaDTO);
var
  Q: TFDQuery;
  ValorAtual, NovoValor: Currency;
  StatusPatrimonio: String;
  IdPatrimonio: Integer;
begin
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := DataModule2.FDConnection;

    // Busca o valor atual do patrim�nio, ID e tipo de ocorrência
    Q.SQL.Text :=
      'SELECT p.valor_atual, o.fk_id_patrimonios, o.tipo_ocorrencia ' +
      'FROM ocorrencias o ' +
      'INNER JOIN patrimonios p ON p.id = o.fk_id_patrimonios ' +
      'WHERE o.id = :id_ocorrencia';
    Q.ParamByName('id_ocorrencia').AsInteger := AAvaliacaoDTO.FIdOcorrencia;
    Q.Open;

    ValorAtual := Q.FieldByName('valor_atual').AsCurrency;
    IdPatrimonio := Q.FieldByName('fk_id_patrimonios').AsInteger;
    var TipoOcorrencia := Q.FieldByName('tipo_ocorrencia').AsString.ToUpper;
    NovoValor := ValorAtual - (ValorAtual * (AAvaliacaoDTO.FPercentualDepreciacao / 100));

    Q.Close;

    // Define o status do patrim�nio
    // Se for perda ou furto, inativa o patrimônio
    if (TipoOcorrencia = 'PERDA') or (TipoOcorrencia = 'FURTO') then
      StatusPatrimonio := 'inativo'
    else if AAvaliacaoDTO.FRequerManutencao then
      StatusPatrimonio := 'em_manutencao'
    else
      StatusPatrimonio := 'ativo';

    // Atualiza a ocorr�ncia com a avalia��o
    Q.SQL.Text :=
      'UPDATE ocorrencias SET ' +
      'fk_id_gestor = :id_gestor, ' +
      'gravidade = :gravidade, ' +
      'percentual_depreciacao = :percentual_depreciacao, ' +
      'valor_antes = :valor_antes, ' +
      'valor_depois = :valor_depois, ' +
      'responsabilidade = :responsabilidade, ' +
      'requer_manutencao = :requer_manutencao, ' +
      'custo_estimado_reparo = :custo_estimado_reparo, ' +
      'observacoes_gestor = :observacoes_gestor, ' +
      'status = :status, ' +
      'data_analise = CURRENT_TIMESTAMP ' +
      'WHERE id = :id';

    Q.ParamByName('id_gestor').AsInteger := AAvaliacaoDTO.FIdGestor;
    Q.ParamByName('gravidade').AsString := AAvaliacaoDTO.FGravidade;
    Q.ParamByName('percentual_depreciacao').AsCurrency := AAvaliacaoDTO.FPercentualDepreciacao;
    Q.ParamByName('valor_antes').AsCurrency := ValorAtual;
    Q.ParamByName('valor_depois').AsCurrency := NovoValor;
    Q.ParamByName('responsabilidade').AsString := AAvaliacaoDTO.FResponsabilidade;
    Q.ParamByName('requer_manutencao').AsBoolean := AAvaliacaoDTO.FRequerManutencao;
    Q.ParamByName('custo_estimado_reparo').AsCurrency := AAvaliacaoDTO.FCustoEstimadoReparo;
    Q.ParamByName('observacoes_gestor').AsString := AAvaliacaoDTO.FObservacoesGestor;
    Q.ParamByName('status').AsString := 'analisada';
    Q.ParamByName('id').AsInteger := AAvaliacaoDTO.FIdOcorrencia;

    Q.ExecSQL;
    Q.Close;

    // Atualiza o valor do patrim�nio e seu status
    // Se for inativação por perda/furto, também define ativo = false
    if (TipoOcorrencia = 'PERDA') or (TipoOcorrencia = 'FURTO') then
    begin
      Q.SQL.Text :=
        'UPDATE patrimonios SET ' +
        'valor_atual = :valor_atual, ' +
        'status = :status, ' +
        'ativo = false ' +
        'WHERE id = :id_patrimonio';
    end
    else
    begin
      Q.SQL.Text :=
        'UPDATE patrimonios SET ' +
        'valor_atual = :valor_atual, ' +
        'status = :status ' +
        'WHERE id = :id_patrimonio';
    end;

    Q.ParamByName('valor_atual').AsCurrency := NovoValor;
    Q.ParamByName('status').AsString := StatusPatrimonio;
    Q.ParamByName('id_patrimonio').AsInteger := IdPatrimonio;

    Q.ExecSQL;

  finally
    Q.Free;
  end;
end;

function TAnaliseOcorrenciaRepository.ListarOcorrenciasPendentes: TDataSet;
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  Query.Connection := DataModule2.FDConnection;

  Query.SQL.Text :=
    'SELECT ' +
    '  o.id, ' +
    '  o.data_ocorrencia, ' +
    '  p.nome AS patrimonio, ' +
    '  o.tipo_ocorrencia, ' +
    '  u.nome AS usuario_relator, ' +
    '  o.descricao, ' +
    '  o.status, ' +
    '  o.fk_id_patrimonios ' +
    'FROM ocorrencias o ' +
    'INNER JOIN patrimonios p ON o.fk_id_patrimonios = p.id ' +
    'INNER JOIN usuarios u ON o.fk_id_usuario_relator = u.id ' +
    'WHERE o.status = ''PENDENTE'' ' +
    'ORDER BY o.data_ocorrencia DESC';

  Query.Open;
  Result := Query;
end;

function TAnaliseOcorrenciaRepository.ObterDetalhesOcorrencia(
  AIdOcorrencia: Integer): TOcorrenciaModel;
var
  Q: TFDQuery;
  Ocorrencia: TOcorrenciaModel;
begin
  Q := TFDQuery.Create(nil);
  Ocorrencia := TOcorrenciaModel.Create;
  try
    Q.Connection := DataModule2.FDConnection;
    Q.SQL.Text :=
      'SELECT o.*, p.nome AS patrimonio_nome, u.nome AS relator_nome ' +
      'FROM ocorrencias o ' +
      'INNER JOIN patrimonios p ON o.fk_id_patrimonios = p.id ' +
      'INNER JOIN usuarios u ON o.fk_id_usuario_relator = u.id ' +
      'WHERE o.id = :id';

    Q.ParamByName('id').AsInteger := AIdOcorrencia;
    Q.Open;

    if not Q.IsEmpty then
    begin
      Ocorrencia.Id := Q.FieldByName('id').AsInteger;
      Ocorrencia.IdPatrimonio := Q.FieldByName('fk_id_patrimonios').AsInteger;
      Ocorrencia.IdUsuarioRelator := Q.FieldByName('fk_id_usuario_relator').AsInteger;
      Ocorrencia.TipoOcorrencia := Q.FieldByName('tipo_ocorrencia').AsString;
      Ocorrencia.Descricao := Q.FieldByName('descricao').AsString;
      Ocorrencia.DataOcorrencia := Q.FieldByName('data_ocorrencia').AsDateTime;
      Ocorrencia.Status := Q.FieldByName('status').AsString;

      if not Q.FieldByName('foto_anexo').IsNull then
        Ocorrencia.FotoAnexo := Q.FieldByName('foto_anexo').AsString;
    end;

    Result := Ocorrencia;
  finally
    Q.Free;
  end;
end;

function TAnaliseOcorrenciaRepository.ObterValorPatrimonio(
  AIdPatrimonio: Integer): Currency;
var
  Q: TFDQuery;
begin
  Result := 0;
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := DataModule2.FDConnection;
    Q.SQL.Text := 'SELECT valor_atual FROM patrimonios WHERE id = :id';
    Q.ParamByName('id').AsInteger := AIdPatrimonio;
    Q.Open;

    if not Q.IsEmpty then
    begin
      Result := Q.FieldByName('valor_atual').AsCurrency;
    end

  finally
    Q.Free;
  end;
end;

function TAnaliseOcorrenciaRepository.PesquisarOcorrencia(
  const aSearch: String): TDataSet;
var
  Q: TFDQuery;
begin
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := DataModule2.FDConnection;
    Q.SQL.Text :=
      'SELECT ' +
      '  o.id, ' +
      '  o.data_ocorrencia, ' +
      '  p.nome AS patrimonio, ' +
      '  o.tipo_ocorrencia, ' +
      '  u.nome AS usuario_relator, ' +
      '  o.descricao, ' +
      '  o.status, ' +
      '  o.fk_id_patrimonios ' +
      'FROM ocorrencias o ' +
      'INNER JOIN patrimonios p ON o.fk_id_patrimonios = p.id ' +
      'INNER JOIN usuarios u ON o.fk_id_usuario_relator = u.id ' +
      'WHERE o.status = ''pendente'' ' +
      '  AND (p.nome ILIKE :search ' +
      '       OR u.nome ILIKE :search ' +
      '       OR o.tipo_ocorrencia ILIKE :search ' +
      '       OR o.descricao ILIKE :search) ' +
      'ORDER BY o.data_ocorrencia DESC';

    Q.ParamByName('search').AsString := '%' + Trim(aSearch) + '%';
    Q.Open;
    Result := Q;
  except
    Q.Free;
    raise;
  end;
end;

end.
