CREATE VIEW Test1MarksView AS
SELECT SUBJECT.Title, IAMARKS.Test1 
FROM IAMARKS 
JOIN SUBJECT ON IAMARKS.Subcode = SUBJECT.Subcode 
WHERE IAMARKS.USN = '1BI15CS101';