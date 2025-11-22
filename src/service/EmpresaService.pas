unit EmpresaService;

interface

uses
EmpresaModel, EmpresaRepository, System.SysUtils, Data.DB;

Type
 TEmpresaService = class
  private
  FRepository: TEmpresaRepository;
  public
  procedure AdicionarEmpresa(AEmpModel: TEmpresaConfig);
  procedure EditarEmpresa(AEmpModel: TEmpresaConfig);
  procedure ExcluirEmpresa(AId: Integer);
  procedure RecuperarEmpresa(AId: Integer);
  function PesquisarEmpresa(const aSearch: String): TDataSet;
  function ListarEmpresa: TDataSet;
  function ListarEmpresaInativas: TDataSet;
  function ContarPrediosPorEmpresa(IdEmpresa: Integer): Integer;
  constructor Create;
  destructor destroy; override;
end;

implementation

{ FEmpresaService }

procedure TEmpresaService.AdicionarEmpresa(AEmpModel: TEmpresaConfig);
begin
 if (AEmpModel.NomeFan = '') then begin
    raise Exception.Create('O campo nome fantasia � obrigatorio');

 end else if (AEmpModel.Razao = '') then begin
     raise Exception.Create('O campo razao social � obrigatorio');
 end else if (AEmpModel.Cnpj = '') then begin
     raise Exception.Create('O campo cnpj � obrigatorio');
 end else if (AEmpModel.Telefone = '') then begin
     raise Exception.Create('O campo telefone � obrigatorio');
 end else if (AEmpModel.Cep = '') then begin
     raise Exception.Create('O campo cep � obrigatorio');
 end else if (AEmpModel.Rua = '') then begin
     raise Exception.Create('O campo rua � obrigatorio');
 end else if IntToStr(AEmpModel.Numero) = '' then begin
     raise Exception.Create('O campo n�mero � obrigatorio');
 end else if (AEmpModel.Bairro = '') then begin
     raise Exception.Create('O campo bairro � obrigatorio');
 end else if (AEmpModel.Cidade = '') then begin
     raise Exception.Create('O campo cidade � obrigatorio');
 end else if (AEmpModel.Estado = '') then begin
     raise Exception.Create('O campo estado � obrigatorio');
 end;

  FRepository.AdicionarEmpresa(AEmpModel)
end;

constructor TEmpresaService.Create;
begin
  FRepository := TEmpresaRepository.Create;
end;

destructor TEmpresaService.destroy;
begin
  FRepository.Free;
  inherited;
end;

procedure TEmpresaService.EditarEmpresa(AEmpModel: TEmpresaConfig);
begin
  FRepository.EditarEmpresa(AEmpModel);
end;

procedure TEmpresaService.ExcluirEmpresa(AId: Integer);
begin
    FRepository.ExcluirEmpresa(AId);
end;

procedure TEmpresaService.RecuperarEmpresa(AId: Integer);
begin
    FRepository.RecuperarEmpresa(AId);
end;

function TEmpresaService.ListarEmpresa: TDataSet;
begin
  Result := FRepository.ListarEmpresa;
end;

function TEmpresaService.ListarEmpresaInativas: TDataSet;
begin
  Result := FRepository.ListarEmpresaInativas;
end;

function TEmpresaService.PesquisarEmpresa(const aSearch: String): TDataSet;
begin
   Result := FRepository.PesquisarEmpresa(aSearch);
end;

function TEmpresaService.ContarPrediosPorEmpresa(IdEmpresa: Integer): Integer;
begin
  Result := FRepository.ContarPrediosPorEmpresa(IdEmpresa);
end;

end.
