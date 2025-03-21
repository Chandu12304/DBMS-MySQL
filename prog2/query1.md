# Count the customers with grades above Bangalore’s average
---

### **Step 1: Understand the Question**  
- We need to **find the average grade of customers from Bangalore**.  
- Then, we need to **count the number of customers whose grade is above that average**.  

---

### **Step 2: Breakdown into SQL Parts**  

1. **Find the average grade of Bangalore’s customers:**  
   ```sql
   SELECT AVG(Grade) FROM CUSTOMER WHERE City = 'Bangalore';
   ```  
   - This calculates the **average grade** for customers who live in Bangalore.  

2. **Count customers whose grade is above this average:**  
   ```sql
   SELECT COUNT(*) FROM CUSTOMER  
   WHERE Grade > (SELECT AVG(Grade) FROM CUSTOMER WHERE City = 'Bangalore');
   ```  
   - The **subquery** inside `()` calculates Bangalore’s average grade.  
   - The **outer query** counts customers whose grade is higher than that average.  

---

### **Final SQL Query**
```sql
SELECT COUNT(*)  
FROM CUSTOMER  
WHERE Grade > (SELECT AVG(Grade) FROM CUSTOMER WHERE City = 'Bangalore');
```

---

### **Explanation in Simple Terms**
1. Get the **average grade** of Bangalore’s customers.  
2. Find **how many customers** have a grade **higher than that average**.  
3. Use a **subquery** to calculate the average first, then use it in the main query.  

This approach helps break a complex question into manageable steps!

