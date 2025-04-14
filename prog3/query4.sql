SELECT m.mov_title, r.rev_stars
FROM movies m
JOIN rating r
ON m.mov_id=r.mov_id
ORDER BY m.mov_title;

SELECT M.Mov_Title, R.Rev_Stars AS max_rating
FROM MOVIES M
JOIN RATING R ON M.Mov_id = R.Mov_id
WHERE R.Rev_Stars = (
    SELECT MAX(Rev_Stars) FROM RATING
);
