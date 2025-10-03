unit EmpresaService;

interface

uses
EmpresaModel, EmpresaRepository, System.SysUtils;

Type
 TEmpresaService = class
  private
  FRepository: TEmpresaRepository;
  public
  procedure AdicionarEmpresa(AEmpModel: TEmpresaConfig);
  procedure EditarEmpresa(AEmpModel: TEmpresaConfig);
  procedure ExcluirEmpresa(AId: Integer);
  constructor Create;
  destructor destroy; override;
end;

implementation

{ FEmpresaService }

procedure TEmpresaService.AdicionarEmpresa(AEmpModel: TEmpresaConfig);
begin
 if (AEmpModel.NomeFan = '') then begin
    raise Exception.Create('O campo nome fantasia é obrigatorio');

 end else if (AEmpModel.Razao = '') then begin
     raise Exception.Create('O campo razao social é obrigatorio');
 end else if (AEmpModel.Cnpj = '') then begin
     raise Exception.Create('O campo cnpj é obrigatorio');
 end else if (AEmpModel.Telefone = '') then begin
     raise Exception.Create('O campo telefone é obrigatorio');
 end else if (AEmpModel.Cep = '') then begin
     raise Exception.Create('O campo cep é obrigatorio');
 end else if (AEmpModel.Rua = '') then begin
     raise Exception.Create('O campo rua é obrigatorio');
 end else if IntToStr(AEmpModel.Numero) = '' then begin
     raise Exception.Create('O campo número é obrigatorio');
 end else if (AEmpModel.Bairro = '') then begin
     raise Exception.Create('O campo bairro é obrigatorio');
 end else if (AEmpModel.Cidade = '') then begin
     raise Exception.Create('O campo cidade é obrigatorio');
 end else if (AEmpModel.Estado = '') then begin
     raise Exception.Create('O campo estado é obrigatorio');
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

end.
