SELECT W.PNo
FROM WORKS_ON W
JOIN EMPLOYEE E ON W.SSN = E.SSN
WHERE E.Name LIKE '%Scott'