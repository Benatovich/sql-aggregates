-- CUBE of amount made per year, month, day, and film rating
-- similar to exercise 9 but include the rating with joins
-- replace ROLLUP with CUBE
-- ORDER BY RATING YEAR MONTH DAY

SELECT
	EXTRACT (YEAR FROM payment_date) y,
    EXTRACT (MONTH FROM payment_date) M,
    EXTRACT (DAY FROM payment_date) d,
    SUM (amount),
    film.rating
FROM
	payment
INNER JOIN
	rental
ON
	payment.rental_id = rental.rental_id
INNER JOIN
	inventory
ON
	rental.inventory_id = inventory.inventory_id
INNER JOIN
	film
ON
	inventory.film_id = film.film_id
GROUP BY
	CUBE (
		film.rating,
      	EXTRACT (YEAR FROM payment_date),
    	EXTRACT (MONTH FROM payment_date),
    	EXTRACT (DAY FROM payment_date)
      )
ORDER BY
	film.rating,
  	EXTRACT (YEAR FROM payment_date),
   	EXTRACT (MONTH FROM payment_date),
   	EXTRACT (DAY FROM payment_date)