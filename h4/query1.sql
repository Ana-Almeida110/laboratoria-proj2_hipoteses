SELECT
tb1.track_id,
tb1.track_name_limpo,
tb1.artist_name_limpo,
tb1.streams_limpo,
tb1.in_spotify_playlists,
tb2.in_apple_playlists,
tb2.in_deezer_playlists,
(tb1.in_spotify_playlists + tb2.in_apple_playlists + tb2.in_deezer_playlists) AS total_playlists
FROM
`projeto2-467021.Projeto_2.tb_spotify_limpo` AS tb1
JOIN `projeto2-467021.Projeto_2.vw_playlists` AS tb2
ON tb1.track_id = tb2.track_id
