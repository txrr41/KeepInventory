unit AnaliseOcorrenciaView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.WinXCtrls, Vcl.Buttons, Vcl.NumberBox, Vcl.Mask,
  AnaliseOcorrenciaController, OcorrenciaDTO, OcorrenciaModel, FireDAC.Comp.Client,
  Vcl.Imaging.pngimage;

type
  TFormAnaliseOcorrencia = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Label2: TLabel;
    Label4: TLabel;
    Panel4: TPanel;
    CbGravidadeA: TComboBox;
    Panel5: TPanel;
    Label5: TLabel;
    Panel6: TPanel;
    Label6: TLabel;
    EdtValorAtualA: TMaskEdit;
    Label3: TLabel;
    EdtDepreciacao: TNumberBox;
    Label8: TLabel;
    EdtNovoValorA: TMaskEdit;
    Label9: TLabel;
    CbResponsabilidadeA: TComboBox;
    Label10: TLabel;
    CheckBoxManutencao: TCheckBox;
    EdCustoReparo: TMaskEdit;
    Label11: TLabel;
    Panel2: TPanel;
    SearchBox1: TSearchBox;
    Panel7: TPanel;
    DBGridAnalise: TDBGrid;
    Shape2: TShape;
    Shape1: TShape;
    Label7: TLabel;
    MemoDetalhes: TMemo;
    DataSource1: TDataSource;
    BtnCancelarAnalise: TSpeedButton;
    BtnSalvarAnalise: TSpeedButton;
    Label1: TLabel;
    Label12: TLabel;
    Image6: TImage;
    Image1: TImage;
    Label13: TLabel;
    ShapeTipoOcorrencia: TShape;
    LabelTipoOcorrencia: TLabel;
    Shape4: TShape;
    Shape5: TShape;
    LabelItemAfetado: TLabel;
    Label16: TLabel;
    Image2: TImage;
    Image3: TImage;
    Label17: TLabel;
    LabelResponsavel: TLabel;
    Shape6: TShape;
    Image4: TImage;
    Label19: TLabel;
    Label15: TLabel;
    Label18: TLabel;
    Image5: TImage;
    Shape3: TShape;
    Shape7: TShape;
    Image7: TImage;
    Label14: TLabel;
    LabelDepreciaçaoAcumulada: TLabel;
    Shape8: TShape;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure EdtDepreciacaoChange(Sender: TObject);
    procedure CbGravidadeAChange(Sender: TObject);
    procedure BtnSalvarAnaliseClick(Sender: TObject);
    procedure SearchBox1Change(Sender: TObject);
    procedure DBGridAnaliseCellClick(Column: TColumn);
    procedure BtnCancelarAnaliseClick(Sender: TObject);
  private
    FIdOcorrenciaSelecionada: Integer;
    FIdPatrimonioSelecionado: Integer;
    FValorAtualPatrimonio: Currency;
    FPercentualDepreciacaoAcumulada: Currency;
    procedure AtualizarGrid;
    procedure CarregarDetalhesOcorrencia(AIdOcorrencia: Integer);
    procedure CalcularNovoValor;
    procedure LimparCampos;
    function ValidarCampos: Boolean;
    procedure AdicionarHistoricoDepreciacoes(AIdPatrimonio: Integer; ADetalhes: TStringList);
  public
    { Public declarations }
  end;

var
  FormAnaliseOcorrencia: TFormAnaliseOcorrencia;

implementation

{$R *.dfm}

function FormatarValorBrasileiro(Valor: Currency): String;
var
  FS: TFormatSettings;
begin
  FS := TFormatSettings.Create;
  FS.DecimalSeparator := ',';
  FS.ThousandSeparator := '.';
  Result := 'R$ ' + FormatFloat('#,##0.00', Valor, FS);
end;

procedure TFormAnaliseOcorrencia.AtualizarGrid;
var
  DataSet: TDataSet;
begin
  try
    DataSet := FAnaliseOcorrenciaController.ListarOcorrenciasPendentes;
    DataSource1.DataSet := DataSet;
    DBGridAnalise.DataSource := DataSource1;
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao carregar ocorrências: ' + E.Message);

    end;
  end;
end;

procedure TFormAnaliseOcorrencia.BtnSalvarAnaliseClick(Sender: TObject);
var
  AvaliacaoDTO: TAvaliacaoOcorrenciaDTO;
  CustoReparo: Currency;
