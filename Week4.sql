create database internship_dB2;
USE internship_dB2;
-- Courses Table
CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100)
);

-- Students Table
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100)
);

-- Enrollments Table
CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    marks INT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);
-- Courses
INSERT INTO Courses VALUES (1, 'Mathematics'), (2, 'Physics'), (3, 'Chemistry');

-- Students
INSERT INTO Students VALUES 
(101, 'Alice'), 
(102, 'Bob'), 
(103, 'Charlie'), 
(104, 'Diana');

-- Enrollments
INSERT INTO Enrollments VALUES 
(1, 101, 1, 85), 
(2, 102, 1, 78), 
(3, 103, 2, 88), 
(4, 101, 2, 92), 
(5, 104, 3, 76);
SELECT s.student_name, c.course_name, e.marks
FROM Students s
LEFT JOIN Enrollments e ON s.student_id = e.student_id
LEFT JOIN Courses c ON e.course_id = c.course_id;
SELECT s.student_name, c.course_name, e.marks
FROM Courses c
RIGHT JOIN Enrollments e ON c.course_id = e.course_id
RIGHT JOIN Students s ON e.student_id = s.student_id;
-- Simulating FULL OUTER JOIN
SELECT s.student_name, c.course_name, e.marks
FROM Students s
LEFT JOIN Enrollments e ON s.student_id = e.student_id
LEFT JOIN Courses c ON e.course_id = c.course_id

UNION

SELECT s.student_name, c.course_name, e.marks
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
LEFT JOIN Students s ON e.student_id = s.student_id;
SELECT student_name
FROM Students
WHERE student_id IN (
    SELECT student_id 
    FROM Enrollments 
    WHERE course_id = (
        SELECT course_id FROM Courses WHERE course_name = 'Physics'
    )
);
SELECT student_name
FROM Students s
WHERE EXISTS (
    SELECT 1 
    FROM Enrollments e1
    WHERE s.student_id = e1.student_id 
      AND e1.marks > (
        SELECT AVG(e2.marks)
        FROM Enrollments e2
        WHERE e1.course_id = e2.course_id
      )
);
SELECT s.student_name, c.course_name, e.marks
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id;







