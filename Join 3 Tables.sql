CREATE DATABASE Assignment;
USE Assignment;

CREATE TABLE t1
(
Inquery_Id INT PRIMARY KEY AUTO_INCREMENT, 
NAME VARCHAR(30),
Contact VARCHAR(30),
Email VARCHAR(30)
);

CREATE TABLE t2
(
Enrollment_Id INT PRIMARY KEY AUTO_INCREMENT, 
Candidate_Name VARCHAR(30),
Candidate_Contact VARCHAR(30),
Candidate_Email VARCHAR(30),
Candidate_Qualifications_first_year INT,
Candidate_Qualifications_second_year INT,
Inquery_Id INT,
FOREIGN KEY (Inquery_Id) REFERENCES t1(Inquery_Id)
);

CREATE TABLE t3
(
Course_Id INT PRIMARY KEY AUTO_INCREMENT, 
Cource_Name VARCHAR(30),
Course_Credit_hours INT,
Teacher_Name VARCHAR(30),
Enrollment_Id INT,
Inquery_Id INT,
FOREIGN KEY (Enrollment_Id) REFERENCES t2(Enrollment_Id),
FOREIGN KEY (Inquery_Id) REFERENCES t1(Inquery_Id)
)

/*Three Table Joins*/
SELECT t1.NAME,t2.Enrollment_Id,t2.Candidate_Contact,t2.Candidate_Qualifications_first_year,t2.Candidate_Qualifications_Second_year,t3.Course_Id,t3.Cource_Name,t3.Course_Credit_hours  FROM t1
INNER JOIN t2 ON t1.Inquery_Id = t2.Inquery_Id
INNER JOIN t3 ON t2.Enrollment_Id = t3.Enrollment_Id

