unit CadastrosView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.StdCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.WinXCtrls, Vcl.Mask,
  EmpresaController, EmpresaDTO, EmpresaModel, PredioDTO, PredioModel, PredioController,
  SalaDTO, SalaController, PatrimonioDTO, PatrimonioController,
  AuditoriaController, AuditoriaModel, PatrimonioImportacaoCSV, Winapi.ShellAPI; // ADICIONADO

type
  TFormCadastro = class(TForm)
   PanelCadastro: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    Label1: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Panel4: TPanel;
    Panel5: TPanel;
    Shape1: TShape;
    Panel6: TPanel;
    Panel7: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    edtPesquisar: TSearchBox;
    Panel10: TPanel;
    BtnAdicionarEmpresa: TSpeedButton;
    Panel9: TPanel;
    Label6: TLabel;
    Shape5: TShape;
    BtnFiltrarEmpresa: TSpeedButton;
    Panel8: TPanel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Shape4: TShape;
    BtnAtualizarEmpresa: TSpeedButton;
    Label13: TLabel;
    Shape2: TShape;
    BtnEditarEmpresa: TSpeedButton;
    Shape3: TShape;
    BtnExcluirEmpresa: TSpeedButton;
    Label12: TLabel;
    Label4: TLabel;
    Label9: TLabel;
    Label14: TLabel;
    Shape6: TShape;
    Shape7: TShape;
    Shape9: TShape;
    PanelAddEmpresa: TPanel;
    EditRazao: TEdit;
    EditFantasia: TEdit;
    EditRua: TEdit;
    EditCnpj: TMaskEdit;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    EditTelefone: TMaskEdit;
    Label18: TLabel;
    Label19: TLabel;
    EditCep: TMaskEdit;
    Label20: TLabel;
    EditNumero: TEdit;
    Label21: TLabel;
    EditBairro: TEdit;
    Label22: TLabel;
    EditCidade: TEdit;
    Label23: TLabel;
    EditEstado: TEdit;
    Label24: TLabel;
    Panel11: TPanel;
    Shape8: TShape;
    Shape10: TShape;
    Shape11: TShape;
    PanelAddPredio: TPanel;
    Label25: TLabel;
    Label26: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    EdtNamePredio: TEdit;
    EditRuaPredio: TEdit;
    EdtTelefonePredio: TMaskEdit;
    EdtCepPredio: TMaskEdit;
    EdtNumeroPredio: TEdit;
    EdtBairroPredio: TEdit;
    EdtCidadePredio: TEdit;
    EdtEstadoPredio: TEdit;
    Panel13: TPanel;
    Panel14: TPanel;
    Shape12: TShape;
    Label35: TLabel;
    BtnAdicionarPredio: TSpeedButton;
    Panel15: TPanel;
    Label36: TLabel;
    Label37: TLabel;
    Shape13: TShape;
    BtnEditarPredio: TSpeedButton;
    Label38: TLabel;
    Panel16: TPanel;
    Shape14: TShape;
    BtnExcluirPredio: TSpeedButton;
    Label39: TLabel;
    Panel17: TPanel;
    Label40: TLabel;
    Shape15: TShape;
    BtnFiltrarPredio: TSpeedButton;
    Label41: TLabel;
    Panel18: TPanel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Shape16: TShape;
    BtnAtualizarPredio: TSpeedButton;
    Label47: TLabel;
    Panel19: TPanel;
    DBGridPredio: TDBGrid;
    edtPesquisarPredio: TSearchBox;
    ComboBoxSituacao: TComboBox;
    Panel3: TPanel;
    Shape17: TShape;
    Shape18: TShape;
    Shape19: TShape;
    Panel20: TPanel;
    Panel21: TPanel;
    Shape20: TShape;
    Label56: TLabel;
    BtnAdicionarSala: TSpeedButton;
    Panel22: TPanel;
    Label57: TLabel;
    Label58: TLabel;
    Shape21: TShape;
    BtnEditarSala: TSpeedButton;
    Label59: TLabel;
    Panel23: TPanel;
    Shape22: TShape;
    BtnExcluirSala: TSpeedButton;
    Label60: TLabel;
    Panel24: TPanel;
    Label61: TLabel;
    Shape23: TShape;
    BtnFiltrarSala: TSpeedButton;
    Label62: TLabel;
    Panel25: TPanel;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Shape24: TShape;
    BtnAtualizarSala: TSpeedButton;
    Label68: TLabel;
    Panel26: TPanel;
    DBGridSalas: TDBGrid;
    EdtPesquisarSala: TSearchBox;
    PanelAddSala: TPanel;
    Label27: TLabel;
    Label48: TLabel;
    EdtSituacaoSala: TComboBox;
    ComboBox2: TComboBox;
    EditNameSala: TEdit;
    Label49: TLabel;
    EdtObs: TEdit;
    Label50: TLabel;
    EdtTipoSala: TEdit;
    Label55: TLabel;
    BtnEnviar: TButton;
    DataSEmpresa: TDataSource;
    BtnConfirmarEd: TButton;
    BtnEnviarPredio: TButton;
    BtnConfirmarEdPredio: TButton;
    BtnEnviarSala: TButton;
    BtnConfirmarEdtSala: TButton;
    Panel12: TPanel;
    Shape25: TShape;
    Shape26: TShape;
    Shape27: TShape;
    Panel27: TPanel;
    Panel28: TPanel;
    Shape28: TShape;
    Label51: TLabel;
    BtnAdicionarPatrimonio: TSpeedButton;
    Panel29: TPanel;
    Label52: TLabel;
    Label53: TLabel;
    Shape29: TShape;
    SpeedButton2: TSpeedButton;
    Label54: TLabel;
    Panel30: TPanel;
    Shape30: TShape;
    SpeedButton3: TSpeedButton;
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
    Panel33: TPanel;
    DBGridPatrimonio: TDBGrid;
    SearchBox1: TSearchBox;
    Panel34: TPanel;
    Label79: TLabel;
    Label80: TLabel;
    Label82: TLabel;
    CBSituacaoPatri: TComboBox;
    EditNomePatri: TEdit;
    EdtTipoPatri: TEdit;
    BtnEnviarPatrimonio: TButton;
    EdtVAQPatri: TMaskEdit;
    EdtNS: TEdit;
    Label83: TLabel;
    EdtModelo: TEdit;
    Label84: TLabel;
    EdtVAPatri: TMaskEdit;
    Label81: TLabel;
    Label85: TLabel;
    EdtDAPatri: TMaskEdit;
    Label86: TLabel;
    ComboBoxPatrimonio: TComboBox;
    BtnConfirmarEdPatri: TButton;
    Label87: TLabel;
    Panel35: TPanel;
    Panel36: TPanel;
    Label89: TLabel;
    Panel37: TPanel;
    Shape33: TShape;
    SpeedButton6: TSpeedButton;
    Label88: TLabel;
    Panel38: TPanel;
    Shape34: TShape;
    SpeedButton1: TSpeedButton;
    Label90: TLabel;
    procedure PageControl1Change(Sender: TObject);
    procedure BtnEnviarClick(Sender: TObject);
    procedure BtnConfirmarEdClick(Sender: TObject);

    procedure BtnEditarEmpresaClick(Sender: TObject);
    procedure BtnExcluirEmpresaClick(Sender: TObject);
    procedure BtnAtualizarEmpresaClick(Sender: TObject);
    procedure BtnFiltrarEmpresaClick(Sender: TObject);
    procedure edtPesquisarChange(Sender: TObject);
    procedure BtnConfirmarEdPredioClick(Sender: TObject);
    procedure BtnEnviarPredioClick(Sender: TObject);
    procedure BtnAdicionarPredioClick(Sender: TObject);
    procedure BtnEditarPredioClick(Sender: TObject);
    procedure BtnExcluirPredioClick(Sender: TObject);
    procedure BtnAtualizarPredioClick(Sender: TObject);
    procedure BtnFiltrarPredioClick(Sender: TObject);
    procedure edtPesquisarPredioChange(Sender: TObject);
    procedure BtnEnviarSalaClick(Sender: TObject);
    procedure BtnConfirmarEdtSalaClick(Sender: TObject);
    procedure BtnAdicionarSalaClick(Sender: TObject);
    procedure BtnEditarSalaClick(Sender: TObject);
    procedure BtnExcluirSalaClick(Sender: TObject);
    procedure BtnAtualizarSalaClick(Sender: TObject);
    procedure BtnFiltrarSalaClick(Sender: TObject);
    procedure EdtPesquisarSalaChange(Sender: TObject);
    procedure BtnConfirmarEdPatriClick(Sender: TObject);
    procedure BtnEnviarPatrimonioClick(Sender: TObject);
    procedure BtnAdicionarPatrimonioClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SearchBox1Change(Sender: TObject);
    procedure EditNameSalaChange(Sender: TObject);
    function  CarregarObjeto : TEmpresaDTO;
    procedure AtualizarTabelaP;
    procedure AtualizarTabelaE;
    procedure PopularComboBox;
    procedure AtualizarTabelaS;
    constructor Create(AComponent: TComponent; const UsuarioLogado: String);
    procedure BtnAdicionarEmpresaClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
 private
  FLogController: TLogController; // ADICIONADO
    FUsuarioLogado: String; // ADICIONADO
    procedure RegistrarLog(const Mensagem: String); // ADICIONADO
    procedure AtualizarTabelaPatrimonio;
    procedure BtnAtualizarPatrimonioClick(Sender: TObject);
    procedure BtnEditarPatrimonioClick(Sender: TObject);
    procedure BtnExcluirPatrimonioClick(Sender: TObject);
    procedure BtnFiltrarPatrimonioClick(Sender: TObject);
    procedure LimparCamposPatrimonio;
    procedure PopularComboBoxSalas;

    { Private declarations }
  end;

