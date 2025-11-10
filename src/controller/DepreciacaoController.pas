unit DepreciacaoController;

interface

uses
  DepreciacaoService, DepreciacaoModel, System.Generics.Collections;

type
  TDepreciacaoController = class
  private
    FService: TDepreciacaoService;
  public
    constructor Create;
    destructor Destroy; override;

    function ObterDepreciacaoPorTipo: TObjectList<TDepreciacaoTipoModel>;
    function ObterResumoGeral: TResumoDepreciacaoModel;
  end;

var
  FDepreciacaoController: TDepreciacaoController;

implementation

{ TDepreciacaoController }

constructor TDepreciacaoController.Create;
begin
  FService := TDepreciacaoService.Create;
end;

destructor TDepreciacaoController.Destroy;
begin
  FService.Free;
  inherited;
end;

function TDepreciacaoController.ObterDepreciacaoPorTipo: TObjectList<TDepreciacaoTipoModel>;
begin
  Result := FService.ObterDadosDepreciacaoPorTipo;
end;

function TDepreciacaoController.ObterResumoGeral: TResumoDepreciacaoModel;
begin
  Result := FService.ObterResumoGeral;
end;

initialization
  FDepreciacaoController := TDepreciacaoController.Create;

finalization
  FDepreciacaoController.Free;

end.
