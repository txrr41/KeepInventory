unit HomeView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Skia, Vcl.StdCtrls,
  Vcl.ComCtrls, CadastrosView, EmpresaController, Data.DB, PedidoMoviView, MovimentacoesView, RegistroOcorrenciaView, AnaliseOcorrenciaView,
  Vcl.Imaging.pngimage, CadastroUsuarioView, PermissoesHelper, UsuarioModel, DashboardView, RastreamentoView,
  Vcl.Buttons, ControleDePatrimoniosView;

type
  TFormHome = class(TForm)
    Panel1: TPanel;
    Image8: TImage;
    Label7: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Label8: TLabel;
    Panel5: TPanel;
    Image13: TImage;
    Label12: TLabel;
    PanelCadastros: TPanel;
    Label14: TLabel;
    Image2: TImage;
    Panel8: TPanel;
    Label15: TLabel;
    Panel9: TPanel;
    Label16: TLabel;
    Image4: TImage;
    Panel10: TPanel;
    Label17: TLabel;
    Image5: TImage;
    Panel11: TPanel;
    Label18: TLabel;
    Image6: TImage;
    Panel12: TPanel;
    Label19: TLabel;
    Image9: TImage;
    Panel13: TPanel;
    Label20: TLabel;
    Image10: TImage;
    Panel14: TPanel;
    Label21: TLabel;
    Image11: TImage;
    Image7: TImage;
    Label1: TLabel;
    Image1: TImage;
    BtnMenuPatrimonio: TSpeedButton;
    BtnMenuPedidoMovi: TSpeedButton;
    BtnMenuMovi: TSpeedButton;
    BtnMenuUsuarios: TSpeedButton;
    BtnMenuOcorrencias: TSpeedButton;
    BtnMenuAnaliseOcorr: TSpeedButton;
    BtnMenuLocalizacao: TSpeedButton;
    BtnMenuRelatorios: TSpeedButton;
    BtnMenuCad: TSpeedButton;
    procedure Image2211(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnMenuPatrimonioClick(Sender: TObject);
    procedure BtnMenuCadClick(Sender: TObject);
    procedure BtnMenuPedidoMoviClick(Sender: TObject);
    procedure BtnMenuMoviClick(Sender: TObject);
    procedure BtnMenuUsuariosClick(Sender: TObject);
    procedure BtnMenuOcorrenciasClick(Sender: TObject);
    procedure BtnMenuAnaliseOcorrClick(Sender: TObject);
    procedure BtnMenuLocalizacaoClick(Sender: TObject);
    procedure BtnMenuRelatoriosClick(Sender: TObject);

  private
    ActiveForm: TForm;
    procedure LimparPanel;
  public
    { Public declarations }
  end;

var
  FormHome: TFormHome;

implementation

{$R *.dfm}

procedure TFormHome.LimparPanel;
var
  i: Integer;
begin

  for i := Panel3.ControlCount - 1 downto 0 do
  begin
    if Panel3.Controls[i] is TForm then
    begin
      TForm(Panel3.Controls[i]).Free;
    end;
  end;
end;

procedure TFormHome.BtnMenuUsuariosClick(Sender: TObject);
var User: TFormCadastroUsuario;
begin
  LimparPanel;

User := TFormCadastroUsuario.Create(Self);
User.Parent := Self.Panel3;
User.Align := alClient;
User.BorderStyle := bsNone;
User.Show;

end;

procedure TFormHome.BtnMenuAnaliseOcorrClick(Sender: TObject);
var Analise: TFormAnaliseOcorrencia;
begin
  LimparPanel;
  Analise := TFormAnaliseOcorrencia.Create(Self);
  Analise.Parent := Self.Panel3;
  Analise.Align := alClient;
  Analise.BorderStyle := bsNone;
  Analise.Show;

end;

procedure TFormHome.BtnMenuCadClick(Sender: TObject);
var
  Cad: TFormCadastro;
  Controller: TEmpresaController;
begin
  LimparPanel;

  Cad := TFormCadastro.Create(Self, '');
  Cad.Parent := Self.Panel3;
  Cad.Align := alClient;
  Cad.BorderStyle := bsNone;
  Cad.Show;

  Controller := TEmpresaController.Create;
  try
    Cad.DataSEmpresa.DataSet := Controller.ListarEmpresa;
    Cad.DbGrid1.DataSource := Cad.DataSEmpresa;
  finally
    Controller.Free;
  end;
end;

procedure TFormHome.BtnMenuLocalizacaoClick(Sender: TObject);
var Rastreio: TFormRastreamento;
begin
   LimparPanel;

   Rastreio := TFormRastreamento.Create(Self);
   Rastreio.Parent := Self.Panel3;
   Rastreio.Align := alClient;
   Rastreio.BorderStyle := bsNone;
   Rastreio.Show;

end;

procedure TFormHome.BtnMenuPedidoMoviClick(Sender: TObject);
var Movi: TFormPedidoMovi;
begin
  LimparPanel;

  Movi := TFormPedidoMovi.Create(Self);
  Movi.Parent := Self.Panel3;
  Movi.Align := alClient;
  Movi.BorderStyle := bsNone;
  Movi.Show;

end;

procedure TFormHome.BtnMenuRelatoriosClick(Sender: TObject);
var
Dash: TFormDashboard;
begin

 LimparPanel;

 Dash := TFormDashboard.Create(self);
 Dash.Parent := Self.Panel3;
 Dash.Align := alClient;
 Dash.BorderStyle := bsNone;
 Dash.Show;

end;

procedure TFormHome.BtnMenuMoviClick(Sender: TObject);
var Movi: TFormMovi;
begin
  LimparPanel;

  Movi := TFormMovi.Create(Self);
  Movi.Parent := Self.Panel3;
  Movi.Align := alClient;
  Movi.BorderStyle := bsNone;
  Movi.Show;
end;

procedure TFormHome.BtnMenuOcorrenciasClick(Sender: TObject);
var Ocorr: TFormRegistrarOcorrencia;
begin
  LimparPanel;

  Ocorr := TFormRegistrarOcorrencia.Create(Self);
  Ocorr.Parent := Self.Panel3;
  Ocorr.Align := alClient;
  Ocorr.BorderStyle := bsNone;
  Ocorr.Show;

end;

procedure TFormHome.BtnMenuPatrimonioClick(Sender: TObject);
var
Dash: TFormControlePatrimonio;
begin

 LimparPanel;

 Dash := TFormControlePatrimonio.Create(self);
 Dash.Parent := Self.Panel3;
 Dash.Align := alClient;
 Dash.BorderStyle := bsNone;
 Dash.Show;


end;

procedure TFormHome.FormCreate(Sender: TObject);
var
  Usuario: TUsuarioModel;
  Dash: TFormDashboard;
begin
  Usuario := TPermissoesHelper.GetUsuarioLogado;

  if Usuario = nil then
  begin
    ShowMessage('Erro: Usuário não autenticado!');
    Application.Terminate;
    Exit;
  end;

  LimparPanel;

  Dash := TFormDashboard.Create(self);
  Dash.Parent := Self.Panel3;
  Dash.Align := alClient;
  Dash.BorderStyle := bsNone;
  Dash.Show;

  PanelCadastros.Visible := Usuario.PermCadastros;
  Panel10.Visible := Usuario.PermMovimentacoes;
  Panel9.Visible := Usuario.PermMovimentacoes;
  Panel13.Visible := Usuario.PermOcorrencias;
  Panel12.Visible := Usuario.PermOcorrencias;
  Panel11.Visible := Usuario.PermUsuarios;
end;

procedure TFormHome.Image2211(Sender: TObject);
begin
  if Panel1.Width = 59 then
    Panel1.Width := 240
  else if Panel1.Width = 240 then
    Panel1.Width := 59;
end;

procedure TFormHome.Image8Click(Sender: TObject);
begin
  if MessageDlg('Deseja realmente sair do sistema?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    Application.Terminate;
  end;
end;

end.
