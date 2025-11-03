unit OcorrenciaDTO;

interface

uses
  System.SysUtils;

type
  TOcorrenciaDTO = record
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
  end;

  TAvaliacaoOcorrenciaDTO = record
    FIdOcorrencia: Integer;
    FIdGestor: Integer;
    FGravidade: String;
    FPercentualDepreciacao: Currency;
    FResponsabilidade: String;
    FRequerManutencao: Boolean;
    FCustoEstimadoReparo: Currency;
    FObservacoesGestor: String;
  end;

implementation

end.
