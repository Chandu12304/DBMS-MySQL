SELECT COUNT(*)  
FROM CUSTOMER  
WHERE Grade > (SELECT AVG(Grade) 
               FROM CUSTOMER 
               WHERE City = 'Bangalore');