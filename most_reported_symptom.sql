-- We have used Oracle DB : https://livesql.oracle.com/

SELECT row_ID, COUNT(row_ID) AS report_count
FROM Symptom
GROUP BY row_ID
ORDER BY report_count DESC
FETCH FIRST 1 ROW ONLY;