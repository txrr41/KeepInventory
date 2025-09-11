unit ConnectionVerificationService;

interface

uses
  System.SysUtils, System.IOUtils;

type
  TIniVerification = class
  private
    FFileName: string;
  public
    constructor Create;
    function Verification: Boolean;
    property FileName: string read FFileName;
  end;

implementation

{ TIniVerification }

constructor TIniVerification.Create;
begin
  // Caminho completo do arquivo INI
  FFileName := ExtractFilePath(ParamStr(0)) + 'config.ini';
end;

function TIniVerification.Verification: Boolean;
begin
  Result := TFile.Exists(FFileName);
end;

end.

