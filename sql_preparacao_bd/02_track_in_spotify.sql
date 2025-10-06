-- ==============================================
-- Script: Preparação da tabela track_in_spotify
-- Objetivo: Corrigir problemas de formatação e criar view sem dados nulos
-- ==============================================

-- Observações sobre o tratamento do CSV:
-- 1. Salvei o arquivo como "track_in_spotify_tratado.csv" para edição.
-- 2. No Excel: Menu Dados > Texto para Colunas > selecionei a coluna A > Delimitado > Tabulação e Vírgula > Concluir.
-- 3. Na coluna artist_name, substituí todas as vírgulas por branco (529 ocorrências).
-- 4. No BigQuery: criar tabela > track_in_spotify_tratado.csv > Opções Avançadas > Delimitador de campo > Personalizado > separados por ";".

-- 1. Criar view com dados sem nulos - salvo como vw_track_technical_info_tratado
CREATE OR REPLACE VIEW `projeto2-467021.Projeto_2.vw_spotify_sem_nulos` AS
SELECT *
FROM `projeto2-467021.Projeto_2.track_technical_info`
WHERE key IS NOT NULL;

-- 2. Verificar todas as variáveis da tabela de uma só vez - salvo como vw_ nulos_competition
SELECT
SUM(CASE WHEN track_id IS NULL THEN 1 ELSE 0 END) AS nulos_track_id,
SUM(CASE WHEN in_apple_playlists IS NULL THEN 1 ELSE 0 END) AS nulos_apple_playlists,
SUM(CASE WHEN in_apple_charts IS NULL THEN 1 ELSE 0 END) AS nulos_apple_charts,
SUM(CASE WHEN in_deezer_playlists IS NULL THEN 1 ELSE 0 END) AS nulos_deezer_playlists,
SUM(CASE WHEN in_deezer_charts IS NULL THEN 1 ELSE 0 END) AS nulos_deezer_charts,
SUM(CASE WHEN in_shazam_charts IS NULL THEN 1 ELSE 0 END) AS nulos_shazam_charts
FROM `projeto2-467021.Projeto_2.track_in_competition`