begin
  if not ValidarCampos then
    Exit;

  try
    AvaliacaoDTO.FIdOcorrencia := FIdOcorrenciaSelecionada;
    AvaliacaoDTO.FIdGestor := 1; // TODO: Pegar ID do gestor logado
    AvaliacaoDTO.FGravidade := CbGravidadeA.Text;
    AvaliacaoDTO.FPercentualDepreciacao := EdtDepreciacao.Value;
    AvaliacaoDTO.FResponsabilidade := CbResponsabilidadeA.Text;
    AvaliacaoDTO.FRequerManutencao := CheckBoxManutencao.Checked;

    // Converte custo de reparo
    if Trim(EdCustoReparo.Text) <> '' then
    begin
      CustoReparo := StrToCurrDef(
        StringReplace(
          StringReplace(EdCustoReparo.Text, '.', '', [rfReplaceAll]),
          ',', '.', [rfReplaceAll]
        ), 0);
      AvaliacaoDTO.FCustoEstimadoReparo := CustoReparo;
    end
    else
      AvaliacaoDTO.FCustoEstimadoReparo := 0;

    AvaliacaoDTO.FObservacoesGestor := MemoDetalhes.Lines.Text;

    FAnaliseOcorrenciaController.AvaliarOcorrencia(AvaliacaoDTO);

    ShowMessage('Avaliação salva com sucesso!');
    LimparCampos;
    AtualizarGrid;

  except
    on E: Exception do
      ShowMessage('Erro ao salvar avaliação: ' + E.Message);
  end;
end;

procedure TFormAnaliseOcorrencia.CalcularNovoValor;
var
  NovoValor: Currency;
  PercentualTotal: Currency;
  AvisoStatus: String;
begin
  if (FValorAtualPatrimonio > 0) and (EdtDepreciacao.Value > 0) then
  begin
    NovoValor := FAnaliseOcorrenciaController.CalcularNovoValor(
      FValorAtualPatrimonio,
      EdtDepreciacao.Value
    );

    // Calcular percentual total acumulado
    PercentualTotal := FPercentualDepreciacaoAcumulada + EdtDepreciacao.Value;

    EdtNovoValorA.Text := FormatarValorBrasileiro(NovoValor);

    // Mostrar aviso visual baseado no status
    if PercentualTotal >= 100 then
    begin
      EdtNovoValorA.Color := clRed;
      EdtNovoValorA.Font.Color := clWhite;
      AvisoStatus := ' (ITEM SERÁ DESATIVADO)';
    end
    else if PercentualTotal >= 80 then
    begin
      EdtNovoValorA.Color := $0080FF; // Laranja
      EdtNovoValorA.Font.Color := clWhite;
      AvisoStatus := ' (Próximo do limite)';
    end
    else
    begin
      EdtNovoValorA.Color := clBtnFace;
      EdtNovoValorA.Font.Color := clBlack;
      AvisoStatus := '';
    end;

    // Atualizar o texto para incluir o aviso
    if AvisoStatus <> '' then
      EdtNovoValorA.Text := EdtNovoValorA.Text + AvisoStatus;
  end
  else if FValorAtualPatrimonio > 0 then
  begin
    EdtNovoValorA.Text := FormatarValorBrasileiro(FValorAtualPatrimonio);
    EdtNovoValorA.Color := clBtnFace;
    EdtNovoValorA.Font.Color := clBlack;
  end
  else
  begin
    EdtNovoValorA.Text := 'R$ 0,00';
    EdtNovoValorA.Color := clBtnFace;
    EdtNovoValorA.Font.Color := clBlack;
  end;
end;

procedure TFormAnaliseOcorrencia.CarregarDetalhesOcorrencia(AIdOcorrencia: Integer);
var
  Ocorrencia: TOcorrenciaModel;
  Detalhes: TStringList;
