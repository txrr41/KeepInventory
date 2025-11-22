unit SalaController;

interface

uses
SalaModel, SalaDTO, SalaService, System.SysUtils, Vcl.StdCtrls, System.Classes, DATA.DB;

type
TSalaController = class
private
  FService: TSalaService;
public
  constructor Create;
  procedure PopularComboBox (AComboBox: TComboBox);
  procedure AdicionarSala (ASalaDTO: TSalaDTO);
  procedure ExcluirSala (AId: Integer);
  procedure RecuperarSala (AId: Integer);
  procedure EditarSala (ASalaDTO: TSalaDTO);
  function PesquisarSala (const aSearch: String): TDataSet;
  function ListarSala: TDataSet;
  function ListarSalasInativas: TDataSet;
  function DtoForModel(ASalaDTO: TSalaDTO): TSalaConfig;
  function ContarPatrimoniosPorSala(IdSala: Integer): Integer;
end;


var
FSalaController: TSalaController;

implementation

{ TSalaController }

constructor TSalaController.Create;
begin
  FService := TSalaService.Create;
end;

procedure TSalaController.AdicionarSala(ASalaDTO: TSalaDTO);
var
SalaModel: TSalaConfig;
begin
   SalaModel := DtoForModel(ASalaDto);
   FService.AdicionarSala(SalaModel);
end;

function TSalaController.DtoForModel(ASalaDTO: TSalaDTO): TSalaConfig;
var
SalaModel: TSalaConfig;
begin

    SalaModel := TSalaConfig.Create;

    SalaModel.Nome := ASalaDTO.FNome;
    SalaModel.Situacao := ASalaDTO.FSituacao;
    SalaModel.IdPredio := ASalaDTO.FIdPredio;
    SalaModel.Tipo := ASalaDTO.FTipo;
    SalaModel.Observacao:= ASalaDTO.FObservacao;
    SalaModel.Id := ASalaDTO.FId;

    Result := SalaModel;
end;
procedure TSalaController.EditarSala(ASalaDTO: TSalaDTO);
var
SalaModel: TSalaConfig;
begin
   SalaModel := DtoForModel(ASalaDto);
   FService.EditarSala(SalaModel);
end;

procedure TSalaController.ExcluirSala(AId: Integer);
begin
FService.ExcluirSala(AId);
end;

procedure TSalaController.RecuperarSala(AId: Integer);
begin
FService.RecuperarSala(AId);
end;

function TSalaController.ListarSala: TDataSet;
begin
 result := FService.ListarSala;
end;

function TSalaController.ListarSalasInativas: TDataSet;
begin
 result := FService.ListarSalasInativas;
end;

function TSalaController.PesquisarSala(const aSearch: String): TDataSet;
begin
 result := FService.PesquisarSala(aSearch);
end;

procedure TSalaController.PopularComboBox(AComboBox: TComboBox);
var
  NomesComIDs: TStringList;
begin

  NomesComIDs := FService.ObterNomesPredios;
  try
    AComboBox.Items.Clear;
    AComboBox.Items.Assign(NomesComIDs);
  finally

    NomesComIDs.Free;
  end;
end;

function TSalaController.ContarPatrimoniosPorSala(IdSala: Integer): Integer;
begin
  Result := FService.ContarPatrimoniosPorSala(IdSala);
end;
end.
