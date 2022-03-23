-- the average rental amount by country
-- include the country name and avg amount
-- use AVG to average the amount

-- country, city, address, customer, payment

SELECT
    country.country,
    AVG(amount)
FROM 
	country
INNER JOIN
	city
ON
	country.country_id = city.country_id
INNER JOIN
	address
ON
	city.city_id = address.city_id
INNER JOIN
	customer
ON
	address.address_id = customer.address_id
INNER JOIN
	payment
ON 
	customer.customer_id = payment.customer_id
GROUP BY 
	country.country
ORDER BY
	AVG DESC
LIMIT 10



