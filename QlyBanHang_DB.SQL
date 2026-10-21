CREATE DATABASE QLBH_2020
GO
-----------------------------------------------------
-----------------------------------------------------
USE QLBH_2020
GO
---------------------------------------------
-- KHACHANG
CREATE TABLE KHACHHANG(
	MAKH	char(4) not null,	
	HOTEN	varchar(40),
	DCHI	varchar(50),
	SODT	varchar(20),
	NGSINH	smalldatetime,
	NGDK	smalldatetime,
	DOANHSO	money,
	constraint pk_kh primary key(MAKH)
)
---------------------------------------------
-- NHANVIEN
CREATE TABLE NHANVIEN(
	MANV	char(4) not null,	
	HOTEN	varchar(40),
	SODT	varchar(20),
	NGVL	smalldatetime	
	constraint pk_nv primary key(MANV)
)
---------------------------------------------
-- SANPHAM
CREATE TABLE SANPHAM(
	MASP	char(4) not null,
	TENSP	varchar(40),
	DVT	varchar(20),
	NUOCSX	varchar(40),
	GIA	money,
	constraint pk_sp primary key(MASP)	
)
---------------------------------------------
-- HOADON
CREATE TABLE HOADON(
	SOHD	int not null,
	NGHD 	smalldatetime,
	MAKH 	char(4),
	MANV 	char(4),
	TRIGIA	money,
	constraint pk_hd primary key(SOHD)
)
---------------------------------------------
-- CTHD
CREATE TABLE CTHD(
	SOHD	int,
	MASP	char(4),
	SL	int,
	constraint pk_cthd primary key(SOHD,MASP)
)

-- Khoa ngoai cho bang HOADON
ALTER TABLE HOADON ADD CONSTRAINT fk01_HD FOREIGN KEY(MAKH) REFERENCES KHACHHANG(MAKH)
ALTER TABLE HOADON ADD CONSTRAINT fk02_HD FOREIGN KEY(MANV) REFERENCES NHANVIEN(MANV)
-- Khoa ngoai cho bang CTHD
ALTER TABLE CTHD ADD CONSTRAINT fk01_CTHD FOREIGN KEY(SOHD) REFERENCES HOADON(SOHD)
ALTER TABLE CTHD ADD CONSTRAINT fk02_CTHD FOREIGN KEY(MASP) REFERENCES SANPHAM(MASP)
-----------------------------------------------------
-----------------------------------------------------
set dateformat dmy
-------------------------------
-- KHACHHANG
insert into khachhang values('KH01','Nguyen Van A','731 Tran Hung Dao, Q5, TpHCM','8823451','22/10/1960','22/07/2006',13060000)
insert into khachhang values('KH02','Tran Ngoc Han','23/5 Nguyen Trai, Q5, TpHCM','908256478','03/04/1974','30/07/2006',280000)
insert into khachhang values('KH03','Tran Ngoc Linh','45 Nguyen Canh Chan, Q1, TpHCM','938776266','12/06/1980','08/05/2006',3860000)
insert into khachhang values('KH04','Tran Minh Long','50/34 Le Dai Hanh, Q10, TpHCM','917325476','09/03/1965','10/02/2006',250000)
insert into khachhang values('KH05','Le Nhat Minh','34 Truong Dinh, Q3, TpHCM','8246108','10/03/1950','28/10/2006',21000)
insert into khachhang values('KH06','Le Hoai Thuong','227 Nguyen Van Cu, Q5, TpHCM','8631738','31/12/1981','24/11/2006',915000)
insert into khachhang values('KH07','Nguyen Van Tam','32/3 Tran Binh Trong, Q5, TpHCM','916783565','06/04/1971','12/01/2006',12500)
insert into khachhang values('KH08','Phan Thi Thanh','45/2 An Duong Vuong, Q5, TpHCM','938435756','10/01/1971','13/12/2006',365000)
insert into khachhang values('KH09','Le Ha Vinh','873 Le Hong Phong, Q5, TpHCM','8654763','03/09/1979','14/01/2007',70000)
insert into khachhang values('KH10','Ha Duy Lap','34/34B Nguyen Trai, Q1, TpHCM','8768904','02/05/1983','16/01/2007',67500)

