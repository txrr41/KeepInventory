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
    EdtCPFUser: TMaskEdit;
    EdtTelefoneUser: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EdtRGUser: TMaskEdit;
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
    procedure FormDestroy(Sender: TObject);
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
    FUsuarioController: TUsuarioController;
    procedure HabilitarCampos(AHabilitar: Boolean);
    procedure LimparCampos;
    procedure AtualizarGrid;
    function ValidarCampos: Boolean;
    function ValidarCPF(const CPF: string): Boolean;
    function ValidarTelefone(const Telefone: string): Boolean;
    procedure CarregarDadosParaEdicao;
    function MontarDTO: TUsuarioDTO;
    function LimparCPF(const CPF: string): string;
    function LimparTelefone(const Telefone: string): string;
    function LimparRG(const RG: string): string;
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


  if Assigned(UsuarioLogado) then
  begin

    TPermissoesHelper.AplicarPermissoesUsuarios(Self);
  end
  else
  begin

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
    if Assigned(FUsuarioController) then
    begin
      DataSource1.DataSet := FUsuarioController.ListarUsuarios;
      DBGridUsuarios.DataSource := DataSource1;
    end
    else
    begin
      ShowMessage('Controlador de usuarios não inicializado!');
      DBGridUsuarios.DataSource := nil;
    end;
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao carregar usuarios: ' + E.Message);
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

  // Valida CPF
  if not ValidarCPF(LimparCPF(EdtCPFUser.Text)) then
  begin
    ShowMessage('CPF invalido! Verifique os numeros digitados.');
    EdtCPFUser.SetFocus;
    Exit;
  end;

  // Valida telefone se preenchido
  if Trim(EdtTelefoneUser.Text) <> '' then
  begin
    if not ValidarTelefone(LimparTelefone(EdtTelefoneUser.Text)) then
    begin
      ShowMessage('Telefone invalido! Verifique o DDD e o numero digitados.');
      EdtTelefoneUser.SetFocus;
      Exit;
    end;
  end;

  if CbFuncaoUser.ItemIndex = -1 then
  begin
    ShowMessage('Selecione a função do usuario!');
    CbFuncaoUser.SetFocus;
    Exit;
  end;

  // Valida senha apenas no modo de inclus�o
  if (not FModoEdicao) and (Trim(EdtSenhaUser.Text) = '') then
  begin
    ShowMessage('Informe a senha do usuario!');
    EdtSenhaUser.SetFocus;
    Exit;
  end;

  // Valida se pelo menos uma permiss�o foi marcada
  if not (CheckCadastro.Checked or CheckMovimentacoes.Checked or
          CheckOcorrencias.Checked or CheckUsuarios.Checked) then
  begin
    ShowMessage('Selecione pelo menos uma permiss�o para o usuario!');
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
  Dto.FCpf := LimparCPF(EdtCPFUser.Text);
  Dto.FRg := LimparRG(EdtRGUser.Text);
  Dto.FTelefone := LimparTelefone(EdtTelefoneUser.Text);

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
      ShowMessage('Usuario atualizado com sucesso!');
    end
    else
    begin
      FUsuarioController.AdicionarUsuario(Dto);
      ShowMessage('Usuario cadastrado com sucesso!');
    end;

    LimparCampos;
    HabilitarCampos(False);
    AtualizarGrid;
    FModoEdicao := False;

  except
    on E: Exception do
      ShowMessage('Erro ao salvar usuario: ' + E.Message);
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
    ShowMessage('Selecione um usuario para editar!');
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
    ShowMessage('Selecione um usuario para excluir!');
    Exit;
  end;

  NomeUsuario := DataSource1.DataSet.FieldByName('nome').AsString;

  if MessageDlg('Deseja realmente excluir o usuario "' + NomeUsuario + '"?',
                mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    try
      IdUsuario := DataSource1.DataSet.FieldByName('id').AsInteger;
      FUsuarioController.ExcluirUsuario(IdUsuario);
      ShowMessage('Usu�rio excluido com sucesso!');
      AtualizarGrid;
      LimparCampos;
    except
      on E: Exception do
        ShowMessage('Erro ao excluir usuario: ' + E.Message);
    end;
  end;
end;

procedure TFormCadastroUsuario.BtnAtualizarUserClick(Sender: TObject);
begin
  AtualizarGrid;
end;

procedure TFormCadastroUsuario.SearchBox1Change(Sender: TObject);
begin
  try
    if Assigned(FUsuarioController) then
    begin
      if Trim(SearchBox1.Text) <> '' then
      begin
        DataSource1.DataSet := FUsuarioController.PesquisarUsuario(SearchBox1.Text);
        DBGridUsuarios.DataSource := DataSource1;
      end
      else
      begin
        AtualizarGrid;
      end;
    end;
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao pesquisar usuários: ' + E.Message);
      AtualizarGrid;
    end;
  end;
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

// ============================================================================
// VALIDAÇÕES DE CPF E TELEFONE
// ============================================================================

function TFormCadastroUsuario.ValidarCPF(const CPF: string): Boolean;
var
  dig10, dig11: string;
  soma, i, resto: Integer;
begin
  Result := False;

  // CPF deve ter 11 dígitos (já deve vir limpo)
  if Length(CPF) <> 11 then
    Exit;

  // Verifica se todos os dígitos são iguais
  if (CPF = '11111111111') or
     (CPF = '22222222222') or
     (CPF = '33333333333') or
     (CPF = '44444444444') or
     (CPF = '55555555555') or
     (CPF = '66666666666') or
     (CPF = '77777777777') or
     (CPF = '88888888888') or
     (CPF = '99999999999') or
     (CPF = '00000000000') then
    Exit;

  // Cálculo do primeiro dígito verificador
  soma := 0;
  for i := 1 to 9 do
    soma := soma + (StrToInt(CPF[i]) * (11 - i));
  resto := soma mod 11;
  if resto < 2 then
    dig10 := '0'
  else
    dig10 := IntToStr(11 - resto);

  // Cálculo do segundo dígito verificador
  soma := 0;
  for i := 1 to 10 do
    soma := soma + (StrToInt(CPF[i]) * (12 - i));
  resto := soma mod 11;
  if resto < 2 then
    dig11 := '0'
  else
    dig11 := IntToStr(11 - resto);

  // Verifica se os dígitos calculados conferem
  Result := (CPF[10] = dig10) and (CPF[11] = dig11);
end;

function TFormCadastroUsuario.ValidarTelefone(const Telefone: string): Boolean;
var
  DDD: string;
begin
  Result := False;

  // Telefone deve ter 10 ou 11 dígitos (já deve vir limpo)
  if (Length(Telefone) <> 10) and (Length(Telefone) <> 11) then
    Exit;

  // Verifica se o DDD é válido
  if Length(Telefone) >= 10 then
  begin
    DDD := Copy(Telefone, 1, 2);

    // Lista de DDDs válidos do Brasil (até 2024)
    Result := (DDD = '11') or (DDD = '12') or (DDD = '13') or (DDD = '14') or (DDD = '15') or
              (DDD = '16') or (DDD = '17') or (DDD = '18') or (DDD = '19') or (DDD = '21') or
              (DDD = '22') or (DDD = '24') or (DDD = '27') or (DDD = '28') or (DDD = '31') or
              (DDD = '32') or (DDD = '33') or (DDD = '34') or (DDD = '35') or (DDD = '37') or
              (DDD = '38') or (DDD = '41') or (DDD = '42') or (DDD = '43') or (DDD = '44') or
              (DDD = '45') or (DDD = '46') or (DDD = '47') or (DDD = '48') or (DDD = '49') or
              (DDD = '51') or (DDD = '53') or (DDD = '54') or (DDD = '55') or (DDD = '61') or
              (DDD = '62') or (DDD = '63') or (DDD = '64') or (DDD = '65') or (DDD = '66') or
              (DDD = '67') or (DDD = '68') or (DDD = '69') or (DDD = '71') or (DDD = '73') or
              (DDD = '74') or (DDD = '75') or (DDD = '77') or (DDD = '79') or (DDD = '81') or
              (DDD = '82') or (DDD = '83') or (DDD = '84') or (DDD = '85') or (DDD = '86') or
              (DDD = '87') or (DDD = '88') or (DDD = '89') or (DDD = '91') or (DDD = '92') or
              (DDD = '93') or (DDD = '94') or (DDD = '95') or (DDD = '96') or (DDD = '97') or
              (DDD = '98') or (DDD = '99');

    // Verifica se o número não começa com 0 ou 1
    if Result and (Length(Telefone) >= 3) then
      Result := (Telefone[3] <> '0') and (Telefone[3] <> '1');
  end;
end;

procedure TFormCadastroUsuario.FormDestroy(Sender: TObject);
begin
  if Assigned(FUsuarioController) then
    FreeAndNil(FUsuarioController);
  inherited;
end;

// ============================================================================
// FUNÇÕES DE LIMPEZA DE FORMATAÇÃO
// ============================================================================

function TFormCadastroUsuario.LimparCPF(const CPF: string): string;
var
  i: Integer;
begin
  Result := '';
  // Remove todos os caracteres que não são dígitos
  for i := 1 to Length(CPF) do
    if CPF[i] in ['0'..'9'] then
      Result := Result + CPF[i];
end;

function TFormCadastroUsuario.LimparTelefone(const Telefone: string): string;
var
  i: Integer;
begin
  Result := '';
  // Remove todos os caracteres que não são dígitos
  for i := 1 to Length(Telefone) do
    if Telefone[i] in ['0'..'9'] then
      Result := Result + Telefone[i];
end;

function TFormCadastroUsuario.LimparRG(const RG: string): string;
var
  i: Integer;
begin
  Result := '';
  // Remove todos os caracteres que não são dígitos
  for i := 1 to Length(RG) do
    if RG[i] in ['0'..'9'] then
      Result := Result + RG[i];
end;

end.
