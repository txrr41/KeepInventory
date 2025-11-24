unit DashboardView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.StrUtils,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VCLTee.TeEngine, VCLTee.Series,
  Vcl.ExtCtrls, VCLTee.TeeProcs, VCLTee.Chart, Vcl.StdCtrls,
  DashboardController, DashboardModel, System.Generics.Collections, Vcl.ComCtrls,
  VclTee.TeeGDIPlus, Vcl.WinXPanels, DepreciacaoController, DepreciacaoModel,
  Vcl.Imaging.pngimage, RelatorioDepreciacaoController, DB, RelatorioDepreciacaoItemModel,
  Vcl.Buttons, frxClass, DateUtils, frxDBSet, frxDesgn, frxChart, LogService,
  RelatorioStatusDepreciacaoController, RelatorioMovimentacaoController, PermissoesHelper,
  Vcl.WinXPickers, Vcl.FileCtrl;

type
  TFormDashboard = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    Panel2: TPanel;
    Label1: TLabel;
    Chart1: TChart;
    Series1: TBarSeries;
    ComboBoxTipo: TComboBox;
    Panel7: TPanel;
    Panel8: TPanel;
    PanelRelatorio: TPanel;
    ComboBoxRelatorios: TComboBox;
    Panel11: TPanel;
    Label4: TLabel;
    Panel12: TPanel;
    Label3: TLabel;
    Label5: TLabel;
    DateTimePickerFim: TDateTimePicker;
    DateTimePickerInicio: TDateTimePicker;
    ComboBoxFiltroItem: TComboBox;
    Label6: TLabel;
    Label7: TLabel;
    Image6: TImage;
    Shape2: TShape;
    Shape1: TShape;
    Shape6: TShape;
    Shape7: TShape;
    Shape8: TShape;
    Shape9: TShape;
    LabelValorOriginal: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Shape12: TShape;
    Image1: TImage;
    Image2: TImage;
    LabelValorAtual: TLabel;
    Label10: TLabel;
    Shape10: TShape;
    Image3: TImage;
    Label11: TLabel;
    LabelValorDepreciado: TLabel;
    Label13: TLabel;
    Shape11: TShape;
    Image4: TImage;
    Label12: TLabel;
    LabelTaxaDepreciacao: TLabel;
    ChartDepreciacao: TChart;
    BarSeries1: THorizBarSeries;
    Panel3: TPanel;
    Shape3: TShape;
    Label14: TLabel;
    Label15: TLabel;
    Image5: TImage;
    SpeedButton1: TSpeedButton;
    Label16: TLabel;
    Image7: TImage;
    Image8: TImage;
    Panel4: TPanel;
    Label17: TLabel;
    LabelDataInicio: TLabel;
    Label1DataFim: TLabel;
    ImageDataInicio: TImage;
    ImageDataFim: TImage;
    LabelFiltroPredio: TLabel;
    BtnGerarRelatorio: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Shape4: TShape;
    Shape5: TShape;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComboBoxTipoChange(Sender: TObject);
    procedure BtnGerarRelatorioClick(Sender: TObject);
    procedure ComboBoxRelatoriosChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    FController: TDashboardController;
    FDepreciacaoController: TDepreciacaoController;
    FControllerRela: TRelatorioDepreciacaoController;
    FControllerStatusRela: TRelatorioStatusDepreciacaoController;
    FControllerMovimentacao: TRelatorioMovimentacaoController;
    FDadosRelatorio: TObjectList<TRelatorioDepreciacaoItemModel>;

    procedure ConfigurarGrafico;
    procedure ConfigurarGraficoDepreciacao;
    procedure ConfigurarCards;
    procedure ConfigurarFiltrosPadrao;
    procedure AtualizarGraficoPorPredio;
    procedure AtualizarGraficoPorSala;
    procedure AtualizarResumoDepreciacao;
    procedure AtualizarGraficoDepreciacao;
    procedure CarregarComboTipo;
    procedure CarregarComboItens;
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
  FControllerStatusRela := TRelatorioStatusDepreciacaoController.Create(DataModule2.FDConnection);
  FControllerMovimentacao := TRelatorioMovimentacaoController.Create(DataModule2.FDConnection);
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
  FControllerStatusRela.Free;
  FControllerMovimentacao.Free;
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
  ItemFilter: string;
  DataInicio: TDate;
  DataFim: TDate;
