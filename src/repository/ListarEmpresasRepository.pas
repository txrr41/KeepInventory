unit ListarEmpresasRepository;

interface

uses
Data.DB, FireDAC.Comp.Client, DB;

type
TListEmpRepository = class

Function ListarEmpresa: TDataSet;
end;

implementation

{ TListEmp }

function TListEmpRepository.ListarEmpresa: TDataSet;
var
Q: TFDQuery;
begin
 Q := TFDQuery.Create(nil);
 Q.Connection := DataModule2.FDConnection;
 Q.SQL.Text := 'SELECT * FROM empresas';
 Q.Open;
 Result := Q;
end;

end.
