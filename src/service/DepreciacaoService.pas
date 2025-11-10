unit DepreciacaoService;

interface

uses
  DepreciacaoModel, DepreciacaoRepository, System.Generics.Collections;

type
  TDepreciacaoService = class
  private
    FRepository: TDepreciacaoRepository;
  public
    constructor Create;
    destructor Destroy; override;

    function ObterDadosDepreciacaoPorTipo: TObjectList<TDepreciacaoTipoModel>;
    function ObterResumoGeral: TResumoDepreciacaoModel;
  end;

var
  FDepreciacaoService: TDepreciacaoService;

implementation

{ TDepreciacaoService }

constructor TDepreciacaoService.Create;
begin
  FRepository := TDepreciacaoRepository.Create;
end;

destructor TDepreciacaoService.Destroy;
begin
  FRepository.Free;
  inherited;
end;

function TDepreciacaoService.ObterDadosDepreciacaoPorTipo: TObjectList<TDepreciacaoTipoModel>;
begin
  Result := FRepository.ObterDepreciacaoPorTipo;
end;

function TDepreciacaoService.ObterResumoGeral: TResumoDepreciacaoModel;
begin
  Result := FRepository.ObterResumoDepreciacao;
end;

end.
