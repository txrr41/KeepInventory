unit DashboardView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VCLTee.TeEngine, VCLTee.Series,
  Vcl.ExtCtrls, VCLTee.TeeProcs, VCLTee.Chart, Vcl.StdCtrls,
  DashboardController, DashboardModel, System.Generics.Collections, Vcl.ComCtrls;

type
  TFormDashboard = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label2: TLabel;
    Panel2: TPanel;
    Label1: TLabel;
    Chart1: TChart;
    Series1: TBarSeries;
    ComboBoxTipo: TComboBox;
    Panel3: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComboBoxTipoChange(Sender: TObject);
  private
    FController: TDashboardController;
    procedure ConfigurarGrafico;
    procedure AtualizarGraficoPorPredio;
    procedure AtualizarGraficoPorSala;
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
end;

procedure TFormDashboard.FormDestroy(Sender: TObject);
begin
  FController.Free;
end;

procedure TFormDashboard.FormShow(Sender: TObject);
begin
  // Configura o ComboBox
  ComboBoxTipo.Items.Clear;
  ComboBoxTipo.Items.Add('Por Prédio');
  ComboBoxTipo.Items.Add('Por Sala');
  ComboBoxTipo.ItemIndex := 0;

  ConfigurarGrafico;
  AtualizarGraficoPorPredio;
end;

procedure TFormDashboard.ConfigurarGrafico;
begin
  // Configurações gerais do gráfico
  Chart1.Title.Text.Clear;
  Chart1.Title.Text.Add('Patrimônios por Localização');
  Chart1.Title.Font.Size := 14;
  Chart1.Title.Font.Style := [fsBold];

  // Configurações da série
  Series1.Clear;
  Series1.Marks.Visible := True;
  Series1.Marks.Style := smsValue;

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
