-- We have used Oracle DB : https://livesql.oracle.com/

-- contains info about employees
create table Employee(
    employee_ID int primary key,
    employee_name VARCHAR(32),
    office_number int,
    floor_number int,
    phone_number int, 
    email_address VARCHAR(255)
);

-- contains meeting info, on every meeting between employees
create table Meeting(
    meeting_ID int primary key,
    employee_ID int,
    room_number int,
    floor_number int,
    meeting_start_time int,
    foreign key (employee_ID) references Employee(employee_ID)
);

--  based on contact tracing, to alert employees who might have been exposed
create table Notification(
    notification_ID int primary key, 
    employee_ID int,
    meeting_ID int,
    test_ID int, 
    notification_date int,
    notification_type VARCHAR(255),    
    foreign key (employee_ID) references Employee(employee_ID),
    foreign key (meeting_ID) references Meeting(meeting_ID)
    -- foreign key (test_ID) references Test(test_ID)
);

-- self-reported by employees, any of 5 symptoms
create table Symptom(
    row_ID int primary key,
    employee_ID int , 
    date_reported DATE,   
    foreign key (employee_ID) references Employee(employee_ID)
);

-- random scans of employees' body temperatures
create table Scan(
    scan_ID int primary key, 
    employee_ID int, 
    scan_date DATE, 
    scan_time int,    
    temperature int,
    foreign key (employee_ID) references Employee(employee_ID)
);

-- to record test details
create table Test(
    test_ID int primary key, 
    employee_ID int,
    scan_ID int,
    symptom_ID int,
    notification_ID int,
    test_location VARCHAR(255),
    test_date DATE,
    test_time int,
    test_result VARCHAR(255),    
    foreign key (employee_ID) references Employee(employee_ID),
    foreign key (scan_ID) references Scan(scan_ID),
    foreign key (symptom_ID) references Symptom(row_ID),
    foreign key (notification_ID) references Notification(notification_ID)
);

-- to record employees who test positive
create table CovidCase(
    case_ID int primary key, 
    employee_ID int,
    test_ID int,
    case_date DATE, 
    resolution VARCHAR(255),    
    foreign key (employee_ID) references Employee(employee_ID),
    foreign key (test_ID) references Test(test_ID)
);

-- self-reporting by employees
create table HealthStatus(
    row_ID int primary key,     
    case_ID int,
    health_status_date DATE,
    health_status VARCHAR(255),    
    foreign key (case_ID) references CovidCase(case_ID)
);

ALTER TABLE Notification
ADD CONSTRAINT test_ID
FOREIGN KEY (test_ID)
REFERENCES Test (test_ID);

-- Insert values for 5 rows into the Employee table
INSERT INTO Employee (employee_ID, employee_name, office_number, floor_number, phone_number, email_address)
VALUES (1, 'Yudhishthira', 101, 1, 5551234561, 'yudhishthira@example.com');

INSERT INTO Employee (employee_ID, employee_name, office_number, floor_number, phone_number, email_address)
VALUES (2, 'Bhima', 102, 1, 5551234562, 'bhima@example.com');

INSERT INTO Employee (employee_ID, employee_name, office_number, floor_number, phone_number, email_address)
VALUES (3, 'Arjuna', 201, 2, 5551234563, 'arjuna@example.com');

INSERT INTO Employee (employee_ID, employee_name, office_number, floor_number, phone_number, email_address)
VALUES (4, 'Nakula', 202, 2, 5551234564, 'nakula@example.com');

INSERT INTO Employee (employee_ID, employee_name, office_number, floor_number, phone_number, email_address)
VALUES (5, 'Sahadeva', 301, 3, 5551234565, 'sahadeva@example.com');


-- Insert values for 5 rows into the Meeting table
INSERT INTO Meeting (meeting_ID, employee_ID, room_number, floor_number, meeting_start_time)
VALUES (1, 1, 101, 1, 8);

INSERT INTO Meeting (meeting_ID, employee_ID, room_number, floor_number, meeting_start_time)
VALUES (2, 2, 102, 1, 9);

INSERT INTO Meeting (meeting_ID, employee_ID, room_number, floor_number, meeting_start_time)
VALUES (3, 3, 201, 2, 10);

