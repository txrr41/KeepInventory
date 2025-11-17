unit CadastroUsuarioView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.WinXCtrls, Vcl.Buttons, Vcl.Mask,
  UsuarioController, UsuarioDTO, UsuarioModel, PermissoesHelper;

type
  TFormCadastroUsuario = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel7: TPanel;
    Panel3: TPanel;
    SearchBox1: TSearchBox;
    DBGridUsuarios: TDBGrid;
    EdtNomeUser: TEdit;
    EdtCPFUser: TEdit;
    EdtTelefoneUser: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EdtRGUser: TEdit;
    Label4: TLabel;
    EdtNascimentoUser: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    EdtSenhaUser: TEdit;
    Label7: TLabel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel8: TPanel;
    Shape29: TShape;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Memo1: TMemo;
    Label12: TLabel;
    CheckCadastro: TCheckBox;
    Panel9: TPanel;
    CheckCadastroEmp: TCheckBox;
    CheckCadastroPredi: TCheckBox;
    CheckCadastroSala: TCheckBox;
    CheckCadastroPatri: TCheckBox;
    Panel10: TPanel;
    CheckMovimentacoes: TCheckBox;
    Panel11: TPanel;
    CheckAnalisarMovi: TCheckBox;
    CheckAdicionarMovi: TCheckBox;
    CheckExcluirMovi: TCheckBox;
    CheckOcorrencias: TCheckBox;
    Panel12: TPanel;
    CheckAnalisarOcorre: TCheckBox;
    CheckAdicionarOcorre: TCheckBox;
    CheckExcluirOcorre: TCheckBox;
    CheckUsuarios: TCheckBox;
    Panel13: TPanel;
    CheckCadastrarUser: TCheckBox;
    CheckPermissaoUser: TCheckBox;
    Label13: TLabel;
    Panel14: TPanel;
    Shape4: TShape;
    Label14: TLabel;
    Label15: TLabel;
    CbFuncaoUser: TComboBox;
    BtnSalavarUser: TSpeedButton;
    BtnAddUser: TSpeedButton;
    BtnEditarUser: TSpeedButton;
    BtnExcluirUser: TSpeedButton;
    BtnAtualizarUser: TSpeedButton;
    DataSource1: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnAddUserClick(Sender: TObject);
    procedure BtnSalavarUserClick(Sender: TObject);
    procedure BtnEditarUserClick(Sender: TObject);
    procedure BtnExcluirUserClick(Sender: TObject);
    procedure BtnAtualizarUserClick(Sender: TObject);
    procedure SearchBox1Change(Sender: TObject);
    procedure CheckCadastroClick(Sender: TObject);
    procedure CheckMovimentacoesClick(Sender: TObject);
    procedure CheckOcorrenciasClick(Sender: TObject);
    procedure CheckUsuariosClick(Sender: TObject);
    procedure CheckCadastroEmpClick(Sender: TObject);
    procedure CheckCadastroPredioClick(Sender: TObject);
    procedure CheckCadastroSalaClick(Sender: TObject);
    procedure CheckCadastroPatriClick(Sender: TObject);
  private
    FModoEdicao: Boolean;
    FIdUsuarioSelecionado: Integer;
    procedure HabilitarCampos(AHabilitar: Boolean);
    procedure LimparCampos;
    procedure AtualizarGrid;
    function ValidarCampos: Boolean;
    procedure CarregarDadosParaEdicao;
    function MontarDTO: TUsuarioDTO;
    procedure ConfigurarPermissoesCadastro(AMarcar: Boolean);
    procedure ConfigurarPermissoesMovimentacoes(AMarcar: Boolean);
    procedure ConfigurarPermissoesOcorrencias(AMarcar: Boolean);
    procedure ConfigurarPermissoesUsuarios(AMarcar: Boolean);
    procedure VerificarCheckboxPrincipalCadastro;
    procedure VerificarCheckboxPrincipalMovimentacoes;
    procedure VerificarCheckboxPrincipalOcorrencias;
    procedure VerificarCheckboxPrincipalUsuarios;
  public
    { Public declarations }
  end;

