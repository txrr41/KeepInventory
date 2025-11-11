unit OcorrenciaRepository;

interface

uses
  System.SysUtils, FireDAC.Comp.Client, FireDAC.Stan.Param, Data.DB,
  OcorrenciaModel, Vcl.StdCtrls, DB, dialogs;

type
  TOcorrenciaRepository = class
  public
    function Inserir(Ocorrencia: TOcorrenciaModel): Boolean;
    function Atualizar(Ocorrencia: TOcorrenciaModel): Boolean;
    function Excluir(Id: Integer): Boolean;
    function BuscarPorId(Id: Integer): TOcorrenciaModel;
    function ListarTodas: TFDQuery;
    function ListarPorStatus(Status: String): TFDQuery;
    function ListarPorPatrimonio(IdPatrimonio: Integer): TFDQuery;
    function ListarPendentes: TFDQuery;
    function AvaliarOcorrencia(IdOcorrencia, IdGestor: Integer;
      Gravidade, Responsabilidade: String; PercentualDepreciacao: Currency;
      RequerManutencao: Boolean; CustoEstimado: Currency;
      Observacoes: String): Boolean;
    function ObterValorPatrimonio(IdPatrimonio: Integer): Currency;
    function AtualizarValorPatrimonio(IdPatrimonio: Integer; NovoValor: Currency): Boolean;
    procedure PopularComboBoxPatrimonios(ComboBox: TComboBox);
  end;

var
  FOcorrenciaRepository: TOcorrenciaRepository;

implementation


function TOcorrenciaRepository.Inserir(Ocorrencia: TOcorrenciaModel): Boolean;
var
  Query: TFDQuery;
begin

ShowMessage('O Id é' + IntToStr(Ocorrencia.IdUsuarioRelator));
  Result := False;
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := DataModule2.FDConnection;

    Query.SQL.Clear;
    Query.SQL.Add('INSERT INTO ocorrencias (');
    Query.SQL.Add('  fk_id_patrimonios, fk_id_usuario_relator, tipo_ocorrencia,');
    Query.SQL.Add('  descricao, data_ocorrencia, status, foto_anexo');
    Query.SQL.Add(') VALUES (');
    Query.SQL.Add('  :id_patrimonio, :id_usuario, :tipo, :descricao,');
    Query.SQL.Add('  :data_ocorrencia, :status, :foto');
    Query.SQL.Add(')');

    Query.ParamByName('id_patrimonio').AsInteger := Ocorrencia.IdPatrimonio;
    Query.ParamByName('id_usuario').AsInteger := Ocorrencia.IdUsuarioRelator;
    Query.ParamByName('tipo').AsString := Ocorrencia.TipoOcorrencia;
    Query.ParamByName('descricao').AsString := Ocorrencia.Descricao;
    Query.ParamByName('data_ocorrencia').AsDateTime := Ocorrencia.DataOcorrencia;
    Query.ParamByName('status').AsString := 'PENDENTE';
    Query.ParamByName('foto').AsString := Ocorrencia.FotoAnexo;

    Query.ExecSQL;
    Result := True;
  finally
    Query.Free;
  end;
end;

function TOcorrenciaRepository.Atualizar(Ocorrencia: TOcorrenciaModel): Boolean;
var
  Query: TFDQuery;
begin
  Result := False;
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := DataModule2.FDConnection;

    Query.SQL.Clear;
    Query.SQL.Add('UPDATE ocorrencias SET');
    Query.SQL.Add('  fk_id_patrimonios = :id_patrimonio,');
    Query.SQL.Add('  tipo_ocorrencia = :tipo,');
    Query.SQL.Add('  descricao = :descricao,');
    Query.SQL.Add('  foto_anexo = :foto');
    Query.SQL.Add('WHERE id = :id');

    Query.ParamByName('id').AsInteger := Ocorrencia.Id;
    Query.ParamByName('id_patrimonio').AsInteger := Ocorrencia.IdPatrimonio;
    Query.ParamByName('tipo').AsString := Ocorrencia.TipoOcorrencia;
    Query.ParamByName('descricao').AsString := Ocorrencia.Descricao;
    Query.ParamByName('foto').AsString := Ocorrencia.FotoAnexo;

    Query.ExecSQL;
    Result := True;
  finally
    Query.Free;
  end;
end;

