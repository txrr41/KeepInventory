unit MovimentacaoModel;

interface

uses
  System.SysUtils;

type
  TMovimentacaoConfig = class
  private
    FId: Integer;
    FIdPatrimonio: Integer;
    FIdOrigem: Integer;
    FIdDestino: Integer;
    FQuantidade: Integer;
    FStatus: String;
    FIdUsuario: Integer;
    FDataMovimentacao: TDateTime;
  public
    property Id: Integer read FId write FId;
    property IdPatrimonio: Integer read FIdPatrimonio write FIdPatrimonio;
    property IdOrigem: Integer read FIdOrigem write FIdOrigem;
    property IdDestino: Integer read FIdDestino write FIdDestino;
    property Quantidade: Integer read FQuantidade write FQuantidade;
    property Status: String read FStatus write FStatus;
    property IdUsuario: Integer read FIdUsuario write FIdUsuario;
    property DataMovimentacao: TDateTime read FDataMovimentacao write FDataMovimentacao;
  end;

implementation

end.
