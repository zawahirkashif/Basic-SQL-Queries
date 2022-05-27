/*Lab 6 to 8*/
CREATE TABLE t(
t_id INT PRIMARY KEY,
 gender ENUM('M','F'),
e_mail VARCHAR(20),
contact INT(20),
city CHAR(20),
t_name VARCHAR(20)
);
SELECT * FROM t ;


INSERT INTO t VALUES(1,'M','zawahri@gmail.com',5656456,'khi','Mr.Zawahir'),(2,'F','Azeez@gmail.com',5645645654,'isl','Mr.Azeez');
ALTER TABLE t ADD COLUMN s_id INT;
UPDATE t SET t_name='Zawahir'WHERE t_id=1;
DROP TABLE t;
/*Deletion*/
DELETE FROM t WHERE t_id=2;
/*Multi Line Insertion*/
INSERT INTO t (t_id,gender,e_mail,contact,city,t_name) VALUES
(2,'F','Rukhsar@gmail.com',5464564,'isl','Ruksar'),
(3,'F','huda@gmail.com',5464564,'khi','Huda'),
(4,'F','Farheen@gmai.com',5464564,'lhr','Farheen');

UPDATE t SET t_name='Ruqaiya', e_mail='Ruqaiya@gmail.com'  WHERE t_id=4;
/**/
SELECT DISTINCT city FROM t;
SELECT t_id,t_name ,contact,e_mail FROM t WHERE city IN('khi','bangladesh');

SELECT t_id,t_name ,contact,e_mail FROM t WHERE t_name='Huda' AND city='khi';
SELECT t_id,t_name ,contact,e_mail FROM t WHERE t_name='Huda' OR city='khi';

SELECT t_id,t_name ,contact,e_mail FROM t WHERE t_name='Farheen' OR t_name='Ruksar';

SELECT t_id,t_name,contact FROM t ;
SELECT t_id,t_name,contact FROM t ORDER BY t_id ASC;
SELECT t_id,t_name,contact FROM t ORDER BY t_name ASC;

SELECT t_id,t_name,contact FROM t ORDER BY t_id DESC;

SELECT t_id,t_name,city,contact FROM t LIMIT 3;

SELECT t_id,t_name,city,contact FROM t WHERE t_id=4 AND (t_name='Farheen' OR city='lhr');

ALTER TABLE t ADD COLUMN t_points INT;
SELECT * FROM t WHERE t_points>2 AND t_points<=5;

SELECT t_name FROM t LIMIT 2,3;

SELECT * FROM t WHERE t_points BETWEEN 2 AND 5; 

SELECT * FROM t WHERE t_name LIKE '%a';

SELECT NOW();
SELECT VERSION();
SELECT CONCAT(t_name,"",e_mail,"",city) AS information FROM t;

SELECT CHAR_LENGTH('zawahir');

SELECT INSTR('Zawahir','Ruqaiya');

SELECT LEFT('khi',3);

SELECT RIGHT('khi',3);

SELECT REVERSE('khi');

SELECT UPPER('khi');

SELECT LOWER('khi');

SELECT TRIM('khi');

SELECT SUBSTRING('khi',3);

SELECT SUBSTRING('khi',3,2);

SELECT CONCAT_WS(t_name,"/",e_mail,"/",city) AS information FROM t;

ALTER TABLE t ADD COLUMN doj DATE;
SELECT TIME_FORMAT(doj,"%b%d%y")FROM t;

ALTER TABLE t ADD COLUMN salary INT; 
ALTER TABLE t ADD COLUMN depart VARCHAR(30);

SELECT t_name, MAX(salary) FROM t ;
SELECT t_name, salary FROM t WHERE salary=(SELECT MAX(salary) FROM t) GROUP BY depart;
SELECT t_name, MAX(salary) FROM t GROUP BY depart;
SELECT t_name, salary FROM t WHERE salary IN(SELECT MAX(salary) FROM t) GROUP BY depart;

SELECT t_name, salary FROM t WHERE salary >(SELECT AVG(salary) FROM t);

SELECT t_name, MAX(salary) AS salary FROM t
 WHERE salary < (SELECT MAX(salary) FROM t); 
 
 
 SELECT SUM(salary) FROM t;

SELECT t_name, salary FROM t WHERE salary >(SELECT COUNT(salary) FROM t);

SELECT COUNT(*) AS myCount FROM t WHERE salary> 4000;

SELECT  COUNT(DISTINCT t_name) AS mycount FROM t;

SELECT MIN(salary) AS myMin, MAX(salary) AS myMax,AVG(salary) AS myAvg FROM t;



SELECT t_name, MAX(salary) AS salary FROM t
 WHERE salary < (SELECT MAX(salary) FROM t); 


CREATE TABLE t1
(
t_id INT,
FOREIGN KEY (t_id) REFERENCES t(t_id),
id INT PRIMARY KEY ,
t1_name VARCHAR(20),
salary VARCHAR(20)
);
