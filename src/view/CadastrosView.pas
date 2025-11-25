unit CadastrosView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.StdCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.WinXCtrls, Vcl.Mask,
  EmpresaController, EmpresaDTO, EmpresaModel, PredioDTO, PredioModel, PredioController,
  SalaDTO, SalaController, PatrimonioDTO, PatrimonioController,
  AuditoriaController, AuditoriaModel, PatrimonioImportacaoCSV, Winapi.ShellAPI, CepService, PermissoesHelper, UsuarioModel,
  Vcl.Skia;

type
  TFormCadastro = class(TForm)
   PanelCadastro: TPanel;
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel10: TPanel;
    Shape6: TShape;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    edtPesquisar: TSearchBox;
    TabSheet2: TTabSheet;
    Panel11: TPanel;
    Shape8: TShape;
    Panel19: TPanel;
    DBGridPredio: TDBGrid;
    edtPesquisarPredio: TSearchBox;
    TabSheet3: TTabSheet;
    Panel3: TPanel;
    Shape17: TShape;
    Panel26: TPanel;
    DBGridSalas: TDBGrid;
    EdtPesquisarSala: TSearchBox;
    TabSheet4: TTabSheet;
    DataSEmpresa: TDataSource;
    Panel12: TPanel;
    Label80: TLabel;
    Label82: TLabel;
    Panel33: TPanel;
    DBGridPatrimonio: TDBGrid;
    SearchBox1: TSearchBox;
    EditNomePatri: TEdit;
    CbSituacaoPatri: TComboBox;
    Label79: TLabel;
    EdtVAQPatri: TEdit;
    Label81: TLabel;
    EdtVAPatri: TEdit;
    Label85: TLabel;
    EdtModelo: TEdit;
    Label84: TLabel;
    EdtDAPatri: TMaskEdit;
    Label86: TLabel;
    ComboBoxPatrimonio: TComboBox;
    Label87: TLabel;
    EdtNS: TEdit;
    Label83: TLabel;
    BtnConfirmarEdPatri: TButton;
    BtnEnviarPatrimonio: TButton;
    Panel30: TPanel;
    Label69: TLabel;
    Panel32: TPanel;
    Label72: TLabel;
    SpeedButton5: TSpeedButton;
    Panel31: TPanel;
    Label70: TLabel;
    Shape29: TShape;
    Panel28: TPanel;
    Label51: TLabel;
    SpeedButton4: TSpeedButton;
    Panel29: TPanel;
    Label52: TLabel;
    BtnEditarPatrimonio: TSpeedButton;
    SpeedButton3: TSpeedButton;
    BtnAdicionarPatrimonio: TSpeedButton;
    Shape25: TShape;
    Shape27: TShape;
    Shape28: TShape;
    Shape26: TShape;
    Panel27: TPanel;
    Panel38: TPanel;
    Label90: TLabel;
    Panel37: TPanel;
    Label88: TLabel;
    SpeedButton1: TSpeedButton;
    Shape31: TShape;
    SpeedButton6: TSpeedButton;
    Shape30: TShape;
    Label1: TLabel;
    ComboBox2: TComboBox;
    EditNameSala: TEdit;
    EdtObs: TEdit;
    EdtSituacaoSala: TComboBox;
    EdtTipoSala: TEdit;
    Label27: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label55: TLabel;
    BtnConfirmarEdtSala: TButton;
    BtnEnviarSala: TButton;
    Panel21: TPanel;
    Label56: TLabel;
    Panel22: TPanel;
    Label59: TLabel;
    Panel23: TPanel;
    Label60: TLabel;
    BtnAdicionarSala: TSpeedButton;
    Panel24: TPanel;
    Label62: TLabel;
    BtnFiltrarSala: TSpeedButton;
    Panel25: TPanel;
    Label63: TLabel;
    BtnEditarSala: TSpeedButton;
    BtnExcluirSala: TSpeedButton;
    BtnAtualizarSala: TSpeedButton;
    Shape18: TShape;
    Shape19: TShape;
    Shape20: TShape;
    Shape21: TShape;
    Shape22: TShape;
    Panel20: TPanel;
    ComboBoxSituacao: TComboBox;
    EditRuaPredio: TEdit;
    EdtBairroPredio: TEdit;
    EdtCepPredio: TMaskEdit;
    EdtCidadePredio: TEdit;
    EdtEstadoPredio: TEdit;
    EdtNamePredio: TEdit;
    EdtNumeroPredio: TEdit;
    EdtTelefonePredio: TMaskEdit;
    Label25: TLabel;
    Label26: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Panel14: TPanel;
    Label35: TLabel;
    Panel15: TPanel;
    Label38: TLabel;
    Panel16: TPanel;
    Label39: TLabel;
    Panel18: TPanel;
    Label42: TLabel;
    BtnAdicionarPredio: TSpeedButton;
    Panel17: TPanel;
    Label41: TLabel;
    BtnEditarPredio: TSpeedButton;
    BtnExcluirPredio: TSpeedButton;
    BtnAtualizarPredio: TSpeedButton;
    BtnFiltrarPredio: TSpeedButton;
    BtnConfirmarEdPredio: TButton;
    BtnEnviarPredio: TButton;
    Panel13: TPanel;
    Shape10: TShape;
    Shape11: TShape;
    Shape12: TShape;
    Shape13: TShape;
    Shape15: TShape;
    EditBairro: TEdit;
    EditCep: TMaskEdit;
    EditCidade: TEdit;
    EditCnpj: TMaskEdit;
    EditEstado: TEdit;
    EditFantasia: TEdit;
    EditNumero: TEdit;
    EditRazao: TEdit;
    EditRua: TEdit;
    EditTelefone: TMaskEdit;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    BtnConfirmarEd: TButton;
    BtnEnviar: TButton;
    Panel5: TPanel;
    Label2: TLabel;
    Panel6: TPanel;
    Label3: TLabel;
    Panel7: TPanel;
    Label4: TLabel;
    Panel8: TPanel;
    Label12: TLabel;
    BtnExcluirEmpresa: TSpeedButton;
    BtnEditarEmpresa: TSpeedButton;
    BtnAdicionarEmpresa: TSpeedButton;
    BtnAtualizarEmpresa: TSpeedButton;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Panel4: TPanel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    DSPredio: TDataSource;
    DSPatrimonio: TDataSource;
    DSSalas: TDataSource;
    CbTipoPatrimonio: TComboBox;
    CheckBoxRecuperarEmp: TCheckBox;
    Panel9: TPanel;
    BtnFiltrarEmpresa: TSpeedButton;
    Shape5: TShape;
    Label14: TLabel;
    Panel34: TPanel;
    Label5: TLabel;
    Shape7: TShape;
    CheckBoxRecuperarPredio: TCheckBox;
    Panel36: TPanel;
    Label7: TLabel;
    Shape14: TShape;
    Panel35: TPanel;
    Label6: TLabel;
    Shape9: TShape;
    CheckBoxRecuperarSala: TCheckBox;
    CheckBoxRecuperarPatri: TCheckBox;
    BtnRecuperarPatrimonio: TSpeedButton;
    BtnRecuperarSala: TSpeedButton;
    BtnRecuperarEmpresa: TSpeedButton;
    Panel39: TPanel;
    Label8: TLabel;
    Shape16: TShape;
    BtnRecuperarPredio: TSpeedButton;
    procedure PageControl1Change(Sender: TObject);
    procedure BtnEnviarClick(Sender: TObject);
    procedure BtnConfirmarEdClick(Sender: TObject);

    procedure BtnEditarEmpresaClick(Sender: TObject);
    procedure BtnExcluirEmpresaClick(Sender: TObject);
    procedure BtnAtualizarEmpresaClick(Sender: TObject);
    procedure BtnFiltrarEmpresaClick(Sender: TObject);
    procedure CheckBoxRecuperarEmpClick(Sender: TObject);
    procedure edtPesquisarChange(Sender: TObject);
    procedure BtnConfirmarEdPredioClick(Sender: TObject);
    procedure BtnEnviarPredioClick(Sender: TObject);
    procedure BtnAdicionarPredioClick(Sender: TObject);
    procedure BtnEditarPredioClick(Sender: TObject);
    procedure BtnExcluirPredioClick(Sender: TObject);
    procedure BtnAtualizarPredioClick(Sender: TObject);
    procedure BtnFiltrarPredioClick(Sender: TObject);
    procedure CheckBoxRecuperarPredioClick(Sender: TObject);
    procedure edtPesquisarPredioChange(Sender: TObject);
    procedure BtnEnviarSalaClick(Sender: TObject);
    procedure BtnConfirmarEdtSalaClick(Sender: TObject);
    procedure BtnAdicionarSalaClick(Sender: TObject);
    procedure BtnEditarSalaClick(Sender: TObject);
    procedure BtnExcluirSalaClick(Sender: TObject);
    procedure BtnAtualizarSalaClick(Sender: TObject);
    procedure BtnFiltrarSalaClick(Sender: TObject);
    procedure CheckBoxRecuperarSalaClick(Sender: TObject);
    procedure EdtPesquisarSalaChange(Sender: TObject);
    procedure BtnConfirmarEdPatriClick(Sender: TObject);
    procedure BtnEnviarPatrimonioClick(Sender: TObject);
    procedure BtnAdicionarPatrimonioClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SearchBox1Change(Sender: TObject);
    procedure CheckBoxRecuperarPatriClick(Sender: TObject);
    function  CarregarObjeto : TEmpresaDTO;
    procedure AtualizarTabelaP;
    procedure AtualizarTabelaE;
    procedure PopularComboBox;
    procedure AtualizarTabelaS;
    constructor Create(AComponent: TComponent; const UsuarioLogado: String);
    procedure BtnAdicionarEmpresaClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure EditCepExit(Sender: TObject);
    procedure EdtCepPredioExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnEditarPatrimonioClick(Sender: TObject);
    procedure EdtVAQPatriKeyPress(Sender: TObject; var Key: Char);
    procedure EdtVAPatriKeyPress(Sender: TObject; var Key: Char);
    procedure EdtVAQPatriExit(Sender: TObject);
    procedure EdtVAPatriExit(Sender: TObject);
    procedure BtnRecuperarEmpresaClick(Sender: TObject);
    procedure BtnRecuperarPredioClick(Sender: TObject);
    procedure BtnRecuperarSalaClick(Sender: TObject);
    procedure BtnRecuperarPatrimonioClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

     private
    procedure AtualizarTabelaPatrimonio;
    procedure BtnAtualizarPatrimonioClick(Sender: TObject);
    procedure BtnExcluirPatrimonioClick(Sender: TObject);
    procedure BtnFiltrarPatrimonioClick(Sender: TObject);
    procedure LimparCamposPatrimonio;
    procedure LimparCamposSala;
    procedure LimparCamposPredio;
    procedure PopularComboBoxSalas;
    function LimparValorMoeda(const Texto: string): Currency;
    function FormatarValorBrasileiro(Valor: Currency): String;
    procedure SetEstadoCamposPatrimonio(Habilitado: Boolean);
    procedure SetEstadoCamposSala(Habilitado: Boolean);
    procedure SetEstadoCamposPredio(Habilitado: Boolean);
    procedure SetEstadoCamposEmpresa(Habilitado: Boolean);

    procedure PopularComboBoxTiposPatrimonio;
    function VerificarDependenciasSala(IdSala: Integer): TStringList;
    function VerificarDependenciasPredio(IdPredio: Integer): TStringList;
    function VerificarDependenciasEmpresa(IdEmpresa: Integer): TStringList;
    private
    FEmpresaController: TEmpresaController;
    FPredioController: TPredioController;
    FSalaController: TSalaController;
    FPatrimonioController: TPatrimonioController;


    { Private declarations }
  end;

