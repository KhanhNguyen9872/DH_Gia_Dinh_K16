-- 221402 - KhanhNguyen9872

use master;
ALTER DATABASE Nhom1 SET OFFLINE WITH ROLLBACK IMMEDIATE;
ALTER DATABASE Nhom1 SET ONLINE;

DROP DATABASE Nhom1;

create database Nhom1;
go
use Nhom1;
go

create table account (
	username nvarchar(50) primary key,
	password nvarchar(50) not null,
	sdt nchar(10) not null,
	email nvarchar(255) not null unique,
	lock bit not null
)

insert into account values 
	('root', 'root', '0123456789', 'root@localhost.com', 0)

CREATE TABLE LoaiMatHang(
	MaLoaiMH NVARCHAR(10) PRIMARY KEY,
	TenLoaiMH NVARCHAR(10),
	MaNhaCungCap int,

);
GO
CREATE TABLE NhaCungCap(
	MaNhaCungCap NVARCHAR(10) PRIMARY KEY,
	TenNhaCungCap NVARCHAR(10)
);
GO
CREATE TABLE MatHang(
	MaMH NVARCHAR(10) PRIMARY KEY,
	MaNhaCungCap NVARCHAR(10),
	MaLoaiMH NVARCHAR(10),
	TenMH NVARCHAR(50),
	FOREIGN KEY (MaLoaiMH) REFERENCES LoaiMatHang(MaLoaiMH),
	
);
GO
CREATE TABLE NhanVien(
	MaNV NVARCHAR(10) PRIMARY KEY,
	TenNV NVARCHAR(30),
	DiaChi NVARCHAR(50),
	SDT NVARCHAR(10),
	Email NVARCHAR(50)
);
GO
CREATE TABLE KhachHang(
	MaKH NVARCHAR(10) PRIMARY KEY,
	TenKH NVARCHAR(30),
	DiaCHi NVARCHAR(50),
	SDT NVARCHAR(10),
	Email NVARCHAR(50)
);
GO
CREATE TABLE DonDatHang(
	MaDH NVARCHAR(10) PRIMARY KEY,
	MaKH NVARCHAR(10),
	MaNV NVARCHAR(10),
	NgayDatHang DATE,
	NgayGiaoHang DATE,
	NoiNhan NVARCHAR(50)
	FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH),
	FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV)
);
GO
CREATE TABLE ChiTietDatHang(
	MaDH NVARCHAR(10),
	MaMH NVARCHAR(10),
	SoLuong INT
	FOREIGN KEY (MaDH) REFERENCES DonDatHang(MaDH),
    FOREIGN KEY (MaMH) REFERENCES MatHang(MaMH)
);
--Nhà cung cấp
GO
INSERT INTO NhaCungCap (MaNhaCungCap, TenNhaCungCap) VALUES (N'NCC001', N'Intel');
GO
INSERT INTO NhaCungCap (MaNhaCungCap, TenNhaCungCap) VALUES (N'NCC002', N'AMD');
GO
INSERT INTO NhaCungCap (MaNhaCungCap, TenNhaCungCap) VALUES (N'NCC003', N'KINGSTON');
GO
--Loại mặt hàng
INSERT INTO LoaiMatHang (MaLoaiMH, TenLoaiMH) VALUES (N'LMH001', N'CPU');
GO 
INSERT INTO LoaiMatHang (MaLoaiMH, TenLoaiMH) VALUES (N'LMH002', N'RAM');
GO
--Mặt Hàng
INSERT INTO MatHang (MaMH, MaNhaCungCap, MaLoaiMH, TenMH) VALUES (N'MH001', N'NCC001', N'LMH001', N'i5 10500k');
GO
INSERT INTO MatHang (MaMH, MaNhaCungCap, MaLoaiMH, TenMH) VALUES (N'MH002', N'NCC002',N'LMH001', N'R7 7780HS');
GO
INSERT INTO MatHang (MaMH, MaNhaCungCap, MaLoaiMH, TenMH) VALUES (N'MH003', N'NCC003',N'LMH002', N'Fury Beast Black 16GB 3200MHz DDR4');
GO
--Nhân viên
INSERT INTO NhanVien (MaNV, TenNV, DiaChi, SDT, Email) VALUES (N'NV001', N'Nguyễn Văn A', N'HCM', N'0123456789', N'a@gmail.com');
GO
INSERT INTO NhanVien (MaNV, TenNV, DiaChi, SDT, Email) VALUES (N'NV002', N'Nguyễn Văn B', N'Hà Nội', N'0324857691', N'b@gmail.com')
GO
--Khách hàng
INSERT INTO KhachHang (MaKH, TenKH, DiaCHi, SDT, Email) VALUES(N'KH001', N'Trần Văn E', N'HCM', N'0184758398', N'KH1@gmail.com');
GO
INSERT INTO KhachHang (MaKH, TenKH, DiaCHi, SDT, Email) VALUES(N'KH002', N'Trần Văn F', N'Hà Nội', N'0398575842',  N'KH2@gmail.com');
GO 
--Đơn đặt hàng
INSERT INTO DonDatHang (MaDH, MaKH, MaNV, NgayDatHang, NgayGiaoHang, NoiNhan) VALUES(N'DH001', N'KH001', N'NV001', '2024-06-27', '2024-07-01', N'HCM');
GO
INSERT INTO DonDatHang (MaDH, MaKH, MaNV, NgayDatHang, NgayGiaoHang, NoiNhan) VALUES(N'DH002', N'KH002', N'NV002', '2024-05-27', '2024-06-01', N'Hà Nội');
GO
--Chi tiết đặt hàng
INSERT INTO ChiTietDatHang (MaDH, MaMH, SoLuong) VALUES(N'DH001', N'MH001', 10);
GO
INSERT INTO ChiTietDatHang (MaDH, MaMH, SoLuong) VALUES(N'DH002', N'MH003', 10);



