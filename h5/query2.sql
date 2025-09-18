SELECT
tcampos.track_id,
tcampos.track_name_limpo,
tcampos.streams_limpo,
tcampos.`acousticness_%`,
tcampos.`danceability_%`,
tcampos.`instrumentalness_%`,
tcampos.`liveness_%`,
tcampos.`valence_%`,
tcampos.`energy_%`,
tcampos.`speechiness_%`,
tcampos.bpm,
spotify.in_spotify_charts,
spotify.in_spotify_playlists
FROM `projeto2-467021.Projeto_2.vw_todos_campos` AS tcampos
LEFT JOIN `projeto2-467021.Projeto_2.tb_spotify_limpo` AS spotify
ON tcampos.track_id = spotify.track_id
