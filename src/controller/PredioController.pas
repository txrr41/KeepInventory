unit PredioController;

interface

uses
PredioDto, PredioModel, PredioService, Data.DB;

type
TPredioController = class
private

public
  procedure AdicionarPredio (APredioDTO: GPredioDTO);
  procedure EditarPredio (APredioDTO: GPredioDTO);
  procedure ExcluirPredio (AId: Integer);
  function DtoForModel(APredioDTO: GPredioDTO): TPredioConfig;
  function ListarPredio: TDataSet;
  destructor destroy; override;
end;

var
ControllerPredio: TPredioController;

implementation


{ TPredioController }

procedure TPredioController.AdicionarPredio(APredioDTO: GPredioDTO);
var
PrModel: TPredioConfig;
begin
  PrModel := DtoForModel(APredioDTO);
  PService.AdicionarPredio(PrModel);
end;


destructor TPredioController.destroy;
begin

  PService.Free;
  inherited;

end;

function TPredioController.DtoForModel(APredioDTO: GPredioDTO): TPredioConfig;
var
PrModel: TPredioConfig;
begin
   PrModel := TPredioConfig.Create;

    PrModel.Nome := APredioDTO.FNome;
    PrModel.Situacao := APredioDTO.FSituacao;
    PrModel.Telefone := APredioDTO.FTelefone;
    PrModel.Cep := APredioDTO.FCep;
    PrModel.Rua:= APredioDTO.FRua;
    PrModel.Numero := APredioDTO.FNumero;
    PrModel.Cidade := APredioDTO.FCidade;
    PrModel.Bairro := APredioDTO.FBairro;
    PrModel.Estado := APredioDTO.FEstado;
    PrModel.Id := APredioDTO.FId;

    Result := PrModel;
end;

procedure TPredioController.EditarPredio(APredioDTO: GPredioDTO);
var
PrModel: TPredioConfig;
begin
   PrModel := DtoForModel(APredioDTO);
   PService.EditarPredio(PrModel);
end;

procedure TPredioController.ExcluirPredio(AId: Integer);
begin
PService.ExcluirPredio(AId)
end;

function TPredioController.ListarPredio: TDataSet;
begin
Result := PService.ListarPredio
end;

end.
