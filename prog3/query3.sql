SELECT DISTINCT A.Act_Name 
FROM ACTOR A
JOIN MOVIE_CAST MC1 ON A.Act_id = MC1.Act_id 
JOIN MOVIES M1 ON MC1.Mov_id = M1.Mov_id 
JOIN MOVIE_CAST MC2 ON A.Act_id = MC2.Act_id 
JOIN MOVIES M2 ON MC2.Mov_id = M2.Mov_id 
WHERE M1.Mov_Year < 2000 
AND M2.Mov_Year > 2015;