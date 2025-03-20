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
 
 
 USE QuanLySinhVien;
 INSERT INTO Class VALUES (1, 'A1', '2008-12-20', 1), (2, 'A2', '2008-12-22', 1), (3, 'B3', current_date, 0);
 
 INSERT INTO Student (StudentName, Address, Phone, Status, ClassId)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO Student (StudentName, Address, Status, ClassId)
VALUES ('Hoa', 'Hai phong', 1, 1);
INSERT INTO Student (StudentName, Address, Phone, Status, ClassId)
VALUES ('Manh', 'HCM', '0123123123', 0, 2);

INSERT INTO Subject
VALUES (1, 'CF', 5, 1),
 (2, 'C', 6, 1),
 (3, 'HDJ', 5, 1),
 (4, 'RDBMS', 10, 1);
 
 INSERT INTO Mark (SubId, StudentId, Mark, ExamTimes)
VALUES (1, 1, 8, 1),
 (1, 2, 10, 2),
 (2, 1, 12, 1);
 
 -- [Thực hành] Truy vấn dữ liệu với CSDL Quản lý sinh viên 
-- Hiển thị danh sách tất cả các học viên
 select * from student;
-- Hiển thị danh sách các học viên đang theo học.
select * from student where status = true;
-- Hiển thị danh sách các môn học có thời gian học nhỏ hơn 10 giờ.
select * from subject where credit < 10;
 -- Hiển thị danh sách học viên lớp A1
 select S.StudentId, S.StudentName, C.ClassName FROM Student S join Class C on S.ClassId = C.ClassID
 where C.classname = 'A1';
 -- Hiển thị điểm môn CF của các học viên
 select S.StudentId, S.StudentName, Sub.subname,  M.Mark FROM Student S join Mark M on  S.StudentId = M.StudentId 
 join subject Sub on M.subId = Sub.subId
 where sub.subname = 'CF';

-- [Bài tập] Truy vấn dữ liệu với CSDL Quản lý sinh viên
-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
select * from student where StudentName like('h%'); 
-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
select * from class where month(startDate) = 12;
-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select * from subject where credit between 3 and 5;
-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ thành 2.
SELECT StudentID INTO @StudentID
FROM Student
WHERE studentName = 'Hung'
LIMIT 1;
UPDATE Student SET ClassID = 2 WHERE studentID = @StudentID;

-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
select S.StudentName, Sub.SubName, M.Mark from Student S 
join Mark M on S.StudentID = M.StudentID
join Subject Sub on Sub.SubID = M.SubID
order by M.Mark desc , S.StudentName;

-- [Thực hành] Sử dụng các hàm thông dụng trong SQL
-- Hiển thị số lượng sinh viên ở từng nơi
select S.Address, count(*) as 'So luong' from student S group by S.Address; 

-- Tính điểm trung bình các môn học của mỗi học viên
select S.studentName, avg(M.mark) as 'Diem trung binh' from student S 
join mark M on M.studentID = S.studentID
group by M.studentID;

-- Hiển thị những bạn học viên co điểm trung bình các môn học lớn hơn 15
select S.studentName, avg(M.mark) as 'Diem trung binh' from student S 
join mark M on M.studentID = S.studentID
group by M.studentID having avg(M.mark) > 15;

-- Hiển thị thông tin các học viên có điểm trung bình lớn nhất.
select S.studentName, avg(M.mark) as 'Diem trung binh' from student S 
join mark M on M.studentID = S.studentID
group by M.studentID having avg(M.mark) >= ALL (SELECT AVG(Mark) FROM Mark GROUP BY Mark.StudentId);