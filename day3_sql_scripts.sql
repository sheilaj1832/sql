SELECT *
  FROM product
-- WHERE productID = 5
 WHERE ListPrice = 57.50
   AND code = 'java';

select * from product
 where ListPrice < 55;
 
select * from product
 order by code desc;
 