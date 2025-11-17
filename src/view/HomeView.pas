unit HomeView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Skia, Vcl.StdCtrls,
  Vcl.ComCtrls, CadastrosView, EmpresaController, Data.DB, PedidoMoviView, MovimentacoesView, RegistroOcorrenciaView, AnaliseOcorrenciaView,
  Vcl.Imaging.pngimage, CadastroUsuarioView, PermissoesHelper, UsuarioModel, DashboardView, RastreamentoView;

type
  TFormHome = class(TForm)
    Panel1: TPanel;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image6: TImage;
    Image1: TImage;
    Image7: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Image8: TImage;
    Label7: TLabel;
    Label8: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Image9: TImage;
    Image10: TImage;
    Image11: TImage;
    Image5: TImage;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Image12: TImage;
    procedure Image1Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Image10Click(Sender: TObject);
    procedure Image11Click(Sender: TObject);
    procedure Image9Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);

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

  Image3.Visible := Usuario.PermCadastros;
  Image5.Visible := Usuario.PermMovimentacoes;
  Image6.Visible := Usuario.PermMovimentacoes;
  Image10.Visible := Usuario.PermOcorrencias;
  Image11.Visible := Usuario.PermOcorrencias;
  Image9.Visible := Usuario.PermUsuarios;
end;

procedure TFormHome.Image10Click(Sender: TObject);
var Ocorr: TFormRegistrarOcorrencia;
begin
  LimparPanel;

  Ocorr := TFormRegistrarOcorrencia.Create(Self);
  Ocorr.Parent := Self.Panel3;
  Ocorr.Align := alClient;
  Ocorr.BorderStyle := bsNone;
  Ocorr.Show;
end;

procedure TFormHome.Image11Click(Sender: TObject);
var Analise: TFormAnaliseOcorrencia;
begin
  LimparPanel;
  Analise := TFormAnaliseOcorrencia.Create(Self);
  Analise.Parent := Self.Panel3;
  Analise.Align := alClient;
  Analise.BorderStyle := bsNone;
  Analise.Show;
end;

procedure TFormHome.Image1Click(Sender: TObject);
begin
  if Panel1.Width = 50 then
    Panel1.Width := 200
  else if Panel1.Width = 200 then
    Panel1.Width := 50;
end;

procedure TFormHome.Image2Click(Sender: TObject);
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

procedure TFormHome.Image3Click(Sender: TObject);
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

procedure TFormHome.Image5Click(Sender: TObject);
var Movi: TFormPedidoMovi;
begin
  LimparPanel;

  Movi := TFormPedidoMovi.Create(Self);
  Movi.Parent := Self.Panel3;
  Movi.Align := alClient;
  Movi.BorderStyle := bsNone;
  Movi.Show;
end;

procedure TFormHome.Image6Click(Sender: TObject);
var Movi: TFormMovi;
begin
  LimparPanel;

  Movi := TFormMovi.Create(Self);
  Movi.Parent := Self.Panel3;
  Movi.Align := alClient;
  Movi.BorderStyle := bsNone;
  Movi.Show;
end;

procedure TFormHome.Image7Click(Sender: TObject);
var Rastreio: TFormRastreamento;
begin
   LimparPanel;

   Rastreio := TFormRastreamento.Create(Self);
   Rastreio.Parent := Self.Panel3;
   Rastreio.Align := alClient;
   Rastreio.BorderStyle := bsNone;
   Rastreio.Show;
end;

procedure TFormHome.Image8Click(Sender: TObject);
begin
  Halt;
end;

procedure TFormHome.Image9Click(Sender: TObject);
var User: TFormCadastroUsuario;
begin
  LimparPanel;


User := TFormCadastroUsuario.Create(Self);
User.Parent := Self.Panel3;
User.Align := alClient;
User.BorderStyle := bsNone;
User.Show;
end;

end.