-------------------------------
-- NHANVIEN
insert into nhanvien values('NV01','Nguyen Nhu Nhut','927345678','13/04/2006')
insert into nhanvien values('NV02','Le Thi Phi Yen','987567390','21/04/2006')
insert into nhanvien values('NV03','Nguyen Van B','997047382','27/04/2006')
insert into nhanvien values('NV04','Ngo Thanh Tuan','913758498','24/06/2006')
insert into nhanvien values('NV05','Nguyen Thi Truc Thanh','918590387','20/07/2006')

-------------------------------
-- SANPHAM
insert into sanpham values('BC01','But chi','cay','Singapore',3000)
insert into sanpham values('BC02','But chi','cay','Singapore',5000)
insert into sanpham values('BC03','But chi','cay','Viet Nam',3500)
insert into sanpham values('BC04','But chi','hop','Viet Nam',30000)
insert into sanpham values('BB01','But bi','cay','Viet Nam',5000)
insert into sanpham values('BB02','But bi','cay','Trung Quoc',7000)
insert into sanpham values('BB03','But bi','hop','Thai Lan',100000)
insert into sanpham values('TV01','Tap 100 giay mong','quyen','Trung Quoc',2500)
insert into sanpham values('TV02','Tap 200 giay mong','quyen','Trung Quoc',4500)
insert into sanpham values('TV03','Tap 100 giay tot','quyen','Viet Nam',3000)
insert into sanpham values('TV04','Tap 200 giay tot','quyen','Viet Nam',5500)
insert into sanpham values('TV05','Tap 100 trang','chuc','Viet Nam',23000)
insert into sanpham values('TV06','Tap 200 trang','chuc','Viet Nam',53000)
insert into sanpham values('TV07','Tap 100 trang','chuc','Trung Quoc',34000)
insert into sanpham values('ST01','So tay 500 trang','quyen','Trung Quoc',40000)
insert into sanpham values('ST02','So tay loai 1','quyen','Viet Nam',55000)
insert into sanpham values('ST03','So tay loai 2','quyen','Viet Nam',51000)
insert into sanpham values('ST04','So tay','quyen','Thai Lan',55000)
insert into sanpham values('ST05','So tay mong','quyen','Thai Lan',20000)
insert into sanpham values('ST06','Phan viet bang','hop','Viet Nam',5000)
insert into sanpham values('ST07','Phan khong bui','hop','Viet Nam',7000)
insert into sanpham values('ST08','Bong bang','cai','Viet Nam',1000)
insert into sanpham values('ST09','But long','cay','Viet Nam',5000)
insert into sanpham values('ST10','But long','cay','Trung Quoc',7000)

-------------------------------
-- HOADON
insert into hoadon values(1001,'23/07/2006','KH01','NV01',320000)
insert into hoadon values(1002,'12/08/2006','KH01','NV02',840000)
insert into hoadon values(1003,'23/08/2006','KH02','NV01',100000)
insert into hoadon values(1004,'01/09/2006','KH02','NV01',180000)
insert into hoadon values(1005,'20/10/2006','KH01','NV02',3800000)
insert into hoadon values(1006,'16/10/2006','KH01','NV03',2430000)
insert into hoadon values(1007,'28/10/2006','KH03','NV03',510000)
insert into hoadon values(1008,'28/10/2006','KH01','NV03',440000)
insert into hoadon values(1009,'28/10/2006','KH03','NV04',200000)
insert into hoadon values(1010,'01/11/2006','KH01','NV01',5200000)
insert into hoadon values(1011,'04/11/2006','KH04','NV03',250000)
insert into hoadon values(1012,'30/11/2006','KH05','NV03',21000)
insert into hoadon values(1013,'12/12/2006','KH06','NV01',5000)
insert into hoadon values(1014,'31/12/2006','KH03','NV02',3150000)
insert into hoadon values(1015,'01/01/2007','KH06','NV01',910000)
insert into hoadon values(1016,'01/01/2007','KH07','NV02',12500)
insert into hoadon values(1017,'02/01/2007','KH08','NV03',35000)
insert into hoadon values(1018,'13/01/2007','KH08','NV03',330000)
insert into hoadon values(1019,'13/01/2007','KH01','NV03',30000)
insert into hoadon values(1020,'14/01/2007','KH09','NV04',70000)
insert into hoadon values(1021,'16/01/2007','KH10','NV03',67500)
insert into hoadon values(1022,'16/01/2007',Null,'NV03',7000)
insert into hoadon values(1023,'17/01/2007',Null,'NV01',330000)

