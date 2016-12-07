show databases;

use classicmodels;

select substring(productDescription, 1, 50 ) as "Title of products" from products;

select concat(firstName, " ", lastname, ", ", jobTitle)
employeesDescription
from employees; 

update productlines set productLine = replace(productLine, 'Cars', 'Automobiles');
select productLine from products;

select datediff(requiredDate, shippedDate) as sapxep from orders where shippedDate is not NULL order by sapxep ASC limit 5;

select * from orders where '2005-5-1' <=orderDate<= '2005-5-31' and shippedDate is NULL;