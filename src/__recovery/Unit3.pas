unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, frxClass, frxDBSet, DB;

type
  TfrmRelatorioDepreciacao = class(TForm)
    btnGerar: TButton;
    procedure btnGerarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    procedure ConfigurarQuerys;
  public
    { Public declarations }
  end;

var
  frmRelatorioDepreciacao: TfrmRelatorioDepreciacao;

implementation

{$R *.dfm}

procedure TfrmRelatorioDepreciacao.Button1Click(Sender: TObject);
begin
     try
    ConfigurarQuerys;

    // Define as variáveis do relatório
    DB.DataModule2.frxReport1.Variables['DataEmissao'] := QuotedStr(FormatDateTime('dd/mm/yyyy', Date));
    DB.DataModule2.frxReport1.Variables['HoraEmissao'] := QuotedStr(FormatDateTime('hh:nn', Time));
    DB.DataModule2.frxReport1.Variables['Usuario'] := QuotedStr('Gestor de Patrimônio');
    // Você pode pegar do seu sistema de login

    // Exibe o relatório
    DB.DataModule2.frxReport2.ShowReport;
  except
    on E: Exception do
      ShowMessage('Erro ao gerar relatório: ' + E.Message);
  end;
end;

procedure TfrmRelatorioDepreciacao.ConfigurarQuerys;
begin
  // Query Principal - Dados dos patrimônios
  DB.DataModule2.qryRelatorio.Close;
  DB.DataModule2.qryRelatorio.SQL.Clear;
  DB.DataModule2.qryRelatorio.SQL.Add('SELECT ');
  DB.DataModule2.qryRelatorio.SQL.Add('  p.id,');
  DB.DataModule2.qryRelatorio.SQL.Add('  p.nome,');
  DB.DataModule2.qryRelatorio.SQL.Add('  p.modelo,');
  DB.DataModule2.qryRelatorio.SQL.Add('  p.tipo,');
  DB.DataModule2.qryRelatorio.SQL.Add('  p.numero_serie,');
  DB.DataModule2.qryRelatorio.SQL.Add('  p.valor_aquisicao,');
  DB.DataModule2.qryRelatorio.SQL.Add('  p.valor_atual,');
  DB.DataModule2.qryRelatorio.SQL.Add('  p.data_aquisicao,');
  DB.DataModule2.qryRelatorio.SQL.Add('  ');
  DB.DataModule2.qryRelatorio.SQL.Add('  ROUND(((p.valor_aquisicao - p.valor_atual)::numeric / ');
  DB.DataModule2.qryRelatorio.SQL.Add('    NULLIF(p.valor_aquisicao, 0)::numeric) * 100, 2) as percentual_depreciacao,');
  DB.DataModule2.qryRelatorio.SQL.Add('  ');
  DB.DataModule2.qryRelatorio.SQL.Add('  CASE ');
  DB.DataModule2.qryRelatorio.SQL.Add('    WHEN ((p.valor_aquisicao - p.valor_atual)::numeric / ');
  DB.DataModule2.qryRelatorio.SQL.Add('          NULLIF(p.valor_aquisicao, 0)::numeric) * 100 >= 100 THEN 0');
  DB.DataModule2.qryRelatorio.SQL.Add('    WHEN p.vida_util_meses IS NOT NULL THEN');
  DB.DataModule2.qryRelatorio.SQL.Add('      GREATEST(0, p.vida_util_meses - (');
  DB.DataModule2.qryRelatorio.SQL.Add('        EXTRACT(YEAR FROM AGE(CURRENT_DATE, p.data_aquisicao))::integer * 12 + ');
  DB.DataModule2.qryRelatorio.SQL.Add('        EXTRACT(MONTH FROM AGE(CURRENT_DATE, p.data_aquisicao))::integer');
  DB.DataModule2.qryRelatorio.SQL.Add('      ))');
  DB.DataModule2.qryRelatorio.SQL.Add('    ELSE 999');
  DB.DataModule2.qryRelatorio.SQL.Add('  END as meses_restantes,');
  DB.DataModule2.qryRelatorio.SQL.Add('  ');
  DB.DataModule2.qryRelatorio.SQL.Add('  CASE ');
  DB.DataModule2.qryRelatorio.SQL.Add('    WHEN ((p.valor_aquisicao - p.valor_atual)::numeric / ');
  DB.DataModule2.qryRelatorio.SQL.Add('          NULLIF(p.valor_aquisicao, 0)::numeric) * 100 >= 100 ');
  DB.DataModule2.qryRelatorio.SQL.Add('    THEN ''1_DEPRECIADO''');
  DB.DataModule2.qryRelatorio.SQL.Add('    WHEN ((p.valor_aquisicao - p.valor_atual)::numeric / ');
  DB.DataModule2.qryRelatorio.SQL.Add('          NULLIF(p.valor_aquisicao, 0)::numeric) * 100 >= 95 ');
  DB.DataModule2.qryRelatorio.SQL.Add('    THEN ''2_URGENTE''');
  DB.DataModule2.qryRelatorio.SQL.Add('    WHEN ((p.valor_aquisicao - p.valor_atual)::numeric / ');
  DB.DataModule2.qryRelatorio.SQL.Add('          NULLIF(p.valor_aquisicao, 0)::numeric) * 100 >= 85 ');
  DB.DataModule2.qryRelatorio.SQL.Add('    THEN ''3_ATENCAO''');
  DB.DataModule2.qryRelatorio.SQL.Add('    ELSE ''4_PLANEJAMENTO''');
  DB.DataModule2.qryRelatorio.SQL.Add('  END as status_ordem,');
  DB.DataModule2.qryRelatorio.SQL.Add('  ');
  DB.DataModule2.qryRelatorio.SQL.Add('  CASE ');
  DB.DataModule2.qryRelatorio.SQL.Add('    WHEN ((p.valor_aquisicao - p.valor_atual)::numeric / ');
  DB.DataModule2.qryRelatorio.SQL.Add('          NULLIF(p.valor_aquisicao, 0)::numeric) * 100 >= 100 ');
  DB.DataModule2.qryRelatorio.SQL.Add('    THEN ''DEPRECIADO 100%''');
  DB.DataModule2.qryRelatorio.SQL.Add('    WHEN ((p.valor_aquisicao - p.valor_atual)::numeric / ');
  DB.DataModule2.qryRelatorio.SQL.Add('          NULLIF(p.valor_aquisicao, 0)::numeric) * 100 >= 95 ');
  DB.DataModule2.qryRelatorio.SQL.Add('    THEN ''URGENTE''');
  DB.DataModule2.qryRelatorio.SQL.Add('    WHEN ((p.valor_aquisicao - p.valor_atual)::numeric / ');
  DB.DataModule2.qryRelatorio.SQL.Add('          NULLIF(p.valor_aquisicao, 0)::numeric) * 100 >= 85 ');
  DB.DataModule2.qryRelatorio.SQL.Add('    THEN ''ATENÇÃO''');
  DB.DataModule2.qryRelatorio.SQL.Add('    ELSE ''PLANEJAMENTO''');
  DB.DataModule2.qryRelatorio.SQL.Add('  END as status_texto');
  DB.DataModule2.qryRelatorio.SQL.Add('FROM patrimonios p');
  DB.DataModule2.qryRelatorio.SQL.Add('WHERE p.ativo = true');
  DB.DataModule2.qryRelatorio.SQL.Add('  AND p.valor_aquisicao > 0');
  DB.DataModule2.qryRelatorio.SQL.Add('  AND ((p.valor_aquisicao - p.valor_atual)::numeric / ');
  DB.DataModule2.qryRelatorio.SQL.Add('       NULLIF(p.valor_aquisicao, 0)::numeric) * 100 >= 75');
  DB.DataModule2.qryRelatorio.SQL.Add('ORDER BY status_ordem, percentual_depreciacao DESC');
  DB.DataModule2.qryRelatorio.Open;

  // Query Resumo - Totalizadores
  DB.DataModule2.qryResumo.Close;
  DB.DataModule2.qryResumo.SQL.Clear;
  DB.DataModule2.qryResumo.SQL.Add('SELECT ');
  DB.DataModule2.qryResumo.SQL.Add('  COUNT(*) FILTER (WHERE percentual >= 100) as qtd_depreciado,');
  DB.DataModule2.qryResumo.SQL.Add('  COALESCE(SUM(valor_aquisicao) FILTER (WHERE percentual >= 100), 0) as valor_depreciado,');
  DB.DataModule2.qryResumo.SQL.Add('  COUNT(*) FILTER (WHERE percentual >= 95 AND percentual < 100) as qtd_urgente,');
  DB.DataModule2.qryResumo.SQL.Add('  COALESCE(SUM(valor_aquisicao) FILTER (WHERE percentual >= 95 AND percentual < 100), 0) as valor_urgente,');
  DB.DataModule2.qryResumo.SQL.Add('  COUNT(*) FILTER (WHERE percentual >= 85 AND percentual < 95) as qtd_atencao,');
  DB.DataModule2.qryResumo.SQL.Add('  COALESCE(SUM(valor_aquisicao) FILTER (WHERE percentual >= 85 AND percentual < 95), 0) as valor_atencao,');
  DB.DataModule2.qryResumo.SQL.Add('  COUNT(*) FILTER (WHERE percentual >= 75 AND percentual < 85) as qtd_planejamento,');
  DB.DataModule2.qryResumo.SQL.Add('  COALESCE(SUM(valor_aquisicao) FILTER (WHERE percentual >= 75 AND percentual < 85), 0) as valor_planejamento,');
  DB.DataModule2.qryResumo.SQL.Add('  COUNT(*) as total_itens,');
  DB.DataModule2.qryResumo.SQL.Add('  COALESCE(SUM(valor_aquisicao), 0) as investimento_total');
  DB.DataModule2.qryResumo.SQL.Add('FROM (');
  DB.DataModule2.qryResumo.SQL.Add('  SELECT ');
  DB.DataModule2.qryResumo.SQL.Add('    p.valor_aquisicao,');
  DB.DataModule2.qryResumo.SQL.Add('    ROUND(((p.valor_aquisicao - p.valor_atual)::numeric / ');
  DB.DataModule2.qryResumo.SQL.Add('           NULLIF(p.valor_aquisicao, 0)::numeric) * 100, 2) as percentual');
  DB.DataModule2.qryResumo.SQL.Add('  FROM patrimonios p');
  DB.DataModule2.qryResumo.SQL.Add('  WHERE p.ativo = true');
  DB.DataModule2.qryResumo.SQL.Add('    AND p.valor_aquisicao > 0');
  DB.DataModule2.qryResumo.SQL.Add('    AND ((p.valor_aquisicao - p.valor_atual)::numeric / ');
  DB.DataModule2.qryResumo.SQL.Add('         NULLIF(p.valor_aquisicao, 0)::numeric) * 100 >= 75');
  DB.DataModule2.qryResumo.SQL.Add(') sub');
  DB.DataModule2.qryResumo.Open;
end;

procedure TfrmRelatorioDepreciacao.btnGerarClick(Sender: TObject);
begin
  try
    ConfigurarQuerys;

    // Define as variáveis do relatório
    DB.DataModule2.frxReport1.Variables['DataEmissao'] := QuotedStr(FormatDateTime('dd/mm/yyyy', Date));
    DB.DataModule2.frxReport1.Variables['HoraEmissao'] := QuotedStr(FormatDateTime('hh:nn', Time));
    DB.DataModule2.frxReport1.Variables['Usuario'] := QuotedStr('Gestor de Patrimônio');
    // Você pode pegar do seu sistema de login

    // Exibe o relatório
    DB.DataModule2.frxReport2.ShowReport;
  except
    on E: Exception do
      ShowMessage('Erro ao gerar relatório: ' + E.Message);
  end;
end;

end.

