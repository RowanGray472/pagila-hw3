/*
 * List all actors with Bacall Number 2;
 * That is, list all actors that have appeared in a film with an actor that has appeared in a film with 'RUSSELL BACALL',
 * but do not include actors that have Bacall Number < 2.
 */
WITH Bacall1 AS (
    -- Find all actors with a Bacall number of 1
    SELECT DISTINCT fa.actor_id
    FROM film_actor fa
    JOIN actor a ON fa.actor_id = a.actor_id
    WHERE fa.film_id IN (
        SELECT film_id
        FROM film_actor
        JOIN actor USING (actor_id)
        WHERE first_name = 'RUSSELL' AND last_name = 'BACALL'
    )
),
Bacall2 AS (
    -- Find all actors who have been in a movie with someone from Bacall1, but not in Bacall1
    SELECT DISTINCT fa.actor_id
    FROM film_actor fa
    JOIN Bacall1 b1 ON fa.film_id IN (
        SELECT film_id FROM film_actor WHERE actor_id = b1.actor_id
    )
    WHERE fa.actor_id NOT IN (SELECT actor_id FROM Bacall1) -- Exclude Bacall1 actors
    AND fa.film_id NOT IN ( -- Ensure they haven't acted directly with Russell Bacall
        SELECT film_id
        FROM film_actor
        JOIN actor USING (actor_id)
        WHERE first_name = 'RUSSELL' AND last_name = 'BACALL'
    )
)
SELECT DISTINCT a.first_name || ' ' || a.last_name AS "Actor Name"
FROM actor a
JOIN Bacall2 b2 ON a.actor_id = b2.actor_id
ORDER BY "Actor Name";

