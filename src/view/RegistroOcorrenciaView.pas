unit RegistroOcorrenciaView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.WinXCtrls, OcorrenciaController, OcorrenciaDTO, GlobalUserDTO,
  Vcl.Imaging.pngimage, PermissoesHelper;

type
  TFormRegistrarOcorrencia = class(TForm)
    Panel1: TPanel;
    Shape26: TShape;
    Panel27: TPanel;
    Panel28: TPanel;
    Shape28: TShape;
    Label51: TLabel;
    BtnAdicionarPatrimonio: TSpeedButton;
    Panel29: TPanel;
    Label52: TLabel;
    Label53: TLabel;
    Shape29: TShape;
    Label54: TLabel;
    Panel30: TPanel;
    Shape30: TShape;
    BtnExcluir: TSpeedButton;
    Label69: TLabel;
    Panel31: TPanel;
    Label70: TLabel;
    Shape31: TShape;
    SpeedButton4: TSpeedButton;
    Label71: TLabel;
    Panel32: TPanel;
    Label72: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Shape32: TShape;
    SpeedButton5: TSpeedButton;
    Label77: TLabel;
    SpeedButton1: TSpeedButton;
    SearchBox1: TSearchBox;
    Shape27: TShape;
    Panel2: TPanel;
    DBGridMinhasOcorrencias: TDBGrid;
    Panel3: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel4: TPanel;
    Label1: TLabel;
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
    Label7: TLabel;
    DataSource1: TDataSource;
    MemoDescricao: TMemo;
    SpeedButton2: TSpeedButton;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnRegistrarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure DBGridMinhasOcorrenciasCellClick(Column: TColumn);
    procedure BtnAdicionarPatrimonioClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FController: TOcorrenciaController;
    FIdOcorrenciaSelecionada: Integer;
    function ValidarCampos: Boolean;
    function ObterIdDoComboBox(AComboBox: TComboBox): Integer;
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
end;

procedure TFormRegistrarOcorrencia.BtnCancelarClick(Sender: TObject);
begin
LimparCampos;
end;

procedure TFormRegistrarOcorrencia.BtnExcluirClick(Sender: TObject);
begin
if FIdOcorrenciaSelecionada = 0 then
  begin
    ShowMessage('Selecione uma ocorrência para excluir!');
    Exit;
  end;

  if MessageDlg('Deseja realmente excluir esta ocorrência?',
     mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    Exit;

  try
    if FController.ExcluirOcorrencia(FIdOcorrenciaSelecionada) then
    begin
      ShowMessage('Ocorrência excluída com sucesso!');
      CarregarGrid;
      LimparCampos;
    end;
  except
    on E: Exception do
      ShowMessage('Erro ao excluir ocorrência: ' + E.Message);
  end;
end;

procedure TFormRegistrarOcorrencia.BtnRegistrarClick(Sender: TObject);
var
  DTO: TOcorrenciaDTO;
begin
  if not ValidarCampos then
    Exit;

  try
    DTO.FId := 0;
    DTO.FIdPatrimonio := ObterIdDoComboBox(CbPatrimonio);
    DTO.FIdUsuarioRelator := TGlobal.FUserID;
    DTO.FTipoOcorrencia := CbTipoOcorrencia.Text;
    DTO.FDescricao := Trim(MemoDescricao.Text);
    DTO.FDataOcorrencia := Now;
    DTO.FStatus := 'PENDENTE';
    DTO.FFotoAnexo := '';

    if FController.RegistrarOcorrencia(DTO) then
    begin
      ShowMessage('Ocorrência registrada com sucesso!' + #13#10 +
                  'Aguarde a análise do gestor.');
      LimparCampos;
      CarregarGrid;
    end;
  except
    on E: Exception do
      ShowMessage('Erro ao registrar ocorrência: ' + E.Message);
  end;

  Panel3.Visible := False;
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
      ShowMessage('Erro ao carregar ocorrências: ' + E.Message);
  end;
end;

procedure TFormRegistrarOcorrencia.DBGridMinhasOcorrenciasCellClick(
  Column: TColumn);
begin
  if not Assigned(DataSource1.DataSet) or DataSource1.DataSet.IsEmpty then
    Exit;

  try
    FIdOcorrenciaSelecionada := DataSource1.DataSet.FieldByName('id').AsInteger;

    // Só permite excluir se estiver PENDENTE
    if DataSource1.DataSet.FieldByName('status').AsString = 'PENDENTE' then
      BtnExcluir.Enabled := True
    else
      BtnExcluir.Enabled := False;
  except
    on E: Exception do
      ShowMessage('Erro ao selecionar ocorrência: ' + E.Message);
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
    LimparCampos;
  except
    on E: Exception do
      ShowMessage('Erro ao inicializar formulário: ' + E.Message);
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

  BtnRegistrar.Enabled := True;
  BtnCancelar.Enabled := False;
end;

function TFormRegistrarOcorrencia.ObterIdDoComboBox(
  AComboBox: TComboBox): Integer;
begin
  Result := 0;
  if (AComboBox.ItemIndex >= 0) and (AComboBox.ItemIndex < AComboBox.Items.Count) then
    Result := Integer(AComboBox.Items.Objects[AComboBox.ItemIndex]);
end;

procedure TFormRegistrarOcorrencia.SpeedButton5Click(Sender: TObject);
begin
  LimparCampos;
  CarregarGrid;
end;

function TFormRegistrarOcorrencia.ValidarCampos: Boolean;
begin
  Result := True;

  if CbPatrimonio.ItemIndex = -1 then
  begin
    ShowMessage('Selecione um patrimônio!');
    CbPatrimonio.SetFocus;
    Result := False;
    Exit;
  end;

  if CbTipoOcorrencia.ItemIndex = -1 then
  begin
    ShowMessage('Selecione o tipo de ocorrência!');
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
    ShowMessage('A descrição deve ter no mínimo 10 caracteres!');
    MemoDescricao.SetFocus;
    Result := False;
    Exit;
  end;
end;

end.
