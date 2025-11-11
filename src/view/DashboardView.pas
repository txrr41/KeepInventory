unit DashboardView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VCLTee.TeEngine, VCLTee.Series,
  Vcl.ExtCtrls, VCLTee.TeeProcs, VCLTee.Chart, Vcl.StdCtrls,
  DashboardController, DashboardModel, System.Generics.Collections, Vcl.ComCtrls,
  VclTee.TeeGDIPlus, Vcl.WinXPanels, DepreciacaoController, DepreciacaoModel;

type
  TFormDashboard = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    Panel2: TPanel;
    Label1: TLabel;
    Chart1: TChart;
    Series1: TBarSeries;
    ComboBoxTipo: TComboBox;
    PanelResumoDepreciacao: TPanel;
    PanelCardValorOriginal: TCardPanel;
    PanelCardDepreciado: TCardPanel;
    LabelTituloDepreciado: TLabel;
    LabelTituloAtual: TLabel;
    LabelTituloOriginal: TLabel;
    LabelValorOriginal: TLabel;
    Card1: TCard;
    LabelTituloTaxa: TLabel;
    LabelValorDepreciado: TLabel;
    Card2: TCard;
    CardPanel1: TCardPanel;
    PanelCardTaxa: TCard;
    LabelTaxaDepreciacao: TLabel;
    ChartDepreciacao: TChart;
    BarSeries1: THorizBarSeries;
    PanelCardValorAtual: TCardPanel;
    Card3: TCard;
    LabelValorAtual: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComboBoxTipoChange(Sender: TObject);
  private
    FController: TDashboardController;
    FDepreciacaoController: TDepreciacaoController;

    procedure ConfigurarGrafico;
    procedure ConfigurarGraficoDepreciacao;
    procedure ConfigurarCards;

    procedure AtualizarGraficoPorPredio;
    procedure AtualizarGraficoPorSala;
    procedure AtualizarResumoDepreciacao;
    procedure AtualizarGraficoDepreciacao;

    procedure PreencherGrafico(ADados: TObjectList<TDashboardItemModel>; const ATitulo: string);
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
end;

procedure TFormDashboard.FormDestroy(Sender: TObject);
begin
  FController.Free;
  FDepreciacaoController.Free;
end;

procedure TFormDashboard.FormShow(Sender: TObject);
begin
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
  // Card 1 - Valor Original
  PanelCardValorOriginal.Color := $00F5F5F5; // Cinza claro
  PanelCardValorOriginal.BevelOuter := bvNone;
  LabelTituloOriginal.Caption := 'Valor Original Total';
  LabelTituloOriginal.Font.Size := 9;
  LabelTituloOriginal.Font.Color := clGray;
  LabelValorOriginal.Font.Size := 16;
  LabelValorOriginal.Font.Style := [fsBold];
  LabelValorOriginal.Font.Color := clBlue;

  // Card 2 - Valor Atual
  PanelCardValorAtual.Color := $00F5F5F5;
  PanelCardValorAtual.BevelOuter := bvNone;
  LabelTituloAtual.Caption := 'Valor Atual Total';
  LabelTituloAtual.Font.Size := 9;
  LabelTituloAtual.Font.Color := clGray;
  LabelValorAtual.Font.Size := 16;
  LabelValorAtual.Font.Style := [fsBold];
  LabelValorAtual.Font.Color := clGreen;

  // Card 3 - Depreciação
  PanelCardDepreciado.Color := $00F5F5F5;
  PanelCardDepreciado.BevelOuter := bvNone;
  LabelTituloDepreciado.Caption := 'Total Depreciado';
  LabelTituloDepreciado.Font.Size := 9;
  LabelTituloDepreciado.Font.Color := clGray;
  LabelValorDepreciado.Font.Size := 16;
  LabelValorDepreciado.Font.Style := [fsBold];
  LabelValorDepreciado.Font.Color := clRed;

  // Card 4 - Taxa Média
  PanelCardTaxa.Color := $00F5F5F5;
  PanelCardTaxa.BevelOuter := bvNone;
  LabelTituloTaxa.Caption := 'Taxa Média Depreciação';
  LabelTituloTaxa.Font.Size := 9;
  LabelTituloTaxa.Font.Color := clGray;
  LabelTaxaDepreciacao.Font.Size := 16;
  LabelTaxaDepreciacao.Font.Style := [fsBold];
  LabelTaxaDepreciacao.Font.Color := clMaroon;
end;

procedure TFormDashboard.ConfigurarGraficoDepreciacao;
begin
  // Define tamanho adequado
  ChartDepreciacao.Height := 400;

  // Configurações do gráfico de barras horizontais
  ChartDepreciacao.Title.Text.Clear;
  ChartDepreciacao.Title.Text.Add('Depreciação por Tipo de Ocorrência');
  ChartDepreciacao.Title.Font.Size := 14;
  ChartDepreciacao.Title.Font.Style := [fsBold];

  // Gráfico 2D
  ChartDepreciacao.View3D := False;
  ChartDepreciacao.Legend.Visible := False;

  // Configuração dos eixos
  ChartDepreciacao.LeftAxis.Title.Caption := 'Tipo de Ocorrência';
  ChartDepreciacao.BottomAxis.Title.Caption := 'Valor Depreciado (R$)';

  BarSeries1.Clear;
  BarSeries1.Marks.Visible := True;
  BarSeries1.Marks.Style := smsValue;
  BarSeries1.Marks.Font.Size := 10;
  BarSeries1.Marks.Font.Style := [fsBold];

  // Cores alternadas

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
    // Atualiza os cards com os valores
    LabelValorOriginal.Caption := FormatCurr('R$ #,##0.00', Resumo.ValorOriginalTotal);
    LabelValorAtual.Caption := FormatCurr('R$ #,##0.00', Resumo.ValorAtualTotal);
    LabelValorDepreciado.Caption := FormatCurr('R$ #,##0.00', Resumo.ValorDepreciadoTotal);
    LabelTaxaDepreciacao.Caption := FormatFloat('0.00', Resumo.TaxaDepreciacaoMedia) + '%';
  finally
    Resumo.Free;
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

        // Adiciona a barra
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

procedure TFormDashboard.ComboBoxTipoChange(Sender: TObject);
begin
  case ComboBoxTipo.ItemIndex of
    0: AtualizarGraficoPorPredio;
    1: AtualizarGraficoPorSala;
  end;
end;

end.
