SELECT E.floor_number, COUNT(S.row_ID) AS symptom_count
FROM Employee E
LEFT JOIN Symptom S ON E.employee_ID = S.employee_ID
GROUP BY E.floor_number
ORDER BY symptom_count DESC
FETCH FIRST 1 ROW ONLY;