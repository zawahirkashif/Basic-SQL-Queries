CREATE DATABASE DA

USE DA

CREATE USER ‘Ali’ IDENTIFIED BY 'mypass';

CREATE USER ‘Fahad’ IDENTIFIED BY 'mypaSS';

GRANT ALL PRIVILEGES
ON emp 
TO Ali;

GRANT CREATE
ON emp TO Fahad;