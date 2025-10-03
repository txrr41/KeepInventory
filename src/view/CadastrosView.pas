unit CadastrosView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.StdCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.WinXCtrls, Vcl.Mask, EmpresaController, EmpresaDTO, ListarEmpresasController, EmpresaModel;

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
    SpeedButton3: TSpeedButton;
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
    DBGrid2: TDBGrid;
    SearchBox2: TSearchBox;
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
    DBGrid3: TDBGrid;
    SearchBox3: TSearchBox;
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
    procedure BtnAdicionarEmpresaClick(Sender: TObject);
    procedure BtnAdicionarPredioClick(Sender: TObject);
    procedure BtnAdicionarSalaClick(Sender: TObject);
    procedure BtnEnviarClick(Sender: TObject);
    procedure BtnAtualizarEmpresaClick(Sender: TObject);
    procedure BtnEditarEmpresaClick(Sender: TObject);
    procedure BtnConfirmarEdClick(Sender: TObject);
    function  CarregarObjeto : TEmpresaDTO;
    procedure SpeedButton3Click(Sender: TObject);
    procedure edtPesquisarChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadastro: TFormCadastro;

implementation

{$R *.dfm}

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
end else  begin
  PanelAddPredio.Visible := False;
end;


end;

procedure TFormCadastro.BtnAdicionarSalaClick(Sender: TObject);
begin
if PanelAddSala.Visible = False then begin
  PanelAddSala.Visible := True;
end else  begin
  PanelAddSala.Visible := False;
end;


end;
procedure TFormCadastro.BtnAtualizarEmpresaClick(Sender: TObject);
var
Controller: TListEmpController;
begin
Controller := TListEmpController.Create;
DataSEmpresa.DataSet := Controller.ListarEmpresas;
DbGrid1.DataSource := DataSEmpresa;

end;

procedure TFormCadastro.BtnEditarEmpresaClick(Sender: TObject);
var
Controller: TEmpresaController;
Dto: TEmpresaDTO;
begin
PanelAddEmpresa.Visible := True;
BtnEnviar.Visible := False;
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


procedure TFormCadastro.BtnEnviarClick(Sender: TObject);
var
Controller: TEmpresaController;
Dto: TEmpresaDTO;
begin
Controller := TEmpresaController.Create;
try

CarregarObjeto;
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



procedure TFormCadastro.BtnConfirmarEdClick(Sender: TObject);
var
EmpModel: TEmpresaConfig;
Controller: TEmpresaController;
Dto: TEmpresaDTO;
begin
Controller := TEmpresaController.Create;
EmpModel := Controller.DtoForModel(CarregarObjeto);
PanelAddEmpresa.Visible := False;
Controller.EditarEmpresa(CarregarObjeto);
ShowMessage(IntToStr(EmpModel.Id));
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

procedure TFormCadastro.edtPesquisarChange(Sender: TObject);
var
Controller: TEmpresaController;
begin
 Controller := TEmpresaController.Create;
 Controller.PesquisarEmpresa(edtPesquisar.Text);
end;

procedure TFormCadastro.SpeedButton3Click(Sender: TObject);
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