begin

  if not DataModule2.FDConnection.Connected then
  begin
    ShowMessage('Conexão com o banco de dados não está ativa.');
    Exit;
  end;

  try
    // Verifica qual relatório foi selecionado no ComboBox
    if ComboBoxRelatorios.ItemIndex = 0 then
    begin
      // Primeiro relatório (frxReport1) - Relatorio de depreciacao de bens
      TipoSelecionado := '';

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

      DataModule2.frxReport1.ShowReport;
    end
    else if ComboBoxRelatorios.ItemIndex = 1 then
    begin
      // Segundo relatório (frxReport2) - Relatorio de Status de Depreciacao
      try
        MensagemErro := '';
        FControllerStatusRela.PrepararRelatorioFastReport(MensagemErro);

        if MensagemErro <> '' then
        begin
          TLogService.Instance.LogSistema('Erro ao preparar relatório de status: ' + MensagemErro, 'ERRO');
          ShowMessage('Erro ao preparar relatório: ' + MensagemErro);
          Exit;
        end
        else
        begin
          TLogService.Instance.LogRelatorio(
            'Status de Depreciação',
            Format('Período: %s a %s', [
              DateToStr(DateTimePickerInicio.Date),
              DateToStr(DateTimePickerFim.Date)
            ])
          );
        end;

        DataModule2.frxReport2.Variables['DataInicio'] := DateTimePickerInicio.Date;
        DataModule2.frxReport2.Variables['DataFim'] := DateTimePickerFim.Date;
        DataModule2.frxReport2.Variables['TipoRelatorio'] := 'Status de Depreciação';
        DataModule2.frxReport2.Variables['DataEmissao'] := Date;
        DataModule2.frxReport2.Variables['UsuarioEmissao'] := TPermissoesHelper.GetUsuarioLogado.Nome;

        DataModule2.frxReport2.ShowReport;

      except
        on E: Exception do
          ShowMessage('Erro ao gerar segundo relatório: ' + E.Message);
      end;
    end
  else if ComboBoxRelatorios.ItemIndex = 2 then
