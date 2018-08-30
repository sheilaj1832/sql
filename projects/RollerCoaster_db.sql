-- create and select the database
DROP DATABASE IF EXISTS RollerCoaster_db;
CREATE DATABASE RollerCoaster_db;
USE RollerCoaster_db;

-- create the RollerCoaster table
CREATE TABLE Roller_Coaster (
  ID               INT            PRIMARY KEY  AUTO_INCREMENT,
  Roller_Coaster   VARCHAR(20)    NOT NULL,
  Speed_MPH        INT(3)         NOT NULL,
  SpeedRank        INT(10)        NOT NULL
);

-- insert some rows into the RollerCoaster table
INSERT INTO Roller_Coaster VALUES
(1, 'Kingda Ka', 128, 1),
(2, 'Top Thrill Dragster', 120, 2),
(3, 'Superman', 100, 3),
(4, 'Fury 325', 95, 4);

-- create the Location table
CREATE TABLE Location (
  ID               INT            PRIMARY KEY  AUTO_INCREMENT,
  City             VARCHAR(20)    NOT NULL,
  State            VARCHAR(2)     NOT NULL,
  SpeedRank        INT(10)        NOT NULL,
  Foreign Key (SpeedRank) references Roller_Coaster(SpeedRank)
);
-- insert some rows into the Location table
INSERT INTO Location VALUES
(1, 'Charlotte', 'NC', 4),
(2, 'Jackson', 'NJ', 1),
(3, 'Sandusky', 'OH', 2),
(4, 'Valencia', 'CA', 3);