-------------------------------
-- CTHD
insert into cthd values(1001,'TV02',10)
insert into cthd values(1001,'ST01',5)
insert into cthd values(1001,'BC01',5)
insert into cthd values(1001,'BC02',10)
insert into cthd values(1001,'ST08',10)
insert into cthd values(1002,'BC04',20)
insert into cthd values(1002,'BB01',20)
insert into cthd values(1002,'BB02',20)
insert into cthd values(1003,'BB03',10)
insert into cthd values(1004,'TV01',20)
insert into cthd values(1004,'TV02',10)
insert into cthd values(1004,'TV03',10)
insert into cthd values(1004,'TV04',10)
insert into cthd values(1005,'TV05',50)
insert into cthd values(1005,'TV06',50)
insert into cthd values(1006,'TV07',20)
insert into cthd values(1006,'ST01',30)
insert into cthd values(1006,'ST02',10)
insert into cthd values(1007,'ST03',10)
insert into cthd values(1008,'ST04',8)
insert into cthd values(1009,'ST05',10)
insert into cthd values(1010,'TV07',50)
insert into cthd values(1010,'ST07',50)
insert into cthd values(1010,'ST08',100)
insert into cthd values(1010,'ST04',50)
insert into cthd values(1010,'TV03',100)
insert into cthd values(1011,'ST06',50)
insert into cthd values(1012,'ST07',3)
insert into cthd values(1013,'ST08',5)
insert into cthd values(1014,'BC02',80)
insert into cthd values(1014,'BB02',100)
insert into cthd values(1014,'BC04',60)
insert into cthd values(1014,'BB01',50)
insert into cthd values(1015,'BB02',30)
insert into cthd values(1015,'BB03',7)
insert into cthd values(1016,'TV01',5)
insert into cthd values(1017,'TV02',1)
insert into cthd values(1017,'TV03',1)
insert into cthd values(1017,'TV04',5)
insert into cthd values(1018,'ST04',6)
insert into cthd values(1019,'ST05',1)
insert into cthd values(1019,'ST06',2)
insert into cthd values(1020,'ST07',10)
insert into cthd values(1021,'ST08',5)
insert into cthd values(1021,'TV01',7)
insert into cthd values(1021,'TV02',10)
insert into cthd values(1022,'ST07',1)
insert into cthd values(1023,'ST04',6)
----------------------------------------------------------------
----------------------------------------------------------------
SELECT * FROM KHACHHANG
SELECT * FROM NHANVIEN
SELECT * FROM SANPHAM
SELECT * FROM HOADON
SELECT * FROM CTHD
--Phan 1------------------------------
--Cau 1
-- Tao bang KHACHHANG
CREATE TABLE KHACHHANG (
    MAKH CHAR(4) PRIMARY KEY,
    HOTEN VARCHAR(40),
    DCHI VARCHAR(50),
    SODT VARCHAR(20),
    NGSINH SMALLDATETIME,
    DOANHSO MONEY,
    NGDK SMALLDATETIME
);

