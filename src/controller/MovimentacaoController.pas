unit MovimentacaoController;

interface

uses
  MovimentacaoModel, MovimentacaoDTO, MovimentacaoService, System.SysUtils,
  Vcl.StdCtrls, System.Classes, Data.DB;

type
  TMovimentacaoController = class
  public
    procedure PopularComboBoxPatrimonios(AComboBox: TComboBox);
    procedure PopularComboBoxSalas(AComboBox: TComboBox);
    procedure AdicionarMovimentacao(AMovimentacaoDTO: TMovimentacaoDTO);
    procedure ExcluirMovimentacao(AId: Integer);
    procedure EditarMovimentacao(AMovimentacaoDTO: TMovimentacaoDTO);
    function PesquisarMovimentacao(const aSearch: String): TDataSet;
    function ListarMovimentacoes: TDataSet;
    function DtoForModel(AMovimentacaoDTO: TMovimentacaoDTO): TMovimentacaoConfig;
    procedure PopularComboBoxSalasDoPatrimonio(AComboBox: TComboBox; AIdPatrimonio: Integer);
  end;

var
  FMovimentacaoController: TMovimentacaoController;

implementation

{ TMovimentacaoController }

procedure TMovimentacaoController.AdicionarMovimentacao(
  AMovimentacaoDTO: TMovimentacaoDTO);
var
  MovimentacaoModel: TMovimentacaoConfig;
begin
  MovimentacaoModel := DtoForModel(AMovimentacaoDTO);
  try
    FMovimentacaoService.AdicionarMovimentacao(MovimentacaoModel);
  finally
    MovimentacaoModel.Free;
  end;
end;

function TMovimentacaoController.DtoForModel(
  AMovimentacaoDTO: TMovimentacaoDTO): TMovimentacaoConfig;
var
  MovimentacaoModel: TMovimentacaoConfig;
begin
  MovimentacaoModel := TMovimentacaoConfig.Create;

  MovimentacaoModel.Id := AMovimentacaoDTO.FId;
  MovimentacaoModel.IdPatrimonio := AMovimentacaoDTO.FIdPatrimonio;
  MovimentacaoModel.IdOrigem := AMovimentacaoDTO.FIdOrigem;
  MovimentacaoModel.IdDestino := AMovimentacaoDTO.FIdDestino;
  MovimentacaoModel.Quantidade := AMovimentacaoDTO.FQuantidade;
  MovimentacaoModel.Status := AMovimentacaoDTO.FStatus;
  MovimentacaoModel.IdUsuario := AMovimentacaoDTO.FIdUsuario;
  MovimentacaoModel.DataMovimentacao := AMovimentacaoDTO.FDataMovimentacao;

  Result := MovimentacaoModel;
end;

procedure TMovimentacaoController.EditarMovimentacao(
  AMovimentacaoDTO: TMovimentacaoDTO);
var
  MovimentacaoModel: TMovimentacaoConfig;
begin
  MovimentacaoModel := DtoForModel(AMovimentacaoDTO);
  try
    FMovimentacaoService.EditarMovimentacao(MovimentacaoModel);
  finally
    MovimentacaoModel.Free;
  end;
end;

procedure TMovimentacaoController.ExcluirMovimentacao(AId: Integer);
begin
  FMovimentacaoService.ExcluirMovimentacao(AId);
end;

function TMovimentacaoController.ListarMovimentacoes: TDataSet;
begin
  Result := FMovimentacaoService.ListarMovimentacoes;
end;

function TMovimentacaoController.PesquisarMovimentacao(
  const aSearch: String): TDataSet;
begin
  Result := FMovimentacaoService.PesquisarMovimentacao(aSearch);
end;

procedure TMovimentacaoController.PopularComboBoxPatrimonios(
  AComboBox: TComboBox);
var
  NomesComIDs: TStringList;
begin
  NomesComIDs := FMovimentacaoService.ObterNomesPatrimonios;
  try
    AComboBox.Items.Clear;
    AComboBox.Items.Assign(NomesComIDs);
  finally
    NomesComIDs.Free;
  end;
end;

procedure TMovimentacaoController.PopularComboBoxSalas(AComboBox: TComboBox);
var
  NomesComIDs: TStringList;
begin
  NomesComIDs := FMovimentacaoService.ObterNomesSalas;
  try
    AComboBox.Items.Clear;
    AComboBox.Items.Assign(NomesComIDs);
  finally
    NomesComIDs.Free;
  end;
end;

procedure TMovimentacaoController.PopularComboBoxSalasDoPatrimonio(
  AComboBox: TComboBox; AIdPatrimonio: Integer);
var
  NomesComIDs: TStringList;
begin
  NomesComIDs := FMovimentacaoService.ObterSalasDoPatrimonio(AIdPatrimonio);
  try
    AComboBox.Items.Clear;
    AComboBox.Items.Assign(NomesComIDs);

    if AComboBox.Items.Count > 0 then
      AComboBox.ItemIndex := 0;
  finally
    NomesComIDs.Free;
  end;
end;

end.
