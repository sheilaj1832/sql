-- create and select the database
DROP DATABASE IF EXISTS bmdb;
CREATE DATABASE bmdb;
USE bmdb;

-- create Movie table
-- DROP TABLE IF EXISTS Movie;
Create table bmdb.Movie (
ID integer primary key auto_increment,
Title varchar(255) not null unique,
Year integer not null
-- CONSTRAINT utitle unique (Title)
);

-- create Actor table
-- DROP TABLE IF EXISTS Actor;
Create table bmdb.Actor (
ID integer primary key auto_increment,
FirstName varchar(255) not null,
LastName varchar(255) not null,
Gender varchar(1) not null,
BirthDate date not null,
CONSTRAINT fname_lname unique (FirstName, LastName)
);

-- create Credits table
Create table bmdb.Credits (
ID integer primary key auto_increment,
ActorID integer not null,
MovieID integer not null,
CharacterName varchar(255),

Foreign Key (ActorID) references Actor(ID),
Foreign Key (MovieID) references Movie(ID),
CONSTRAINT act_mov unique (ActorID, MovieID)
);

-- Add some movies
 insert into Movie VALUES
 	(1, 'Revenge of the Nerds', 1984),
 	(2, 'Avengers Infinity War', 2018),
 	(3, 'Kung Fu Panda', 2016),
	(4, 'The Matrix', 1999),
	(5, 'The Little Mermaid', 1989),   
	(6, 'Wonder Woman', 2017),
    (7, 'Night at the Museum', 2006),
    (8, 'Tropic Thunder', 2008),
	(9, 'Zootopia', 2016),
    (10, 'Bruce Almighty', 2003),
    (11, 'Envy', 2004),
    (12, 'Black & White', 1999);   
    
-- Add some movies
 insert into Actor VALUES
 	(1, 'Robert', 'Downey Jr.', 'M', '1965-4-4'),
 	(2, 'Chris', 'Hemsworth', 'M', '1983-09-11'),
    (3, 'Scarlett', 'Johansson', 'F', '1984-11-22'),
 	(4, 'Robert', 'Carradine', 'M', '1954-3-24'),
 	(5, 'Anthony', 'Edwards', 'M', '1962-7-19'),
 	(6, 'Jack', 'Black', 'M', '1969-8-28'),
    (7, 'Keanu', 'Reeves', 'M', '1964-9-2'),
    (8, 'Jodi', 'Benson', 'F', '1961-10-10'),
    (9, 'Gal', 'Gadot', 'F', '1983-4-30'),
    (10, 'Robin', 'Wright', 'F', '1966-4-8'),  
	(11, 'Ben', 'Stiller', 'M', '1965-11-30'),
	(12, 'Matthew', 'McConaughey', 'M', '1969-11-4'),  
 	(13, 'Jason', 'Bateman', 'M', '1969-1-14'), 
    (14, 'Jim', 'Carrey', 'M', '1962-1-17'),
    (15, 'Morgan', 'Freeman', 'M', '1937-6-1');
    
-- Add movie credits for actors
 insert into Credits (ActorID, MovieID, CharacterName) VALUES
 	(1, 2, 'Tony Stark - Iron Man'),
    (2, 2, 'Thor'),
    (3, 2, 'Natasha Romanoff - Black Widow'),
    (4, 1, 'Lewis'),
    (5, 1, 'Gilbert'),
	(6, 3, 'Po'),
	(7, 4, 'Neo'),
    (8, 5, 'Ariel'),
	(9, 6, 'Diana'),
	(10, 6, 'Antiope'),    
	(11, 7, 'Larry Daley'),       
	(11, 8, 'Tugg Speedman'),
   	(1, 8, 'Jeff Portnoy'), 
   	(6, 8, 'Kirk Lazarus'), 
    (12, 8, 'Rick "Pecker" Peck'),
	(13, 9, 'Nick Wilde'),
	(14, 10, 'Bruce'),
	(15, 10, 'God'),
    (11, 11, 'Tim Dingman'),
    (6, 11, 'Nick Vanderpark'),
	(11, 12, 'Mark Clear'),
    (1, 12, 'Terry Donager');  

-- create a user and grant privileges to that user
CREATE USER bmdb_user@localhost IDENTIFIED BY 'sesame';
GRANT SELECT, INSERT, DELETE, UPDATE ON bmdb.* TO bmdb_user@localhost;