unit PatrimonioService;

interface

uses
  PatrimonioDTO, PatrimonioModel, PatrimonioRepository, System.Classes,
  Data.DB, LogService,  System.SysUtils;

Type
  TPatrimonioService = class
  private
    FRepository: TPatrimonioRepository;
  public
    constructor Create;
    destructor Destroy; override;
    procedure AdicionarPatrimonio(APatrimonioModel: TPatrimonioConfig);
    procedure ExcluirPatrimonio(AId: Integer);
    procedure RecuperarPatrimonio(AId: Integer);
    procedure EditarPatrimonio(APatrimonioModel: TPatrimonioConfig);
    function PesquisarPatrimonio(const aSearch: String): TDataSet;
    function ObterNomesSalas: TStringList;
    function ListarPatrimonio: TDataSet;
    function ListarPatrimoniosInativos: TDataSet;
    function GetNomePatrimonioById(AId: Integer): string;

    // Métodos para importação
    procedure ImportarPatrimonios(const Itens: TArray<TPatrimonioDTO>;
      var TotalImportados, TotalErros: Integer; Erros: TStringList);
  end;

var
  FPatrimonioService: TPatrimonioService;

implementation

{ TPatrimonioService }

constructor TPatrimonioService.Create;
begin
  inherited Create;
  FRepository := TPatrimonioRepository.Create;
end;

destructor TPatrimonioService.Destroy;
begin
  FRepository.Free;
  inherited;
end;

procedure TPatrimonioService.AdicionarPatrimonio(APatrimonioModel: TPatrimonioConfig);
begin
  try
    FRepository.AdicionarPatrimonio(APatrimonioModel);

    // Log da operação
    TLogService.Instance.LogCadastro(
      'Patrimônio',
      APatrimonioModel.Nome,
      APatrimonioModel.Id,
      'Cadastrou'
    );
  except
    on E: Exception do
      raise Exception.Create('Erro ao adicionar patrimônio: ' + E.Message);
  end;
end;

procedure TPatrimonioService.EditarPatrimonio(APatrimonioModel: TPatrimonioConfig);
begin
  try
    // ✅ CORREÇÃO: Usar FRepository em vez de FPatrimonioService
    FRepository.EditarPatrimonio(APatrimonioModel);

    // Log da operação
    TLogService.Instance.LogAlteracao(
      'Patrimônio',
      APatrimonioModel.Nome,
      APatrimonioModel.Id
    );
  except
    on E: Exception do
      raise Exception.Create('Erro ao editar patrimônio: ' + E.Message);
  end;
end;

procedure TPatrimonioService.ExcluirPatrimonio(AId: Integer);
var
  NomePatrimonio: string;
begin
  try
    // Busca o nome do patrimônio antes de excluir para o log
    NomePatrimonio := GetNomePatrimonioById(AId);

    FRepository.ExcluirPatrimonio(AId);

    // Log da operação
    TLogService.Instance.LogExclusao(
      'Patrimônio',
      NomePatrimonio,
      AId
    );
  except
    on E: Exception do
      raise Exception.Create('Erro ao excluir patrimônio: ' + E.Message);
  end;
end;

procedure TPatrimonioService.RecuperarPatrimonio(AId: Integer);
begin
  try
    FRepository.RecuperarPatrimonio(AId);
  except
    on E: Exception do
      raise Exception.Create('Erro ao recuperar patrimônio: ' + E.Message);
  end;
end;

function TPatrimonioService.ListarPatrimonio: TDataSet;
begin
  try
    Result := FRepository.ListarPatrimonio;
  except
    on E: Exception do
      raise Exception.Create('Erro ao listar patrimônios: ' + E.Message);
  end;
end;

function TPatrimonioService.ListarPatrimoniosInativos: TDataSet;
begin
  try
    Result := FRepository.ListarPatrimoniosInativos;
  except
    on E: Exception do
      raise Exception.Create('Erro ao listar patrimônios inativos: ' + E.Message);
  end;
end;

function TPatrimonioService.ObterNomesSalas: TStringList;
begin
  try
    Result := FRepository.ListarNomesSalas;
  except
    on E: Exception do
      raise Exception.Create('Erro ao obter nomes das salas: ' + E.Message);
  end;
end;

function TPatrimonioService.PesquisarPatrimonio(const aSearch: String): TDataSet;
begin
  try
    Result := FRepository.PesquisarPatrimonio(aSearch);
  except
    on E: Exception do
      raise Exception.Create('Erro ao pesquisar patrimônio: ' + E.Message);
  end;
end;

procedure TPatrimonioService.ImportarPatrimonios(const Itens: TArray<TPatrimonioDTO>;
  var TotalImportados, TotalErros: Integer; Erros: TStringList);
begin
  try
    FRepository.ImportarPatrimonios(Itens, TotalImportados, TotalErros, Erros);
  except
    on E: Exception do
      raise Exception.Create('Erro ao importar patrimônios: ' + E.Message);
  end;
end;

function TPatrimonioService.GetNomePatrimonioById(AId: Integer): string;
begin
  try
    Result := FRepository.GetNomePatrimonioById(AId);
  except
    on E: Exception do
    begin
      Result := '';
      raise Exception.Create('Erro ao obter nome do patrimônio: ' + E.Message);
    end;
  end;
end;

end.
