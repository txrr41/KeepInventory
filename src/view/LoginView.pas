unit LoginView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls, math,
  Vcl.Imaging.jpeg, Vcl.StdCtrls, Vcl.Skia, Vcl.Buttons, LoginController, LoginModel, HomeView, AuditoriaModel, AuditoriaController, UsuarioController,
  Vcl.Menus, GlobalUserDTO, UsuarioModel, PermissoesHelper;

type
  TFormLogin = class(TForm)
    Panel2: TPanel;
    LoginPanel: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    Image1: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Panel3: TPanel;
    EditUserLogin: TEdit;
    Panel4: TPanel;
    EditSenhaLogin: TEdit;
    Shape2: TShape;
    Panel5: TPanel;
    Shape3: TShape;
    SpeedButton1: TSpeedButton;
    Label6: TLabel;
    Shape1: TShape;
    Label7: TLabel;
    Label8: TLabel;
    Image2: TImage;
    procedure FormResize(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EditUserLoginKeyPress(Sender: TObject; var Key: Char);
    procedure EditSenhaLoginKeyPress(Sender: TObject; var Key: Char);


  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormLogin: TFormLogin;

implementation

{$R *.dfm}

procedure TFormLogin.EditSenhaLoginKeyPress(Sender: TObject; var Key: Char);
begin
If Key = #13 then begin
  Key := #0;
  Perform(WM_NEXTDLGCTL, 0, 0);
  SpeedButton1.Click;
end;
end;

procedure TFormLogin.EditUserLoginKeyPress(Sender: TObject; var Key: Char);
begin
If Key = #13 then begin
  Key := #0;
  Perform(WM_NEXTDLGCTL, 0, 0);
  EditSenhaLogin.SetFocus;
end;
end;

procedure TFormLogin.FormCreate(Sender: TObject);
begin
 KeyPreview := True;
end;

procedure TFormLogin.FormResize(Sender: TObject);
var terco:Integer;
begin
  terco:=Floor(FormLogin.Width / 3);
  LoginPanel.Width := terco*2;
  Panel2.Width := terco;

end;



procedure TFormLogin.Image2Click(Sender: TObject);
begin
Application.Terminate;
end;

procedure TFormLogin.SpeedButton1Click(Sender: TObject);
var

  Controller: TLoginController;
  UsuarioExiste: Boolean;
  Home: TFormHome;
begin
  UserM:= TUsuarioModel.Create;
  Controller := TLoginController.Create;
  try
    // Define nome e senha (senha em texto puro, o hash será feito no repository)
    UserM.Nome := EditUserLogin.Text;
    UserM.SenhaHash := EditSenhaLogin.Text; // Recebe senha texto puro

    // Valida login
    UsuarioExiste := Controller.SalvarLogin(UserM);

    if not UsuarioExiste then
    begin
      // Log de tentativa de login falha - movido para Controller
      Controller.LogLoginFalho(EditUserLogin.Text);
      ShowMessage('Usu�rio ou senha inv�lidos!');
      Exit;
    end;

    // Se chegou aqui, o login foi v�lido e Usuario.Id foi preenchido

    // Busca as permiss�es completas do usu�rio
    UserM := FUsuarioController.ObterPermissoes(UserM.Id);

    if UserM = nil then
    begin
      ShowMessage('Erro ao carregar permiss�es do usu�rio!');
      Exit;
    end;

    // *** CR�TICO: SALVA O USU�RIO NO HELPER GLOBAL ***
    TPermissoesHelper.SetUsuarioLogado(UserM);

    // Registra log de auditoria - movido para Controller
    Controller.LogLoginSucesso;

    // Esconde tela de login e mostra Home
    Self.Hide;

    try
      Home := TFormHome.Create(nil);
      Home.ShowModal;
    finally
      Home.Free;
    end;

    // Fecha aplica��o ap�s sair da Home
    Application.Terminate;

  finally
    Controller.Free;
    UserM.Free;
  end;
end;



end.
