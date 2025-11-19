unit DashboardView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VCLTee.TeEngine, VCLTee.Series,
  Vcl.ExtCtrls, VCLTee.TeeProcs, VCLTee.Chart, Vcl.StdCtrls,
  DashboardController, DashboardModel, System.Generics.Collections, Vcl.ComCtrls,
  VclTee.TeeGDIPlus, Vcl.WinXPanels, DepreciacaoController, DepreciacaoModel,
  Vcl.Imaging.pngimage, RelatorioDepreciacaoController, DB, RelatorioDepreciacaoItemModel,
  Vcl.Buttons, frxClass, DateUtils, frxDBSet, frxDesgn, frxChart, LogService, Unit3;

type
  TFormDashboard = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    Panel2: TPanel;
    Label1: TLabel;
    Chart1: TChart;
    Series1: TBarSeries;
    ComboBoxTipo: TComboBox;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel4: TPanel;
    Panel3: TPanel;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    LabelTituloTaxa: TLabel;
    LabelTituloDepreciado: TLabel;
    LabelValorDepreciado: TLabel;
    LabelValorOriginal: TLabel;
    LabelValorAtual: TLabel;
    LabelTaxaDepreciacao: TLabel;
    LabelTituloOriginal: TLabel;
    LabelTituloAtual: TLabel;
    Panel7: TPanel;
    Label15: TLabel;
    Panel8: TPanel;
    ChartDepreciacao: TChart;
    BarSeries1: THorizBarSeries;
    Panel9: TPanel;
    Panel10: TPanel;
    ComboBoxRelatorios: TComboBox;
    Panel11: TPanel;
    Shape5: TShape;
    Label4: TLabel;
    Panel12: TPanel;
    Label3: TLabel;
    Label5: TLabel;
    DateTimePickerFim: TDateTimePicker;
    DateTimePickerInicio: TDateTimePicker;
    BtnGerarRelatorio: TSpeedButton;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComboBoxTipoChange(Sender: TObject);
    procedure BtnGerarRelatorioClick(Sender: TObject);
  private
    FController: TDashboardController;
    FDepreciacaoController: TDepreciacaoController;
    FControllerRela: TRelatorioDepreciacaoController;
    FDadosRelatorio: TObjectList<TRelatorioDepreciacaoItemModel>;
    FRepository: TfrmRelatorioDepreciacao;

    procedure ConfigurarGrafico;
    procedure ConfigurarGraficoDepreciacao;
    procedure ConfigurarCards;
    procedure ConfigurarFiltrosPadrao;
    procedure AtualizarGraficoPorPredio;
    procedure AtualizarGraficoPorSala;
    procedure AtualizarResumoDepreciacao;
    procedure AtualizarGraficoDepreciacao;
    procedure CarregarComboTipo;
    procedure PreencherGrafico(ADados: TObjectList<TDashboardItemModel>; const ATitulo: string);
    procedure GerarRelatorioVisual(ADados: TObjectList<TRelatorioDepreciacaoItemModel>);

  public
    { Public declarations }
  end;

var
  FormDashboard: TFormDashboard;

implementation

{$R *.dfm}

procedure TFormDashboard.FormCreate(Sender: TObject);
begin
  FController := TDashboardController.Create;
  FDepreciacaoController := TDepreciacaoController.Create;

  FControllerRela := TRelatorioDepreciacaoController.Create(DataModule2.FDConnection);
  FDadosRelatorio := TObjectList<TRelatorioDepreciacaoItemModel>.Create;

  // Configura o formato de data para o padrão brasileiro
  DateTimePickerInicio.Format := 'dd/MM/yyyy';
  DateTimePickerFim.Format := 'dd/MM/yyyy';

  ConfigurarFiltrosPadrao;
  CarregarComboTipo;
end;

procedure TFormDashboard.FormDestroy(Sender: TObject);
begin
  FController.Free;
  FDepreciacaoController.Free;
  FDadosRelatorio.Free;
  FControllerRela.Free;
end;

