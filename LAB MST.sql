-- Create a Course Registration System using Student and Course tables.
-- 1. Create both tables with suitable attributes.
-- 2. Use a Primary Key for each table and establish a Foreign Key relationship.
-- 3. Apply suitable NOT NULL, UNIQUE, DEFAULT, and CHECK constraints.
-- 4. Insert at least 5 students and 4 courses.
-- 5. Display students enrolled in a particular course.
-- 6. Update the course of a student.
-- 7. Delete a student using a suitable condition.
-- 8. Add a new column using ALTER.
-- 9. Rename one table using RENAME.
-- 10. Display the final records using SELECT.

CREATE database course_registration;
USE course_registration;

CREATE table Students(
student_id INT PRIMARY KEY,
student_name VARCHAR(100) NOT NULL,
email VARCHAR(100) UNIQUE,
age INT CHECK(age >= 18),
course_id INT );

CREATE table Course(
course_id INT PRIMARY KEY,
course_name VARCHAR(100) NOT NULL UNIQUE,
duration INT CHECK (duration > 0),
credits INT DEFAULT 4 );

ALTER table Student 
ADD Constraint fk_course
FOREIGN KEY (course_id) REFERENCES Course(course_id);

INSERT INTO Course (course_id, course_name, duration, credits) VALUES
(101, 'Punjabi', 7, 10),
(102, 'Hindi', 6, 7),
(103, 'English', 5, 5),
(104, 'AIML', 7, 5);

INSERT INTO Students (student_id, student_name, email, age, course_id) VALUES
(1, 'Arpan', 'brar@gmail.com', 18, 104),
(2, 'Arjan', 'dhillon@gmail.com', 22, 101),
(3, 'Jordan', 'sandhu@gmail.com', 24, 102),
(4, 'Navan', 'dapper@gmail.com', 25, 103),
(5, 'Sidhu', 'jhotta@gmail.com', 27, 101);

SELECT s.student_id, s.student_name, c.course_name
FROM Students s JOIN Course c ON s.course_id = c.course_id WHERE c.course_name = 'Punjabi';

UPDATE Students 
SET course_id = 104
WHERE student_id = 2;
SELECT *FROM Students;

DELETE FROM Students WHERE student_id = 5;

ALTER table Students 
ADD phone_number VARCHAR(15);

RENAME table Students TO Studentees;

SELECT *FROM Studentees;

SELECT*FROM Course;




