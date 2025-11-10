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
  Usuario: TUsuarioModel;
  LogController: TLogController;
  Controller: TLoginController;
  UsuarioLog: TUserLog;
  UsuarioExiste: Boolean;
  Home: TFormHome;
  DataHora: TDateTime;
begin
  Usuario := TUsuarioModel.Create;
  Controller := TLoginController.Create;
  LogController := TLogController.Create;
  try
    // Define nome e senha
    Usuario.Nome := EditUserLogin.Text;
    Usuario.SenhaHash := EditSenhaLogin.Text;

    // Valida login
    UsuarioExiste := Controller.SalvarLogin(Usuario);

    if not UsuarioExiste then
    begin
      ShowMessage('Usuário ou senha inválidos!');
      Exit;
    end;

    // Se chegou aqui, o login foi válido e Usuario.Id foi preenchido

    // Busca as permissões completas do usuário
    Usuario := FUsuarioController.ObterPermissoes(Usuario.Id);

    if Usuario = nil then
    begin
      ShowMessage('Erro ao carregar permissões do usuário!');
      Exit;
    end;

    // *** CRÍTICO: SALVA O USUÁRIO NO HELPER GLOBAL ***
    TPermissoesHelper.SetUsuarioLogado(Usuario);

    // Registra log de auditoria
    UsuarioLog := TUserLog.Create;
    try
      UsuarioLog.UserName := EditUserLogin.Text;
      DataHora := Now;
      UsuarioLog.Date := DataHora;
      UsuarioLog.Msg := 'Realizou o login';
      LogController.RegAuditoria(UsuarioLog);
    finally
      UsuarioLog.Free;
    end;

    // Esconde tela de login e mostra Home
    Self.Hide;

    try
      Home := TFormHome.Create(nil);
      Home.ShowModal;
    finally
      Home.Free;
    end;

    // Fecha aplicação após sair da Home
    Application.Terminate;

  except
    on E: Exception do
    begin
      ShowMessage('Erro ao fazer login: ' + E.Message);
      Usuario.Free;
    end;
  end;
end;



end.
