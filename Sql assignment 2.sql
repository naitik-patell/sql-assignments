/* QUE 1*/
select s.name ,c.customer_name,c.city from salesman s
  inner join customer c on s.city=c.city ;

/* QUE 2*/

  select o.ord_no,o.purch_amt,c.customer_name,c.city
   from real_orders as o full outer join customer as c
   on o.customer_id=c.customer_id where o.purch_amt between 500 and 2000 ;

/* QUE 3 write a SQL query to find the salesperson(s) and the customer(s) he represents.
Return Customer Name, city, Salesman, commission*/

select c.customer_name , c.city , s.name , s.commission 
from salesman as s inner join customer as c
on c.salesman_id = s.salesman_id;

/* QUE 4. write a SQL query to find salespeople who received commissions of more than 12
percent from the company. Return Customer Name, customer city, Salesman,
commission.*/

select  c.customer_name ,c.city ,s.name ,s.commission from
salesman as s inner join customer as c on
c.salesman_id=s.salesman_id where s.commission>0.12;

/* QUE 5. write a SQL query to locate those salespeople who do not live in the same city where
their customers live and have received a commission of more than 12% from the
company. Return Customer Name, customer city, Salesman, salesman city,
commission*/select c.customer_name , c.city,s.name,s.city ,s.commissionfrom salesman as s inner join customer as c on c.salesman_id=s.salesman_id where c.city!=s.city and s.commission>0.12;/* QUE 6. write a SQL query to find the details of an order. Return ord_no, ord_date,
purch_amt, Customer Name, grade, Salesman, commission*/select o.ord_no,o.ord_date,o.purch_amt,c.customer_name,c.grade,s.name,s.commissionfrom real_orders as o inner join customer as c on c.customer_id=o.customer_id inner join salesman as s on c.salesman_id =s.salesman_id;/* QUE 7. Write a SQL statement to join the tables salesman, customer and orders so that the
same column of each table appears once and only the relational rows are returned. */select * from salesman as s inner join customer as con s.salesman_id=c.salesman_id inner join real_orders as oon c.customer_id=o.customer_id;SELECT DISTINCT s.*, c.*, o.*
FROM salesman as s
INNER JOIN customer as c
ON s.salesman_id=c.salesman_id
INNER JOIN real_orders as o
ON c.customer_id=o.customer_id;





/* Que 8 .write a SQL query to display the customer name, customer city, grade, salesman,
salesman city. The results should be sorted by ascending customer_id.*/select c.customer_name,c.city,c.grade,s.name,s.city,c.customer_idfrom customer as c inner join salesman as s on c.salesman_id=s.salesman_id order by customer_id ;/* Que 9.write a SQL query to find those customers with a grade less than 300. Return
cust_name, customer city, grade, Salesman, salesmancity. The result should be
ordered by ascending customer_id.*/select c.customer_name,c.city,c.grade,s.name,s.city from customer as c left join salesman as s on c.salesman_id=s.salesman_id where c.grade<300 order by c.customer_id;/* Que 10.Write a SQL statement to make a report with customer name, city, order number,
order date, and order amount in ascending order according to the order date to
determine whether any of the existing customers have placed an order or not*/select c.customer_name,c.city,o.ord_no,o.ord_date,o.purch_amt from customer as c inner join real_orders as o on o.customer_id=c.customer_idorder by o.ord_date;/*SELECT c.customer_name, c.city, o.ord_no, o.ord_date, o.purch_amt
FROM customer AS c
LEFT OUTER JOIN real_orders AS o
ON c.customer_id = o.customer_id
AND c.salesman_id = o.salesman_id
ORDER BY o.ord_date ASC*//* Que 11.Write a SQL statement to generate a report with customer name, city, order number,
order date, order amount, salesperson name, and commission to determine if any of
the existing customers have not placed orders or if they have placed orders through
their salesman or by themselves*/SELECT c.customer_name, c.city, o.ord_no, o.ord_date, o.purch_amt, s.name, s.commission
FROM customer AS c
LEFT OUTER JOIN salesman AS s
ON c.salesman_id = s.salesman_id
LEFT OUTER JOIN real_orders AS o
ON c.customer_id = o.customer_id
AND c.salesman_id = o.salesman_id

/* Que 12.2. Write a SQL statement to generate a list in ascending order of salespersons who
work either for one or more customers or have not yet joined any of the customers*/

SELECT s.name, c.customer_name
FROM customer AS c
RIGHT OUTER JOIN salesman AS s
ON c.salesman_id = s.salesman_id
ORDER BY s.salesman_id

/* Que 13.write a SQL query to list all salespersons along with customer name, city, grade,
order number, date, and amount*/

select c.customer_name,s.city,c.grade, o.ord_no , o.ord_date,o.purch_amt
from salesman as s left outer join customer as c on c.salesman_id=s.salesman_id 
join real_orders as o on o.customer_id=c.customer_id and s.salesman_id=o.salesman_id;


/* Que 14.Write a SQL statement to make a list for the salesmen who either work for one or
more customers or yet to join any of the customers. The customer may have placed,
either one or more orders on or above order amount 2000 and must have a grade, or
he may not have placed any order to the associated supplier*/

select * from
customer as c right outer join salesman as s on s.salesman_id=c.salesman_id
join real_orders as o on o.customer_id=c.customer_id and o.salesman_id=s.salesman_id
where o.purch_amt>2000 and c.grade is NOT NULL;


/* Que 15.Write a SQL statement to make a list for the salesmen who either work for one or
more customers or yet to join any of the customers. The customer may have placed,
either one or more orders on or above order amount 2000 and must have a grade, or
he may not have placed any order to the associated supplier*/

select * from
customer as c right outer join salesman as s on s.salesman_id=c.salesman_id
join real_orders as o on o.customer_id=c.customer_id and o.salesman_id=s.salesman_id
where o.purch_amt>2000 and c.grade is NOT NULL;

/* Que 16.. Write a SQL statement to generate a report with the customer name, city, order no.
order date, purchase amount for only those customers on the list who must have a
grade and placed one or more orders or which order(s) have been placed by the
customer who neither is on the list nor has a grade.*/select c.customer_name,c.city,o.ord_no,o.ord_date,o.purch_amtfrom customer as c full outer join real_orders as o on c.customer_id=o.customer_idwhere c.grade is not null;/* Que 17.. Write a SQL query to combine each row of the salesman table with each row of the
customer table*/select * from salesman cross join customer ;/* Que 18..Write a SQL statement to create a Cartesian product between salesperson and
customer, i.e. each salesperson will appear for all customers and vice versa for that
salesperson who belongs to that city*/select * from salesman cross join customer where salesman.city is not null;/* Que 19Write a SQL statement to create a Cartesian product between salesperson and
customer, i.e. each salesperson will appear for every customer and vice versa for
those salesmen who belong to a city and customers who require a grade*/select * from salesman cross join customer where salesman.city is not null and customer.grade is not null;/* Que 20Write a SQL statement to make a Cartesian product between salesman and
customer i.e. each salesman will appear for all customers and vice versa for those
salesmen who must belong to a city which is not the same as his customer and the
customers should have their own grade*/select * from salesman cross join customer where salesman.city is not null and   salesman.city != customer.city and customer.grade is not null;