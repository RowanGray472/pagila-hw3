/* 
 * You also like the acting in the movies ACADEMY DINOSAUR and AGENT TRUMAN,
 * and so you'd like to see movies with actors that were in either of these movies or AMERICAN CIRCUS.
 *
 * Write a SQL query that lists all movies where at least 3 actors were in one of the above three movies.
 * (The actors do not necessarily have to all be in the same movie, and you do not necessarily need one actor from each movie.)
 */

SELECT title
FROM (
SELECT fa.title, count(fa.title) AS count
FROM film fa
JOIN film_actor a ON (fa.film_id = a.film_id)
JOIN film_actor b ON (a.actor_id = b.actor_id)
JOIN film fb ON (fb.film_id = b.film_id)
WHERE fb.title IN ('AMERICAN CIRCUS', 'AGENT TRUMAN', 'ACADEMY DINOSAUR')
GROUP BY fa.title
ORDER BY fa.title
) t
WHERE count >= 3
;