var
  FormCadastroUsuario: TFormCadastroUsuario;

implementation

{$R *.dfm}

{ TFormCadastroUsuario }

procedure TFormCadastroUsuario.FormCreate(Sender: TObject);
begin
  inherited;
  FUsuarioController := TUsuarioController.Create;
  FModoEdicao := False;
  FIdUsuarioSelecionado := 0;

  // Configura ComboBox de fun��o
  CbFuncaoUser.Items.Clear;
  CbFuncaoUser.Items.Add('Administrador');
  CbFuncaoUser.Items.Add('Gestor');
  CbFuncaoUser.Items.Add('Operador');
  CbFuncaoUser.Items.Add('Visualizador');

  // Desabilita campos inicialmente
  HabilitarCampos(False);

  // Configura eventos dos checkboxes filhos
  CheckCadastroEmp.OnClick := CheckCadastroEmpClick;
  CheckCadastroPredi.OnClick := CheckCadastroPredioClick;
  CheckCadastroSala.OnClick := CheckCadastroSalaClick;
  CheckCadastroPatri.OnClick := CheckCadastroPatriClick;

  // Configura grid
  DBGridUsuarios.DataSource := DataSource1;
end;

procedure TFormCadastroUsuario.FormShow(Sender: TObject);

var
  UsuarioLogado: TUsuarioModel;
begin
  AtualizarGrid;
  ShowMessage('Antes de GetUsuarioLogado');  // Log tempor�rio
  UsuarioLogado := TPermissoesHelper.GetUsuarioLogado;
  ShowMessage('Depois de GetUsuarioLogado: ' + IntToStr(Integer(UsuarioLogado)));  // Mostra o ponteiro
  if Assigned(UsuarioLogado) then
  begin
    ShowMessage('Usuario logado: ' + UsuarioLogado.Nome);
    TPermissoesHelper.AplicarPermissoesUsuarios(Self);
  end
  else
  begin
    ShowMessage('Nenhum usu�rio logado!');
    Close;
  end;

  // Inicializar campos desabilitados
  HabilitarCampos(False);
end;

procedure TFormCadastroUsuario.HabilitarCampos(AHabilitar: Boolean);
begin
  // Campos de dados pessoais
  EdtNomeUser.Enabled := AHabilitar;
  EdtCPFUser.Enabled := AHabilitar;
  EdtRGUser.Enabled := AHabilitar;
  EdtTelefoneUser.Enabled := AHabilitar;
  EdtNascimentoUser.Enabled := AHabilitar;
  CbFuncaoUser.Enabled := AHabilitar;
  EdtSenhaUser.Enabled := AHabilitar;
  Memo1.Enabled := AHabilitar;

  // Pain�is de permiss�es
  Panel9.Enabled := AHabilitar;
  Panel11.Enabled := AHabilitar;
  Panel12.Enabled := AHabilitar;
  Panel13.Enabled := AHabilitar;

  // Checkboxes principais
  CheckCadastro.Enabled := AHabilitar;
  CheckMovimentacoes.Enabled := AHabilitar;
  CheckOcorrencias.Enabled := AHabilitar;
  CheckUsuarios.Enabled := AHabilitar;

  // Checkboxes filhos - Cadastros
  CheckCadastroEmp.Enabled := AHabilitar;
  CheckCadastroPredi.Enabled := AHabilitar;
  CheckCadastroSala.Enabled := AHabilitar;
  CheckCadastroPatri.Enabled := AHabilitar;

  // Checkboxes filhos - Movimenta��es
  CheckAnalisarMovi.Enabled := AHabilitar;
  CheckAdicionarMovi.Enabled := AHabilitar;
  CheckExcluirMovi.Enabled := AHabilitar;

  // Checkboxes filhos - Ocorr�ncias
  CheckAnalisarOcorre.Enabled := AHabilitar;
  CheckAdicionarOcorre.Enabled := AHabilitar;
  CheckExcluirOcorre.Enabled := AHabilitar;

  // Checkboxes filhos - Usu�rios
  CheckCadastrarUser.Enabled := AHabilitar;
  CheckPermissaoUser.Enabled := AHabilitar;

  // Bot�o Salvar
  BtnSalavarUser.Enabled := AHabilitar;

  if AHabilitar then
  begin
    EdtNomeUser.Color := clWindow;
    EdtCPFUser.Color := clWindow;
    EdtRGUser.Color := clWindow;
    EdtTelefoneUser.Color := clWindow;
    EdtNascimentoUser.Color := clWindow;
    EdtSenhaUser.Color := clWindow;
  end
  else
  begin
    EdtNomeUser.Color := clBtnFace;
    EdtCPFUser.Color := clBtnFace;
    EdtRGUser.Color := clBtnFace;
    EdtTelefoneUser.Color := clBtnFace;
    EdtNascimentoUser.Color := clBtnFace;
    EdtSenhaUser.Color := clBtnFace;
  end;
