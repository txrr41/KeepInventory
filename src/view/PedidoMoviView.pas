unit PedidoMoviView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.WinXCtrls, Vcl.WinXCalendars,
  Vcl.Buttons, Vcl.NumberBox, PedidoMoviCOntroller, MovimentacaoDTO, LoginModel,
  FireDAC.Comp.Client, FireDAC.Stan.Param, GlobalUserDTO;

type
  TFormPedidoMovi = class(TForm)
    PanelMoviment: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    SearchBox1: TSearchBox;
    Panel6: TPanel;
    Label4: TLabel;
    Panel7: TPanel;
    Label5: TLabel;
    CalendarPicker1: TCalendarPicker;
    CalendarPicker2: TCalendarPicker;
    Shape1: TShape;
    Panel5: TPanel;
    SpeedButton1: TSpeedButton;
    Shape2: TShape;
    BtnLimparFIltroMovi: TSpeedButton;
    PanelAddMovi: TPanel;
    CbItemMovi: TComboBox;
    Label10: TLabel;
    Label11: TLabel;
    CbDestinoMovi: TComboBox;
    CbOrigemMovi: TComboBox;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Label14: TLabel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel9: TPanel;
    Shape3: TShape;
    Label6: TLabel;
    BtnAdicionarMovi: TSpeedButton;
    Panel10: TPanel;
    Shape4: TShape;
    Label7: TLabel;
    BtnEditarMovi: TSpeedButton;
    Panel11: TPanel;
    Shape5: TShape;
    Label8: TLabel;
    BtnExcluirMovi: TSpeedButton;
    Panel12: TPanel;
    Shape6: TShape;
    Label9: TLabel;
    BtnAtualizarMovi: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure BtnAdicionarMoviClick(Sender: TObject);
    procedure BtnEditarMoviClick(Sender: TObject);
    procedure BtnExcluirMoviClick(Sender: TObject);
    procedure BtnAtualizarMoviClick(Sender: TObject);
    procedure SearchBox1Change(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure BtnLimparFIltroMoviClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CbItemMoviChange(Sender: TObject);
  private
    FPedidoMoviController: TPedidoMoviController;
    FIdMovimentacaoSelecionada: Integer;
    function ExtrairID(const ATexto: String): Integer;
    procedure CarregarGrid;
    procedure LimparCampos;
    procedure ConfigurarGrid;
    procedure PreencherCamposComGrid;
    function ValidarCampos: Boolean;
    function ObterIdDoComboBox(AComboBox: TComboBox): Integer;
    procedure PopularComboBox;
  public
    { Public declarations }
  end;

var
  FormPedidoMovi: TFormPedidoMovi;

implementation

{$R *.dfm}

procedure TFormPedidoMovi.FormCreate(Sender: TObject);

begin
  FPedidoMoviController := TPedidoMoviController.Create;
  FIdMovimentacaoSelecionada := 0;
  CarregarGrid;
  LimparCampos;
end;

procedure TFormPedidoMovi.FormDestroy(Sender: TObject);
begin
  if Assigned(DataSource1.DataSet) then
    DataSource1.DataSet.Free;

  FPedidoMoviController.Free;
end;

procedure TFormPedidoMovi.FormShow(Sender: TObject);
begin
CarregarGrid;
end;

procedure TFormPedidoMovi.CarregarGrid;
begin
  try
    DataSource1.DataSet := FPedidoMoviController.ListarMovimentacoes;
    DbGrid1.DataSource := DataSource1;

    DBGrid1.Columns[0].Font.Size := 11;
    DBGrid1.Columns[1].Font.Size := 11;
    DBGrid1.Columns[2].Font.Size := 11;
    DBGrid1.Columns[3].Font.Size := 11;
    DBGrid1.Columns[4].Font.Size := 11;
    DBGrid1.Columns[5].Font.Size := 11;

  except
    on E: Exception do
      ShowMessage('Erro ao carregar movimentações: ' + E.Message);
  end;
end;

procedure TFormPedidoMovi.CbItemMoviChange(Sender: TObject);
var
  IdPatrimonio: Integer;
begin
  if CbItemMovi.ItemIndex = -1 then Exit;

  IdPatrimonio := Integer(CbItemMovi.Items.Objects[CbItemMovi.ItemIndex]);

  // Origem: sala atual do item

  FPedidoMoviController.PopularComboBoxSalasDoPatrimonio(CbOrigemMovi, IdPatrimonio);

  // Destino: todas as salas possíveis
  FPedidoMoviController.PopularComboBoxSalas(CbDestinoMovi);
  end;



procedure TFormPedidoMovi.ConfigurarGrid;
begin
end;


procedure TFormPedidoMovi.LimparCampos;
begin
  CbItemMovi.ItemIndex := -1;
  CbOrigemMovi.ItemIndex := -1;
  CbDestinoMovi.ItemIndex := -1;
  FIdMovimentacaoSelecionada := 0;

  BtnAdicionarMovi.Enabled := True;
  BtnEditarMovi.Enabled := False;
  BtnExcluirMovi.Enabled := False;
end;

function TFormPedidoMovi.ValidarCampos: Boolean;
var
IdOrigem: Integer;
IdDestino: Integer;
begin
  Result := True;

  if CbItemMovi.ItemIndex = -1 then
  begin
    ShowMessage('Selecione um patrimônio!');
    CbItemMovi.SetFocus;
    Result := False;
    Exit;
  end;

  if CbOrigemMovi.ItemIndex = -1 then
  begin
    ShowMessage('Selecione a sala de origem!');
    CbOrigemMovi.SetFocus;
    Result := False;
    Exit;
  end;

  if CbDestinoMovi.ItemIndex = -1 then
  begin
    ShowMessage('Selecione a sala de destino!');
    CbDestinoMovi.SetFocus;
    Result := False;
    Exit;
  end;

  IdOrigem := ObterIdDoComboBox(CbOrigemMovi);
  IdDestino := ObterIdDoComboBox(CbDestinoMovi);

  if IdOrigem = IdDestino then
  begin
    ShowMessage('A sala de origem não pode ser igual à sala de destino!');
    CbDestinoMovi.SetFocus;
    Result := False;
    Exit;
  end;
end;

function TFormPedidoMovi.ObterIdDoComboBox(AComboBox: TComboBox): Integer;
begin
  Result := 0;
  if (AComboBox.ItemIndex >= 0) and (AComboBox.ItemIndex < AComboBox.Items.Count) then
    Result := Integer(AComboBox.Items.Objects[AComboBox.ItemIndex]);
end;

procedure TFormPedidoMovi.BtnAdicionarMoviClick(Sender: TObject);
begin
  if PanelAddMovi.Visible = False then
  begin
    PanelAddMovi.Visible := True;
    Button1.Visible := True;
    PopularComboBox;
  end
  else
    PanelAddMovi.Visible := False;
end;

procedure TFormPedidoMovi.BtnEditarMoviClick(Sender: TObject);
begin
    PanelAddMovi.Visible := True;
    Button2.Visible := True;
    CbItemMovi.Text := DBGrid1.DataSource.DataSet.FieldByName('fk_id_patrimonios').AsString;
    CbDestinoMovi.Text := DBGrid1.DataSource.DataSet.FieldByName('fk_id_destino').AsString;
    CbOrigemMovi.Text := DBGrid1.DataSource.DataSet.FieldByName('fk_id_origem').AsString;
    PopularComboBox;
end;


procedure TFormPedidoMovi.BtnExcluirMoviClick(Sender: TObject);
begin
  if FIdMovimentacaoSelecionada = 0 then
  begin
    ShowMessage('Selecione uma movimentação para excluir!');
    Exit;
  end;

  if MessageDlg('Deseja realmente excluir esta movimentação?',
     mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    Exit;

  try
    FPedidoMoviController.ExcluirMovimentacao(FIdMovimentacaoSelecionada);
    ShowMessage('Movimentação excluída com sucesso!');
    CarregarGrid;
    LimparCampos;
  except
    on E: Exception do
      ShowMessage('Erro ao excluir movimentação: ' + E.Message);
  end;
end;

procedure TFormPedidoMovi.BtnAtualizarMoviClick(Sender: TObject);
begin
  CarregarGrid;
  LimparCampos;
  ShowMessage('Grid atualizado!');
end;

procedure TFormPedidoMovi.SearchBox1Change(Sender: TObject);
var
  DataSet: TDataSet;
begin
  try
    if Assigned(DataSource1.DataSet) then
    begin
      DataSource1.DataSet.Close;
      DataSource1.DataSet.Free;
    end;

    if Trim(SearchBox1.Text) = '' then
      DataSet := FPedidoMoviController.ListarMovimentacoes
    else
      DataSet := FPedidoMoviController.PesquisarMovimentacao(SearchBox1.Text);

    DataSource1.DataSet := DataSet;
  except
    on E: Exception do
      ShowMessage('Erro ao pesquisar: ' + E.Message);
  end;
end;

procedure TFormPedidoMovi.DBGrid1CellClick(Column: TColumn);
begin
  if not Assigned(DataSource1.DataSet) or DataSource1.DataSet.IsEmpty then
    Exit;

  try
    FIdMovimentacaoSelecionada := DataSource1.DataSet.FieldByName('id').AsInteger;

    // Preencher campos com dados do grid
    PreencherCamposComGrid;

    // Habilitar botões
    BtnAdicionarMovi.Enabled := False;
    BtnEditarMovi.Enabled := True;
    BtnExcluirMovi.Enabled := True;
  except
    on E: Exception do
      ShowMessage('Erro ao selecionar movimentação: ' + E.Message);
  end;
end;

function TFormPedidoMovi.ExtrairID(const ATexto: String): Integer;
var
  Posicao: Integer;
  IdStr: String;
begin
  // Assumindo formato "ID|Nome" no ComboBox
  Posicao := Pos('|', ATexto);
  if Posicao > 0 then
  begin
    IdStr := Copy(ATexto, 1, Posicao - 1);
    Result := StrToIntDef(IdStr, 0);
  end
  else
    Result := 0;
end;


procedure TFormPedidoMovi.PopularComboBox;
begin
 FPedidoMoviController.PopularComboBoxPatrimonios(CbItemMovi);
 FPedidoMoviController.PopularComboBoxSalas(CbOrigemMovi);
 FPedidoMoviController.PopularComboBoxSalas(CbDestinoMovi);
end;

procedure TFormPedidoMovi.PreencherCamposComGrid;
begin
end;

procedure TFormPedidoMovi.BtnLimparFIltroMoviClick(Sender: TObject);
begin
  SearchBox1.Text := '';
  CalendarPicker1.Date := 0;
  CalendarPicker2.Date := 0;
  CarregarGrid;
  LimparCampos;
end;

procedure TFormPedidoMovi.Button1Click(Sender: TObject);
var
  MovimentacaoDTO: TMovimentacaoDTO;
begin
  if not ValidarCampos then
    Exit;

  try
    MovimentacaoDTO.FId := 0;
    MovimentacaoDTO.FIdPatrimonio := Integer(CbItemMovi.Items.Objects[cbItemMovi.ItemIndex]);;
    MovimentacaoDTO.FIdOrigem := Integer(CbOrigemMovi.Items.Objects[CbOrigemMovi.ItemIndex]);
    MovimentacaoDTO.FIdDestino := ObterIdDoComboBox(CbDestinoMovi);
    MovimentacaoDTO.FIdUsuario := TGlobal.FUserID;
    MovimentacaoDTO.FDataMovimentacao := Now;

    FPedidoMoviController.AdicionarMovimentacao(MovimentacaoDTO);

    ShowMessage('Movimentação cadastrada com sucesso!');
    CarregarGrid;
    LimparCampos;
  except
    on E: Exception do
      ShowMessage('Erro ao adicionar movimentação: ' + E.Message);
  end;
end;
procedure TFormPedidoMovi.Button2Click(Sender: TObject);
var
  MovimentacaoDTO: TMovimentacaoDTO;
begin
  if FIdMovimentacaoSelecionada = 0 then
  begin
    ShowMessage('Selecione uma movimentação para editar!');
    Exit;
  end;

  if not ValidarCampos then
    Exit;

  if MessageDlg('Deseja realmente editar esta movimentação?',
     mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    Exit;

  try
    MovimentacaoDTO.FId := FIdMovimentacaoSelecionada;
    MovimentacaoDTO.FIdPatrimonio := ObterIdDoComboBox(CbItemMovi);
    MovimentacaoDTO.FIdOrigem := ObterIdDoComboBox(CbOrigemMovi);
    MovimentacaoDTO.FIdDestino := ObterIdDoComboBox(CbDestinoMovi);
    MovimentacaoDTO.FIdUsuario := TGlobal.FUserID;
    MovimentacaoDTO.FDataMovimentacao := Now;

    FPedidoMoviController.EditarMovimentacao(MovimentacaoDTO);

    ShowMessage('Movimentação atualizada com sucesso!');
    CarregarGrid;
    LimparCampos;
  except
    on E: Exception do
      ShowMessage('Erro ao editar movimentação: ' + E.Message);
  end;
end;

end.
