drop database if exists QuanLySinhVien;
create database QuanLySinhVien;
use QuanLySinhVien;

create table Class(
	ClassID int primary key auto_increment,
    ClassName varchar(60) not null,
    StartDate datetime not null,
    `Status` bit 
);
 
create table Student(
	StudentID int primary key auto_increment,
    StudentName varchar(30) not null,
    Address varchar(50),
    Phone varchar(20),
    `Status` bit,
    ClassID int not null,
    foreign key (ClassID) references Class(ClassID)
);

create table `Subject`(
	SubId int primary key auto_increment,
	SubName varchar(30) not null,
    Credit tinyint Not null Default 1 check(Credit >= 1),
    `Status` bit Default 1
);

CREATE TABLE Mark(

        MarkId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,

        SubId INT NOT NULL,

        StudentId INT NOT NULL,

        Mark FLOAT DEFAULT 0 CHECK ( Mark BETWEEN 0 AND 100),

        ExamTimes TINYINT DEFAULT 1,

        UNIQUE (SubId, StudentId),

        FOREIGN KEY (SubId) REFERENCES `Subject` (SubId),

        FOREIGN KEY (StudentId) REFERENCES Student (StudentId)

 );