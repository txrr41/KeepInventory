unit ControleDePatrimoniosView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.Imaging.pngimage, Vcl.StdCtrls, Vcl.WinXCtrls, Vcl.Buttons, Data.DB,
  Vcl.Grids, Vcl.DBGrids, ControlePatrimonioDTO, ControleDePatrimoniosController,
  FireDAC.Comp.Client, DB;

type
  TFormControlePatrimonio = class(TForm)
    Panel1: TPanel;
    Shape1: TShape;
    Shape2: TShape;
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
  FQueryDados.Connection := DataModule2.FDConnection;
  DSControlePatrimonio.DataSet := nil; // Será configurado no CarregarDados

  FController.CarregarPredios(ComboBox3);
  FController.CarregarSalas(ComboBox2);
  CarregarDados;

  SearchBox1.OnInvokeSearch := SearchBox1InvokeSearch;
  ComboBox3.OnChange := ComboBox3Change;
  ComboBox2.OnChange := ComboBox2Change;
  DateTimePicker1.OnChange := DateTimePicker1Change;
  DateTimePicker2.OnChange := DateTimePicker2Change;
end;

procedure TFormControlePatrimonio.CarregarDados;
var
  Filtro: TControlePatrimonioFiltroDTO;
begin
  Filtro.DataInicio := 0;
  Filtro.DataFim := 0;
  Filtro.IdPredio := 0;
  Filtro.IdSala := 0;
  Filtro.TextoBusca := '';

  FController.AtualizarEstatisticas(
    LabelTotalItens,
    LabelValorTotal,
    LabelPatrimoniosAtivos,
    LabelEmManutencao,
    LabelOcorrencias
  );

  FController.CarregarDadosGrid(FQueryDados, Filtro);
  DSControlePatrimonio.DataSet := FQueryDados;

  if Assigned(DSControlePatrimonio.DataSet) and not DSControlePatrimonio.DataSet.IsEmpty then
  begin
    DBGridAnalisePatrimonio.Columns.Clear;

    // Adiciona colunas apenas se os campos existirem no DataSet
    if DSControlePatrimonio.DataSet.FindField('id') <> nil then
      with DBGridAnalisePatrimonio.Columns.Add do
      begin
        FieldName := 'id';
        Title.Caption := 'ID';
        Width := 50;
      end;

    if DSControlePatrimonio.DataSet.FindField('nome') <> nil then
      with DBGridAnalisePatrimonio.Columns.Add do
      begin
        FieldName := 'nome';
        Title.Caption := 'Nome';
        Width := 150;
      end;

    if DSControlePatrimonio.DataSet.FindField('tipo') <> nil then
      with DBGridAnalisePatrimonio.Columns.Add do
      begin
        FieldName := 'tipo';
        Title.Caption := 'Tipo';
        Width := 100;
      end;

    if DSControlePatrimonio.DataSet.FindField('situacao') <> nil then
      with DBGridAnalisePatrimonio.Columns.Add do
      begin
        FieldName := 'situacao';
        Title.Caption := 'Situação';
        Width := 80;
      end;

    if DSControlePatrimonio.DataSet.FindField('modelo') <> nil then
      with DBGridAnalisePatrimonio.Columns.Add do
      begin
        FieldName := 'modelo';
        Title.Caption := 'Modelo';
        Width := 120;
      end;

    if DSControlePatrimonio.DataSet.FindField('valor_atual') <> nil then
      with DBGridAnalisePatrimonio.Columns.Add do
      begin
        FieldName := 'valor_atual';
        Title.Caption := 'Valor Atual';
        Width := 80;
        if Assigned(Field) and (Field is TCurrencyField) then
          TCurrencyField(Field).DisplayFormat := 'R$ #,##0.00';
      end;

    if DSControlePatrimonio.DataSet.FindField('numero_serie') <> nil then
      with DBGridAnalisePatrimonio.Columns.Add do
      begin
        FieldName := 'numero_serie';
        Title.Caption := 'Número de Série';
        Width := 120;
      end;

    if DSControlePatrimonio.DataSet.FindField('data_aquisicao') <> nil then
      with DBGridAnalisePatrimonio.Columns.Add do
      begin
        FieldName := 'data_aquisicao';
        Title.Caption := 'Data Aquisição';
        Width := 90;
      end;

    if DSControlePatrimonio.DataSet.FindField('nome_predio') <> nil then
      with DBGridAnalisePatrimonio.Columns.Add do
      begin
        FieldName := 'nome_predio';
        Title.Caption := 'Prédio';
        Width := 100;
      end;

    if DSControlePatrimonio.DataSet.FindField('nome_sala') <> nil then
      with DBGridAnalisePatrimonio.Columns.Add do
      begin
        FieldName := 'nome_sala';
        Title.Caption := 'Sala';
        Width := 100;
      end;

    if DSControlePatrimonio.DataSet.FindField('ultima_movimentacao') <> nil then
      with DBGridAnalisePatrimonio.Columns.Add do
      begin
        FieldName := 'ultima_movimentacao';
        Title.Caption := 'Última Movimentação';
        Width := 100;
      end;

    if DSControlePatrimonio.DataSet.FindField('total_ocorrencias') <> nil then
      with DBGridAnalisePatrimonio.Columns.Add do
      begin
        FieldName := 'total_ocorrencias';
        Title.Caption := 'Ocorrências';
        Width := 60;
      end;
  end;
end;

procedure TFormControlePatrimonio.AplicarFiltros;
var
  Filtro: TControlePatrimonioFiltroDTO;
  IdPredioSelecionado, IdSalaSelecionado: Integer;
begin
  Filtro.TextoBusca := SearchBox1.Text;
  Filtro.DataInicio := DateTimePicker1.Date;
  Filtro.DataFim := DateTimePicker2.Date;

  IdPredioSelecionado := FController.ExtrairIdDoItem(ComboBox3.Text);
  if ComboBox3.ItemIndex > 0 then
    Filtro.IdPredio := IdPredioSelecionado
  else
    Filtro.IdPredio := 0;

  IdSalaSelecionado := FController.ExtrairIdDoItem(ComboBox2.Text);
  if ComboBox2.ItemIndex > 0 then
    Filtro.IdSala := IdSalaSelecionado
  else
    Filtro.IdSala := 0;

  FController.CarregarDadosGrid(FQueryDados, Filtro);
  DSControlePatrimonio.DataSet := FQueryDados;

  if Assigned(FQueryDados) and FQueryDados.IsEmpty and (Filtro.IdSala > 0) then
    ShowMessage('Não foram encontrados patrimônios para a sala selecionada.');
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

end.
