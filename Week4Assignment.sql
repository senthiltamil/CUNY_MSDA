drop table if exists Employee;

Create table if not exists Employee
(
	EmpID	int not null constraint PK_Employee primary key,
	EmpFName varchar(100) NOT NULL,
	EmpLName varchar(100) NOT NULL,
	Designation varchar(20) NOT NULL,
	Manager	int constraint FK_Employee_1 references Employee(EmpID)
);

Insert into Employee (EmpID, EmpFName, EmpLName, Designation, Manager) values (1, 'The', 'CEO', 'CEO', null);

Insert into Employee (EmpID, EmpFName, EmpLName, Designation, Manager) values (2, 'Marketing', 'Head', 'MarketingHead', 1);
Insert into Employee (EmpID, EmpFName, EmpLName, Designation, Manager) values (3, 'Finance', 'Officer', 'CFO', 1);
Insert into Employee (EmpID, EmpFName, EmpLName, Designation, Manager) values (4, 'Technology', 'Officer', 'CTO', 1);

/* Under Technology Officer'*/
Insert into Employee (EmpID, EmpFName, EmpLName, Designation, Manager) values (5, 'Operational', 'Manager', 'VP', 4);
Insert into Employee (EmpID, EmpFName, EmpLName, Designation, Manager) values (6, 'Application', 'Manager', 'VP', 4);

/*Under Application Manager*/

Insert into Employee (EmpID, EmpFName, EmpLName, Designation, Manager) values (7, 'Senior', 'Programmer', 'Developer', 6);
Insert into Employee (EmpID, EmpFName, EmpLName, Designation, Manager) values (8, 'Junior', 'Programmer', 'Developer', 6);

/*Under Operational Manager*/
Insert into Employee (EmpID, EmpFName, EmpLName, Designation, Manager) values (9, 'Desktop', 'Support', 'ITSupport', 6);
Insert into Employee (EmpID, EmpFName, EmpLName, Designation, Manager) values (10, 'Network', 'Support', 'SystemEngineer', 6);

/*Under Finance Officer*/
Insert into Employee (EmpID, EmpFName, EmpLName, Designation, Manager) values (11, 'Accounts', 'Payable', 'Manager', 3);
Insert into Employee (EmpID, EmpFName, EmpLName, Designation, Manager) values (12, 'Accounts', 'Receivable', 'Manager', 3);

/*Under Accounts Receivable*/
Insert into Employee (EmpID, EmpFName, EmpLName, Designation, Manager) values (13, 'AR', 'Specialist1', 'Accountant', 11);
Insert into Employee (EmpID, EmpFName, EmpLName, Designation, Manager) values (14, 'AR', 'Specialist2', 'Accountant', 11);

------------------------------------------------------------------------------------------------------------------------------------------

-- simple select (Manager with Employee)
select e.empfname || ' ' || e.emplname as EmployeeName, e.designation, m.empfname || ' ' || m.emplname as ManagerName, m.designation
from Employee as E
	left join Employee as M on m.empid = e.manager
order by e.empid;

-- Get employee with no boss (root level)
select *
from Employee as E
where E.Manager is null;

-- Get an employee with no subordinate (leaf level)
select E.*
from Employee as E	
	left join Employee as M on M.Manager = E.EmpID
where M.EmpID is null;

---

with recursive managerinfo(empid, empname, manager, managername)
as
(
	select e.empid, e.empfname || ' ' || e.emplname as empname, m.manager, m.empfname || ' ' || m.emplname  as ManagerName
	from Employee as e
		left join Employee as m on m.empid = e.manager
	--where e.empid = 7
	union all
	select e.empid, e.empname, m.manager, m.empfname || ' ' || m.emplname  as ManagerName
	from managerinfo as e
		join employee as m on m.empid = e.manager
)

select empid, min(empname) as empname, array_agg(managername) as ManagersNameHierarchy from managerinfo group by empid order by empid, ManagersNameHierarchy