begin
  Detalhes := TStringList.Create;
  try
    Ocorrencia := FAnaliseOcorrenciaController.ObterDetalhesOcorrencia(AIdOcorrencia);
    try
      if Ocorrencia = nil then
      begin
        ShowMessage('Ocorrência não encontrada!');
        Exit;
      end;

      FIdOcorrenciaSelecionada := Ocorrencia.Id;
      FIdPatrimonioSelecionado := Ocorrencia.IdPatrimonio;

      // Busca valor atual do patrimônio
      FValorAtualPatrimonio := FAnaliseOcorrenciaController.ObterValorPatrimonio(Ocorrencia.IdPatrimonio);

      // Calcula depreciação acumulada atual
      FPercentualDepreciacaoAcumulada := FAnaliseOcorrenciaController.CalcularDepreciacaoAcumulada(Ocorrencia.IdPatrimonio);

      // Formata os valores corretamente com formato brasileiro
      EdtValorAtualA.EditMask := '';
      EdtNovoValorA.EditMask := '';
      EdtValorAtualA.Text := FormatarValorBrasileiro(FValorAtualPatrimonio);
      EdtNovoValorA.Text := FormatarValorBrasileiro(FValorAtualPatrimonio);

      // Adiciona informação sobre depreciação acumulada
      if FPercentualDepreciacaoAcumulada > 0 then
      begin
        Detalhes.Add('================================================');
        Detalhes.Add('STATUS DE DEPRECIAÇÃO');
        Detalhes.Add('================================================');
        Detalhes.Add('Depreciação Acumulada: ' + FormatFloat('0.00', FPercentualDepreciacaoAcumulada) + '%');

        if FPercentualDepreciacaoAcumulada >= 80 then
        begin
          Detalhes.Add('');
          if FPercentualDepreciacaoAcumulada >= 100 then
            Detalhes.Add('ALERTA CRÍTICO: Item atingiu 100% de depreciação - SERÁ DESATIVADO')
          else
            Detalhes.Add('ALERTA: Item próximo do final da vida útil (' + FormatFloat('0.0', FPercentualDepreciacaoAcumulada) + '%)');
        end;

        Detalhes.Add('');
      end;

      // Adiciona histórico de depreciações anteriores
      AdicionarHistoricoDepreciacoes(Ocorrencia.IdPatrimonio, Detalhes);

      // Limpa campos de avaliação para novo cálculo
      CbGravidadeA.ItemIndex := -1;
      EdtDepreciacao.Value := 0;
      CbResponsabilidadeA.ItemIndex := -1;
      CheckBoxManutencao.Checked := False;
      EdCustoReparo.Text := '';

      // Monta os detalhes da ocorrência
      Detalhes.Add('================================================');
      Detalhes.Add('DADOS DA OCORRÊNCIA');
      Detalhes.Add('================================================');
      Detalhes.Add('ID: ' + IntToStr(Ocorrencia.Id) +
                  ' | Tipo: ' + Ocorrencia.TipoOcorrencia +
                  ' | Data: ' + FormatDateTime('dd/mm/yyyy hh:nn', Ocorrencia.DataOcorrencia) +
                  ' | Status: ' + Ocorrencia.Status);
      Detalhes.Add('Valor Atual: ' + FormatarValorBrasileiro(FValorAtualPatrimonio));
      Detalhes.Add('');
      Detalhes.Add('DESCRIÇÃO:');
      Detalhes.Add(Ocorrencia.Descricao);
      Detalhes.Add('');

      if Ocorrencia.FotoAnexo <> '' then
        Detalhes.Add('Anexo: ' + Ocorrencia.FotoAnexo);

      MemoDetalhes.Lines.Assign(Detalhes);

    finally
      Ocorrencia.Free;
    end;
  finally
    Detalhes.Free;
  end;
end;

procedure TFormAnaliseOcorrencia.DBGridAnaliseCellClick(Column: TColumn);
var
  IdOcorrencia: Integer;
  Ocorrencia: TOcorrenciaModel;
  NomeUsuario: string;
  TipoOcorrencia: string;
  ValorPatrimonio: Currency;
  DepreciacaoAcumulada: Currency;
  Descricao: string;
  NomePatrimonio: string;
