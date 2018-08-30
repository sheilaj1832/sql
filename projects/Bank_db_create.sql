
INSERT INTO Accounts VALUES
(50, 'Donald Trump', 77778885, 0);

insert into Accounts (account_holder, balance, fees)
  VALUES ('Dave Grohl', 2450000, 0);
  
INSERT INTO Accounts VALUES
(52, 'Wonder Woman', 500000, 0),
(54, 'Green Lantern', 400000, 0),
(55, 'Batman', 450000, 0),
(57, 'Cat Woman', 600000, 15),
(60, 'Supergirl', 575000, 20),
(61, 'The Joker', 320000, 50);

insert into Accounts (account_holder, balance, fees) Values 
 ('Spiderman', 780000, 0);
 
update Accounts
set fees = 100
where balance < 500000;

 -- updating an account_holder name 
update accounts
   Set account_holder = 'Donald J Trump'
   where ID = 50;

select * from accounts
 where fees > 0;

update accounts
   set fees = 0;
   
update accounts
  set fees = 100
  where balance <= 100000;
  
delete from accounts
  where ID = 52;
  
-- wildcard statements looking for a string '%A' will find the file in the field;  '% B' would pick up last names with the space B
  select * from accounts
  where account_holder like '% B'
  
  
-- select statement with a regular expression looking for naames that start with a vowel.
-- select *from accounts 

select (distinct)balance



   
   
   
   
  
   