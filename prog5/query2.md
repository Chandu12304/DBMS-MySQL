
The question asks us to find **the new salaries** for all employees **working on the ‘IoT’ project** if they receive a **10% raise**.  

---

### **Step 1: Identify Relevant Tables**
1. **PROJECT (PNo, PName, PLocation, DNo)** → To find the **project number (PNo)** of the ‘IoT’ project.  
2. **WORKS_ON (SSN, PNo, Hours)** → To find **employees (SSN)** working on the ‘IoT’ project.  
3. **EMPLOYEE (SSN, Name, Address, Sex, Salary, SuperSSN, DNo)** → To find **the current salaries** of those employees and calculate the **new salary** after the raise.  

---

### **Step 2: Find the Project Number for ‘IoT’**
Since the **project name is ‘IoT’**, we first find its **PNo** (Project Number):

```sql
SELECT PNo 
FROM PROJECT 
WHERE PName = 'IoT';
```

---

### **Step 3: Find Employees Working on the ‘IoT’ Project**
Now, we use `WORKS_ON` to find all **SSNs of employees** working on that project:

```sql
SELECT SSN 
FROM WORKS_ON 
WHERE PNo IN (SELECT PNo FROM PROJECT WHERE PName = 'IoT');
```

---

### **Step 4: Calculate New Salaries for These Employees**
We now fetch the **names, current salaries**, and **new salaries (with a 10% raise)** for these employees:

```sql
SELECT Name, Salary AS Current_Salary, Salary * 1.10 AS New_Salary
FROM EMPLOYEE
WHERE SSN IN (SELECT SSN FROM WORKS_ON WHERE PNo IN (SELECT PNo FROM PROJECT WHERE PName = 'IoT'));
```

---

### **Final Explanation**
1. **Find the project number (PNo) of the ‘IoT’ project** from `PROJECT`.  
2. **Find the employees (SSN) working on this project** from `WORKS_ON`.  
3. **Fetch their current salaries from EMPLOYEE** and **calculate the new salary (10% increase)**.  

This query **does not update the database**, it **only displays** the new salaries. Let me know if you need an `UPDATE` query to modify the salaries permanently!