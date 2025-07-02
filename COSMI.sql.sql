create database internship_db;
create table students(
student_name varchar(50),
student_id int,
department varchar(50),
student_age int);
Insert into students(student_name,student_id,department,student_age)values
("Azhar",1,"computer Science",20),
("Abdullah",2,"computer science",20),
("Aziz",3,"Physics",22);
select*from students;
update students
set student_age=22
where student_name="Azhar";
DELETE FROM students
WHERE student_id = 2;
SELECT *
FROM students
WHERE student_age > 20;
SELECT *
FROM students
ORDER BY student_name ASC, student_age DESC;
SELECT *
FROM students
WHERE department IN ('Computer Science', 'Physics');
SELECT *
FROM students
WHERE student_name LIKE 'A%';
set sql_safe_updates=0;