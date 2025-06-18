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
add Dnum int foreign key (Dnum) REFERENCES Department (Dnum) not null;

