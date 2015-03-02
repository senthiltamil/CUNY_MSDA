/*
	I was hired to do StudentActivity management database work for the IMAGINERY school. They already had a student registration system. I used Student table from student registration system (Student table design is given below).
	This effort required creation of 3 tables - 
	ActivityGroup table :- This table contains group names for the Activities. A group may contain one or more Activities.
	Activity table:- This contains all the activities supported by the school.  
	StudentActivity table:- This contains the students who are enrolled in one or more activities.

	Activity table and ActivityGroup table are one to many related
	Student table and StudentActivity table are many to many related
*/


--select convert_to_integer('100*')

drop table if exists StudentActivity;
drop table if exists Activity;
drop table if exists ActivityGroup;
drop table if exists Student;

Create table if not exists Student
(
	StudentID	int not null constraint PK_Student PRIMARY KEY,
	FName		varchar(100) not null,
	LName		varchar(100) not null,
	DOB		date not null,
	Address		varchar(500) NOT NULL,
	IsActive 	boolean null, --null or 1 is active, 0 is inactive. Discontinued student record will show 0
	Gender		char(1) null 
);

Insert into Student (StudentID, FName, LName, DOB, Address, IsActive, Gender) values (1,'Presley','Woods','02/04/2004','Zifkas Path,Veemuw,DE',TRUE,'F');
Insert into Student (StudentID, FName, LName, DOB, Address, IsActive, Gender) values (2,'Avery','Moran','03/05/2003','Vuhoh Court,Pigiteip,MS',FALSE,'F');
Insert into Student (StudentID, FName, LName, DOB, Address, IsActive, Gender) values (3,'Harrison','McCoy','04/06/2004','Fivo Street,Pigferusu,MI',TRUE,'F');
Insert into Student (StudentID, FName, LName, DOB, Address, IsActive, Gender) values (4,'Wesley','Castillo','05/07/2004','Reva Mill,Gotnomu,TX',TRUE,'M');
Insert into Student (StudentID, FName, LName, DOB, Address, IsActive, Gender) values (5,'Hayden','Parker','06/08/2002','Uvbum Extension,Tilallep,TX',TRUE,'F');
Insert into Student (StudentID, FName, LName, DOB, Address, IsActive, Gender) values (6,'David','Manning','07/02/2004','Evwo Mill,Julihav,NE',TRUE,'M');
Insert into Student (StudentID, FName, LName, DOB, Address, IsActive, Gender) values (7,'Lukas','Logan','08/03/2001','Sorlig Way,Wowcozpe,WA',TRUE,'F');
Insert into Student (StudentID, FName, LName, DOB, Address, IsActive, Gender) values (8,'Quinn','Peters','09/09/2004','Rurnih Pike,Manowtij,AK',TRUE,NULL);
Insert into Student (StudentID, FName, LName, DOB, Address, IsActive, Gender) values (9,'Willow','Quinn','10/10/2004','Usuca View,Delionu,AP',TRUE,'F');
Insert into Student (StudentID, FName, LName, DOB, Address, IsActive, Gender) values (10,'Emmett','Hansen','11/11/1999','Valon Circle,Velhaek,HI',TRUE,'F');
Insert into Student (StudentID, FName, LName, DOB, Address, IsActive, Gender) values (11,'Asher','Gardner','12/12/2004','Itueba Parkway,Bemaalo,UT',FALSE,'M');
Insert into Student (StudentID, FName, LName, DOB, Address, IsActive, Gender) values (12,'Katie','Stone','01/01/2005','Aniami Pike,Gepsawez,AZ',TRUE,'F');
Insert into Student (StudentID, FName, LName, DOB, Address, IsActive, Gender) values (13,'Willow','Kim','02/02/2007','Sabra Heights,Boekabej,HI',TRUE,'M');
Insert into Student (StudentID, FName, LName, DOB, Address, IsActive, Gender) values (14,'Ruby','Obrien','03/08/2005','Awowo Trail,Jidaztow,TX',TRUE,'F');
Insert into Student (StudentID, FName, LName, DOB, Address, IsActive, Gender) values (15,'Norah','Harmon','04/09/2009','Wate Circle,Hagogli,IN',TRUE,'F');
Insert into Student (StudentID, FName, LName, DOB, Address, IsActive, Gender) values (16,'Colin','Guzman','05/11/2005','Ahufob Center,Zuwamono,WA',FALSE,'F');
Insert into Student (StudentID, FName, LName, DOB, Address, IsActive, Gender) values (17,'Antonio','Webb','06/04/2008','Kotu Highway,Zijisha,NJ',TRUE,'F');
Insert into Student (StudentID, FName, LName, DOB, Address, IsActive, Gender) values (18,'Hailey','Hicks','07/03/2005','Zosa Road,Voroghev,CA',TRUE,'M');
Insert into Student (StudentID, FName, LName, DOB, Address, IsActive, Gender) values (19,'Catherine','Ortega','08/05/2008','Pekpo Boulevard,Muhwitov,CA',TRUE,'F');
Insert into Student (StudentID, FName, LName, DOB, Address, IsActive, Gender) values (20,'Lily','Rowe','09/07/2005','Zanuh Terrace,Middimke,OH',TRUE,'M');
Insert into Student (StudentID, FName, LName, DOB, Address, IsActive, Gender) values (21,'Camila','Marshall','10/02/2003','Gusuf Lane,Eposoid,CO',TRUE,'F');
Insert into Student (StudentID, FName, LName, DOB, Address, IsActive, Gender) values (22,'Jesus','Rowe','11/09/2003','Cughe Center,Voolda,MA',FALSE,'F');
Insert into Student (StudentID, FName, LName, DOB, Address, IsActive, Gender) values (23,'Jorge','Maxwell','12/10/2005','Ewisew Circle,Gekvaan,CA',TRUE,'F');
Insert into Student (StudentID, FName, LName, DOB, Address, IsActive, Gender) values (24,'Jeremy','Horton','01/01/2003','Vemu Junction,Semgaljuh,WA',TRUE,'F');
Insert into Student (StudentID, FName, LName, DOB, Address, IsActive, Gender) values (25,'Autumn','Powers','02/11/2003','Rogeh Parkway,Impovo,SD',TRUE,NULL);

