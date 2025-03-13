create database my_database;
use my_database;

create table Class(
	id int primary key,
    `name` varchar(50) 
);

create table Teacher(
	id int primary key,
    `name` varchar(50),
    age tinyint,
    country varchar(50)
);