begin
  // Terceiro relatório - Relatório de Movimentações
  try
    ItemFilter := '';
    DataInicio := 0;
    DataFim := 0;

    // Obter filtro de item
    if Assigned(ComboBoxFiltroItem) and (ComboBoxFiltroItem.ItemIndex > 0) then
    begin
      ItemFilter := ComboBoxFiltroItem.Text;
    end;

    // Obter filtro de datas
    if DateTimePickerInicio.Visible then

      DataInicio := Trunc(DateTimePickerInicio.Date);
    if DateTimePickerFim.Visible then

      DataFim := Trunc(DateTimePickerFim.Date);

    // Validar período se ambas as datas estiverem preenchidas
    if (DataInicio > 0) and (DataFim > 0) and (DataInicio > DataFim) then
    begin
      ShowMessage('A data inicial não pode ser maior que a data final!');
      Exit;
    end;

    // Verificar se existem dados para o filtro aplicado
    if not FControllerMovimentacao.VerificarDadosExistentes(ItemFilter, DataInicio, DataFim) then
    begin
      var Mensagem: string;
      Mensagem := 'Não foram encontradas movimentações';
      if ItemFilter <> '' then
        Mensagem := Mensagem + ' para o item "' + ItemFilter + '"';
      if (DataInicio > 0) or (DataFim > 0) then
        Mensagem := Mensagem + ' no período especificado';
      Mensagem := Mensagem + '.';

      ShowMessage(Mensagem);
      Exit;
    end;

    // ✅ CORREÇÃO: Usar PrepararDatasets em vez de GerarRelatorio
    FControllerMovimentacao.PrepararDatasets(
      DataModule2.FfrxDBDatasetMovimentacao,
      DataModule2.FfrxDBDatasetEstatisticas,
      ItemFilter,
      DataInicio,
      DataFim
    );

    // Configurar variáveis do relatório
    if ItemFilter <> '' then
      DataModule2.frxReport3.Variables['ItemFiltro'] := QuotedStr(ItemFilter)
    else
      DataModule2.frxReport3.Variables['ItemFiltro'] := QuotedStr('Todos os itens');

    DataModule2.frxReport3.Variables['DataInicio'] := DataInicio;
    DataModule2.frxReport3.Variables['DataFim'] := DataFim;
    DataModule2.frxReport3.Variables['DataEmissao'] := Date;
    DataModule2.frxReport3.Variables['UsuarioEmissao'] := TPermissoesHelper.GetUsuarioLogado.Nome;

    // Associar datasets ao relatório
    DataModule2.frxReport3.DataSets.Clear;
    DataModule2.frxReport3.DataSets.Add(DataModule2.FfrxDBDatasetMovimentacao);
    DataModule2.frxReport3.DataSets.Add(DataModule2.FfrxDBDatasetEstatisticas);

    // Mostrar o relatório
    DataModule2.frxReport3.ShowReport;

    // Log do relatório gerado
    TLogService.Instance.LogRelatorio(
      'Movimentações',
      Format('Item: %s | Período: %s a %s', [
        IfThen(ItemFilter = '', 'Todos', ItemFilter),
        IfThen(DataInicio > 0, DateToStr(DataInicio), 'Sem filtro'),
        IfThen(DataFim > 0, DateToStr(DataFim), 'Sem filtro')
      ])
    );

  except
    on E: Exception do
    begin
      ShowMessage('Erro ao gerar relatório de movimentações: ' + E.Message);
      TLogService.Instance.LogSistema('Erro ao gerar relatório de movimentações: ' + E.Message, 'ERRO');
    end;
  end;
end;
  finally

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

procedure TFormDashboard.SpeedButton1Click(Sender: TObject);
begin
PanelRelatorio.Visible := True;
end;

procedure TFormDashboard.SpeedButton2Click(Sender: TObject);
begin
PanelRelatorio.Visible := False;
end;

procedure TFormDashboard.CarregarComboTipo;
var
  Tipos: TStringList;
  I: Integer;
begin
  ComboBoxRelatorios.Items.Clear;
  ComboBoxRelatorios.Items.Add('Relatorio de depreciacao de bens');
  ComboBoxRelatorios.Items.Add('Planejamento de reposição');
  ComboBoxRelatorios.Items.Add('Relatório de Movimentações');

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