INSERT INTO Meeting (meeting_ID, employee_ID, room_number, floor_number, meeting_start_time)
VALUES (4, 4, 202, 2, 11);

INSERT INTO Meeting (meeting_ID, employee_ID, room_number, floor_number, meeting_start_time)
VALUES (5, 5, 301, 3, 12);


-- Insert values into the Notification table
INSERT INTO Notification (notification_ID, employee_ID, meeting_ID, test_ID, notification_date, notification_type)
VALUES (1, 1, 1, NULL, 20231008, 'Meeting Reminder');

INSERT INTO Notification (notification_ID, employee_ID, meeting_ID, test_ID, notification_date, notification_type)
VALUES (2, 2, 2, NULL, 20231009, 'Test Notification');

INSERT INTO Notification (notification_ID, employee_ID, meeting_ID, test_ID, notification_date, notification_type)
VALUES (3, 3, 3, NULL, 20231010, 'Meeting Cancellation');


-- Insert values into the Symptom table
INSERT INTO Symptom (row_ID, employee_ID, date_reported)
VALUES (1, 1, TO_DATE('2023-10-08', 'YYYY-MM-DD'));

INSERT INTO Symptom (row_ID, employee_ID, date_reported)
VALUES (2, 2, TO_DATE('2023-10-09', 'YYYY-MM-DD'));

INSERT INTO Symptom (row_ID, employee_ID, date_reported)
VALUES (3, 3, TO_DATE('2023-10-10', 'YYYY-MM-DD'));


-- Insert values into the Scan table 
INSERT INTO Scan (scan_ID, employee_ID, scan_date, scan_time, temperature)
VALUES (1, 1, TO_DATE('2023-10-08', 'YYYY-MM-DD'), 1000, 98);

INSERT INTO Scan (scan_ID, employee_ID, scan_date, scan_time, temperature)
VALUES (2, 2, TO_DATE('2023-10-09', 'YYYY-MM-DD'), 1030, 99);

INSERT INTO Scan (scan_ID, employee_ID, scan_date, scan_time, temperature)
VALUES (3, 3, TO_DATE('2023-10-10', 'YYYY-MM-DD'), 1100, 97);


-- Insert values into the Test table
INSERT INTO Test (test_ID, employee_ID, scan_ID, symptom_ID, notification_ID, test_location, test_date, test_time, test_result)
VALUES (1, 1, 1, 1, 1, 'Hospital A', TO_DATE('2023-10-08', 'YYYY-MM-DD'), 12, 'Negative');

INSERT INTO Test (test_ID, employee_ID, scan_ID, symptom_ID, notification_ID, test_location, test_date, test_time, test_result)
VALUES (2, 2, 2, 2, 2, 'Hospital B', TO_DATE('2023-10-09', 'YYYY-MM-DD'), 13, 'Positive');

INSERT INTO Test (test_ID, employee_ID, scan_ID, symptom_ID, notification_ID, test_location, test_date, test_time, test_result)
VALUES (3, 3, 3, 3, 3, 'Hospital C', TO_DATE('2023-10-10', 'YYYY-MM-DD'), 14, 'Negative');


-- Insert values into the CovidCase table
INSERT INTO CovidCase (case_ID, employee_ID, test_ID, case_date, resolution)
VALUES (1, 1, 1, DATE '2023-10-08', 'Isolated');

INSERT INTO CovidCase (case_ID, employee_ID, test_ID, case_date, resolution)
VALUES (2, 2, 2, DATE '2023-10-09', 'Quarantined');

INSERT INTO CovidCase (case_ID, employee_ID, test_ID, case_date, resolution)
VALUES (3, 3, 3, DATE '2023-10-10', 'Isolated');


-- Insert values into the HealthStatus table
INSERT INTO HealthStatus (row_ID, case_ID, health_status_date, health_status)
VALUES (1, 1, DATE '2023-10-08', 'Critical');

INSERT INTO HealthStatus (row_ID, case_ID, health_status_date, health_status)
VALUES (2, 2, DATE '2023-10-09', 'Improving');

INSERT INTO HealthStatus (row_ID, case_ID, health_status_date, health_status)
VALUES (3, 3, DATE '2023-10-10', 'Critical');





