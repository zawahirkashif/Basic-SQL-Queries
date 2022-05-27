/*Create Table*/

CREATE TABLE t(
t_id INT PRIMARY KEY,
 gender ENUM('M','F'),
e_mail VARCHAR(20),
contact INT(20),
city CHAR(20),
t_name VARCHAR(20)
);

/*Fetch Data From Table*/

SELECT * FROM t ;

/*Deletion*/

INSERT INTO t VALUES(1,'M','zawahri@gmail.com',5656456,'Karachi','Mr.Zawahir'),(2,'F','Azeez@gmail.com',5645645654,'isl','Mr.Azeez');

/*Alter Table*/

ALTER TABLE t ADD COLUMN s_id INT;

/*Update Values*/

UPDATE t SET t_name='Zawahir'WHERE t_id=1;

/*Drop Table*/

DROP TABLE t;

/*Deletion*/

DELETE FROM t WHERE t_id=2;

/*Multi Line Insertion*/

INSERT INTO t (t_id,gender,e_mail,contact,city,t_name) VALUES
(2,'F','Rukhsar@gmail.com',5464564,'isl','Ruksar'),
(3,'F','huda@gmail.com',5464564,'khi','Huda'),
(4,'F','Farheen@gmai.com',5464564,'lhr','Farheen');

/*Update Data*/

UPDATE t SET t_name='Ruqaiya', e_mail='Ruqaiya@gmail.com'  WHERE t_id=4;