-- create and select the database
DROP DATABASE IF EXISTS bank_db;
CREATE DATABASE bank_db;
USE bank_db;

-- create the Product table
CREATE TABLE Accounts (
  ID               INT            PRIMARY KEY  AUTO_INCREMENT,
  account_holder   VARCHAR(40)    NOT NULL     UNIQUE,
  balance          DECIMAL(10,2)   NOT NULL,
  fees             DECIMAL(10,2)  NOT NULL
);

-- insert some rows into the Product table
INSERT INTO Accounts VALUES
(1, 'Angie Snyder', 3333, 88),
(2, 'Michael Page', 5444, 175),
(3, 'Rachel Baumann', 8888, 250),
(4, 'Robert Mahoney', 3322, 88);

CREATE TABLE Transactions (
  ID               INT            PRIMARY KEY  AUTO_INCREMENT,
  amount           DECIMAL(10,2)  NOT NULL,
  txn_type         VARCHAR(20)    NOT NULL,
  account_ID       INT            NOT NULL,
  Foreign Key (account_ID) references Accounts(ID)
);

INSERT INTO Transactions VALUES
(1, 500, 'Deposit', 3),
(2, -200, 'Withdrawl', 4),
(3, 200, 'Deposit', 4),
(4, 248, 'Deposit', 1);



