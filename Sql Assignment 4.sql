/*Que.1
-----------------------------------------------------------------------------------------------------------------------
1. Create a stored procedure in the Northwind database that will calculate the average
value of Freight for a specified customer.Then, a business rule will be added that will
be triggered before every Update and Insert command in the Orders controller,and
will use the stored procedure to verify that the Freight does not exceed the average
freight. If it does, a message will be displayed and the command will be cancelled.
*/


select AVG(o.Freight),o.CustomerID,c.CustomerName from Orders as o join
Customer as c on o.CustomerID=c.customer_id where  c.customer_id=ALFKI;



/*QUe.2
write a SQL query to Create Stored procedure in the Northwind database to retrieve
Employee Sales by Country
*/
Alter PROCEDURE SpEmpSalesByCountry 
@Country nvarchar(20)
AS
BEGIN
	SELECT SUM(OD.UnitPrice*OD.Quantity*(1-OD.Discount)) AS Sales, @Country as country
	FROM Employees 	E
	JOIN Orders O
	ON E.EmployeeID = O.EmployeeID
	JOIN [Order Details] OD
	ON O.OrderID = OD.OrderID
	where E.Country=@Country
	
END

SpEmpSalesByCountry 'Usa'

/*Que 3
write a SQL query to Create Stored procedure in the Northwind database to retrieve
Sales by Year
*/
CREATE  PROCEDURE SpSalesByYear
@year int
AS
Begin

	select sum(OD.UnitPrice*OD.Quantity*(1-OD.Discount)) AS Sales ,@year as year
	FROM Orders o join [Order Details] od 
	on o.OrderID=od.OrderID
	where year(o.OrderDate)=@year
	
End

SpSalesByYear 1996

/*QUE 4
write a SQL query to Create Stored procedure in the Northwind database to retrieve
Sales By Category*/

Create PROCEDURE SpSalesByCategory
@CategoryName nvarchar(15)
AS

Begin
	select sum(OD.UnitPrice*OD.Quantity*(1-OD.Discount)) AS Sales,@CategoryName as CategoryName
	from [Order Details] od join Products as p
	on p.ProductID=od.ProductID join Categories as c 
	on c.CategoryID=p.CategoryID where c.CategoryName=@CategoryName
End

SpSalesByCategory 'beverages'

/*QUE 5
write a SQL query to Create Stored procedure in the Northwind database to retrieve
Ten Most Expensive Products*/
CREATE PROCEDURE SpTenExpensiveProducts
AS
BEGIN
select top 10  p.ProductName,p.ProductID,p.UnitPrice from Products as p
order by UnitPrice desc 
END

/*QUE 6
write a SQL query to Create Stored procedure in the Northwind database to insert
Customer Order Details */
Alter PROCEDURE SpInsertIntoOrders
@CustomerID nchar(5),
@EmployeeID int,
@OrderDate datetime,
@RequiredDate datetime,
@ShippedDate datetime,
@ShipVia int,
@Freight money,
@ShipName nvarchar(40),
@ShipAddress nvarchar(60),
@ShipCity nvarchar(15),
@ShipRegion nvarchar(15),
@ShipPostalCode nvarchar(10),
@ShipCountry nvarchar(15)
AS
Begin
insert "Orders" ("CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
values (@CustomerID,@EmployeeID,@OrderDate,@RequiredDate,@ShippedDate,@ShipVia,@Freight,@ShipName,@ShipAddress,@ShipCity,@ShipRegion,@ShipPostalCode,@ShipCountry);
end


Execute SpInsertIntoOrders "ALFKI",3,"2002-3-5","2002-3-10",NULL,NULL,250,"Private Jet","house at antilia","Mumbai",NULL,"123456","India"
/*QUE 7
write a SQL query to Create Stored procedure in the Northwind database to update
Customer Order Details 
*/

CREATE PROCEDURE SpUpdateIntoOrders
@OrderID int,

@ShippedDate datetime,
@Freight money

AS
Begin
	Update Orders set ShippedDate=@ShippedDate,Freight=@Freight where OrderID=@OrderID;

end


SpUpdateIntoOrders 11081,"2002-03-15",65

