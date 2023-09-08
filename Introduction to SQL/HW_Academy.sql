/*Необходимо создать базу данных Академия (Academy),
которая будет содержать информацию о сотрудниках и внутреннем устройстве академии.*/

create database Academy;
use Academy;


--1. Groups
create table Groups
(
	id int not null primary key identity(1,1),
	Name nvarchar(10) not null check(Name<>'') unique,
	Rating int not null check(Rating>=0 and Rating<=5),
	Year int not null check(Year>=1 and Year<=5)
);

--2. Departments
create table Departments
(
	id int not null primary key identity(1,1),
	Financing money not null check(Financing>=0) default 0,
	Name nvarchar(10) not null check(Name<>'') unique
);

--3. Faculties
create table Faculties
(
	id int not null primary key identity(1,1),
	Name nvarchar(100) not null check(Name<>'') unique
);

--4. Teachers
create table Teachers
(
	id int not null primary key identity(1,1),
	EmploymentDate date not null check(EmploymentDate>='1990.01.01'),
	Name nvarchar(max) not null check(Name<>''),
	Premium money not null check(Premium>=0) default 0,
	Salary money not null check(Salary>0),
	Surname nvarchar(max) not null check(Surname<>'')
);