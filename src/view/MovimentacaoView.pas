unit MovimentacaoView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.WinXCtrls, Vcl.WinXCalendars,
  Vcl.Buttons, Vcl.NumberBox, MovimentacaoController, MovimentacaoDTO, LoginModel,
  FireDAC.Comp.Client, FireDAC.Stan.Param, GlobalUserDTO;

type
  TFormMovimentacoes = class(TForm)
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
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    SpeedButton1: TSpeedButton;
    Shape2: TShape;
    BtnLimparFIltroMovi: TSpeedButton;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Shape3: TShape;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    PanelAddMovi: TPanel;
    CbItemMovi: TComboBox;
    Label10: TLabel;
    Label11: TLabel;
    CbStatusMovi: TComboBox;
    Label13: TLabel;
    BtnAdicionarMovi: TSpeedButton;
    BtnEditarMovi: TSpeedButton;
    BtnExcluirMovi: TSpeedButton;
    BtnAtualizarMovi: TSpeedButton;
    CbDestinoMovi: TComboBox;
    CbOrigemMovi: TComboBox;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Label14: TLabel;
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
  private
    FMovimentacaoController: TMovimentacaoController;
    FIdMovimentacaoSelecionada: Integer;
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
  FormMovimentacoes: TFormMovimentacoes;

implementation

{$R *.dfm}

procedure TFormMovimentacoes.FormCreate(Sender: TObject);

begin
  FMovimentacaoController := TMovimentacaoController.Create;
  FIdMovimentacaoSelecionada := 0;
  CarregarGrid;
  LimparCampos;
end;

procedure TFormMovimentacoes.FormDestroy(Sender: TObject);
begin
  if Assigned(DataSource1.DataSet) then
    DataSource1.DataSet.Free;

  FMovimentacaoController.Free;
end;

procedure TFormMovimentacoes.FormShow(Sender: TObject);
begin
CarregarGrid;
end;

procedure TFormMovimentacoes.CarregarGrid;
var
  DataSet: TDataSet;
begin
  try
    DataSource1.DataSet := FMovimentacaoController.ListarMovimentacoes;
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

procedure TFormMovimentacoes.ConfigurarGrid;
begin
end;


procedure TFormMovimentacoes.LimparCampos;
begin
  CbItemMovi.ItemIndex := -1;
  CbOrigemMovi.ItemIndex := -1;
  CbDestinoMovi.ItemIndex := -1;

  CbStatusMovi.ItemIndex := -1;
  FIdMovimentacaoSelecionada := 0;

  BtnAdicionarMovi.Enabled := True;
  BtnEditarMovi.Enabled := False;
  BtnExcluirMovi.Enabled := False;
end;

function TFormMovimentacoes.ValidarCampos: Boolean;
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

  if CbOrigemMovi.ItemIndex = CbDestinoMovi.ItemIndex then
  begin
    ShowMessage('A sala de origem não pode ser igual à sala de destino!');
    CbDestinoMovi.SetFocus;
    Result := False;
    Exit;
  end;

  if CbStatusMovi.ItemIndex = -1 then
  begin
    ShowMessage('Selecione o status da movimentação!');
    CbStatusMovi.SetFocus;
    Result := False;
    Exit;
  end;
end;

function TFormMovimentacoes.ObterIdDoComboBox(AComboBox: TComboBox): Integer;
begin
  Result := 0;
  if (AComboBox.ItemIndex >= 0) and (AComboBox.ItemIndex < AComboBox.Items.Count) then
    Result := Integer(AComboBox.Items.Objects[AComboBox.ItemIndex]);
end;

procedure TFormMovimentacoes.BtnAdicionarMoviClick(Sender: TObject);
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

