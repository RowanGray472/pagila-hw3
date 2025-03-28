/* 
 * In the previous query, the actors could come from any combination of movies.
 * Unfortunately, you've found that if the actors all come from only 1 or 2 of the movies,
 * then there is not enough diversity in the acting talent.
 *
 * Write a SQL query that lists all of the movies where:
 * at least 1 actor was also in AMERICAN CIRCUS,
 * at least 1 actor was also in ACADEMY DINOSAUR,
 * and at least 1 actor was also in AGENT TRUMAN.
 *
 * HINT:
 * There are many ways to solve this problem,
 * but I personally found the INTERSECT operator to make a convenient solution.
 */

(SELECT fa.title
FROM film fa
JOIN film_actor a USING (film_id)
JOIN film_actor b USING (actor_id)
JOIN film fb ON (fb.film_id = b.film_id)
WHERE fb.title LIKE 'ACADEMY DINOSAUR'
INTERSECT
SELECT fa.title
FROM film fa
JOIN film_actor a USING (film_id)
JOIN film_actor b USING (actor_id)
JOIN film fb ON (fb.film_id = b.film_id)
WHERE fb.title LIKE 'AMERICAN CIRCUS'
INTERSECT
SELECT fa.title
FROM film fa
JOIN film_actor a USING (film_id)
JOIN film_actor b USING (actor_id)
JOIN film fb ON (fb.film_id = b.film_id)
WHERE fb.title LIKE 'AGENT TRUMAN'
)
ORDER BY title
;
