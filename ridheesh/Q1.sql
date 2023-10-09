-- Oracle DB was used: https://livesql.oracle.com/

CREATE TABLE Employee (
    ID INT PRIMARY KEY,
    name VARCHAR(255),
    office_number INT,
    floor_number INT,
    phone_number VARCHAR(15),
    email_address VARCHAR(255)
);

CREATE TABLE Meeting (
    meeting_ID INT PRIMARY KEY,
    employee_ID INT,
    room_number INT,
    floor_number INT,
    meeting_start_time DATE,
    FOREIGN KEY (employee_ID) REFERENCES Employee(ID)
);

CREATE TABLE Notification (
    notification_ID INT PRIMARY KEY,
    employee_ID INT,
    test_ID INT,
    meeting_ID INT,
    notification_date DATE,
    notification_type VARCHAR(10),
    FOREIGN KEY (employee_ID) REFERENCES Employee(ID),
    FOREIGN KEY (meeting_ID) REFERENCES Meeting(meeting_ID)
    -- FOREIGN KEY (test_ID) REFERENCES Test(test_ID)
);

CREATE TABLE Symptom (
    row_ID INT PRIMARY KEY,
    symptom_ID INT,
    employee_ID INT,
    date_reported DATE,
    FOREIGN KEY (employee_ID) REFERENCES Employee(ID)
);

CREATE TABLE Scan (
    scan_ID INT PRIMARY KEY,
    scan_date DATE,
    scan_time INT,
    employee_ID INT,
    temperature DECIMAL(4,2),
    FOREIGN KEY (employee_ID) REFERENCES Employee(ID)
);

CREATE TABLE Test (
    test_ID INT PRIMARY KEY,
    location VARCHAR(50),
    test_date DATE,
    test_time INT,
    employee_ID INT,
    test_result VARCHAR(10),
    scan_ID INT,
    symptom_ID INT,
    notification_ID INT,
    FOREIGN KEY (employee_ID) REFERENCES Employee(ID),
    FOREIGN KEY (scan_ID) REFERENCES Scan(scan_ID),
    FOREIGN KEY (symptom_ID) REFERENCES Symptom(row_ID),
    FOREIGN KEY (notification_ID) REFERENCES Notification(notification_ID)
);

CREATE TABLE Covid_case (
    case_ID INT PRIMARY KEY,
    employee_ID INT,
    test_ID INT,
    case_date DATE,
    resolution VARCHAR(20),
    FOREIGN KEY (test_ID) REFERENCES Test(test_ID)
);

CREATE TABLE HealthStatus (
    row_ID INT PRIMARY KEY,
    employee_ID INT,
    HS_date DATE,
    status VARCHAR(15),
    case_ID INT,
    FOREIGN KEY (case_ID) REFERENCES Covid_case(case_ID)
);



ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';

-- Insert data into Employee table
INSERT INTO Employee (ID, name, office_number, floor_number, phone_number, email_address) 
VALUES (1, 'John Doe', 101, 1, '555-1234', 'john.doe@example.com');

INSERT INTO Employee (ID, name, office_number, floor_number, phone_number, email_address) 
VALUES (2, 'Jane Smith', 102, 1, '555-5678', 'jane.smith@example.com');

INSERT INTO Employee (ID, name, office_number, floor_number, phone_number, email_address) 
VALUES (3, 'Ridheesh Amarthya', 201, 2, '555-68419', 'amarthya@uec.edu');

INSERT INTO Employee (ID, name, office_number, floor_number, phone_number, email_address) 
VALUES (4, 'Prithvi Singh Bhogal', 204, 2, '555-68420', 'psb@psb.psb');

-- Insert data into Meeting table
INSERT INTO Meeting (meeting_ID, employee_ID, room_number, floor_number, meeting_start_time) 
VALUES (101, 1, 201, 2, TO_DATE('2023-10-08 10:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO Meeting (meeting_ID, employee_ID, room_number, floor_number, meeting_start_time) 
VALUES (102, 2, 302, 3, TO_DATE('2023-10-09 14:30:00', 'YYYY-MM-DD HH24:MI:SS'));

-- Insert data into Notification table
INSERT INTO Notification (notification_ID, employee_ID, test_ID, meeting_ID, notification_date, notification_type) 
VALUES (201, 1, NULL, 101, TO_DATE('2023-10-08', 'YYYY-MM-DD'), 'Meeting');

INSERT INTO Notification (notification_ID, employee_ID, test_ID, meeting_ID, notification_date, notification_type) 
VALUES (202, 2, NULL, 102, TO_DATE('2023-10-09', 'YYYY-MM-DD'), 'Meeting');

-- Insert data into Symptom table
INSERT INTO Symptom (row_ID, employee_ID, date_reported, symptom_ID) 
VALUES (1, 1, TO_DATE('2023-10-08', 'YYYY-MM-DD'), 501);

INSERT INTO Symptom (row_ID, employee_ID, date_reported, symptom_ID) 
VALUES (2, 2, TO_DATE('2023-10-09', 'YYYY-MM-DD'), 501);

INSERT INTO Symptom (row_ID, employee_ID, date_reported, symptom_ID) 
VALUES (3, 2, TO_DATE('2023-10-09', 'YYYY-MM-DD'), 502);

-- Insert data into Scan table
INSERT INTO Scan (scan_ID, scan_date, scan_time, employee_ID, temperature) 
VALUES (401, TO_DATE('2023-10-08', 'YYYY-MM-DD'), 12, 1, 98.6);

INSERT INTO Scan (scan_ID, scan_date, scan_time, employee_ID, temperature) 
VALUES (402, TO_DATE('2023-10-09', 'YYYY-MM-DD'), 14, 2, 99.2);

-- Insert data into Test table
INSERT INTO Test (test_ID, location, test_date, test_time, employee_ID, test_result, scan_ID, symptom_ID, notification_ID) 
VALUES (501, 'Testing Center A', TO_DATE('2023-10-08 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), 13, 1, 'Negative', 401, 1, 201);

INSERT INTO Test (test_ID, location, test_date, test_time, employee_ID, test_result, scan_ID, symptom_ID, notification_ID) 
VALUES (502, 'Testing Center B', TO_DATE('2023-10-09 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), 15, 2, 'Positive', 402, 2, 202);

-- Insert data into Covid_case table
INSERT INTO Covid_case (case_ID, employee_ID, test_ID, case_date, resolution) 
VALUES (601, 1, 501, TO_DATE('2023-10-08', 'YYYY-MM-DD'), 'Resolved');

INSERT INTO Covid_case (case_ID, employee_ID, test_ID, case_date, resolution) 
VALUES (602, 2, 502, TO_DATE('2023-10-09', 'YYYY-MM-DD'), 'Active');

-- Insert data into HealthStatus table
INSERT INTO HealthStatus (row_ID, employee_ID, HS_date, status, case_ID) 
VALUES (701, 1, TO_DATE('2023-10-08', 'YYYY-MM-DD'), 'Recovered', 601);

INSERT INTO HealthStatus (row_ID, employee_ID, HS_date, status, case_ID) 
VALUES (702, 2, TO_DATE('2023-10-09', 'YYYY-MM-DD'), 'Infected', 602);

INSERT INTO HealthStatus (row_ID, employee_ID, HS_date, status, case_ID) 
VALUES (703, 3, TO_DATE('2023-10-08', 'YYYY-MM-DD'), 'Infected', 601);

INSERT INTO HealthStatus (row_ID, employee_ID, HS_date, status, case_ID) 
VALUES (704, 4, TO_DATE('2023-10-08', 'YYYY-MM-DD'), 'Infected', 601);