var
  FormCadastro: TFormCadastro;

implementation

{$R *.dfm}

// ============================================================================
// MÉTODO PARA REGISTRAR LOG
// ============================================================================
procedure TFormCadastro.RegistrarLog(const Mensagem: String);
var
  UsuarioLog: TUserLog;
  DataHora: TDateTime;
begin
  try
    UsuarioLog := TUserLog.Create;
    try
      UsuarioLog.UserName := FUsuarioLogado;
      DataHora := Now;
      UsuarioLog.Date := DataHora;
      UsuarioLog.Msg := Mensagem;
      FLogController.RegAuditoria(UsuarioLog);
    finally
      UsuarioLog.Free;
    end;
  except
    on E: Exception do
      ShowMessage('Erro ao registrar log: ' + E.Message);
  end;
end;

// ============================================================================
// CONSTRUCTOR E DESTRUCTOR
// ============================================================================
constructor TFormCadastro.Create(AComponent: TComponent; const UsuarioLogado: String);
begin
  inherited Create(AComponent);
  FUsuarioLogado := UsuarioLogado;
  FLogController := TLogController.Create;
  FSalaController := TSalaController.Create;
  FPatrimonioController := TPatrimonioController.Create;
  RegistrarLog('Acessou o módulo de Cadastros');
end;



procedure TFormCadastro.EditNameSalaChange(Sender: TObject);
begin

end;

// ============================================================================
// EMPRESA - CRUD COM LOG
// ============================================================================









// ============================================================================
// PRÉDIO - CRUD COM LOG
// ============================================================================

procedure TFormCadastro.BtnEnviarClick(Sender: TObject);
var
  Controller: TEmpresaController;
  Dto: TEmpresaDTO;
begin
  Controller := TEmpresaController.Create;
  try
    dto := CarregarObjeto;
    Controller.AdicionarEmpresa(dto);

    // LOG: Cadastrou empresa
    RegistrarLog('Cadastrou empresa - ' + EditFantasia.Text + ' (CNPJ: ' + EditCnpj.Text + ')');

    ShowMessage('Empresa adicionada com sucesso!');
    PanelAddEmpresa.Visible := False;

    // Limpar campos
    EditFantasia.Text := '';
    EditRazao.Text := '';
    EditCnpj.Text := '';
    EditTelefone.Text := '';
    EditCep.Text := '';
    EditRua.Text := '';
    EditCidade.Text := '';
    EditEstado.Text := '';
    EditNumero.Text := '';
    EditBairro.Text := '';

    AtualizarTabelaE;
  finally
    Controller.Free;
  end;
