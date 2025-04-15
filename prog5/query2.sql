SELECT E.Name, E.Salary AS Current_Salary, E.Salary * 1.10 AS New_Salary
FROM EMPLOYEE E
JOIN WORKS_ON W ON E.SSN = W.SSN
JOIN PROJECT P ON W.PNo = P.PNo
WHERE P.PName = 'IoT';