procedure TFormDashboard.ComboBoxRelatoriosChange(Sender: TObject);
begin
  // Controle de visibilidade das datas e suas labels/ícones
  case ComboBoxRelatorios.ItemIndex of
    0: // Relatorio de depreciacao de bens
    begin
      // Esconder ComboBox de itens e sua label
      if Assigned(ComboBoxFiltroItem) then
        ComboBoxFiltroItem.Visible := False;
      LabelFiltroPredio.Visible := False;

      // Mostrar datas
      DateTimePickerInicio.Visible := True;
      DateTimePickerFim.Visible := True;
      LabelDataInicio.Visible := True;
      Label1DataFim.Visible := True;
      ImageDataInicio.Visible := True;
      ImageDataFim.Visible := True;
    end;

    1: // Planejamento de reposição
    begin
      // Esconder datas e labels/ícones
      DateTimePickerInicio.Visible := False;
      DateTimePickerFim.Visible := False;
      LabelDataInicio.Visible := False;
      Label1DataFim.Visible := False;
      ImageDataInicio.Visible := False;
      ImageDataFim.Visible := False;

      // Esconder ComboBox de itens e sua label
      if Assigned(ComboBoxFiltroItem) then
        ComboBoxFiltroItem.Visible := False;
      LabelFiltroPredio.Visible := False;
    end;

    2: // Relatório de Movimentações
    begin
      // Mostrar datas e labels/ícones
      DateTimePickerInicio.Visible := True;
      DateTimePickerFim.Visible := True;
      LabelDataInicio.Visible := True;
      Label1DataFim.Visible := True;
      ImageDataInicio.Visible := True;
      ImageDataFim.Visible := True;

      // Criar ComboBox de itens se ainda não existir
      if not Assigned(ComboBoxFiltroItem) then
      begin
        ComboBoxFiltroItem := TComboBox.Create(Self);
        ComboBoxFiltroItem.Parent := PanelRelatorio;
        ComboBoxFiltroItem.Left := 32;
        ComboBoxFiltroItem.Top := 211;
        ComboBoxFiltroItem.Width := 225;
        ComboBoxFiltroItem.Height := 23;
        ComboBoxFiltroItem.Style := csDropDownList;
        ComboBoxFiltroItem.TabOrder := 5;
      end;

      // Sempre carregar os dados quando o relatório de movimentações for selecionado
      ComboBoxFiltroItem.Visible := True;
      LabelFiltroPredio.Visible := True;
      LabelFiltroPredio.Caption := 'Filtrar por Item (Opcional)';

      // Carregar os dados do combo box
      CarregarComboItens;
    end;
  end;
end;

procedure TFormDashboard.CarregarComboItens;
var
  ItemsList: TStringList;
begin
  if not Assigned(ComboBoxFiltroItem) then
    Exit;

  ComboBoxFiltroItem.Items.Clear;

  try
    // Verificar se a conexão está ativa
    if not DataModule2.FDConnection.Connected then
    begin
      ComboBoxFiltroItem.Items.Add('Sem conexão com BD');
      ComboBoxFiltroItem.ItemIndex := 0;
      Exit;
    end;

    if Assigned(FControllerMovimentacao) then
    begin
      try
        ItemsList := FControllerMovimentacao.CarregarItens;
        try
          if Assigned(ItemsList) and (ItemsList.Count > 0) then
          begin
            ComboBoxFiltroItem.Items.AddStrings(ItemsList);
            ComboBoxFiltroItem.ItemIndex := 0;

            // Log para debug (remover depois se quiser)
            TLogService.Instance.LogSistema('ComboBox de itens carregado: ' + IntToStr(ItemsList.Count) + ' itens', 'DEBUG');
          end
          else
          begin
            ComboBoxFiltroItem.Items.Add('Nenhum item encontrado');
            ComboBoxFiltroItem.ItemIndex := 0;
            end;
        finally
          ItemsList.Free;
        end;
      except
        on E: Exception do
        begin
          TLogService.Instance.LogSistema('Erro ao carregar itens do controller: ' + E.Message, 'ERRO');
          ComboBoxFiltroItem.Items.Add('Erro ao carregar');
          ComboBoxFiltroItem.ItemIndex := 0;
        end;
      end;
    end
    else
    begin
      ComboBoxFiltroItem.Items.Add('Controller não inicializado');
      ComboBoxFiltroItem.ItemIndex := 0;
    end;

  except
    on E: Exception do
    begin
      TLogService.Instance.LogSistema('Erro geral ao carregar itens: ' + E.Message, 'ERRO');

      if ComboBoxFiltroItem.Items.Count = 0 then
      begin
        ComboBoxFiltroItem.Items.Add('Todos');
        ComboBoxFiltroItem.ItemIndex := 0;
      end;
    end;
  end;
end;
end.
