WITH artista_resumo AS (
  SELECT
    artist_name_limpo,
    COUNT(DISTINCT track_id) AS num_musicas,
    SUM(streams_limpo) AS total_streams
  FROM
    `projeto2-467021.Projeto_2.vw_streams_total_playlists`
  GROUP BY
    artist_name_limpo
)

SELECT
  CORR(num_musicas, total_streams) AS correlacao_musicas_streams
FROM
  artista_resumo;
