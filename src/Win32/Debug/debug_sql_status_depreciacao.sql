SELECT
    p.id,
    p.nome,
    p.modelo,
    p.tipo,
    p.situacao,
    p.numero_serie,
    p.valor_aquisicao,
    p.valor_atual,
    p.data_aquisicao,

    ROUND(((p.valor_aquisicao - p.valor_atual)::numeric / NULLIF(p.valor_aquisicao, 0)::numeric) * 100, 2) as percentual_depreciacao,

    (p.valor_aquisicao - p.valor_atual) as valor_depreciado,

    EXTRACT(YEAR FROM AGE(CURRENT_DATE, p.data_aquisicao))::integer * 12 +
    EXTRACT(MONTH FROM AGE(CURRENT_DATE, p.data_aquisicao))::integer as idade_meses,

    CASE
      WHEN (EXTRACT(YEAR FROM AGE(CURRENT_DATE, p.data_aquisicao)) * 12 +
            EXTRACT(MONTH FROM AGE(CURRENT_DATE, p.data_aquisicao))) > 0
      THEN ROUND(
        (((p.valor_aquisicao - p.valor_atual)::numeric / NULLIF(p.valor_aquisicao, 0)::numeric) * 100) /
        (EXTRACT(YEAR FROM AGE(CURRENT_DATE, p.data_aquisicao)) * 12 +
         EXTRACT(MONTH FROM AGE(CURRENT_DATE, p.data_aquisicao)))::numeric, 2
      )
      ELSE 0
    END as taxa_depreciacao_mensal,

    CASE
      WHEN ((p.valor_aquisicao - p.valor_atual)::numeric / NULLIF(p.valor_aquisicao, 0)::numeric) * 100 >= 100 THEN 0
      WHEN p.vida_util_meses IS NOT NULL THEN
        GREATEST(0, p.vida_util_meses - (
          EXTRACT(YEAR FROM AGE(CURRENT_DATE, p.data_aquisicao))::integer * 12 +
          EXTRACT(MONTH FROM AGE(CURRENT_DATE, p.data_aquisicao))::integer
        ))
      WHEN (EXTRACT(YEAR FROM AGE(CURRENT_DATE, p.data_aquisicao)) * 12 +
            EXTRACT(MONTH FROM AGE(CURRENT_DATE, p.data_aquisicao))) > 0
      THEN CEILING(
        (100 - ((p.valor_aquisicao - p.valor_atual)::numeric / NULLIF(p.valor_aquisicao, 0)::numeric) * 100) /
        NULLIF(((((p.valor_aquisicao - p.valor_atual)::numeric / NULLIF(p.valor_aquisicao, 0)::numeric) * 100) /
          (EXTRACT(YEAR FROM AGE(CURRENT_DATE, p.data_aquisicao)) * 12 +
           EXTRACT(MONTH FROM AGE(CURRENT_DATE, p.data_aquisicao)))::numeric), 0)
      )::integer
      ELSE 999
    END as meses_restantes,

    CASE
      WHEN ((p.valor_aquisicao - p.valor_atual)::numeric / NULLIF(p.valor_aquisicao, 0)::numeric) * 100 >= 100 THEN p.data_aquisicao
      WHEN p.vida_util_meses IS NOT NULL THEN p.data_aquisicao + (p.vida_util_meses || ' months')::interval
      ELSE NULL
    END as data_prevista_100,

    CASE
      WHEN ((p.valor_aquisicao - p.valor_atual)::numeric / NULLIF(p.valor_aquisicao, 0)::numeric) * 100 >= 100 THEN 'DEPRECIADO 100%'
      WHEN ((p.valor_aquisicao - p.valor_atual)::numeric / NULLIF(p.valor_aquisicao, 0)::numeric) * 100 >= 95 THEN 'URGENTE (95%+)'
      WHEN ((p.valor_aquisicao - p.valor_atual)::numeric / NULLIF(p.valor_aquisicao, 0)::numeric) * 100 >= 85 THEN 'ATENÇÃO (85%+)'
      WHEN ((p.valor_aquisicao - p.valor_atual)::numeric / NULLIF(p.valor_aquisicao, 0)::numeric) * 100 >= 75 THEN 'PLANEJAMENTO (75%+)'
      ELSE 'MONITORAR'
    END as status_depreciacao,

    CASE
      WHEN ((p.valor_aquisicao - p.valor_atual)::numeric / NULLIF(p.valor_aquisicao, 0)::numeric) * 100 >= 100 THEN 1
      WHEN ((p.valor_aquisicao - p.valor_atual)::numeric / NULLIF(p.valor_aquisicao, 0)::numeric) * 100 >= 95 THEN 2
      WHEN ((p.valor_aquisicao - p.valor_atual)::numeric / NULLIF(p.valor_aquisicao, 0)::numeric) * 100 >= 85 THEN 3
      WHEN ((p.valor_aquisicao - p.valor_atual)::numeric / NULLIF(p.valor_aquisicao, 0)::numeric) * 100 >= 75 THEN 4
      ELSE 5
    END as prioridade_ordem,

    CASE
      WHEN ((p.valor_aquisicao - p.valor_atual)::numeric / NULLIF(p.valor_aquisicao, 0)::numeric) * 100 >= 100 THEN '#8B0000'
      WHEN ((p.valor_aquisicao - p.valor_atual)::numeric / NULLIF(p.valor_aquisicao, 0)::numeric) * 100 >= 95 THEN '#FF0000'
      WHEN ((p.valor_aquisicao - p.valor_atual)::numeric / NULLIF(p.valor_aquisicao, 0)::numeric) * 100 >= 85 THEN '#FFA500'
      WHEN ((p.valor_aquisicao - p.valor_atual)::numeric / NULLIF(p.valor_aquisicao, 0)::numeric) * 100 >= 75 THEN '#FFD700'
      ELSE '#008000'
    END as cor_status

FROM patrimonios p
WHERE p.ativo = true
  AND p.valor_aquisicao > 0
  AND ((p.valor_aquisicao - p.valor_atual)::numeric / NULLIF(p.valor_aquisicao, 0)::numeric) * 100 >= 75
ORDER BY
  prioridade_ordem ASC,
  percentual_depreciacao DESC,
  p.valor_aquisicao DESC