begin
  if not DataSource1.DataSet.IsEmpty then
  begin
    IdOcorrencia := DataSource1.DataSet.FieldByName('id').AsInteger;

    try
      Label13.Caption := 'Ocorrência #' + IntToStr(IdOcorrencia);

      Descricao := '';
      NomePatrimonio := '';
      NomeUsuario := '';
      TipoOcorrencia := '';

  
      if DataSource1.DataSet.FindField('descricao') <> nil then
        Descricao := DataSource1.DataSet.FieldByName('descricao').AsString
      else if DataSource1.DataSet.FindField('descricao_ocorrencia') <> nil then
        Descricao := DataSource1.DataSet.FieldByName('descricao_ocorrencia').AsString;

      if DataSource1.DataSet.FindField('patrimonio') <> nil then
        NomePatrimonio := DataSource1.DataSet.FieldByName('patrimonio').AsString
      else if DataSource1.DataSet.FindField('nome_patrimonio') <> nil then
        NomePatrimonio := DataSource1.DataSet.FieldByName('nome_patrimonio').AsString
      else if DataSource1.DataSet.FindField('patrimonio_nome') <> nil then
        NomePatrimonio := DataSource1.DataSet.FieldByName('patrimonio_nome').AsString
      else if DataSource1.DataSet.FindField('nome_item') <> nil then
        NomePatrimonio := DataSource1.DataSet.FieldByName('nome_item').AsString
      else if DataSource1.DataSet.FindField('item') <> nil then
        NomePatrimonio := DataSource1.DataSet.FieldByName('item').AsString
      else if DataSource1.DataSet.FindField('nome_bem') <> nil then
        NomePatrimonio := DataSource1.DataSet.FieldByName('nome_bem').AsString;

      if DataSource1.DataSet.FindField('usuario_relator') <> nil then
        NomeUsuario := DataSource1.DataSet.FieldByName('usuario_relator').AsString
      else if DataSource1.DataSet.FindField('nome_usuario') <> nil then
        NomeUsuario := DataSource1.DataSet.FieldByName('nome_usuario').AsString
      else if DataSource1.DataSet.FindField('usuario') <> nil then
        NomeUsuario := DataSource1.DataSet.FieldByName('usuario').AsString
      else if DataSource1.DataSet.FindField('responsavel') <> nil then
        NomeUsuario := DataSource1.DataSet.FieldByName('responsavel').AsString
      else if DataSource1.DataSet.FindField('nome_responsavel') <> nil then
        NomeUsuario := DataSource1.DataSet.FieldByName('nome_responsavel').AsString
      else if DataSource1.DataSet.FindField('relator_nome') <> nil then
        NomeUsuario := DataSource1.DataSet.FieldByName('relator_nome').AsString
      else if DataSource1.DataSet.FindField('nome_completo') <> nil then
        NomeUsuario := DataSource1.DataSet.FieldByName('nome_completo').AsString;

      if DataSource1.DataSet.FindField('tipo_ocorrencia') <> nil then
        TipoOcorrencia := UpperCase(Trim(DataSource1.DataSet.FieldByName('tipo_ocorrencia').AsString))
      else if DataSource1.DataSet.FindField('tipo') <> nil then
        TipoOcorrencia := UpperCase(Trim(DataSource1.DataSet.FieldByName('tipo').AsString));

      // Se ainda não encontrou o usuário, tenta em qualquer campo que possa ser o nome
      if Trim(NomeUsuario) = '' then
      begin
        for var I := 0 to DataSource1.DataSet.FieldCount - 1 do
        begin
          var FieldName := LowerCase(DataSource1.DataSet.Fields[I].FieldName);
          var FieldValue := DataSource1.DataSet.Fields[I].AsString;

          if (Pos('nome', FieldName) > 0) or (Pos('user', FieldName) > 0) or (Pos('respons', FieldName) > 0) or (Pos('solicit', FieldName) > 0) then
          begin
            if Trim(FieldValue) <> '' then
            begin
              NomeUsuario := FieldValue;
              Break;
            end;
          end;
        end;
      end;

      if Trim(NomePatrimonio) = '' then
        NomePatrimonio := 'Não encontrado';
      if Trim(NomeUsuario) = '' then
        NomeUsuario := 'Não encontrado';
      if Trim(TipoOcorrencia) = '' then
        TipoOcorrencia := 'NÃO INFORMADO';

      LabelItemAfetado.Caption := NomePatrimonio;
      LabelResponsavel.Caption := NomeUsuario;
      Label15.Caption := Descricao;
      LabelTipoOcorrencia.Caption := TipoOcorrencia;

      Ocorrencia := FAnaliseOcorrenciaController.ObterDetalhesOcorrencia(IdOcorrencia);
      if Assigned(Ocorrencia) then
      begin
        ValorPatrimonio := FAnaliseOcorrenciaController.ObterValorPatrimonio(Ocorrencia.IdPatrimonio);
        DepreciacaoAcumulada := FAnaliseOcorrenciaController.CalcularDepreciacaoAcumulada(Ocorrencia.IdPatrimonio);

        LabelDepreciaçaoAcumulada.Caption := FormatFloat('#,##0.00', DepreciacaoAcumulada) + '%';

        if (TipoOcorrencia = 'FURTO') or (TipoOcorrencia = 'PERDA') then
        begin
          LabelTipoOcorrencia.Font.Color := clRed;
          ShapeTipoOcorrencia.Brush.Color := $00DEDDFF;
        end
        else if TipoOcorrencia = 'DANO FISICO' then
        begin
          LabelTipoOcorrencia.Font.Color := $00804000;
          ShapeTipoOcorrencia.Brush.Color := $00FFF0E6;
        end
        else if (TipoOcorrencia = 'MAU FUNCIONAMENTO') or (TipoOcorrencia = 'DESGASTE NATURAL') then
        begin
          LabelTipoOcorrencia.Font.Color := $00808080;
          ShapeTipoOcorrencia.Brush.Color := $00F0F0F0;
        end
        else
        begin
          LabelTipoOcorrencia.Font.Color := clBlack;
          ShapeTipoOcorrencia.Brush.Color := $00E6F3FF;
        end;

        Ocorrencia.Free;
      end;

    except
      on E: Exception do
      begin
        LabelItemAfetado.Caption := 'Erro: ' + Copy(E.Message, 1, 30);
        LabelResponsavel.Caption := 'Erro ao carregar';
        Label15.Caption := 'Erro ao carregar';
        LabelTipoOcorrencia.Caption := 'ERRO';
        LabelDepreciaçaoAcumulada.Caption := '0,00%';
      end;
    end;

    CarregarDetalhesOcorrencia(IdOcorrencia);
  end;
