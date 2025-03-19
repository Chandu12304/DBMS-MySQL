SELECT 
    SUM(Salary) AS Total_Salary, 
    MAX(Salary) AS Max_Salary, 
    MIN(Salary) AS Min_Salary, 
    AVG(Salary) AS Avg_Salary
FROM EMPLOYEE
WHERE DNo IN (SELECT DNo FROM DEPARTMENT WHERE DName = 'Accounts');