procedure TFormDashboard.FormShow(Sender: TObject);
begin
  TLogService.Instance.LogAcesso('Dashboard');

  // Configura o ComboBox
  ComboBoxTipo.Items.Clear;
  ComboBoxTipo.Items.Add('Por Prédio');
  ComboBoxTipo.Items.Add('Por Sala');
  ComboBoxTipo.ItemIndex := 0;

  ConfigurarGrafico;
  ConfigurarCards;
  ConfigurarGraficoDepreciacao;

  AtualizarGraficoPorPredio;
  AtualizarResumoDepreciacao;
  AtualizarGraficoDepreciacao;
end;

procedure TFormDashboard.GerarRelatorioVisual(
  ADados: TObjectList<TRelatorioDepreciacaoItemModel>);
var
  I: Integer;
  Item: TRelatorioDepreciacaoItemModel;
  TotalAntes, TotalDepois, TotalDepreciado: Currency;
  MediaPercentual: Double;
begin
  // Aqui você pode:
  // 1. Popular um StringGrid/DBGrid com os dados
  // 2. Gerar um relatório FastReport programaticamente
  // 3. Exportar para Excel
  // 4. Mostrar em um Memo formatado

  // Exemplo simples: Mostrar resumo
  TotalAntes := 0;
  TotalDepois := 0;
  TotalDepreciado := 0;
  MediaPercentual := 0;

  for Item in ADados do
  begin
    TotalAntes := TotalAntes + Item.ValorAntes;
    TotalDepois := TotalDepois + Item.ValorDepois;
    TotalDepreciado := TotalDepreciado + Item.ValorDepreciado;
    MediaPercentual := MediaPercentual + Item.PercentualDepreciacao;
  end;

  if ADados.Count > 0 then
    MediaPercentual := MediaPercentual / ADados.Count;

  ShowMessage(
    Format('RESUMO DO RELATÓRIO'#13#10 +
           '===================='#13#10 +
           'Ocorrências: %d'#13#10 +
           'Valor Antes: R$ %s'#13#10 +
           'Valor Depois: R$ %s'#13#10 +
           'Total Depreciado: R$ %s'#13#10 +
           'Média Percentual: %.2f%%',
           [ADados.Count,
            FormatFloat('#,##0.00', TotalAntes),
            FormatFloat('#,##0.00', TotalDepois),
            FormatFloat('#,##0.00', TotalDepreciado),
            MediaPercentual]));

  // TODO: Carregar e preencher FastReport com os dados
end;

procedure TFormDashboard.ConfigurarGrafico;
begin
  // Configurações gerais do gráfico de barras
  Chart1.Title.Text.Clear;
  Chart1.Title.Text.Add('Patrimônios por Localização');
  Chart1.Title.Font.Size := 14;
  Chart1.Title.Font.Style := [fsBold];

  // Configurações da série
  Series1.Clear;
  Series1.Marks.Visible := True;
  Series1.Marks.Style := smsValue;

  Chart1.View3D := False;
  Chart1.Legend.Visible := False;
  Chart1.BottomAxis.Title.Caption := 'Localização';
  Chart1.LeftAxis.Title.Caption := 'Quantidade';
end;

procedure TFormDashboard.ConfigurarCards;
begin

  LabelTituloOriginal.Caption := 'Valor Original Total';
  LabelTituloOriginal.Font.Size := 9;
  LabelTituloOriginal.Font.Color := clGray;
  LabelValorOriginal.Font.Size := 16;
  LabelValorOriginal.Font.Style := [fsBold];
  LabelValorOriginal.Font.Color := clBlue;

  LabelTituloAtual.Caption := 'Valor Atual Total';
  LabelTituloAtual.Font.Size := 9;
  LabelTituloAtual.Font.Color := clGray;
  LabelValorAtual.Font.Size := 16;
  LabelValorAtual.Font.Style := [fsBold];
  LabelValorAtual.Font.Color := clGreen;

  LabelTituloDepreciado.Caption := 'Total Depreciado';
  LabelTituloDepreciado.Font.Size := 9;
  LabelTituloDepreciado.Font.Color := clGray;
  LabelValorDepreciado.Font.Size := 16;
  LabelValorDepreciado.Font.Style := [fsBold];
  LabelValorDepreciado.Font.Color := clRed;

  LabelTituloTaxa.Caption := 'Taxa Média Depreciação';
  LabelTituloTaxa.Font.Size := 9;
  LabelTituloTaxa.Font.Color := clGray;
  LabelTaxaDepreciacao.Font.Size := 16;
  LabelTaxaDepreciacao.Font.Style := [fsBold];
  LabelTaxaDepreciacao.Font.Color := clMaroon;
