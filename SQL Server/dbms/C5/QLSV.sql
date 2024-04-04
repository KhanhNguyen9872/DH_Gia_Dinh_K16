-- 221402 - KhanhNguyen9872

use master;
ALTER DATABASE QLSV SET OFFLINE WITH ROLLBACK IMMEDIATE;
ALTER DATABASE QLSV SET ONLINE;

DROP DATABASE QLSV;


CREATE DATABASE QLSV;
GO
use QLSV;
GO

create table hocphan (
	-- mahp,tenhp,stc,hocky
	mahp nvarchar(255) primary key,
	tenhp nvarchar(255) not null,
	stc int,
	hocky int
)

CREATE TABLE lop (
	malop varchar(255) primary key,
	tenlop nvarchar(255),
	khoa int,
	nam int,
	hedt varchar(255),
	manganh int,
	siso varchar(255)
);

CREATE TABLE sinhvien (
	masv int primary key,
	hodem nvarchar(255),
	ten nvarchar(255),
	ngaysinh date,
	gioitinh BIT,
	noisinh nvarchar(255),
	malop varchar(255),
	FOREIGN KEY (malop) REFERENCES lop(malop)
);

create table ketqua (
	-- masv,mahp,diem
	masv int,
	mahp nvarchar(255),
	diem float,
	foreign key (masv) REFERENCES sinhvien(masv),
	foreign key (mahp) REFERENCES hocphan(mahp)
)


create table khoa (
	-- makhoa,tenkhoa,dienthoai
	makhoa nvarchar(255) primary key,
	tenkhoa nvarchar(255),
	dienthoai nvarchar(255)
)

create table nganh (
	-- manganh,tennganh,makhoa
	manganh int,
	tennganh nvarchar(255),
	makhoa nvarchar(255),
	foreign key (makhoa) references khoa(makhoa)
)

bulk insert khoa
from 'E:\CSV\dbms\CSV\DATA Quan Ly Sinh Vien\khoa.csv'
with (
	format = 'CSV',
	firstrow = 2,
	rowterminator = '0x0a'
);

bulk insert nganh
from 'E:\CSV\dbms\CSV\DATA Quan Ly Sinh Vien\nganh.csv'
with (
	format = 'CSV',
	firstrow = 2,
	rowterminator = '0x0a'
);


bulk insert hocphan
from 'E:\CSV\dbms\CSV\DATA Quan Ly Sinh Vien\hocphan.csv'
with (
	format = 'CSV',
	firstrow = 2,
	rowterminator = '0x0a'
);

bulk insert sinhvien
from 'E:\CSV\dbms\CSV\DATA Quan Ly Sinh Vien\sinhvien.csv'
with (
	format = 'CSV',
	firstrow = 2,
	rowterminator = '0x0a'
);

bulk insert lop
from 'E:\CSV\dbms\CSV\DATA Quan Ly Sinh Vien\lop.csv'
with (
	format = 'CSV',
	firstrow = 2,
	rowterminator = '0x0a'
);

bulk insert ketqua
from 'E:\CSV\dbms\CSV\DATA Quan Ly Sinh Vien\ketqua.csv'
with (
	format = 'CSV',
	firstrow = 2,
	rowterminator = '0x0a'
);

update lop 
set siso = NULL
where siso = 'null';

alter table lop alter column siso int;




----- Dạng 1:  ------'


---------------------------------------------------------



create login nhan_vien with password = 'nv001'

create user nguyen_van_a for login nhan_vien

execute as user = 'nguyen_van_a'

revert

grant select 
on sinhvien
to nguyen_van_a


select * from sinhvien