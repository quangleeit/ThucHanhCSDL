create database frankylee;
use frankylee;
create table orders(
	orderNumber int (11) NOT NULL,
	orederDate DATETIME NOT NULL,
	requiredDate DATETIME NOT NULL,
	shippedDate DATETIME,
	status varchar (15) NOT NULL,
	comments TEXT,
	customerNumber int (11) NOT NULL,
	PRIMARY KEY (orderNumber)
)  ENGINE=InnoDB DEFAULT CHARSET=utf8;
create table productlines(
	productLine varchar (50) NOT NULL,
	textDescription varchar (4000),
	htmlDescription mediumtext,
	image mediumblob,
	PRIMARY KEY (productLine)
)  ENGINE=InnoDB DEFAULT CHARSET=utf8;
create table orderdetails(
	orderNumber int (11) NOT NULL,
	productCode varchar (15) NOT NULL,
	quantilyOrdered int (11) NOT NULL,
	priceEach double NOT NULL,
	orderLineNumber smallint (6),
	PRIMARY KEY (orderNumber)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create table products(
	productCode varchar (15) NOT NULL,
	productName varchar (70) NOT NULL,
	producLine varchar (50) NOT NULL,
	productScale varchar (10) NOT NULL,
	productVendor varchar (50) NOT NULL,
	productDescription TEXT  NOT NULL,
	quantityInStock smallint (6)  NOT NULL,
	buyPrice double  NOT NULL,
	PRIMARY KEY (productCode)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
Describe orders;
Describe productlines;
Describe orderdetails;
Describe products;

alter table orderdetails add 
	constraint orderNumber foreign key (orderNumber) 
	references orders(orderNumber) on delete restrict on update cascade;
alter table orderdetails add constraint productCode foreign key (productCode)
	references products (productCode) on delete restrict on update cascade;
alter table products add constraint productLine foreign key (productLine)
	references productlines(productLine) on delete restrict on update cascade;