end;

procedure TFormDashboard.ConfigurarFiltrosPadrao;
begin
  DateTimePickerFim.Date := Date;
  DateTimePickerInicio.Date := IncYear(Date, -1);
end;

procedure TFormDashboard.ConfigurarGraficoDepreciacao;
begin

  ChartDepreciacao.Title.Text.Clear;
  ChartDepreciacao.Title.Text.Add('Depreciação por Tipo de Ocorrência');
  ChartDepreciacao.Title.Font.Size := 14;
  ChartDepreciacao.Title.Font.Style := [fsBold];

  ChartDepreciacao.View3D := False;
  ChartDepreciacao.Legend.Visible := False;

  ChartDepreciacao.LeftAxis.Title.Caption := 'Tipo de Ocorrência';
  ChartDepreciacao.BottomAxis.Title.Caption := 'Valor Depreciado (R$)';

  BarSeries1.Clear;
  BarSeries1.Marks.Visible := True;
  BarSeries1.Marks.Style := smsValue;
  BarSeries1.Marks.Font.Size := 10;
  BarSeries1.Marks.Font.Style := [fsBold];

end;

procedure TFormDashboard.AtualizarGraficoPorPredio;
var
  Dados: TObjectList<TDashboardItemModel>;
begin
  Dados := FController.CarregarGraficoPorPredio;
  try
    PreencherGrafico(Dados, 'Patrimônios por Prédio');
  finally
    Dados.Free;
  end;
end;

procedure TFormDashboard.AtualizarGraficoPorSala;
var
  Dados: TObjectList<TDashboardItemModel>;
begin
  Dados := FController.CarregarGraficoPorSala(10);
  try
    PreencherGrafico(Dados, 'Top 10 Salas com Mais Patrimônios');
  finally
    Dados.Free;
  end;
end;

procedure TFormDashboard.AtualizarResumoDepreciacao;
var
  Resumo: TResumoDepreciacaoModel;
begin
  Resumo := FDepreciacaoController.ObterResumoGeral;
  try
    LabelValorOriginal.Caption := FormatCurr('R$ #,##0.00', Resumo.ValorOriginalTotal);
    LabelValorAtual.Caption := FormatCurr('R$ #,##0.00', Resumo.ValorAtualTotal);
    LabelValorDepreciado.Caption := FormatCurr('R$ #,##0.00', Resumo.ValorDepreciadoTotal);
    LabelTaxaDepreciacao.Caption := FormatFloat('0.00', Resumo.TaxaDepreciacaoMedia) + '%';
  finally
    Resumo.Free;
  end;
end;

procedure TFormDashboard.BtnGerarRelatorioClick(Sender: TObject);
var
  MaiorImpacto: TMaiorImpactoDTO;
  TipoSelecionado: string;
  MensagemErro: string;
