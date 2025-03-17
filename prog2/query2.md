# Find the name and numbers of all salesmen who had more than one customer.

---

### **Step-by-Step Breakdown**  

#### **Step 1: Understand the Question**  
- We need to **find salesmen** who have **more than one customer**.  
- We want to **display their name and number (ID)**.  

---

#### **Step 2: Identify the Relevant Table**  
- The **CUSTOMER** table has the `Salesman_id` column, which tells us how many customers each salesman has.  
- The **SALESMAN** table contains the `Salesman_id`, `Name`, and other details.  

---

#### **Step 3: Breakdown into SQL Parts**  

1. **Count the number of customers each salesman has:**  
   ```sql
   SELECT Salesman_id, COUNT(*) AS customer_count  
   FROM CUSTOMER  
   GROUP BY Salesman_id;  
   ```  
   - This groups customers by `Salesman_id` and counts how many customers each has.  

2. **Filter only those salesmen who have more than one customer:**  
   ```sql
   SELECT Salesman_id  
   FROM CUSTOMER  
   GROUP BY Salesman_id  
   HAVING COUNT(*) > 1;  
   ```  
   - `HAVING COUNT(*) > 1` ensures we only get salesmen with **more than one customer**.  

3. **Get the name and ID of these salesmen:**  
   ```sql
   SELECT S.Salesman_id, S.Name  
   FROM SALESMAN S  
   WHERE S.Salesman_id IN (  
       SELECT Salesman_id  
       FROM CUSTOMER  
       GROUP BY Salesman_id  
       HAVING COUNT(*) > 1  
   );  
   ```  
   - The **subquery** finds salesmen with more than one customer.  
   - The **outer query** retrieves their name from the SALESMAN table.  

---

### **Final SQL Query**
```sql
SELECT S.Salesman_id, S.Name  
FROM SALESMAN S  
WHERE S.Salesman_id IN (  
    SELECT Salesman_id  
    FROM CUSTOMER  
    GROUP BY Salesman_id  
    HAVING COUNT(*) > 1  
);
```

---

### **Explanation in Simple Terms**
1. **Count customers** for each salesman.  
2. **Filter out** salesmen with more than one customer.  
3. **Get their name and ID** from the `SALESMAN` table using a subquery.  

This method helps break a complex SQL query into **manageable steps**!