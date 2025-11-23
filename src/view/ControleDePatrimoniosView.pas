unit ControleDePatrimoniosView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.Imaging.pngimage, Vcl.StdCtrls, Vcl.WinXCtrls, Vcl.Buttons, Data.DB,
  Vcl.Grids, Vcl.DBGrids, ControlePatrimonioDTO, ControleDePatrimoniosController,
  FireDAC.Comp.Client, DB, Vcl.Themes, Vcl.Styles;

type
  TFormControlePatrimonio = class(TForm)
    Panel1: TPanel;
    Shape1: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    Shape8: TShape;
    Shape9: TShape;
    Shape10: TShape;
    PanelFiltro: TPanel;
    SearchBox1: TSearchBox;
    Panel2: TPanel;
    Shape11: TShape;
    Label1: TLabel;
    Image1: TImage;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel8: TPanel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    ComboBox2: TComboBox;
    Label2: TLabel;
    Image2: TImage;
    ComboBox3: TComboBox;
    Label3: TLabel;
    Image3: TImage;
    Label4: TLabel;
    Image4: TImage;
    Label5: TLabel;
    Image5: TImage;
    BtnFiltro: TSpeedButton;
    Label6: TLabel;
    Label7: TLabel;
    Image6: TImage;
    LabelTotalItens: TLabel;
    Label9: TLabel;
    Label8: TLabel;
    LabelValorTotal: TLabel;
    Shape12: TShape;
    Image7: TImage;
    Label10: TLabel;
    LabelPatrimoniosAtivos: TLabel;
    Shape13: TShape;
    Image8: TImage;
    Label11: TLabel;
    LabelEmManutencao: TLabel;
    Shape14: TShape;
    Image9: TImage;
    Label12: TLabel;
    LabelOcorrencias: TLabel;
    Shape15: TShape;
    Image10: TImage;
    Panel3: TPanel;
    DBGridAnalisePatrimonio: TDBGrid;
    DSControlePatrimonio: TDataSource;
    Shape2: TShape;
    procedure BtnFiltroClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure DateTimePicker2Change(Sender: TObject);
     procedure SearchBox1InvokeSearch(Sender: TObject);
  private
    { Private declarations }
    FController: TControleDePatrimoniosController;
    FQueryDados: TFDQuery;
    procedure CarregarDados;
    procedure AplicarFiltros;
    procedure LimparFiltros;
    procedure DBGridAnalisePatrimonioDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);

  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  FormControlePatrimonio: TFormControlePatrimonio;

implementation

{$R *.dfm}

{ TFormControlePatrimonio }

constructor TFormControlePatrimonio.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FController := TControleDePatrimoniosController.Create;
  FQueryDados := TFDQuery.Create(nil);
end;

destructor TFormControlePatrimonio.Destroy;
begin
  FreeAndNil(FQueryDados);
  FreeAndNil(FController);
  inherited;
end;

procedure TFormControlePatrimonio.FormCreate(Sender: TObject);
begin
  Caption := 'Controle de Patrimônios';
end;

procedure TFormControlePatrimonio.FormDestroy(Sender: TObject);
begin
  if Assigned(DSControlePatrimonio.DataSet) then
    DSControlePatrimonio.DataSet := nil;
end;

procedure TFormControlePatrimonio.FormShow(Sender: TObject);
begin
  // Configurar conexão
  FQueryDados.Connection := DataModule2.FDConnection;

  // ✅ Configurar datas padrão (data atual)
  DateTimePicker1.Date := Date;
  DateTimePicker2.Date := Date;

  // Carregar combos
  FController.CarregarPredios(ComboBox3);
  FController.CarregarSalas(ComboBox2);

  // Carregar dados
  CarregarDados;
end;

procedure TFormControlePatrimonio.CarregarDados;
var
  Filtro: TControlePatrimonioFiltroDTO;
begin
  try
    // Inicializar filtro vazio
    Filtro.DataInicio := 0;
    Filtro.DataFim := 0;
    Filtro.IdPredio := 0;
    Filtro.IdSala := 0;
    Filtro.TextoBusca := '';

    // Atualizar estatísticas
    FController.AtualizarEstatisticas(
      LabelTotalItens,
      LabelValorTotal,
      LabelPatrimoniosAtivos,
      LabelEmManutencao,
      LabelOcorrencias
    );

    // ✅ Desconectar DataSource
    DSControlePatrimonio.DataSet := nil;

    // Carregar dados
    FController.CarregarDadosGrid(FQueryDados, Filtro);

    // Verificar se retornou dados
    if FQueryDados.IsEmpty then
    begin
      ShowMessage('Nenhum patrimônio encontrado no banco de dados.');
      Exit;
    end;

    // Conectar ao DataSource
    DSControlePatrimonio.DataSet := FQueryDados;

    // ✅ Configurar colunas SOMENTE SE necessário
  

    // Configurar aparência do DBGrid - Versão compatível
    DBGridAnalisePatrimonio.TitleFont.Style := [fsBold];
    DBGridAnalisePatrimonio.TitleFont.Color := clBlack;
    DBGridAnalisePatrimonio.BorderStyle := bsSingle;

    // Configurar opções de seleção
    DBGridAnalisePatrimonio.Options := DBGridAnalisePatrimonio.Options + [dgRowSelect, dgAlwaysShowSelection];
    DBGridAnalisePatrimonio.Color := clWhite; // Branco para linhas normais

    // Atribuir evento de desenho personalizado para zebrado e seleção
    DBGridAnalisePatrimonio.OnDrawColumnCell := DBGridAnalisePatrimonioDrawColumnCell;

    // Forçar refresh
    DBGridAnalisePatrimonio.Refresh;

  except
    on E: Exception do
    begin
      ShowMessage('ERRO em CarregarDados: ' + E.Message);
    end;
  end;