select * from Student;


Create table if not exists ActivityGroup
(
	GroupID		int not null constraint PK_ActivityGroup PRIMARY KEY,
	GroupName	varchar(100) NOT NULL
);

Insert into ActivityGroup (GroupID, GroupName) values (1, 'Indoor Games');
Insert into ActivityGroup (GroupID, GroupName) values (2, 'Outdoor Sports');
Insert into ActivityGroup (GroupID, GroupName) values (3, 'Art');



create table if not exists Activity
(
	ActivityID int not null constraint PK_Activity PRIMARY KEY,
	GroupID	int not null constraint FK_ActivityGroup_GroupID references ActivityGroup(GroupID),
	ActivityName	varchar(100) not null,
	IsActive	boolean null  -- nvell or 1 is active, 0 is inactive. If school discontinues an activity then IsActive will be set to 0
);

Insert into Activity (ActivityID, GroupID, ActivityName, IsActive) values (1,1,'PingPong',TRUE);
Insert into Activity (ActivityID, GroupID, ActivityName, IsActive) values (2,1,'Chess',TRUE);
Insert into Activity (ActivityID, GroupID, ActivityName, IsActive) values (3,2,'BaseketBall',NULL);
Insert into Activity (ActivityID, GroupID, ActivityName, IsActive) values (4,2,'BaseBall',TRUE);
Insert into Activity (ActivityID, GroupID, ActivityName, IsActive) values (5,3,'Dance',NULL);
Insert into Activity (ActivityID, GroupID, ActivityName, IsActive) values (6,3,'Singing',FALSE);




Create table if not exists StudentActivity
(
	StudentID		int not null constraint FK_Student_StudentID references Student(StudentID),
	ActivityID		int not null constraint FK_Activity_ActivityID references Activity(ActivityID),
	constraint PK_StudentActivity PRIMARY KEY (StudentID, ActivityID)
);

Insert into StudentActivity (StudentID, ActivityID) values (1,1);
Insert into StudentActivity (StudentID, ActivityID) values (2,2);
Insert into StudentActivity (StudentID, ActivityID) values (3,3);
Insert into StudentActivity (StudentID, ActivityID) values (4,4);
Insert into StudentActivity (StudentID, ActivityID) values (5,5);
Insert into StudentActivity (StudentID, ActivityID) values (6,6);

Insert into StudentActivity (StudentID, ActivityID) values (8,2);
Insert into StudentActivity (StudentID, ActivityID) values (9,3);
Insert into StudentActivity (StudentID, ActivityID) values (10,4);
Insert into StudentActivity (StudentID, ActivityID) values (11,5);
Insert into StudentActivity (StudentID, ActivityID) values (12,6);
Insert into StudentActivity (StudentID, ActivityID) values (13,1);
Insert into StudentActivity (StudentID, ActivityID) values (14,2);

