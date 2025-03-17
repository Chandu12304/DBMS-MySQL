#Create a view that finds the salesman who has the customer with the highest  
order of a day.

### **Step-by-Step Breakdown**  

#### **Step 1: Understand the Question**  
- We need to **find the salesman** who has the **customer with the highest order amount** for each day.  
- We need to **store this result as a view** (a virtual table).  

---

#### **Step 2: Identify Relevant Tables**  
- **ORDERS** → Contains `Ord_No`, `Purchase_Amt`, `Ord_Date`, `Customer_id`, `Salesman_id`.  
- **CUSTOMER** → Contains `Customer_id`, `Salesman_id`.  
- **SALESMAN** → Contains `Salesman_id`, `Name`.  

---

#### **Step 3: Breakdown into SQL Parts**  

1. **Find the highest order amount per day:**  
   ```sql
   SELECT Ord_Date, MAX(Purchase_Amt) AS Max_Order  
   FROM ORDERS  
   GROUP BY Ord_Date;
   ```  
   - Groups orders by date and finds the **maximum order amount** for each day.  

2. **Find the customer and salesman for that highest order:**  
   ```sql
   SELECT O.Ord_Date, O.Purchase_Amt, O.Customer_id, O.Salesman_id  
   FROM ORDERS O  
   WHERE O.Purchase_Amt = (  
       SELECT MAX(Purchase_Amt)  
       FROM ORDERS  
       WHERE Ord_Date = O.Ord_Date  
   );  
   ```  
   - Filters orders where the `Purchase_Amt` is the highest for that day.  

3. **Get the salesman details and create a view:**  
   ```sql
   CREATE VIEW Highest_Order_Salesman AS  
   SELECT O.Ord_Date, S.Salesman_id, S.Name, O.Customer_id, O.Purchase_Amt  
   FROM ORDERS O  
   JOIN SALESMAN S ON O.Salesman_id = S.Salesman_id  
   WHERE O.Purchase_Amt = (  
       SELECT MAX(Purchase_Amt)  
       FROM ORDERS  
       WHERE Ord_Date = O.Ord_Date  
   );  
   ```

---

### **Final SQL Query (Create View)**
```sql
CREATE VIEW Highest_Order_Salesman AS  
SELECT O.Ord_Date, S.Salesman_id, S.Name, O.Customer_id, O.Purchase_Amt  
FROM ORDERS O  
JOIN SALESMAN S ON O.Salesman_id = S.Salesman_id  
WHERE O.Purchase_Amt = (  
    SELECT MAX(Purchase_Amt)  
    FROM ORDERS  
    WHERE Ord_Date = O.Ord_Date  
);
```

---

### **Explanation in Simple Terms**
1. **Find the highest order** for each day.  
2. **Find the customer and salesman** related to that order.  
3. **Join with the SALESMAN table** to get the name.  
4. **Store the result as a view** so we can query it anytime.  

This method helps break a complex query into **manageable steps** and ensures we get the correct results!