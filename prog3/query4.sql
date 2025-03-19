SELECT M.Mov_Title, MAX(R.Rev_Stars) AS Highest_Rating
FROM MOVIES M
JOIN RATING R ON M.Mov_id = R.Mov_id
GROUP BY M.Mov_Title
ORDER BY M.Mov_Title;