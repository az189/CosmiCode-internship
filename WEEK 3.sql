create database internship_db;
set sql_safe_updates=0;
drop table students;
use internship_db;
/* CREATION OF TABLES */
CREATE TABLE students (
student_id INT PRIMARY KEY,
name VARCHAR(50)
);
CREATE TABLE marks (
    mark_id INT PRIMARY KEY,
    student_id INT,
    subject VARCHAR(50),
    score INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);
/* INSERTION */
INSERT INTO students (student_id, name) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie');

INSERT INTO marks (mark_id, student_id, subject, score) VALUES
(1, 1, 'Math', 85),
(2, 1, 'Science', 90),
(3, 1, 'English', 78),
(4, 2, 'Math', 88),
(5, 2, 'Science', 76),
(6, 2, 'English', 80),
(7, 3, 'Math', 60),
(8, 3, 'Science', 65),
(9, 3, 'English', 70);
/* FUNCTIONS */
SELECT
    COUNT(*) AS total_scores,
    SUM(score) AS total_marks,
    AVG(score) AS average_score,
    MIN(score) AS lowest_score,
    MAX(score) AS highest_score
FROM marks;
/* GROUP BY*/
SELECT
    student_id,
    AVG(score) AS average_score
FROM marks
GROUP BY student_id;
/* HAVING BY */
SELECT
    student_id,
    AVG(score) AS average_score
FROM marks
GROUP BY student_id
HAVING AVG(score) > 80;
/* INNER JOIN */
SELECT
    s.student_id,
    s.name,
    m.subject,
    m.score
FROM students s
INNER JOIN marks m ON s.student_id = m.student_id;
