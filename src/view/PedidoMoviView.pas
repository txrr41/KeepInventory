unit PedidoMoviView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.WinXCtrls, Vcl.WinXCalendars,
  Vcl.Buttons, Vcl.NumberBox, PedidoMoviCOntroller, MovimentacaoDTO, LoginModel,
  FireDAC.Comp.Client, FireDAC.Stan.Param, GlobalUserDTO, PermissoesHelper,
  Vcl.Imaging.pngimage;

type
  TFormPedidoMovi = class(TForm)
    PanelMoviment: TPanel;
    DataSource1: TDataSource;
    Panel5: TPanel;
    DBGrid1: TDBGrid;
    SearchBox1: TSearchBox;
    Label1: TLabel;
    Panel8: TPanel;
    Panel32: TPanel;
    Shape1: TShape;
    Label72: TLabel;
    Image5: TImage;
    BtnAtualizarMovi: TSpeedButton;
    Panel30: TPanel;
    Shape2: TShape;
    Label69: TLabel;
    Image4: TImage;
    Panel28: TPanel;
    Label51: TLabel;
    Image2: TImage;
    Panel7: TPanel;
    Label3: TLabel;
    Label12: TLabel;
    Image1: TImage;
    Panel1: TPanel;
    Label2: TLabel;
    Image3: TImage;
    Shape8: TShape;
    Shape7: TShape;
    Label4: TLabel;
    Image6: TImage;
    BtnAdicionarMovi: TSpeedButton;
    BtnEditarMovi: TSpeedButton;
    BtnExcluirMovi: TSpeedButton;
    PanelAddMovi: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    Label6: TLabel;
    CbItemMovi: TComboBox;
    CbDestinoMovi: TComboBox;
    CbOrigemMovi: TComboBox;
    Panel4: TPanel;
    Label5: TLabel;
    Image7: TImage;
    Image8: TImage;
    Panel2: TPanel;
    Label7: TLabel;
    Panel3: TPanel;
    Label9: TLabel;
    Panel6: TPanel;
    Label15: TLabel;
    Label8: TLabel;
    Shape6: TShape;
    Image9: TImage;
    Label16: TLabel;
    Label17: TLabel;
    Image10: TImage;
    Image11: TImage;
    BtnCancelarMovi: TSpeedButton;
    BtnEnviarMovi: TSpeedButton;
    Shape5: TShape;
    BtnConfirmarEd: TSpeedButton;
    Shape3: TShape;
    Shape4: TShape;
    Shape9: TShape;
    Label13: TLabel;
    Image12: TImage;
    Label14: TLabel;
    LabelSalaOrigem: TLabel;
    Image13: TImage;
    Image14: TImage;
    Label18: TLabel;
    LabelSalaDestino: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BtnAdicionarMoviClick(Sender: TObject);
    procedure BtnEditarMoviClick(Sender: TObject);
    procedure BtnExcluirMoviClick(Sender: TObject);
    procedure BtnAtualizarMoviClick(Sender: TObject);
    procedure SearchBox1Change(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure BtnLimparFIltroMoviClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnEnviarMoviClick(Sender: TObject);
    procedure BtnConfirmarEdClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CbItemMoviChange(Sender: TObject);
    procedure CbDestinoMoviChange(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure BtnCancelarMoviClick(Sender: TObject);
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

procedure TFormPedidoMovi.Image7Click(Sender: TObject);
begin
PanelAddMovi.Visible := False;
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
      ShowMessage('Erro ao carregar movimenta��es: ' + E.Message);
  end;
end;

procedure TFormPedidoMovi.CbItemMoviChange(Sender: TObject);
var
  IdPatrimonio: Integer;
  LocalizacaoAtual: String;
begin
  if CbItemMovi.ItemIndex = -1 then
  begin
    Label17.Caption := 'Nenhum item selecionado';
    LabelSalaOrigem.Caption := 'Selecione um item';
    LabelSalaDestino.Caption := 'Selecione um item';
    Exit;
  end;

  IdPatrimonio := Integer(CbItemMovi.Items.Objects[CbItemMovi.ItemIndex]);

  LocalizacaoAtual := FPedidoMoviController.ObterLocalizacaoAtualPatrimonio(IdPatrimonio);
  Label17.Caption := LocalizacaoAtual;

  if LocalizacaoAtual = 'Sem localização definida' then
    LabelSalaOrigem.Caption := 'Ainda não tem sala'
  else
    LabelSalaOrigem.Caption := LocalizacaoAtual;

  LabelSalaDestino.Caption := 'Selecione um destino';

  // Origem: sala atual do item
  FPedidoMoviController.PopularComboBoxSalasDoPatrimonio(CbOrigemMovi, IdPatrimonio);

  // Destino: todas as salas possíveis
  FPedidoMoviController.PopularComboBoxSalas(CbDestinoMovi);
end;

procedure TFormPedidoMovi.CbDestinoMoviChange(Sender: TObject);
var
  SalaDestino: String;
begin
  if CbDestinoMovi.ItemIndex = -1 then
  begin
    LabelSalaDestino.Caption := 'Selecione um destino';
    Exit;
  end;

  SalaDestino := CbDestinoMovi.Text;
  LabelSalaDestino.Caption := SalaDestino;
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

  Label17.Caption := 'Nenhum item selecionado';
  LabelSalaOrigem.Caption := 'Selecione um item';
  LabelSalaDestino.Caption := 'Selecione um item';

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
    ShowMessage('Selecione um patrim�nio!');
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
    ShowMessage('A sala de origem n�o pode ser igual � sala de destino!');
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
    Panel2.Visible := True;
    Panel3.Visible := False;
    LimparCampos;
    PopularComboBox;
  end
  else
  begin
    PanelAddMovi.Visible := False;
    LimparCampos;
  end;
end;

procedure TFormPedidoMovi.BtnEditarMoviClick(Sender: TObject);
begin
  if FIdMovimentacaoSelecionada = 0 then
  begin
    ShowMessage('Selecione uma movimentação para editar!');
    Exit;
  end;

  PanelAddMovi.Visible := True;
  Panel3.Visible := True;
  Panel2.Visible := False;

  PreencherCamposComGrid;
  PopularComboBox;
end;


procedure TFormPedidoMovi.BtnExcluirMoviClick(Sender: TObject);
begin
  if FIdMovimentacaoSelecionada = 0 then
  begin
    ShowMessage('Selecione uma movimenta��o para excluir!');
    Exit;
  end;

  if MessageDlg('Deseja realmente excluir esta movimenta��o?',
     mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    Exit;

  try
    FPedidoMoviController.ExcluirMovimentacao(FIdMovimentacaoSelecionada);
    ShowMessage('Movimenta��o exclu�da com sucesso!');
    CarregarGrid;
    LimparCampos;
  except
    on E: Exception do
      ShowMessage('Erro ao excluir movimenta��o: ' + E.Message);
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

    // Habilitar bot�es
    BtnAdicionarMovi.Enabled := False;
    BtnEditarMovi.Enabled := True;
    BtnExcluirMovi.Enabled := True;
  except
    on E: Exception do
      ShowMessage('Erro ao selecionar movimenta��o: ' + E.Message);
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
var
  IdPatrimonio, IdOrigem, IdDestino: Integer;
  I: Integer;
begin
  if not Assigned(DataSource1.DataSet) or DataSource1.DataSet.IsEmpty then
    Exit;

  IdPatrimonio := DataSource1.DataSet.FieldByName('fk_id_patrimonios').AsInteger;
  IdOrigem := DataSource1.DataSet.FieldByName('fk_id_origem').AsInteger;
  IdDestino := DataSource1.DataSet.FieldByName('fk_id_destino').AsInteger;

  PopularComboBox;

  for I := 0 to CbItemMovi.Items.Count - 1 do
  begin
    if Integer(CbItemMovi.Items.Objects[I]) = IdPatrimonio then
    begin
      CbItemMovi.ItemIndex := I;
      Break;
    end;
  end;

  for I := 0 to CbOrigemMovi.Items.Count - 1 do
  begin
    if Integer(CbOrigemMovi.Items.Objects[I]) = IdOrigem then
    begin
      CbOrigemMovi.ItemIndex := I;
      Break;
    end;
  end;

  for I := 0 to CbDestinoMovi.Items.Count - 1 do
  begin
    if Integer(CbDestinoMovi.Items.Objects[I]) = IdDestino then
    begin
      CbDestinoMovi.ItemIndex := I;
      Break;
    end;
  end;
end;

procedure TFormPedidoMovi.BtnLimparFIltroMoviClick(Sender: TObject);
begin
  SearchBox1.Text := '';
  CarregarGrid;
  LimparCampos;
end;

procedure TFormPedidoMovi.BtnEnviarMoviClick(Sender: TObject);
var
  MovimentacaoDTO: TMovimentacaoDTO;
begin
  if not ValidarCampos then
    Exit;

  try
    // Verificar se usuário logado existe
    if TPermissoesHelper.GetUsuarioLogado = nil then
    begin
      ShowMessage('Erro: Nenhum usuário logado encontrado!');
      Exit;
    end;

    MovimentacaoDTO.FId := 0;
    MovimentacaoDTO.FIdPatrimonio := Integer(CbItemMovi.Items.Objects[cbItemMovi.ItemIndex]);;
    MovimentacaoDTO.FIdOrigem := Integer(CbOrigemMovi.Items.Objects[CbOrigemMovi.ItemIndex]);
    MovimentacaoDTO.FIdDestino := ObterIdDoComboBox(CbDestinoMovi);
    MovimentacaoDTO.FIdUsuario := TPermissoesHelper.GetUsuarioLogado.Id;
    MovimentacaoDTO.FDataMovimentacao := Now;

    // Debug: mostrar valores
    ShowMessage(Format('ID Usuario: %d, ID Patrimonio: %d, ID Origem: %d, ID Destino: %d',
      [MovimentacaoDTO.FIdUsuario, MovimentacaoDTO.FIdPatrimonio,
       MovimentacaoDTO.FIdOrigem, MovimentacaoDTO.FIdDestino]));

    FPedidoMoviController.AdicionarMovimentacao(MovimentacaoDTO);

    ShowMessage('Movimentação cadastrada com sucesso!');
    CarregarGrid;
    LimparCampos;
  except
    on E: Exception do
      ShowMessage('Erro ao adicionar movimentação: ' + E.Message);
  end;
end;
procedure TFormPedidoMovi.BtnCancelarMoviClick(Sender: TObject);
begin
  LimparCampos;
end;

procedure TFormPedidoMovi.BtnConfirmarEdClick(Sender: TObject);
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
    MovimentacaoDTO.FIdUsuario := TPermissoesHelper.GetUsuarioLogado.Id;
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