end;

procedure TFormAnaliseOcorrencia.EdtDepreciacaoChange(Sender: TObject);
begin
  CalcularNovoValor;
end;

procedure TFormAnaliseOcorrencia.CbGravidadeAChange(Sender: TObject);
begin
  // Define valores de depreciação automáticos baseado na gravidade
  if CbGravidadeA.ItemIndex <> -1 then
  begin
    case CbGravidadeA.ItemIndex of
      0: EdtDepreciacao.Value := 10;   // Baixa = 10%
      1: EdtDepreciacao.Value := 25;   // Média = 25%
      2: EdtDepreciacao.Value := 50;   // Alta = 50%
      3: EdtDepreciacao.Value := 75;   // Crítica = 75%
    end;

    // Calcula automaticamente o novo valor
    CalcularNovoValor;
  end;
end;

procedure TFormAnaliseOcorrencia.FormCreate(Sender: TObject);
begin
  // Torna os campos de valor somente leitura
  EdtValorAtualA.ReadOnly := True;
  EdtValorAtualA.Color := clBtnFace;
  EdtNovoValorA.ReadOnly := True;
  EdtNovoValorA.Color := clBtnFace;

  // Configura o DataSource do DBGrid
  DBGridAnalise.DataSource := DataSource1;

  // Inicializa ComboBoxes
  CbGravidadeA.Items.Clear;
  CbGravidadeA.Items.Add('Baixa');
  CbGravidadeA.Items.Add('Média');
  CbGravidadeA.Items.Add('Alta');
  CbGravidadeA.Items.Add('Crítica');

  CbResponsabilidadeA.Items.Clear;
  CbResponsabilidadeA.Items.Add('Usuário');
  CbResponsabilidadeA.Items.Add('Desgaste Natural');
  CbResponsabilidadeA.Items.Add('Defeito de Fábrica');
  CbResponsabilidadeA.Items.Add('Acidente');
  CbResponsabilidadeA.Items.Add('Vandalismo');

  // Configura as labels iniciais como "Sem informação"
  Label13.Caption := 'Ocorrência #';
  LabelItemAfetado.Caption := 'Sem informação';
  LabelResponsavel.Caption := 'Sem informação';
  Label15.Caption := 'Sem informação';
  LabelTipoOcorrencia.Caption := 'Sem informação';
  LabelDepreciaçaoAcumulada.Caption := '0,00%';

  LimparCampos;
  AtualizarGrid;
