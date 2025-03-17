
### **Understanding the Question:**  
*"List all actors who acted in a movie before 2000 and also in a movie after 2015."*  

- **Keywords:**  
  - *"actors who acted in a movie before 2000"* → We need to find `Act_id` of actors who were in movies released **before 2000**.  
  - *"actors who acted in a movie after 2015"* → We also need to find `Act_id` of actors who were in movies released **after 2015**.  
  - *"also"* → The same actor must appear in both conditions.  
  - *"use JOIN operation"* → We must use `JOIN` instead of subqueries.

---

### **Breaking It Down into Steps:**  
1. **Find actors who acted in movies before 2000.**  
   - Join `MOVIE_CAST` with `MOVIES` to check if a movie's `Mov_Year` is `< 2000`.  
   
2. **Find actors who acted in movies after 2015.**  
   - Join `MOVIE_CAST` with `MOVIES` to check if a movie's `Mov_Year` is `> 2015`.  

3. **Find common actors in both sets.**  
   - Use `JOIN` to match actors from both conditions.  

4. **Retrieve the actor names.**  
   - Use `JOIN` with `ACTOR` to get `Act_Name`.

---

### **Converting This into SQL:**  
```sql
SELECT DISTINCT A.Act_Name 
FROM ACTOR A
JOIN MOVIE_CAST MC1 ON A.Act_id = MC1.Act_id 
JOIN MOVIES M1 ON MC1.Mov_id = M1.Mov_id 
JOIN MOVIE_CAST MC2 ON A.Act_id = MC2.Act_id 
JOIN MOVIES M2 ON MC2.Mov_id = M2.Mov_id 
WHERE M1.Mov_Year < 2000 
AND M2.Mov_Year > 2015;
```

---

### **Explanation of the SQL Query:**  
1. `JOIN ACTOR A` → Start with the `ACTOR` table to retrieve actor names.  
2. `JOIN MOVIE_CAST MC1` → Join with `MOVIE_CAST` to link actors to their movies.  
3. `JOIN MOVIES M1` → Get movies where `Mov_Year < 2000`.  
4. `JOIN MOVIE_CAST MC2` → Again join `MOVIE_CAST` to check for another movie for the same actor.  
5. `JOIN MOVIES M2` → Get movies where `Mov_Year > 2015`.  
6. `WHERE M1.Mov_Year < 2000 AND M2.Mov_Year > 2015` → Ensures the actor is in both conditions.  
7. `DISTINCT` → Ensures each actor appears only once.  

---

### **Alternative Approach Using Subqueries:**  
(Not required in this case since JOIN is mentioned, but for learning purposes)  
```sql
SELECT Act_Name 
FROM ACTOR 
WHERE Act_id IN (
    SELECT Act_id FROM MOVIE_CAST 
    JOIN MOVIES ON MOVIE_CAST.Mov_id = MOVIES.Mov_id 
    WHERE Mov_Year < 2000
)
AND Act_id IN (
    SELECT Act_id FROM MOVIE_CAST 
    JOIN MOVIES ON MOVIE_CAST.Mov_id = MOVIES.Mov_id 
    WHERE Mov_Year > 2015
);
```
- Uses two subqueries to get `Act_id`s separately and filters those who are in both.

---

### **Which One to Use?**  
- **The JOIN-based query** is better for performance and is required as per the question.  
- **The subquery approach** is easier to read but may be slower on large datasets.  

---

Let's understand this SQL query step by step using a simple example.  

---

## **Step 1: Understanding the Tables**  

We have the following tables:  

### **1. ACTOR Table (Actors Information)**
| Act_id | Act_Name     | Act_Gender |
|--------|------------|------------|
| 101    | Tom Hanks   | Male       |
| 102    | Leonardo DiCaprio | Male       |
| 103    | Robert Downey Jr. | Male       |
| 104    | Scarlett Johansson | Female     |

