/* 
 * Finding movies with similar categories still gives you too many options.
 *
 * Write a SQL query that lists all movies that share 2 categories with AMERICAN CIRCUS and 1 actor.
 *
 * HINT:
 * It's possible to complete this problem both with and without set operations,
 * but I find the version using set operations much more intuitive.
 */

(SELECT fa.title
FROM film fa
JOIN film_category a ON (fa.film_id = a.film_id)
JOIN category USING (category_id)
JOIN film_category b ON (category.category_id = b.category_id)
JOIN film fb ON (fb.film_id = b.film_id)
WHERE fb.title = 'AMERICAN CIRCUS'
GROUP BY fa.film_id, fa.title
HAVING COUNT(DISTINCT category.category_id) >= 2
INTERSECT
SELECT c.title
FROM film_actor a
JOIN film USING (film_id)
JOIN film_actor b ON (a.actor_id = b.actor_id)
JOIN film c ON (c.film_id = b.film_id)
WHERE film.title LIKE 'AMERICAN CIRCUS'
)
ORDER BY title
;
