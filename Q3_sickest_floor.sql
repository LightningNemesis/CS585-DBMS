SELECT floor_number, COUNT(employee_ID) AS employee_count
FROM Employee
WHERE employee_ID IN (
    SELECT DISTINCT employee_ID
    FROM CovidCase
    WHERE case_ID IN (
        SELECT case_ID
        FROM HealthStatus
        WHERE health_status IN ('Critical', 'Improving')
    )
)
GROUP BY floor_number
ORDER BY employee_count DESC
FETCH FIRST 1 ROWS ONLY;
