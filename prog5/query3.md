

The question asks us to find:  
1. **Total salary (SUM)** of all employees in the 'Accounts' department.  
2. **Maximum salary (MAX)** in this department.  
3. **Minimum salary (MIN)** in this department.  
4. **Average salary (AVG)** in this department.  

---

### **Step 1: Identify Relevant Tables**  
- **DEPARTMENT (DNo, DName, MgrSSN, MgrStartDate)** → To find the **DNo (Department Number)** for 'Accounts'.  
- **EMPLOYEE (SSN, Name, Address, Sex, Salary, SuperSSN, DNo)** → To find **employees** in that department and their salaries.  

---

### **Step 2: Find the Department Number for ‘Accounts’**
Since department names are stored in `DEPARTMENT`, we first find the **DNo (Department Number)** for 'Accounts':

```sql
SELECT DNo 
FROM DEPARTMENT 
WHERE DName = 'Accounts';
```

---

### **Step 3: Get Salary Statistics for Employees in ‘Accounts’**
Now, we use `EMPLOYEE` to fetch **salary details** of employees whose `DNo` matches the 'Accounts' department:

```sql
SELECT 
    SUM(Salary) AS Total_Salary, 
    MAX(Salary) AS Max_Salary, 
    MIN(Salary) AS Min_Salary, 
    AVG(Salary) AS Avg_Salary
FROM EMPLOYEE
WHERE DNo IN (SELECT DNo FROM DEPARTMENT WHERE DName = 'Accounts');
```

---

### **Final Explanation**
1. **Find the department number (DNo) of 'Accounts'** from `DEPARTMENT`.  
2. **Use this DNo to filter employees in EMPLOYEE** who belong to the 'Accounts' department.  
3. **Apply aggregate functions (SUM, MAX, MIN, AVG) on the Salary column**.  

This query **displays** the required salary statistics but does not modify the database. Let me know if you need any clarifications!