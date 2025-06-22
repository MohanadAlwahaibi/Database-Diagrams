create database Training

use Training

create table Employee
(
    Fname nvarchar(20) not null,
	Lname nvarchar(20) not null,
	Gender bit default 0,
	Supervisor int not null,
	SSN int primary key not null,
	Foreign key (Supervisor) REFERENCES Employee(SSN)  
);

create table Department
(
    Dname varchar(20) not null,
	Hiredate date not null,
	Dnum int primary key not null,
	SSN int not null,
	Foreign key (SSN) REFERENCES Employee(SSN)
);

create table Department_location
(
    Dnum int not null,
	Location nvarchar(100),
	Primary key (Dnum,Location),
	Foreign key (Dnum) REFERENCES Department(Dnum)
);

create table Dependent
(
    Name varchar(20) primary key not null,
	Birthdate date,
	Gender bit default 0,
	SSN int not null,
	Foreign key(SSN) REFERENCES Employee(SSN)
);

create table project
(
	City varchar(100),
	Pnumber int Primary key not null,
	Dnum int not null,
	Location varchar(100) not null,
	PName varchar(100) not null,
	Foreign key (Dnum) REFERENCES Department(Dnum)
);

create table Works_in
(
	Workinghour time primary key not null,
	SSN int not null,
	Pnumber int not null,
	Foreign key (SSN) REFERENCES Employee(SSN),
	Foreign key (Pnumber) REFERENCES project(Pnumber)
);

select * from Department;
select * from Department_location;
select * from Employee;
select * from Works_in;
select * from project;
select * from Dependent;

ALTER TABLE Employee
add Dnum int foreign key (Dnum) REFERENCES Department (Dnum)


alter table Employee
DROP CONSTRAINT FK__Employee__Superv__29572725

insert into Department(Dname,Hiredate,Dnum,SSN)
values                 ('IT','1983-08-22',1,1)

insert into Department(Dname,Hiredate,Dnum,SSN)
values                 ('SC','1983-04-12',2,2)

alter table Department
DROP CONSTRAINT FK__Department__SSN__34C8D9D1

insert into Employee(Fname,Lname,Gender,Supervisor,Birthdate,Dnum)
values              ('Muhannad','alwahaibi',1,100,'1938-12-31',1)
                    

insert into Employee(Fname,Lname,Gender,Supervisor,Birthdate,Dnum)
values              ('Ali','alnaabi',0,200,'1938-03-11',2)

select * from Employee
select * from Departement
select * from Dependent

insert into Dependent (Name,Birthdate,Gender,SSN)
values                ('Muhannad','1928-03-23',1,1)

insert into Dependent (Name,Birthdate,Gender,SSN)
values                ('Ali','1928-06-22',1,2)

alter table Dependent
DROP CONSTRAINT FK__Dependent__SSN__3B75D760

select * from Dependent

select * from Department_location

insert into Department_location(Dnum,Location)
values                (1,'Muscat')

insert into Department_location (Dnum,Location)
values                           (2,'Nizwa')

alter table Department_location
DROP CONSTRAINT FK__Department__Dnum__37A5467C

SELECT * FROM Project

insert into project (City,Pnumber,Dnum,Location,PName)
values               ('Muscat',1,1,'Oman','TECH')

insert into project (City,Pnumber,Dnum,Location,PName)
values               ('Nizwa',2,2,'Oman','ITSEC')

alter table project
DROP CONSTRAINT FK__project__Dnum__3E52440B

select * from Works_in

insert into Works_in (Workinghour,SSN,Pnumber)
values               ('05:24:23',1,1)

insert into Works_in (Workinghour,SSN,Pnumber)
values               ('04:27:25',2,2)

UPDATE Works_in
SET Pnumber=3
WHERE SSN=2

DELETE FROM Employee
WHERE Fname = 'Muhannad' AND SSN=17

SELECT * FROM Employee

select Fname + ' ' + Lname as [full name]
from Employee