-- Tao bang NHANVIEN
CREATE TABLE NHANVIEN (
    MANV CHAR(4) PRIMARY KEY,
    HOTEN VARCHAR(40),
    SODT VARCHAR(20),
    NGVL SMALLDATETIME
);

-- Tao bang SANPHAM
CREATE TABLE SANPHAM (
    MASP CHAR(4) PRIMARY KEY,
    TENSP VARCHAR(40),
    DVT VARCHAR(20),
    NUOCSX VARCHAR(40),
    GIA MONEY
);

-- Tao bang HOADON
CREATE TABLE HOADON (
    SOHD INT PRIMARY KEY,
    NGHD SMALLDATETIME,
    MAKH CHAR(4) FOREIGN KEY REFERENCES KHACHHANG(MAKH),
    MANV CHAR(4) FOREIGN KEY REFERENCES NHANVIEN(MANV),
    TRIGIA MONEY
);

-- Tao bang CTHD
CREATE TABLE CTHD (
    SOHD INT FOREIGN KEY REFERENCES HOADON(SOHD),
    MASP CHAR(4) FOREIGN KEY REFERENCES SANPHAM(MASP),
    SL INT,
    CONSTRAINT PK_CTHD PRIMARY KEY (SOHD, MASP)
);


--Cau 2:
Alter table sanpham add GHICHU varchar(20) 
--Cau 3:
alter table khachhang add LOAIKH tinyint
--Cau 4:
ALTER TABLE  sanpham
ALTER COLUMN GHICHU varchar(100)
--Cau 5:
alter table sanpham drop column ghichu
--Cau 6:
alter table khachhang
alter column loaikh varchar(20)
--Cau 7:
alter table sanpham
add constraint dvi_tinh check (DVT = 'cay' or DVT = 'hop' or dvt = 'cai' or dvt = 'quyen' or dvt = 'chuc')
--Cau 8:
alter table sanpham
add constraint gia_toithieu check (gia>=500)
--Cau 9:
alter table cthd
add constraint sl_toithieu check (sl>=1)
--Cau 10
alter table khachhang
add constraint ngay check(ngdk>ngsinh)
--Cau 11:

--Cau 12:




--Phan 2------------------------------------
--Cau 1:
set dateformat dmy
-------------------------------
-- KHACHHANG
insert into khachhang values('KH01','Nguyen Van A','731 Tran Hung Dao, Q5, TpHCM','8823451','22/10/1960','22/07/2006',13060000)
insert into khachhang values('KH02','Tran Ngoc Han','23/5 Nguyen Trai, Q5, TpHCM','908256478','03/04/1974','30/07/2006',280000)
insert into khachhang values('KH03','Tran Ngoc Linh','45 Nguyen Canh Chan, Q1, TpHCM','938776266','12/06/1980','08/05/2006',3860000)
insert into khachhang values('KH04','Tran Minh Long','50/34 Le Dai Hanh, Q10, TpHCM','917325476','09/03/1965','10/02/2006',250000)
insert into khachhang values('KH05','Le Nhat Minh','34 Truong Dinh, Q3, TpHCM','8246108','10/03/1950','28/10/2006',21000)
insert into khachhang values('KH06','Le Hoai Thuong','227 Nguyen Van Cu, Q5, TpHCM','8631738','31/12/1981','24/11/2006',915000)
insert into khachhang values('KH07','Nguyen Van Tam','32/3 Tran Binh Trong, Q5, TpHCM','916783565','06/04/1971','12/01/2006',12500)
insert into khachhang values('KH08','Phan Thi Thanh','45/2 An Duong Vuong, Q5, TpHCM','938435756','10/01/1971','13/12/2006',365000)
insert into khachhang values('KH09','Le Ha Vinh','873 Le Hong Phong, Q5, TpHCM','8654763','03/09/1979','14/01/2007',70000)
insert into khachhang values('KH10','Ha Duy Lap','34/34B Nguyen Trai, Q1, TpHCM','8768904','02/05/1983','16/01/2007',67500)

