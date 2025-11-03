unit OcorrenciaService;

interface

uses
  System.SysUtils, Data.DB, FireDAC.Comp.Client,
  OcorrenciaModel, OcorrenciaDTO, OcorrenciaRepository;

type
  TOcorrenciaService = class
  private
    function ValidarOcorrencia(DTO: TOcorrenciaDTO): String;
    function ValidarAvaliacao(DTO: TAvaliacaoOcorrenciaDTO): String;
    function DtoForModel(DTO: TOcorrenciaDTO): TOcorrenciaModel;
  public
    function RegistrarOcorrencia(DTO: TOcorrenciaDTO): Boolean;
    function EditarOcorrencia(DTO: TOcorrenciaDTO): Boolean;
    function ExcluirOcorrencia(Id: Integer): Boolean;
    function AvaliarOcorrencia(DTO: TAvaliacaoOcorrenciaDTO): Boolean;
    function ListarTodas: TFDQuery;
    function ListarPendentes: TFDQuery;
    function ListarPorPatrimonio(IdPatrimonio: Integer): TFDQuery;
    function BuscarPorId(Id: Integer): TOcorrenciaModel;
  end;

var
  FOcorrenciaService: TOcorrenciaService;

implementation

function TOcorrenciaService.ValidarOcorrencia(DTO: TOcorrenciaDTO): String;
begin
  Result := '';

  if DTO.FIdPatrimonio <= 0 then
    Result := 'Selecione um patrimônio válido!'
  else if Trim(DTO.FTipoOcorrencia) = '' then
    Result := 'Selecione o tipo de ocorrência!'
  else if Trim(DTO.FDescricao) = '' then
    Result := 'Descreva o que aconteceu!'
  else if Length(Trim(DTO.FDescricao)) < 10 then
    Result := 'A descrição deve ter no mínimo 10 caracteres!';
end;

function TOcorrenciaService.ValidarAvaliacao(DTO: TAvaliacaoOcorrenciaDTO): String;
begin
  Result := '';

  if DTO.FIdOcorrencia <= 0 then
    Result := 'Ocorrência inválida!'
  else if DTO.FIdGestor <= 0 then
    Result := 'Gestor inválido!'
  else if Trim(DTO.FGravidade) = '' then
    Result := 'Selecione a gravidade!'
  else if DTO.FPercentualDepreciacao < 0 then
    Result := 'Percentual de depreciação inválido!'
  else if DTO.FPercentualDepreciacao > 100 then
    Result := 'Percentual de depreciação não pode ser maior que 100%!'
  else if Trim(DTO.FResponsabilidade) = '' then
    Result := 'Selecione a responsabilidade!'
  else if Trim(DTO.FObservacoesGestor) = '' then
    Result := 'Adicione suas observações!';
end;

function TOcorrenciaService.DtoForModel(DTO: TOcorrenciaDTO): TOcorrenciaModel;
var
  Model: TOcorrenciaModel;
begin
  Model := TOcorrenciaModel.Create;

  Model.Id := DTO.FId;
  Model.IdPatrimonio := DTO.FIdPatrimonio;
  Model.IdUsuarioRelator := DTO.FIdUsuarioRelator;
  Model.TipoOcorrencia := DTO.FTipoOcorrencia;
  Model.Descricao := DTO.FDescricao;
  Model.DataOcorrencia := DTO.FDataOcorrencia;
  Model.Status := 'PENDENTE';
  Model.FotoAnexo := DTO.FFotoAnexo;

  Result := Model;
end;

function TOcorrenciaService.RegistrarOcorrencia(DTO: TOcorrenciaDTO): Boolean;
var
  Ocorrencia: TOcorrenciaModel;
  MsgErro: String;
begin
  Result := False;

  MsgErro := ValidarOcorrencia(DTO);
  if MsgErro <> '' then
    raise Exception.Create(MsgErro);

  Ocorrencia := DtoForModel(DTO);
  try
    Result := FOcorrenciaRepository.Inserir(Ocorrencia);
  finally
    Ocorrencia.Free;
  end;
end;

function TOcorrenciaService.EditarOcorrencia(DTO: TOcorrenciaDTO): Boolean;
var
  Ocorrencia: TOcorrenciaModel;
  MsgErro: String;
begin
  Result := False;

  if DTO.FId <= 0 then
    raise Exception.Create('ID da ocorrência inválido!');

  MsgErro := ValidarOcorrencia(DTO);
  if MsgErro <> '' then
    raise Exception.Create(MsgErro);

  Ocorrencia := DtoForModel(DTO);
  try
    Result := FOcorrenciaRepository.Atualizar(Ocorrencia);
  finally
    Ocorrencia.Free;
  end;
end;

function TOcorrenciaService.ExcluirOcorrencia(Id: Integer): Boolean;
begin
  if Id <= 0 then
    raise Exception.Create('ID da ocorrência inválido!');

  Result := FOcorrenciaRepository.Excluir(Id);
end;

function TOcorrenciaService.AvaliarOcorrencia(DTO: TAvaliacaoOcorrenciaDTO): Boolean;
var
  MsgErro: String;
begin
  Result := False;

  MsgErro := ValidarAvaliacao(DTO);
  if MsgErro <> '' then
    raise Exception.Create(MsgErro);

  Result := FOcorrenciaRepository.AvaliarOcorrencia(
    DTO.FIdOcorrencia,
    DTO.FIdGestor,
    DTO.FGravidade,
    DTO.FResponsabilidade,
    DTO.FPercentualDepreciacao,
    DTO.FRequerManutencao,
    DTO.FCustoEstimadoReparo,
    DTO.FObservacoesGestor
  );
end;

function TOcorrenciaService.ListarTodas: TFDQuery;
begin
  Result := FOcorrenciaRepository.ListarTodas;
end;

function TOcorrenciaService.ListarPendentes: TFDQuery;
begin
  Result := FOcorrenciaRepository.ListarPendentes;
end;

function TOcorrenciaService.ListarPorPatrimonio(IdPatrimonio: Integer): TFDQuery;
begin
  if IdPatrimonio <= 0 then
    raise Exception.Create('ID do patrimônio inválido!');

  Result := FOcorrenciaRepository.ListarPorPatrimonio(IdPatrimonio);
end;

function TOcorrenciaService.BuscarPorId(Id: Integer): TOcorrenciaModel;
begin
  if Id <= 0 then
    raise Exception.Create('ID da ocorrência inválido!');

  Result := FOcorrenciaRepository.BuscarPorId(Id);
end;

end.
