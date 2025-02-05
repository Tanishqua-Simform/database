-- Database - Employee

-- DROP DATABASE IF EXISTS "Employee";

CREATE DATABASE "Employee"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_IN'
    LC_CTYPE = 'en_IN'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

-- Creating EmployeeInfo Table
CREATE TABLE EmployeeInfo(
EmpID int primary key,
EmpFname varchar(10) not null,
EmpLname varchar(10) not null,
Department varchar(10) not null,
Project varchar(5) not null,
Address varchar(20),
DOB Date not null,
Gender varchar(1) not null
);

-- Inserting data in EmployeeInfo Table
Insert into EmployeeInfo Values
(1,'Sanjay','Mehra','HR','P1','Hyderabad(HYD)','1976-12-01','M'),
(2,'Ananya','Mishra','Admin','P2','Delhi(DEL)','1968-05-02','F'),
(3,'Rohan','Diwan','Account','P3','Mumbai(BOM)','1980-01-01','M'),
(4,'Sonia','Kulkarni','HR','P1','Hyderabad(HYD)','1992-05-02','F'),
(5,'Ankit','Kapoor','Admin','P2','Delhi(DEL)','1994-07-03','M');

-- Show all entries
Select * from EmployeeInfo;

-- Creating EmployeePosition Table
CREATE TABLE EmployeePosition(
EmpID int Primary key,
EmpPosition varchar(10) not null,
DateOfJoining Date not null,
Salary int check(salary > 0) not null,
foreign key (EmpID) references EmployeeInfo(EmpID) 
);

-- Inserting data in EmployeePosition Table
INSERT INTO EmployeePosition VALUES
(1, 'Manager', '2022-05-01', 500000),
(2, 'Executive', '2022-05-02', 75000),
(3, 'Manager', '2022-05-01', 90000),
(4, 'Lead', '2022-05-02', 85000),
(5, 'Executive', '2022-05-01', 300000);

-- Show all entries
Select * from EmployeePosition;

-- 1. Write a query to fetch the number of employees working in the department ‘Admin’
Select Count(empID) as AdminCount from employeeinfo where department = 'Admin';

-- 2. Write a query to retrieve the first four characters of  EmpLname from the EmployeeInfo table.
Select left(EmpLname, 4) as TrimmedLname from employeeInfo;

-- 3. Write q query to find all the employees whose salary is between 50000 to 100000.
Select e.empFname || ' ' || e.empLname as name, p.salary from employeeInfo e Join employeePosition p on e.empID = p.empID where p.salary between 50000 and 100000;

-- 4. Write a query to find the names of employees that begin with ‘S’
Select empFname as name from employeeInfo where empFname LIKE 'S%';

-- 5. Write a query to fetch top N records order by salary. (ex. top 5 records)
Select e.empid, e.empFname || ' ' || e.empLname as name, p.salary from employeeInfo e Join employeePosition p on e.empID = p.empID order by salary desc Limit 3;

-- 6. Write a query to fetch details of all employees excluding the employees with first names, “Sanjay” and “Sonia” from the EmployeeInfo table.
Select * from employeeInfo where empFname not in ('Sanjay', 'Sonia');

-- 7. Write a query to fetch the department-wise count of employees sorted by department’s count in ascending order.
Select department, Count(*) from employeeInfo group by department order by Count(department);

-- 8. Create indexing for any particular field and show the difference in data fetching before and after indexing
Select empFname as name from employeeInfo where empFname LIKE 'A%';

Create index idx_empFname on employeeinfo(empFname);

Select empFname as name from employeeInfo where empFname LIKE 'B%';

-- Deleting the index and tables
Drop index idx_empFname;

Drop table EmployeePosition;

Drop table EmployeeInfo;