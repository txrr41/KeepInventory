unit RegistroOcorrenciaView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.WinXCtrls, OcorrenciaController, OcorrenciaDTO, GlobalUserDTO,
  Vcl.Imaging.pngimage, PermissoesHelper, UsuarioModel;

type
  TFormRegistrarOcorrencia = class(TForm)
    Panel1: TPanel;
    SearchBox1: TSearchBox;
    Panel2: TPanel;
    DBGridMinhasOcorrencias: TDBGrid;
    Panel3: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    CbPatrimonio: TComboBox;
    CbTipoOcorrencia: TComboBox;
    Panel5: TPanel;
    Shape2: TShape;
    BtnRegistrar: TSpeedButton;
    Label5: TLabel;
    Panel6: TPanel;
    Shape1: TShape;
    BtnCancelar: TSpeedButton;
    Label6: TLabel;
    DataSource1: TDataSource;
    MemoDescricao: TMemo;
    SpeedButton2: TSpeedButton;
    Panel7: TPanel;
    Panel28: TPanel;
    Label51: TLabel;
    Panel30: TPanel;
    Label69: TLabel;
    Panel32: TPanel;
    Label72: TLabel;
    Label7: TLabel;
    Label12: TLabel;
    Image6: TImage;
    Panel8: TPanel;
    BtnExcluir: TSpeedButton;
    BtnAtualizarMovi: TSpeedButton;
    Shape3: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Image2: TImage;
    Image4: TImage;
    Image5: TImage;
    BtnAdicionarPatrimonio: TSpeedButton;
    Panel4: TPanel;
    Label1: TLabel;
    Image1: TImage;
    Image3: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnRegistrarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAtualizarMoviClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure DBGridMinhasOcorrenciasCellClick(Column: TColumn);
    procedure BtnAdicionarPatrimonioClick(Sender: TObject);
    procedure BtnEditarMoviClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FController: TOcorrenciaController;
    FIdOcorrenciaSelecionada: Integer;
    function ValidarCampos: Boolean;
    function ObterIdDoComboBox(AComboBox: TComboBox): Integer;
    procedure SetEstadoCamposFormulario(Habilitado: Boolean);
  public
    procedure CarregarGrid;
    procedure LimparCampos;
  end;

var
  FormRegistrarOcorrencia: TFormRegistrarOcorrencia;

implementation

{$R *.dfm}

procedure TFormRegistrarOcorrencia.BtnAdicionarPatrimonioClick(Sender: TObject);
begin
  Panel3.Visible := True;
  LimparCampos;
  SetEstadoCamposFormulario(True);
  CbPatrimonio.SetFocus;
end;

procedure TFormRegistrarOcorrencia.BtnCancelarClick(Sender: TObject);
begin
  LimparCampos;
  Panel3.Visible := False;
end;

