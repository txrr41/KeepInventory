program KeepInventory;

uses
  Vcl.Forms,
  LoginView in 'view\LoginView.pas' {Form2},
  uBlurHelper in 'view\uBlurHelper.pas',
  ConnectionView in 'view\ConnectionView.pas' {Form1},
  ConnectionModel in 'model\ConnectionModel.pas',
  ConnectionRepository in 'repository\ConnectionRepository.pas',
  ConnectionService in 'service\ConnectionService.pas',
  ConnectionController in 'controller\ConnectionController.pas',
  ConnectionVerificationService in 'service\ConnectionVerificationService.pas',
  LoginController in 'controller\LoginController.pas',
  LoginModel in 'model\LoginModel.pas',
  LoginService in 'service\LoginService.pas',
  LoginRepository in 'repository\LoginRepository.pas',
  DB in 'view\DB.pas' {DataModule2: TDataModule},
  HomeView in 'view\HomeView.pas' {FormHome},
  CadastrosView in 'view\CadastrosView.pas' {Form3},
  AuditoriaModel in 'model\AuditoriaModel.pas',
  AuditoriaController in 'controller\AuditoriaController.pas',
  AuditoriaService in 'service\AuditoriaService.pas',
  AuditoriaRepository in 'repository\AuditoriaRepository.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataModule2, DataModule2);
  Application.CreateForm(TFormHome, FormHome);
  Application.CreateForm(TFormConnection, FormConnection);
  Application.CreateForm(TFormLogin, FormLogin);
  Application.Run;
end.