function TOcorrenciaRepository.Excluir(Id: Integer): Boolean;
var
  Query: TFDQuery;
begin
  Result := False;
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := DataModule2.FDConnection;

    Query.SQL.Clear;
    Query.SQL.Add('DELETE FROM ocorrencias WHERE id = :id');
    Query.ParamByName('id').AsInteger := Id;

    Query.ExecSQL;
    Result := True;
  finally
    Query.Free;
  end;
end;

function TOcorrenciaRepository.BuscarPorId(Id: Integer): TOcorrenciaModel;
var
  Query: TFDQuery;
begin
  Result := TOcorrenciaModel.Create;
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := DataModule2.FDConnection;

    Query.SQL.Clear;
    Query.SQL.Add('SELECT * FROM ocorrencias WHERE id = :id');
    Query.ParamByName('id').AsInteger := Id;
    Query.Open;

    if not Query.IsEmpty then
    begin
      Result.Id := Query.FieldByName('id').AsInteger;
      Result.IdPatrimonio := Query.FieldByName('fk_id_patrimonios').AsInteger;
      Result.IdUsuarioRelator := Query.FieldByName('fk_id_usuario_relator').AsInteger;

      if not Query.FieldByName('fk_id_gestor').IsNull then
        Result.IdGestor := Query.FieldByName('fk_id_gestor').AsInteger;

      Result.TipoOcorrencia := Query.FieldByName('tipo_ocorrencia').AsString;
      Result.Descricao := Query.FieldByName('descricao').AsString;
      Result.DataOcorrencia := Query.FieldByName('data_ocorrencia').AsDateTime;
      Result.Status := Query.FieldByName('status').AsString;

      if not Query.FieldByName('gravidade').IsNull then
        Result.Gravidade := Query.FieldByName('gravidade').AsString;

      if not Query.FieldByName('percentual_depreciacao').IsNull then
        Result.PercentualDepreciacao := Query.FieldByName('percentual_depreciacao').AsCurrency;

      if not Query.FieldByName('valor_antes').IsNull then
        Result.ValorAntes := Query.FieldByName('valor_antes').AsCurrency;

      if not Query.FieldByName('valor_depois').IsNull then
        Result.ValorDepois := Query.FieldByName('valor_depois').AsCurrency;

      if not Query.FieldByName('responsabilidade').IsNull then
        Result.Responsabilidade := Query.FieldByName('responsabilidade').AsString;

      Result.RequerManutencao := Query.FieldByName('requer_manutencao').AsBoolean;

      if not Query.FieldByName('custo_estimado_reparo').IsNull then
        Result.CustoEstimadoReparo := Query.FieldByName('custo_estimado_reparo').AsCurrency;

      if not Query.FieldByName('observacoes_gestor').IsNull then
        Result.ObservacoesGestor := Query.FieldByName('observacoes_gestor').AsString;

      if not Query.FieldByName('foto_anexo').IsNull then
        Result.FotoAnexo := Query.FieldByName('foto_anexo').AsString;
    end;
  finally
    Query.Free;
  end;
end;

function TOcorrenciaRepository.ListarTodas: TFDQuery;
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  Query.Connection := DataModule2.FDConnection;

  Query.SQL.Clear;
  Query.SQL.Add('SELECT ');
  Query.SQL.Add('  o.id,');
  Query.SQL.Add('  o.fk_id_patrimonios,');
  Query.SQL.Add('  p.nome AS item,');
  Query.SQL.Add('  o.fk_id_usuario_relator,');
  Query.SQL.Add('  u.nome AS usuario,');
  Query.SQL.Add('  o.fk_id_gestor,');
  Query.SQL.Add('  o.tipo_ocorrencia,');
  Query.SQL.Add('  o.descricao,');
  Query.SQL.Add('  o.data_ocorrencia,');
  Query.SQL.Add('  o.data_analise,');
  Query.SQL.Add('  o.status,');
  Query.SQL.Add('  o.gravidade,');
  Query.SQL.Add('  o.percentual_depreciacao,');
  Query.SQL.Add('  o.valor_antes,');
  Query.SQL.Add('  o.valor_depois,');
  Query.SQL.Add('  o.responsabilidade,');
  Query.SQL.Add('  o.requer_manutencao,');
  Query.SQL.Add('  o.custo_estimado_reparo,');
  Query.SQL.Add('  o.observacoes_gestor,');
  Query.SQL.Add('  o.foto_anexo');
  Query.SQL.Add('FROM ocorrencias o');
  Query.SQL.Add('INNER JOIN patrimonios p ON o.fk_id_patrimonios = p.id');
  Query.SQL.Add('INNER JOIN usuarios u ON o.fk_id_usuario_relator = u.id');
  Query.SQL.Add('ORDER BY o.data_ocorrencia DESC');

  Query.Open;
  Result := Query;