end;

procedure TFormControlePatrimonio.AplicarFiltros;
var
  Filtro: TControlePatrimonioFiltroDTO;
  IdPredioSelecionado, IdSalaSelecionado: Integer;
begin
  try
    // Desconectar temporariamente
    DBGridAnalisePatrimonio.DataSource := nil;

    // ✅ Inicializar tudo com zero
    Filtro.TextoBusca := '';
    Filtro.DataInicio := 0;
    Filtro.DataFim := 0;
    Filtro.IdPredio := 0;
    Filtro.IdSala := 0;

    // Texto de busca
    if Trim(SearchBox1.Text) <> '' then
      Filtro.TextoBusca := Trim(SearchBox1.Text);

    // ✅ CORREÇÃO: Só usar datas se o painel de filtros estiver expandido
    // E se as datas forem diferentes da data atual (indicando que o usuário mudou)
    if (PanelFiltro.Height > 100) then  // Filtros avançados visíveis
    begin
      if (DateTimePicker1.Date <> Date) or (DateTimePicker2.Date <> Date) then
      begin
        Filtro.DataInicio := Trunc(DateTimePicker1.Date);
        Filtro.DataFim := Trunc(DateTimePicker2.Date);
      end;
    end;

    // Filtro de Prédio
    if ComboBox3.ItemIndex > 0 then
    begin
      IdPredioSelecionado := FController.ExtrairIdDoItem(ComboBox3.Text);
      Filtro.IdPredio := IdPredioSelecionado;
    end;

    // Filtro de Sala
    if ComboBox2.ItemIndex > 0 then
    begin
      IdSalaSelecionado := FController.ExtrairIdDoItem(ComboBox2.Text);
      Filtro.IdSala := IdSalaSelecionado;
    end;

    // Carregar dados com filtro - usa método direto para evitar problemas de parâmetro
    FController.CarregarDadosParaQuery(FQueryDados, Filtro);

    // Reconectar
    DBGridAnalisePatrimonio.DataSource := DSControlePatrimonio;
    DSControlePatrimonio.DataSet := FQueryDados;

    // Mensagem se não encontrou resultados
    if Assigned(FQueryDados) and FQueryDados.IsEmpty then
    begin
      if Filtro.IdSala > 0 then
        ShowMessage('Não foram encontrados patrimônios para a sala selecionada.')
      else if Filtro.IdPredio > 0 then
        ShowMessage('Não foram encontrados patrimônios para o prédio selecionado.')
      else if Filtro.TextoBusca <> '' then
        ShowMessage('Nenhum patrimônio encontrado com o termo: "' + Filtro.TextoBusca + '"')
      else
        ShowMessage('Nenhum patrimônio encontrado com os filtros aplicados.');
    end;

  except
    on E: Exception do
    begin
      ShowMessage('Erro ao aplicar filtros: ' + E.Message);
      DBGridAnalisePatrimonio.DataSource := DSControlePatrimonio;
    end;
  end;
end;

procedure TFormControlePatrimonio.LimparFiltros;
begin
  SearchBox1.Text := '';
  DateTimePicker1.Date := Date;
  DateTimePicker2.Date := Date;
  ComboBox3.ItemIndex := 0;
  ComboBox2.ItemIndex := 0;
  CarregarDados;
end;

procedure TFormControlePatrimonio.BtnFiltroClick(Sender: TObject);
begin
  if PanelFiltro.Height = 65 then
    PanelFiltro.Height := 161
  else if PanelFiltro.Height = 161 then
    PanelFiltro.Height := 65;
end;

procedure TFormControlePatrimonio.SearchBox1InvokeSearch(Sender: TObject);
begin
  AplicarFiltros;
end;

procedure TFormControlePatrimonio.ComboBox3Change(Sender: TObject);
var
  IdPredio: Integer;
begin
  IdPredio := FController.ExtrairIdDoItem(ComboBox3.Text);
  if ComboBox3.ItemIndex > 0 then
    FController.CarregarSalas(ComboBox2, IdPredio)
  else
    FController.CarregarSalas(ComboBox2, 0);

  AplicarFiltros;
end;

procedure TFormControlePatrimonio.ComboBox2Change(Sender: TObject);
begin
  AplicarFiltros;
end;

procedure TFormControlePatrimonio.DateTimePicker1Change(Sender: TObject);
begin
  if DateTimePicker1.Date > DateTimePicker2.Date then
    DateTimePicker2.Date := DateTimePicker1.Date;
  AplicarFiltros;
end;

procedure TFormControlePatrimonio.DateTimePicker2Change(Sender: TObject);
begin
  if DateTimePicker2.Date < DateTimePicker1.Date then
    DateTimePicker1.Date := DateTimePicker2.Date;
  AplicarFiltros;
end;

procedure TFormControlePatrimonio.DBGridAnalisePatrimonioDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  // Configurar zebrado para linhas não selecionadas
  if gdSelected in State then
  begin
    // Cor para linha selecionada - azul claro
    TDBGrid(Sender).Canvas.Brush.Color := RGB(230, 243, 255);
    TDBGrid(Sender).Canvas.Font.Color := clBlack;
  end
  else
  begin
    // Zebrado para linhas normais
    if Odd(TDBGrid(Sender).DataSource.DataSet.RecNo) then
      TDBGrid(Sender).Canvas.Brush.Color := RGB(248, 248, 248) // Cinza muito claro
    else
      TDBGrid(Sender).Canvas.Brush.Color := clWhite;
  end;

  // Preencher o fundo
  TDBGrid(Sender).Canvas.FillRect(Rect);

  // Desenhar o texto da célula
  TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.
