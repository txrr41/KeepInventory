unit PatrimonioController;

interface

uses
PatrimonioModel, PatrimonioDTO, PatrimonioService, System.SysUtils,
Vcl.StdCtrls, System.Classes, DATA.DB, PatrimonioImportacaoCSV;

type
TPatrimonioController = class
public
  procedure PopularComboBox(AComboBox: TComboBox);
  procedure AdicionarPatrimonio(APatrimonioDTO: TPatrimonioDTO);
  procedure ExcluirPatrimonio(AId: Integer);
  procedure EditarPatrimonio(APatrimonioDTO: TPatrimonioDTO);
  function PesquisarPatrimonio(const aSearch: String): TDataSet;
  function ListarPatrimonio: TDataSet;
  function DtoForModel(APatrimonioDTO: TPatrimonioDTO): TPatrimonioConfig;

  // Novos métodos para importação CSV
  function ImportarPatrimoniosCSV(const ArquivoCSV: string;
    var TotalImportados, TotalErros: Integer; Erros: TStringList): Boolean;
end;

var
FPatrimonioController: TPatrimonioController;

implementation


{ TPatrimonioController }

procedure TPatrimonioController.AdicionarPatrimonio(APatrimonioDTO: TPatrimonioDTO);
var
  PatrimonioModel: TPatrimonioConfig;
begin
  PatrimonioModel := DtoForModel(APatrimonioDTO);
  FPatrimonioService.AdicionarPatrimonio(PatrimonioModel);
end;

function TPatrimonioController.DtoForModel(APatrimonioDTO: TPatrimonioDTO): TPatrimonioConfig;
var
  PatrimonioModel: TPatrimonioConfig;
begin
  PatrimonioModel := TPatrimonioConfig.Create;

  PatrimonioModel.Nome := APatrimonioDTO.FNome;
  PatrimonioModel.Tipo := APatrimonioDTO.FTipo;
  PatrimonioModel.Situacao := APatrimonioDTO.FSituacao;
  PatrimonioModel.Modelo := APatrimonioDTO.FModelo;
  PatrimonioModel.ValorAquisicao := APatrimonioDTO.FValorAquisicao;
  PatrimonioModel.ValorAtual := APatrimonioDTO.FValorAtual;
  PatrimonioModel.Quantidade := APatrimonioDTO.FQuantidade;
  PatrimonioModel.DataAquisicao := APatrimonioDTO.FDataAquisicao;
  PatrimonioModel.NumeroSerie := APatrimonioDTO.FNumeroSerie;
  PatrimonioModel.IdSala := APatrimonioDTO.FIdSala;
  PatrimonioModel.Id := APatrimonioDTO.FId;

  Result := PatrimonioModel;
end;

procedure TPatrimonioController.EditarPatrimonio(APatrimonioDTO: TPatrimonioDTO);
var
  PatrimonioModel: TPatrimonioConfig;
begin
  PatrimonioModel := DtoForModel(APatrimonioDTO);
  FPatrimonioService.EditarPatrimonio(PatrimonioModel);
end;

procedure TPatrimonioController.ExcluirPatrimonio(AId: Integer);
begin
  FPatrimonioService.ExcluirPatrimonio(AId);
end;

function TPatrimonioController.ListarPatrimonio: TDataSet;
begin
  Result := FPatrimonioService.ListarPatrimonio;
end;

function TPatrimonioController.PesquisarPatrimonio(const aSearch: String): TDataSet;
begin
  Result := FPatrimonioService.PesquisarPatrimonio(aSearch);
end;

procedure TPatrimonioController.PopularComboBox(AComboBox: TComboBox);
var
  NomesComIDs: TStringList;
begin
  NomesComIDs := FPatrimonioService.ObterNomesSalas;
  try
    AComboBox.Items.Clear;
    AComboBox.Items.Assign(NomesComIDs);
  finally
    NomesComIDs.Free;
  end;
end;

function TPatrimonioController.ImportarPatrimoniosCSV(const ArquivoCSV: string;
  var TotalImportados, TotalErros: Integer; Erros: TStringList): Boolean;
var
  Importador: TPatrimonioImportacaoCSV;
  Itens: TArray<TPatrimonioDTO>;
begin
  Result := False;
  TotalImportados := 0;
  TotalErros := 0;

  Importador := TPatrimonioImportacaoCSV.Create;
  try
    // Lê e valida o CSV
    if not Importador.LerCSV(ArquivoCSV, Itens) then
    begin
      Erros.AddStrings(Importador.Erros);
      Exit;
    end;

    // Adiciona os erros de validação do CSV
    if Importador.Erros.Count > 0 then
    begin
      Erros.AddStrings(Importador.Erros);
      TotalErros := Importador.Erros.Count;
    end;

    // Se houver itens válidos, importa para o banco
    if Length(Itens) > 0 then
    begin
      FPatrimonioService.ImportarPatrimonios(Itens, TotalImportados, TotalErros, Erros);
      Result := True;
    end
    else if Erros.Count = 0 then
    begin
      Erros.Add('Nenhum item válido encontrado no arquivo CSV');
    end;

  finally
    Importador.Free;
  end;
end;

end.