end;

function TOcorrenciaRepository.ListarPorStatus(Status: String): TFDQuery;
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  Query.Connection := DataModule2.FDConnection;

  Query.SQL.Clear;
  Query.SQL.Add('SELECT ');
  Query.SQL.Add('  o.id,');
  Query.SQL.Add('  o.fk_id_patrimonios,');
  Query.SQL.Add('  p.nome AS item,');
  Query.SQL.Add('  o.fk_id_usuario_relator,');
  Query.SQL.Add('  u.nome AS usuario_relator_nome,');
  Query.SQL.Add('  o.tipo_ocorrencia,');
  Query.SQL.Add('  o.descricao,');
  Query.SQL.Add('  o.data_ocorrencia,');
  Query.SQL.Add('  o.status,');
  Query.SQL.Add('  o.foto_anexo');
  Query.SQL.Add('FROM ocorrencias o');
  Query.SQL.Add('INNER JOIN patrimonios p ON o.fk_id_patrimonios = p.id');
  Query.SQL.Add('INNER JOIN usuarios u ON o.fk_id_usuario_relator = u.id');
  Query.SQL.Add('WHERE o.status = :status');
  Query.SQL.Add('ORDER BY o.data_ocorrencia DESC');

  Query.ParamByName('status').AsString := Status;
  Query.Open;

  Result := Query;
end;

function TOcorrenciaRepository.ListarPorPatrimonio(IdPatrimonio: Integer): TFDQuery;
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  Query.Connection := DataModule2.FDConnection;

  Query.SQL.Clear;
  Query.SQL.Add('SELECT * FROM ocorrencias');
  Query.SQL.Add('WHERE fk_id_patrimonios = :id_patrimonio');
  Query.SQL.Add('ORDER BY data_ocorrencia DESC');

  Query.ParamByName('id_patrimonio').AsInteger := IdPatrimonio;
  Query.Open;

  Result := Query;
end;

function TOcorrenciaRepository.ListarPendentes: TFDQuery;
 var Query: TFDQuery;
 begin Query := TFDQuery.Create(nil);
 Query.Connection := DataModule2.FDConnection;
 Query.SQL.Clear; Query.SQL.Add('SELECT ');
 Query.SQL.Add(' o.id,');
 Query.SQL.Add(' o.fk_id_patrimonios,');
 Query.SQL.Add(' p.nome AS patrimonio,');
 Query.SQL.Add(' o.fk_id_usuario_relator,');
  Query.SQL.Add(' u.nome AS usuario,');
   Query.SQL.Add(' o.tipo_ocorrencia,');
    Query.SQL.Add(' o.descricao,');
     Query.SQL.Add(' o.data_ocorrencia,');
      Query.SQL.Add(' o.status,');
       Query.SQL.Add(' o.foto_anexo');
       Query.SQL.Add('FROM ocorrencias o');
        Query.SQL.Add('INNER JOIN patrimonios p ON o.fk_id_patrimonios = p.id');
         Query.SQL.Add('INNER JOIN usuarios u ON o.fk_id_usuario_relator = u.id');
          Query.SQL.Add('WHERE o.status = ''PENDENTE''');
          Query.SQL.Add('ORDER BY o.data_ocorrencia ASC');
          Query.Open;
          Result := Query;
end;

function TOcorrenciaRepository.AvaliarOcorrencia(IdOcorrencia, IdGestor: Integer;
  Gravidade, Responsabilidade: String; PercentualDepreciacao: Currency;
  RequerManutencao: Boolean; CustoEstimado: Currency; Observacoes: String): Boolean;
var
  Query: TFDQuery;
  ValorAntes, ValorDepois: Currency;
  IdPatrimonio: Integer;
