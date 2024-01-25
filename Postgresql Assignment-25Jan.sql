-- EX-1
-- From Payment find customers ids which have paid amount more than 7.99
	
	select distinct customer_id as cust_id  from payment where amount>7.99;
	
-- EX-2
-- From film table give a list of high value films a)have rental rate more than 2.99 OR 
-- 												   b)replacemnet cost more than 19.99

	select  title as "Movie Name", rental_rate as "Rental Cost",replacement_cost as "Replacement Cost" 
	from film where rental_rate>2.99 or replacement_cost>19.99;

-- Day-3
-- EX-1
	select * from film
	select  title as "Movie Name", rental_rate as "Rental Cost",replacement_cost as "Replacement Cost" 
	,rental_duration as"Rent Duration" from film where rental_duration between 4 and 6 order by replacement_cost Desc  
	limit 100;

-- EX-2
-- 	Movies have either G or PG rating , longer than 120 minutes and should have the word action in description
		select  title as "Movie Name", rating as "Rating Movie",length as "Movie Length",description 
	from film where rating in ('G', 'PG') and length>120 and description like '%Action%';\
	
-- Day-4
-- EX-2
-- select* from actor
	select distinct first_name,count(first_name) from actor group by first_name order by Count(first_name) desc;
-- 	select distinct first_name , count(*) from actor group by first_name order by count desc
	