unit PatrimonioController;

interface

uses
PatrimonioModel, PatrimonioDTO, PatrimonioService, System.SysUtils,
Vcl.StdCtrls, System.Classes, DATA.DB, PatrimonioImportacaoCSV;

type
TPatrimonioController = class
private
  FService: TPatrimonioService;
public
  constructor Create;
  procedure PopularComboBox(AComboBox: TComboBox);
  procedure AdicionarPatrimonio(APatrimonioDTO: TPatrimonioDTO);
  procedure ExcluirPatrimonio(AId: Integer);
  procedure RecuperarPatrimonio(AId: Integer);
  procedure EditarPatrimonio(APatrimonioDTO: TPatrimonioDTO);
  function PesquisarPatrimonio(const aSearch: String): TDataSet;
  function ListarPatrimonio: TDataSet;
  function ListarPatrimoniosInativos: TDataSet;
  function DtoForModel(APatrimonioDTO: TPatrimonioDTO): TPatrimonioConfig;

  // Novos m�todos para importa��o CSV
  function ImportarPatrimoniosCSV(const ArquivoCSV: string;
    var TotalImportados, TotalErros: Integer; Erros: TStringList): Boolean;
end;

var
FPatrimonioController: TPatrimonioController;

implementation


{ TPatrimonioController }

constructor TPatrimonioController.Create;
begin
  FService := TPatrimonioService.Create;
end;

procedure TPatrimonioController.AdicionarPatrimonio(APatrimonioDTO: TPatrimonioDTO);
var
  PatrimonioModel: TPatrimonioConfig;
begin
  PatrimonioModel := DtoForModel(APatrimonioDTO);
  FService.AdicionarPatrimonio(PatrimonioModel);

  // Log movido para o Service
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

  // Log movido para o Service
end;

procedure TPatrimonioController.ExcluirPatrimonio(AId: Integer);
begin
  FService.ExcluirPatrimonio(AId);
  // Log movido para o Service
end;

function TPatrimonioController.ListarPatrimonio: TDataSet;
begin
  Result := FService.ListarPatrimonio;
end;

function TPatrimonioController.ListarPatrimoniosInativos: TDataSet;
begin
  Result := FService.ListarPatrimoniosInativos;
end;

function TPatrimonioController.PesquisarPatrimonio(const aSearch: String): TDataSet;
begin
  Result := FService.PesquisarPatrimonio(aSearch);
end;

procedure TPatrimonioController.PopularComboBox(AComboBox: TComboBox);
var
  NomesComIDs: TStringList;
begin
  NomesComIDs := FService.ObterNomesSalas;
  try
    AComboBox.Items.Clear;
    AComboBox.Items.Assign(NomesComIDs);
  finally
    NomesComIDs.Free;
  end;
end;

procedure TPatrimonioController.RecuperarPatrimonio(AId: Integer);
begin
  FService.RecuperarPatrimonio(AId);
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
    // L� e valida o CSV
    if not Importador.LerCSV(ArquivoCSV, Itens) then
    begin
      Erros.AddStrings(Importador.Erros);
      Exit;
    end;

    // Adiciona os erros de valida��o do CSV
    if Importador.Erros.Count > 0 then
    begin
      Erros.AddStrings(Importador.Erros);
      TotalErros := Importador.Erros.Count;
    end;

    // Se houver itens v�lidos, importa para o banco
    if Length(Itens) > 0 then
    begin
      FService.ImportarPatrimonios(Itens, TotalImportados, TotalErros, Erros);
      Result := True;
    end
    else if Erros.Count = 0 then
    begin
      Erros.Add('Nenhum item v�lido encontrado no arquivo CSV');
    end;

  finally
    Importador.Free;
  end;
end;

end.
