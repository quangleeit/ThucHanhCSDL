show databases;
use classicmodels;

select *
from customers
where city IN ('Nastes', 'Lyon');

select *
from orders
where shippedDate between "2003/01/10" and "2003/03/10";

select *
from products
where productLine like '%cars%';

select productLine
from products
Order By quantityInStock DESC limit 10;

select (buyPrice*quantityInStock) as Tienhangton from Products ;