end;

procedure TFormCadastroUsuario.LimparCampos;
begin
  EdtNomeUser.Text := '';
  EdtCPFUser.Text := '';
  EdtRGUser.Text := '';
  EdtTelefoneUser.Text := '';
  EdtNascimentoUser.Text := '';
  CbFuncaoUser.ItemIndex := -1;
  EdtSenhaUser.Text := '';
  Memo1.Lines.Clear;

  // Limpa todas as permiss�es
  CheckCadastro.Checked := False;
  CheckCadastroEmp.Checked := False;
  CheckCadastroPredi.Checked := False;
  CheckCadastroSala.Checked := False;
  CheckCadastroPatri.Checked := False;

  CheckMovimentacoes.Checked := False;
  CheckAnalisarMovi.Checked := False;
  CheckAdicionarMovi.Checked := False;
  CheckExcluirMovi.Checked := False;

  CheckOcorrencias.Checked := False;
  CheckAnalisarOcorre.Checked := False;
  CheckAdicionarOcorre.Checked := False;
  CheckExcluirOcorre.Checked := False;

  CheckUsuarios.Checked := False;
  CheckCadastrarUser.Checked := False;
  CheckPermissaoUser.Checked := False;

  FIdUsuarioSelecionado := 0;
end;

procedure TFormCadastroUsuario.AtualizarGrid;
begin
  try
    DataSource1.DataSet := FUsuarioController.ListarUsuarios;
    DBGridUsuarios.DataSource := DataSource1;
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao carregar usu�rios: ' + E.Message);
      DBGridUsuarios.DataSource := nil;
    end;
  end;
end;

function TFormCadastroUsuario.ValidarCampos: Boolean;
begin
  Result := False;

  if Trim(EdtNomeUser.Text) = '' then
  begin
    ShowMessage('Informe o nome do usu�rio!');
    EdtNomeUser.SetFocus;
    Exit;
  end;

  if Trim(EdtCPFUser.Text) = '' then
  begin
    ShowMessage('Informe o CPF do usu�rio!');
    EdtCPFUser.SetFocus;
    Exit;
  end;

  if CbFuncaoUser.ItemIndex = -1 then
  begin
    ShowMessage('Selecione a fun��o do usu�rio!');
    CbFuncaoUser.SetFocus;
    Exit;
  end;

  // Valida senha apenas no modo de inclus�o
  if (not FModoEdicao) and (Trim(EdtSenhaUser.Text) = '') then
  begin
    ShowMessage('Informe a senha do usu�rio!');
    EdtSenhaUser.SetFocus;
    Exit;
  end;

  // Valida se pelo menos uma permiss�o foi marcada
  if not (CheckCadastro.Checked or CheckMovimentacoes.Checked or
          CheckOcorrencias.Checked or CheckUsuarios.Checked) then
  begin
    ShowMessage('Selecione pelo menos uma permiss�o para o usu�rio!');
    Exit;
  end;

  Result := True;
end;

function TFormCadastroUsuario.MontarDTO: TUsuarioDTO;
var
  Dto: TUsuarioDTO;
