-- ROLLUP of amount made per year, month, day
-- use ROLLUP and EXTRACT YEAR, MONTH, DAY from payment_date
-- payment, rental

SELECT
	EXTRACT (YEAR FROM payment_date) y,
    EXTRACT (MONTH FROM payment_date) M,
    EXTRACT (DAY FROM payment_date) d,
    SUM (amount)
FROM
	payment
-- INNER JOIN
-- 	rental
-- ON
-- 	rental.rental_id = payment.rental_id
GROUP BY
	ROLLUP (
		EXTRACT (YEAR FROM payment_date),
    	EXTRACT (MONTH FROM payment_date),
    	EXTRACT (DAY FROM payment_date)
      )