var
  FormCadastro: TFormCadastro;

implementation

{$R *.dfm}

// ============================================================================
// MÉTODO PARA REGISTRAR LOG
// ============================================================================

// ============================================================================
// CONSTRUCTOR E DESTRUCTOR
// ============================================================================
constructor TFormCadastro.Create(AComponent: TComponent; const UsuarioLogado: String);
// Usuario removido - logging movido para services
begin
  inherited Create(AComponent); // ← SÓ UMA VEZ!

  // Obtém o usuário logado do helper
  // Usuario e FUsuarioLogado removidos - logging movido para services

  // Cria os controllers UMA VEZ
  FEmpresaController := TEmpresaController.Create;
  FPredioController := TPredioController.Create;
  FSalaController := TSalaController.Create;
  FPatrimonioController := TPatrimonioController.Create;

  // Criar DataSources separados para cada grid
  DSPredio := TDataSource.Create(Self);
  DSSalas := TDataSource.Create(Self);
  DSPatrimonio := TDataSource.Create(Self);





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
    // Log removido - movido para Controller:Cadastrou empresa - ' + EditFantasia.Text + ' (CNPJ: ' + EditCnpj.Text + ')
    ShowMessage('Empresa adicionada com sucesso!');

    // Limpar campos e desabilitar
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

    // Desabilitar campos após salvar
    SetEstadoCamposEmpresa(False);
    AtualizarTabelaE;
  finally
    Controller.Free;
  end;
end;

procedure TFormCadastro.BtnEnviarPatrimonioClick(Sender: TObject);
var
  Dto: TPatrimonioDTO;
  SelectedID: Integer;
  ValorAquisicao, ValorAtual: Currency;
begin
  try
    Dto.FId := 0; // Inicializa o DTO (record não usa Create)

    // Validação da Sala
    if ComboBoxPatrimonio.ItemIndex >= 0 then
    begin
      SelectedID := Integer(NativeInt(ComboBoxPatrimonio.Items.Objects[ComboBoxPatrimonio.ItemIndex]));
      Dto.FIdSala := SelectedID;
    end
    else
    begin
      raise Exception.Create('Por favor, selecione uma Sala.');
    end;

    // Validação dos campos de valor
    if Trim(EdtVAQPatri.Text) = '' then
      raise Exception.Create('Por favor, informe o Valor de Aquisição.');

    if Trim(EdtVAPatri.Text) = '' then
      raise Exception.Create('Por favor, informe o Valor Atual.');

    // Conversão dos valores
    ValorAquisicao := LimparValorMoeda(EdtVAQPatri.Text);
    ValorAtual := LimparValorMoeda(EdtVAPatri.Text);

    if (ValorAquisicao <= 0) or (ValorAtual <= 0) then
    begin
      raise Exception.Create('Os valores de aquisição e atual devem ser maiores que zero. Use o formato: 1234,56');
    end;

    // Preenche o DTO
    Dto.FNome := EditNomePatri.Text;
    Dto.FTipo := CbTipoPatrimonio.Text;
    Dto.FSituacao := CBSituacaoPatri.Text;
    Dto.FModelo := EdtModelo.Text;
    Dto.FValorAquisicao := ValorAquisicao;
    Dto.FValorAtual := ValorAtual;
    Dto.FDataAquisicao := StrToDate(EdtDAPatri.Text);
    Dto.FNumeroSerie := EdtNS.Text;

    FPatrimonioController.AdicionarPatrimonio(Dto);

    // Log movido para Service
    AtualizarTabelaPatrimonio;
    LimparCamposPatrimonio;

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

    FPredioController.AdicionarPredio(Dto);

    // LOG: Cadastrou prédio
    // Log removido - movido para Controller:Cadastrou prédio - ' + EdtNamePredio.Text + ' (' + EdtCidadePredio.Text + ')
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
    // Log removido - movido para Controller:Cadastrou sala - ' + EditNameSala.Text + ' (Tipo: ' + EdtTipoSala.Text + ')
    AtualizarTabelaS;

    // Limpar campos
    EditNameSala.Text := '';
    ComboBox2.ItemIndex := -1;
    EdtSituacaoSala.Text := '';
    EdtTipoSala.Text := '';
    EdtObs.Text := '';


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
      // Log removido - movido para Controller:Pesquisou empresa - Termo: "' + edtPesquisar.Text + '"';
  finally
    Controller.Free;
  end;

