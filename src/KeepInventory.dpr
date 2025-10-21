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
  AuditoriaRepository in 'repository\AuditoriaRepository.pas',
  EmpresaModel in 'model\EmpresaModel.pas',
  EmpresaController in 'controller\EmpresaController.pas',
  EmpresaDTO in 'dto\EmpresaDTO.pas',
  EmpresaService in 'service\EmpresaService.pas',
  EmpresaRepository in 'repository\EmpresaRepository.pas',
  PredioController in 'controller\PredioController.pas',
  PredioService in 'service\PredioService.pas',
  PredioRepository in 'repository\PredioRepository.pas',
  PredioModel in 'model\PredioModel.pas',
  PredioDTO in 'dto\PredioDTO.pas',
  SalaController in 'controller\SalaController.pas',
  SalaRepository in 'repository\SalaRepository.pas',
  SalaService in 'service\SalaService.pas',
  SalaModel in 'model\SalaModel.pas',
  SalaDTO in 'dto\SalaDTO.pas',
  PatrimonioModel in 'model\PatrimonioModel.pas',
  PatrimonioDTO in 'dto\PatrimonioDTO.pas',
  PatrimonioController in 'controller\PatrimonioController.pas',
  PatrimonioService in 'service\PatrimonioService.pas',
  PatrimonioRepository in 'repository\PatrimonioRepository.pas',
  MovimentacaoView in 'view\MovimentacaoView.pas' {Form4};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataModule2, DataModule2);
  Application.CreateForm(TFormConnection, FormConnection);
  Application.CreateForm(TFormLogin, FormLogin);
  Application.CreateForm(TFormHome, FormHome);
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
