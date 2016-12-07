USE classicmodels;


/*in ra cac mat hang 3/2005*/
SELECT 
  (SELECT productName FROM products p WHERE p.productCode = od.productCode) AS productName, 
  (SELECT orderDate FROM orders o WHERE o.orderNumber = od.orderNumber) AS orderDate
FROM orderdetails od
HAVING month(orderDate) = 3 and year(orderDate) = 2005;

/*tuong tu cau 1 nhung dung join*/
SELECT productName, orderDate
FROM products p 
INNER JOIN orderdetails od ON p.productCode = od.productCode
INNER JOIN orders o ON od.orderNumber = o.orderNumber
WHERE month(orderDate) = 3 AND year(orderdate) = 2005;

/*dua ra cac mat hang trong thang gan nhat*/
SELECT * 
FROM orders
WHERE orderDate = (SELECT MAX(orderDate) 
                      FROM orders);

/*thong tin ve cac don hang va tong gia tri*/
SELECT *,
  (SELECT SUM(quantityOrdered * priceEach) 
    FROM orderdetails 
    WHERE orderNumber = o.orderNumber
  ) AS total
FROM orders AS o;

/*nhu cau tren dung phep noi*/
SELECT *, sum(quantityOrdered * priceEach) as total
FROM orders o
INNER JOIN orderdetails od where o.orderNumber = od.orderNumber
GROUP BY o.orderNumber;

/*voi moi khach hang dua ra tong so tien hang va tong so tien ho da thanh toan*/
SELECT customerName, 
  (select sum(quantityOrdered * priceEach) 
	  from orderdetails od inner 
	  join orders o on o.orderNumber = od.orderNumber 
	  where c.customerNumber = o.customerNumber ) as totalOrdered,
	(select sum(amount) 
	  from payments p 
	  where p.customerNumber = c.customerNumber) as totalPayment 
FROM customers c;