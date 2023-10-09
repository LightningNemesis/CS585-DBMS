-- Oracle DB was used: https://livesql.oracle.com/

SELECT symptom_ID, occurrence_count
FROM (
    SELECT symptom_ID, COUNT(symptom_ID) AS occurrence_count
    FROM Symptom
    GROUP BY symptom_ID
    ORDER BY occurrence_count DESC
)
WHERE ROWNUM = 1;