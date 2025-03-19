SELECT S.Salesman_id, S.Name, S.City, 'Has Customers' AS Status  
FROM SALESMAN S  
WHERE EXISTS (  
    SELECT 1 FROM CUSTOMER C  
    WHERE S.Salesman_id = C.Salesman_id  
    AND S.City = C.City  
)  
UNION  
SELECT S.Salesman_id, S.Name, S.City, 'No Customers' AS Status  
FROM SALESMAN S  
WHERE NOT EXISTS (  
    SELECT 1 FROM CUSTOMER C  
    WHERE S.Salesman_id = C.Salesman_id  
    AND S.City = C.City  
);  
