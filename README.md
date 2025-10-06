# Projeto 2  
## Ficha Técnica - Projeto 2: Hipóteses  

### Objetivo  
Validar ou refutar hipóteses sobre os fatores que influenciam o sucesso de músicas em plataformas digitais, auxiliando decisões estratégicas de uma gravadora para o lançamento de um novo artista com o objetivo de aumentar as chances de sucesso.  

### Equipe  
Projeto desenvolvido em dupla por **Ana Paula de Almeida Coiado** e **Mariucha Pontes**  

### Ferramentas e Tecnologias  
- Google BigQuery (SQL - armazenamento e análise)  
- Power BI (visualizações e dashboards)  
- Eventualmente Planilhas Google e Python para histogramas  

---

## Processamento e Análises  

### Importação dos dados  
- Criação da base de dados no BigQuery com arquivos `.csv` disponibilizados:  
  - `track_in_spotify`  
  - `track_technical_info`  
  - `track_in_competition`  

### Tratamento de dados  
- Tratar dados nulos utilizando os comandos SQL `COUNT`, `WHERE` e `IS NULL`  
- Identificar e tratar valores duplicados com `COUNT`, `GROUP BY`, `HAVING`  
- Identificar e tratar valores fora do escopo com `SELECT EXCEPT`  
- Tratar dados discrepantes em variáveis numéricas com `MAX`, `MIN` e `AVG`  
- Alteração de tipos de dados com `CAST` e `CONVERT`  
- Salvar consultas (queries) como **views** para posterior utilização  

### Criação de novas variáveis  
- Criar variáveis com `CAST` e `CONCAT` para formatação de data  
- Criar views para facilitar manipulação dos dados  
- Unir tabelas com `LEFT JOIN` e `JOIN`  
- Construir tabelas temporárias com `WITH` para cálculos  

---

## Análise Exploratória (EDA)  
- Download e instalação do Power BI  
- Importação das tabelas e views do BigQuery para o Power BI  
- Agrupamento de variáveis categóricas no Power BI para visualização  
- Utilização de gráficos de barras, tabelas, cartões, gráficos de colunas e dispersão  
- Aplicação de medidas de tendência central (média e mediana)  
- Utilização de histograma para visualizar distribuições (Python no Power BI)  
- Aplicação de medidas de dispersão (desvio padrão)  

---

## Técnicas de análise  
- Criação de categorias com cálculo de **quartis** no BigQuery  
- Cálculo de correlação utilizando **Pearson** com `CORR` no BigQuery  
- Validação das hipóteses apresentadas através da correlação  

---

## Dashboard  
- Apresentação dos principais dados da base com tabela resumo e scorecards  
- Representação dos dados com gráficos simples (barras e linhas)  
- Aplicação de filtros para gerenciamento e interação  

---

## Resultados e Conclusões  

### Hipótese 1 - **BPM x Streams**  
- Gráficos de dispersão e cálculo de quartis  
- ❌ Não foi encontrada correlação entre BPM e streams  

### Hipótese 2 - **Popularidade Spotify x Outras Plataformas**  
- Gráficos de dispersão e tabela resumo com top 10 músicas  
- Músicas não apresentam comportamento semelhante entre rankings  
- Correlações:  
  - Spotify x Apple → **0,55**  
  - Spotify x Shazam → **0,57**  
  - Spotify x Deezer → **0,60**  

### Hipótese 3 - **Playlists x Streams**  
- Gráfico de dispersão e tabela com total de playlists (Apple, Spotify e Deezer)  
- ✔ Relação encontrada entre número de playlists e streams  

### Hipótese 4 - **Nº músicas do artista x Streams**  
- Gráficos de dispersão e tabelas resumo  
- ✔ Correlação identificada entre nº de músicas e streams  
- Obs.: Taylor Swift (34 músicas) tem menos streams que The Weeknd (22 músicas)  

### Hipótese 5 - **Características técnicas x Streams**  
- ❌ Sem correlação direta, mas tendências:  
  - 🎻 Muito instrumental → menos streams  
  - 🎤 Ao vivo → baixa/média popularidade  
  - ⚡ Alta energia → média/alta popularidade  
  - 🗣️ Presença de fala → média/baixa popularidade  
  - 😊 Positividade → média/baixa popularidade  
  - ⏱️ Preferência por BPM médio  

### Hipótese adicional - **Cantores solo x Participações**  
- Gráficos de dispersão  
- Correlação negativa (**-0,14**)  
- ✔ Preferência clara por músicas solo  

---

## Limitações / Próximos Passos  

### Limitações  
- Variáveis técnicas subjetivas (energia, positividade) podem afetar a confiabilidade  
- Métricas qualitativas (marketing, contexto cultural) não foram consideradas  
- Diferenças entre plataformas refletem públicos distintos  
- Correlação não implica causalidade  
- Ausência de informação sobre estilo musical e público-alvo do artista  

### Próximos passos  
- Incluir variáveis externas (redes sociais, marketing, clipes no YouTube)  
- Realizar segmentação do público por país/região  
- Segmentar dados por gênero musical e perfil de público-alvo  

---

## Links de Interesse  
 
- [Ficha Técnica (Notion)](https://www.notion.so/Projeto-2-2398dc77aa2d80968fa3c09e5f700d4a?source=copy_link)  
- [Apresentação](https://www.loom.com/share/22d287e373464d82a8a71b400a266f25?sid=dafca777-bba4-4f51-a7db-98ce272073b6)
- [Comandos utilizados na preparação da base](https://github.com/Ana-Almeida110/laboratoria-proj2_hipoteses/blob/main/sql_preparacao_bd/tratamento_dados.sql)   

