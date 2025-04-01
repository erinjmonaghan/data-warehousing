\c ncstaffsql

DROP TABLE IF EXISTS Facts_Staff CASCADE;
DROP TABLE IF EXISTS Dim_Employees CASCADE;
DROP TABLE IF EXISTS Dim_Areas CASCADE;
DROP TABLE IF EXISTS Dim_Course CASCADE;
DROP TABLE IF EXISTS Dim_Managers CASCADE;
DROP TABLE IF EXISTS Dim_Next_Cohort CASCADE;

CREATE TABLE Dim_Employees(
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100)
);

CREATE TABLE Dim_Areas (
    area_id SERIAL PRIMARY KEY,
    area VARCHAR(50)
);

CREATE TABLE Dim_Course (
    course_id SERIAL PRIMARY KEY,
    course VARCHAR(100)
);

CREATE TABLE Dim_Managers(
    manager_id SERIAL PRIMARY KEY,
    manager VARCHAR(50)
);

CREATE TABLE Dim_Next_Cohort(
    cohort_id SERIAL PRIMARY KEY,
    next_cohort_date DATE
);


CREATE TABLE Facts_Staff(
    fact_id SERIAL PRIMARY KEY,
    employee_id INT REFERENCES Dim_Employees(employee_id),
    area_id INT REFERENCES Dim_Areas(area_id),
    course_id INT REFERENCES Dim_Course(course_id),
    manager_id INT REFERENCES Dim_Managers(manager_id),
    cohort_id INT REFERENCES Dim_Next_Cohort(cohort_id),
    mentees INT,
    mentees_staff_rating INT,
    daily_rate FLOAT,
    revenue FLOAT
);

INSERT INTO Dim_Employees(first_name, last_name)
SELECT DISTINCT first_name, last_name FROM staff;

INSERT INTO Dim_Areas(area)
SELECT DISTINCT area FROM staff;

INSERT INTO Dim_Course(course)
SELECT DISTINCT course FROM staff;

INSERT INTO Dim_Managers(manager)
SELECT DISTINCT manager FROM staff;

INSERT INTO Dim_Next_Cohort(next_cohort_date)
SELECT DISTINCT  TO_DATE(next_cohort_date, 'DD Month YYYY') FROM staff;

INSERT INTO Facts_Staff(employee_id ,area_id ,course_id ,manager_id ,cohort_id,
mentees, mentees_staff_rating, daily_rate, revenue)
SELECT 
    Dim_Employees.employee_id,
    Dim_Areas.area_id,
    Dim_Course.course_id,
    Dim_Managers.manager_id,
    Dim_Next_Cohort.cohort_id,
    staff.mentees,
    staff.mentees_staff_rating,
    staff.daily_rate,
    staff.revenue
FROM staff
JOIN Dim_Employees ON staff.first_name = Dim_Employees.first_name AND staff.last_name = Dim_Employees.last_name
JOIN Dim_Areas ON staff.area = Dim_Areas.area
JOIN Dim_Course ON staff.course = Dim_Course.course
JOIN Dim_Managers ON staff.manager = Dim_Managers.manager
JOIN Dim_Next_Cohort ON TO_DATE(staff.next_cohort_date, 'DD Month YYYY') = Dim_Next_Cohort.next_cohort_date;




