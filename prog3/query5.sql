UPDATE RATING
SET Rev_Stars = 5
WHERE Mov_id IN (
    SELECT Mov_id 
    FROM MOVIES 
    WHERE Dir_id = (
        SELECT Dir_id 
        FROM DIRECTOR 
        WHERE Dir_Name = 'Steven Spielberg'
    )
);

-- note
UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;
