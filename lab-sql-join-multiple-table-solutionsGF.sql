
-- 1. Write a query to display for each store its store ID, city, and country.

select store_id, city, country from store
join address using(address_id)
join city using(city_id)
join country using(country_id);

-- 2. Write a query to display how much business, in dollars, each store brought in.

select store_id, sum(amount) from store
join customer using(store_id)
join payment using(customer_id)
group by store_id;

-- 3. What is the average running time of films by category?

select name, avg(length) from category
join film_category using(category_id)
join film using(film_id)
group by name;

-- 4. Which film categories are longest?

select name, avg(length) from category
join film_category using(category_id)
join film using(film_id)
group by name
order by avg(length) desc
limit 3;


-- 5. Display the most frequently rented movies in descending order.

select title, count(rental_id) from film
join inventory using(film_id)
join rental using(inventory_id)
group by title
order by count(rental_id) desc
limit 10;

-- 6. List the top five genres in gross revenue in descending order.

select name, sum(amount) from category
join film_category using(category_id)
join film using(film_id)
join inventory using(film_id)
join rental using(inventory_id)
join payment using(rental_id)
group by name
order by sum(amount) desc
limit 5;

-- 7. Is "Academy Dinosaur" available for rent from Store 1?

select title, count(inventory_id) from film
join inventory using(film_id)
join store using(store_id)
where store_id=1 and title='Academy Dinosaur'
group by title;

