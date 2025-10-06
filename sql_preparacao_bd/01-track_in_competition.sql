-- ==============================================
-- Script: Tratamento da tabela track_in_competition
-- Objetivo: Identificar e tratar dados nulos
-- ==============================================

-- 1. Verificar dados nulos
SELECT
  COUNT(*)
FROM
  `projeto2-467021.Projeto_2.track_in_competition`
WHERE
  track_id IS NULL;

-- 2. Criar view com dados tratados (substituindo valores nulos)
CREATE OR REPLACE VIEW `projeto2-467021.Projeto_2.vw_competition_sem_nulos` AS
SELECT
  track_id,
  IFNULL(in_shazam_charts, 0) AS in_shazam_charts_corrigido
FROM
  `projeto2-467021.Projeto_2.track_in_competition`;
