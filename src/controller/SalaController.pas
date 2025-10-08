unit SalaController;

interface

uses
SalaModel, SalaDTO, SalaService, System.SysUtils, Vcl.StdCtrls, System.Classes, DATA.DB;

type
TSalaController = class
public
procedure PopularComboBox (AComboBox: TComboBox);
procedure AdicionarSala (ASalaDTO: TSalaDTO);
procedure ExcluirSala (AId: Integer);
function ListarSala: TDataSet;
function DtoForModel(ASalaDTO: TSalaDTO): TSalaConfig;
end;


var
FSalaController: TSalaController;

implementation

{ TSalaController }

procedure TSalaController.AdicionarSala(ASalaDTO: TSalaDTO);
var
SalaModel: TSalaConfig;
begin
   SalaModel := DtoForModel(ASalaDto);
   FSalaService.AdicionarSala(SalaModel);
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
procedure TSalaController.ExcluirSala(AId: Integer);
begin
FSalaService.ExcluirSala(AId);
end;

function TSalaController.ListarSala: TDataSet;
begin
 result := FSalaService.ListarSala;
end;

procedure TSalaController.PopularComboBox(AComboBox: TComboBox);
var
  NomesComIDs: TStringList;
begin

  NomesComIDs := FSalaService.ObterNomesPredios;
  try
    AComboBox.Items.Clear;
    AComboBox.Items.Assign(NomesComIDs);
  finally

    NomesComIDs.Free;
  end;
end;
end.
