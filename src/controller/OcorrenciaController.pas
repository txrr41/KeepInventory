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
      raise Exception.Create('Erro ao registrar ocorr�ncia: ' + E.Message);
  end;
end;

function TOcorrenciaController.EditarOcorrencia(DTO: TOcorrenciaDTO): Boolean;
begin
  try
    Result := FOcorrenciaService.EditarOcorrencia(DTO);
  except
    on E: Exception do
      raise Exception.Create('Erro ao editar ocorr�ncia: ' + E.Message);
  end;
end;

function TOcorrenciaController.ExcluirOcorrencia(Id: Integer): Boolean;
begin
  try
    Result := FOcorrenciaService.ExcluirOcorrencia(Id);
  except
    on E: Exception do
      raise Exception.Create('Erro ao excluir ocorr�ncia: ' + E.Message);
  end;
end;

function TOcorrenciaController.AvaliarOcorrencia(DTO: TAvaliacaoOcorrenciaDTO): Boolean;
begin
  try
    Result := FOcorrenciaService.AvaliarOcorrencia(DTO);
  except
    on E: Exception do
      raise Exception.Create('Erro ao avaliar ocorr�ncia: ' + E.Message);
  end;
end;

function TOcorrenciaController.ListarTodas: TFDQuery;
begin
  try
    Result := FOcorrenciaService.ListarTodas;
  except
    on E: Exception do
      raise Exception.Create('Erro ao listar ocorr�ncias: ' + E.Message);
  end;
end;

function TOcorrenciaController.ListarPendentes: TFDQuery;
begin
  try
    Result := FOcorrenciaService.ListarPendentes;
  except
    on E: Exception do
      raise Exception.Create('Erro ao listar ocorr�ncias pendentes: ' + E.Message);
  end;
end;

function TOcorrenciaController.ListarPorPatrimonio(IdPatrimonio: Integer): TFDQuery;
begin
  try
    Result := FOcorrenciaService.ListarPorPatrimonio(IdPatrimonio);
  except
    on E: Exception do
      raise Exception.Create('Erro ao listar ocorr�ncias do patrim�nio: ' + E.Message);
  end;
end;

function TOcorrenciaController.BuscarPorId(Id: Integer): TOcorrenciaModel;
begin
  try
    Result := FOcorrenciaService.BuscarPorId(Id);
  except
    on E: Exception do
      raise Exception.Create('Erro ao buscar ocorr�ncia: ' + E.Message);
  end;
end;

procedure TOcorrenciaController.PopularComboBoxPatrimonios(ComboBox: TComboBox);
begin
  try
    FOcorrenciaRepository.PopularComboBoxPatrimonios(ComboBox);
  except
    on E: Exception do
      raise Exception.Create('Erro ao popular patrim�nios: ' + E.Message);
  end;
end;

procedure TOcorrenciaController.PopularComboBoxTipos(ComboBox: TComboBox);
begin
  ComboBox.Clear;
  ComboBox.Items.Add('Dano Físico');
  ComboBox.Items.Add('Perda');
  ComboBox.Items.Add('Furto');
  ComboBox.Items.Add('Mau Funcionamento');
  ComboBox.Items.Add('Desgaste Natural');
  ComboBox.Items.Add('Vandalismo');
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
