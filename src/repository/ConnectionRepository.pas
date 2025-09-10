unit ConnectionRepository;

interface

uses
  ConnectionModel, System.SysUtils, System.Classes, System.IniFiles;

type
  IConfigRepository = interface
    ['{D1A1E2F3-1234-5678-9ABC-DEF012345678}']
    procedure SaveConfig(const Config: TConnectionConfig);
    function LoadConfig: TConnectionConfig;
  end;

  TIniConfigRepository = class(TInterfacedObject, IConfigRepository)
  private
    FFileName: string;
  public
    constructor Create(const AFileName: string);
    procedure SaveConfig(const Config: TConnectionConfig);
    function LoadConfig: TConnectionConfig;
  end;

implementation

constructor TIniConfigRepository.Create(const AFileName: string);
begin
  inherited Create;
  FFileName := AFileName;
end;

procedure TIniConfigRepository.SaveConfig(const Config: TConnectionConfig);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(FFileName);
  try
    Ini.WriteString('PostgreSQL', 'Server', Config.Server);
    Ini.WriteString('PostgreSQL', 'Port', Config.Port);
    Ini.WriteString('PostgreSQL', 'Database', Config.Database);
    Ini.WriteString('PostgreSQL', 'User', Config.UserName);
    Ini.WriteString('PostgreSQL', 'Password', Config.Password);
  finally
    Ini.Free;
  end;
end;

function TIniConfigRepository.LoadConfig: TConnectionConfig;
var
  Ini: TIniFile;
begin
  Result := TConnectionConfig.Create;
  Ini := TIniFile.Create(FFileName);
  try
    Result.Server := Ini.ReadString('PostgreSQL', 'Server', 'localhost');
    Result.Port := Ini.ReadString('PostgreSQL', 'Port', '5432');
    Result.Database := Ini.ReadString('PostgreSQL', 'Database', '');
    Result.UserName := Ini.ReadString('PostgreSQL', 'User', '');
    Result.Password := Ini.ReadString('PostgreSQL', 'Password', '');
  finally
    Ini.Free;
  end;
end;

end.

