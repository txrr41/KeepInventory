unit LoginView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls, math,
  Vcl.Imaging.jpeg, Vcl.StdCtrls, Vcl.Skia, Vcl.Buttons, LoginController, LoginModel;

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

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormLogin: TFormLogin;

implementation

{$R *.dfm}

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
Controller: TLoginController;

begin
  Login := TLoginConfig.Create;
  Controller := TLoginController.Create;
try
  Login.User := EditUserLogin.Text;
  Login.Senha := EditSenhaLogin.Text;
  Controller.SalvarLogin(Login)
finally
   Login.Free;
   Controller.Free;
end;
end;

end.
