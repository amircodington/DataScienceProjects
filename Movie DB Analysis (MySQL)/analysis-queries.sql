-- Question 1 --
SELECT 
	staff.first_name 	AS 'first name',
    staff.last_name  	AS 'last name',
    address.address  	AS 'street address',
    address.district 	AS 'district',
    city.city 			AS 'city',
    country.country 	AS 'country'
FROM store
	LEFT JOIN staff ON store.manager_staff_id = staff.staff_id
	LEFT JOIN address ON staff.address_id = address.address_id
	LEFT JOIN city ON address.city_id = city.city_id
	LEFT JOIN country ON city.country_id = country.country_id;

-- Question 2 --
SELECT
	inventory.inventory_id 	AS 'inventory id',
    inventory.store_id 		AS 'store_id',
    film.title 				AS 'film title',
    film.rating 			AS 'film rating',
    film.rental_rate 		AS 'rental rate',
    film.replacement_cost 	AS 'replacement cost'

FROM inventory
	LEFT JOIN film ON inventory.film_id = film.film_id;
		
-- Question 3 --
SELECT
    film.rating 				AS 'raiting',
    inventory.store_id 			AS 'store',
    COUNT(inventory.film_id) 	AS 'count of inventory'

FROM inventory
	INNER JOIN film ON inventory.film_id = film.film_id

GROUP BY
	film.rating,
	inventory.store_id;

-- Question 4 --
SELECT
	COUNT(inventory.film_id) 	AS 'number of films',
    AVG(film.replacement_cost) 	AS 'average replacement cost',
    SUM(film.replacement_cost)	AS 'total replacement cost',
    inventory.store_id 			AS 'store',
    category.name 				AS 'category'

FROM film
	LEFT JOIN inventory ON film.film_id = inventory.film_id
	LEFT JOIN film_category ON film.film_id = film_category.film_id
	LEFT JOIN category ON film_category.category_id = category.category_id

GROUP BY
	inventory.store_id,
    category.name

ORDER BY
	SUM(film.replacement_cost) DESC;

-- Question 5 --
SELECT
	customer.first_name  	AS 'first name',
    customer.last_name   	AS 'last name',
    customer.store_id		AS 'store',
    customer.active 		AS 'active',
    address.address 		AS 'streat address',
    city.city 				AS 'city',
    country.country 		AS 'country'
FROM customer
	LEFT JOIN address ON customer.address_id = address.address_id
	LEFT JOIN city ON address.city_id = city.city_id
	LEFT JOIN country ON city.country_id = country.country_id;

-- Question 6 --
SELECT 
	customer.first_name 	AS 'first name',
    customer.last_name 		AS 'last name',
    COUNT(rental.rental_id) AS 'total rentals',
    SUM(payment.amount)		AS 'sum of all payments'
    
FROM customer
	LEFT JOIN payment ON customer.customer_id = payment.customer_id
	LEFT JOIN rental ON payment.rental_id = rental.rental_id

GROUP BY
	customer.customer_id

ORDER BY
	SUM(payment.amount) DESC;

-- Question 7 --
SELECT
	'investor' 	AS 'Type',
    first_name 	AS 'First name',
    last_name	AS 'last name',
    company_name 		AS 'Copmany name'
FROM investor

UNION

SELECT
	'advisor' 	AS 'Type',
    first_name 	AS 'First name',
    last_name	AS 'last name',
    NULL
FROM advisor;


-- Question 8 --
SELECT
	CASE
		WHEN awards LIKE '%Emmy, Oscar, Tony%' THEN '3 type award'
        WHEN awards LIKE '%Emmy, Oscar%' THEN '2 type award'
        ELSE '1 type award'
	END AS 'Number of awards',
    AVG(
		CASE
			WHEN actor_id IS NULL THEN 0 ELSE 1 
		END
	) AS 'percent'
FROM actor_award

GROUP BY
	CASE
		WHEN awards LIKE '%Emmy, Oscar, Tony%' THEN '3 type award'
        WHEN awards LIKE '%Emmy, Oscar%' THEN '2 type award'
        ELSE '1 type award'
	END







