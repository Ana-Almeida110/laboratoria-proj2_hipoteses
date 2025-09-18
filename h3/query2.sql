SELECT
  track_id,
  artist_name_limpo,
  streams_limpo,
  in_spotify_playlists,
  in_deezer_playlists,
  in_apple_playlists,
  (in_spotify_playlists + in_deezer_playlists + in_apple_playlists) AS total_playlists
FROM `projeto2-467021.Projeto_2.vw_todos_campos`;
