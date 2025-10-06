-- ==============================================
-- Tratamento da tabela track_in_competition
-- ==============================================

-- 1. Verificar e tratar dados nulos
SELECT
SUM(CASE WHEN track_id IS NULL THEN 1 ELSE 0 END) AS nulos_track_id,
SUM(CASE WHEN in_apple_playlists IS NULL THEN 1 ELSE 0 END) AS nulos_apple_playlists,
SUM(CASE WHEN in_apple_charts IS NULL THEN 1 ELSE 0 END) AS nulos_apple_charts,
SUM(CASE WHEN in_deezer_playlists IS NULL THEN 1 ELSE 0 END) AS nulos_deezer_playlists,
SUM(CASE WHEN in_deezer_charts IS NULL THEN 1 ELSE 0 END) AS nulos_deezer_charts,
SUM(CASE WHEN in_shazam_charts IS NULL THEN 1 ELSE 0 END) AS nulos_shazam_charts
FROM `projeto2-467021.Projeto_2.track_in_competition`
A consulta retornou 50 registros nulos na coluna in_shazam_charts (vw_nulos_competition)

-- 2. Criar view com dados tratados (vw_competition_sem_nulos) 
SELECT *
FROM
  `projeto2-467021.Projeto_2.track_in_competition`
WHERE
  in_shazam_charts IS NOT NULL
Salvei a consulta como vw_competition_sem_nulos

--3. Identificar e tratar dados duplicados (não houveram dados duplicados)
Para verificar se há duplicados na tabela digitei o seguinte comando
SELECT 
track_id,
COUNT(*) AS quantidade
FROM `projeto2-467021.Projeto_2.track_in_competition`
GROUP BY track_id
HAVING COUNT (*) > 1

--4. Identificar e tratar dados fora do escopo de análise
SELECT *
FROM `projeto2-467021.Projeto_2.track_in_competition`
WHERE track_id IS NOT NULL
   OR in_apple_playlists IS NULL OR in_apple_playlists < 0
   OR in_apple_charts IS NULL OR in_apple_charts < 0
   OR in_deezer_playlists IS NULL OR in_deezer_playlists < 0
   OR in_deezer_charts IS NULL OR in_deezer_charts < 0
   OR in_shazam_charts IS NULL OR in_shazam_charts < 0;

Não foram encontrados dados fora do escopo

--5. Identificar e tratar dados discrepantes em variáveis categóricas
Nesta tabela não haviam variáveis categóricas

--6. Identificar e tratar dados discrepantes em variáveis numéricas
SELECT
MAX(track_id),
MIN(track_id),
FROM `projeto2-467021.Projeto_2.track_in_competition`
Foi encontrado um registro com com track_id igual a 0:00. Para tratar, salvei uma view excluindo este registro (vw_competition_tratado)
SELECT *
FROM `projeto2-467021.Projeto_2.track_in_competition`
WHERE track_id <> '0:00'

--7. Verificar e alterar o tipo de dado
Não houve necessidade de alteraçã

--8. Criação de novas variáveis
Nenhuma nova variável envolvendo esta tabela

--9. Unir tabelas
Realizei a união das tabelas vw_competition_tratado e vw_competition_sem_nulos
SELECT
tb1.*,
tb2.in_shazam_charts,
FROM `projeto2-467021.Projeto_2.vw_competition_sem_nulos` AS tb1
JOIN `projeto2-467021.Projeto_2.vw_competition_tratado` AS tb2
ON tb1.track_id = tb2.track_id

--10. Construir tabelas auxiliares
Não foram construídas tabelas auxiliares
  

-- ==============================================
-- Tratamento da tabela track_in_spotify
-- ==============================================

A tabela apresentou os dados todos na coluna A, separados por vírgula e com aspas o que gerou um arquivo 
  com problemas para trabalhar no BigQuery. Para resolver este problema, foram tomadas as seguintes medidas:
Salvei o arquivo como “track_in_spotify_tratado.csv para poder editar
No Excel, no menu > Dados > Texto para Colunas > selecionei a coluna A >  Delimitado > Tabulação e Vírgula > Concluir
Na coluna artist_name, os dados estavam separados por vírgula, o que seria um problema no BigQuery.
Para resolver o problema: Menu > Página Inicial > Substituir > Localizar e Substituir > Substituir > Localizar > 
  colocar no campo a vírgula (,) e em Substituir, deixar em branco > Substituir tudo. Serão substituídos em 529 ocorrências 
