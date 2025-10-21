unit MovimentacaoDto;

interface

uses
  System.SysUtils;

type
  TMovimentacaoDTO = record
    FId: Integer;
    FIdPatrimonio: Integer;
    FIdOrigem: Integer;
    FIdDestino: Integer;
    FQuantidade: Integer;
    FStatus: String;
    FIdUsuario: Integer;
    FDataMovimentacao: TDateTime;
  end;

implementation

end.
