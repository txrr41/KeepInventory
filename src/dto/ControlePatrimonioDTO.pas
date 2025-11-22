unit ControlePatrimonioDTO;

interface

type
  TControlePatrimonioDTO = record
    TotalItens: Integer;
    ValorTotal: Currency;
    PatrimoniosAtivos: Integer;
    EmManutencao: Integer;
    TotalOcorrencias: Integer;
  end;

  TControlePatrimonioFiltroDTO = record
    DataInicio: TDate;
    DataFim: TDate;
    IdPredio: Integer;
    IdSala: Integer;
    TextoBusca: string;
  end;

implementation

end.