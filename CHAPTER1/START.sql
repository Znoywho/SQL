CREATE TABLE TEACHER (
	ID bigserial,
	first_name varchar(25),
	last_name varchar(50),
	school varchar(50),
	hire_date date,
	salary numeric
);
-- Create the table

drop table teacher;


INSERT INTO TEACHER (first_name, last_name, school, hire_date, salary)
values
	('Janet', 'Smith', 'F.D. Roosevelt HS', '2011-10-30', 36200),
	('Lee', 'Reynolds', 'F.D. Roosevelt HS', '1993-05-22', 65000),
	('Samuel', 'Cole', 'Myers Middle School', '2005-08-01', 43500),
	('Samantha', 'Bush', 'Myers Middle School', '2011-10-30', 36200),
	('Betty', 'Diaz', 'Myers Middle School', '2005-08-30', 43500),
	('Kathleen', 'Roush', 'F.D. Roosevelt HS', '2010-10-22', 38500);
	
TABLE TEACHER;
-- EQUALLY
SELECT * FROM TEACHER;

SELECT first_name, last_name, salary 
FROM TEACHER
ORDER BY salary DESC;
--DESC meaing decrease

SELECT first_name, last_name, school
from teacher 
where first_name = 'Janet';

SELECT first_name, last_name, salary
from teacher
order by 3 desc;
-- 3 mean the column of third

select last_name,school, hire_date
from teacher
order by school asc, hire_date desc;

select distinct school
from teacher
order by school;
-- Unique attribute

select distinct school, salary
from teacher
order by school, salary;

select school
from teacher
where school <> 'F.D. Roosevelt HS';

