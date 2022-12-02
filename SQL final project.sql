
CREATE TABLE `customers` (
  `customerNumber` int NOT NULL,
  `customerName` varchar(50) NOT NULL,
  `contactLastName` varchar(50) NOT NULL,
  `contactFirstName` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `addressLine1` varchar(50) NOT NULL,
  `addressLine2` varchar(50) DEFAULT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) DEFAULT NULL,
  `postalCode` varchar(15) DEFAULT NULL,
  `country` varchar(50) NOT NULL,
  `salesRepEmployeeNumber` int DEFAULT NULL,
  `creditLimit` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`customerNumber`),
  KEY `salesRepEmployeeNumber` (`salesRepEmployeeNumber`),
  CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`salesRepEmployeeNumber`) REFERENCES `employees` (`employeeNumber`)
) 

CREATE TABLE `employees` (
  `employeeNumber` int NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `extension` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `officeCode` varchar(10) NOT NULL,
  `reportsTo` int DEFAULT NULL,
  `jobTitle` varchar(50) NOT NULL,
  PRIMARY KEY (`employeeNumber`),
  KEY `reportsTo` (`reportsTo`),
  KEY `officeCode` (`officeCode`),
  CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`reportsTo`) REFERENCES `employees` (`employeeNumber`),
  CONSTRAINT `employees_ibfk_2` FOREIGN KEY (`officeCode`) REFERENCES `offices` (`officeCode`)
) 

CREATE TABLE `offices` (
  `officeCode` varchar(10) NOT NULL,
  `city` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `addressLine1` varchar(50) NOT NULL,
  `addressLine2` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `country` varchar(50) NOT NULL,
  `postalCode` varchar(15) NOT NULL,
  `territory` varchar(10) NOT NULL,
  PRIMARY KEY (`officeCode`)
) 

CREATE TABLE `orderdetails` (
  `orderNumber` int NOT NULL,
  `productCode` varchar(15) NOT NULL,
  `quantityOrdered` int NOT NULL,
  `priceEach` decimal(10,2) NOT NULL,
  `orderLineNumber` smallint NOT NULL,
  PRIMARY KEY (`orderNumber`,`productCode`),
  KEY `productCode` (`productCode`),
  CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`orderNumber`) REFERENCES `orders` (`orderNumber`),
  CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`productCode`) REFERENCES `products` (`productCode`)
) 

CREATE TABLE `orders` (
  `orderNumber` int NOT NULL,
  `orderDate` date NOT NULL,
  `requiredDate` date NOT NULL,
  `shippedDate` date DEFAULT NULL,
  `status` varchar(15) NOT NULL,
  `comments` text,
  `customerNumber` int NOT NULL,
  PRIMARY KEY (`orderNumber`),
  KEY `customerNumber` (`customerNumber`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customerNumber`) REFERENCES `customers` (`customerNumber`)
) 

CREATE TABLE `payments` (
  `customerNumber` int NOT NULL,
  `checkNumber` varchar(50) NOT NULL,
  `paymentDate` date NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`customerNumber`,`checkNumber`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`customerNumber`) REFERENCES `customers` (`customerNumber`)
) 

CREATE TABLE `productlines` (
  `productLine` varchar(50) NOT NULL,
  `textDescription` varchar(4000) DEFAULT NULL,
  `htmlDescription` mediumtext,
  `image` mediumblob,
  PRIMARY KEY (`productLine`)
) 

CREATE TABLE `products` (
  `productCode` varchar(15) NOT NULL,
  `productName` varchar(70) NOT NULL,
  `productLine` varchar(50) NOT NULL,
  `productScale` varchar(10) NOT NULL,
  `productVendor` varchar(50) NOT NULL,
  `productDescription` text NOT NULL,
  `quantityInStock` smallint NOT NULL,
  `buyPrice` decimal(10,2) NOT NULL,
  `MSRP` decimal(10,2) NOT NULL,
  PRIMARY KEY (`productCode`),
  KEY `productLine` (`productLine`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`productLine`) REFERENCES `productlines` (`productLine`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `my_table`;

CREATE TABLE `my_table` (
  `id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `height` int DEFAULT NULL,
  `weight` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `behaviors` (
  `Impression ID` int NOT NULL,
  `User ID` text,
  `Date` text,
  `News1` text,
  `Impression_News1` int DEFAULT NULL,
  `News2` text,
  `Impression_News2` int DEFAULT NULL,
  `News3` text,
  `Impression_News3` int DEFAULT NULL,
  PRIMARY KEY (`Impression ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `news` (
  `News_ID` varchar(10) NOT NULL,
  `Category` text,
  `Subcategory` text,
  `Title` text,
  `Abstract` text,
  `URL` text,
  `Title Entities` json DEFAULT NULL,
  `Abstract Entities` json DEFAULT NULL,
  PRIMARY KEY (`News_ID`)
) 

CREATE TABLE `course` (
  `course_Id` int NOT NULL,
  `course_Name` varchar(45) DEFAULT NULL,
  `course_credit` int DEFAULT NULL,
  `course_prerequisite` int DEFAULT NULL,
  PRIMARY KEY (`course_Id`)
) 


CREATE TABLE `sys_config` (
  `variable` varchar(128) NOT NULL,
  `value` varchar(128) DEFAULT NULL,
  `set_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `set_by` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`variable`)
) 
CREATE TABLE `customer` (
  `Customer_Id` int NOT NULL,
  `Customer_Name` varchar(50) DEFAULT NULL,
  `Customer_age` int DEFAULT NULL,
  `Customer_gender` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Customer_Id`)
) 
CREATE TABLE `new_table` (
  `id` int NOT NULL,
  `age` int DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) 
CREATE TABLE `course` (
  `course_Id` int NOT NULL,
  `course_Name` varchar(100) DEFAULT NULL,
  `ECTS` int DEFAULT NULL,
  PRIMARY KEY (`course_Id`)
) 
CREATE TABLE `student` (
  `Std_Id` int NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `course_Id` int DEFAULT NULL,
  PRIMARY KEY (`Std_Id`)
) 
CREATE TABLE `student2` (
  `Std_Id` int NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `course_Id` int DEFAULT NULL,
  PRIMARY KEY (`Std_Id`)
) 
