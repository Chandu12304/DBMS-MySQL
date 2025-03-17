#List all salesmen and indicate those who have and don’t have customers in  
their cities (Use UNIONoperation.)

### **Step-by-Step Breakdown**  

#### **Step 1: Understand the Question**  
- We need to **list all salesmen**.  
- We must **indicate if they have customers in their city or not**.  
- **Use `UNION`** to combine results from two separate queries:  
  1. Salesmen **who have customers in their city**.  
  2. Salesmen **who do not have customers in their city**.  

---

#### **Step 2: Identify Relevant Tables**  
- **SALESMAN** → Contains `Salesman_id`, `Name`, `City`.  
- **CUSTOMER** → Contains `Salesman_id`, `City`.  

---

#### **Step 3: Breakdown into SQL Parts**  

1. **Find salesmen who have customers in their city:**  
   ```sql
   SELECT S.Salesman_id, S.Name, S.City, 'Has Customers' AS Status  
   FROM SALESMAN S  
   WHERE EXISTS (  
       SELECT 1 FROM CUSTOMER C  
       WHERE S.Salesman_id = C.Salesman_id  
       AND S.City = C.City  
   );  
   ```  
   - **`EXISTS`** checks if there’s at least one customer in the same city as the salesman.  
   - **`'Has Customers' AS Status`** labels them accordingly.  

2. **Find salesmen who do NOT have customers in their city:**  
   ```sql
   SELECT S.Salesman_id, S.Name, S.City, 'No Customers' AS Status  
   FROM SALESMAN S  
   WHERE NOT EXISTS (  
       SELECT 1 FROM CUSTOMER C  
       WHERE S.Salesman_id = C.Salesman_id  
       AND S.City = C.City  
   );  
   ```  
   - **`NOT EXISTS`** ensures we only pick salesmen **without** customers in their city.  
   - **`'No Customers' AS Status`** labels them accordingly.  

3. **Combine both results using `UNION`**  
   ```sql
   SELECT S.Salesman_id, S.Name, S.City, 'Has Customers' AS Status  
   FROM SALESMAN S  
   WHERE EXISTS (  
       SELECT 1 FROM CUSTOMER C  
       WHERE S.Salesman_id = C.Salesman_id  
       AND S.City = C.City  
   )  
   UNION  
   SELECT S.Salesman_id, S.Name, S.City, 'No Customers' AS Status  
   FROM SALESMAN S  
   WHERE NOT EXISTS (  
       SELECT 1 FROM CUSTOMER C  
       WHERE S.Salesman_id = C.Salesman_id  
       AND S.City = C.City  
   );  
   ```

---

### **Explanation in Simple Terms**
1. **Find salesmen who have customers** in their city.  
2. **Find salesmen who don’t have customers** in their city.  
3. **Combine both queries** using `UNION`.  
4. **Display salesman ID, name, city, and status** (whether they have customers or not).  

This approach makes it easier to organize and fetch results in **a structured way**!