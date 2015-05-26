drop table if exists Student;

create table if not exists Student
(
	school char(2) NOT NULL,
	sex char(1) NOT NULL,
	age int NOT NULL,
	address char(1) NOT NULL,
	famsize char(3) NOT NULL,
	Pstatus char(1) NOT NULL,
	Medu int NOT NULL,
	Fedu int NOT NULL,
	Mjob varchar(10) NOT NULL,
	Fjob varchar(10) NOT NULL,
	reason varchar(20) NOT NULL,
	guardian varchar(10) NOT NULL,
	traveltime int NOT NULL,
	studytime int NOT NULL,
	failures int NOT NULL,
	schoolsup char(3) NOT NULL,
	famsup char(3) NOT NULL,
	paid char(3) NOT NULL,
	activities char(3) NOT NULL,
	nursery char(3) NOT NULL,
	higher char(3) NOT NULL,
	internet char(3) NOT NULL,
	romantic char(3) NOT NULL,
	famrel int NOT NULL,
	freetime int NOT NULL,
	goout int NOT NULL,
	Dalc int NOT NULL,
	Walc int NOT NULL,
	health int NOT NULL,
	absences int NOT NULL,
	G1 int NOT NULL,
	G2 int NOT NULL,
	G3 int NOT NULL
);	

COPY Student FROM 'C:/senthil/MSDataAnalytics/Semester1/Projects/IS607/FinalProject/student/student-mat.csv' DELIMITER ';' CSV HEADER;

select *
from student
limit 100;