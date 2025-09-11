unit ConnectionVerificationService;

interface

uses
System.IOUtils, LoginView;

type
TIniVerification = class
FileName: String;

function Verification: Boolean;

end;

implementation

{ TIniVerification }

function TIniVerification.Verification: Boolean;

begin

result := True;
FileName := 'C:\Users\Auditorio\Documents\Keep Inventory\src\Win32\Debug';
verification := TFile.Exists(FileName);


end;

end.
