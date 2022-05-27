
CREATE DATABASE collage;
USE collage;
CREATE TABLE student(
s_id INT PRIMARY KEY,
 gender ENUM('M','F'),
e_mail VARCHAR(20),
contact INT(20),
city CHAR(20)
);
SELECT * FROM student;

ALTER TABLE student ADD COLUMN s_name VARCHAR(25);
TRUNCATE TABLE student;
ALTER TABLE student ADD COLUMN percentage FLOAT(2,2);
ALTER TABLE student MODIFY COLUMN contact FLOAT(2,2);
ALTER TABLE student MODIFY COLUMN contact INT(20);
ALTER TABLE student MODIFY COLUMN percentage FLOAT(2,2);
ALTER TABLE student DROP COLUMN percentage;
ALTER TABLE student DROP COLUMN city;
ALTER TABLE student ADD COLUMN marks INT;


CREATE TABLE teacher(
t_id INT PRIMARY KEY,
 gender ENUM('M','F'),
e_mail VARCHAR(20),
contact INT(20),
city CHAR(20),`teacher`
t_name VARCHAR(20)
);
SELECT * FROM teacher ;


INSERT INTO teacher VALUES(13,'M','ali@gmail.com',78923787,'lahore','mr.ali'),(14,'F','hiba@gmail.com',9878798797,'isl','mrs.hiba');
ALTER TABLE teacher DROP COLUMN s_id;
ALTER TABLE teacher ADD COLUMN t_id INT PRIMARY KEY;
UPDATE TABLE teacher SET t_name='Drjaved' , e_mail='Drjaved@gmail.com' WHERE t_name='mr.ali';
DROP TABLE teacher;

CREATE TABLE employee(
s_id INT PRIMARY KEY,
 gender ENUM('M','F'),
e_mail VARCHAR(20),
contact INT(20),
city CHAR(20),
e_name VARCHAR(20)
); 
SELECT * FROM employee;
DELETE FROM employee WHERE s_id=2;

CREATE TABLE teacher(
t_id INT PRIMARY KEY,
 gender ENUM('M','F'),
e_mail VARCHAR(20),
contact INT(20),
city CHAR(20),
t_name VARCHAR(20)
);
SELECT * FROM teacher ;

INSERT INTO teacher VALUES(11,'M','ali@gmail.com',78923787,'lahore','mr.ali'),
(12,'F','hiba@gmail.com',9878798797,'isl','mrs.hiba'),
(13,'F','hanadia@gmail.com',8997989,'karachi','mrs.hanadia'),
(14,'M','hina@gmai.com',899890809,'india','mrs.hina');

UPDATE teacher SET t_name='mrs.sana', e_mail='sana@gmail.com'  WHERE t_id=12;

DELETE FROM teacher WHERE t_id=12;


SELECT DISTINCT city FROM teacher;
SELECT t_id,t_name ,contact,e_mail FROM teacher WHERE city IN('karachi','bangladesh');

SELECT t_id,t_name ,contact,e_mail FROM teacher WHERE t_name='mrs.hanadia' AND city='karachi';
SELECT t_id,t_name ,contact,e_mail FROM teacher WHERE t_name='mrs.hanadia' OR city='karachi';

SELECT t_id,t_name ,contact,e_mail FROM teacher WHERE t_name='mrs.shumaila' OR t_name='mrs.haya';

SELECT t_id,t_name,contact FROM teacher ;
SELECT t_id,t_name,contact FROM teacher ORDER BY t_id ASC;
SELECT t_id,t_name,contact FROM teacher ORDER BY t_name ASC;

SELECT t_id,t_name,contact FROM teacher ORDER BY t_id DESC;

SELECT t_id,t_name,city,contact FROM teacher LIMIT 3;

SELECT t_id,t_name,city,contact FROM teacher 
WHERE t_id=11
AND (t_name='ali' 
OR city='lahore');

ALTER TABLE teacher ADD COLUMN t_points INT;
SELECT * FROM teacher WHERE t_points>5 AND t_points<=10;

SELECT t_name FROM teacher LIMIT 2,3;

SELECT * FROM teacher WHERE t_points BETWEEN 5 AND 10; 

SELECT * FROM teacher WHERE t_name LIKE '%a';



SELECT NOW();
SELECT VERSION();
SELECT CONCAT(t_name,"",e_mail,"",city) AS information FROM teacher;

SELECT CHAR_LENGTH('mr.ali');

SELECT INSTR('mr.ali','ali');

SELECT LEFT('karchi',3);

SELECT RIGHT('karachi',3);

SELECT REVERSE('karachi');

SELECT UPPER('karachi');

SELECT LOWER('karachi');

SELECT TRIM('karachi');