begin
  Dto.FId := FIdUsuarioSelecionado;
  Dto.FNome := EdtNomeUser.Text;
  Dto.FCpf := EdtCPFUser.Text;
  Dto.FRg := EdtRGUser.Text;
  Dto.FTelefone := EdtTelefoneUser.Text;

  if Trim(EdtNascimentoUser.Text) <> '' then
    Dto.FDataNascimento := StrToDate(EdtNascimentoUser.Text)
  else
    Dto.FDataNascimento := Date;

  Dto.FFuncao := CbFuncaoUser.Text;
  Dto.FSenha := EdtSenhaUser.Text; // Ser� convertida em hash no controller

  // Permiss�es Cadastros
  Dto.FPermCadastros := CheckCadastro.Checked;
  Dto.FPermCadEmpresa := CheckCadastroEmp.Checked;
  Dto.FPermCadPredio := CheckCadastroPredi.Checked;
  Dto.FPermCadSala := CheckCadastroSala.Checked;
  Dto.FPermCadPatrimonio := CheckCadastroPatri.Checked;

  // Permiss�es Movimenta��es
  Dto.FPermMovimentacoes := CheckMovimentacoes.Checked;
  Dto.FPermMovAnalisar := CheckAnalisarMovi.Checked;
  Dto.FPermMovAdicionar := CheckAdicionarMovi.Checked;
  Dto.FPermMovExcluir := CheckExcluirMovi.Checked;

  // Permiss�es Ocorr�ncias
  Dto.FPermOcorrencias := CheckOcorrencias.Checked;
  Dto.FPermOcorAnalisar := CheckAnalisarOcorre.Checked;
  Dto.FPermOcorAdicionar := CheckAdicionarOcorre.Checked;
  Dto.FPermOcorExcluir := CheckExcluirOcorre.Checked;

  // Permiss�es Usu�rios
  Dto.FPermUsuarios := CheckUsuarios.Checked;
  Dto.FPermUserCadastrar := CheckCadastrarUser.Checked;
  Dto.FPermUserPermissao := CheckPermissaoUser.Checked;

  Result := Dto;
end;

procedure TFormCadastroUsuario.BtnAddUserClick(Sender: TObject);
begin
  FModoEdicao := False;
  LimparCampos;
  HabilitarCampos(True);
  EdtNomeUser.SetFocus;
end;

procedure TFormCadastroUsuario.BtnSalavarUserClick(Sender: TObject);
var
  Dto: TUsuarioDTO;
begin
  if not ValidarCampos then
    Exit;

  try
    Dto := MontarDTO;

    if FModoEdicao then
    begin
      FUsuarioController.EditarUsuario(Dto);
      ShowMessage('Usu�rio atualizado com sucesso!');
    end
    else
    begin
      FUsuarioController.AdicionarUsuario(Dto);
      ShowMessage('Usu�rio cadastrado com sucesso!');
    end;

    LimparCampos;
    HabilitarCampos(False);
    AtualizarGrid;
    FModoEdicao := False;

  except
    on E: Exception do
      ShowMessage('Erro ao salvar usu�rio: ' + E.Message);
  end;
end;

procedure TFormCadastroUsuario.CarregarDadosParaEdicao;
var
  Usuario: TUsuarioModel;
