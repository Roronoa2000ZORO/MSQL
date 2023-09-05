use MyDataBase;
select * from Departments;
--1 �������
create table Departments
(
	id int not null primary key identity(1,1),
	Building int not null check(building>=1 and building<=5),
	Financing money not null default 0 check(Financing>=0),
	Name nvarchar(100) unique not null check(Name<>'')
)
--2 �������
create table Diseases
(
	id int not null primary key identity(1,1),
	Name nvarchar(100) not null unique check(Name<>''),
	Severity int not null check(Severity>= 1) default 1
)
--3 �������
create table Doctors
(
	id int not null primary key identity(1,1),
	Name nvarchar(100) not null unique check(Name<>''),
	Phone char(10),
	Salary money not null check(Salary>= 0)
)
--4 �������
create table Examinations
(
	id int not null primary key identity(1,1),
	DayOfWeek int not null check(DayOfWeek>=1 and DayOfWeek<=7),
	StartTime time not null check(StartTime>='8:00:00' and StartTime<='18:00:00'),
	EndTime time not null,
	Name nvarchar(100) not null unique check(Name<>''),
	check(EndTime>StartTime)
)
