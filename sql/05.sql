/*
 * You love the acting in the movie 'AMERICAN CIRCUS' and want to watch other movies with the same actors.
 *
 * Write a SQL query that lists the title of all movies that share at least 1 actor with 'AMERICAN CIRCUS'.
 *
 * HINT:
 * This can be solved with a self join on the film_actor table.
 */

SELECT c.title
FROM film_actor a
JOIN film USING (film_id)
JOIN film_actor b ON (a.actor_id = b.actor_id)
JOIN film c ON (c.film_id = b.film_id)
WHERE film.title LIKE 'AMERICAN CIRCUS'
ORDER BY c.title;
