-- rank of film category by times rented
-- include the name, count, and rank

-- rental, inventory, film, film_category, category

SELECT
	category.name,
    COUNT(rental_id),
    RANK() OVER(ORDER BY COUNT(rental_id) DESC)
FROM
	rental
INNER JOIN
	inventory
ON
	rental.inventory_id = inventory.inventory_id
INNER JOIN
	film
ON
	inventory.film_id = film.film_id
INNER JOIN
	film_category
ON
	film.film_id = film_category.film_id
INNER JOIN
	category
ON
	film_category.category_id = category.category_id
GROUP BY
	category.name
LIMIT 16
