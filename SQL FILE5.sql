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
