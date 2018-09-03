-- create and select the database
DROP DATABASE IF EXISTS textbooks;
CREATE DATABASE textbooks;
USE textbooks;

-- create the Product table
CREATE TABLE Product (
  ID	        INT            PRIMARY KEY  AUTO_INCREMENT,
  Textbook      VARCHAR(30)    NOT NULL,
  Price	        DECIMAL(10,2)  NOT NULL
);

-- create the Buyer Information table
CREATE TABLE BuyerInformation (
  BuyerID		INT            PRIMARY KEY  AUTO_INCREMENT,
  Textbook      VARCHAR(30)    NOT NULL,
  Buyer	        VARCHAR(50)    NOT NULL,
  ProductID    INT             NOT NULL,
  
  FOREIGN KEY (ProductID) REFERENCES Product (ID)
);

CREATE TABLE Invoice (
  InvoiceID		INT              PRIMARY KEY  AUTO_INCREMENT,
  Textbook      VARCHAR(30)      NOT NULL,
  OrderNumber	INT              NOT NULL,
  ProductID     INT              NOT NULL,
  
  FOREIGN KEY (ProductID) REFERENCES Product (ID)

);

-- insert some rows into the Product table
INSERT INTO Product VALUES
(1, 'Fluid Dynamics', 250),
(2, 'Thermodynamics', 300),
(3, 'Calculus 3', 185);

INSERT INTO BuyerInformation VALUES
(1, 'Thermodynamics', 'Rachel Baumann', 2),
(2, 'Thermodynamics', 'John Falconer', 2),
(3, 'Calculus 3', 'Neil Hendren', 3);

INSERT INTO Invoice VALUES
(1, 'Fluid Dynamics', 123, 1),
(2, 'Thermodynamics', 456, 2),
(3, 'Fluid Dynamics', 789, 1);


select pdt.ID, pdt.textbook, price, BuyerID, bi.textbook, buyer
  from
   Product pdt
      inner join
    BuyerInformation bi
	on pdt.ID = bi.ProductID;
    -- aligns the columns from both columns.
    



