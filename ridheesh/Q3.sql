-- Oracle DB was used: https://livesql.oracle.com/

SELECT
    e.floor_number,
    COUNT(hs.status) AS sick_count
FROM
    Employee e
JOIN
    HealthStatus hs ON e.ID = hs.employee_ID
WHERE
    hs.status = 'Infected'
GROUP BY
    e.floor_number
ORDER BY
    sick_count DESC
FETCH FIRST 1 ROW ONLY;