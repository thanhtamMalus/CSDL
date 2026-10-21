Create database PartShipmentDB
go
use PartShipmentDB
go
Create table Nhacungcap 
(
maNCC		varchar(5),
tenNCC	varchar(20), 
trangthai 	numeric(2),
thanhpho	varchar(30),
Constraint PKNcc primary key (maNCC)
)


create table Phutung 
(
 maPT		varchar(5),
 tenPT	varchar(10),
 mausac	varchar(10),
 khoiluong	float,
 thanhpho	 varchar(30),
 Constraint PKPt Primary Key (maPT) 
)


Create table Vanchuyen 
(
maNCC		varchar(5) ,
maPT		varchar(5),
soluong	numeric(5), 
Constraint PKVc primary key (maNCC,maPT),
Constraint FKShip1 foreign key (maNCC) references Nhacungcap (maNCC),
Constraint FKShip2 foreign key (maPT) references Phutung (maPT)
)


insert into Nhacungcap values ('S1','Smith','20','London')
insert into Nhacungcap values ('S2','Jones','10','Paris')
insert into Nhacungcap values ('S3','Blake','30','Paris')
insert into Nhacungcap values ('S4','Clark','20','London')
insert into Nhacungcap values ('S5','Adams','30','Athens')


Insert  into Phutung values  ( 'P1' , 'Nut' , 'Red' , 12.0 , 'London')
Insert  into Phutung values  ( 'P2' , 'Bolt' , 'Green', 17.0 , 'Paris')
Insert  into Phutung values  ( 'P3' , 'Screw' , 'Blue', 17.0 , 'Oslo')
Insert  into Phutung values  ( 'P4' , 'Screw' , 'Red' , 14.0 , 'London')
Insert  into Phutung values  ( 'P5' , 'Cam' , 'Blue' , 12.0 , 'Paris')
Insert  into Phutung values  ( 'P6' , 'Cog' , 'Red' , 19.0 , 'London')



Insert into Vanchuyen values ('S1','P1',300)
Insert into Vanchuyen values ('S1','P2',200)
Insert into Vanchuyen values ('S1','P3',400)
Insert into Vanchuyen values ('S1','P4',200)
Insert into Vanchuyen values ('S1','P5',100)
Insert into Vanchuyen values ('S1','P6',100)
Insert into Vanchuyen values ('S2','P1',300)
Insert into Vanchuyen values ('S2','P2',400)
Insert into Vanchuyen values ('S3','P2',200)
Insert into Vanchuyen values ('S4','P2',200)
Insert into Vanchuyen values ('S4','P4',300)
Insert into Vanchuyen values ('S4','P5',400)

select * from Vanchuyen 

--Câu 1
select mancc, tenncc, thanhpho
from nhacungcap

--Câu 2
select *
from phutung

--Câu 3
select *
from nhacungcap
where thanhpho = 'London'

--Câu 4
select mapt, tenpt, mausac
from phutung
where thanhpho = 'London' 

--Câu 5
select mapt,tenpt, khoiluong
from phutung
where khoiluong > 15

--Câu 6
select mapt,tenpt, khoiluong
from phutung
where khoiluong > 15 
and mapt
	not in(
	select mapt
	from phutung
	where khoiluong > 15 
	and mausac = 'Red'
	)

--Câu 7
select mapt,tenpt, khoiluong
from phutung
where khoiluong > 15 
and mausac in('Red', 'Green')

--Câu 8
select mapt,tenpt, khoiluong
from phutung
where khoiluong > 15 and khoiluong < 20
order by tenpt asc

--Câu 9
select distinct phutung.mapt, tenpt
from phutung
join vanchuyen on vanchuyen.mapt=phutung.mapt
where mancc='S1'

--Câu 10
select distinct nhacungcap.mancc, tenncc
from Nhacungcap
join vanchuyen on vanchuyen.mancc=nhacungcap.mancc
where mapt='P1'

--Câu 11
select distinct ncc.mancc, tenncc
from nhacungcap ncc
join vanchuyen vc
on vc.mancc=ncc.mancc
join phutung pt
on vc.mapt=pt.mapt
where ncc.thanhpho = 'London' and pt.thanhpho='London'

--Cau 12
select distinct mapt, tenpt
from phutung
where mapt in (
	select mapt 
	from vanchuyen
	where mancc='S1'
)