SELECT SUBSTRING('karachi',3);

SELECT SUBSTRING('karachi',3,2);

SELECT CONCAT_WS(t_name,"/",e_mail,"/",city) AS information FROM teacher;

ALTER TABLE teacher ADD COLUMN doj DATE;
SELECT TIME_FORMAT(doj,"%b%d%y")FROM teacher;



ALTER TABLE teacher ADD COLUMN salary INT; 
ALTER TABLE teacher ADD COLUMN depart VARCHAR(30);

SELECT t_name, MAX(salary) FROM teacher ;
SELECT t_name, salary FROM teacher WHERE salary=(SELECT MAX(salary) FROM teacher) GROUP BY depart;
SELECT t_name, MAX(salary) FROM teacher GROUP BY depart;
SELECT t_name, salary FROM teacher WHERE salary IN(SELECT MAX(salary) FROM teacher) GROUP BY depart;

SELECT t_name, salary FROM teacher WHERE salary >(SELECT AVG(salary) FROM teacher);

SELECT t_name, MAX(salary) AS salary FROM teacher
 WHERE salary < (SELECT MAX(salary) FROM teacher); 
 
 
 SELECT SUM(salary) FROM teacher;

SELECT t_name, salary FROM teacher WHERE salary >(SELECT COUNT(salary) FROM teacher);



SELECT COUNT(*) AS myCount FROM teacher WHERE salary> 4000;

SELECT  COUNT(DISTINCT t_name) AS mycount FROM teacher;

SELECT MIN(salary) AS myMin, MAX(salary) AS myMax,AVG(salary) AS myAvg FROM teacher;



SELECT t_name, MAX(salary) AS salary FROM teacher
 WHERE salary < (SELECT MAX(salary) FROM teacher); 


CREATE TABLE xteachers(
id_Ref INT,
FOREIGN KEY (id_Ref) REFERENCES teacher(t_id),
id INT ,
x_name VARCHAR(20),
salary VARCHAR(20)
);




CREATE TABLE subjects(
sub_id INT PRIMARY KEY,
t_id INT,
sub_name VARCHAR(20),
FOREIGN KEY(t_id) REFERENCES teacher(t_id) 
);

SELECT * FROM subjects; 
--INNER_JOIN
SELECT sub_id,sub_name,t_name,city FROM teacher 
INNER JOIN subjects ON teacher.t_id = subjects.t_id;

SELECT t_name,city,salary ,sub_name FROM teacher 
RIGHT JOIN subjects ON teacher.t_id = subjects.t_id;

SELECT t_name,city,salary ,sub_name FROM teacher 
LEFT JOIN subjects ON teacher.t_id = subjects.t_id;
 
SELECT * FROM teacher 
LEFT JOIN subjects ON teacher.t_id = subjects.t_id
UNION ALL
SELECT * FROM teacher 
RIGHT JOIN subjects ON teacher.t_id = subjects.t_id;


--procedures
CREATE TABLE C
(
C_id INT PRIMARY KEY,
C_name VARCHAR (50),
address VARCHAR (50),
salary INT
);

DELIMITER $$
CREATE PROCEDURE alldatashow()
BEGIN
SELECT * FROM C;
END$$
DELIMITER ;

CALL alldatashow();

DELIMITER $
CREATE PROCEDURE local_var()
BEGIN
DECLARE a INT;
DECLARE b INT;
DECLARE c INT;
SET a=2;
SET b=5;
SET c=a+b;
SELECT a,b,c;
END$
DELIMITER ;

CALL local_var();

DELIMITER &
CREATE PROCEDURE user_var()
BEGIN
SET @a=2;
SET @b=3;
SET @c=@a+@b;
SELECT @a,@b,@c;
END&
DELIMITER ;

CALL user_var();

DELIMITER $$$
CREATE PROCEDURE para_var(IN input INT)
BEGIN
SELECT * FROM c LIMIT input;
END$$$
DELIMITER ;

CALL para_var(1);

DELIMITER $$$$
CREATE PROCEDURE out_var(OUT maxi INT)
BEGIN
SELECT MAX(SALARY)INTO maxi FROM C;
SELECT @m;
END$$$$
DELIMITER ;
CALL out_var(@m);

ALTER TABLE C
ADD COLUMN GENDER ENUM ('M','F');

DELIMITER $$$$$
CREATE PROCEDURE in_out_var(INOUT mf INT,IN cus_g CHAR(1))
BEGIN
SELECT COUNT(GENDER)INTO mf FROM C WHERE GENDER= cus_g;
SELECT @k;
END$$$$$
DELIMITER ;
CALL in_out_var(@k,'M');

CALL in_out_var(@k,'F');