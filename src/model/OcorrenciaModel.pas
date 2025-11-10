
unit OcorrenciaModel;

interface

uses
  System.SysUtils;

type
  TOcorrenciaModel = class
  private
    FId: Integer;
    FIdPatrimonio: Integer;
    FIdUsuarioRelator: Integer;
    FIdGestor: Integer;
    FTipoOcorrencia: String;
    FDescricao: String;
    FDataOcorrencia: TDateTime;
    FDataAnalise: TDateTime;
    FStatus: String;
    FGravidade: String;
    FPercentualDepreciacao: Currency;
    FValorAntes: Currency;
    FValorDepois: Currency;
    FResponsabilidade: String;
    FRequerManutencao: Boolean;
    FCustoEstimadoReparo: Currency;
    FObservacoesGestor: String;
    FFotoAnexo: String;
    FCreatedAt: TDateTime;
  public
    property Id: Integer read FId write FId;
    property IdPatrimonio: Integer read FIdPatrimonio write FIdPatrimonio;
    property IdUsuarioRelator: Integer read FIdUsuarioRelator write FIdUsuarioRelator;
    property IdGestor: Integer read FIdGestor write FIdGestor;
    property TipoOcorrencia: String read FTipoOcorrencia write FTipoOcorrencia;
    property Descricao: String read FDescricao write FDescricao;
    property DataOcorrencia: TDateTime read FDataOcorrencia write FDataOcorrencia;
    property DataAnalise: TDateTime read FDataAnalise write FDataAnalise;
    property Status: String read FStatus write FStatus;
    property Gravidade: String read FGravidade write FGravidade;
    property PercentualDepreciacao: Currency read FPercentualDepreciacao write FPercentualDepreciacao;
    property ValorAntes: Currency read FValorAntes write FValorAntes;
    property ValorDepois: Currency read FValorDepois write FValorDepois;
    property Responsabilidade: String read FResponsabilidade write FResponsabilidade;
    property RequerManutencao: Boolean read FRequerManutencao write FRequerManutencao;
    property CustoEstimadoReparo: Currency read FCustoEstimadoReparo write FCustoEstimadoReparo;
    property ObservacoesGestor: String read FObservacoesGestor write FObservacoesGestor;
    property FotoAnexo: String read FFotoAnexo write FFotoAnexo;
    property CreatedAt: TDateTime read FCreatedAt write FCreatedAt;
  end;


implementation

end.