--Câu 13
select distinct mancc, tenncc
from Nhacungcap
where mancc in (
select mancc
from vanchuyen
where mapt = 'P1'
)

--Câu 14
select distinct mapt, tenpt
from phutung pt
where exists (
	select * 
	from vanchuyen vc
	where mancc='S1' 
	and pt.mapt=vc.mapt
)

--Câu 15
select distinct mancc, tenncc
from Nhacungcap ncc
where exists(
	select *
	from vanchuyen vc
	where mapt='P1'
	and vc.mancc=ncc.mancc
)

--Câu 16
select mancc,tenncc
from nhacungcap
where thanhpho ='London' 
and mancc in (
	select mancc
	from vanchuyen vc
	join phutung pt
	on pt.mapt=vc.mapt
	where pt.thanhpho ='London'
)

--Câu 17
select mancc,tenncc
from nhacungcap ncc
where thanhpho = 'London' 
and exists(
	select *
	from vanchuyen vc
	join phutung pt
	on pt.mapt=vc.mapt
	where pt.thanhpho='London' and vc.mancc=ncc.mancc
)

--Câu 18
select mancc,tenncc
from nhacungcap
where mancc not in(
	select mancc
	from vanchuyen
)

--Câu 19
select mancc,tenncc
from nhacungcap ncc
where not exists(
	select *
	from vanchuyen vc
	where ncc.mancc=vc.mancc
)

--Câu 20
select *
from nhacungcap ncc
left join vanchuyen vc
on vc.mancc=ncc.mancc
where mapt is NULL

--Câu 21
select count(mancc) as soNcc
from nhacungcap

--Câu 22
select count(mancc) as soNcc
from nhacungcap
where thanhpho = 'London'

--Câu 23
select max(trangthai) as best, min(trangthai) as worse
from Nhacungcap

--Câu 24
select max(trangthai) as best, min(trangthai) as worse
from Nhacungcap
where thanhpho = 'London'

--Câu 25
select mancc, sum(soluong) as tongsoPt
from vanchuyen
group by mancc

--Câu 26
select ncc.mancc, tenncc, thanhpho, sum(soluong) as tongsoPt
from nhacungcap ncc
join vanchuyen vc
on vc.mancc=ncc.mancc
group by ncc.mancc, ncc.tenncc, ncc.thanhpho

--Câu 27
select ncc.mancc, tenncc, thanhpho, sum(soluong) as tongsoPt
from nhacungcap ncc
join vanchuyen vc
on vc.mancc=ncc.mancc
group by ncc.mancc, ncc.tenncc, ncc.thanhpho
having sum(soluong)>500

--Câu 28
 select mancc
 from vanchuyen vc
 join phutung pt
 on pt.mapt=vc.mapt
 where mausac = 'Red'
 group by mancc
 having sum(vc.soluong)>300

 --Câu 29
 select ncc.mancc,tenncc, sum(soluong) as TongSL
 from nhacungcap ncc
 join vanchuyen vc
 on ncc.mancc=vc.mancc
 join phutung pt
 on pt.mapt=vc.mapt
 where mausac = 'Red'
 group by ncc.mancc, tenncc
 having sum(vc.soluong)>300

 --Câu 30
 select thanhpho, count(mancc) as SoNCC
 from nhacungcap
 group by thanhpho

 --Câu 31
 select mancc, tenncc
 from nhacungcap ncc
 where mancc in(
 select top 1 mancc
 from vanchuyen vc
 group by mancc
 order by sum(soluong) desc
 )

 --Câu 32
 select distinct ncc.thanhpho
 from nhacungcap ncc
 join vanchuyen vc
 on vc.mancc=ncc.mancc
 join phutung pt
 on pt.mapt=vc.mapt
 where ncc.thanhpho=pt.thanhpho

 --Câu 33
 insert into Nhacungcap values ('S6','Duncan','30','Paris')

 --Câu 34
 update nhacungcap
 set thanhpho = 'Sydney'
 where mancc = 'S6'

 --Câu 35
 update nhacungcap
 set trangthai= trangthai+10
 where thanhpho = 'London'

 --Câu 36
 delete from nhacungcap
 where mancc='S6'

 --
 select * from nhacungcap