end;

procedure TFormAnaliseOcorrencia.FormShow(Sender: TObject);
begin
  AtualizarGrid;
end;

procedure TFormAnaliseOcorrencia.FormDestroy(Sender: TObject);
begin
  // Não precisa liberar FAnaliseOcorrenciaController pois é uma variável global
end;

procedure TFormAnaliseOcorrencia.LimparCampos;
begin
  FIdOcorrenciaSelecionada := 0;
  FIdPatrimonioSelecionado := 0;
  FValorAtualPatrimonio := 0;
  FPercentualDepreciacaoAcumulada := 0;

  EdtValorAtualA.Text := 'R$ 0,00';
  EdtDepreciacao.Value := 0;
  EdtNovoValorA.Text := 'R$ 0,00';
  EdtNovoValorA.Color := clBtnFace;
  EdtNovoValorA.Font.Color := clBlack;
  EdCustoReparo.Text := '';
  CheckBoxManutencao.Checked := False;
  CbGravidadeA.ItemIndex := -1;
  CbResponsabilidadeA.ItemIndex := -1;
  MemoDetalhes.Lines.Clear;

  // Limpa as labels de informação do grid
  Label13.Caption := 'Ocorrência #';
  LabelItemAfetado.Caption := 'Sem informação';
  LabelResponsavel.Caption := 'Sem informação';
  Label15.Caption := 'Sem informação';
  LabelTipoOcorrencia.Caption := 'Sem informação';
  LabelDepreciaçaoAcumulada.Caption := '0,00%';

  // Reseta a cor do shape para o padrão
  ShapeTipoOcorrencia.Brush.Color := $00E6F3FF;
  LabelTipoOcorrencia.Font.Color := clBlack;
end;

procedure TFormAnaliseOcorrencia.SearchBox1Change(Sender: TObject);
var
  OldDataSet: TDataSet;
  NewDataSet: TDataSet;
begin
  try
    // Evita pesquisa com texto muito curto
    if (Length(Trim(SearchBox1.Text)) > 0) and (Length(Trim(SearchBox1.Text)) < 2) then
      Exit;

    // Libera o dataset anterior se existir
    OldDataSet := DataSource1.DataSet;
    DataSource1.DataSet := nil;

    if Trim(SearchBox1.Text) <> '' then
    begin
      NewDataSet := FAnaliseOcorrenciaController.PesquisarOcorrencia(Trim(SearchBox1.Text));
      DataSource1.DataSet := NewDataSet;
      DBGridAnalise.DataSource := DataSource1;

      // Limpa as labels de informação ao pesquisar
      Label13.Caption := 'Ocorrência #';
      LabelItemAfetado.Caption := 'Sem informação';
      LabelResponsavel.Caption := 'Sem informação';
      Label15.Caption := 'Sem informação';
      LabelTipoOcorrencia.Caption := 'Sem informação';
      LabelDepreciaçaoAcumulada.Caption := '0,00%';
      ShapeTipoOcorrencia.Brush.Color := $00E6F3FF;
      LabelTipoOcorrencia.Font.Color := clBlack;
    end
    else
    begin
      AtualizarGrid;
    end;

    // Libera o dataset antigo se for diferente do novo
    if Assigned(OldDataSet) and (OldDataSet <> NewDataSet) then
      OldDataSet.Free;

  except
    on E: Exception do
    begin
      ShowMessage('Erro na pesquisa: ' + E.Message);
      // Em caso de erro, volta com a lista completa
      AtualizarGrid;
    end;
  end;
end;

procedure TFormAnaliseOcorrencia.AdicionarHistoricoDepreciacoes(AIdPatrimonio: Integer; ADetalhes: TStringList);
var
  Query: TFDQuery;
  TemHistorico: Boolean;
  Contador: Integer;
