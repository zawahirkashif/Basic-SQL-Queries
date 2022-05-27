CREATE DATABASE D1;
USE D1;
CREATE TABLE Customer
(
CUSID INT (50),
CUSNAME VARCHAR (50),
ADDRESS VARCHAR (50),
SALARY VARCHAR (50),
PRIMARY KEY(CUSID)
);

DELIMITER $$
CREATE PROCEDURE alldata()
BEGIN
SELECT * FROM Customer;
END$$
DELIMITER ;

CALL alldata();

DELIMITER $
CREATE PROCEDURE localvar()
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

CALL localvar();

DELIMITER &
CREATE PROCEDURE uservar()
BEGIN
SET @a=2;
SET @b=3;
SET @c=@a+@b;
SELECT @a,@b,@c;
END&
DELIMITER ;

CALL uservar();

DELIMITER $$$
CREATE PROCEDURE paravar(IN input INT)
BEGIN
SELECT * FROM Customer LIMIT input;
END$$$
DELIMITER ;

CALL paravar(1);

DELIMITER $$$$
CREATE PROCEDURE outvar(OUT maxi INT)
BEGIN
SELECT MAX(SALARY)INTO maxi FROM Customer;
SELECT @m;
END$$$$
DELIMITER ;

CALL outvar(@m);

ALTER TABLE Customer
ADD COLUMN GENDER ENUM ('M','F');

DELIMITER $$$$$
CREATE PROCEDURE inoutvar(INOUT mf INT,IN cusgen CHAR(1))
BEGIN
SELECT COUNT(GENDER)INTO mf FROM Customer WHERE GENDER= cusgen;
SELECT @k;
END$$$$$
DELIMITER ;

CALL inoutvar(@k,'M');

CALL inoutvar(@k,'F');
