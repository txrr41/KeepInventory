unit LoginView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls, math,
  Vcl.Imaging.jpeg, Vcl.StdCtrls, Vcl.Skia, Vcl.Buttons, LoginController, LoginModel, HomeView, AuditoriaModel, AuditoriaController,
  Vcl.Menus;

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
self.close;
end;

procedure TFormLogin.SpeedButton1Click(Sender: TObject);
var
Login: TLoginConfig;
LogController: TLogController;
Controller: TLoginController;
UsuarioLog: TUserLog;
UsuarioExiste: Boolean;
Home: TFormHome;
DataHora: TDateTime;
DataFormatada: String;


begin
  Login := TLoginConfig.Create;
  Controller := TLoginController.Create;
  LogController := TLogController.Create;


try
  Login.User := EditUserLogin.Text;
  Login.Senha := EditSenhaLogin.Text;
  UsuarioExiste := Controller.SalvarLogin(Login);

  if UsuarioExiste = True then begin
    UsuarioLog := TUserLog.Create;
    UsuarioLog.UserName := EditUserLogin.Text;
    DataHora := Now;
    DataFormatada := FormatDateTime('yyyy/mm/dd hh:nn:ss', DataHora);
    UsuarioLog.Date := DataHora;
    UsuarioLog.Msg := 'Realizou o login';
    LogController.RegAuditoria(UsuarioLog);
    Home := TFormhome.Create(nil);
    Home.ShowModal;

  end else begin
  raise exception.Create('Usuário ou senha invalidos.');
  end;
finally
   Login.Free;
   Controller.Free;

end;
end;

end.
