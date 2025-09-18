SELECT
tb1.track_id,
tb1.track_name_limpo,
tb1.artist_name_limpo,
tb1.artist_count,
tb1.in_spotify_playlists,
tb1.in_spotify_charts,
tb1.data_completa,
tb1.streams_limpo,
tb2.bpm,
tb2.mode,
tb2.`danceability_%`,
tb2.`valence_%`,
tb2.`energy_%`,
tb2.`acousticness_%`,
tb2.`instrumentalness_%`,
tb2.`liveness_%`,
tb2.`speechiness_%`,
tb3.in_apple_playlists,
tb3.in_apple_charts,
tb3.in_deezer_playlists,
tb3.in_deezer_charts,
tb3.in_shazam_charts_corrigido
FROM `projeto2-467021.Projeto_2.tb_spotify_limpo` AS tb1
JOIN `projeto2-467021.Projeto_2.vw_technical_info_completo` AS tb2
ON tb1.track_id = tb2.track_id
JOIN `projeto2-467021.Projeto_2.tb_competition_limpo` AS tb3
ON tb1.track_id = tb3.track_id
