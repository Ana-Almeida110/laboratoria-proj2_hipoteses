WITH
  quartis AS (
  SELECT
    streams_limpo,
    NTILE(4) OVER (ORDER BY streams_limpo) AS quartil_streams
  FROM
    `projeto2-467021.Projeto_2.vw_todos_campos` )
SELECT
  q1.*,
  quartis.quartil_streams,
  CASE
    WHEN quartis.quartil_streams = 1 THEN "muito baixo"
    WHEN quartis.quartil_streams = 2 THEN "baixo"
    WHEN quartis.quartil_streams = 3 THEN "médio"
    WHEN quartis.quartil_streams = 4 THEN "alto"
END
