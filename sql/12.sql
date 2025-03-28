/* 
 * A new James Bond movie will be released soon, and management wants to send promotional material to "action fanatics".
 * They've decided that an action fanatic is any customer where at least 4 of their 5 most recently rented movies are action movies.
 *
 * Write a SQL query that finds all action fanatics.
 */

SELECT customer_id, first_name, last_name
FROM (
    SELECT c.customer_id, c.first_name, c.last_name, film.title, r.rental_date, category.name
    FROM customer c
    LEFT JOIN LATERAL (
        SELECT rental_id, rental_date
        FROM rental
        WHERE customer_id = c.customer_id
        ORDER BY rental_date DESC
        LIMIT 5
    ) r ON true
    JOIN rental USING (rental_id)
    JOIN inventory USING (inventory_id)
    JOIN film USING (film_id)
    JOIN film_category USING (film_id)
    JOIN category USING (category_id)
    WHERE category.name LIKE 'Action'
    ORDER BY c.last_name
) t
GROUP BY first_name, last_name, customer_id
HAVING COUNT(*) >= 4
ORDER BY customer_id;
