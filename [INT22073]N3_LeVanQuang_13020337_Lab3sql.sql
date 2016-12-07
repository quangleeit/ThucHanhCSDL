show databases;
use classicmodels;

select * from employees;

select * from customers;

select * from payments;

select customerNumber from customer where customerNumber is not null;
select orderNumber from Orders where requiredDate ="2003/01/18";


select orderNumber from Orders where YEAR(orderDate) = "2005" and MONTH(orderDate) = "4" and status ="Shipped";
select * from Products where productLine = "Classic Cars";