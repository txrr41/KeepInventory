unit CadastrosView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.StdCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.WinXCtrls, Vcl.Mask, EmpresaController, EmpresaDTO, EmpresaModel, PredioDTO, PredioModel, PredioController
  ,SalaDTO, SalaController, PatrimonioDTO, PatrimonioController;

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
    Button1: TButton;
    Button2: TButton;
    EdtVAQPatri: TMaskEdit;
    EdtQuantiPatri: TEdit;
    Label78: TLabel;
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
    procedure BtnAdicionarEmpresaClick(Sender: TObject);
    procedure BtnAdicionarPredioClick(Sender: TObject);
    procedure BtnAdicionarSalaClick(Sender: TObject);
    procedure BtnEnviarClick(Sender: TObject);
    procedure BtnAtualizarEmpresaClick(Sender: TObject);
    procedure BtnEditarEmpresaClick(Sender: TObject);
    procedure BtnConfirmarEdClick(Sender: TObject);
    function  CarregarObjeto : TEmpresaDTO;
    procedure BtnExcluirEmpresaClick(Sender: TObject);
    procedure edtPesquisarChange(Sender: TObject);
    procedure BtnFiltrarEmpresaClick(Sender: TObject);
    procedure BtnEnviarPredioClick(Sender: TObject);
    procedure BtnAtualizarPredioClick(Sender: TObject);
    procedure AtualizarTabelaP;
    procedure AtualizarTabelaE;
    procedure PageControl1Change(Sender: TObject);
    procedure BtnEditarPredioClick(Sender: TObject);
    procedure BtnConfirmarEdPredioClick(Sender: TObject);
    procedure BtnExcluirPredioClick(Sender: TObject);
    procedure edtPesquisarPredioChange(Sender: TObject);
    procedure BtnFiltrarPredioClick(Sender: TObject);
    procedure PopularComboBox;
    procedure BtnEnviarSalaClick(Sender: TObject);
    procedure AtualizarTabelaS;
    constructor Create (AComponent: TComponent);
    procedure BtnAtualizarSalaClic(Sender: TObject);
    procedure BtnExcluirSalaClick(Sender: TObject);
    procedure BtnEditarSalaClick(Sender: TObject);
    procedure BtnConfirmarEdtSalaClick(Sender: TObject);
    procedure EdtPesquisarSalaChange(Sender: TObject);
    procedure BtnAdicionarPatrimonioClick(Sender: TObject);
    procedure AtualizarTabelaPatri;


  private
    procedure AtualizarTabelaPatrimonio;
    procedure BtnAtualizarPatrimonioClick(Sender: TObject);
    procedure BtnConfirmarEdPatrimonioClick(Sender: TObject);
    procedure BtnEditarPatrimonioClick(Sender: TObject);
    procedure BtnEnviarPatrimonioClick(Sender: TObject);
    procedure BtnExcluirPatrimonioClick(Sender: TObject);
    procedure BtnFiltrarPatrimonioClick(Sender: TObject);
    procedure LimparCamposPatrimonio;
    procedure PopularComboBoxSalas;
    procedure SearchBox1Change(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadastro: TFormCadastro;

implementation

{$R *.dfm}


procedure TFormCadastro.AtualizarTabelaPatrimonio;
begin
  DataSEmpresa.DataSet := FPatrimonioController.ListarPatrimonio;
  DBGridPatrimonio.DataSource := DataSEmpresa;
end;

// 3. Botão Adicionar Patrimônio
procedure TFormCadastro.BtnAdicionarPatrimonioClick(Sender: TObject);
begin
  if Panel34.Visible = False then begin
    Panel34.Visible := True;
    Button1.Visible := True;  // BtnEnviarPatrimonio
    PopularComboBoxSalas;
  end else begin
    Panel34.Visible := False;
  end;
end;

// 4. Popular ComboBox com Salas
procedure TFormCadastro.PopularComboBoxSalas;
begin
  FPatrimonioController.PopularComboBox(ComboBoxPatrimonio);  // ComboBox de Salas
end;

// 5. Botão Enviar (Adicionar) Patrimônio
procedure TFormCadastro.BtnEnviarPatrimonioClick(Sender: TObject);
var
  Dto: TPatrimonioDTO;
  SelectedID: Integer;
begin
  try
    // Validar seleção de Sala
    if ComboBoxPatrimonio.ItemIndex >= 0 then
    begin
      SelectedID := Integer(NativeInt(ComboBoxPatrimonio.Items.Objects[ComboBoxPatrimonio.ItemIndex]));
      Dto.FIdSala := SelectedID;
    end
    else
    begin
      raise Exception.Create('Por favor, selecione uma Sala.');
    end;

    // Preencher DTO
    Dto.FNome := EditNomePatri.Text;  // EdtNomePatrimonio
    Dto.FTipo := EdtTipoPatri.Text;  // EdtTipoPatrimonio
    Dto.FSituacao := CBSituacaoPatri.Text;  // CmbSituacaoPatrimonio
    Dto.FModelo := EdtModelo.Text;  // EdtModelo - VOCÊ PRECISA ADICIONAR ESTE CAMPO
    Dto.FValorAquisicao := StrToFloatDef(EdtVAQPatri.Text, 0);  // ADICIONAR CAMPO
    Dto.FValorAtual := StrToFloatDef(EdtVAPatri.Text, 0);  // ADICIONAR CAMPO
    Dto.FQuantidade := StrToIntDef(EdtQuantiPatri.Text, 0);  // ADICIONAR CAMPO
    Dto.FDataAquisicao := StrToDate(EdtDAPatri.Text);  // ADICIONAR CAMPO
    Dto.FNumeroSerie := EdtNS.Text;  // ADICIONAR CAMPO

    // Adicionar no banco
    FPatrimonioController.AdicionarPatrimonio(Dto);
    AtualizarTabelaPatrimonio;

    // Limpar campos
    LimparCamposPatrimonio;
    Panel34.Visible := False;

    ShowMessage('Patrimônio adicionado com sucesso!');
  except
    on E: Exception do
      ShowMessage('Erro ao salvar: ' + E.Message);
  end;
end;

// 6. Botão Editar Patrimônio
procedure TFormCadastro.BtnEditarPatrimonioClick(Sender: TObject);
begin
  Button2.Visible := True;  // BtnConfirmarEdPatrimonio
  Button1.Visible := False; // BtnEnviarPatrimonio
  Panel34.Visible := True;

  try
    EditNomePatri.Text := DBGridPatrimonio.DataSource.DataSet.FieldByName('nome').AsString;
    EdtTipoPatri.Text := DBGridPatrimonio.DataSource.DataSet.FieldByName('tipo').AsString;
    CBSituacaoPatri.Text := DBGridPatrimonio.DataSource.DataSet.FieldByName('situacao').AsString;
    EdtModelo.Text := DBGridPatrimonio.DataSource.DataSet.FieldByName('modelo').AsString;
    EdtVAQPatri.Text := FormatFloat('0.00', DBGridPatrimonio.DataSource.DataSet.FieldByName('valor_aquisicao').AsFloat);
    EdtVAPatri.Text := FormatFloat('0.00', DBGridPatrimonio.DataSource.DataSet.FieldByName('valor_atual').AsFloat);
    EdtQuantiPatri.Text := DBGridPatrimonio.DataSource.DataSet.FieldByName('quantidade').AsString;
    EdtDAPatri.Text := DateToStr(DBGridPatrimonio.DataSource.DataSet.FieldByName('data_aquisicao').AsDateTime);
    EdtNS.Text := DBGridPatrimonio.DataSource.DataSet.FieldByName('numero_serie').AsString;
    ComboBoxPatrimonio.Text := DBGridPatrimonio.DataSource.DataSet.FieldByName('nome_sala').AsString;

    PopularComboBoxSalas;
  finally
  end;
end;

// 7. Confirmar Edição
procedure TFormCadastro.BtnConfirmarEdPatrimonioClick(Sender: TObject);
var
  Dto: TPatrimonioDTO;
  SelectedID: Integer;
begin
  try
    SelectedID := Integer(NativeInt(ComboBoxPatrimonio.Items.Objects[ComboBoxPatrimonio.ItemIndex]));
    Dto.FIdSala := SelectedID;

    Dto.FNome := EditNomePatri.Text;
    Dto.FTipo := EdtTipoPatri.Text;
    Dto.FSituacao := CBSituacaoPatri.Text;
    Dto.FModelo := EdtModelo.Text;
    Dto.FValorAquisicao := StrToFloatDef(EdtVAQPatri.Text, 0);
    Dto.FValorAtual := StrToFloatDef(EdtVAPatri.Text, 0);
    Dto.FQuantidade := StrToIntDef(EdtQuantiPatri.Text, 0);
    Dto.FDataAquisicao := StrToDate(EdtDAPatri.Text);
    Dto.FNumeroSerie := EdtNS.Text;
    Dto.FId := DBGridPatrimonio.DataSource.DataSet.FieldByName('id').AsInteger;

    FPatrimonioController.EditarPatrimonio(Dto);
    AtualizarTabelaPatrimonio;

    LimparCamposPatrimonio;
    Panel34.Visible := False;

    ShowMessage('Patrimônio atualizado com sucesso!');
  except
    on E: Exception do
      ShowMessage('Erro ao editar: ' + E.Message);
  end;
end;

// 8. Excluir Patrimônio
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
    AtualizarTabelaPatrimonio;
    ShowMessage('Patrimônio excluído com sucesso!');
  end;
end;

// 9. Pesquisar Patrimônio
procedure TFormCadastro.SearchBox1Change(Sender: TObject);
begin
  DataSEmpresa.DataSet := FPatrimonioController.PesquisarPatrimonio(SearchBox1.Text);
  DBGridPatrimonio.DataSource := DataSEmpresa;
end;

// 10. Botão Atualizar
procedure TFormCadastro.BtnAtualizarPatrimonioClick(Sender: TObject);
begin
  AtualizarTabelaPatrimonio;
end;

// 11. Botão Filtrar
procedure TFormCadastro.BtnFiltrarPatrimonioClick(Sender: TObject);
begin
  SearchBox1.Visible := True;
end;

// 12. Limpar Campos
procedure TFormCadastro.LimparCamposPatrimonio;
begin
  EditNomePatri.Text := '';
  EdtTipoSala.Text := '';
  EdtModelo.Text := '';
  ComboBoxPatrimonio.ItemIndex := -1;
  CBSituacaoPatri.ItemIndex := -1;
  EdtVAQPatri.Text := '';
  EdtVAPatri.Text := '';
  EdtQuantiPatri.Text := '';
  EdtNS.Text := '';
  EdtDAPatri.Text := DateToStr(Now);
end;

procedure TFormCadastro.AtualizarTabelaE;
var
Controller: TEmpresaController;
begin
Controller := TEmpresaController.Create;
DataSEmpresa.DataSet := Controller.ListarEmpresa;
DbGrid1.DataSource := DataSEmpresa;

end;

procedure TFormCadastro.AtualizarTabelaP;
var Controller: TPredioController;
begin
Controller := TPredioController.Create;
DataSEmpresa.DataSet := Controller.ListarPredio;
DbGridPredio.DataSource := DataSEmpresa;
end;

procedure TFormCadastro.AtualizarTabelaS;
begin
DataSEmpresa.DataSet := FSalaController.ListarSala;
DbGridSalas.DataSource := DataSEmpresa;
end;

procedure TFormCadastro.BtnAdicionarEmpresaClick(Sender: TObject);
begin
BtnConfirmarEd.Visible := False;
BtnEnviar.Visible := True;
if PanelAddEmpresa.Visible = False then begin
  PanelAddEmpresa.Visible := True;
end else  begin
  PanelAddEmpresa.Visible := False;
end;


end;


procedure TFormCadastro.BtnAdicionarPredioClick(Sender: TObject);
begin
if PanelAddPredio.Visible = False then begin
  PanelAddPredio.Visible := True;
  BtnEnviarPredio.Visible := True;
end else  begin
  PanelAddPredio.Visible := False;
end;


end;

procedure TFormCadastro.BtnAdicionarSalaClick(Sender: TObject);
begin
if PanelAddSala.Visible = False then begin
  PanelAddSala.Visible := True;
  BtnEnviarSala.Visible := True;
  PopularComboBox;

end else  begin
  PanelAddSala.Visible := False;
end;


end;
procedure TFormCadastro.BtnAtualizarEmpresaClick(Sender: TObject);
begin
   AtualizarTabelaE;
end;

procedure TFormCadastro.BtnAtualizarPredioClick(Sender: TObject);
begin
    AtualizarTabelaP;
end;

procedure TFormCadastro.BtnAtualizarSalaClic(Sender: TObject);
begin
AtualizarTabelaS;
end;

procedure TFormCadastro.BtnEditarEmpresaClick(Sender: TObject);
var
Controller: TEmpresaController;
Dto: TEmpresaDTO;
begin
PanelAddEmpresa.Visible := True;
BtnEnviar.Visible := False;
BtnConfirmarEd.Visible :=  True;
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


procedure TFormCadastro.BtnEditarPredioClick(Sender: TObject);
var
Controller: TPredioController;
Dto: GPredioDTO;
begin
PanelAddPredio.Visible := True;
BtnConfirmarEdPredio.Visible := True;

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
var
Dto: TSalaDTO;
begin
BtnConfirmarEdtSala.Visible := True;
 PanelAddSala.Visible := True;
try

    EditNameSala.Text := DBGridSalas.DataSource.DataSet.FieldByName('nome').AsString;
    ComboBox2.Text := DBGridSalas.DataSource.DataSet.FieldByName('nome_predio').AsString;
    PopularComboBox;
    EdtSituacaoSala.Text := DBGridSalas.DataSource.DataSet.FieldByName('situacao').AsString;
    EdtTipoSala.Text :=  DBGridSalas.DataSource.DataSet.FieldByName('tipo').AsString;
    EdtObs.Text := DBGridSalas.DataSource.DataSet.FieldByName('observacao').AsString;

finally



end;

end;

procedure TFormCadastro.BtnEnviarClick(Sender: TObject);
var
Controller: TEmpresaController;
Dto: TEmpresaDTO;
begin
Controller := TEmpresaController.Create;
try

dto := CarregarObjeto;
Controller.AdicionarEmpresa(dto);

ShowMessage('Cliente Adicionado');

PanelAddEmpresa.Visible := False;

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

finally
Controller.Free;
end;


end;



procedure TFormCadastro.BtnExcluirPredioClick(Sender: TObject);
var
IdPredio: Integer;
Predio: String;
begin
Predio := DBGridPredio.DataSource.DataSet.FieldByName('nome').AsString;
if MessageDlg('O Predio ' + Predio + ' sera excluido, deseja continuar?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    IdPredio := DBGridPredio.DataSource.DataSet.FieldByName('id').AsInteger;

    ControllerPredio.ExcluirPredio(IdPredio);

    AtualizarTabelaP;
end;


procedure TFormCadastro.BtnExcluirSalaClick(Sender: TObject);
var
IdSala: Integer;
Sala: String;
begin
Sala := DBGridSalas.DataSource.DataSet.FieldByName('nome').AsString;
if MessageDlg('A Sala ' + Sala + ' sera excluida, deseja continuar?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    IdSala := DBGridSalas.DataSource.DataSet.FieldByName('id').AsInteger;

    FSalaController.ExcluirSala(IdSala);

    AtualizarTabelaS;
end;


procedure TFormCadastro.BtnFiltrarEmpresaClick(Sender: TObject);
begin
edtPesquisar.Visible := True;
end;

procedure TFormCadastro.BtnFiltrarPredioClick(Sender: TObject);
begin
edtPesquisarPredio.Visible := True;
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
    AtualizarTabelaS;

    EditNameSala.Text := '';
    ComboBox2.ItemIndex := -1;
    EdtSituacaoSala.Text := '';
    EdtTipoSala.Text := '';
    EdtObs.Text := '';

    PanelAddSala.Visible := False;
  except
    on E: Exception do
      ShowMessage('Erro ao salvar: ' + E.Message);
  end;
end;

procedure TFormCadastro.BtnConfirmarEdtSalaClick(Sender: TObject);
var
Dto: TSalaDTO;
SelectedID: Integer;
begin
    SelectedID := Integer(NativeInt(ComboBox2.Items.Objects[ComboBox2.ItemIndex]));
    Dto.FIdPredio := SelectedID;
    Dto.FNome := EditNameSala.Text;
    Dto.FSituacao := EdtSituacaoSala.Text;
    Dto.FTipo := EdtTipoSala.Text;
    Dto.FObservacao := EdtObs.Text;
    Dto.FId := DBGridSalas.DataSource.DataSet.FieldByName('id').AsInteger;

    FSalaController.EditarSala(Dto);

     EditNameSala.Text := '';
    ComboBox2.ItemIndex := -1;
    EdtSituacaoSala.Text := '';
    EdtTipoSala.Text := '';
    EdtObs.Text := '';

    PanelAddSala.Visible := False;
end;

procedure TFormCadastro.BtnEnviarPredioClick(Sender: TObject);
var
Dto : GPredioDTO;

begin

try

Dto.FNome := EdtNamePredio.Text;
Dto.FSituacao := ComboBoxSituacao.Text;
Dto.FTelefone:= EdtTelefonePredio.Text;
Dto.FCep := EdtCepPredio.Text;
Dto.FRua:= EditRuaPredio.Text;
Dto.FCidade := EdtCidadePredio.Text;
Dto.FEstado := EdtEstadoPredio.Text;
Dto.FNumero := StrToInt (EdtNumeroPredio.Text);
Dto.FBairro := EdtBairroPredio.Text;

ControllerPredio.AdicionarPredio(Dto);


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

finally

end;

end;

procedure TFormCadastro.BtnConfirmarEdPredioClick(Sender: TObject);
var
Dto: GPredioDTO;

begin
Dto.FNome := EdtNamePredio.Text;
Dto.FSituacao := ComboBoxSituacao.Text;
Dto.FTelefone:= EdtTelefonePredio.Text;
Dto.FCep := EdtCepPredio.Text;
Dto.FRua:= EditRuaPredio.Text;
Dto.FCidade := EdtCidadePredio.Text;
Dto.FEstado := EdtEstadoPredio.Text;
Dto.FNumero := StrToInt (EdtNumeroPredio.Text);
Dto.FBairro := EdtBairroPredio.Text;
Dto.FId := DBGridPredio.DataSource.DataSet.FieldByName('id').AsInteger;

ControllerPredio.EditarPredio(Dto);

AtualizarTabelaP;

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


end;

procedure TFormCadastro.BtnConfirmarEdClick(Sender: TObject);
var
EmpModel: TEmpresaConfig;
Controller: TEmpresaController;
Dto: TEmpresaDTO;
begin
Controller := TEmpresaController.Create;
EmpModel := Controller.DtoForModel(CarregarObjeto);

Controller.EditarEmpresa(CarregarObjeto);
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
end;

function TFormCadastro.CarregarObjeto : TEmpresaDTO;
var
Dto: TEmpresaDTO;
begin

Dto.FNomeFan := EditFantasia.Text;
Dto.FRazao := EditRazao.Text;
Dto.FCnpj := EditCnpj.Text;
Dto.FTelefone:= EditTelefone.Text;
Dto.FCep := EditCep.Text;
Dto.FRua:= EditRua.Text;
Dto.FCidade := EditCidade.Text;
Dto.FEstado := EditEstado.Text;
Dto.FNumero := StrToInt (EditNumero.Text);
Dto.FBairro := EditBairro.Text;
Dto.FId := DBGrid1.DataSource.DataSet.FieldByName('id').AsInteger;
Result := Dto;
end;

constructor TFormCadastro.Create(AComponent: TComponent);
begin
inherited Create(AComponent);
SalaController.FSalaController := TSalaController.Create;
end;

procedure TFormCadastro.edtPesquisarChange(Sender: TObject);
var
Controller: TEmpresaController;
begin
 Controller := TEmpresaController.Create;
 DataSEmpresa.DataSet := Controller.PesquisarEmpresa(edtPesquisar.Text);
 DbGrid1.DataSource := DataSEmpresa;
end;

procedure TFormCadastro.PageControl1Change(Sender: TObject);
begin

if PageControl1.ActivePage = TabSheet1 then begin
AtualizarTabelaE;
end else if PageControl1.ActivePage = TabSheet2 then begin
AtualizarTabelaP;
end else if PageControl1.ActivePage = TabSheet3 then begin
AtualizarTabelaS
end else if PageControl1.ActivePage = TabSheet4 then
AtualizarTabelaPatri
end;

procedure TFormCadastro.PopularComboBox;
begin
    FSalaController.PopularComboBox(ComboBox2);
end;

procedure TFormCadastro.EdtPesquisarSalaChange(Sender: TObject);
begin
  DataSEmpresa.DataSet := FSalaController.PesquisarSala(edtPesquisarSala.Text);
  DBGridPredio.DataSource := DataSEmpresa;
end;

procedure TFormCadastro.edtPesquisarPredioChange(Sender: TObject);
begin
DataSEmpresa.DataSet := ControllerPredio.PesquisarPredio(edtPesquisarPredio.Text);
DBGridPredio.DataSource := DataSEmpresa;
end;

procedure TFormCadastro.BtnExcluirEmpresaClick(Sender: TObject);
var
IdUser: Integer;
Controller: TEmpresaController;
Emp: String;
begin
Emp := DBGrid1.DataSource.DataSet.FieldByName('nome_fantasia').AsString;
if MessageDlg('A Empresa ' + Emp + ' sera excluida, deseja continuar?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    IdUser := DBGrid1.DataSource.DataSet.FieldByName('id').AsInteger;
    Controller := TEmpresaController.Create;
    Controller.ExcluirEmpresa(IdUser);
end;


end.
