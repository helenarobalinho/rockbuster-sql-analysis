/* Film table summary statistics */

-- Numerical fields

SELECT
	-- film_id
	MIN (film_id) AS min_film_id,
	MAX (film_id) AS max_film_id,
	AVG (film_id) AS avg_film_id,
	COUNT (film_id) AS cnt_film_id,

	-- release_year
	MIN (release_year) AS min_release_year,
	MAX (release_year) AS max_release_year,
	AVG (release_year) AS avg_release_year,
	COUNT (release_year) AS cnt_release_year,

	-- language_id
	MIN (language_id) AS min_language_id,
	MAX (language_id) AS max_language_id,
	AVG (language_id) AS avg_language_id,
	COUNT (language_id) AS cnt_language_id,

	-- rental_duration
	MIN (rental_duration) AS min_rental_duration,
	MAX (rental_duration) AS max_rental_duration,
	AVG (rental_duration) AS avg_rental_duration,
	COUNT (rental_duration) AS cnt_rental_duration,

	-- rental_rate
	MIN (rental_rate) AS min_rental_rate,
	MAX (rental_rate) AS max_rental_rate,
	AVG (rental_rate) AS avg_rental_rate,
	COUNT (rental_rate) AS cnt_rental_rate,

	-- film length
	MIN (length) AS min_length,
	MAX (length) AS max_length,
	AVG (length) AS avg_length,
	COUNT (length) AS cnt_length,

	-- replacement_cost
	MIN (replacement_cost) AS min_replacement_cost,
	MAX (replacement_cost) AS max_replacement_cost,
	AVG (replacement_cost) AS avg_replacement_cost,
	COUNT (replacement_cost) AS cnt_replacement_cost

FROM film;

-- categorical fields

SELECT
	-- rating
	MODE () WITHIN GROUP (ORDER BY rating) AS rating_mode,
	COUNT (rating) AS cnt_rating,
	-- last_update
	MODE () WITHIN GROUP (ORDER BY last_update) AS last_update_mode,
	COUNT (last_update) AS cnt_last_update,
	-- special-features
	MODE () WITHIN GROUP (ORDER BY special_features) AS special_features_mode,
	COUNT (special_features) AS cnt_special_features,
	-- fulltext
	MODE () WITHIN GROUP (ORDER BY fulltext) AS fulltext_mode,
	COUNT (fulltext) AS cnt_fulltext

FROM film;
