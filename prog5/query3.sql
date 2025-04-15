SELECT  
    SUM(E.Salary) AS Total_Salary,  
    MAX(E.Salary) AS Max_Salary,  
    MIN(E.Salary) AS Min_Salary,  
    AVG(E.Salary) AS Avg_Salary
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.DNo = D.DNo
WHERE D.DName = 'Accounts';