begin
  if DataSource1.DataSet.IsEmpty then
    Exit;

  try
    FIdUsuarioSelecionado := DataSource1.DataSet.FieldByName('id').AsInteger;

    // Carrega dados b�sicos
    EdtNomeUser.Text := DataSource1.DataSet.FieldByName('nome').AsString;
    EdtCPFUser.Text := DataSource1.DataSet.FieldByName('cpf').AsString;
    EdtRGUser.Text := DataSource1.DataSet.FieldByName('rg').AsString;
    EdtTelefoneUser.Text := DataSource1.DataSet.FieldByName('telefone').AsString;
    EdtNascimentoUser.Text := DateToStr(DataSource1.DataSet.FieldByName('data_nascimento').AsDateTime);
    CbFuncaoUser.Text := DataSource1.DataSet.FieldByName('funcao').AsString;
    EdtSenhaUser.Text := ''; // N�o carrega a senha

    // Carrega permiss�es do banco
    Usuario := FUsuarioController.ObterPermissoes(FIdUsuarioSelecionado);
    try
      if Usuario <> nil then
      begin
        CheckCadastro.Checked := Usuario.PermCadastros;
        CheckCadastroEmp.Checked := Usuario.PermCadEmpresa;
        CheckCadastroPredi.Checked := Usuario.PermCadPredio;
        CheckCadastroSala.Checked := Usuario.PermCadSala;
        CheckCadastroPatri.Checked := Usuario.PermCadPatrimonio;

        CheckMovimentacoes.Checked := Usuario.PermMovimentacoes;
        CheckAnalisarMovi.Checked := Usuario.PermMovAnalisar;
        CheckAdicionarMovi.Checked := Usuario.PermMovAdicionar;
        CheckExcluirMovi.Checked := Usuario.PermMovExcluir;

        CheckOcorrencias.Checked := Usuario.PermOcorrencias;
        CheckAnalisarOcorre.Checked := Usuario.PermOcorAnalisar;
        CheckAdicionarOcorre.Checked := Usuario.PermOcorAdicionar;
        CheckExcluirOcorre.Checked := Usuario.PermOcorExcluir;

        CheckUsuarios.Checked := Usuario.PermUsuarios;
        CheckCadastrarUser.Checked := Usuario.PermUserCadastrar;
        CheckPermissaoUser.Checked := Usuario.PermUserPermissao;
      end;
    finally
      Usuario.Free;
    end;

  except
    on E: Exception do
      ShowMessage('Erro ao carregar dados: ' + E.Message);
  end;
end;

procedure TFormCadastroUsuario.BtnEditarUserClick(Sender: TObject);
begin
  if DataSource1.DataSet.IsEmpty then
  begin
    ShowMessage('Selecione um usu�rio para editar!');
    Exit;
  end;

  FModoEdicao := True;
  CarregarDadosParaEdicao;
  HabilitarCampos(True);
  EdtNomeUser.SetFocus;
end;

procedure TFormCadastroUsuario.BtnExcluirUserClick(Sender: TObject);
var
  IdUsuario: Integer;
  NomeUsuario: String;
