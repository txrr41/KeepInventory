unit ListarEmpresasController;

interface

uses
Data.DB, ListarEmpresaService;

Type
TListEmpController = class
  private
  FService: TListEmpService;
  public
  Constructor Create;
  function ListarEmpresas: TDataSet;
end;

implementation

{ TListEmp }

constructor TListEmpController.Create;
begin
    FService := TListEmpService.Create;
end;

function TListEmpController.ListarEmpresas: TDataSet;
begin
     Result := FService.ListarEmpresas;
end;

end.
