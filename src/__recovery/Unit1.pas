unit Unit1;

interface

uses
System.IOUtils, LoginView, ConnectionView;

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

if  Verification = False then begin
 FormConnection.ShowModal;

end;



end;

end.
