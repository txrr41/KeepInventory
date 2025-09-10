unit ConnectionView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls, math,
  Vcl.Imaging.jpeg, Vcl.StdCtrls, Vcl.Skia, Vcl.Buttons, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, ConnectionModel, ConnectionService,
  ConnectionRepository, ConnectionController, FireDAC.Phys.PGDef, FireDAC.Phys.PG;

type
  TFormConnection = class(TForm)
    LoginPanel: TPanel;
    Label1: TLabel;
    Image1: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Panel2: TPanel;
    Panel1: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Panel3: TPanel;
    EditPassword: TEdit;
    Panel4: TPanel;
    Shape2: TShape;
    EditServer: TEdit;
    Panel6: TPanel;
    EditUser: TEdit;
    Panel7: TPanel;
    EditPort: TEdit;
    Panel8: TPanel;
    Shape4: TShape;
    EditDatabase: TEdit;
    Shape1: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    FDConnection: TFDConnection;
    Panel5: TPanel;
    Shape3: TShape;
    Label6: TLabel;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    SpeedButton1: TSpeedButton;
    Label14: TLabel;
    Label15: TLabel;
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormConnection: TFormConnection;

implementation

{$R *.dfm}

procedure TFormConnection.FormResize(Sender: TObject);
var
  terco: Integer;
begin
  terco := Floor(FormConnection.Width / 3);
  LoginPanel.Width := terco * 2;
  Panel2.Width := terco;
end;

procedure TFormConnection.SpeedButton1Click(Sender: TObject);
var
  Config: TConnectionConfig;
  Msg: string;
  Controller: TConnectionController;
begin
  Config := TConnectionConfig.Create;
  try
    Config.Server := EditServer.Text;
    Config.Port := EditPort.Text;
    Config.Database := EditDatabase.Text;
    Config.UserName := EditUser.Text;
    Config.Password := EditPassword.Text;

    // View cria apenas o controller, controller cria o service e o service cria o reository!!!!!!!!!!!
    Controller := TConnectionController.Create(FDConnection);
    try
      if Controller.SaveConfig(Config, Msg) then
        ShowMessage(Msg)
      else
        ShowMessage('Falha: ' + Msg);
    finally
      Controller.Free;
    end;

  finally
    Config.Free;
  end;
end;

procedure TFormConnection.FormCreate(Sender: TObject);
var
  Config: TConnectionConfig;
  Controller: TConnectionController;
begin
  Controller := TConnectionController.Create(FDConnection);
  try
    Config := Controller.LoadConfig;
    try
      EditServer.Text := Config.Server;
      EditPort.Text := Config.Port;
      EditDatabase.Text := Config.Database;
      EditUser.Text := Config.UserName;
      EditPassword.Text := Config.Password;
    finally
      Config.Free;
    end;
  finally
    Controller.Free;
  end;
end;

end.

