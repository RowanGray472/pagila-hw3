/*
 * Write a SQL query that lists the title of all movies where at least 2 actors were also in 'AMERICAN CIRCUS'.
 */

SELECT title
FROM film
JOIN film_actor USING (film_id)
WHERE actor_id IN (
SELECT actor_id
FROM film_actor
JOIN film USING (film_id)
WHERE film.title LIKE 'AMERICAN CIRCUS')
GROUP BY title
HAVING count(title) > 1
ORDER BY title
;
