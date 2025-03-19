SELECT SEMSEC.Sem, SEMSEC.Sec, STUDENT.Gender, COUNT(*) AS TotalStudents
FROM CLASS 
JOIN STUDENT ON CLASS.USN = STUDENT.USN
JOIN SEMSEC ON CLASS.SSID = SEMSEC.SSID
GROUP BY SEMSEC.Sem, SEMSEC.Sec, STUDENT.Gender;
