SELECT E.Name
FROM EMPLOYEE E
WHERE NOT EXISTS (
    SELECT P.PNo
    FROM PROJECT P
    WHERE P.DNo = 5
    AND P.PNo NOT IN (
        SELECT W.PNo
        FROM WORKS_ON W
        WHERE W.SSN = E.SSN
    )
);
