drop database if exists QuanLyBanHang;
create database QuanLyBanHang;
use QuanLyBanHang;
create table customer(
	cID int primary key,
    cName varchar(50),
    cAge tinyint
);

create table `Order`(
	oID int primary key,
    cID int,
    oDate date,
    oTotalPrice decimal,
    foreign key (cID) references customer(cID)
);

create table Product(
	pID int primary key,
    pName varchar(50),
    pPrice decimal
);

create table Order_Detail(
	oID int, pID int, odQTY int not null,
    primary key(oID, pID),
    foreign key(oID) references `Order`(oID),
    foreign key(pID) references Product(pID)
);