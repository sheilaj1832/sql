-- create and select the database
DROP DATABASE IF EXISTS textbooks;
CREATE DATABASE textbooks;
USE textbooks;

-- create the Product table
CREATE TABLE Product (
  ProductID	    INT            PRIMARY KEY  AUTO_INCREMENT,
  Textbook      VARCHAR(30)    NOT NULL,
  Price	        DECIMAL(10,2)  NOT NULL
);

-- create the Buyer Information table
CREATE TABLE BuyerInformation (
  BuyerID		INT            PRIMARY KEY  AUTO_INCREMENT,
  Textbook      VARCHAR(30)    NOT NULL,
  Buyer	        VARCHAR(50)    NOT NULL
);

CREATE TABLE Invoice (
  InvoiceID		INT              PRIMARY KEY  AUTO_INCREMENT,
  Textbook      VARCHAR(30)      NOT NULL,
  OrderNumber	INT              NOT NULL
);

-- insert some rows into the Product table
INSERT INTO Product VALUES
(1, 'Fluid Dynamics', 250),
(2, 'Thermodynamics', 300),
(3, 'Calculus 3', 185);

INSERT INTO BuyerInformation VALUES
(1, 'Thermodynamics', 'Rachel Baumann'),
(2, 'Thermodynamics', 'John Falconer'),
(3, 'Calculus 3', 'Neil Hendren'),
(4, 'Fluid Dynamics', 'Tim Brown');

INSERT INTO Invoice VALUES
(1, 'Fluid Dynamics', 123),
(2, 'Thermodynamics', 456),
(3, 'Fluid Dynamics', 789),
(4, 'Thermodynamics', 801);



select ProductID, pdt.textbook, price, BuyerID, bi.textbook, buyer
  from
   Product pdt
      inner join
    BuyerInformation bi
	on pdt.textbook = bi.textbook;
    -- aligns the columns from both columns.

select BuyerID, bi.textbook, buyer, InvoiceID, inv.Textbook, OrderNumber
  from
   BuyerInformation bi
      inner join
    Invoice inv
	on bi.textbook = inv.textbook;
    -- aligns the columns from both columns.