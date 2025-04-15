SELECT d.dno,COUNT(*) AS High_Salary_Employees
FROM department d
JOIN employee e ON e.dno=d.dno
WHERE e.salary > 60000
GROUP BY (d.dno)
HAVING COUNT(*)>0;
