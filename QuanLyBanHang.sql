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

use QuanLyBanHang;
insert into Customer(cID, cname, cAge) values
(1, 'Minh Quan', 10), (2, 'Ngoc Oanh',50),(3,'Hong Ha',50);

insert into `Order`(oID, cID, oDate) values
(1,1,'2006-03-21'),
(2,2,'2006-03-23'),
(3,1,'2006-03-16');

insert into Product(pID, pName, pPrice) values
(1, 'May Giat', 3),
(2, 'Tu Lanh', 5)
,(3, 'Dieu Hoa', 7),
(4, 'Quat', 1),
(5, 'Bep Dien', 2);

insert into Order_Detail(oID, pID, odQTY) values
(1,1,3),(1,3,7),(1,4,2),(2,1,1),
(3,1,8),(2,5,4),(2,3,3);

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select oID, oDate, oTotalPrice  from `order`;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select C.cName, P.pName from customer C join 
 `Order` O on  c.cID = O.cID
 join Order_Detail OD on OD.oID = O.oID
 join Product P on P.pId = OD.pID
 group by C.cName, P.pName;
 
 -- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
 select C.cName from customer C left join `order` O on O.cID = C.cID where O.cid is null; 
 
 -- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn 
 -- (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. 
 -- Giá bán của từng loại được tính = odQTY*pPrice)
 select O.oid, O.oDate, Sum(OD.odQTY * P.pPrice) as 'Total Price' from `order` O 
 join Order_Detail OD on OD.oID = O.oID
 join Product P on P.pId = OD.pID
 group by O.oid;