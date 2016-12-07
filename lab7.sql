/*
1. Đưa ra thông tin về các nhân viên và tên văn phòng nơi họ làm việc.
2. Đưa ra thông tin về các mặt hàng chưa có ai đặt mua.
3. Đưa ra thông tin về các đơn hàng trong tháng 3/2003 (gồm orderDate,
requiredDate, Status) và tổng giá trị của đơn hàng.
4. Đưa ra thông tin về các dòng sản phẩm và số lượng sản phẩm của dòng sản phẩm
đó. Sắp xếp theo thứ tự số lượng giảm dần.
5. Đưa ra tên khách hàng và số tiền hàng họ đã mua */
-- cau 1
SELECT employees.employeeNumber, employees.lastName, employees.firstName, offices.* 
FROM employees INNER JOIN offices ON employees.officeCode = offices.officeCode;

-- cau 2
SELECT p.productCode, productName, o.quantityOrdered
FROM products p
LEFT JOIN orderdetails o ON p.productCode = o.productCode
WHERE orderNumber is NULL;

-- cau 3
SELECT orders.orderNumber, orders.orderDate, orders.requiredDate, orders.status, 
SUM(orderdetails.quantityOrdered * orderdetails.priceEach) as totalPrice 
FROM orders INNER JOIN orderdetails ON orders.orderNumber = orderdetails.orderNumber
GROUP BY orders.orderNumber;

-- cau 4
SELECT productlines.*, products.quantityInStock as total 
FROM productlines INNER JOIN products 
WHERE productlines.productLine = products.productLine 
GROUP BY total DESC;

-- cau 5
SELECT customers.customerName, orders.orderNumber, SUM(orderdetails.quantityOrdered*orderdetails.priceEach) as totalMoney 
FROM customers 
INNER JOIN orders ON customers.customerNumber = orders.customerNumber 
INNER JOIN orderdetails ON orders.orderNumber = orderdetails.orderNumber 
GROUP BY orders.orderNumber;