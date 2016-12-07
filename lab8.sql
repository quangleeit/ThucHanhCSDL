-- cau1
-- truy van con
SELECT (SELECT productName FROM products p WHERE p.productCode = od.productCode) AS productName, 
(SELECT orderDate FROM orders o WHERE o.orderNumber = od.orderNumber) AS orderDate 
FROM orderdetails od HAVING month(orderDate) = 3 and year(orderDate) = 2005;

-- su dung inner join
SELECT productName, orderDate
FROM products p 
INNER JOIN orderdetails od ON p.productCode = od.productCode
INNER JOIN orders o ON od.orderNumber = o.orderNumber
WHERE month(orderDate) = 3 AND year(orderdate) = 2005;

-- cau2
SELECT * FROM orders
WHERE orderDate = (SELECT MAX(orderDate) FROM orders);

-- cau 3
-- truy van con
SELECT *,
  (SELECT SUM(quantityOrdered * priceEach) 
    FROM orderdetails 
    WHERE orderNumber = o.orderNumber
  ) AS total
FROM orders AS o;

-- inner join
SELECT *, sum(quantityOrdered * priceEach) as total
FROM orders o
INNER JOIN orderdetails od where o.orderNumber = od.orderNumber
GROUP BY o.orderNumber;

-- cau 4
SELECT customerName, 
  (select sum(quantityOrdered * priceEach) 
	  from orderdetails od inner 
	  join orders o on o.orderNumber = od.orderNumber 
	  where c.customerNumber = o.customerNumber ) as totalOrdered,
	(select sum(amount) 
	  from payments p 
	  where p.customerNumber = c.customerNumber) as totalPayment 
FROM customers c;