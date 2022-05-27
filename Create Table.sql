/*
Insert the following data into the following table
	Movie (id, title, year, director)
	
Id	Title			Year		Director
1	Ben hur			2016		Thomas
2	Get Smart		2012		Richard Bell
3	Spider Man		2009		Tam Morry
4	Batman V/S Super Man	2015		Gerald Hond

*/

CREATE DATABASE Lab_2;
USE Lab_2;

CREATE TABLE Movies
(
id INT PRIMARY KEY, 
title VARCHAR(30), 
year_Release YEAR, 
director VARCHAR(30)
);

/*Insert the following data into the following table
	Movie (id, title, year, director)*/

INSERT INTO Movies VALUES(1,"Ben Hur","2016","Thomas");

INSERT INTO Movies VALUES(2,"Get Smart","2012","Richard Bell");

INSERT INTO Movies VALUES(3,"Spider Man","2009","Tam Morry");

INSERT INTO Movies VALUES(4,"Batman V/S Super Man","2015","Gerald Hond");

SELECT * FROM Movies