procedure TFormMovimentacoes.BtnEditarMoviClick(Sender: TObject);
begin
    PanelAddMovi.Visible := True;
    Button2.Visible := True;
    CbItemMovi.Text := DBGrid1.DataSource.DataSet.FieldByName('fk_id_patrimonios').AsString;
    CbStatusMovi.Text := DBGrid1.DataSource.DataSet.FieldByName('status').AsString;
    CbDestinoMovi.Text := DBGrid1.DataSource.DataSet.FieldByName('fk_id_destino').AsString;
    CbOrigemMovi.Text := DBGrid1.DataSource.DataSet.FieldByName('fk_id_origem').AsString;
    PopularComboBox;
end;


procedure TFormMovimentacoes.BtnExcluirMoviClick(Sender: TObject);
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
    FMovimentacaoController.ExcluirMovimentacao(FIdMovimentacaoSelecionada);
    ShowMessage('Movimentação excluída com sucesso!');
    CarregarGrid;
    LimparCampos;
  except
    on E: Exception do
      ShowMessage('Erro ao excluir movimentação: ' + E.Message);
  end;
end;

procedure TFormMovimentacoes.BtnAtualizarMoviClick(Sender: TObject);
begin
  CarregarGrid;
  LimparCampos;
  ShowMessage('Grid atualizado!');
end;

procedure TFormMovimentacoes.SearchBox1Change(Sender: TObject);
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
      DataSet := FMovimentacaoController.ListarMovimentacoes
    else
      DataSet := FMovimentacaoController.PesquisarMovimentacao(SearchBox1.Text);

    DataSource1.DataSet := DataSet;
  except
    on E: Exception do
      ShowMessage('Erro ao pesquisar: ' + E.Message);
  end;
end;

procedure TFormMovimentacoes.DBGrid1CellClick(Column: TColumn);
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

procedure TFormMovimentacoes.PopularComboBox;
begin
 FMovimentacaoController.PopularComboBoxPatrimonios(CbItemMovi);
 FMovimentacaoController.PopularComboBoxSalas(CbOrigemMovi);
 FMovimentacaoController.PopularComboBoxSalas(CbDestinoMovi);
end;

procedure TFormMovimentacoes.PreencherCamposComGrid;
begin
end;

procedure TFormMovimentacoes.BtnLimparFIltroMoviClick(Sender: TObject);
begin
  SearchBox1.Text := '';
  CalendarPicker1.Date := 0;
  CalendarPicker2.Date := 0;
  CarregarGrid;
  LimparCampos;
end;

procedure TFormMovimentacoes.Button1Click(Sender: TObject);
var
  MovimentacaoDTO: TMovimentacaoDTO;
begin
  if not ValidarCampos then
    Exit;

  try
    MovimentacaoDTO.FId := 0;
    MovimentacaoDTO.FIdPatrimonio := ObterIdDoComboBox(CbItemMovi);
    MovimentacaoDTO.FIdOrigem := ObterIdDoComboBox(CbOrigemMovi);
    MovimentacaoDTO.FIdDestino := ObterIdDoComboBox(CbDestinoMovi);
    MovimentacaoDTO.FStatus := CbStatusMovi.Text;
    MovimentacaoDTO.FIdUsuario := TGlobal.FUserID;
    MovimentacaoDTO.FDataMovimentacao := Now;

    FMovimentacaoController.AdicionarMovimentacao(MovimentacaoDTO);

    ShowMessage('Movimentação cadastrada com sucesso!');
    CarregarGrid;
    LimparCampos;
  except
    on E: Exception do
      ShowMessage('Erro ao adicionar movimentação: ' + E.Message);
  end;
end;
procedure TFormMovimentacoes.Button2Click(Sender: TObject);
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
    MovimentacaoDTO.FStatus := CbStatusMovi.Text;
    MovimentacaoDTO.FIdUsuario := TGlobal.FUserID;
    MovimentacaoDTO.FDataMovimentacao := Now;

    FMovimentacaoController.EditarMovimentacao(MovimentacaoDTO);

    ShowMessage('Movimentação atualizada com sucesso!');
    CarregarGrid;
    LimparCampos;
  except
    on E: Exception do
      ShowMessage('Erro ao editar movimentação: ' + E.Message);
  end;
end;

end.
