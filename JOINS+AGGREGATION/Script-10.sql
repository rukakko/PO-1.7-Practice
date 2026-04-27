--SELECT f.rating, f.rental_duration, COUNT(*) AS film_count
--FROM film f
--GROUP BY f.rating, f.rental_duration
--HAVING count(*)>40
--ORDER BY film_count  ;

--SELECT DISTINCT f.rating
--FROM film f,
--
--SELECT f.rating, COUNT(*) AS film_count
--FROM film f
--GROUP BY f.rating
--ORDER BY film_count DESC;
--
--
--SELECT ci.city, COUNT(*) AS active_customers
--FROM customer c
--JOIN address a ON c.address_id = a.address_id
--JOIN city ci ON a.city_id = ci.city_id
--WHERE c.active = 1
--GROUP BY ci.city
--HAVING COUNT(*) >= 5
--ORDER BY active_customers DESC;

SELECT c.'name' AS category, count(r.rental_id) AS total_rentals, round 
FROM category c
JOIN film_category fc ON fc.category_id = c.category_id
JOIN film f ON fc.film_id = f.film_id
JOIN inventory i ON i.film_id = f.film_id
JOIN rental r ON r.inventory_id = r.rental_id
JOIN payment p ON p.rental_id = r.rental_id
GROUP BY c."name"
HAVING sum(p.amount) > 4000 ; 