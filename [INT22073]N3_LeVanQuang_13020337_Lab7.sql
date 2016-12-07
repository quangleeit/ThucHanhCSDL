USE classicmodels;
/*
Ten nhan vien + ten cong ty
*/
SELECT CONCAT(e.firstName, ' ', e.lastName) as fullName, o.territory FROM employees e INNER JOIN offices o ON e.officeCode = o.officeCode;
/*
In ra ten khach hang va cac san pham
*/	
SELECT c.customerName, p.productName
FROM customers c
INNER JOIN orders o ON c.customerNumber = o.customerNumber
INNER JOIN orderdetails od ON o.orderNumber = od.orderNumber
INNER JOIN products p ON p.productCode = od.productCode
ORDER BY c.customerName;
/*
Thong tin ve cac mat hang chua co ai dat mua
*/
SELECT O.*
FROM products O
LEFT JOIN orderdetails P on O.productCode = P.productCode
WHERE orderNumber is NULL
/*
Don hang trong thang 3/2005 va tong gia tri don hang
*/
SELECT O.orderDate, O.requiredDate, O.status, SUM(P.priceEach * P.quantityOrdered) as TongGiaTri
FROM orders O
INNER JOIN orderdetails P ON O.orderNumber = P.orderNumber
WHERE MONTH(O.orderDate) = 3 AND YEAR(O.orderDate) = 2005
GROUP BY P.orderNumber
/*
Cau 5
*/
SELECT O.*, COUNT(*) AS SoLuong
FROM productLines O
INNER JOIN products P ON O.productLine = P.productLine
GROUP BY P.productLine
ORDER BY SoLuong DESC