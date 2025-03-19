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
