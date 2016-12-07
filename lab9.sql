
-- BAI 1
-- products
INSERT INTO 
	classicmodels.products(
		productCode, 
		productName, 
		productLine, 
		productScale, 
		productVendor, 
		productDescription, 
		quantityInStock, 
		buyPrice, 
		MSRP)
	VALUES (
		'S11_1347', 
		'2016 Lambogini Aventador', 
		'Classic Cars', 
		'1:11', 
		'Fast Car Ever', 
		'This is fast car in N4S 2015', 
		'121', 
		'500.000', 
		'98.6');

UPDATE products
SET productName = '2015 Lambogini'
WHERE productCode = 'S11_1347'; 

DELETE
FROM products
WHERE productScale = '1:11';

-- orders
INSERT INTO 
	orders(
		orderNumber, 
		orderDate, 
		requiredDate, 
		shippedDate, 
		status, 
		comments, 
		customerNumber) 
	VALUES (
		10450, 
		"2005-6-1", 
		"2005-6-30", 
		"2005-6-20", 
		"In Process", 
		NULL, 
		103
	);

UPDATE orders
	SET shippedDate = "2005-06-19"
	WHERE orderNumber = 10450;

DELETE 
	FROM orders
	WHERE orderNumber = 10450;

-- orderdetails
INSERT INTO 
	orderdetails(
		orderNumber,
		productCode,
		quantityOrdered,
		priceEach,
		orderLineNumber
	)
	VALUES(
		10424,
		"S10_1678",
		200,
		30,
		3
	);

UPDATE orderdetails
	SET quantityOrdered = 133
	WHERE orderNumber = 10424;

DELETE
	FROM orderdetails
	WHERE orderNumber = 10424;	

-- BAI 2
CREATE TABLE if NOT EXISTS temp_orderdetails ( 
	orderNumber INT(11), 
	productCode Varchar(15), 
	quantityOrdered INT(11), 
	priceEach Double, 
	orderLineNumber SMALLINT(6) 
	Primary
);

INSERT INTO temp_orderdetails
	SELECT od.* FROM orderdetails od 
		LEFT JOIN orders o 
		ON od.orderNumber = o.orderNumber
		WHERE orderDate = (SELECT MAX(orderDate) FROM orders);

-- BAI 3
UPDATE employees 
	SET jobTitle = "Sales Representative"
	WHERE jobTitle = "Sales Rep";-