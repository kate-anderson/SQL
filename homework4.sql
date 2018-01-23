SELECT COUNT(*) FROM movie;

--Q1
SELECT movie.title, actor.name
FROM ((casting
    INNER JOIN movie ON casting.movie_id = movie.id)
    INNER JOIN actor ON casting.actor_id = actor.id)
WHERE movie.id = '2579806' AND casting.ord=1;

--Q2
SELECT movie.id, movie.title, movie.yr
FROM ((casting
    INNER JOIN movie ON casting.movie_id = movie.id)
    INNER JOIN actor ON casting.actor_id = actor.id)
WHERE actor.name = 'Stewart, Kristen'
ORDER BY movie.yr asc;

--Q3
SELECT AVG(score) AS average
FROM ((casting
    INNER JOIN movie ON casting.movie_id = movie.id)
    INNER JOIN actor ON casting.actor_id = actor.id)
WHERE actor.name = 'DiCaprio, Leonardo';

--Q4
SELECT title, yr
FROM movie
WHERE director IN (SELECT director
                    FROM movie
                    WHERE title = 'Iron Man')
ORDER BY yr asc;

--Q5
SELECT Count(*)
FROM ((casting
    INNER JOIN movie ON casting.movie_id = movie.id)
    INNER JOIN actor ON casting.actor_id = actor.id)
WHERE actor.name = 'Schwarzenegger, Arnold' AND movie.director = 'Cameron, James';

--Q6
SELECT DISTINCT movie.title, movie.score
FROM ((casting
    INNER JOIN movie ON casting.movie_id = movie.id)
    INNER JOIN actor ON casting.actor_id = actor.id)
WHERE movie.score = (SELECT MAX(score)
                    FROM movie);

--Q7
SELECT title
FROM movie
WHERE id IN(SELECT movie_id
            FROM casting
            WHERE actor_id IN(SELECT id
                            FROM actor
                            WHERE name IN('Cooper, Bradley')))
INTERSECT
SELECT title
FROM movie
WHERE id IN(SELECT movie_id
            FROM casting
            WHERE actor_id IN(SELECT id
                            FROM actor
                            WHERE name IN('Lawrence, Jennifer')));

--Q8
SELECT *
FROM (SELECT movie.director, COUNT(DISTINCT(casting.actor_id)) AS diff_actor
        FROM casting
        INNER JOIN movie ON casting.movie_id = movie.id
        GROUP BY movie.director
        HAVING COUNT(DISTINCT(casting.actor_id))>200)
ORDER BY diff_actor desc;

--Q9
SELECT director
FROM movie
WHERE score >= 9.0;

--Q10
SELECT movie.title, movie.yr, movie.score, actor.name
FROM ((casting
    INNER JOIN movie ON casting.movie_id = movie.id)
    INNER JOIN actor ON casting.actor_id = actor.id)
WHERE movie.title LIKE 'Star Trek%' AND casting.ord=1
ORDER BY movie.yr desc;