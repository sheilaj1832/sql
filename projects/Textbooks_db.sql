-- create and select the database
DROP DATABASE IF EXISTS sample;
CREATE DATABASE sample;
USE sample;

-- create the Product table
CREATE TABLE Product (
  ID			INT            PRIMARY KEY  AUTO_INCREMENT,
  Textbook      VARCHAR(30)    NOT NULL,
  Price	        DECIMAL(10,2)  NOT NULL
);

-- create the Buyer Information table
CREATE TABLE BuyerInformation (
  ID			INT            PRIMARY KEY  AUTO_INCREMENT,
  Textbook      VARCHAR(30)    NOT NULL,
  Buyer	        VARCHAR(50)    NOT NULL
);

CREATE TABLE Invoice (
  ID			INT              PRIMARY KEY  AUTO_INCREMENT,
  Textbook      VARCHAR(30)      NOT NULL,
  OrderNumber	INT              AUTO_INCREMENT NOT NULL
);

-- insert some rows into the Product table
INSERT INTO Product VALUES
(1, 'Fluid Dynamics', 250),
(2, 'Thermodynamics', 300),
(3, 'Calculus 3', 185);

INSERT INTO BuyerInformation VALUES
(1, 'Thermodynamics', 'Rachel Baumann'),
(2, 'Thermodynamics', 'John Falconer'),
(3, 'Calculus 3', 'Neil Hendren');

INSERT INTO Invoice VALUES
(1, 'Fluid Dynamics', 123),
(2, 'Thermodynamics', 456),
(3, 'Fluid Dynamics', 789);



select pdt.ID, pdt.textbook, price, bi.id, bi.textbook, buyer
  from
   Product pdt
      inner join
    BuyerInformation bi
	on pdt.textbook = bi.textbook;
    -- aligns the columns from both columns.
    
select bi.ID, bi.Textbook, Buyer, Inv.ID, inv.Textbook, OrderNumber
  from
   BuyerInformation bi
      inner join
    invoice inv 
   on bi.Textbook = inv.Textbook; 
   
  -- 3 joins  
 select OrderNumber, CustomerName, OrderDate, Code, Description, ListPrice, Total
  from
   lineitem li
      inner join
    invoice inv 
      on li.InvoiceID = inv.ID
	  inner join
	Product Pdt
   on li.ProductID = pdt.ID;