begin
  Query := FAnaliseOcorrenciaController.ObterHistoricoDepreciacoes(AIdPatrimonio);
  try
    if not Assigned(Query) or Query.IsEmpty then
      Exit;

    TemHistorico := False;
    Query.First;

    // Verifica se há algum registro antes de adicionar o título
    while not Query.Eof do
    begin
      if Query.FieldByName('percentual_depreciacao').AsCurrency > 0 then
      begin
        TemHistorico := True;
        Break;
      end;
      Query.Next;
    end;

    if TemHistorico then
    begin
      ADetalhes.Add('================================================');
      ADetalhes.Add('HISTÓRICO DE DEPRECIAÇÕES');
      ADetalhes.Add('================================================');
      ADetalhes.Add('ID    | Data       | Tipo            | %      | Valores');
      ADetalhes.Add('------+------------+-----------------+--------+-------------------');

      Contador := 0;
      Query.First;
      while not Query.Eof do
      begin
        if Query.FieldByName('percentual_depreciacao').AsCurrency > 0 then
        begin
          Inc(Contador);

          // Limita a 5 ocorrências mais recentes para não poluir
          if Contador <= 5 then
          begin
            ADetalhes.Add(
              Format('%-5d | %-10s | %-15s | %5.2f%% | %s -> %s', [
                Query.FieldByName('id_ocorrencia').AsInteger,
                FormatDateTime('dd/mm/yyyy', Query.FieldByName('data_analise').AsDateTime),
                Copy(Query.FieldByName('tipo_ocorrencia').AsString, 1, 15),
                Query.FieldByName('percentual_depreciacao').AsCurrency,
                FormatarValorBrasileiro(Query.FieldByName('valor_antes').AsCurrency),
                FormatarValorBrasileiro(Query.FieldByName('valor_depois').AsCurrency)
              ])
            );
          end;
        end;
        Query.Next;
      end;

      ADetalhes.Add('------+------------+-----------------+--------+-------------------');

      if Contador > 5 then
        ADetalhes.Add('... e mais ' + IntToStr(Contador - 5) + ' ocorrência(s) não exibida(s)');

      ADetalhes.Add('');
      ADetalhes.Add('Resumo:');
      ADetalhes.Add('- Total de ocorrências com depreciação: ' + IntToStr(Contador));
      ADetalhes.Add('- Depreciação acumulada atual: ' + FormatFloat('0.00', FPercentualDepreciacaoAcumulada) + '%');
      ADetalhes.Add('');
    end;
  finally
    Query.Free;
  end;
end;

function TFormAnaliseOcorrencia.ValidarCampos: Boolean;
begin
  Result := False;

  if FIdOcorrenciaSelecionada = 0 then
  begin
    ShowMessage('Selecione uma ocorrência no grid!');
    Exit;
  end;

  if CbGravidadeA.ItemIndex = -1 then
  begin
    ShowMessage('Selecione a gravidade da ocorrência!');
    CbGravidadeA.SetFocus;
    Exit;
  end;

  if EdtDepreciacao.Value <= 0 then
  begin
    ShowMessage('Informe o percentual de depreciação!');
    EdtDepreciacao.SetFocus;
    Exit;
  end;

  if EdtDepreciacao.Value > 100 then
  begin
    ShowMessage('O percentual de depreciação não pode ser maior que 100%!');
    EdtDepreciacao.SetFocus;
    Exit;
  end;

  // Verificar se ultrapassa 100% acumulado
  if (FPercentualDepreciacaoAcumulada + EdtDepreciacao.Value) > 100 then
  begin
    ShowMessage('Atenção: Esta depreciação ultrapassará 100% do valor original!' + #13#10 +
               'Depreciação atual: ' + FormatFloat('0.00', FPercentualDepreciacaoAcumulada) + '%' + #13#10 +
               'Nova depreciação: ' + FormatFloat('0.00', EdtDepreciacao.Value) + '%' + #13#10 +
               'Total: ' + FormatFloat('0.00', FPercentualDepreciacaoAcumulada + EdtDepreciacao.Value) + '%' + #13#10 +
               'O item será desativado automaticamente.');
    // Não impede a operação, apenas alerta
  end;

  if CbResponsabilidadeA.ItemIndex = -1 then
  begin
    ShowMessage('Selecione a responsabilidade!');
    CbResponsabilidadeA.SetFocus;
    Exit;
  end;

  if CheckBoxManutencao.Checked and (Trim(EdCustoReparo.Text) = '') then
  begin
    ShowMessage('Informe o custo estimado de reparo quando requer manutenção!');
    EdCustoReparo.SetFocus;
    Exit;
  end;

  Result := True;
end;

procedure TFormAnaliseOcorrencia.BtnCancelarAnaliseClick(Sender: TObject);
begin
  LimparCampos;
end;

end.