begin
  Result := False;
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := DataModule2.FDConnection;

    // Busca o ID do patrimônio
    Query.SQL.Clear;
    Query.SQL.Add('SELECT fk_id_patrimonios FROM ocorrencias WHERE id = :id');
    Query.ParamByName('id').AsInteger := IdOcorrencia;
    Query.Open;

    if Query.IsEmpty then
      Exit;

    IdPatrimonio := Query.FieldByName('fk_id_patrimonios').AsInteger;
    Query.Close;

    // Busca valor atual do patrimônio
    ValorAntes := ObterValorPatrimonio(IdPatrimonio);
    ValorDepois := ValorAntes - (ValorAntes * (PercentualDepreciacao / 100));

    // Atualiza a ocorrência
    Query.SQL.Clear;
    Query.SQL.Add('UPDATE ocorrencias SET');
    Query.SQL.Add('  fk_id_gestor = :id_gestor,');
    Query.SQL.Add('  gravidade = :gravidade,');
    Query.SQL.Add('  percentual_depreciacao = :percentual,');
    Query.SQL.Add('  valor_antes = :valor_antes,');
    Query.SQL.Add('  valor_depois = :valor_depois,');
    Query.SQL.Add('  responsabilidade = :responsabilidade,');
    Query.SQL.Add('  requer_manutencao = :requer_manutencao,');
    Query.SQL.Add('  custo_estimado_reparo = :custo_estimado,');
    Query.SQL.Add('  observacoes_gestor = :observacoes,');
    Query.SQL.Add('  data_analise = NOW(),');
    Query.SQL.Add('  status = ''analisada''');
    Query.SQL.Add('WHERE id = :id');

    Query.ParamByName('id').AsInteger := IdOcorrencia;
    Query.ParamByName('id_gestor').AsInteger := IdGestor;
    Query.ParamByName('gravidade').AsString := Gravidade;
    Query.ParamByName('percentual').AsCurrency := PercentualDepreciacao;
    Query.ParamByName('valor_antes').AsCurrency := ValorAntes;
    Query.ParamByName('valor_depois').AsCurrency := ValorDepois;
    Query.ParamByName('responsabilidade').AsString := Responsabilidade;
    Query.ParamByName('requer_manutencao').AsBoolean := RequerManutencao;
    Query.ParamByName('custo_estimado').AsCurrency := CustoEstimado;
    Query.ParamByName('observacoes').AsString := Observacoes;

    Query.ExecSQL;

    // Atualiza o valor do patrimônio
    if PercentualDepreciacao > 0 then
      AtualizarValorPatrimonio(IdPatrimonio, ValorDepois);

    Result := True;
  finally
    Query.Free;
  end;
end;

function TOcorrenciaRepository.ObterValorPatrimonio(IdPatrimonio: Integer): Currency;
var
  Query: TFDQuery;
begin
  Result := 0;
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := DataModule2.FDConnection;

    Query.SQL.Clear;
    Query.SQL.Add('SELECT valor_atual FROM patrimonios WHERE id = :id');
    Query.ParamByName('id').AsInteger := IdPatrimonio;
    Query.Open;

    if not Query.IsEmpty then
      Result := Query.FieldByName('valor_atual').AsCurrency;
  finally
    Query.Free;
  end;
end;

function TOcorrenciaRepository.AtualizarValorPatrimonio(IdPatrimonio: Integer; NovoValor: Currency): Boolean;
var
  Query: TFDQuery;
begin
  Result := False;
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := DataModule2.FDConnection;

    Query.SQL.Clear;
    Query.SQL.Add('UPDATE patrimonios SET valor_atual = :valor WHERE id = :id');
    Query.ParamByName('id').AsInteger := IdPatrimonio;
    Query.ParamByName('valor').AsCurrency := NovoValor;

    Query.ExecSQL;
    Result := True;
  finally
    Query.Free;
  end;
end;

procedure TOcorrenciaRepository.PopularComboBoxPatrimonios(ComboBox: TComboBox);
var
  Query: TFDQuery;
begin
  ComboBox.Clear;
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := DataModule2.FDConnection;

    Query.SQL.Clear;
    Query.SQL.Add('SELECT id, nome FROM patrimonios WHERE ativo = true ORDER BY nome');
    Query.Open;

    while not Query.Eof do
    begin
      ComboBox.Items.AddObject(
        Query.FieldByName('nome').AsString,
        TObject(Query.FieldByName('id').AsInteger)
      );
      Query.Next;
    end;
  finally
    Query.Free;
  end;
end;

end.
