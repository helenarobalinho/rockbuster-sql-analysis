-- base rental data using a CTE 

WITH rental AS (
    SELECT
        re.rental_id,
        pa.amount,
        fi.title AS film_title,
        ca.name AS genre,
        co.country
    FROM payment pa
    JOIN rental re ON pa.rental_id = re.rental_id
    JOIN inventory inv ON re.inventory_id = inv.inventory_id
    JOIN film fi ON inv.film_id = fi.film_id
    JOIN film_category filca ON fi.film_id = filca.film_id
    JOIN category ca ON filca.category_id = ca.category_id
    JOIN customer cu ON pa.customer_id = cu.customer_id
    JOIN address ad ON cu.address_id = ad.address_id
    JOIN city ci ON ad.city_id = ci.city_id
    JOIN country co ON ci.country_id = co.country_id
)

-- rentals and revenue by Genre

SELECT
    genre,
    COUNT(rental_id) AS rental_count,
    SUM(amount) AS total_revenue
FROM rental
GROUP BY genre
ORDER BY total_revenue DESC;

-- revenue by Movie

SELECT
    film_title,
    SUM(amount) AS total_revenue
FROM rental
GROUP BY film_title
ORDER BY total_revenue DESC;

-- Genre by Country

SELECT
    country,
    genre,
    COUNT(rental_id) AS rental_count,
    SUM(amount) AS total_revenue
FROM rental
GROUP BY country, genre
ORDER BY total_revenue DESC;