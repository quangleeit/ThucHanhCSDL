
/*1. Đưa ra tên các thành phố và số lượng khách hàng tại từng thành phố.
2. Đưa ra số lượng các đơn đặt hàng trong tháng 3/2005.
3. Đưa ra 10 mã đơn đặt hàng có giá trị lớn nhất.
4. Đưa ra mã nhóm hàng và tổng số lượng hàng hoá còn trong kho của nhóm hàng
đó.
5. Đưa ra mã khách hàng và tổng số tiền khách đã đó trả. */

SELECT city, COUNT(*) FROM customers GROUP By city;

SELECT COUNT(*) FROM orders WHERE MONTH(orderDate) = "03" and Year(orderDate) = "2005";

SELECT orderNumber, sum(quantityOrdered * priceEach) as Total 
from orderdetails GROUP BY orderNumber Order BY Total DESC Limit 10;


SELECT productLine, sum(quantityInStock) as total from products GROUP BY productLine;

SELECT customerNumber, sum(amount) from payments GROUP by customerNumber;