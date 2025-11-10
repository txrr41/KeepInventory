unit DashboardModel;

interface

type
  TDashboardItemModel = class
  private
    FNome: string;
    FQuantidade: Integer;
  public
    property Nome: string read FNome write FNome;
    property Quantidade: Integer read FQuantidade write FQuantidade;
  end;

implementation

end.
