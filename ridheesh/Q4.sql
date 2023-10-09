-- Oracle DB was used: https://livesql.oracle.com/

-- Number of scans
SELECT
    COUNT(scan_ID) AS scan_count
FROM
    Scan
WHERE
    scan_date BETWEEN TO_DATE('2023-10-08 00:00:00', 'YYYY-MM-DD HH24:MI:SS') AND TO_DATE('2023-10-09 00:00:00', 'YYYY-MM-DD HH24:MI:SS');

-- Number of tests
SELECT
    COUNT(test_ID) AS test_count
FROM
    Test
WHERE
    test_date BETWEEN TO_DATE('2023-10-08 00:00:00', 'YYYY-MM-DD HH24:MI:SS') AND TO_DATE('2023-10-09 00:00:00', 'YYYY-MM-DD HH24:MI:SS');

-- Number of employees who self-reported symptoms
SELECT
    COUNT(DISTINCT employee_ID) AS symptomatic_employee_count
FROM
    Symptom
WHERE
    date_reported BETWEEN TO_DATE('2023-10-08', 'YYYY-MM-DD') AND TO_DATE('2023-10-09', 'YYYY-MM-DD');

-- Number of positive cases
SELECT
    COUNT(DISTINCT case_ID) AS positive_case_count
FROM
    Covid_case
WHERE
    case_date BETWEEN TO_DATE('2023-10-08 00:00:00', 'YYYY-MM-DD HH24:MI:SS') AND TO_DATE('2023-10-09 00:00:00', 'YYYY-MM-DD HH24:MI:SS');