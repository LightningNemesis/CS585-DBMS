-- Oracle DB was used: https://livesql.oracle.com/
-- Q5. Track the employee with the most symptoms 

SELECT
    employee_ID,
    num_symptoms
FROM (
    SELECT
        employee_ID,
        COUNT(symptom_ID) AS num_symptoms,
        RANK() OVER (ORDER BY COUNT(symptom_ID) DESC) AS rnk
    FROM
        Symptom
    GROUP BY
        employee_ID
)
WHERE
    rnk = 1;