begin

  if not DataModule2.FDConnection.Connected then
  begin
    ShowMessage('Conexão com o banco de dados não está ativa.');
    Exit;
  end;

  try
    if ComboBoxRelatorios.ItemIndex = 0 then
      TipoSelecionado := ''
    else
      TipoSelecionado := ComboBoxRelatorios.Text;

    FControllerRela.PrepararRelatorioFastReport(
      DateTimePickerInicio.Date,
      DateTimePickerFim.Date,
      TipoSelecionado,
      MensagemErro
    );

    if MensagemErro <> '' then
    begin
      TLogService.Instance.LogSistema('Erro ao gerar relatório: ' + MensagemErro, 'ERRO');
      ShowMessage(MensagemErro);
      Exit;
    end
    else
    begin
      // Log de sucesso na geração do relatório
      TLogService.Instance.LogRelatorio(
        TipoSelecionado,
        Format('Período: %s a %s', [
          DateToStr(DateTimePickerInicio.Date),
          DateToStr(DateTimePickerFim.Date)
        ])
      );
    end;

    MaiorImpacto := FControllerRela.ObterMaiorImpactoParaRelatorio(
      DateTimePickerInicio.Date,
      DateTimePickerFim.Date,
      TipoSelecionado
    );

    ShowMessage(Format('DEBUG: %s - %s - R$ %.2f (%.0f%%)',
  [MaiorImpacto.Nome,
   MaiorImpacto.TipoOcorrencia,
   MaiorImpacto.Valor,
   MaiorImpacto.Percentual]));

    if MaiorImpacto.Valor > 0 then
    begin
      DataModule2.frxReport1.Variables['MaiorImpactoNome'] := MaiorImpacto.Nome;
      DataModule2.frxReport1.Variables['MaiorImpactoTipo'] := MaiorImpacto.TipoOcorrencia;
      DataModule2.frxReport1.Variables['MaiorImpactoValor'] := MaiorImpacto.Valor;
      DataModule2.frxReport1.Variables['MaiorImpactoPercentual'] := MaiorImpacto.Percentual;
    end
    else
    begin
      DataModule2.frxReport1.Variables['MaiorImpactoNome'] := 'Nenhum';
      DataModule2.frxReport1.Variables['MaiorImpactoTipo'] := '-';
      DataModule2.frxReport1.Variables['MaiorImpactoValor'] := 0;
      DataModule2.frxReport1.Variables['MaiorImpactoPercentual'] := 0;
    end;

    // ✅ MOSTRA O RELATÓRIO
    DataModule2.frxReport1.ShowReport;

  except
    on E: Exception do
      ShowMessage('Erro ao gerar relatório: ' + E.Message);
  end;
end;

procedure TFormDashboard.AtualizarGraficoDepreciacao;
var
  Dados: TObjectList<TDepreciacaoTipoModel>;
  Item: TDepreciacaoTipoModel;
  NomeTipo: string;
begin
  Dados := FDepreciacaoController.ObterDepreciacaoPorTipo;
  try
    BarSeries1.Clear;

    if Dados.Count > 0 then
    begin
      for Item in Dados do
      begin
        // Nome do tipo com quantidade de ocorrências
        NomeTipo := Format('%s (%d)', [
          Item.TipoOcorrencia,
          Item.QuantidadeOcorrencias
        ]);

        BarSeries1.Add(Item.ValorDepreciado, NomeTipo, clTeeColor);
      end;
    end
    else
    begin
      BarSeries1.Add(0, 'Sem dados', clGray);
    end;
  finally
    Dados.Free;
  end;
end;

procedure TFormDashboard.PreencherGrafico(ADados: TObjectList<TDashboardItemModel>; const ATitulo: string);
var
  Item: TDashboardItemModel;
begin
  Series1.Clear;
  Chart1.Title.Text[0] := ATitulo;

  if ADados.Count > 0 then
  begin
    for Item in ADados do
    begin
      Series1.Add(Item.Quantidade, Item.Nome, clTeeColor);
    end;
  end
  else
  begin
    Series1.Add(0, 'Sem dados', clGray);
  end;
end;

procedure TFormDashboard.CarregarComboTipo;
var
  Tipos: TStringList;
  I: Integer;
begin
  ComboBoxRelatorios.Items.Clear;
  ComboBoxRelatorios.Items.Add('Relatorio de depreciacao de bens');

  // ✅ USA O CONTROLLER - Sem contato direto com banco
  Tipos := FControllerRela.ObterTiposOcorrencia;
  try
    for I := 0 to Tipos.Count - 1 do
      ComboBoxTipo.Items.Add(Tipos[I]);

    ComboBoxTipo.ItemIndex := 0;
  finally
    Tipos.Free;
  end;
end;

procedure TFormDashboard.ComboBoxTipoChange(Sender: TObject);
begin
  case ComboBoxTipo.ItemIndex of
    0: AtualizarGraficoPorPredio;
    1: AtualizarGraficoPorSala;
  end;
end;

end.
