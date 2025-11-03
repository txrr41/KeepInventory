unit OcorrenciaController;

interface

uses
  System.SysUtils, Data.DB, FireDAC.Comp.Client, Vcl.StdCtrls,
  OcorrenciaService, OcorrenciaDTO, OcorrenciaModel;

type
  TOcorrenciaController = class
  public
    function RegistrarOcorrencia(DTO: TOcorrenciaDTO): Boolean;
    function EditarOcorrencia(DTO: TOcorrenciaDTO): Boolean;
    function ExcluirOcorrencia(Id: Integer): Boolean;
    function AvaliarOcorrencia(DTO: TAvaliacaoOcorrenciaDTO): Boolean;
    function ListarTodas: TFDQuery;
    function ListarPendentes: TFDQuery;
    function ListarPorPatrimonio(IdPatrimonio: Integer): TFDQuery;
    function BuscarPorId(Id: Integer): TOcorrenciaModel;
    procedure PopularComboBoxPatrimonios(ComboBox: TComboBox);
    procedure PopularComboBoxTipos(ComboBox: TComboBox);
    procedure PopularComboBoxGravidade(ComboBox: TComboBox);
    procedure PopularComboBoxResponsabilidade(ComboBox: TComboBox);
  end;

var
  FOcorrenciaController: TOcorrenciaController;

implementation

uses
  OcorrenciaRepository;

function TOcorrenciaController.RegistrarOcorrencia(DTO: TOcorrenciaDTO): Boolean;
begin
  try
    Result := FOcorrenciaService.RegistrarOcorrencia(DTO);
  except
    on E: Exception do
      raise Exception.Create('Erro ao registrar ocorrência: ' + E.Message);
  end;
end;

function TOcorrenciaController.EditarOcorrencia(DTO: TOcorrenciaDTO): Boolean;
begin
  try
    Result := FOcorrenciaService.EditarOcorrencia(DTO);
  except
    on E: Exception do
      raise Exception.Create('Erro ao editar ocorrência: ' + E.Message);
  end;
end;

function TOcorrenciaController.ExcluirOcorrencia(Id: Integer): Boolean;
begin
  try
    Result := FOcorrenciaService.ExcluirOcorrencia(Id);
  except
    on E: Exception do
      raise Exception.Create('Erro ao excluir ocorrência: ' + E.Message);
  end;
end;

function TOcorrenciaController.AvaliarOcorrencia(DTO: TAvaliacaoOcorrenciaDTO): Boolean;
begin
  try
    Result := FOcorrenciaService.AvaliarOcorrencia(DTO);
  except
    on E: Exception do
      raise Exception.Create('Erro ao avaliar ocorrência: ' + E.Message);
  end;
end;

function TOcorrenciaController.ListarTodas: TFDQuery;
begin
  try
    Result := FOcorrenciaService.ListarTodas;
  except
    on E: Exception do
      raise Exception.Create('Erro ao listar ocorrências: ' + E.Message);
  end;
end;

function TOcorrenciaController.ListarPendentes: TFDQuery;
begin
  try
    Result := FOcorrenciaService.ListarPendentes;
  except
    on E: Exception do
      raise Exception.Create('Erro ao listar ocorrências pendentes: ' + E.Message);
  end;
end;

function TOcorrenciaController.ListarPorPatrimonio(IdPatrimonio: Integer): TFDQuery;
begin
  try
    Result := FOcorrenciaService.ListarPorPatrimonio(IdPatrimonio);
  except
    on E: Exception do
      raise Exception.Create('Erro ao listar ocorrências do patrimônio: ' + E.Message);
  end;
end;

function TOcorrenciaController.BuscarPorId(Id: Integer): TOcorrenciaModel;
begin
  try
    Result := FOcorrenciaService.BuscarPorId(Id);
  except
    on E: Exception do
      raise Exception.Create('Erro ao buscar ocorrência: ' + E.Message);
  end;
end;

procedure TOcorrenciaController.PopularComboBoxPatrimonios(ComboBox: TComboBox);
begin
  try
    FOcorrenciaRepository.PopularComboBoxPatrimonios(ComboBox);
  except
    on E: Exception do
      raise Exception.Create('Erro ao popular patrimônios: ' + E.Message);
  end;
end;

procedure TOcorrenciaController.PopularComboBoxTipos(ComboBox: TComboBox);
begin
  ComboBox.Clear;
  ComboBox.Items.Add('DANO_FISICO');
  ComboBox.Items.Add('PERDA');
  ComboBox.Items.Add('FURTO');
  ComboBox.Items.Add('MAU_FUNCIONAMENTO');
  ComboBox.Items.Add('DESGASTE_NATURAL');
  ComboBox.Items.Add('VANDALISMO');
  ComboBox.ItemIndex := -1;
end;

procedure TOcorrenciaController.PopularComboBoxGravidade(ComboBox: TComboBox);
begin
  ComboBox.Clear;
  ComboBox.Items.Add('LEVE');
  ComboBox.Items.Add('MODERADO');
  ComboBox.Items.Add('GRAVE');
  ComboBox.Items.Add('CRITICO');
  ComboBox.ItemIndex := -1;
end;

procedure TOcorrenciaController.PopularComboBoxResponsabilidade(ComboBox: TComboBox);
begin
  ComboBox.Clear;
  ComboBox.Items.Add('USUARIO');
  ComboBox.Items.Add('EMPRESA');
  ComboBox.Items.Add('TERCEIROS');
  ComboBox.Items.Add('NAO_IDENTIFICADO');
  ComboBox.ItemIndex := -1;
end;

end.
