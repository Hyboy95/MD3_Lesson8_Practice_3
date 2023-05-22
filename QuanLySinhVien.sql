drop database quanlysinhvien;
create database quanlysinhvien;
use quanlysinhvien;

create table Class(
	classID int primary key auto_increment,
    className varchar(60) not null,
    startDate datetime not null,
    status bit
);

create table Student(
	studentID int primary key auto_increment,
    studentName varchar(30) not null,
    address varchar(50),
    phone varchar(20),
    status bit,
    classID int not null,
    foreign key (classID) references Class(classID)
);

create table Subject(
	subID int primary key auto_increment,
    subName varchar(30) not null,
    credit tinyint not null default 1 check (credit >= 1),
    status bit default 1
);

create table Mark(
	markID int primary key auto_increment,
    subID int not null unique,
    studentID int not null unique,
    mark float default 0 check (mark between 0 and 100),
    examtimes tinyint default 1,
    foreign key (subID) references Subject(subID),
    foreign key (studentID) references Student(studentID)
);

insert into Mark (subID, studentID, mark) value (2,3,-99);
insert into Subject (subID, studentID, mark) value (2,3,-99);
