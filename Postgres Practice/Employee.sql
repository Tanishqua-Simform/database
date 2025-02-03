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

Show Tables from Employee;

CREATE TABLE EmployeeInfo(
EmpID int primary key,
EmpFname varchar(30) not null,
EmpLname varchar(30) not null,
Department varchar(30) not null,
Address varchar(50),
Project varchar(30) not null,
DOB Date not null,
Gender varchar(1) not null
);

Insert into EmployeeInfo Values
(1,'Sanjay','Mehra','HR','P1','Hyderabad(HYD)','1976/12/01','M'),
(2,'Ananya','Mishra','Admin','P2','Delhi(DEL)','1968/05/02','F'),
(3,'Rohan','Diwan','Account','P3','Mumbai(BOM)','1980/01/01','M'),
(4,'Sonia','Kulkarni','HR','P1','Hyderabad(HYD)','1992/05/02','F'),
(5,'Ankit','Kapoor','Admin','P2','Delhi(DEL)','1994/07/03','M');

Select * from EmployeeInfo;

Drop table EmployeeInfo;

CREATE TABLE EmployeePosition(
EmpID int primary key,
EmpFname varchar(30) not null,
EmpLname varchar(30) not null,
Department varchar(30) not null,
Address varchar(50),
Project varchar(30) not null,
DOB Date not null,
Gender varchar(1) not null
);