Insert into StudentActivity (StudentID, ActivityID) values (16,4);
Insert into StudentActivity (StudentID, ActivityID) values (17,5);
Insert into StudentActivity (StudentID, ActivityID) values (18,6);
Insert into StudentActivity (StudentID, ActivityID) values (19,1);
Insert into StudentActivity (StudentID, ActivityID) values (20,2);
Insert into StudentActivity (StudentID, ActivityID) values (21,3);
Insert into StudentActivity (StudentID, ActivityID) values (22,4);
Insert into StudentActivity (StudentID, ActivityID) values (23,5);
Insert into StudentActivity (StudentID, ActivityID) values (24,6);

Insert into StudentActivity (StudentID, ActivityID) values (8,1);
Insert into StudentActivity (StudentID, ActivityID) values (9,2);
Insert into StudentActivity (StudentID, ActivityID) values (10,3);
Insert into StudentActivity (StudentID, ActivityID) values (11,4);
Insert into StudentActivity (StudentID, ActivityID) values (12,5);
Insert into StudentActivity (StudentID, ActivityID) values (13,6);

-----------------------------------------------------------------------------------------

-- Activities of a given student
select s.studentid, s.fname, s.lname, a.activityname
from StudentActivity as sa
	join Student as s on s.StudentID = sa.StudentID
	join Activity as a on a.ActivityID = sa.ActivityID
where sa.StudentID = 8;

------------------------------------------------------------------
-- Students enrolled in a given activity
select s.studentid, s.fname, s.lname, a.activityname
from StudentActivity as sa
	join Student as s on s.StudentID = sa.StudentID
	join Activity as a on a.ActivityID = sa.ActivityID
where a.ActivityName = 'Chess';

-- students enrolled in only one activity
select s.StudentID, s.fname, s.lname--, min(a.activityname), max(a.activityname)
from StudentActivity as sa
	join Student as s on s.StudentID = sa.StudentID
	join Activity as a on a.ActivityID = sa.ActivityID
group by s.studentid, s.fname, s.lname
having count(1) = 1
order by s.studentid;

-- Students who have not enrolled in any game
select s.StudentID, s.fname, s.lname
from  Student as s
	left join StudentActivity as sa on sa.StudentID = s.StudentID
where sa.StudentID is null;

-- Students activities enrollment by gender - showing NULL value handling
select COALESCE(s.Gender, 'Unspecified') as Gender, count(1)
from StudentActivity as sa
	join Student as s on s.StudentID = sa.StudentID
	join Activity as a on a.ActivityID = sa.ActivityID
group by COALESCE(s.Gender, 'Unspecified')
order by 1;

-- showing NULL value handling through right join :- Students enrollment in at least one activity by gender
drop table if exists GenderTemp;

CREATE TEMP TABLE GenderTemp AS
SELECT 'M' as Gender, 95 AS ExpectedEnrollmentPercentage
union
SELECT 'F' as Gender, 90 
;

select COALESCE(gt.Gender, 'Unspecified') as Gender, gt.ExpectedEnrollmentPercentage, cast(agg2.GenderEnrollment/cast(agg1.GenderCount as float) * 100 as numeric(10,2)) as ActualEnrollmentPercentage,
	agg1.GenderCount, agg2.GenderEnrollment 
from GenderTemp as gt
	right join (
		select s.Gender, count(s.StudentID) as GenderCount
		from Student as s
		group by Gender
	) as agg1 on agg1.Gender = gt.Gender
	left  join (
		select s.Gender, count(distinct s.StudentID) as GenderEnrollment
		from StudentActivity as sa
			join Student as s on s.StudentID = sa.StudentID
		group by s.Gender
	) as agg2 on COALESCE(agg2.Gender,'U') = COALESCE(agg1.Gender, 'U')
order by case when agg1.Gender = 'M' then 1 when agg1.Gender = 'F'  then 2 else 3 end;


-- select * from Student as s where Gender = 'M';
-- select * from Student as s where Gender = 'F';
-- select * from Student as s where Gender not in ('F', 'M'); -- returns no row
-- select * from Student as s where Gender is null

-- select distinct sa.StudentID from StudentActivity as sa where sa.StudentID in (select StudentID from Student as s where Gender = 'M') order by sa.StudentID;
-- select distinct sa.StudentID from StudentActivity as sa where sa.StudentID in (select StudentID from Student as s where Gender = 'F') order by sa.StudentID;
-- select distinct sa.StudentID from StudentActivity as sa where sa.StudentID in (select StudentID from Student as s where Gender is null) order by sa.StudentID;

-- Showing the power of referential integrity -- The following should throw an error when ran. Following delete statement must be uncommented first
-- delete from Student where StudentID = 8

