UPDATE RATING R
JOIN MOVIES M ON R.Mov_id = M.Mov_id
JOIN DIRECTOR D ON M.Dir_id = D.Dir_id
SET R.Rev_Stars = 5
WHERE D.Dir_Name = 'Steven Spielberg';


-- note
UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;