end;

procedure TFormCadastro.BtnEnviarPatrimonioClick(Sender: TObject);
var
  Dto: TPatrimonioDTO;
  SelectedID: Integer;
begin
  try
    if ComboBoxPatrimonio.ItemIndex >= 0 then
    begin
      SelectedID := Integer(NativeInt(ComboBoxPatrimonio.Items.Objects[ComboBoxPatrimonio.ItemIndex]));
      Dto.FIdSala := SelectedID;
    end
    else
    begin
      raise Exception.Create('Por favor, selecione uma Sala.');
    end;

    Dto.FNome := EditNomePatri.Text;
    Dto.FTipo := EdtTipoPatri.Text;
    Dto.FSituacao := CBSituacaoPatri.Text;
    Dto.FModelo := EdtModelo.Text;
    Dto.FNome := EditNomePatri.Text;
    Dto.FTipo := EdtTipoPatri.Text;
    Dto.FSituacao := CBSituacaoPatri.Text;
    Dto.FModelo := EdtModelo.Text;

    // Converte valor removendo formatação
    Dto.FValorAquisicao := StrToCurrDef(
      StringReplace(
    StringReplace(EdtVAQPatri.Text, '.', '', [rfReplaceAll]),
    ',', '.', [rfReplaceAll]
     ), 0);

    Dto.FValorAtual := StrToCurrDef(
    StringReplace(
    StringReplace(EdtVAPatri.Text, '.', '', [rfReplaceAll]),
    ',', '.', [rfReplaceAll]
    ), 0);

    Dto.FDataAquisicao := StrToDate(EdtDAPatri.Text);
    Dto.FNumeroSerie := EdtNS.Text;
    Dto.FDataAquisicao := StrToDate(EdtDAPatri.Text);
    Dto.FNumeroSerie := EdtNS.Text;

    FPatrimonioController.AdicionarPatrimonio(Dto);

    // LOG: Cadastrou patrimônio
    RegistrarLog('Cadastrou patrimônio - ' + EditNomePatri.Text + ' (NS: ' + EdtNS.Text + ')');

    AtualizarTabelaPatrimonio;
    LimparCamposPatrimonio;
    Panel34.Visible := False;

    ShowMessage('Patrimônio adicionado com sucesso!');
  except
    on E: Exception do
      ShowMessage('Erro ao salvar: ' + E.Message);
  end;

end;

procedure TFormCadastro.BtnEnviarPredioClick(Sender: TObject);
var
  Dto: GPredioDTO;
begin
  try
    Dto.FNome := EdtNamePredio.Text;
    Dto.FSituacao := ComboBoxSituacao.Text;
    Dto.FTelefone := EdtTelefonePredio.Text;
    Dto.FCep := EdtCepPredio.Text;
    Dto.FRua := EditRuaPredio.Text;
    Dto.FCidade := EdtCidadePredio.Text;
    Dto.FEstado := EdtEstadoPredio.Text;
    Dto.FNumero := StrToInt(EdtNumeroPredio.Text);
    Dto.FBairro := EdtBairroPredio.Text;

    ControllerPredio.AdicionarPredio(Dto);

    // LOG: Cadastrou prédio
    RegistrarLog('Cadastrou prédio - ' + EdtNamePredio.Text + ' (' + EdtCidadePredio.Text + ')');

    // Limpar campos
    EdtNamePredio.Text := '';
    ComboBoxSituacao.Text := '';
    EdtTelefonePredio.Text := '';
    EdtCepPredio.Text := '';
    EditRuaPredio.Text := '';
    EdtCidadePredio.Text := '';
    EdtEstadoPredio.Text := '';
    EdtNumeroPredio.Text := '';
    EdtBairroPredio.Text := '';

    PanelAddPredio.Visible := False;
    AtualizarTabelaP;
    ShowMessage('Prédio adicionado com sucesso!');
  finally
  end;

end;


procedure TFormCadastro.BtnEnviarSalaClick(Sender: TObject);
var
  Dto: TSalaDTO;
  SelectedID: Integer;
begin
  try
    if ComboBox2.ItemIndex >= 0 then
    begin
      SelectedID := Integer(NativeInt(ComboBox2.Items.Objects[ComboBox2.ItemIndex]));
      Dto.FIdPredio := SelectedID;
    end
    else
    begin
      raise Exception.Create('Por favor, selecione um Prédio.');
    end;

    Dto.FNome := EditNameSala.Text;
    Dto.FSituacao := EdtSituacaoSala.Text;
    Dto.FTipo := EdtTipoSala.Text;
    Dto.FObservacao := EdtObs.Text;

    FSalaController.AdicionarSala(Dto);

    // LOG: Cadastrou sala
    RegistrarLog('Cadastrou sala - ' + EditNameSala.Text + ' (Tipo: ' + EdtTipoSala.Text + ')');

    AtualizarTabelaS;

    // Limpar campos
    EditNameSala.Text := '';
    ComboBox2.ItemIndex := -1;
    EdtSituacaoSala.Text := '';
    EdtTipoSala.Text := '';
    EdtObs.Text := '';

    PanelAddSala.Visible := False;
    ShowMessage('Sala adicionada com sucesso!');
  except
    on E: Exception do
      ShowMessage('Erro ao salvar: ' + E.Message);
  end;

end;

procedure TFormCadastro.edtPesquisarChange(Sender: TObject);
var
  Controller: TEmpresaController;
begin
  Controller := TEmpresaController.Create;
  try
    DataSEmpresa.DataSet := Controller.PesquisarEmpresa(edtPesquisar.Text);
    DbGrid1.DataSource := DataSEmpresa;

    // LOG: Pesquisou empresa
    if edtPesquisar.Text <> '' then
      RegistrarLog('Pesquisou empresa - Termo: "' + edtPesquisar.Text + '"');
  finally
    Controller.Free;
  end;

