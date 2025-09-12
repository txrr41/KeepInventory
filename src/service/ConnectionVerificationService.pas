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
  FFileName := TPath.Combine(ExtractFilePath(ParamStr(0)), 'conexao.ini');
end;

function TIniVerification.Verification: Boolean;
begin
  Result := TFile.Exists(FFileName);
end;

end.