end;



procedure TFormCadastro.edtPesquisarPredioChange(Sender: TObject);
begin
  DSPredio.DataSet := FPredioController.PesquisarPredio(edtPesquisarPredio.Text);
  DBGridPredio.DataSource := DSPredio;

end;

procedure TFormCadastro.EdtPesquisarSalaChange(Sender: TObject);
begin
 DSSalas.DataSet := FSalaController.PesquisarSala(edtPesquisarSala.Text);
  DBGridSalas.DataSource := DSSalas;

end;

function TFormCadastro.FormatarValorBrasileiro(Valor: Currency): String;
var
  FS: TFormatSettings;
begin
  FS := TFormatSettings.Create;
  FS.DecimalSeparator := ',';
  FS.ThousandSeparator := '.';
  Result := 'R$ ' + FormatFloat('#,##0.00', Valor, FS);
end;

procedure TFormCadastro.FormCreate(Sender: TObject);
begin

end;

// ============================================================================
// FORMATAÇÃO DE VALORES EM TEMPO REAL
// ============================================================================
procedure TFormCadastro.EdtVAQPatriKeyPress(Sender: TObject; var Key: Char);
var
  Texto: String;
begin
  // Permite apenas números, vírgula e backspace
  if not (CharInSet(Key, ['0'..'9', ',', #8])) then
    Key := #0;

  // Impede múltiplas vírgulas
  if Key = ',' then
  begin
    Texto := EdtVAQPatri.Text;
    if Pos(',', Texto) > 0 then
      Key := #0;
  end;
end;

procedure TFormCadastro.EdtVAPatriKeyPress(Sender: TObject; var Key: Char);
var
  Texto: String;
begin
  // Permite apenas números, vírgula e backspace
  if not (CharInSet(Key, ['0'..'9', ',', #8])) then
    Key := #0;

  // Impede múltiplas vírgulas
  if Key = ',' then
  begin
    Texto := EdtVAPatri.Text;
    if Pos(',', Texto) > 0 then
      Key := #0;
  end;
end;

procedure TFormCadastro.EdtVAQPatriExit(Sender: TObject);
var
  Valor: Currency;
  Texto: String;
begin
  Texto := Trim(EdtVAQPatri.Text);

  if Texto <> '' then
  begin
    // Remove R$ e espaços se existirem
    Texto := StringReplace(Texto, 'R$', '', [rfReplaceAll]);
    Texto := StringReplace(Texto, ' ', '', [rfReplaceAll]);

    // Troca vírgula por ponto para conversão
    Texto := StringReplace(Texto, ',', '.', [rfReplaceAll]);

    if TryStrToCurr(Texto, Valor) then
      EdtVAQPatri.Text := FormatarValorBrasileiro(Valor)
    else
    begin
      ShowMessage('Valor inválido! Use o formato: 1234,56');
      EdtVAQPatri.SetFocus;
    end;
  end;
end;

procedure TFormCadastro.EdtVAPatriExit(Sender: TObject);
var
  Valor: Currency;
  Texto: String;
begin
  Texto := Trim(EdtVAPatri.Text);

  if Texto <> '' then
  begin
    // Remove R$ e espaços se existirem
    Texto := StringReplace(Texto, 'R$', '', [rfReplaceAll]);
    Texto := StringReplace(Texto, ' ', '', [rfReplaceAll]);

    // Troca vírgula por ponto para conversão
    Texto := StringReplace(Texto, ',', '.', [rfReplaceAll]);

    if TryStrToCurr(Texto, Valor) then
      EdtVAPatri.Text := FormatarValorBrasileiro(Valor)
    else
    begin
      ShowMessage('Valor inválido! Use o formato: 1234,56');
      EdtVAPatri.SetFocus;
    end;
  end;
end;

procedure TFormCadastro.FormShow(Sender: TObject);
begin
    try
    TPermissoesHelper.AplicarPermissoesCadastros(PageControl1);

    // Popular ComboBox de tipos de patrimônio
    PopularComboBoxTiposPatrimonio;

    // Inicializar campos desabilitados
    SetEstadoCamposPatrimonio(False);
    SetEstadoCamposSala(False);
    SetEstadoCamposPredio(False);
    SetEstadoCamposEmpresa(False);

    // Inicializar botões de envio como invisíveis
    BtnEnviarPatrimonio.Visible := False;
    BtnEnviarSala.Visible := False;
    BtnEnviarPredio.Visible := False;
    BtnEnviar.Visible := False;

    // ✅ ADICIONAR: Carregar dados iniciais da aba ativa
    PageControl1Change(PageControl1);

  except
    on E: Exception do
      ShowMessage('Erro ao inicializar formulário: ' + E.Message);
  end;
end;

procedure TFormCadastro.EditCepExit(Sender: TObject);
var
  Endereco: TEndereco;
begin
  // Verifica se o CEP tem pelo menos 8 dígitos (com ou sem máscara)
  if (Length(EditCep.Text) >= 8) and (EditCep.Text <> '     -   ') then
  begin
    Screen.Cursor := crHourGlass;
    try
      Endereco := TCepService.BuscarCep(EditCep.Text);

      if Endereco.Erro = '' then
      begin
        // Preenche os campos automaticamente
        EditRua.Text := Endereco.Logradouro;
        EditBairro.Text := Endereco.Bairro;
        EditCidade.Text := Endereco.Cidade;
        EditEstado.Text := Endereco.Estado;

        // Move o foco para o campo número
        EditNumero.SetFocus;

        // LOG: Buscou CEP
        // Log removido - movido para Controller:Buscou CEP automaticamente - CEP: ' + Endereco.Cep + ' - Endereço: ' + Endereco.Logradouro);
      end
      else
      begin
        ShowMessage('CEP não encontrado: ' + Endereco.Erro);
      end;
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TFormCadastro.EdtCepPredioExit(Sender: TObject);
var
  Endereco: TEndereco;
begin
  // Verifica se o CEP tem pelo menos 8 dígitos (com ou sem máscara)
  if (Length(EdtCepPredio.Text) >= 8) and (EdtCepPredio.Text <> '     -   ') then
  begin
    Screen.Cursor := crHourGlass;
    try
      Endereco := TCepService.BuscarCep(EdtCepPredio.Text);

      if Endereco.Erro = '' then
      begin
        // Preenche os campos automaticamente
        EditRuaPredio.Text := Endereco.Logradouro;
        EdtBairroPredio.Text := Endereco.Bairro;
        EdtCidadePredio.Text := Endereco.Cidade;
        EdtEstadoPredio.Text := Endereco.Estado;

        // Move o foco para o campo número
        EdtNumeroPredio.SetFocus;

        // LOG: Buscou CEP
        // Log removido - movido para Controller:Buscou CEP automaticamente - CEP: ' + Endereco.Cep + ' - Endereço: ' + Endereco.Logradouro);
      end
      else
      begin
        ShowMessage('CEP não encontrado: ' + Endereco.Erro);
      end;
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;


procedure TFormCadastro.BtnAtualizarPredioClick(Sender: TObject);
begin
  AtualizarTabelaP;
  // Log removido - movido para Controller:Atualizou lista de prédios';
end;

procedure TFormCadastro.BtnAtualizarSalaClick(Sender: TObject);
begin
  AtualizarTabelaS;
end;

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
    // Log removido - movido para Controller:Alterou empresa - ' + NomeEmpresa + ' (ID: ' + IntToStr(DBGrid1.DataSource.DataSet.FieldByName('id').AsInteger) + ')
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
    Dto.FTipo := CbTipoPatrimonio.Text;
    Dto.FSituacao := CBSituacaoPatri.Text;
    Dto.FModelo := EdtModelo.Text;

    // Validação dos campos de valor
    if Trim(EdtVAQPatri.Text) = '' then
      raise Exception.Create('Por favor, informe o Valor de Aquisição.');

    if Trim(EdtVAPatri.Text) = '' then
      raise Exception.Create('Por favor, informe o Valor Atual.');
    // Conversão dos valores usando a função atualizada
    Dto.FValorAquisicao := LimparValorMoeda(EdtVAQPatri.Text);
    Dto.FValorAtual := LimparValorMoeda(EdtVAPatri.Text);

    if (Dto.FValorAquisicao <= 0) or (Dto.FValorAtual <= 0) then
      raise Exception.Create('Os valores devem ser maiores que zero. Use o formato: 1234,56');
    Dto.FDataAquisicao := StrToDate(EdtDAPatri.Text);
    Dto.FNumeroSerie := EdtNS.Text;
    Dto.FId := IdPatri;

    FPatrimonioController.EditarPatrimonio(Dto);

    // Log removido - movido para Controller:Alterou patrimônio - ' + NomePatri + ' (ID: ' + IntToStr(IdPatri) + ')
    AtualizarTabelaPatrimonio;
    LimparCamposPatrimonio;

    // Desabilitar campos após salvar
    SetEstadoCamposPatrimonio(False);

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

  FPredioController.EditarPredio(Dto);

  // LOG: Alterou prédio
  // Log removido - movido para Controller:Alterou prédio - ' + NomePredio + ' (ID: ' + IntToStr(IdPredio) + ')
  AtualizarTabelaP;

  // Limpar campos
  LimparCamposPredio;

  // Desabilitar campos após salvar
  SetEstadoCamposPredio(False);

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
  // Log removido - movido para Controller:Alterou sala - ' + NomeSala + ' (ID: ' + IntToStr(IdSala) + ')
  // Limpar campos
  LimparCamposSala;

  AtualizarTabelaS;

  // Desabilitar campos após salvar
  SetEstadoCamposSala(False);

  ShowMessage('Sala atualizada com sucesso!');
end;

procedure TFormCadastro.BtnExcluirEmpresaClick(Sender: TObject);
var
  IdUser: Integer;
  Controller: TEmpresaController;
  Emp: String;
  Dependencias: TStringList;
  Mensagem: String;
  i: Integer;
begin
  Emp := DBGrid1.DataSource.DataSet.FieldByName('nome_fantasia').AsString;
  IdUser := DBGrid1.DataSource.DataSet.FieldByName('id').AsInteger;

  try
    // Verificar dependências antes de excluir
    Dependencias := VerificarDependenciasEmpresa(IdUser);

    if Dependencias.Count > 0 then
    begin
      // Construir mensagem de aviso
      Mensagem := 'ATENÇÃO! Esta empresa possui dependências:' + sLineBreak + sLineBreak;

      for i := 0 to Dependencias.Count - 1 do
        Mensagem := Mensagem + '• ' + Dependencias[i] + sLineBreak;

      Mensagem := Mensagem + sLineBreak +
                  'Ao excluir esta empresa, os itens relacionados também serão afetados.' + sLineBreak + sLineBreak +
                  'Deseja continuar com a exclusão?';

      if MessageDlg(Mensagem, mtWarning, [mbYes, mbNo], 0) <> mrYes then
        Exit;
    end
    else
    begin
      // Sem dependências, apenas confirmação simples
      if MessageDlg('A Empresa ' + Emp + ' será excluída, deseja continuar?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
        Exit;
    end;

    // Prosseguir com a exclusão
    Controller := TEmpresaController.Create;
    try
      Controller.ExcluirEmpresa(IdUser);

      // LOG: Excluiu empresa
      // Log removido - movido para Controller:Excluiu empresa - ' + Emp + ' (ID: ' + IntToStr(IdUser) + ')
      AtualizarTabelaE;
      ShowMessage('Empresa excluída com sucesso!');
    finally
      Controller.Free;
    end;

  finally
    Dependencias.Free;
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
    // Log removido - movido para Controller:Excluiu patrimônio - ' + Patrimonio + ' (ID: ' + IntToStr(IdPatrimonio) + ')
    AtualizarTabelaPatrimonio;
    ShowMessage('Patrimônio excluído com sucesso!');
  end;
end;

procedure TFormCadastro.BtnRecuperarEmpresaClick(Sender: TObject);
var
  IdUser: Integer;
  Controller: TEmpresaController;
  Emp: String;
begin
  Emp := DBGrid1.DataSource.DataSet.FieldByName('nome_fantasia').AsString;
  IdUser := DBGrid1.DataSource.DataSet.FieldByName('id').AsInteger;

  if MessageDlg('A Empresa ' + Emp + ' será recuperada, deseja continuar?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  try
    Controller := TEmpresaController.Create;
    try
      Controller.RecuperarEmpresa(IdUser);
      CheckBoxRecuperarEmp.Checked := False;
      CheckBoxRecuperarEmpClick(nil);
      ShowMessage('Empresa recuperada com sucesso!');
    finally
      Controller.Free;
    end;
  except
    on E: Exception do
      ShowMessage('Erro ao recuperar empresa: ' + E.Message);
  end;
end;

procedure TFormCadastro.BtnRecuperarPatrimonioClick(Sender: TObject);
var
  IdPatrimonio: Integer;
  Patrimonio: String;
begin
  Patrimonio := DBGridPatrimonio.DataSource.DataSet.FieldByName('nome').AsString;
  IdPatrimonio := DBGridPatrimonio.DataSource.DataSet.FieldByName('id').AsInteger;

  if MessageDlg('O Patrimônio ' + Patrimonio + ' será recuperado, deseja continuar?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  try
    FPatrimonioController.RecuperarPatrimonio(IdPatrimonio);
    CheckBoxRecuperarPatri.Checked := False;
    CheckBoxRecuperarPatriClick(nil);
    ShowMessage('Patrimônio recuperado com sucesso!');
  except
    on E: Exception do
      ShowMessage('Erro ao recuperar patrimônio: ' + E.Message);
  end;
end;

procedure TFormCadastro.BtnRecuperarPredioClick(Sender: TObject);
var
  IdPredio: Integer;
  Predio: String;
begin
  Predio := DBGridPredio.DataSource.DataSet.FieldByName('nome').AsString;
  IdPredio := DBGridPredio.DataSource.DataSet.FieldByName('id').AsInteger;

  if MessageDlg('O Prédio ' + Predio + ' será recuperado, deseja continuar?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  try
    FPredioController.RecuperarPredio(IdPredio);
    CheckBoxRecuperarPredio.Checked := False;
    CheckBoxRecuperarPredioClick(nil);
    ShowMessage('Prédio recuperado com sucesso!');
  except
    on E: Exception do
      ShowMessage('Erro ao recuperar prédio: ' + E.Message);
  end;
end;

procedure TFormCadastro.BtnRecuperarSalaClick(Sender: TObject);
var
  IdSala: Integer;
  Sala: String;
begin
  Sala := DBGridSalas.DataSource.DataSet.FieldByName('nome').AsString;
  IdSala := DBGridSalas.DataSource.DataSet.FieldByName('id').AsInteger;

  if MessageDlg('A Sala ' + Sala + ' será recuperada, deseja continuar?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  try
    FSalaController.RecuperarSala(IdSala);
    CheckBoxRecuperarSala.Checked := False;
    CheckBoxRecuperarSalaClick(nil);
    ShowMessage('Sala recuperada com sucesso!');
  except
    on E: Exception do
      ShowMessage('Erro ao recuperar sala: ' + E.Message);
  end;
end;

procedure TFormCadastro.BtnExcluirPredioClick(Sender: TObject);
var
  IdPredio: Integer;
  Predio: String;
  Dependencias: TStringList;
  Mensagem: String;
  i: Integer;
begin
  Predio := DBGridPredio.DataSource.DataSet.FieldByName('nome').AsString;
  IdPredio := DBGridPredio.DataSource.DataSet.FieldByName('id').AsInteger;

  try
    // Verificar dependências antes de excluir
    Dependencias := VerificarDependenciasPredio(IdPredio);

    if Dependencias.Count > 0 then
    begin
      // Construir mensagem de aviso
      Mensagem := 'ATENÇÃO! Este prédio possui dependências:' + sLineBreak + sLineBreak;

      for i := 0 to Dependencias.Count - 1 do
        Mensagem := Mensagem + '• ' + Dependencias[i] + sLineBreak;

      Mensagem := Mensagem + sLineBreak +
                  'Ao excluir este prédio, os itens relacionados também serão afetados.' + sLineBreak + sLineBreak +
                  'Deseja continuar com a exclusão?';

      if MessageDlg(Mensagem, mtWarning, [mbYes, mbNo], 0) <> mrYes then
        Exit;
    end
    else
    begin
      // Sem dependências, apenas confirmação simples
      if MessageDlg('O Prédio ' + Predio + ' será excluído, deseja continuar?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
        Exit;
    end;

    // Prosseguir com a exclusão
    FPredioController.ExcluirPredio(IdPredio);

    // LOG: Excluiu prédio
    // Log removido - movido para Controller:Excluiu prédio - ' + Predio + ' (ID: ' + IntToStr(IdPredio) + ')
    AtualizarTabelaP;
    ShowMessage('Prédio excluído com sucesso!');

  finally
    Dependencias.Free;
  end;
end;




procedure TFormCadastro.BtnExcluirSalaClick(Sender: TObject);
var
  IdSala: Integer;
  Sala: String;
  Dependencias: TStringList;
  Mensagem: String;
  i: Integer;
begin
  Sala := DBGridSalas.DataSource.DataSet.FieldByName('nome').AsString;
  IdSala := DBGridSalas.DataSource.DataSet.FieldByName('id').AsInteger;

  try
    // Verificar dependências antes de excluir
    Dependencias := VerificarDependenciasSala(IdSala);

    if Dependencias.Count > 0 then
    begin
      // Construir mensagem de aviso
      Mensagem := 'ATENÇÃO! Esta sala possui dependências:' + sLineBreak + sLineBreak;

      for i := 0 to Dependencias.Count - 1 do
        Mensagem := Mensagem + '• ' + Dependencias[i] + sLineBreak;

      Mensagem := Mensagem + sLineBreak +
                  'ATENÇÃO: Ao excluir esta sala, todos os patrimônios vinculados serão INATIVADOS juntamente com ela.' + sLineBreak +
                  'Os patrimônios inativados não aparecerão mais nas consultas e listagens ativas.' + sLineBreak + sLineBreak +
                  'Deseja continuar com a exclusão?';

      if MessageDlg(Mensagem, mtWarning, [mbYes, mbNo], 0) <> mrYes then
        Exit;
    end
    else
    begin
      // Sem dependências, confirmação simples
      if MessageDlg('A Sala ' + Sala + ' será excluída, deseja continuar?',
                    mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
        Exit;
    end;

    // Executar exclusão
    FSalaController.ExcluirSala(IdSala);

    // LOG: Excluiu sala
    // Log removido - movido para Controller:Excluiu sala - ' + Sala + ' (ID: ' + IntToStr(IdSala) + ')
    AtualizarTabelaS;
    ShowMessage('Sala excluída com sucesso!');

  finally
    Dependencias.Free;
  end;
end;




procedure TFormCadastro.SearchBox1Change(Sender: TObject);
begin
  DSPatrimonio.DataSet := FPatrimonioController.PesquisarPatrimonio(SearchBox1.Text);
  DBGridPatrimonio.DataSource := DSPatrimonio;

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


  try
    EditNomePatri.Text := DBGridPatrimonio.DataSource.DataSet.FieldByName('nome').AsString;
    CbTipoPatrimonio.Text := DBGridPatrimonio.DataSource.DataSet.FieldByName('tipo').AsString;
    CBSituacaoPatri.Text := DBGridPatrimonio.DataSource.DataSet.FieldByName('situacao').AsString;
    EdtModelo.Text := DBGridPatrimonio.DataSource.DataSet.FieldByName('modelo').AsString;
    EdtVAQPatri.Text := FormatarValorBrasileiro(DBGridPatrimonio.DataSource.DataSet.FieldByName('valor_aquisicao').AsCurrency);
    EdtVAPatri.Text := FormatarValorBrasileiro(DBGridPatrimonio.DataSource.DataSet.FieldByName('valor_atual').AsCurrency);
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
    // Log removido - movido para Controller:Excluiu patrimônio - ' + Patrimonio + ' (ID: ' + IntToStr(IdPatrimonio) + ')
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
            Erros.Insert(0, '====================================');
            Erros.Insert(0, 'LOG DE ERROS - IMPORTAÇÃO CSV');
            Erros.Insert(0, 'Data/Hora: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now));
            Erros.Insert(0, 'Arquivo: ' + OpenDialog.FileName);
            Erros.Insert(0, '====================================');

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


          AtualizarTabelaPatrimonio;

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
  // Log removido - movido para Controller:Atualizou lista de empresas';
end;

procedure TFormCadastro.BtnAtualizarPatrimonioClick(Sender: TObject);
begin
  AtualizarTabelaPatrimonio;
end;
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
    DSPredio.DataSet := Controller.ListarPredio;
    DbGridPredio.DataSource := DSPredio;
  finally
    Controller.Free;
  end;
end;

procedure TFormCadastro.AtualizarTabelaS;
begin
  DSSalas.DataSet := FSalaController.ListarSala;
  DbGridSalas.DataSource := DSSalas;
end;

procedure TFormCadastro.AtualizarTabelaPatrimonio;
begin
try
    // ✅ Fechar o DataSet anterior se estiver aberto
    if Assigned(DSPatrimonio.DataSet) then
    begin
      if DSPatrimonio.DataSet.Active then
        DSPatrimonio.DataSet.Close;
      DSPatrimonio.DataSet.Free;
      DSPatrimonio.DataSet := nil;
    end;

    // ✅ Obter novo DataSet do Controller
    DSPatrimonio.DataSet := FPatrimonioController.ListarPatrimonio;

    // ✅ Verificar se o DataSet foi criado
    if Assigned(DSPatrimonio.DataSet) then
    begin
      // ✅ Abrir o DataSet se não estiver aberto
      if not DSPatrimonio.DataSet.Active then
        DSPatrimonio.DataSet.Open;

      // ✅ Conectar ao DBGrid
      DBGridPatrimonio.DataSource := DSPatrimonio;

      // ✅ Forçar refresh do grid
      DBGridPatrimonio.Refresh;
    end
    else
      raise Exception.Create('Erro: DataSet não foi criado');

  except
    on E: Exception do
      ShowMessage('Erro ao atualizar tabela de patrimônios: ' + E.Message);
  end;
end;

procedure TFormCadastro.LimparCamposPatrimonio;
begin
  EditNomePatri.Text := '';
  CbTipoPatrimonio.ItemIndex := -1;
  EdtModelo.Text := '';
  ComboBoxPatrimonio.ItemIndex := -1;
  CBSituacaoPatri.ItemIndex := -1;
  EdtVAQPatri.Text := '';
  EdtVAPatri.Text := '';
  EdtNS.Text := '';
  EdtDAPatri.Text := DateToStr(Now);
end;

procedure TFormCadastro.LimparCamposSala;
begin
  EditNameSala.Text := '';
  ComboBox2.ItemIndex := -1;
  EdtSituacaoSala.Text := '';
  EdtTipoSala.Text := '';
  EdtObs.Text := '';
end;

procedure TFormCadastro.LimparCamposPredio;
begin
  EdtNamePredio.Text := '';
  EdtNumeroPredio.Text := '';
  EditRuaPredio.Text := '';
  EdtBairroPredio.Text := '';
  EdtCepPredio.Text := '';
  EdtCidadePredio.Text := '';
  EdtEstadoPredio.Text := '';
  EdtTelefonePredio.Text := '';
  ComboBoxSituacao.ItemIndex := -1;
end;

function TFormCadastro.LimparValorMoeda(const Texto: string): Currency;
var
  FS: TFormatSettings;
  TextoLimpo: string;
  i: Integer;
begin
  Result := 0;
  TextoLimpo := '';

  // Extrai apenas dígitos e vírgula
  for i := 1 to Length(Texto) do
  begin
    if Texto[i] in ['0'..'9', ','] then
      TextoLimpo := TextoLimpo + Texto[i];
  end;

  if TextoLimpo = '' then
    Exit;

  // Configurações de formato brasileiro
  FS := TFormatSettings.Create;
  FS.DecimalSeparator := ',';
  FS.ThousandSeparator := '.';

  try
    Result := StrToCurr(TextoLimpo, FS);
  except
    Result := 0;
  end;
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
 try
    case PageControl1.ActivePageIndex of
      0: AtualizarTabelaE;      // TabSheet1 - Empresas
      1: AtualizarTabelaP;      // TabSheet2 - Prédios
      2: AtualizarTabelaS;      // TabSheet3 - Salas
      3: begin
           AtualizarTabelaPatrimonio;  // TabSheet4 - Patrimônios


           CheckBoxRecuperarPatri.Checked := False;
           Panel35.Visible := False;
         end;
    end;
  except
    on E: Exception do
      ShowMessage('Erro ao mudar de aba: ' + E.Message);
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

procedure TFormCadastro.PopularComboBoxTiposPatrimonio;
begin
  // Adicionar tipos de patrimônio ao ComboBox
  CbTipoPatrimonio.Items.Clear;
  CbTipoPatrimonio.Items.Add('Eletrônico');
  CbTipoPatrimonio.Items.Add('Móveis');
  CbTipoPatrimonio.Items.Add('Imóveis');
  CbTipoPatrimonio.Items.Add('Veículos');
  CbTipoPatrimonio.Items.Add('Máquinas e Equipamentos');
  CbTipoPatrimonio.Items.Add('Ferramentas');
  CbTipoPatrimonio.Items.Add('Computadores e Periféricos');
  CbTipoPatrimonio.Items.Add('Móveis de Escritório');
  CbTipoPatrimonio.Items.Add('Equipamentos de Informática');
  CbTipoPatrimonio.Items.Add('Utensílios');
  CbTipoPatrimonio.Items.Add('Software');
  CbTipoPatrimonio.Items.Add('Outros');
end;

function TFormCadastro.VerificarDependenciasSala(IdSala: Integer): TStringList;
var
  Dependencias: TStringList;
  TotalPatrimonios: Integer;
begin
  Dependencias := TStringList.Create;
  Result := Dependencias;

  try
    // Verificar patrimônios na sala usando o controller
    TotalPatrimonios := FSalaController.ContarPatrimoniosPorSala(IdSala);
    if TotalPatrimonios > 0 then
      Dependencias.Add(Format('%d patrimônio(s) nesta sala', [TotalPatrimonios]));

  except
    on E: Exception do
    begin
      Dependencias.Free;
      raise Exception.Create('Erro ao verificar dependências da sala: ' + E.Message);
    end;
  end;
end;

function TFormCadastro.VerificarDependenciasPredio(IdPredio: Integer): TStringList;
var
  Dependencias: TStringList;
  TotalSalas, TotalPatrimonios: Integer;
begin
  Dependencias := TStringList.Create;
  Result := Dependencias;

  try
    // Verificar salas no prédio usando o controller
    TotalSalas := FPredioController.ContarSalasPorPredio(IdPredio);
    if TotalSalas > 0 then
      Dependencias.Add(Format('%d sala(s) neste prédio', [TotalSalas]));

    // Verificar patrimônios nas salas do prédio
    TotalPatrimonios := FPredioController.ContarPatrimoniosPorPredio(IdPredio);
    if TotalPatrimonios > 0 then
      Dependencias.Add(Format('%d patrimônio(s) nas salas deste prédio', [TotalPatrimonios]));

  except
    on E: Exception do
    begin
      Dependencias.Free;
      raise Exception.Create('Erro ao verificar dependências do prédio: ' + E.Message);
    end;
  end;
end;

function TFormCadastro.VerificarDependenciasEmpresa(IdEmpresa: Integer): TStringList;
var
  Dependencias: TStringList;
  TotalPredios: Integer;
  Controller: TEmpresaController;
begin
  Dependencias := TStringList.Create;
  Result := Dependencias;

  try
    Controller := TEmpresaController.Create;
    try
      // Verificar prédios da empresa usando o controller
      TotalPredios := Controller.ContarPrediosPorEmpresa(IdEmpresa);
      if TotalPredios > 0 then
        Dependencias.Add(Format('%d prédio(s) nesta empresa', [TotalPredios]));
    finally
      Controller.Free;
    end;

  except
    on E: Exception do
    begin
      Dependencias.Free;
      raise Exception.Create('Erro ao verificar dependências da empresa: ' + E.Message);
    end;
  end;
end;

// Eventos de botões (mantidos)











procedure TFormCadastro.BtnAdicionarEmpresaClick(Sender: TObject);
begin
 BtnConfirmarEd.Visible := False;
  BtnEnviar.Visible := True;

  // Limpar campos e habilitar para edição
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

  SetEstadoCamposEmpresa(True);
  EditFantasia.SetFocus;
end;

procedure TFormCadastro.BtnAdicionarPatrimonioClick(Sender: TObject);
var
  Usuario: TUsuarioModel;
begin
  Usuario := TPermissoesHelper.GetUsuarioLogado;

  if not Usuario.PermCadEmpresa then
  begin
    ShowMessage('Você não tem permissão para adicionar empresas!');
    Exit;
  end;

  BtnEnviarPatrimonio.Visible := True;
  PopularComboBoxSalas;

    // Habilitar campos para edição
    SetEstadoCamposPatrimonio(True);
    LimparCamposPatrimonio;
  end;

procedure TFormCadastro.BtnAdicionarPredioClick(Sender: TObject);
begin
    BtnEnviarPredio.Visible := True;

    // Habilitar campos para edição
    SetEstadoCamposPredio(True);
    LimparCamposPredio;
end;



procedure TFormCadastro.BtnAdicionarSalaClick(Sender: TObject);
begin
    BtnEnviarSala.Visible := True;
    PopularComboBox;

    // Habilitar campos para edição
    SetEstadoCamposSala(True);
    LimparCamposSala;
end;


procedure TFormCadastro.BtnEditarEmpresaClick(Sender: TObject);
begin
  BtnConfirmarEd.Visible := True;
  BtnEnviar.Visible := False;

  try
    // Carregar dados da empresa nos campos
    EditFantasia.Text := DBGrid1.DataSource.DataSet.FieldByName('nome_fantasia').AsString;
    EditRazao.Text := DBGrid1.DataSource.DataSet.FieldByName('razao_social').AsString;
    EditCnpj.Text := DBGrid1.DataSource.DataSet.FieldByName('cnpj').AsString;
    EditTelefone.Text := DBGrid1.DataSource.DataSet.FieldByName('telefone').AsString;
    EditCep.Text := DBGrid1.DataSource.DataSet.FieldByName('cep').AsString;
    EditRua.Text := DBGrid1.DataSource.DataSet.FieldByName('rua').AsString;
    EditCidade.Text := DBGrid1.DataSource.DataSet.FieldByName('cidade').AsString;
    EditEstado.Text := DBGrid1.DataSource.DataSet.FieldByName('estado').AsString;
    EditNumero.Text := DBGrid1.DataSource.DataSet.FieldByName('numero').AsString;
    EditBairro.Text := DBGrid1.DataSource.DataSet.FieldByName('bairro').AsString;

    // Habilitar campos para edição
    SetEstadoCamposEmpresa(True);
  except
    on E: Exception do
      ShowMessage('Erro ao carregar dados da empresa: ' + E.Message);
  end;
end;







procedure TFormCadastro.BtnEditarPatrimonioClick(Sender: TObject);
var
  NomeSala: String;
  i: Integer;
begin
  BtnConfirmarEdPatri.Visible := True;
  BtnEnviarPatrimonio.Visible := False;

  try
    // Popular os ComboBox primeiro
    PopularComboBoxSalas;
    PopularComboBoxTiposPatrimonio;

    // Habilitar campos para edição
    SetEstadoCamposPatrimonio(True);

    EditNomePatri.Text := DBGridPatrimonio.DataSource.DataSet.FieldByName('nome').AsString;

    // Carregar o tipo de patrimônio no ComboBox
    CbTipoPatrimonio.ItemIndex := CbTipoPatrimonio.Items.IndexOf(DBGridPatrimonio.DataSource.DataSet.FieldByName('tipo').AsString);

    CBSituacaoPatri.Text := DBGridPatrimonio.DataSource.DataSet.FieldByName('situacao').AsString;
    EdtModelo.Text := DBGridPatrimonio.DataSource.DataSet.FieldByName('modelo').AsString;

    // ✅ USA formatação brasileira unificada
    EdtVAQPatri.Text := FormatarValorBrasileiro(DBGridPatrimonio.DataSource.DataSet.FieldByName('valor_aquisicao').AsCurrency);
    EdtVAPatri.Text := FormatarValorBrasileiro(DBGridPatrimonio.DataSource.DataSet.FieldByName('valor_atual').AsCurrency);

    EdtDAPatri.Text := DateToStr(DBGridPatrimonio.DataSource.DataSet.FieldByName('data_aquisicao').AsDateTime);
    EdtNS.Text := DBGridPatrimonio.DataSource.DataSet.FieldByName('numero_serie').AsString;

    // ✅ CORREÇÃO: Buscar sala no ComboBox de forma segura
    NomeSala := DBGridPatrimonio.DataSource.DataSet.FieldByName('nome_sala').AsString;
    ComboBoxPatrimonio.ItemIndex := -1; // Limpar seleção primeiro

    // Procurar a sala no ComboBox
    for i := 0 to ComboBoxPatrimonio.Items.Count - 1 do
    begin
      if ComboBoxPatrimonio.Items[i] = NomeSala then
      begin
        ComboBoxPatrimonio.ItemIndex := i;
        Break;
      end;
    end;

    // Se não encontrou, deixar o ComboBox sem seleção
    if ComboBoxPatrimonio.ItemIndex = -1 then
      ComboBoxPatrimonio.Text := '';

  except
    on E: Exception do
      ShowMessage('Erro ao carregar dados do patrimônio: ' + E.Message);
  end;
end;

procedure TFormCadastro.BtnEditarPredioClick(Sender: TObject);
begin
  BtnConfirmarEdPredio.Visible := True;
  BtnEnviarPredio.Visible := False;

  try
    // Habilitar campos para edição
    SetEstadoCamposPredio(True);

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

  try
    // Habilitar campos para edição
    SetEstadoCamposSala(True);

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

procedure TFormCadastro.CheckBoxRecuperarEmpClick(Sender: TObject);
begin
  Panel34.Visible := CheckBoxRecuperarEmp.Checked;

  if CheckBoxRecuperarEmp.Checked then
  begin
    try
      DataSEmpresa.DataSet := FEmpresaController.ListarEmpresaInativas;
      DataSEmpresa.DataSet.Open;
    except
      on E: Exception do
        ShowMessage('Erro ao carregar empresas inativas: ' + E.Message);
    end;
  end
  else
  begin
    try
      DataSEmpresa.DataSet := FEmpresaController.ListarEmpresa;
      DataSEmpresa.DataSet.Open;
    except
      on E: Exception do
        ShowMessage('Erro ao carregar empresas: ' + E.Message);
    end;
  end;
end;

procedure TFormCadastro.BtnFiltrarPatrimonioClick(Sender: TObject);
begin
  SearchBox1.Visible := True;
end;

procedure TFormCadastro.CheckBoxRecuperarPatriClick(Sender: TObject);
begin
  Panel35.Visible := CheckBoxRecuperarPatri.Checked;

  if CheckBoxRecuperarPatri.Checked then
  begin
    try
      DSPatrimonio.DataSet := FPatrimonioController.ListarPatrimoniosInativos;
      DSPatrimonio.DataSet.Open;
    except
      on E: Exception do
        ShowMessage('Erro ao carregar patrimônios inativos: ' + E.Message);
    end;
  end
  else
  begin
    try
      DSPatrimonio.DataSet := FPatrimonioController.ListarPatrimonio;
      DSPatrimonio.DataSet.Open;
    except
      on E: Exception do
        ShowMessage('Erro ao carregar patrimônios: ' + E.Message);
    end;
  end;
end;

procedure TFormCadastro.BtnFiltrarPredioClick(Sender: TObject);
begin
  edtPesquisarPredio.Visible := True;
end;

procedure TFormCadastro.CheckBoxRecuperarPredioClick(Sender: TObject);
begin
  Panel39.Visible := CheckBoxRecuperarPredio.Checked;

  if CheckBoxRecuperarPredio.Checked then
  begin
    try
      DSPredio.DataSet := FPredioController.ListarPredioInativos;
      DSPredio.DataSet.Open;
    except
      on E: Exception do
        ShowMessage('Erro ao carregar prédios inativos: ' + E.Message);
    end;
  end
  else
  begin
    try
      DSPredio.DataSet := FPredioController.ListarPredio;
      DSPredio.DataSet.Open;
    except
      on E: Exception do
        ShowMessage('Erro ao carregar prédios: ' + E.Message);
    end;
  end;
end;

procedure TFormCadastro.BtnFiltrarSalaClick(Sender: TObject);
begin
  edtPesquisarSala.Visible := True;
end;

procedure TFormCadastro.CheckBoxRecuperarSalaClick(Sender: TObject);
begin
  Panel36.Visible := CheckBoxRecuperarSala.Checked;

  if CheckBoxRecuperarSala.Checked then
  begin
    try
      DSSalas.DataSet := FSalaController.ListarSalasInativas;
      DSSalas.DataSet.Open;
    except
      on E: Exception do
        ShowMessage('Erro ao carregar salas inativas: ' + E.Message);
    end;
  end
  else
  begin
    try
      DSSalas.DataSet := FSalaController.ListarSala;
      DSSalas.DataSet.Open;
    except
      on E: Exception do
        ShowMessage('Erro ao carregar salas: ' + E.Message);
    end;
  end;
end;

// Funções de controle de estado dos campos
procedure TFormCadastro.SetEstadoCamposPatrimonio(Habilitado: Boolean);
begin
  // Habilitar/Desabilitar campos de Patrimônio
  EditNomePatri.Enabled := Habilitado;
  CbTipoPatrimonio.Enabled := Habilitado;
  CbSituacaoPatri.Enabled := Habilitado;
  EdtVAQPatri.Enabled := Habilitado;
  EdtVAPatri.Enabled := Habilitado;
  EdtModelo.Enabled := Habilitado;
  EdtDAPatri.Enabled := Habilitado;
  ComboBoxPatrimonio.Enabled := Habilitado;
  EdtNS.Enabled := Habilitado;

  // Mudar aparência dos campos
  if Habilitado then
  begin
    EditNomePatri.Color := clWindow;
    CbTipoPatrimonio.Color := clWindow;
    CbSituacaoPatri.Color := clWindow;
    EdtVAQPatri.Color := clWindow;
    EdtVAPatri.Color := clWindow;
    EdtModelo.Color := clWindow;
    EdtDAPatri.Color := clWindow;
    ComboBoxPatrimonio.Color := clWindow;
    EdtNS.Color := clWindow;
  end
  else
  begin
    EditNomePatri.Color := clBtnFace;
    CbTipoPatrimonio.Color := clBtnFace;
    CbSituacaoPatri.Color := clBtnFace;
    EdtVAQPatri.Color := clBtnFace;
    EdtVAPatri.Color := clBtnFace;
    EdtModelo.Color := clBtnFace;
    EdtDAPatri.Color := clBtnFace;
    ComboBoxPatrimonio.Color := clBtnFace;
    EdtNS.Color := clBtnFace;
  end;
end;

procedure TFormCadastro.SetEstadoCamposSala(Habilitado: Boolean);
begin
  // Habilitar/Desabilitar campos de Sala
  EditNameSala.Enabled := Habilitado;
  EdtObs.Enabled := Habilitado;
  EdtSituacaoSala.Enabled := Habilitado;
  EdtTipoSala.Enabled := Habilitado;
  ComboBox2.Enabled := Habilitado;

  // Mudar aparência dos campos
  if Habilitado then
  begin
    EditNameSala.Color := clWindow;
    EdtObs.Color := clWindow;
    EdtSituacaoSala.Color := clWindow;
    EdtTipoSala.Color := clWindow;
    ComboBox2.Color := clWindow;
  end
  else
  begin
    EditNameSala.Color := clBtnFace;
    EdtObs.Color := clBtnFace;
    EdtSituacaoSala.Color := clBtnFace;
    EdtTipoSala.Color := clBtnFace;
    ComboBox2.Color := clBtnFace;
  end;
end;

procedure TFormCadastro.SetEstadoCamposPredio(Habilitado: Boolean);
begin
  // Habilitar/Desabilitar campos de Prédio
  EdtNamePredio.Enabled := Habilitado;
  EdtNumeroPredio.Enabled := Habilitado;
  EditRuaPredio.Enabled := Habilitado;
  EdtBairroPredio.Enabled := Habilitado;
  EdtCepPredio.Enabled := Habilitado;
  EdtCidadePredio.Enabled := Habilitado;
  EdtEstadoPredio.Enabled := Habilitado;
  EdtTelefonePredio.Enabled := Habilitado;
  ComboBoxSituacao.Enabled := Habilitado;

  // Mudar aparência dos campos
  if Habilitado then
  begin
    EdtNamePredio.Color := clWindow;
    EdtNumeroPredio.Color := clWindow;
    EditRuaPredio.Color := clWindow;
    EdtBairroPredio.Color := clWindow;
    EdtCepPredio.Color := clWindow;
    EdtCidadePredio.Color := clWindow;
    EdtEstadoPredio.Color := clWindow;
    EdtTelefonePredio.Color := clWindow;
    ComboBoxSituacao.Color := clWindow;
  end
  else
  begin
    EdtNamePredio.Color := clBtnFace;
    EdtNumeroPredio.Color := clBtnFace;
    EditRuaPredio.Color := clBtnFace;
    EdtBairroPredio.Color := clBtnFace;
    EdtCepPredio.Color := clBtnFace;
    EdtCidadePredio.Color := clBtnFace;
    EdtEstadoPredio.Color := clBtnFace;
    EdtTelefonePredio.Color := clBtnFace;
    ComboBoxSituacao.Color := clBtnFace;
  end;
end;

procedure TFormCadastro.SetEstadoCamposEmpresa(Habilitado: Boolean);
begin
  // Habilitar/Desabilitar campos de Empresa
  EditFantasia.Enabled := Habilitado;
  EditRazao.Enabled := Habilitado;
  EditCnpj.Enabled := Habilitado;
  EditTelefone.Enabled := Habilitado;
  EditCep.Enabled := Habilitado;
  EditRua.Enabled := Habilitado;
  EditCidade.Enabled := Habilitado;
  EditEstado.Enabled := Habilitado;
  EditNumero.Enabled := Habilitado;
  EditBairro.Enabled := Habilitado;

  // Mudar aparência dos campos
  if Habilitado then
  begin
    EditFantasia.Color := clWindow;
    EditRazao.Color := clWindow;
    EditCnpj.Color := clWindow;
    EditTelefone.Color := clWindow;
    EditCep.Color := clWindow;
    EditRua.Color := clWindow;
    EditCidade.Color := clWindow;
    EditEstado.Color := clWindow;
    EditNumero.Color := clWindow;
    EditBairro.Color := clWindow;
  end
  else
  begin
    EditFantasia.Color := clBtnFace;
    EditRazao.Color := clBtnFace;
    EditCnpj.Color := clBtnFace;
    EditTelefone.Color := clBtnFace;
    EditCep.Color := clBtnFace;
    EditRua.Color := clBtnFace;
    EditCidade.Color := clBtnFace;
    EditEstado.Color := clBtnFace;
    EditNumero.Color := clBtnFace;
    EditBairro.Color := clBtnFace;
  end;
end;



end.
