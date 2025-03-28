/* 
 * You've decided that you don't actually like ACADEMY DINOSAUR and AGENT TRUMAN,
 * and want to focus on more movies that are similar to AMERICAN CIRCUS.
 * This time, however, you don't want to focus only on movies with similar actors.
 * You want to consider instead movies that have similar categories.
 *
 * Write a SQL query that lists all of the movies that share 2 categories with AMERICAN CIRCUS.
 * Order the results alphabetically.
 *
 * NOTE:
 * Recall that the following query lists the categories for the movie AMERICAN CIRCUS:
 * ```
 * SELECT name
 * FROM category
 * JOIN film_category USING (category_id)
 * JOIN film USING (film_id)
 * WHERE title = 'AMERICAN CIRCUS';
 * ```
 * This problem should be solved by a self join on the "film_category" table.
 */

SELECT fa.title
FROM film fa
JOIN film_category a ON (fa.film_id = a.film_id)
JOIN category USING (category_id)
JOIN film_category b ON (category.category_id = b.category_id)
JOIN film fb ON (fb.film_id = b.film_id)
WHERE fb.title = 'AMERICAN CIRCUS'
GROUP BY fa.film_id, fa.title
HAVING COUNT(DISTINCT category.category_id) >= 2;
