unit RelatorioDepreciacaoStsRepository;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, frxClass, frxDBSet;

type
  TfrmRelatorioDepreciacao = class(TForm)
    qryRelatorio: TFDQuery;
    qryResumo: TFDQuery;
    frxDBDataset2: TfrxDBDataset;
    frxDBDataset3: TfrxDBDataset;
    frxReport1: TfrxReport;
    btnGerar: TButton;
    procedure btnGerarClick(Sender: TObject);
  private
    procedure ConfigurarQuerys;
  public
  end;

var
  frmRelatorioDepreciacao: TfrmRelatorioDepreciacao;

implementation

{$R *.dfm}

procedure TfrmRelatorioDepreciacao.ConfigurarQuerys;
begin
  // ==================== QUERY PRINCIPAL ====================

  qryRelatorio.Close;
  qryRelatorio.SQL.Clear;

  qryRelatorio.SQL.Text :=
    'SELECT ' +
    '  p.id, ' +
    '  p.nome, ' +
    '  COALESCE(p.modelo, ''N/I'') as modelo, ' +
    '  COALESCE(p.tipo, ''N/I'') as tipo, ' +
    '  COALESCE(p.numero_serie, ''S/N'') as numero_serie, ' +
    '  p.valor_aquisicao, ' +
    '  COALESCE(p.valor_atual, 0) as valor_atual, ' +
    '  p.data_aquisicao, ' +

    // Percentual Depreciação
    '  ROUND( ((p.valor_aquisicao - COALESCE(p.valor_atual,0)) / NULLIF(p.valor_aquisicao,0)) * 100, 2 ) AS percentual_depreciacao, ' +

    // Meses Restantes
    '  CASE ' +
    '    WHEN p.vida_util_meses IS NOT NULL AND p.vida_util_meses > 0 THEN ' +
    '      GREATEST( 0, p.vida_util_meses - ( ' +
    '        EXTRACT(YEAR FROM AGE(CURRENT_DATE,p.data_aquisicao))::integer * 12 + ' +
    '        EXTRACT(MONTH FROM AGE(CURRENT_DATE,p.data_aquisicao))::integer ) ) ' +
    '    ELSE 0 ' +
    '  END as meses_restantes, ' +

    // Status Ordem (STRING)
    '  CASE ' +
    '    WHEN ((p.valor_aquisicao - COALESCE(p.valor_atual,0)) / NULLIF(p.valor_aquisicao,0)) * 100 >= 100 THEN ''1'' ' +
    '    WHEN ((p.valor_aquisicao - COALESCE(p.valor_atual,0)) / NULLIF(p.valor_aquisicao,0)) * 100 >= 95 THEN ''2'' ' +
    '    WHEN ((p.valor_aquisicao - COALESCE(p.valor_atual,0)) / NULLIF(p.valor_aquisicao,0)) * 100 >= 85 THEN ''3'' ' +
    '    WHEN ((p.valor_aquisicao - COALESCE(p.valor_atual,0)) / NULLIF(p.valor_aquisicao,0)) * 100 >= 75 THEN ''4'' ' +
    '    ELSE ''5'' ' +
    '  END AS status_ordem, ' +

    // Status Texto
    '  CASE ' +
    '    WHEN ((p.valor_aquisicao - COALESCE(p.valor_atual,0)) / NULLIF(p.valor_aquisicao,0)) * 100 >= 100 THEN ''JÁ DEPRECIADOS 100%'' ' +
    '    WHEN ((p.valor_aquisicao - COALESCE(p.valor_atual,0)) / NULLIF(p.valor_aquisicao,0)) * 100 >= 95 THEN ''URGENTE - PRÓXIMOS 3 MESES (95%+)'' ' +
    '    WHEN ((p.valor_aquisicao - COALESCE(p.valor_atual,0)) / NULLIF(p.valor_aquisicao,0)) * 100 >= 85 THEN ''ATENÇÃO - 3 A 6 MESES (85-94%)'' ' +
    '    WHEN ((p.valor_aquisicao - COALESCE(p.valor_atual,0)) / NULLIF(p.valor_aquisicao,0)) * 100 >= 75 THEN ''PLANEJAMENTO - 6 A 12 MESES (75-84%)'' ' +
    '    ELSE ''NORMAL'' ' +
    '  END as status_texto ' +

    'FROM patrimonios p ' +
    'WHERE p.ativo = true ' +
    '  AND p.valor_aquisicao > 0 ' +
    '  AND p.valor_atual IS NOT NULL ' +

    'ORDER BY ' +
    '  CASE ' +
    '    WHEN ((p.valor_aquisicao - COALESCE(p.valor_atual,0)) / NULLIF(p.valor_aquisicao,0)) * 100 >= 100 THEN 1 ' +
    '    WHEN ((p.valor_aquisicao - COALESCE(p.valor_atual,0)) / NULLIF(p.valor_aquisicao,0)) * 100 >= 95 THEN 2 ' +
    '    WHEN ((p.valor_aquisicao - COALESCE(p.valor_atual,0)) / NULLIF(p.valor_aquisicao,0)) * 100 >= 85 THEN 3 ' +
    '    WHEN ((p.valor_aquisicao - COALESCE(p.valor_atual,0)) / NULLIF(p.valor_aquisicao,0)) * 100 >= 75 THEN 4 ' +
    '    ELSE 5 ' +
    '  END, ' +
    '  percentual_depreciacao DESC';

  try
    qryRelatorio.Open;
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao abrir query do relatório: ' + E.Message);
      raise;
    end;
  end;

  // ==================== QUERY RESUMO ====================

  qryResumo.Close;
  qryResumo.SQL.Clear;

  qryResumo.SQL.Text :=
    'SELECT ' +
    '  COUNT(*) FILTER ( WHERE ((valor_aquisicao - COALESCE(valor_atual,0)) / NULLIF(valor_aquisicao,0)) * 100 >= 100 ) as qtd_depreciado, ' +
    '  SUM(valor_aquisicao) FILTER ( WHERE ((valor_aquisicao - COALESCE(valor_atual,0)) / NULLIF(valor_aquisicao,0)) * 100 >= 100 ) as valor_depreciado, ' +

    '  COUNT(*) FILTER ( WHERE ((valor_aquisicao - COALESCE(valor_atual,0)) / NULLIF(valor_aquisicao,0)) * 100 >= 95 AND ' +
    '                         ((valor_aquisicao - COALESCE(valor_atual,0)) / NULLIF(valor_aquisicao,0)) * 100 < 100 ) as qtd_urgente, ' +
    '  SUM(valor_aquisicao) FILTER ( WHERE ((valor_aquisicao - COALESCE(valor_atual,0)) / NULLIF(valor_aquisicao,0)) * 100 >= 95 AND ' +
    '                                     ((valor_aquisicao - COALESCE(valor_atual,0)) / NULLIF(valor_aquisicao,0)) * 100 < 100 ) as valor_urgente, ' +

    '  COUNT(*) FILTER ( WHERE ((valor_aquisicao - COALESCE(valor_atual,0)) / NULLIF(valor_aquisicao,0)) * 100 >= 85 AND ' +
    '                         ((valor_aquisicao - COALESCE(valor_atual,0)) / NULLIF(valor_aquisicao,0)) * 100 < 95 ) as qtd_atencao, ' +
    '  SUM(valor_aquisicao) FILTER ( WHERE ((valor_aquisicao - COALESCE(valor_atual,0)) / NULLIF(valor_aquisicao,0)) * 100 >= 85 AND ' +
    '                                     ((valor_aquisicao - COALESCE(valor_atual,0)) / NULLIF(valor_aquisicao,0)) * 100 < 95 ) as valor_atencao, ' +

    '  COUNT(*) FILTER ( WHERE ((valor_aquisicao - COALESCE(valor_atual,0)) / NULLIF(valor_aquisicao,0)) * 100 >= 75 AND ' +
    '                         ((valor_aquisicao - COALESCE(valor_atual,0)) / NULLIF(valor_aquisicao,0)) * 100 < 85 ) as qtd_planejamento, ' +
    '  SUM(valor_aquisicao) FILTER ( WHERE ((valor_aquisicao - COALESCE(valor_atual,0)) / NULLIF(valor_aquisicao,0)) * 100 >= 75 AND ' +
    '                                     ((valor_aquisicao - COALESCE(valor_atual,0)) / NULLIF(valor_aquisicao,0)) * 100 < 85 ) as valor_planejamento, ' +

    '  COUNT(*) FILTER ( WHERE ((valor_aquisicao - COALESCE(valor_atual,0)) / NULLIF(valor_aquisicao,0)) * 100 >= 75 ) as total_itens, ' +
    '  SUM(valor_aquisicao) FILTER ( WHERE ((valor_aquisicao - COALESCE(valor_atual,0)) / NULLIF(valor_aquisicao,0)) * 100 >= 75 ) as investimento_total ' +

    'FROM patrimonios ' +
    'WHERE ativo = true AND valor_aquisicao > 0 AND valor_atual IS NOT NULL';

  try
    qryResumo.Open;
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao abrir query de resumo: ' + E.Message);
      raise;
    end;
  end;

end;


procedure TfrmRelatorioDepreciacao.btnGerarClick(Sender: TObject);
begin
  ConfigurarQuerys;
  frxReport1.ShowReport;
end;

end.