-------------------------------
-- NHANVIEN
insert into nhanvien values('NV01','Nguyen Nhu Nhut','927345678','13/04/2006')
insert into nhanvien values('NV02','Le Thi Phi Yen','987567390','21/04/2006')
insert into nhanvien values('NV03','Nguyen Van B','997047382','27/04/2006')
insert into nhanvien values('NV04','Ngo Thanh Tuan','913758498','24/06/2006')
insert into nhanvien values('NV05','Nguyen Thi Truc Thanh','918590387','20/07/2006')

-------------------------------
-- SANPHAM
insert into sanpham values('BC01','But chi','cay','Singapore',3000)
insert into sanpham values('BC02','But chi','cay','Singapore',5000)
insert into sanpham values('BC03','But chi','cay','Viet Nam',3500)
insert into sanpham values('BC04','But chi','hop','Viet Nam',30000)
insert into sanpham values('BB01','But bi','cay','Viet Nam',5000)
insert into sanpham values('BB02','But bi','cay','Trung Quoc',7000)
insert into sanpham values('BB03','But bi','hop','Thai Lan',100000)
insert into sanpham values('TV01','Tap 100 giay mong','quyen','Trung Quoc',2500)
insert into sanpham values('TV02','Tap 200 giay mong','quyen','Trung Quoc',4500)
insert into sanpham values('TV03','Tap 100 giay tot','quyen','Viet Nam',3000)
insert into sanpham values('TV04','Tap 200 giay tot','quyen','Viet Nam',5500)
insert into sanpham values('TV05','Tap 100 trang','chuc','Viet Nam',23000)
insert into sanpham values('TV06','Tap 200 trang','chuc','Viet Nam',53000)
insert into sanpham values('TV07','Tap 100 trang','chuc','Trung Quoc',34000)
insert into sanpham values('ST01','So tay 500 trang','quyen','Trung Quoc',40000)
insert into sanpham values('ST02','So tay loai 1','quyen','Viet Nam',55000)
insert into sanpham values('ST03','So tay loai 2','quyen','Viet Nam',51000)
insert into sanpham values('ST04','So tay','quyen','Thai Lan',55000)
insert into sanpham values('ST05','So tay mong','quyen','Thai Lan',20000)
insert into sanpham values('ST06','Phan viet bang','hop','Viet Nam',5000)
insert into sanpham values('ST07','Phan khong bui','hop','Viet Nam',7000)
insert into sanpham values('ST08','Bong bang','cai','Viet Nam',1000)
insert into sanpham values('ST09','But long','cay','Viet Nam',5000)
insert into sanpham values('ST10','But long','cay','Trung Quoc',7000)

-------------------------------
-- HOADON
insert into hoadon values(1001,'23/07/2006','KH01','NV01',320000)
insert into hoadon values(1002,'12/08/2006','KH01','NV02',840000)
insert into hoadon values(1003,'23/08/2006','KH02','NV01',100000)
insert into hoadon values(1004,'01/09/2006','KH02','NV01',180000)
insert into hoadon values(1005,'20/10/2006','KH01','NV02',3800000)
insert into hoadon values(1006,'16/10/2006','KH01','NV03',2430000)
insert into hoadon values(1007,'28/10/2006','KH03','NV03',510000)
insert into hoadon values(1008,'28/10/2006','KH01','NV03',440000)
insert into hoadon values(1009,'28/10/2006','KH03','NV04',200000)
insert into hoadon values(1010,'01/11/2006','KH01','NV01',5200000)
insert into hoadon values(1011,'04/11/2006','KH04','NV03',250000)
insert into hoadon values(1012,'30/11/2006','KH05','NV03',21000)
insert into hoadon values(1013,'12/12/2006','KH06','NV01',5000)
insert into hoadon values(1014,'31/12/2006','KH03','NV02',3150000)
insert into hoadon values(1015,'01/01/2007','KH06','NV01',910000)
insert into hoadon values(1016,'01/01/2007','KH07','NV02',12500)
insert into hoadon values(1017,'02/01/2007','KH08','NV03',35000)
insert into hoadon values(1018,'13/01/2007','KH08','NV03',330000)
insert into hoadon values(1019,'13/01/2007','KH01','NV03',30000)
insert into hoadon values(1020,'14/01/2007','KH09','NV04',70000)
insert into hoadon values(1021,'16/01/2007','KH10','NV03',67500)
insert into hoadon values(1022,'16/01/2007',Null,'NV03',7000)
insert into hoadon values(1023,'17/01/2007',Null,'NV01',330000)