end;



procedure TFormCadastro.edtPesquisarPredioChange(Sender: TObject);
begin
  DataSEmpresa.DataSet := ControllerPredio.PesquisarPredio(edtPesquisarPredio.Text);
  DBGridPredio.DataSource := DataSEmpresa;

  // LOG: Pesquisou prédio
  if edtPesquisarPredio.Text <> '' then
    RegistrarLog('Pesquisou prédio - Termo: "' + edtPesquisarPredio.Text + '"');
end;

procedure TFormCadastro.EdtPesquisarSalaChange(Sender: TObject);
begin
 DataSEmpresa.DataSet := FSalaController.PesquisarSala(edtPesquisarSala.Text);
  DBGridSalas.DataSource := DataSEmpresa;

  // LOG: Pesquisou sala
  if edtPesquisarSala.Text <> '' then
    RegistrarLog('Pesquisou sala - Termo: "' + edtPesquisarSala.Text + '"');
end;


procedure TFormCadastro.BtnAtualizarPredioClick(Sender: TObject);
begin
  AtualizarTabelaP;
  RegistrarLog('Atualizou lista de prédios');
end;

procedure TFormCadastro.BtnAtualizarSalaClick(Sender: TObject);
begin
  AtualizarTabelaS;
  RegistrarLog('Atualizou lista de salas');
end;

// ============================================================================
// SALA - CRUD COM LOG
// ============================================================================









// ============================================================================
// PATRIMÔNIO - CRUD COM LOG
// ============================================================================







procedure TFormCadastro.BtnConfirmarEdClick(Sender: TObject);
var
  EmpModel: TEmpresaConfig;
  Controller: TEmpresaController;
  Dto: TEmpresaDTO;
  NomeEmpresa: String;
begin
  Controller := TEmpresaController.Create;
  try
    NomeEmpresa := EditFantasia.Text;
    EmpModel := Controller.DtoForModel(CarregarObjeto);
    Controller.EditarEmpresa(CarregarObjeto);

    // LOG: Alterou empresa
    RegistrarLog('Alterou empresa - ' + NomeEmpresa + ' (ID: ' + IntToStr(DBGrid1.DataSource.DataSet.FieldByName('id').AsInteger) + ')');

    // Limpar campos
    EditFantasia.Text := '';
    EditRazao.Text := '';
    EditCnpj.Text := '';
    EditTelefone.Text := '';
    EditCep.Text := '';
    EditRua.Text := '';
    EditCidade.Text := '';
    EditEstado.Text := '';
    EditNumero.Text := '';
    EditBairro.Text := '';
    PanelAddEmpresa.Visible := False;

    AtualizarTabelaE;
    ShowMessage('Empresa atualizada com sucesso!');
  finally
    Controller.Free;
  end;

end;

procedure TFormCadastro.BtnConfirmarEdPatriClick(Sender: TObject);
var
  Dto: TPatrimonioDTO;
  SelectedID: Integer;
  NomePatri: String;
  IdPatri: Integer;
begin
  try
    NomePatri := EditNomePatri.Text;
    IdPatri := DBGridPatrimonio.DataSource.DataSet.FieldByName('id').AsInteger;

    SelectedID := Integer(NativeInt(ComboBoxPatrimonio.Items.Objects[ComboBoxPatrimonio.ItemIndex]));
    Dto.FIdSala := SelectedID;
    Dto.FNome := EditNomePatri.Text;
    Dto.FTipo := EdtTipoPatri.Text;
    Dto.FSituacao := CBSituacaoPatri.Text;
    Dto.FModelo := EdtModelo.Text;
    Dto.FValorAquisicao := StrToCurrDef(EdtVAQPatri.Text, 0);
    Dto.FValorAtual := StrToCurrDef(EdtVAPatri.Text, 0);
    Dto.FDataAquisicao := StrToDate(EdtDAPatri.Text);
    Dto.FNumeroSerie := EdtNS.Text;
    Dto.FId := IdPatri;

    FPatrimonioController.EditarPatrimonio(Dto);

    // LOG: Alterou patrimônio
    RegistrarLog('Alterou patrimônio - ' + NomePatri + ' (ID: ' + IntToStr(IdPatri) + ')');

    AtualizarTabelaPatrimonio;
    LimparCamposPatrimonio;
    Panel34.Visible := False;

    ShowMessage('Patrimônio atualizado com sucesso!');
  except
    on E: Exception do
      ShowMessage('Erro ao editar: ' + E.Message);
  end;

end;

procedure TFormCadastro.BtnConfirmarEdPredioClick(Sender: TObject);
var
  Dto: GPredioDTO;
  NomePredio: String;
  IdPredio: Integer;
begin
  NomePredio := EdtNamePredio.Text;
  IdPredio := DBGridPredio.DataSource.DataSet.FieldByName('id').AsInteger;

  Dto.FNome := EdtNamePredio.Text;
  Dto.FSituacao := ComboBoxSituacao.Text;
  Dto.FTelefone := EdtTelefonePredio.Text;
  Dto.FCep := EdtCepPredio.Text;
  Dto.FRua := EditRuaPredio.Text;
  Dto.FCidade := EdtCidadePredio.Text;
  Dto.FEstado := EdtEstadoPredio.Text;
  Dto.FNumero := StrToInt(EdtNumeroPredio.Text);
  Dto.FBairro := EdtBairroPredio.Text;
  Dto.FId := IdPredio;

  ControllerPredio.EditarPredio(Dto);

  // LOG: Alterou prédio
  RegistrarLog('Alterou prédio - ' + NomePredio + ' (ID: ' + IntToStr(IdPredio) + ')');

  AtualizarTabelaP;

  // Limpar campos
  EdtNamePredio.Text := '';
  ComboBoxSituacao.Text := '';
  EdtTelefonePredio.Text := '';
  EdtCepPredio.Text := '';
  EditRuaPredio.Text := '';
  EdtCidadePredio.Text := '';
  EdtEstadoPredio.Text := '';
  EdtNumeroPredio.Text := '';
  EdtBairroPredio.Text := '';

  PanelAddPredio.Visible := False;
  ShowMessage('Prédio atualizado com sucesso!');

