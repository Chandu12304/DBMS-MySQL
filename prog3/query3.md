
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

Let me know if you need any more clarifications!