unit SalaController;

interface

uses
SalaModel, SalaDTO, SalaService, System.SysUtils, Vcl.StdCtrls, System.Classes;

type
TSalaController = class
public
procedure PopularComboBox (AComboBox: TComboBox);
procedure AdicionarSala (ASalaDTO: TSalaDTO);
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
    SalaModel.Predio := ASalaDTO.FPredio;
    SalaModel.Situacao := ASalaDTO.FObservacao;
    SalaModel.Observacao:= ASalaDTO.FObservacao;
    SalaModel.Id := ASalaDTO.FId;

    Result := SalaModel;
end;
procedure TSalaController.PopularComboBox(AComboBox: TComboBox);
var
  Nomes: TStringList;
begin
  Nomes := FSalaService.ObterNomesPredios;
  try
    AComboBox.Items.Clear;
    AComboBox.Items.AddStrings(Nomes);
  finally
    Nomes.Free;
  end;
end;

end.