end;

procedure TFormCadastro.BtnConfirmarEdtSalaClick(Sender: TObject);
var
  Dto: TSalaDTO;
  SelectedID: Integer;
  NomeSala: String;
  IdSala: Integer;
begin
  NomeSala := EditNameSala.Text;
  IdSala := DBGridSalas.DataSource.DataSet.FieldByName('id').AsInteger;

  SelectedID := Integer(NativeInt(ComboBox2.Items.Objects[ComboBox2.ItemIndex]));
  Dto.FIdPredio := SelectedID;
  Dto.FNome := EditNameSala.Text;
  Dto.FSituacao := EdtSituacaoSala.Text;
  Dto.FTipo := EdtTipoSala.Text;
  Dto.FObservacao := EdtObs.Text;
  Dto.FId := IdSala;

  FSalaController.EditarSala(Dto);

  // LOG: Alterou sala
  RegistrarLog('Alterou sala - ' + NomeSala + ' (ID: ' + IntToStr(IdSala) + ')');

  // Limpar campos
  EditNameSala.Text := '';
  ComboBox2.ItemIndex := -1;
  EdtSituacaoSala.Text := '';
  EdtTipoSala.Text := '';
  EdtObs.Text := '';

  PanelAddSala.Visible := False;
  AtualizarTabelaS;
  ShowMessage('Sala atualizada com sucesso!');

end;

procedure TFormCadastro.BtnExcluirEmpresaClick(Sender: TObject);
var
  IdUser: Integer;
  Controller: TEmpresaController;
  Emp: String;
