program KeepInventory;

uses
  Vcl.Forms,
  login.view in 'view\login.view.pas' {Form2},
  uBlurHelper in 'view\uBlurHelper.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