-------------------------------
-- CTHD
insert into cthd values(1001,'TV02',10)
insert into cthd values(1001,'ST01',5)
insert into cthd values(1001,'BC01',5)
insert into cthd values(1001,'BC02',10)
insert into cthd values(1001,'ST08',10)
insert into cthd values(1002,'BC04',20)
insert into cthd values(1002,'BB01',20)
insert into cthd values(1002,'BB02',20)
insert into cthd values(1003,'BB03',10)
insert into cthd values(1004,'TV01',20)
insert into cthd values(1004,'TV02',10)
insert into cthd values(1004,'TV03',10)
insert into cthd values(1004,'TV04',10)
insert into cthd values(1005,'TV05',50)
insert into cthd values(1005,'TV06',50)
insert into cthd values(1006,'TV07',20)
insert into cthd values(1006,'ST01',30)
insert into cthd values(1006,'ST02',10)
insert into cthd values(1007,'ST03',10)
insert into cthd values(1008,'ST04',8)
insert into cthd values(1009,'ST05',10)
insert into cthd values(1010,'TV07',50)
insert into cthd values(1010,'ST07',50)
insert into cthd values(1010,'ST08',100)
insert into cthd values(1010,'ST04',50)
insert into cthd values(1010,'TV03',100)
insert into cthd values(1011,'ST06',50)
insert into cthd values(1012,'ST07',3)
insert into cthd values(1013,'ST08',5)
insert into cthd values(1014,'BC02',80)
insert into cthd values(1014,'BB02',100)
insert into cthd values(1014,'BC04',60)
insert into cthd values(1014,'BB01',50)
insert into cthd values(1015,'BB02',30)
insert into cthd values(1015,'BB03',7)
insert into cthd values(1016,'TV01',5)
insert into cthd values(1017,'TV02',1)
insert into cthd values(1017,'TV03',1)
insert into cthd values(1017,'TV04',5)
insert into cthd values(1018,'ST04',6)
insert into cthd values(1019,'ST05',1)
insert into cthd values(1019,'ST06',2)
insert into cthd values(1020,'ST07',10)
insert into cthd values(1021,'ST08',5)
insert into cthd values(1021,'TV01',7)
insert into cthd values(1021,'TV02',10)
insert into cthd values(1022,'ST07',1)
insert into cthd values(1023,'ST04',6)
----------------------------------------------------------------
----------------------------------------------------------------
SELECT * FROM KHACHHANG
SELECT * FROM NHANVIEN
SELECT * FROM SANPHAM
SELECT * FROM HOADON
SELECT * FROM CTHD

--Cau 2:
select * into KHACHHANG1 from KHACHHANG
select * into SANPHAM1 from sanpham

--Cau 3:
update sanpham1
set gia=gia*1.5
where nuocsx = 'Thai Lan'

--Cau 4:
update sanpham1
set gia=gia*0.95
where nuocsx='Trung Quoc'

--Cau 5:
select * from khachhang1
update khachhang1
set loaikh='Vip'
where (ngdk<='01/01/2007' and doanhso >=10000000) or (ngdk>'01/01/2007' and doanhso>=2000000)

