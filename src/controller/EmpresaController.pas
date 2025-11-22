unit EmpresaController;

interface

uses
EmpresaModel, EmpresaDto, EmpresaService, Data.DB;

type
TEmpresaController = class
  private
  FService: TEmpresaService;

  public
  procedure AdicionarEmpresa (AEmpresaDTO: TEmpresaDTO);
  constructor Create;
  destructor destroy; override;
  procedure EditarEmpresa (AEmpresaDTO: TEmpresaDTO);
  function DtoForModel(AEmpresaDTO: TEmpresaDTO): TEmpresaConfig;
  procedure ExcluirEmpresa(AId: Integer);
  procedure RecuperarEmpresa(AId: Integer);
  function PesquisarEmpresa (const aSearch: String): TDataSet;
  function ListarEmpresa: TDataSet;
  function ListarEmpresaInativas: TDataSet;
  function ContarPrediosPorEmpresa(IdEmpresa: Integer): Integer;
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
    EmpModel.Estado := AEmpresaDTO.FEstado;
    EmpModel.Id := AEmpresaDTO.FId;


    Result := EmpModel;
end;

procedure TEmpresaController.EditarEmpresa(AEmpresaDTO: TEmpresaDTO);
var
EmpModel: TEmpresaConfig;
begin
  EmpModel := DtoForModel(AEmpresaDTO);
  FService.EditarEmpresa(EmpModel);
end;

procedure TEmpresaController.ExcluirEmpresa(AId: Integer);
begin
   FService.ExcluirEmpresa(AId);
end;

procedure TEmpresaController.RecuperarEmpresa(AId: Integer);
begin
   FService.RecuperarEmpresa(AId);
end;

function TEmpresaController.ListarEmpresa: TDataSet;
begin
 Result := FService.ListarEmpresa;
end;

function TEmpresaController.ListarEmpresaInativas: TDataSet;
begin
 Result := FService.ListarEmpresaInativas;
end;

function TEmpresaController.PesquisarEmpresa(const aSearch: String): TDataSet;
begin
Result := FService.PesquisarEmpresa(aSearch);
end;

function TEmpresaController.ContarPrediosPorEmpresa(IdEmpresa: Integer): Integer;
begin
  Result := FService.ContarPrediosPorEmpresa(IdEmpresa);
end;

end.
