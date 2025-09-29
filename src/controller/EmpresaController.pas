unit EmpresaController;

interface

uses
EmpresaModel, EmpresaDto, EmpresaService;

type
TEmpresaController = class
  private
  FService: TEmpresaService;
  public
  procedure AdicionarEmpresa (AEmpresaDTO: TEmpresaDTO);
  constructor Create;
  destructor destroy; override;
end;


implementation

{ TEmpresaController }

procedure TEmpresaController.AdicionarEmpresa(AEmpresaDTO: TEmpresaDTO);
var
EmpModel: TEmpresaConfig;
begin
   EmpModel := TEmpresaConfig.Create;
   try
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

    FService.AdicionarEmpresa(EmpModel);
   finally
    EmpModel.Free;
   end;
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

end.
