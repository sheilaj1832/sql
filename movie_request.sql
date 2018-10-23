INSERT into Movie VALUES
  	(13, 'Be Kind Rewind', 2008);

UPDATE Movie
 SET Title = 'Kung Fu Panda 3'
 WHERE ID=3;
 
DELETE from Movie
 WHERE ID =13;

SELECT * from Credits
 WHERE MovieID =8;
    
SELECT FirstName, LastName, Title, CharacterName
 from Credits cr
inner join actor a
 on ActorID = a.ID
inner join movie m
 on MovieID = m.ID;
 
SELECT FirstName, LastName, Title, CharacterName
 from Credits cr
inner join actor a
 on ActorID = a.ID
inner join movie m
 on MovieID = m.ID
 WHERE LastName = 'Stiller';