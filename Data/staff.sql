DROP DATABASE IF EXISTS ncstaffsql;
CREATE DATABASE ncstaffsql;

\c ncstaffsql

CREATE TABLE staff
(
    staff_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    area VARCHAR(50),
    course VARCHAR(100),
    manager VARCHAR(50),
    mentees INT,
    next_cohort_date TEXT,
    mentees_staff_rating INT,
    daily_rate FLOAT,
    revenue FLOAT
);

INSERT INTO staff 
    (first_name, last_name, area, course, manager, mentees, next_cohort_date, mentees_staff_rating, daily_rate, revenue)
VALUES 
('Liam', 'Walker', 'Remote', 'Data', 'Mason Taylor', 11, '12 January 2024', 10, 700.98, 9112.74),
('Noah', 'Fisher', 'Manchester', 'Software', 'Lucas Bennett', 0, '24 February 2024', 8, 600.28, 7803.64),
('Ava', 'Mitchell', 'Remote', 'Software', 'Noah Fisher', 13, '24 March 2024', 9, 578.26, 7517.38),
('Henry', 'Parker', 'Leeds', 'Data', 'Liam Walker', 18, '12 January 2024', 2, 12.99, 168.87),
('Sophia', 'Coleman', 'Manchester', 'Data', 'Lucas Bennett', 0, '12 May 2024', 9, 699.00, 9087.00),
('Lucas', 'Bennett', 'Manchester', 'Software', 'Ethan Carter', 0, '24 June 2024', 4, 150.01, 1950.13),
('Oliver', 'Harrison', 'Manchester', 'Software', 'Jack Sullivan', 9, '24 July 2024', 7, 200.67, 2608.71),
('Isla', 'Chambers', 'Manchester', 'Software', 'Jack Sullivan', 9, '24 August 2024', 7, 400.05, 5200.65),
('Grace', 'Lawson', 'Manchester', 'Software', 'Jack Sullivan', 10, '13 April 2024', 8, 400.04, 5200.52),
('Ethan', 'Palmer', 'Manchester', 'Software', 'Jack Sullivan', 11, '17 October 2024', 6, 370.89, 4821.57),
('Emily', 'Thompson', 'Manchester', 'Cloud', 'Daniel Spencer', 6, '03 November 2024', 7, 550.35, 7154.55),
('Zane', 'Ross', 'Leeds', 'Software', 'Ryan Foster', 12, '17 December 2024', 7, 548.33, 7128.29),
('Luna', 'Gallagher', 'Manchester', 'Data', 'Mason Taylor', 8, '12 May 2024', 9, 698.99, 9086.87),
('Jack', 'Sullivan', 'Manchester', 'Software', 'Lucas Bennett', 13, '24 August 2024', 8, 439.09, 5708.17),
('Nathan', 'Stevens', 'Leeds', 'Software', 'Ryan Foster', 14, '17 January 2024', 5, 421.89, 5484.57),
('Hailey', 'Morrison', 'Manchester', 'Software', 'Lily Hayes', 9, '17 January 2024', 5, 511.45, 6648.85),
('Owen', 'Phillips', 'Manchester', 'Cloud', 'Daniel Spencer', 11, '03 March 2024', 8, 588.88, 7655.44),
('Charlie', 'Dixon', 'Manchester', 'Data', 'Mason Taylor', 7, '12 January 2024', 5, 199.99, 2599.87),
('Amelia', 'Reynolds', 'Manchester', 'Software', 'Noah Fisher', 10, '13 April 2024', 8, 665.35, 8649.55),
('Ryan', 'Foster', 'Leeds', 'Software', 'Lily Hayes', 2, '13 April 2024', 3, 89.98, 1709.62),
('Cooper', 'Nguyen', 'Manchester', 'Data', 'Mason Taylor', 15, '12 May 2024', 4, 50.67, 658.71);

SELECT * FROM staff;
