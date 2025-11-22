unit PredioController;

interface

uses
PredioDto, PredioModel, PredioService, Data.DB;

type
TPredioController = class
private
  FService: TPredioService;

public
  constructor Create;
  procedure AdicionarPredio (APredioDTO: GPredioDTO);
  procedure EditarPredio (APredioDTO: GPredioDTO);
  procedure ExcluirPredio (AId: Integer);
  procedure RecuperarPredio (AId: Integer);
  function PesquisarPredio (const aSearch: String): TDataSet;
  function DtoForModel(APredioDTO: GPredioDTO): TPredioConfig;
  function ListarPredio: TDataSet;
  function ListarPredioInativos: TDataSet;
  function ContarSalasPorPredio(IdPredio: Integer): Integer;
  function ContarPatrimoniosPorPredio(IdPredio: Integer): Integer;
  destructor destroy; override;
end;

var
ControllerPredio: TPredioController;

implementation


{ TPredioController }

constructor TPredioController.Create;
begin
  FService := TPredioService.Create;
end;

procedure TPredioController.AdicionarPredio(APredioDTO: GPredioDTO);
var
PrModel: TPredioConfig;
begin
  PrModel := DtoForModel(APredioDTO);
  FService.AdicionarPredio(PrModel);
end;


destructor TPredioController.destroy;
begin
  FService.Free;
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
   FService.EditarPredio(PrModel);
end;

procedure TPredioController.ExcluirPredio(AId: Integer);
begin
FService.ExcluirPredio(AId);
end;

procedure TPredioController.RecuperarPredio(AId: Integer);
begin
FService.RecuperarPredio(AId);
end;


function TPredioController.ListarPredio: TDataSet;
begin
Result := FService.ListarPredio;
end;

function TPredioController.ListarPredioInativos: TDataSet;
begin
Result := FService.ListarPredioInativos;
end;

function TPredioController.PesquisarPredio(const aSearch: String): TDataSet;
begin
    result := FService.PesquisarPredio(aSearch);
end;

function TPredioController.ContarSalasPorPredio(IdPredio: Integer): Integer;
begin
  Result := FService.ContarSalasPorPredio(IdPredio);
end;

function TPredioController.ContarPatrimoniosPorPredio(IdPredio: Integer): Integer;
begin
  Result := FService.ContarPatrimoniosPorPredio(IdPredio);
end;

end.
