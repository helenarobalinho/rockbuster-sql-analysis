-- 1. Revenue and customer distribution by country
SELECT co.country,
    COUNT (DISTINCT cu.customer_id) AS customer_count,
    SUM (pa.amount) AS total_revenue
FROM customer cu
INNER JOIN payment pa ON cu.customer_id = pa.customer_id
INNER JOIN address ad ON cu.address_id = ad.address_id
INNER JOIN city ci ON ad.city_id = ci.city_id
INNER JOIN country co ON ci.country_id = co.country_id
GROUP BY co.country
ORDER BY total_revenue DESC;


-- 2. Top 10 cities that fall within the top 10 countries

WITH top_countries AS (
    SELECT co.country,
        COUNT(cu.customer_id) AS total_customers
    FROM customer cu
    INNER JOIN address ad ON cu.address_id = ad.address_id
    INNER JOIN city ci ON ad.city_id = ci.city_id
    INNER JOIN country co ON ci.country_id = co.country_id
    GROUP BY co.country
    ORDER BY total_customers DESC
    LIMIT 10),

city_distribution AS (
    SELECT ci.city,
        co.country,
        COUNT(cu.customer_id) AS total_customers
    FROM customer cu
    INNER JOIN address ad ON cu.address_id = ad.address_id
    INNER JOIN city ci ON ad.city_id = ci.city_id
    INNER JOIN country co ON ci.country_id = co.country_id
    INNER JOIN top_countries tc ON co.country = tc.country
    GROUP BY ci.city, co.country)

SELECT *
FROM city_distribution
ORDER BY total_customers DESC
LIMIT 10;



-- 3. Top 5 customers from the top 10 cities who’ve paid the highest total amounts
WITH top_countries AS (
    SELECT co.country
    FROM customer cu
    INNER JOIN address ad ON cu.address_id = ad.address_id
    INNER JOIN city ci ON ad.city_id = ci.city_id
    INNER JOIN country co ON ci.country_id = co.country_id
    GROUP BY co.country
    ORDER BY COUNT(cu.customer_id) DESC
    LIMIT 10),

top_cities AS (
    SELECT ci.city,
        co.country
    FROM customer cu
    INNER JOIN address ad ON cu.address_id = ad.address_id
    INNER JOIN city ci ON ad.city_id = ci.city_id
    INNER JOIN country co ON ci.country_id = co.country_id
    INNER JOIN top_countries tc ON co.country = tc.country
    GROUP BY ci.city, co.country
    ORDER BY COUNT(cu.customer_id) DESC
    LIMIT 10),

customer_payments AS (
    SELECT cu.customer_id,
        cu.first_name,
        cu.last_name,
        co.country,
        ci.city,
        SUM(pa.amount) AS total_payment
    FROM customer cu
    INNER JOIN payment pa ON cu.customer_id = pa.customer_id
    INNER JOIN address ad ON cu.address_id = ad.address_id
    INNER JOIN city ci ON ad.city_id = ci.city_id
    INNER JOIN country co ON ci.country_id = co.country_id
    INNER JOIN top_cities tc ON ci.city = tc.city
    GROUP BY cu.customer_id, cu.first_name, cu.last_name, co.country, ci.city)

SELECT *
FROM customer_payments
ORDER BY total_payment DESC
LIMIT 5;


-- 4. average amount paid by the top 5 customers:
WITH top_customers AS (
    SELECT cu.customer_id,
        SUM(pa.amount) AS total_payment
    FROM customer cu
    INNER JOIN payment pa ON cu.customer_id = pa.customer_id
    GROUP BY cu.customer_id
    ORDER BY total_payment DESC
    LIMIT 5)

SELECT 
    AVG (total_payment) AS avg_top_customer_value
FROM top_customers;


-- 5. Top customers location:
WITH top_customers AS (
    SELECT cu.customer_id,
        SUM(pa.amount) AS total_payment
    FROM customer cu
    INNER JOIN payment pa ON cu.customer_id = pa.customer_id
    GROUP BY cu.customer_id
    ORDER BY total_payment DESC
    LIMIT 5),

customer_location AS (
    SELECT cu.customer_id,
        co.country
    FROM customer cu
    INNER JOIN address ad ON cu.address_id = ad.address_id
    INNER JOIN city ci ON ad.city_id = ci.city_id
    INNER JOIN country co ON ci.country_id = co.country_id)

SELECT cl.country,
    COUNT(tc.customer_id) AS top_customer_count
FROM top_customers tc
INNER JOIN customer_location cl ON tc.customer_id = cl.customer_id
GROUP BY cl.country;