No BigQuery: criar tabela > track_in_spotify_tratado.csv > em Opções Avançadas > Delimitador de campo > Personalizado > separados por “;”

-- 1. Verificar e tratar dados nulos
SELECT
SUM(CASE WHEN track_id IS NULL THEN 1 ELSE 0 END) AS nulos_track_id,
SUM(CASE WHEN track_name IS NULL THEN 1 ELSE 0 END) AS nulos_track_name,
SUM(CASE WHEN artist_name IS NULL THEN 1 ELSE 0 END) AS nulos_artist_name,
SUM(CASE WHEN released_year IS NULL THEN 1 ELSE 0 END) AS nulos_released_year,
SUM(CASE WHEN released_month IS NULL THEN 1 ELSE 0 END) AS nulos_released_month,
SUM(CASE WHEN released_day IS NULL THEN 1 ELSE 0 END) AS nulos_released_day,
SUM(CASE WHEN in_spotify_playlists IS NULL THEN 1 ELSE 0 END) AS nulos_in_spotify_playlists,
SUM(CASE WHEN in_spotify_charts IS NULL THEN 1 ELSE 0 END) AS nulos_in_spotify_charts,
SUM(CASE WHEN streams IS NULL THEN 1 ELSE 0 END) AS nulos_streams
FROM `projeto2-467021.Projeto_2.track_in_spotify`
Não foram encontrados dados nulos

--2. Identificar e tratar dados duplicados 
Para verificar se há duplicados na tabela digitei o seguinte comando
SELECT track_name, artist_name,
  COUNT(*) AS quantidade
FROM`projeto2-467021.Projeto_2.track_in_spotify`
GROUP BY track_name, artist_name
HAVING COUNT(*) > 1
retornando duas linhas onde o track_id são diferentes, track_name, artist_name, artist_count, released_year, 
  released_month, released_day com informações iguais e in_spotify_playlists, in_spotify_charts e streams com informações diferentes

Para verificar os dados duplicados e decidir o que fazer, dei o comando:
select * from `projeto2-467021.Projeto_2.track_in_spotify_tratado`
where artist_name = 'Rosa Linn'
Repetindo o comando anterior com os outros retornos da coluna artist_name (Lizzo, The Weeknd e ThxSoMch) 
  foi verificado que o padrão se repete
Uma vez que não há outros dados que deêm base para exclusão dos dados “duplicados”, decidi não excluir

--3. Identificar e tratar dados fora do escopo de análise
Não foram encontrados dados fora do escopo

--4. Identificar e tratar dados discrepantes em variáveis categóricas
Verifiquei visualmente que haviam dados estranhos na tabela e para tratar digitei o comando:
SELECT
  track_name,
  artist_name,
  REGEXP_REPLACE(track_name, r'[^a-zA-Z0-9 ]', ' ') AS track_name_limpo,
  REGEXP_REPLACE(artist_name, r'[^a-zA-Z0-9 ]', ' ') AS  artist_name_limpo
FROM
  `projeto2-467021.Projeto_2.track_in_spotify`
Consulta salva como vw_spotify_limpo

--5. Identificar e tratar dados discrepantes em variáveis numéricas
SELECT
MAX(streams) as max,
MIN(streams) as min,
FROM `projeto2-467021.Projeto_2.vw_spotify_limpo`

O retorno foi: para o MAX, o track_id = 7996425 que está com o tipo “String” e para o MIM, 
  o track_id = BPM110KeyAModeMajorDanceability53Valence75Energy69Acousticness7Instrumentalness0Liveness17Speechiness3 -> também em String

Alterar o dado para número e depois voltar neste passo

Após alterar o tipo de dado para “NULO” com SAFE_CAST, realizei uma nova consulta com o seguinte comando: 
SELECT
  safe_cast (streams AS int64) AS streams_limpo
FROM `projeto2-467021.Projeto_2.vw_spotify_limpo`
WHERE SAFE_CAST(streams AS INT64) IS NOT NULL;
(salvo como vw_spotify_streams_limpo)

SELECT *
FROM `projeto2-467021.Projeto_2.track_in_competition`
WHERE track_id <> '0:00'

--6. Verificar e alterar o tipo de dado
Comando executado para tratar os dados discrepantes do passo anterior
SELECT 
track_id,
track_name,
artist_name,
artist_count,
released_year,
released_month,
released_day,
in_spotify_playlists,
in_spotify_charts,
SAFE_CAST(streams AS INT64) AS streams_limpo
FROM `projeto2-467021.Projeto_2.vw_spotify_limpo`
Consulta salva como vw_spotify_tratado

