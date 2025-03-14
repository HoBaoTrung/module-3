create database QuanLyDiemThi;
use QuanLyDiemThi;

create table HocSinh(
	MaHS varchar(20) Primary key,
	TenHS varchar(50),	
	NgaySinh Datetime,
	Lop	varchar(20),
	GT	varchar(20)
);

create table GiaoVien(
	SDT varchar(10),
    TenGv varchar(50),
    MaGV varchar(20) primary key
);

create table MonHoc(
	MaMH varchar(20) primary key,
    TenMH varchar(50),
    MaGV varchar(20),
    FOREIGN KEY (MaGV) REFERENCES GiaoVien(MaGV)
);

create table BangDiem(
	MaMH varchar(20),
    MaHS varchar(20),
    DiemThi tinyint,
    NgayKT datetime,
    foreign key(MaMH) references MonHoc(MaMH),
    foreign key(MaHS) references HocSinh(MaHS),
    primary key(MaMH, MaHS)
)