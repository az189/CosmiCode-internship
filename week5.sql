create database internship_db3;
use internship_db3;
drop database internship_db3;
-- Recreate Students table with constraints
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT CHECK (age >= 5 AND age <= 100),
    email VARCHAR(100) UNIQUE
);

-- Recreate Marks table with constraints
CREATE TABLE Marks (
    mark_id INT PRIMARY KEY,
    student_id INT,
    subject VARCHAR(50) NOT NULL,
    marks INT CHECK (marks BETWEEN 0 AND 100),
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);
CREATE VIEW StudentAverageMarks AS
SELECT 
    s.name,
    AVG(m.marks) AS average_marks
FROM 
    Students s
JOIN 
    Marks m ON s.student_id = m.student_id
GROUP BY 
    s.name;
    START TRANSACTION;

-- Sample operations
INSERT INTO Students (student_id, name, age, email) VALUES (101, 'Alice', 20, 'alice@example.com');
INSERT INTO Marks (mark_id, student_id, subject, marks) VALUES (201, 101, 'Math', 85);

-- Decide to commit or rollback
-- COMMIT; -- To save changes
-- ROLLBACK; -- To undo changes

-- TRUNCATE: Remove all data but keep the table structure
TRUNCATE TABLE Marks;

-- DROP: Delete the table completely
DROP TABLE IF EXISTS OldStudents;
mysqldump -u username -p database_name > backup.sql;
-- Export Students table to a file (PostgreSQL example)
COPY Students TO '/tmp/students_backup.csv' DELIMITER ',' CSV HEADER;



