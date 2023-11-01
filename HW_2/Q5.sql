-- We have used Oracle DB : https://livesql.oracle.com/
-- Finding the percentage of employees who tested as positive

SELECT
    COUNT(CASE WHEN test_result = 'Positive' THEN 1 ELSE NULL END) AS number_of_positive_cases,
    COUNT(*) AS total_number_of_tests,
    (COUNT(CASE WHEN test_result = 'Positive' THEN 1 ELSE NULL END) * 100.0 / COUNT(*)) AS percentage_positive_cases
FROM Test
WHERE test_date BETWEEN TO_DATE('2023-10-08 00:00:00', 'YYYY-MM-DD HH24:MI:SS') AND TO_DATE('2023-10-11 00:00:00', 'YYYY-MM-DD HH24:MI:SS');
