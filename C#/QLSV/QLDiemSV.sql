CREATE DATABASE QLDiemSV
GO
USE QLDiemSV
GO
CREATE TABLE LOP
(
	MaLop int identity(1,1) primary key,
	TenLop nvarchar(30)
)
GO
CREATE TABLE SINHVIEN
(
	MaSV int identity (1,1) primary key,
	TenSV nvarchar(50),
	Phai nvarchar(6),
	SDT varchar(15),
	MaLop int foreign key (MaLop) references Lop(MaLop)
)
GO
CREATE TABLE MONHOC
(
	MaMH int identity(1,1) primary key,
	TenMH nvarchar(50),
	SoTC int,
	MoTa nvarchar(50)
)
GO
CREATE TABLE GIANGVIEN
(
	MaGV int identity (1,1) primary key,
	TenGV nvarchar(50),
	Phai nvarchar(6),
	SDT varchar(15),
	BangCap nvarchar(30)
)
GO
CREATE TABLE DIEMHP
(
	MaSV int,
	MaMH int,
	HocKy varchar(8),
	NamHoc nvarchar(10),
	Diem int,
	XepLoai nvarchar(15),
	MaGV int,
	primary key (MaSV,MaMH,HocKy,NamHoc),
	foreign key (MaGV) references GIANGVIEN(MaGV),
	foreign key (MaSV) references SINHVIEN(MaSV),
	foreign key (MaMH) references MONHOC(MaMH)
)
GO
CREATE TABLE DANGNHAP
(
	Id varchar(10) primary key,
	Pass varchar(15),
)
GO
INSERT INTO DANGNHAP VALUES ('admin','123')
GO
INSERT INTO DANGNHAP VALUES ('admin123','123')
GO
INSERT INTO DANGNHAP VALUES ('local','123')
GO

CREATE PROC USP_Login
@id varchar(10),
@password varchar(15)
AS
BEGIN
	SELECT * FROM DANGNHAP WHERE id = @id AND Pass = @password
END
GO