--Phan 3------------------------------------
--Cau 1
select masp,tensp
from sanpham
where (nuocsx='Trung Quoc')
--Cau 2
select masp,tensp
from sanpham
where(DVT = 'cay' or dvt = 'quyen')
--Cau 3
select masp,tensp
from sanpham
where masp like 'B%01'
--Cau 4
select masp,tensp
from sanpham
where (nuocsx='Trung Quoc' and gia between 30000 and 40000)
--Cau 5
select masp,tensp,nuocsx,gia
from sanpham
where (nuocsx in ('Trung Quoc', 'Thai Lan') and gia between 30000 and 40000)
--Cau 6
select sohd,trigia,nghd
from hoadon
where (day(nghd)in(1,2) and month(nghd)=1 and year(nghd)=2007)
--Cau 7
select sohd,trigia
from hoadon
where (month(nghd)=1 and year(nghd)=2007)
order by nghd asc, trigia desc
--Cau 8
select kh.makh,kh.hoten
from khachhang kh
join hoadon hd on hd.makh=kh.makh
where day(hd.nghd)=1 and month(hd.nghd)=1 and year(hd.nghd)=2007
--Cau 9
select hd.sohd,hd.trigia
from hoadon hd
join nhanvien nv on nv.manv=hd.manv
where nv.hoten='Nguyen Van B'
--Cau 10
select sp.masp,sp.tensp
from sanpham sp
join cthd ch on ch.masp=sp.masp
join hoadon hd on hd.sohd=ch.sohd
join khachhang kh on kh.makh=hd.makh
where (kh.hoten='Nguyen Van A' and month(hd.nghd)=10 and year(hd.nghd)=2006)
--Cau 11
select hd.sohd
from hoadon hd
join cthd ct on ct.sohd=hd.sohd
where (ct.masp in ('BB01','BB02'))
--Cau 12
select hd.sohd,ct.sl,ct.masp
from hoadon hd
join cthd ct on ct.sohd=hd.sohd
where (ct.masp in ('BB01','BB02')and (ct.sl between 10 and 20))
--Cau 13
select hd.sohd
from hoadon hd
join cthd ct on ct.sohd=hd.sohd
where (ct.masp='BB01' and (ct.sl between 10 and 20))
intersect
select hd.sohd
from hoadon hd
join cthd ct on ct.sohd=hd.sohd
where (ct.masp='BB02' and (ct.sl between 10 and 20))
--Cau 14
select sp.masp,sp.tensp
from sanpham sp
join cthd ct on ct.masp=sp.masp
join hoadon hd on hd.sohd=ct.sohd
where (sp.nuocsx='Trung Quoc' or hd.nghd='2007-1-1')
select sp.masp,sp.tensp
from sanpham sp
--Cau 15
select masp,tensp
from sanpham 
except
select ct.masp,sp.tensp
from cthd ct
join sanpham sp on sp.masp=ct.masp
--Cau 16
select masp,tensp
from sanpham
except
select sp.masp,sp.tensp
from cthd ct
join sanpham sp on sp.masp=ct.masp
join hoadon hd on hd.sohd=ct.sohd
where(year(hd.nghd)=2006)

--Cau 17
select sp.masp,sp.tensp
from sanpham sp
where (nuocsx='Trung Quoc')
except
select sp.masp,sp.tensp
from cthd ct
join sanpham sp on sp.masp=ct.masp
join hoadon hd on hd.sohd=ct.sohd
where(year(hd.nghd)=2006)

--Cau 18
select hd.sohd
from cthd hd
join sanpham sp
on hd.masp= sp.masp
where nuocsx ='Singapore'
group by sohd
having count(distinct hd.masp) = (
	select count(masp)
	from sanpham 
	where nuocsx='Singapore'
)

--Cau 19
select cthd.sohd
from cthd
join sanpham sp
on cthd.masp= sp.masp
join hoadon hd
on hd.sohd=cthd.sohd

