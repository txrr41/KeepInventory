unit PredioController;

interface

uses
PredioDto, PredioModel, PredioService;

type
TPredioController = class
private
FService: TPredioService;
public
  procedure AdicionarPredio (APredioDTO: GPredioDTO);
  function DtoForModel(APredioDTO: GPredioDTO): TPredioConfig;
  constructor Create;
end;

implementation

{ TPredioController }

procedure TPredioController.AdicionarPredio(APredioDTO: GPredioDTO);
var
PrModel: TPredioConfig;
begin
  PrModel := DtoForModel(APredioDTO);
  FService.AdicionarPredio(PrModel);
end;

constructor TPredioController.Create;
begin
    FService := TPredioService.Create;

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

end.
