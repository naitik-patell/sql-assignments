/*Q.1
write a SQL query to find Employees who have the biggest salary in their Department
*/
select * from Employee emp
inner join ( select max(e.dept_id) as id ,max(e.salary) as mxsalary
 from Employee e 
 group by e.dept_id ) dp
on (emp.dept_id=dp.id  and emp.salary = dp.mxsalary)
order by emp.dept_id


/*Q.2
write a SQL query to find Departments that have less than 3 people in it
*/

select d.dept_name from department as d
inner join(select max(e.dept_id) as did, count(e.emp_id)as empno from Employee e group by dept_id) dp
on d.dept_id=dp.did where empno<3


/*Q.3
write a SQL query to find All Department along with the number of people there
*/
select d.dept_name,dp.num_emp from department as d inner join
(select count(e.emp_id) as num_emp,max(e.dept_id) as dept_id from Employee as e group by e.dept_id ) dp 
on dp.dept_id=d.dept_id;

/*Q.4
write a SQL query to find All Department along with the total salary there
*/
select d.dept_name,dp.max_salary from department as d inner join
(select sum(e.salary) as max_salary, max(e.dept_id) as dept_id from employee as e group by e.dept_id)  dp
on dp.dept_id=d.dept_id;