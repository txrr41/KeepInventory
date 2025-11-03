unit AnaliseOcorrenciaView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.WinXCtrls, Vcl.Buttons, Vcl.NumberBox, Vcl.Mask,
  AnaliseOcorrenciaController, OcorrenciaDTO, OcorrenciaModel;

type
  TFormAnaliseOcorrencia = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Label2: TLabel;
    Label4: TLabel;
    Panel4: TPanel;
    Label1: TLabel;
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
    SpeedButton1: TSpeedButton;
    BtnSalvarAnalise: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure EdtDepreciacaoChange(Sender: TObject);
    procedure CbGravidadeAChange(Sender: TObject);
    procedure BtnSalvarAnaliseClick(Sender: TObject);
    procedure SearchBox1Change(Sender: TObject);
    procedure DBGridAnaliseCellClick(Column: TColumn);
  private
    FIdOcorrenciaSelecionada: Integer;
    FIdPatrimonioSelecionado: Integer;
    FValorAtualPatrimonio: Currency;
    FController: TAnaliseOcorrenciaController;
    procedure AtualizarGrid;
    procedure CarregarDetalhesOcorrencia(AIdOcorrencia: Integer);
    procedure CalcularNovoValor;
    procedure LimparCampos;
    function ValidarCampos: Boolean;
  public
    { Public declarations }
  end;

var
  FormAnaliseOcorrencia: TFormAnaliseOcorrencia;

implementation

{$R *.dfm}

procedure TFormAnaliseOcorrencia.AtualizarGrid;
var
  DataSet: TDataSet;
begin
  try
    DataSet := FController.ListarOcorrenciasPendentes;
    DataSource1.DataSet := DataSet;
    DBGridAnalise.DataSource := DataSource1;

    // Debug: mostrar quantidade de registros
    ShowMessage('Registros encontrados: ' + IntToStr(DataSet.RecordCount));
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao carregar ocorrências: ' + E.Message);
      DBGridAnalise.DataSource := nil;
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
      CustoReparo := StrToCurrDef(StringReplace(EdCustoReparo.Text, '.', '', [rfReplaceAll]), 0);
      AvaliacaoDTO.FCustoEstimadoReparo := CustoReparo / 100;
    end
    else
      AvaliacaoDTO.FCustoEstimadoReparo := 0;

    AvaliacaoDTO.FObservacoesGestor := MemoDetalhes.Lines.Text;

    FController.AvaliarOcorrencia(AvaliacaoDTO);

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
begin
  if (FValorAtualPatrimonio > 0) and (EdtDepreciacao.Value > 0) then
  begin
    NovoValor := FController.CalcularNovoValor(
      FValorAtualPatrimonio,
      EdtDepreciacao.Value
    );

    EdtNovoValorA.Text := FormatCurr('#,##0.00', NovoValor);
  end
  else
    EdtNovoValorA.Text := '';
end;

procedure TFormAnaliseOcorrencia.CarregarDetalhesOcorrencia(AIdOcorrencia: Integer);
var
  Ocorrencia: TOcorrenciaModel;
  Detalhes: TStringList;
begin
  Detalhes := TStringList.Create;
  try
    Ocorrencia := FController.ObterDetalhesOcorrencia(AIdOcorrencia);
    try
      FIdOcorrenciaSelecionada := Ocorrencia.Id;
      FIdPatrimonioSelecionado := Ocorrencia.IdPatrimonio;

      // Busca valor atual do patrimônio



      // Limpa campos de avaliação para novo cálculo
      CbGravidadeA.ItemIndex := -1;
      EdtDepreciacao.Value := 0;
      EdtNovoValorA.Text := '';
      CbResponsabilidadeA.ItemIndex := -1;
      CheckBoxManutencao.Checked := False;
      EdCustoReparo.Text := '';

      // Monta os detalhes da ocorrência
      Detalhes.Add('═══════════════════════════════════════');
      Detalhes.Add('DETALHES DA OCORRÊNCIA');
      Detalhes.Add('═══════════════════════════════════════');
      Detalhes.Add('');
      Detalhes.Add('ID: ' + IntToStr(Ocorrencia.Id));
      Detalhes.Add('Tipo: ' + Ocorrencia.TipoOcorrencia);
      Detalhes.Add('Data: ' + FormatDateTime('dd/mm/yyyy hh:nn', Ocorrencia.DataOcorrencia));
      Detalhes.Add('Status: ' + Ocorrencia.Status);
      Detalhes.Add('');
      Detalhes.Add('───────────────────────────────────────');
      Detalhes.Add('DESCRIÇÃO:');
      Detalhes.Add('───────────────────────────────────────');
      Detalhes.Add(Ocorrencia.Descricao);
      Detalhes.Add('');

      if Ocorrencia.FotoAnexo <> '' then
      begin
        Detalhes.Add('───────────────────────────────────────');
        Detalhes.Add('Foto anexada: ' + Ocorrencia.FotoAnexo);
      end;

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

begin
  if not DataSource1.DataSet.IsEmpty then
  begin
    IdOcorrencia := DataSource1.DataSet.FieldByName('id').AsInteger;
    CarregarDetalhesOcorrencia(IdOcorrencia);
      FValorAtualPatrimonio := FController.ObterValorPatrimonio(
        Ocorrencia.IdPatrimonio);
        EdtValorAtualA.Text := FormatCurr('#,##0.00', FValorAtualPatrimonio);
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
    CalcularNovoValor;
  end;
end;

procedure TFormAnaliseOcorrencia.FormCreate(Sender: TObject);
begin
  FController := TAnaliseOcorrenciaController.Create;

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

  LimparCampos;
  AtualizarGrid;
end;

procedure TFormAnaliseOcorrencia.FormShow(Sender: TObject);
begin
  AtualizarGrid;
end;

procedure TFormAnaliseOcorrencia.FormDestroy(Sender: TObject);
begin
  if Assigned(FController) then
    FController.Free;
end;

procedure TFormAnaliseOcorrencia.LimparCampos;
begin
  FIdOcorrenciaSelecionada := 0;
  FIdPatrimonioSelecionado := 0;
  FValorAtualPatrimonio := 0;

  EdtValorAtualA.Text := '';
  EdtDepreciacao.Value := 0;
  EdtNovoValorA.Text := '';
  EdCustoReparo.Text := '';
  CheckBoxManutencao.Checked := False;
  CbGravidadeA.ItemIndex := -1;
  CbResponsabilidadeA.ItemIndex := -1;
  MemoDetalhes.Lines.Clear;
end;

procedure TFormAnaliseOcorrencia.SearchBox1Change(Sender: TObject);
begin
  if Trim(SearchBox1.Text) <> '' then
    DataSource1.DataSet := FController.PesquisarOcorrencia(SearchBox1.Text)
  else
    AtualizarGrid;
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

end.
