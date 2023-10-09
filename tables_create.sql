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

