
## **Understanding the Question**  
*"Find the title of movies and number of stars for each movie that has at least one rating and find the highest number of stars that movie received. Sort the result by movie title."*

### **Breaking it Down:**  
1. **"Find the title of movies and number of stars"** → We need `Mov_Title` from the `MOVIES` table and `Rev_Stars` from the `RATING` table.  
2. **"Each movie that has at least one rating"** → We should only include movies that exist in the `RATING` table (i.e., there is a `Mov_id` in `RATING`).  
3. **"Find the highest number of stars that movie received"** → We need to use `MAX(Rev_Stars)` to get the highest rating for each movie.  
4. **"Sort the result by movie title"** → Use `ORDER BY Mov_Title`.  

---

## **Step-by-Step SQL Query Construction**  
### **Step 1: Identify Relevant Tables**
We need:  
- `MOVIES` (to get the movie title).  
- `RATING` (to get the movie ratings).  

### **Step 2: Join Tables**  
Movies are linked to ratings using `Mov_id`, so we use an `INNER JOIN`:  
```sql
FROM MOVIES M
JOIN RATING R ON M.Mov_id = R.Mov_id
```

### **Step 3: Get the Maximum Rating for Each Movie**  
Since we need the **highest rating a movie received**, we use `MAX(Rev_Stars)`.  
```sql
MAX(R.Rev_Stars) AS Highest_Rating
```

### **Step 4: Group by Movie Title**  
To get the highest rating for each movie, we **group by movie title**:  
```sql
GROUP BY M.Mov_Title
```

### **Step 5: Sort by Movie Title**  
To arrange the result in ascending order of movie title:  
```sql
ORDER BY M.Mov_Title
```

---

## **Final SQL Query**
```sql
SELECT M.Mov_Title, MAX(R.Rev_Stars) AS Highest_Rating
FROM MOVIES M
JOIN RATING R ON M.Mov_id = R.Mov_id
GROUP BY M.Mov_Title
ORDER BY M.Mov_Title;
```

---

## **Example Data & Execution**  
### **MOVIES Table**
| Mov_id | Mov_Title        | Mov_Year | Mov_Lang  | Dir_id |
|--------|----------------|---------|----------|--------|
| 101    | Inception      | 2010    | English  | 201    |
| 102    | Titanic        | 1997    | English  | 202    |
| 103    | Avengers       | 2012    | English  | 203    |

### **RATING Table**
| Mov_id | Rev_Stars |
|--------|-----------|
| 101    | 5         |
| 101    | 4         |
| 102    | 3         |
| 102    | 4         |
| 103    | 5         |
| 103    | 5         |
| 103    | 4         |

---

### **Query Execution Step-by-Step**
1. **Join MOVIES and RATING**  
   - This ensures we only consider movies that have a rating.  
2. **Find the highest rating for each movie**  
   - `MAX(Rev_Stars)` is applied to each `Mov_Title`.  
3. **Sort by `Mov_Title`**  

### **Final Output**
| Mov_Title  | Highest_Rating |
|------------|---------------|
| Avengers   | 5             |
| Inception  | 5             |
| Titanic    | 4             |

---

## **Summary**
- **Why `JOIN`?** → Ensures only movies with ratings are included.  
- **Why `MAX(Rev_Stars)`?** → Finds the highest rating for each movie.  
- **Why `GROUP BY`?** → Groups results by movie title so we get one row per movie.  
- **Why `ORDER BY`?** → Sorts results alphabetically by movie title.  
