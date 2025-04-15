SELECT DISTINCT S.salesman_id, S.Name
FROM salesman S
JOIN customer C ON S.salesman_id = C.salesman_id
GROUP BY S.salesman_id, S.Name
HAVING COUNT(C.customer_id) > 1;
