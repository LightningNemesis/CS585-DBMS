-- We have used Oracle DB : https://livesql.oracle.com/

-- Number of scans
SELECT COUNT(DISTINCT scan_ID) AS number_of_scans
FROM Scan
WHERE scan_date BETWEEN TO_DATE('2023-10-08 00:00:00', 'YYYY-MM-DD HH24:MI:SS') AND TO_DATE('2023-10-11 00:00:00', 'YYYY-MM-DD HH24:MI:SS');

-- Number of tests
SELECT COUNT(DISTINCT test_ID) AS number_of_tests
FROM Test
WHERE test_date BETWEEN TO_DATE('2023-10-08 00:00:00', 'YYYY-MM-DD HH24:MI:SS') AND TO_DATE('2023-10-11 00:00:00', 'YYYY-MM-DD HH24:MI:SS');

-- Number of employees who self-reported symptoms
SELECT COUNT(DISTINCT row_ID) AS employees_with_symptom_count
FROM Symptom
WHERE date_reported BETWEEN TO_DATE('2023-10-08', 'YYYY-MM-DD HH24:MI:SS') AND TO_DATE('2023-10-11', 'YYYY-MM-DD HH24:MI:SS');

-- Number of positive cases
SELECT COUNT(DISTINCT case_ID) AS positive_employee_count
FROM CovidCase
WHERE case_date BETWEEN TO_DATE('2023-10-08', 'YYYY-MM-DD HH24:MI:SS') AND TO_DATE('2023-10-11', 'YYYY-MM-DD HH24:MI:SS');