--7. Criação de novas variáveis
Criação de variável para a data completa (dia-mês-ano) 
SELECT
  DATE(CONCAT(CAST(released_year AS STRING), "-", CAST(released_month AS STRING), "-", CAST(released_day AS STRING))),
FROM`projeto2-467021.Projeto_2.vw_spotify_tratado`
Consulta salva como vw_data_completa

--8. Unir tabelas
União da view com dados tratados e a view com a data completa
SELECT
  tb.track_id,  
  vw.track_name,
  vw.artist_name,
  tb.artist_count,
  dt.data_completa,
  tb.in_spotify_playlists,
  tb.in_spotify_charts,
  tb.streams
FROM
`projeto2-467021.Projeto_2.vw_spotify_tratado` tb
JOIN
`projeto2-467021.Projeto_2.vw_data_completa` dt
  ON tb.track_name = vw.track_name_limpo AND tb.artist_name = vw.artist_name_limpo
Consulta salva como vw_spotify_join

--9. Construir tabelas auxiliares
Criei a tabela temporária “musicas_solo” que vai conter só as músicas feitas por artistas solo
WITH musicas_solo AS (
  SELECT
     track_id,
     artist_name_limpo
  FROM
     `projeto2-467021.Projeto_2.vw_spotify_join`
  WHERE
     artist_count = 1
),
total_musicas_por_artista AS (
  SELECT
     artist_name_limpo,
     COUNT(DISTINCT track_id) AS total_musicas_solo
     FROM
     musicas_solo
     GROUP BY
     artist_name_limpo
)
SELECT *
FROM total_musicas_por_artista
ORDER BY total_musicas_solo DESC;


-- ==============================================
-- Tratamento da tabela track_in_technical_info
-- ==============================================

-- 1. Verificar e tratar dados nulos
A tabela apresentou dados faltantes na coluna “key” que foram tratados da seguinte forma:
select * from `projeto2-467021.Projeto_2.track_technical_info` where key is not null
(vai retornar a tabela sem os registros faltantes)
A consulta foi salva como vw_technical_info_tratado

Para verificar todas as colunas de uma só vez
SELECT
SUM(CASE WHEN track_id IS NULL THEN 1 ELSE 0 END) AS nulos_track_id,
SUM(CASE WHEN bpm IS NULL THEN 1 ELSE 0 END) AS nulos_bpm,
SUM(CASE WHEN key IS NULL THEN 1 ELSE 0 END) AS nulos_key,
SUM(CASE WHEN mode IS NULL THEN 1 ELSE 0 END) AS nulos_mode,
SUM(CASE WHEN `danceability_%` IS NULL THEN 1 ELSE 0 END) AS nulos_danceability,
SUM(CASE WHEN `valence_%` IS NULL THEN 1 ELSE 0 END) AS nulos_valence,
SUM(CASE WHEN `energy_%` IS NULL THEN 1 ELSE 0 END) AS nulos_energi,
SUM(CASE WHEN `acousticness_%` IS NULL THEN 1 ELSE 0 END) AS nulos_acousticness,
SUM(CASE WHEN `instrumentalness_%` IS NULL THEN 1 ELSE 0 END) AS nulos_instrumentalness,
SUM(CASE WHEN `liveness_%` IS NULL THEN 1 ELSE 0 END) AS nulos_liveness,
SUM(CASE WHEN `speechiness_%` IS NULL THEN 1 ELSE 0 END) AS nulos_speechiness

FROM `projeto2-467021.Projeto_2.track_technical_info`
Decidi não utilizar a coluna “key”

--2. Identificar e tratar dados duplicados 
Não foram encontrados dados duplicados

--3. Identificar e tratar dados fora do escopo de análise
Os dados fora do escopo foram os encontrados na coluna “key”

--4. Identificar e tratar dados discrepantes em variáveis categóricas
Não foram encontrados

--5. Identificar e tratar dados discrepantes em variáveis numéricas
Não foram encontrados

--6. Verificar e alterar o tipo de dado
Não houve necessidade de alteração

--7. Criação de novas variáveis
Nenhuma nova variável envolvendo esta tabela

--8. Unir tabelas
Não realizei união com esta tabela

--9. Construir tabelas auxiliares
Não foram construídas tabelas auxiliares


