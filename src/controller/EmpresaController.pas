unit EmpresaController;

interface

uses
EmpresaModel, EmpresaDto, EmpresaService;

type
TEmpresaController = class
  private
  FService: TEmpresaService;
  function DtoForModel(AEmpresaDTO: TEmpresaDTO): TEmpresaConfig;
  public
  procedure AdicionarEmpresa (AEmpresaDTO: TEmpresaDTO);
  constructor Create;
  destructor destroy; override;
  procedure EditarEmpresa (AEmpresaDTO: TEmpresaDTO);

end;


implementation

{ TEmpresaController }

procedure TEmpresaController.AdicionarEmpresa(AEmpresaDTO: TEmpresaDTO);
var
EmpModel: TEmpresaConfig;
begin
EmpModel := DtoForModel(AEmpresaDTO);
FService.AdicionarEmpresa(EmpModel);

end;

constructor TEmpresaController.Create;
begin
FService := TEmpresaService.Create;
end;

destructor TEmpresaController.destroy;
begin
  FService.Free;
  inherited;
end;

function TEmpresaController.DtoForModel(AEmpresaDTO: TEmpresaDTO): TEmpresaConfig;
var
EmpModel: TEmpresaConfig;
begin
   EmpModel := TEmpresaConfig.Create;

    EmpModel.NomeFan := AEmpresaDTO.FNomeFan;
    EmpModel.Razao := AEmpresaDTO.FRazao;
    EmpModel.Cnpj := AEmpresaDTO.FCnpj;
    EmpModel.Telefone := AEmpresaDTO.FTelefone;
    EmpModel.Cep := AEmpresaDTO.FCep;
    EmpModel.Rua:= AEmpresaDTO.FRua;
    EmpModel.Numero := AEmpresaDTO.FNumero;
    EmpModel.Cidade := AEmpresaDTO.FCidade;
    EmpModel.Bairro := AEmpresaDTO.FBairro;
    EmpModel.Estado := AEmpresaDTO.FBairro;

    Result := EmpModel;
end;

procedure TEmpresaController.EditarEmpresa(AEmpresaDTO: TEmpresaDTO);
var
EmpModel: TEmpresaConfig;
begin
EmpModel := DtoForModel(AEmpresaDTO);
FService.EditarEmpresa(EmpModel);
end;

end.
