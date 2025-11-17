unit OcorrenciaService;

interface

uses
  System.SysUtils, Data.DB, FireDAC.Comp.Client, Vcl.Dialogs, Vcl.Forms,
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
    Result := 'Selecione um patrim�nio v�lido!'
  else if Trim(DTO.FTipoOcorrencia) = '' then
    Result := 'Selecione o tipo de ocorr�ncia!'
  else if Trim(DTO.FDescricao) = '' then
    Result := 'Descreva o que aconteceu!'
  else if Length(Trim(DTO.FDescricao)) < 10 then
    Result := 'A descri��o deve ter no m�nimo 10 caracteres!';
end;

function TOcorrenciaService.ValidarAvaliacao(DTO: TAvaliacaoOcorrenciaDTO): String;
begin
  Result := '';

  if DTO.FIdOcorrencia <= 0 then
    Result := 'Ocorr�ncia inv�lida!'
  else if DTO.FIdGestor <= 0 then
    Result := 'Gestor inv�lido!'
  else if Trim(DTO.FGravidade) = '' then
    Result := 'Selecione a gravidade!'
  else if DTO.FPercentualDepreciacao < 0 then
    Result := 'Percentual de deprecia��o inv�lido!'
  else if DTO.FPercentualDepreciacao > 100 then
    Result := 'Percentual de deprecia��o n�o pode ser maior que 100%!'
  else if Trim(DTO.FResponsabilidade) = '' then
    Result := 'Selecione a responsabilidade!'
  else if Trim(DTO.FObservacoesGestor) = '' then
    Result := 'Adicione suas observa��es!';
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
    raise Exception.Create('ID da ocorr�ncia inv�lido!');

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
    raise Exception.Create('ID da ocorr�ncia inv�lido!');

  Result := FOcorrenciaRepository.Excluir(Id);
end;

function TOcorrenciaService.AvaliarOcorrencia(DTO: TAvaliacaoOcorrenciaDTO): Boolean;
var
  MsgErro: String;
  IdPatrimonio: Integer;
  PercentualAcumulado: Currency;
  Aviso: String;
begin
  Result := False;

  MsgErro := ValidarAvaliacao(DTO);
  if MsgErro <> '' then
    raise Exception.Create(MsgErro);

  // Obter ID do patrimônio para verificações adicionais
  IdPatrimonio := FOcorrenciaRepository.ObterIdPatrimonioPorOcorrencia(DTO.FIdOcorrencia);

  // Verificar depreciação acumulada atual
  PercentualAcumulado := FOcorrenciaRepository.CalcularDepreciacaoAcumulada(IdPatrimonio);

  // Verificar se está próximo do limite (80% ou mais)
  if (PercentualAcumulado + DTO.FPercentualDepreciacao) >= 80 then
  begin
    if (PercentualAcumulado + DTO.FPercentualDepreciacao) >= 100 then
    begin
      // Ultrapassa 100% - aviso grave
      Aviso := 'ATENÇÃO: Esta ocorrência irá desativar o patrimônio!' + #13#10 +
               'A depreciação acumulada atingirá 100% e o item ficará indisponível.' + #13#10 +
               'Deseja continuar?';

      // Mostrar aviso e permitir cancelar
      if MessageDlg(Aviso, mtWarning, [mbYes, mbNo], 0) = 7 then
        Exit;
    end
    else
    begin
      // Está próximo mas não ultrapassa 100% - aviso informativo
      Aviso := 'AVISO: O patrimônio está chegando ao final de sua vida útil!' + #13#10 +
               'Depreciação acumulada após esta análise: ' +
               FormatFloat('0.00', PercentualAcumulado + DTO.FPercentualDepreciacao) + '%' + #13#10 +
               'Considere programar a substituição em breve.';

      MessageDlg(Aviso, mtInformation, [mbOK], 0);
    end;
  end;

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
    raise Exception.Create('ID do patrim�nio inv�lido!');

  Result := FOcorrenciaRepository.ListarPorPatrimonio(IdPatrimonio);
end;

function TOcorrenciaService.BuscarPorId(Id: Integer): TOcorrenciaModel;
begin
  if Id <= 0 then
    raise Exception.Create('ID da ocorr�ncia inv�lido!');

  Result := FOcorrenciaRepository.BuscarPorId(Id);
end;

end.
