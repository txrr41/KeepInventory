unit ListarEmpresaService;

interface

uses
Data.DB, ListarEmpresasRepository;

type
TListEmpService = class
  private
  FRepository: TListEmpRepository;
  public
  function ListarEmpresas: TDataSet;
  constructor Create;
end;

implementation

{ TListEmpService }

constructor TListEmpService.Create;
begin
   FRepository := TListEmpRepository.Create;
end;

function TListEmpService.ListarEmpresas: TDataSet;
begin
 Result := FRepository.ListarEmpresa;
end;

end.