procedure TFormRegistrarOcorrencia.BtnExcluirClick(Sender: TObject);
begin
if FIdOcorrenciaSelecionada = 0 then
  begin
    ShowMessage('Selecione uma ocorrencia para excluir!');
    Exit;
  end;

  if MessageDlg('Deseja realmente excluir esta ocorrencia?',
     mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    Exit;

  try
    if FController.ExcluirOcorrencia(FIdOcorrenciaSelecionada) then
    begin
      ShowMessage('Ocorrencia excluida com sucesso!');
      CarregarGrid;
      LimparCampos;
    end;
  except
    on E: Exception do
      ShowMessage('Erro ao excluir ocorrencia: ' + E.Message);
  end;
end;

procedure TFormRegistrarOcorrencia.BtnRegistrarClick(Sender: TObject);
var
  DTO: TOcorrenciaDTO;
begin
  if not ValidarCampos then
    Exit;

  try
    DTO.FIdPatrimonio := ObterIdDoComboBox(CbPatrimonio);
    DTO.FIdUsuarioRelator := UserM.Id;
    DTO.FTipoOcorrencia := CbTipoOcorrencia.Text;
    DTO.FDescricao := Trim(MemoDescricao.Text);
    DTO.FDataOcorrencia := Now;
    DTO.FStatus := 'PENDENTE';
    DTO.FFotoAnexo := '';

    if FIdOcorrenciaSelecionada = 0 then
    begin
      DTO.FId := 0;
      if FController.RegistrarOcorrencia(DTO) then
      begin
        ShowMessage('Ocorrência registrada com sucesso!' + #13#10 +
                    'Aguarde a análise do gestor.');
      end;
    end
    else
    begin
      DTO.FId := FIdOcorrenciaSelecionada;
      if FController.EditarOcorrencia(DTO) then
      begin
        ShowMessage('Ocorrência atualizada com sucesso!');
      end;
    end;

    LimparCampos;
    CarregarGrid;
    Panel3.Visible := False;
  except
    on E: Exception do
      ShowMessage('Erro ao salvar ocorrência: ' + E.Message);
  end;
end;

procedure TFormRegistrarOcorrencia.CarregarGrid;
var
  OldDataSet: TDataSet;
begin
  try
    if not Assigned(FController) then
      Exit;

    OldDataSet := DataSource1.DataSet;
    DataSource1.DataSet := nil;

    if Assigned(OldDataSet) then
      OldDataSet.Free;

    DataSource1.DataSet := FController.ListarTodas;
    DBGridMinhasOcorrencias.DataSource := DataSource1;

    DBGridMinhasOcorrencias.Refresh;
  except
    on E: Exception do
      ShowMessage('Erro ao carregar ocorr�ncias: ' + E.Message);
  end;
end;

procedure TFormRegistrarOcorrencia.DBGridMinhasOcorrenciasCellClick(
  Column: TColumn);
begin
  if not Assigned(DataSource1.DataSet) or DataSource1.DataSet.IsEmpty then
    Exit;

  try
    FIdOcorrenciaSelecionada := DataSource1.DataSet.FieldByName('id').AsInteger;

    // S� permite excluir se estiver PENDENTE
    if DataSource1.DataSet.FieldByName('status').AsString = 'PENDENTE' then
      BtnExcluir.Enabled := True
    else
      BtnExcluir.Enabled := False;
  except
    on E: Exception do
      ShowMessage('Erro ao selecionar ocorr�ncia: ' + E.Message);
  end;
end;

procedure TFormRegistrarOcorrencia.FormCreate(Sender: TObject);
begin
  try
    FController := TOcorrenciaController.Create;
    FIdOcorrenciaSelecionada := 0;

    // Popula os ComboBox
    FController.PopularComboBoxPatrimonios(CbPatrimonio);
    FController.PopularComboBoxTipos(CbTipoOcorrencia);

    // Carrega o grid
    CarregarGrid;

    // Inicializa com o formulário oculto e campos desabilitados
    Panel3.Visible := False;
    LimparCampos;
  except
    on E: Exception do
      ShowMessage('Erro ao inicializar formul�rio: ' + E.Message);
  end;
end;

procedure TFormRegistrarOcorrencia.FormDestroy(Sender: TObject);
begin
 if Assigned(FController) then
    FController.Free;
end;

procedure TFormRegistrarOcorrencia.FormShow(Sender: TObject);
begin
TPermissoesHelper.AplicarPermissoesOcorrencias(Self);
end;

procedure TFormRegistrarOcorrencia.Image1Click(Sender: TObject);
begin
Panel3.Visible := False;
end;

procedure TFormRegistrarOcorrencia.LimparCampos;
begin
  CbPatrimonio.ItemIndex := -1;
  CbTipoOcorrencia.ItemIndex := -1;
  MemoDescricao.Clear;
  FIdOcorrenciaSelecionada := 0;

  // Desabilitar campos
  SetEstadoCamposFormulario(False);
end;

function TFormRegistrarOcorrencia.ObterIdDoComboBox(
  AComboBox: TComboBox): Integer;
begin
  Result := 0;
  if (AComboBox.ItemIndex >= 0) and (AComboBox.ItemIndex < AComboBox.Items.Count) then
    Result := Integer(AComboBox.Items.Objects[AComboBox.ItemIndex]);
end;

procedure TFormRegistrarOcorrencia.BtnEditarMoviClick(Sender: TObject);
var
  IdPatrimonio: Integer;
  TipoOcorrencia: String;
  I: Integer;
begin
  if FIdOcorrenciaSelecionada = 0 then
  begin
    ShowMessage('Selecione uma ocorrência para editar!');
    Exit;
  end;

  if not Assigned(DataSource1.DataSet) or DataSource1.DataSet.IsEmpty then
    Exit;

  try
    if DataSource1.DataSet.FieldByName('status').AsString <> 'PENDENTE' then
    begin
      ShowMessage('Apenas ocorrências com status PENDENTE podem ser editadas!');
      Exit;
    end;

    Panel3.Visible := True;
    SetEstadoCamposFormulario(True);

    IdPatrimonio := DataSource1.DataSet.FieldByName('fk_id_patrimonios').AsInteger;
    TipoOcorrencia := DataSource1.DataSet.FieldByName('tipo_ocorrencia').AsString;
    MemoDescricao.Text := DataSource1.DataSet.FieldByName('descricao').AsString;

    for I := 0 to CbPatrimonio.Items.Count - 1 do
    begin
      if Integer(CbPatrimonio.Items.Objects[I]) = IdPatrimonio then
      begin
        CbPatrimonio.ItemIndex := I;
        Break;
      end;
    end;

    for I := 0 to CbTipoOcorrencia.Items.Count - 1 do
    begin
      if CbTipoOcorrencia.Items[I] = TipoOcorrencia then
      begin
        CbTipoOcorrencia.ItemIndex := I;
        Break;
      end;
    end;

    CbPatrimonio.SetFocus;
  except
    on E: Exception do
      ShowMessage('Erro ao carregar dados para edição: ' + E.Message);
  end;
end;

procedure TFormRegistrarOcorrencia.BtnAtualizarMoviClick(Sender: TObject);
begin
  LimparCampos;
  CarregarGrid;
end;

function TFormRegistrarOcorrencia.ValidarCampos: Boolean;
begin
  Result := True;

  if CbPatrimonio.ItemIndex = -1 then
  begin
    ShowMessage('Selecione um patrim�nio!');
    CbPatrimonio.SetFocus;
    Result := False;
    Exit;
  end;

  if CbTipoOcorrencia.ItemIndex = -1 then
  begin
    ShowMessage('Selecione o tipo de ocorr�ncia!');
    CbTipoOcorrencia.SetFocus;
    Result := False;
    Exit;
  end;

  if Trim(MemoDescricao.Text) = '' then
  begin
    ShowMessage('Descreva o que aconteceu!');
    MemoDescricao.SetFocus;
    Result := False;
    Exit;
  end;

  if Length(Trim(MemoDescricao.Text)) < 10 then
  begin
    ShowMessage('A descri��o deve ter no m�nimo 10 caracteres!');
    MemoDescricao.SetFocus;
    Result := False;
    Exit;
  end;
end;

procedure TFormRegistrarOcorrencia.SetEstadoCamposFormulario(Habilitado: Boolean);
begin
  // Habilitar/Desabilitar campos do formulário
  CbPatrimonio.Enabled := Habilitado;
  CbTipoOcorrencia.Enabled := Habilitado;
  MemoDescricao.Enabled := Habilitado;
  BtnRegistrar.Enabled := Habilitado;
  BtnCancelar.Enabled := Habilitado;

  // Mudar aparência dos campos
  if Habilitado then
  begin
    CbPatrimonio.Color := clWindow;
    CbTipoOcorrencia.Color := clWindow;
    MemoDescricao.Color := clWindow;
  end
  else
  begin
    CbPatrimonio.Color := clBtnFace;
    CbTipoOcorrencia.Color := clBtnFace;
    MemoDescricao.Color := clBtnFace;
  end;
end;

end.
