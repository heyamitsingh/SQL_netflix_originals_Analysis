/* Syntax to do analysis */

/* What are the average IMDb scores for each genre of Netflix Originals? */

SELECT n.genre_id, g.genre_name, ROUND(AVG(n.imdb_score),1) AS avg_imdb_score
FROM netflix n
INNER JOIN genre g
ON n.genre_id = g.genre_id
GROUP BY n.genre_id, g.genre_name ORDER BY avg_imdb_score DESC;

/* Which genres have an average IMDb score higher than 7.5? */

WITH avg_score AS (
	SELECT n.genre_id, g.genre_name, ROUND(AVG(n.imdb_score),1) AS avg_imdb_score
	FROM netflix n
	INNER JOIN genre g
	ON n.genre_id = g.genre_id
	GROUP BY n.genre_id, g.genre_name
	ORDER BY avg_imdb_score DESC
)
SELECT * FROM avg_score
WHERE avg_imdb_score > 7.5;

/* List Netflix Original titles in descending order of their IMDb scores. */

SELECT title, imdb_score
FROM netflix
ORDER BY imdb_score DESC;

/* Retrieve the top 10 longest Netflix Originals by runtime. */

SELECT title, runtime
FROM netflix
ORDER BY runtime DESC LIMIT 10;

/* Retrieve the titles of Netflix Originals along with their respective genres. */

SELECT n.title, g.genre_name
FROM netflix n
LEFT JOIN genre g
ON n.genre_id = g.genre_id;

/* Rank Netflix Originals based on their IMDb scores within each genre. */

WITH rn AS (
	SELECT n.title, n.genre_id, g.genre_name, n.imdb_score
	FROM netflix n
	INNER JOIN genre g
	ON n.genre_id = g.genre_id
)
SELECT *, 
DENSE_RANK() OVER (PARTITION BY genre_id ORDER BY imdb_score DESC) AS genre_rank
FROM rn

/* Which Netflix Originals have IMDb scores higher than the average IMDb score of all titles? */

SELECT title, imdb_score 
FROM (
	   SELECT title, imdb_score,
	   AVG(imdb_score) OVER() AS avg_score 
	   FROM netflix
	 )
WHERE imdb_score > avg_score;

/* How many Netflix Originals are there in each genre? */

SELECT n.genre_id, g.genre_name, COUNT(*)
FROM netflix n
INNER JOIN genre g
ON n.genre_id = g.genre_id
GROUP BY n.genre_id, g.genre_name;

/* Which genres have more than 5 Netflix Originals with an IMDb score higher than 8? */

WITH score AS (
	SELECT genre_id, imdb_score
	FROM netflix
	WHERE imdb_score > 8
)
SELECT genre_id, MIN(imdb_score) AS min_imdb_score, COUNT(*) AS total_count
FROM score
GROUP BY genre_id
HAVING COUNT(*)>5;

/* What are the top 3 genres with the highest average IMDb scores, and how many Netflix Originals do they have? */

SELECT genre_id,
ROUND(AVG(imdb_score),1) AS imdb_avg,
COUNT(*) AS total_netflix_originals
FROM netflix
GROUP BY genre_id ORDER BY imdb_avg DESC
LIMIT 3