### **2. MOVIES Table (Movies Information)**
| Mov_id | Mov_Title      | Mov_Year | Mov_Lang | Dir_id |
|--------|--------------|---------|---------|--------|
| 201    | Forrest Gump  | 1994    | English | 301    |
| 202    | Titanic       | 1997    | English | 302    |
| 203    | Avengers: Endgame | 2019    | English | 303    |
| 204    | Inception     | 2010    | English | 302    |
| 205    | The Revenant  | 2015    | English | 302    |
| 206    | Oppenheimer   | 2023    | English | 304    |

### **3. MOVIE_CAST Table (Actor-Movie Relationship)**
| Act_id | Mov_id | Role            |
|--------|--------|----------------|
| 101    | 201    | Lead Actor      |
| 102    | 202    | Lead Actor      |
| 102    | 206    | Lead Actor      |
| 103    | 203    | Lead Actor      |
| 104    | 203    | Supporting Actress |

---

## **Step 2: Understanding What the Query Does**
The query finds **actors who have acted in a movie before the year 2000 and also in a movie after 2015**.

### **Step-by-step Breakdown of the Query**
```sql
SELECT DISTINCT A.Act_Name 
FROM ACTOR A
```
- Selects distinct actor names from the `ACTOR` table.

```sql
JOIN MOVIE_CAST MC1 ON A.Act_id = MC1.Act_id 
JOIN MOVIES M1 ON MC1.Mov_id = M1.Mov_id 
```
- Joins the `MOVIE_CAST` table to find all movies the actor has acted in.  
- Joins the `MOVIES` table to get the release year of those movies.  

```sql
JOIN MOVIE_CAST MC2 ON A.Act_id = MC2.Act_id 
JOIN MOVIES M2 ON MC2.Mov_id = M2.Mov_id 
```
- Again joins the `MOVIE_CAST` table to check if the actor has acted in a **different** movie.  
- Joins the `MOVIES` table again to get the release year of this second movie.  

```sql
WHERE M1.Mov_Year < 2000 
AND M2.Mov_Year > 2015;
```
- `M1.Mov_Year < 2000` → Filters for movies released **before 2000**.  
- `M2.Mov_Year > 2015` → Filters for movies released **after 2015**.  
- Ensures the **same actor** has acted in **both conditions**.  

---

## **Step 3: Applying the Query to Our Example**
Now, let's check which actors satisfy this condition.

1. **Leonardo DiCaprio (Act_id = 102)**  
   - Acted in *Titanic (1997)* → Before 2000  
   - Acted in *Oppenheimer (2023)* → After 2015  
   ✅ **Matches the condition**

2. **Tom Hanks (Act_id = 101)**  
   - Acted in *Forrest Gump (1994)* → Before 2000  
   - **No movies after 2015** ❌ Doesn't match

3. **Robert Downey Jr. (Act_id = 103)**  
   - Acted in *Avengers: Endgame (2019)* → After 2015  
   - **No movies before 2000** ❌ Doesn't match

4. **Scarlett Johansson (Act_id = 104)**  
   - Acted in *Avengers: Endgame (2019)* → After 2015  
   - **No movies before 2000** ❌ Doesn't match  

### **Final Output:**
| Act_Name         |
|----------------|
| Leonardo DiCaprio |

---

## **Step 4: Final Explanation in Simple Terms**
1. The query **joins the tables** to match actors with their movies.
2. It **filters actors** who acted in **at least one movie before 2000**.
3. It **filters the same actors** who also acted in **at least one movie after 2015**.
4. Finally, it **returns the names** of these actors.

---

### **Why Use `JOIN` Instead of a Subquery?**
- `JOIN` ensures we **match two different movies** for the same actor in a single query.
- A **subquery** might require checking two separate queries, making it less efficient.

---

### **Summary**
The query finds **actors who appeared in movies both before 2000 and after 2015**. In our example, **Leonardo DiCaprio** is the only actor who satisfies the condition.

Let me know if you need further clarification!