

## **Understanding the Question**  
*"Update the rating of all movies directed by 'Steven Spielberg' to 5."*  

### **Breaking it Down:**  
1. **"Update the rating"** → We need an `UPDATE` statement.  
2. **"Of all movies"** → The update should apply to multiple rows in the `RATING` table.  
3. **"Directed by ‘Steven Spielberg’"** → We need to find movies directed by him.  
4. **"Set rating to 5"** → Use `SET Rev_Stars = 5`.  

---

## **Step-by-Step SQL Query Construction**  

### **Step 1: Identify the Tables**  
We need the following tables:  
- **`DIRECTOR`** → To find the `Dir_id` for 'Steven Spielberg'.  
- **`MOVIES`** → To find all movies (`Mov_id`) directed by 'Steven Spielberg'.  
- **`RATING`** → To update the ratings for these movies.  

### **Step 2: Get the `Dir_id` for 'Steven Spielberg'**  
```sql
SELECT Dir_id FROM DIRECTOR WHERE Dir_Name = 'Steven Spielberg';
```
This gives us the ID of Steven Spielberg in the `DIRECTOR` table.

### **Step 3: Get the `Mov_id` for Movies Directed by Him**  
```sql
SELECT Mov_id FROM MOVIES WHERE Dir_id = (SELECT Dir_id FROM DIRECTOR WHERE Dir_Name = 'Steven Spielberg');
```
This fetches all movies directed by him.

### **Step 4: Update the Rating in the `RATING` Table**  
```sql
UPDATE RATING
SET Rev_Stars = 5
WHERE Mov_id IN (SELECT Mov_id FROM MOVIES WHERE Dir_id = (SELECT Dir_id FROM DIRECTOR WHERE Dir_Name = 'Steven Spielberg'));
```

---

## **Final SQL Query**
```sql
UPDATE RATING
SET Rev_Stars = 5
WHERE Mov_id IN (
    SELECT Mov_id 
    FROM MOVIES 
    WHERE Dir_id = (
        SELECT Dir_id FROM DIRECTOR WHERE Dir_Name = 'Steven Spielberg'
    )
);
```

---

## **Example Data & Execution**  

### **DIRECTOR Table**
| Dir_id | Dir_Name         | Dir_Phone  |
|--------|-----------------|------------|
| 301    | Christopher Nolan | 1234567890 |
| 302    | Steven Spielberg | 9876543210 |
| 303    | James Cameron    | 1122334455 |

### **MOVIES Table**
| Mov_id | Mov_Title          | Mov_Year | Mov_Lang | Dir_id |
|--------|------------------|---------|---------|--------|
| 101    | Jurassic Park    | 1993    | English | 302    |
| 102    | E.T.             | 1982    | English | 302    |
| 103    | Titanic          | 1997    | English | 303    |

### **RATING Table (Before Update)**
| Mov_id | Rev_Stars |
|--------|-----------|
| 101    | 4         |
| 102    | 3         |
| 103    | 5         |

### **Execution Steps**  
1. Find `Dir_id` for **Steven Spielberg** → `302`.  
2. Find all movies with `Dir_id = 302` → `Jurassic Park (101)`, `E.T. (102)`.  
3. Update `Rev_Stars` in `RATING` for `Mov_id` 101 and 102 to `5`.  

### **RATING Table (After Update)**
| Mov_id | Rev_Stars |
|--------|-----------|
| 101    | 5         |
| 102    | 5         |
| 103    | 5         |

---

## **Summary**
- **Why `UPDATE`?** → Because we need to modify existing ratings.  
- **Why `WHERE Mov_id IN (...)`?** → To update only movies directed by 'Steven Spielberg'.  
- **Why `SELECT Dir_id FROM DIRECTOR`?** → To find the `Dir_id` for 'Steven Spielberg'.  
- **Why `ORDER OF EXECUTION`?**  
  1. Find Spielberg's `Dir_id`.  
  2. Find movies directed by him (`Mov_id`).  
  3. Update ratings for those movies in the `RATING` table.  

Let me know if you need more clarification!