unit ConnectionView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, FireDAC.Comp.Client, ConnectionController, ConnectionModel, Math,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Phys.PGDef, FireDAC.Phys.PG,
  Data.DB, Vcl.Imaging.pngimage;

type
  TFormConnection = class(TForm)
    LoginPanel: TPanel;
    EditServer: TEdit;
    EditPort: TEdit;
    EditDatabase: TEdit;
    EditUser: TEdit;
    EditPassword: TEdit;
    FDConnection: TFDConnection;
    SpeedButton1: TSpeedButton;
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
begin
  if FController.IniExist then
  begin
    // INI existe → abre login
    LoadConfigToFields;
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