where nuocsx ='Singapore' and year(hd.nghd)='2006'
group by cthd.sohd
having count(distinct cthd.masp) = (
	select count(masp)
	from sanpham 
	where nuocsx='Singapore'
)
--Cau 20
select count (*) as SoLuong
from hoadon
where makh is null
--Cau 21
select count(distinct ct.masp) as SoLuong
from cthd ct
join hoadon hd on ct.sohd=hd.sohd
where (year(hd.nghd)='2006')
--Cau 22
select max(trigia) as giaCaoNhat, 
min(trigia) as giaThapNhat
from hoadon
--Cau 23
select avg(trigia) as giaTB
from hoadon
where year(nghd)=2006
--Cau 24
select sum(trigia) as tongTriGia
from hoadon
where year(nghd)=2006
--Cau 25
select sohd
from hoadon
where year(nghd)=2006 and (trigia=(select max(trigia) from hoadon))
--Cau 26
select kh.hoten
from khachhang kh
join hoadon hd on hd.makh=kh.makh
where year(nghd)=2006 and (trigia=(select max(trigia) from hoadon))
--Cau 27
select top 3 makh,hoten
from khachhang
order by doanhso desc
--Cau 28
select masp,tensp
from SANPHAM
where gia in(
select distinct top 3 gia 
from sanpham 
order by gia desc)
--Cau 29
select masp,tensp
from sanpham
where (nuocsx='Thai Lan')
and 
(gia in(select distinct top 3 gia
from sanpham order by gia desc))
--Cau 30
select masp,tensp
from sanpham
where (nuocsx='Trung Quoc')
and 
(gia in(select distinct top 3 gia
from sanpham where (nuocsx = 'Trung Quoc') 
order by gia desc))
--Cau 31
select *
from khachhang
where 
(doanhso in(select distinct top 3 doanhso
from khachhang
order by doanhso desc))
--Cau 32
select count(masp) as soSp
from sanpham
where nuocsx='Trung Quoc'
--Cau 33
select nuocsx, count(masp) as soSp
from sanpham
group by nuocsx
--Cau 34
select nuocsx,max(gia) as giaLon,min(gia) as giaBe
from sanpham
group by nuocsx
--Cau 35
select cast(nghd as date) as ngay, sum(trigia) as tongDoanhThu
from hoadon
group by cast(nghd as date)
--Cau 36
select masp,sum(sl) as tongSL
from cthd ct
join hoadon hd on hd.sohd=ct.sohd
where month(hd.NGHD)=10 and year(hd.nghd)=2006
group by masp
--Cau 37
select month(nghd) as thang, sum(trigia) as tongdoanhthu
from hoadon
group by month(nghd)
--Cau 38
select hd.sohd
from hoadon hd
join cthd ct on ct.sohd=hd.sohd
group by hd.sohd
having count(distinct masp)>=4
--Cau 39
select ct.sohd
from cthd ct
join sanpham sp on sp.masp=ct.masp
where(nuocsx = 'Viet Nam')
group by ct.sohd
having count(distinct ct.masp)=3
--Cau 40
select kh.makh, kh.hoten
from khachhang kh
join hoadon hd on hd.makh=kh.makh
group by kh.makh,kh.hoten
having count(hd.sohd) >= ALL (
select count (sohd)
from hoadon 
group by makh)
--Cau 41
select month(nghd) as thang
from hoadon
where year(nghd) = '2006'
group by month(nghd)
having sum(trigia)>= ALL (
select sum(trigia)
from hoadon
where year(nghd) = '2006'
group by month(nghd))
--Cau 42
select sp. masp, sp.tensp, sp.nuocsx
from sanpham sp

--Cau 43
select masp,tensp
from sanpham sp
join (
	select nuocsx, max(gia) as maxGia
	from sanpham 
	group by nuocsx
)MaxGia 
on sp.nuocsx=MaxGia.nuocsx 
and sp.gia=MaxGia.maxGia

--Cau 44
select nuocsx
from sanpham
group by nuocsx
having count(distinct gia) >= 3
--Cau 45
select top 1 hd.makh, count(sohd) as solan
from hoadon hd
join(
select top 10 makh, hoten
from KHACHHANG
order by doanhso desc
)top10
on top10.makh=hd.makh
group by hd.makh
order by count(sohd) desc

