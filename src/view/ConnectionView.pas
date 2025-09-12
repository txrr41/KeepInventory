unit ConnectionView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, FireDAC.Comp.Client, ConnectionController, ConnectionModel, Math,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Phys.PGDef, FireDAC.Phys.PG,
  Data.DB, Vcl.Imaging.pngimage, LoginView;

type
  TFormConnection = class(TForm) LoginPanel: TPanel;
   Label1: TLabel; Image1: TImage; Label2: TLabel; Label3: TLabel; Panel2: TPanel; Panel1: TPanel; Label4: TLabel; Label5: TLabel; Panel3: TPanel; EditPassword: TEdit; Panel4: TPanel; Shape2: TShape; EditServer: TEdit; Panel6: TPanel; EditUser: TEdit; Panel7: TPanel; EditPort: TEdit; Panel8: TPanel; Shape4: TShape; EditDatabase: TEdit; Shape1: TShape; Shape5: TShape; Shape6: TShape; Label7: TLabel; Label8: TLabel; Label9: TLabel; Label10: TLabel; Label11: TLabel; Label12: TLabel; Label13: TLabel; FDConnection: TFDConnection; Panel5: TPanel; Shape3: TShape; Label6: TLabel; FDPhysPgDriverLink1: TFDPhysPgDriverLink; SpeedButton1: TSpeedButton; Label14: TLabel; Label15: TLabel;
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    FController: TConnectionController; // mantém o controller como campo do form
    procedure LoadConfigToFields;
    procedure ShowInitialScreen;
  public
  end;

var
  FormConnection: TFormConnection;


implementation

{$R *.dfm}

procedure TFormConnection.FormCreate(Sender: TObject);
begin
  // Cria apenas uma instância do controller
  FController := TConnectionController.Create(FDConnection);
  ShowInitialScreen; // Decide qual tela abrir
end;

procedure TFormConnection.FormResize(Sender: TObject);
var
  terco: Integer;
begin
  terco := Floor(Self.Width / 3);
  LoginPanel.Width := terco * 2;
end;

// Carrega os dados do controller para os campos
procedure TFormConnection.LoadConfigToFields;
var
  Config: TConnectionConfig;
begin
  Config := FController.LoadConfig;
  try
    EditServer.Text := Config.Server;
    EditPort.Text := Config.Port;
    EditDatabase.Text := Config.Database;
    EditUser.Text := Config.UserName;
    EditPassword.Text := Config.Password;
  finally
    Config.Free;
  end;
end;

// Decide qual tela abrir no início
procedure TFormConnection.ShowInitialScreen;
var formlogiN: TFormLogin;
begin
  if FController.IniExist then
  begin
  try
      formlogiN := TFormLogin.Create(nil);
      // INI existe → abre login
      LoadConfigToFields;
      FormLogin.ShowModal;
  finally
       FormLogin.free;
  end;

  end
  else
  begin
    // INI não existe → mantém a tela de conexão aberta
    ShowMessage('Arquivo de configuração não encontrado. Preencha os dados de conexão.');
  end;
end;

procedure TFormConnection.SpeedButton1Click(Sender: TObject);
var
  Config: TConnectionConfig;
  Msg: string;
begin
  Config := TConnectionConfig.Create;
  try
    Config.Server := EditServer.Text;
    Config.Port := EditPort.Text;
    Config.Database := EditDatabase.Text;
    Config.UserName := EditUser.Text;
    Config.Password := EditPassword.Text;

    if FController.SaveConfig(Config, Msg) then
    begin
      ShowMessage(Msg);
      LoadConfigToFields; // atualiza os campos
       // Aqui você pode abrir a tela de login após salvar
    end
    else
      ShowMessage('Falha: ' + Msg);

  finally
    Config.Free;
  end;
end;




end.

