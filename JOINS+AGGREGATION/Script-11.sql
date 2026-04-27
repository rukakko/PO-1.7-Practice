--task 1
SELECT
    f.title,
    cat.name AS category_name
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category cat     ON fc.category_id = cat.category_id
ORDER BY f.title
LIMIT 20;

-- task 2
SELECT
	first_name,
	last_name,
	email
FROM
	customer
WHERE
	email LIKE '%@sakilacustomer.org'
ORDER BY
	last_name
	
	
-- task 3
SELECT
	rating,
	COUNT(*)AS file_count
FROM
	film f
GROUP BY
	rating
ORDER BY
	file_count DESC

-- task 4
SELECT
	a.first_name,
	a.last_name,
	COUNT(f.film_id) AS film_count
FROM
	actor a
JOIN film_actor fa ON
	a.actor_id = fa.actor_id
JOIN film f ON
	fa.film_id = f.film_id
GROUP BY
	a.actor_id,
	a.first_name,
	a.last_name
ORDER BY
	film_count DESC
LIMIT 10

--task 5
SELECT
	c.first_name,
	c.last_name,
	ROUND(SUM(p.amount), 2) AS total_paid
FROM
	customer c
JOIN payment p ON
	c.customer_id = p.customer_id
JOIN rental r ON
	p.rental_id = r.rental_id
GROUP BY
	c.customer_id,
	c.first_name,
	c.last_name
HAVING
	SUM(p.amount) > 150
ORDER BY
	total_paid DESC;