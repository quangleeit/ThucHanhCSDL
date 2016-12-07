show databases;
use classicmodels;

select city, count(customerNumber) total
from customers
Group by city;

select count(orderNumber) total
from orders
where  YEAR(orderDate) = "2005" and MONTH(orderDate) = "3";

select  MONTH(orderDate) as month, count(orderNumber) total from orders where YEAR(orderDate) = "2005"
group by month;

select orderNumber, sum(quantityOrdered * priceEach) as highest_price
from orderdetails
group by orderNumber order by highest_price desc limit 10;


select productLine, count(quantityInStock) total from products
group by productLine;