begin
  Emp := DBGrid1.DataSource.DataSet.FieldByName('nome_fantasia').AsString;
  if MessageDlg('A Empresa ' + Emp + ' será excluída, deseja continuar?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    IdUser := DBGrid1.DataSource.DataSet.FieldByName('id').AsInteger;
    Controller := TEmpresaController.Create;
    try
      Controller.ExcluirEmpresa(IdUser);

      // LOG: Excluiu empresa
      RegistrarLog('Excluiu empresa - ' + Emp + ' (ID: ' + IntToStr(IdUser) + ')');

      AtualizarTabelaE;
      ShowMessage('Empresa excluída com sucesso!');
    finally
      Controller.Free;
    end;
  end;

end;

procedure TFormCadastro.BtnExcluirPatrimonioClick(Sender: TObject);
var
  IdPatrimonio: Integer;
  Patrimonio: String;
begin
  Patrimonio := DBGridPatrimonio.DataSource.DataSet.FieldByName('nome').AsString;
  if MessageDlg('O Patrimônio ' + Patrimonio + ' será excluído, deseja continuar?',
                mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    IdPatrimonio := DBGridPatrimonio.DataSource.DataSet.FieldByName('id').AsInteger;
    FPatrimonioController.ExcluirPatrimonio(IdPatrimonio);

    // LOG: Excluiu patrimônio
    RegistrarLog('Excluiu patrimônio - ' + Patrimonio + ' (ID: ' + IntToStr(IdPatrimonio) + ')');

    AtualizarTabelaPatrimonio;
    ShowMessage('Patrimônio excluído com sucesso!');
  end;
end;

procedure TFormCadastro.BtnExcluirPredioClick(Sender: TObject);
var
  IdPredio: Integer;
  Predio: String;
begin
  Predio := DBGridPredio.DataSource.DataSet.FieldByName('nome').AsString;
  if MessageDlg('O Prédio ' + Predio + ' será excluído, deseja continuar?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    IdPredio := DBGridPredio.DataSource.DataSet.FieldByName('id').AsInteger;
    ControllerPredio.ExcluirPredio(IdPredio);

    // LOG: Excluiu prédio
    RegistrarLog('Excluiu prédio - ' + Predio + ' (ID: ' + IntToStr(IdPredio) + ')');

    AtualizarTabelaP;
    ShowMessage('Prédio excluído com sucesso!');
  end;

end;

procedure TFormCadastro.BtnExcluirSalaClick(Sender: TObject);
var
  IdSala: Integer;
  Sala: String;
begin
  Sala := DBGridSalas.DataSource.DataSet.FieldByName('nome').AsString;
  if MessageDlg('A Sala ' + Sala + ' será excluída, deseja continuar?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    IdSala := DBGridSalas.DataSource.DataSet.FieldByName('id').AsInteger;
    FSalaController.ExcluirSala(IdSala);

    // LOG: Excluiu sala
    RegistrarLog('Excluiu sala - ' + Sala + ' (ID: ' + IntToStr(IdSala) + ')');

    AtualizarTabelaS;
    ShowMessage('Sala excluída com sucesso!');
  end;

end;



procedure TFormCadastro.SearchBox1Change(Sender: TObject);
begin
  DataSEmpresa.DataSet := FPatrimonioController.PesquisarPatrimonio(SearchBox1.Text);
  DBGridPatrimonio.DataSource := DataSEmpresa;

  // LOG: Pesquisou patrimônio
  if SearchBox1.Text <> '' then
    RegistrarLog('Pesquisou patrimônio - Termo: "' + SearchBox1.Text + '"');
end;

procedure TFormCadastro.SpeedButton1Click(Sender: TObject);
var
  SaveDialog: TSaveDialog;
  CaminhoArquivo: string;
begin
  SaveDialog := TSaveDialog.Create(nil);
  try
    SaveDialog.Filter := 'Arquivos CSV (*.csv)|*.csv';
    SaveDialog.DefaultExt := 'csv';
    SaveDialog.FileName := 'modelo_importacao_patrimonio.csv';
    SaveDialog.Title := 'Salvar Modelo CSV';
    SaveDialog.InitialDir := ExtractFilePath(Application.ExeName);

    if SaveDialog.Execute then
    begin
      try
        CaminhoArquivo := SaveDialog.FileName;

        // Gera o modelo CSV
        TPatrimonioImportacaoCSV.GerarModeloCSV(CaminhoArquivo);

        // Pergunta se quer abrir
        if MessageDlg(
          'Modelo CSV criado com sucesso!' + sLineBreak + sLineBreak +
          'O arquivo contém instruções detalhadas e exemplos.' + sLineBreak + sLineBreak +
          'IMPORTANTE: Consulte o ID das salas no sistema antes de preencher!' + sLineBreak + sLineBreak +
          'Deseja abrir o arquivo agora?',
          mtInformation, [mbYes, mbNo], 0) = mrYes then
        begin
          ShellExecute(0, 'open', PChar(CaminhoArquivo), nil, nil, SW_SHOW);
        end;

      except
        on E: Exception do
          ShowMessage('Erro ao gerar modelo CSV: ' + E.Message);
      end;
    end;
  finally
    SaveDialog.Free;
  end;
end;

procedure TFormCadastro.SpeedButton2Click(Sender: TObject);
begin
 BtnConfirmarEdPatri.Visible := True;
  BtnEnviarPatrimonio.Visible := False;
  Panel34.Visible := True;

  try
    EditNomePatri.Text := DBGridPatrimonio.DataSource.DataSet.FieldByName('nome').AsString;
    EdtTipoPatri.Text := DBGridPatrimonio.DataSource.DataSet.FieldByName('tipo').AsString;
    CBSituacaoPatri.Text := DBGridPatrimonio.DataSource.DataSet.FieldByName('situacao').AsString;
    EdtModelo.Text := DBGridPatrimonio.DataSource.DataSet.FieldByName('modelo').AsString;
    EdtVAQPatri.Text := FormatFloat('0.00', DBGridPatrimonio.DataSource.DataSet.FieldByName('valor_aquisicao').AsFloat);
    EdtVAPatri.Text := FormatFloat('0.00', DBGridPatrimonio.DataSource.DataSet.FieldByName('valor_atual').AsFloat);
    EdtDAPatri.Text := DateToStr(DBGridPatrimonio.DataSource.DataSet.FieldByName('data_aquisicao').AsDateTime);
    EdtNS.Text := DBGridPatrimonio.DataSource.DataSet.FieldByName('numero_serie').AsString;
    ComboBoxPatrimonio.Text := DBGridPatrimonio.DataSource.DataSet.FieldByName('nome_sala').AsString;
    PopularComboBoxSalas;
  finally
  end;
end;

procedure TFormCadastro.SpeedButton3Click(Sender: TObject);
var
  IdPatrimonio: Integer;
  Patrimonio: String;
begin
  Patrimonio := DBGridPatrimonio.DataSource.DataSet.FieldByName('nome').AsString;
  if MessageDlg('O Patrimônio ' + Patrimonio + ' será excluído, deseja continuar?',
                mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    IdPatrimonio := DBGridPatrimonio.DataSource.DataSet.FieldByName('id').AsInteger;
    FPatrimonioController.ExcluirPatrimonio(IdPatrimonio);

    // LOG: Excluiu patrimônio
    RegistrarLog('Excluiu patrimônio - ' + Patrimonio + ' (ID: ' + IntToStr(IdPatrimonio) + ')');

    AtualizarTabelaPatrimonio;
    ShowMessage('Patrimônio excluído com sucesso!');
  end;

end;

procedure TFormCadastro.SpeedButton4Click(Sender: TObject);
begin
  SearchBox1.Visible := True;
end;

procedure TFormCadastro.SpeedButton5Click(Sender: TObject);
begin
  AtualizarTabelaPatrimonio;
  RegistrarLog('Atualizou lista de patrimônios');
end;

procedure TFormCadastro.SpeedButton6Click(Sender: TObject);
var
  OpenDialog: TOpenDialog;
  TotalImportados, TotalErros: Integer;
  Erros: TStringList;
  Mensagem: string;
  LogPath: string;
begin
  OpenDialog := TOpenDialog.Create(nil);
  Erros := TStringList.Create;
  try
    OpenDialog.Filter := 'Arquivos CSV (*.csv)|*.csv|Todos os arquivos (*.*)|*.*';
    OpenDialog.Title := 'Selecione o arquivo CSV para importação';
    OpenDialog.InitialDir := ExtractFilePath(Application.ExeName);

    if OpenDialog.Execute then
    begin
      // Confirmação antes de importar
      if MessageDlg(
        'Deseja importar os patrimônios do arquivo?' + sLineBreak + sLineBreak +
        OpenDialog.FileName + sLineBreak + sLineBreak +
        'Esta operação pode levar alguns minutos dependendo do tamanho do arquivo.' + sLineBreak +
        'Cada linha do CSV será importada como um item individual.',
        mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
        Exit;

      Screen.Cursor := crHourGlass;
      try
        // Realiza a importação através do Controller
        if FPatrimonioController.ImportarPatrimoniosCSV(
          OpenDialog.FileName, TotalImportados, TotalErros, Erros) then
        begin
          Mensagem := 'Importação concluída!' + sLineBreak + sLineBreak +
                     Format('✓ Itens importados com sucesso: %d', [TotalImportados]) + sLineBreak +
                     Format('✗ Erros encontrados: %d', [TotalErros]);

          if TotalErros > 0 then
          begin
            // Salva log de erros
            LogPath := ExtractFilePath(Application.ExeName) +
                      'Logs\importacao_patrimonio_' +
                      FormatDateTime('yyyymmdd_hhnnss', Now) + '.txt';

            // Cria pasta Logs se não existir
            ForceDirectories(ExtractFilePath(LogPath));

            // Adiciona cabeçalho ao log
            Erros.Insert(0, '');
            Erros.Insert(0, '====================================');
            Erros.Insert(0, 'LOG DE ERROS - IMPORTAÇÃO CSV');
            Erros.Insert(0, 'Data/Hora: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now));
            Erros.Insert(0, 'Arquivo: ' + OpenDialog.FileName);
            Erros.Insert(0, '====================================');
            Erros.Add('');
            Erros.Add('====================================');
            Erros.Add(Format('Total de itens importados: %d', [TotalImportados]));
            Erros.Add(Format('Total de erros: %d', [TotalErros]));
            Erros.Add('====================================');

            Erros.SaveToFile(LogPath);

            Mensagem := Mensagem + sLineBreak + sLineBreak +
                       'Um log detalhado dos erros foi salvo em:' + sLineBreak +
                       LogPath + sLineBreak + sLineBreak +
                       'Deseja visualizar o log agora?';

            if MessageDlg(Mensagem, mtWarning, [mbYes, mbNo], 0) = mrYes then
            begin
              ShellExecute(0, 'open', PChar(LogPath), nil, nil, SW_SHOW);
            end;
          end
          else
          begin
            ShowMessage(Mensagem);
          end;

          // Atualiza a grid/lista de patrimônios
          // Ajuste conforme seu código de atualização
          AtualizarTabelaPatrimonio; // ou o nome do seu método de atualização

        end
        else
        begin
          ShowMessage(
            'Erro na importação. Verifique o arquivo e tente novamente.' + sLineBreak + sLineBreak +
            'Erros encontrados:' + sLineBreak +
            Erros.Text);
        end;

      finally
        Screen.Cursor := crDefault;
      end;
    end;
  finally
    Erros.Free;
    OpenDialog.Free;
  end;
end;

procedure TFormCadastro.BtnAtualizarEmpresaClick(Sender: TObject);
begin
 AtualizarTabelaE;
  RegistrarLog('Atualizou lista de empresas');
end;

procedure TFormCadastro.BtnAtualizarPatrimonioClick(Sender: TObject);
begin
  AtualizarTabelaPatrimonio;
  RegistrarLog('Atualizou lista de patrimônios');
end;



// ============================================================================
// MÉTODOS AUXILIARES (mantidos como estão)
// ============================================================================

procedure TFormCadastro.AtualizarTabelaE;
var
  Controller: TEmpresaController;
begin
  Controller := TEmpresaController.Create;
  try
    DataSEmpresa.DataSet := Controller.ListarEmpresa;
    DbGrid1.DataSource := DataSEmpresa;
  finally
    Controller.Free;
  end;
end;

procedure TFormCadastro.AtualizarTabelaP;
var
  Controller: TPredioController;
begin
  Controller := TPredioController.Create;
  try
    DataSEmpresa.DataSet := Controller.ListarPredio;
    DbGridPredio.DataSource := DataSEmpresa;
  finally
    Controller.Free;
  end;
end;

procedure TFormCadastro.AtualizarTabelaS;
begin
  DataSEmpresa.DataSet := FSalaController.ListarSala;
  DbGridSalas.DataSource := DataSEmpresa;
end;

procedure TFormCadastro.AtualizarTabelaPatrimonio;
begin
  DataSEmpresa.DataSet := FPatrimonioController.ListarPatrimonio;
  DBGridPatrimonio.DataSource := DataSEmpresa;
end;

procedure TFormCadastro.LimparCamposPatrimonio;
begin
  EditNomePatri.Text := '';
  EdtTipoPatri.Text := '';
  EdtModelo.Text := '';
  ComboBoxPatrimonio.ItemIndex := -1;
  CBSituacaoPatri.ItemIndex := -1;
  EdtVAQPatri.Text := '';
  EdtVAPatri.Text := '';
  EdtNS.Text := '';
  EdtDAPatri.Text := DateToStr(Now);
end;

function TFormCadastro.CarregarObjeto: TEmpresaDTO;
var
  Dto: TEmpresaDTO;
begin
  Dto.FNomeFan := EditFantasia.Text;
  Dto.FRazao := EditRazao.Text;
  Dto.FCnpj := EditCnpj.Text;
  Dto.FTelefone := EditTelefone.Text;
  Dto.FCep := EditCep.Text;
  Dto.FRua := EditRua.Text;
  Dto.FCidade := EditCidade.Text;
  Dto.FEstado := EditEstado.Text;
  Dto.FNumero := StrToInt(EditNumero.Text);
  Dto.FBairro := EditBairro.Text;
  Dto.FId := DBGrid1.DataSource.DataSet.FieldByName('id').AsInteger;
  Result := Dto;
end;

procedure TFormCadastro.PageControl1Change(Sender: TObject);
begin
  if PageControl1.ActivePage = TabSheet1 then
  begin
    AtualizarTabelaE;
    RegistrarLog('Acessou aba Empresas');
  end
  else if PageControl1.ActivePage = TabSheet2 then
  begin
    AtualizarTabelaP;
    RegistrarLog('Acessou aba Prédios');
  end
  else if PageControl1.ActivePage = TabSheet3 then
  begin
    AtualizarTabelaS;
    RegistrarLog('Acessou aba Salas');
  end
  else if PageControl1.ActivePage = TabSheet4 then
  begin
    AtualizarTabelaPatrimonio;
    RegistrarLog('Acessou aba Patrimônios');
  end;
end;

procedure TFormCadastro.PopularComboBox;
begin
  FSalaController.PopularComboBox(ComboBox2);
end;

procedure TFormCadastro.PopularComboBoxSalas;
begin
  FPatrimonioController.PopularComboBox(ComboBoxPatrimonio);
end;

// Eventos de botões (mantidos)











procedure TFormCadastro.BtnAdicionarEmpresaClick(Sender: TObject);
begin
 BtnConfirmarEd.Visible := False;
  BtnEnviar.Visible := True;
  if PanelAddEmpresa.Visible = False then
    PanelAddEmpresa.Visible := True
  else
    PanelAddEmpresa.Visible := False;
end;

procedure TFormCadastro.BtnAdicionarPatrimonioClick(Sender: TObject);
begin
if Panel34.Visible = False then
  begin
    Panel34.Visible := True;
    BtnEnviarPatrimonio.Visible := True;
    PopularComboBoxSalas;
  end
  else
    Panel34.Visible := False;
end;

procedure TFormCadastro.BtnAdicionarPredioClick(Sender: TObject);
begin
      if PanelAddPredio.Visible = False then
  begin
    PanelAddPredio.Visible := True;
    BtnEnviarPredio.Visible := True;
  end
  else
    PanelAddPredio.Visible := False;
end;



procedure TFormCadastro.BtnAdicionarSalaClick(Sender: TObject);
begin
  if PanelAddSala.Visible = False then
  begin
    PanelAddSala.Visible := True;
    BtnEnviarSala.Visible := True;
    PopularComboBox;
  end
  else
    PanelAddSala.Visible := False;
end;


procedure TFormCadastro.BtnEditarEmpresaClick(Sender: TObject);
begin
  PanelAddEmpresa.Visible := True;
  BtnEnviar.Visible := False;
  BtnConfirmarEd.Visible := True;

  try
    EditFantasia.Text := DBGrid1.DataSource.DataSet.FieldByName('nome_fantasia').AsString;
    EditRazao.Text := DBGrid1.DataSource.DataSet.FieldByName('razao_social').AsString;
    EditBairro.Text := DBGrid1.DataSource.DataSet.FieldByName('bairro').AsString;
    EditRua.Text := DBGrid1.DataSource.DataSet.FieldByName('rua').AsString;
    EditCnpj.Text := DBGrid1.DataSource.DataSet.FieldByName('cnpj').AsString;
    EditTelefone.Text := DBGrid1.DataSource.DataSet.FieldByName('telefone').AsString;
    EditNumero.Text := DBGrid1.DataSource.DataSet.FieldByName('numero').AsString;
    EditEstado.Text := DBGrid1.DataSource.DataSet.FieldByName('estado').AsString;
    EditCidade.Text := DBGrid1.DataSource.DataSet.FieldByName('cidade').AsString;
    EditCep.Text := DBGrid1.DataSource.DataSet.FieldByName('cep').AsString;
  finally
  end;
end;

procedure TFormCadastro.BtnEditarPatrimonioClick(Sender: TObject);
begin
  BtnConfirmarEdPatri.Visible := True;
  BtnEnviarPatrimonio.Visible := False;
  Panel34.Visible := True;

  try
    EditNomePatri.Text := DBGridPatrimonio.DataSource.DataSet.FieldByName('nome').AsString;
    EdtTipoPatri.Text := DBGridPatrimonio.DataSource.DataSet.FieldByName('tipo').AsString;
    CBSituacaoPatri.Text := DBGridPatrimonio.DataSource.DataSet.FieldByName('situacao').AsString;
    EdtModelo.Text := DBGridPatrimonio.DataSource.DataSet.FieldByName('modelo').AsString;
    EdtVAQPatri.Text := FormatFloat('0.00', DBGridPatrimonio.DataSource.DataSet.FieldByName('valor_aquisicao').AsFloat);
    EdtVAPatri.Text := FormatFloat('0.00', DBGridPatrimonio.DataSource.DataSet.FieldByName('valor_atual').AsFloat);
    EdtDAPatri.Text := DateToStr(DBGridPatrimonio.DataSource.DataSet.FieldByName('data_aquisicao').AsDateTime);
    EdtNS.Text := DBGridPatrimonio.DataSource.DataSet.FieldByName('numero_serie').AsString;
    ComboBoxPatrimonio.Text := DBGridPatrimonio.DataSource.DataSet.FieldByName('nome_sala').AsString;
    PopularComboBoxSalas;
  finally
  end;
end;



procedure TFormCadastro.BtnEditarPredioClick(Sender: TObject);
begin
  PanelAddPredio.Visible := True;
  BtnConfirmarEdPredio.Visible := True;
  BtnEnviarPredio.Visible := False;

  try
    EdtNamePredio.Text := DBGridPredio.DataSource.DataSet.FieldByName('nome').AsString;
    ComboBoxSituacao.Text := DBGridPredio.DataSource.DataSet.FieldByName('situacao').AsString;
    EdtBairroPredio.Text := DBGridPredio.DataSource.DataSet.FieldByName('bairro').AsString;
    EditRuaPredio.Text := DBGridPredio.DataSource.DataSet.FieldByName('rua').AsString;
    EdtTelefonePredio.Text := DBGridPredio.DataSource.DataSet.FieldByName('telefone').AsString;
    EdtNumeroPredio.Text := DBGridPredio.DataSource.DataSet.FieldByName('numero').AsString;
    EdtEstadoPredio.Text := DBGridPredio.DataSource.DataSet.FieldByName('estado').AsString;
    EdtCidadePredio.Text := DBGridPredio.DataSource.DataSet.FieldByName('cidade').AsString;
    EdtCepPredio.Text := DBGridPredio.DataSource.DataSet.FieldByName('cep').AsString;
  finally
  end;
end;



procedure TFormCadastro.BtnEditarSalaClick(Sender: TObject);
begin
  BtnConfirmarEdtSala.Visible := True;
  BtnEnviarSala.Visible := False;
  PanelAddSala.Visible := True;

  try
    EditNameSala.Text := DBGridSalas.DataSource.DataSet.FieldByName('nome').AsString;
    ComboBox2.Text := DBGridSalas.DataSource.DataSet.FieldByName('nome_predio').AsString;
    PopularComboBox;
    EdtSituacaoSala.Text := DBGridSalas.DataSource.DataSet.FieldByName('situacao').AsString;
    EdtTipoSala.Text := DBGridSalas.DataSource.DataSet.FieldByName('tipo').AsString;
    EdtObs.Text := DBGridSalas.DataSource.DataSet.FieldByName('observacao').AsString;
  finally
  end;
end;

procedure TFormCadastro.BtnFiltrarEmpresaClick(Sender: TObject);
begin
    edtPesquisar.Visible := True;
end;

procedure TFormCadastro.BtnFiltrarPatrimonioClick(Sender: TObject);
begin
  SearchBox1.Visible := True;
end;

procedure TFormCadastro.BtnFiltrarPredioClick(Sender: TObject);
begin
edtPesquisarPredio.Visible := True;
end;

procedure TFormCadastro.BtnFiltrarSalaClick(Sender: TObject);
begin
 edtPesquisarSala.Visible := True;
end;

end.