begin
  if DataSource1.DataSet.IsEmpty then
  begin
    ShowMessage('Selecione um usu�rio para excluir!');
    Exit;
  end;

  NomeUsuario := DataSource1.DataSet.FieldByName('nome').AsString;

  if MessageDlg('Deseja realmente excluir o usu�rio "' + NomeUsuario + '"?',
                mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    try
      IdUsuario := DataSource1.DataSet.FieldByName('id').AsInteger;
      FUsuarioController.ExcluirUsuario(IdUsuario);
      ShowMessage('Usu�rio exclu�do com sucesso!');
      AtualizarGrid;
      LimparCampos;
    except
      on E: Exception do
        ShowMessage('Erro ao excluir usu�rio: ' + E.Message);
    end;
  end;
end;

procedure TFormCadastroUsuario.BtnAtualizarUserClick(Sender: TObject);
begin
  AtualizarGrid;
end;

procedure TFormCadastroUsuario.SearchBox1Change(Sender: TObject);
begin
  if Trim(SearchBox1.Text) <> '' then
    DataSource1.DataSet := FUsuarioController.PesquisarUsuario(SearchBox1.Text)
  else
    AtualizarGrid;
end;

// ============================================================================
// GERENCIAMENTO DE PERMISS�ES - CADASTROS
// ============================================================================

procedure TFormCadastroUsuario.ConfigurarPermissoesCadastro(AMarcar: Boolean);
begin
  CheckCadastroEmp.Checked := AMarcar;
  CheckCadastroPredi.Checked := AMarcar;
  CheckCadastroSala.Checked := AMarcar;
  CheckCadastroPatri.Checked := AMarcar;
end;

procedure TFormCadastroUsuario.CheckCadastroClick(Sender: TObject);
begin
  ConfigurarPermissoesCadastro(CheckCadastro.Checked);
end;

procedure TFormCadastroUsuario.CheckCadastroEmpClick(Sender: TObject);
begin
  VerificarCheckboxPrincipalCadastro;
end;

procedure TFormCadastroUsuario.CheckCadastroPredioClick(Sender: TObject);
begin
  VerificarCheckboxPrincipalCadastro;
end;

procedure TFormCadastroUsuario.CheckCadastroSalaClick(Sender: TObject);
begin
  VerificarCheckboxPrincipalCadastro;
end;

procedure TFormCadastroUsuario.CheckCadastroPatriClick(Sender: TObject);
begin
  VerificarCheckboxPrincipalCadastro;
end;

procedure TFormCadastroUsuario.VerificarCheckboxPrincipalCadastro;
begin
  // Se todos est�o marcados, marca o principal
  if CheckCadastroEmp.Checked and CheckCadastroPredi.Checked and
     CheckCadastroSala.Checked and CheckCadastroPatri.Checked then
    CheckCadastro.Checked := True
  else if not (CheckCadastroEmp.Checked or CheckCadastroPredi.Checked or
               CheckCadastroSala.Checked or CheckCadastroPatri.Checked) then
    CheckCadastro.Checked := False;
end;

// ============================================================================
// GERENCIAMENTO DE PERMISS�ES - MOVIMENTA��ES
// ============================================================================

procedure TFormCadastroUsuario.ConfigurarPermissoesMovimentacoes(AMarcar: Boolean);
begin
  CheckAnalisarMovi.Checked := AMarcar;
  CheckAdicionarMovi.Checked := AMarcar;
  CheckExcluirMovi.Checked := AMarcar;
end;

procedure TFormCadastroUsuario.CheckMovimentacoesClick(Sender: TObject);
begin
  ConfigurarPermissoesMovimentacoes(CheckMovimentacoes.Checked);
end;

procedure TFormCadastroUsuario.VerificarCheckboxPrincipalMovimentacoes;
begin
  if CheckAnalisarMovi.Checked and CheckAdicionarMovi.Checked and
     CheckExcluirMovi.Checked then
    CheckMovimentacoes.Checked := True
  else if not (CheckAnalisarMovi.Checked or CheckAdicionarMovi.Checked or
               CheckExcluirMovi.Checked) then
    CheckMovimentacoes.Checked := False;
end;

// ============================================================================
// GERENCIAMENTO DE PERMISS�ES - OCORR�NCIAS
// ============================================================================

procedure TFormCadastroUsuario.ConfigurarPermissoesOcorrencias(AMarcar: Boolean);
begin
  CheckAnalisarOcorre.Checked := AMarcar;
  CheckAdicionarOcorre.Checked := AMarcar;
  CheckExcluirOcorre.Checked := AMarcar;
end;

procedure TFormCadastroUsuario.CheckOcorrenciasClick(Sender: TObject);
begin
  ConfigurarPermissoesOcorrencias(CheckOcorrencias.Checked);
end;

procedure TFormCadastroUsuario.VerificarCheckboxPrincipalOcorrencias;
begin
  if CheckAnalisarOcorre.Checked and CheckAdicionarOcorre.Checked and
     CheckExcluirOcorre.Checked then
    CheckOcorrencias.Checked := True
  else if not (CheckAnalisarOcorre.Checked or CheckAdicionarOcorre.Checked or
               CheckExcluirOcorre.Checked) then
    CheckOcorrencias.Checked := False;
end;

// ============================================================================
// GERENCIAMENTO DE PERMISS�ES - USU�RIOS
// ============================================================================

procedure TFormCadastroUsuario.ConfigurarPermissoesUsuarios(AMarcar: Boolean);
begin
  CheckCadastrarUser.Checked := AMarcar;
  CheckPermissaoUser.Checked := AMarcar;
end;

procedure TFormCadastroUsuario.CheckUsuariosClick(Sender: TObject);
begin
  ConfigurarPermissoesUsuarios(CheckUsuarios.Checked);
end;

procedure TFormCadastroUsuario.VerificarCheckboxPrincipalUsuarios;
begin
  if CheckCadastrarUser.Checked and CheckPermissaoUser.Checked then
    CheckUsuarios.Checked := True
  else if not (CheckCadastrarUser.Checked or CheckPermissaoUser.Checked) then
    CheckUsuarios.Checked := False;
end;

end.
